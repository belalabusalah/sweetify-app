


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sweetify_app/model/support_model.dart';

class SupportService {
  final String baseUrl = "https://tullana.toldpath.com/api";

  Future<SupportTicketModel?> createTicket({
    required String issue_type,
    required String description,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/customer/technical-support/create"),
        body: {"issue_type": issue_type, "description": description},
        headers: {
          "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5ZTVlMjEwZC0wOTgyLTRkZGUtOGY4ZS01NWE0MTAxNzRiMjMiLCJqdGkiOiI0OWUxYjAzZTJiOWZmMjRkNjFkMjNmOGE1N2NjZTM0YzUxM2MxM2ViYTVlZTNlMjRjOThhMDQ0ZjYzODk2MTAyZmYzYjAyZGM4ODMzMDFiYiIsImlhdCI6MTc3ODU3NTUwMC44ODE1MTgsIm5iZiI6MTc3ODU3NTUwMC44ODE1MjIsImV4cCI6MTgxMDExMTUwMC44NzMxOSwic3ViIjoiNjYiLCJzY29wZXMiOltdfQ.Ffx0y4PYOWAVePVB2p73tLWju0Fy_K6Ytky-G2YGRujkniHwu_mXL3FdSsfb04jb8UMsqwoSXFY2KtOqXSWvd8eQaoUMaP5BcdCAh1skeNrgWR4_2sz8fJh3TKg5g0SxJwUPfeh9pN7oZ-r2ii9xxP43t9vBPiDecF_dq6LmzhLPzqM-2f59XED-1JhDDwoEKyzx1rsHR8ew3KD30UTpPD7a4I84_tab8xSe45eOWYBh0bhXLl2FGWWd0F_b2S-qSJaJaWU3L5VblgajkdUUCRv-ZhZFYHUb_yrU1_JHaPsj8_TulA0Vi4Utnk_yWKDXUoMrRDzciiGhD8jsVOhpo2EB1yvUw-yrEvkaNs_CiP8o_nz49TjrNSdUOKOqFkaRhx15g_WzkPdmkmOAle63hSIs4eEGfBXWBtXTyKo6nNCYe7i_QcedJesPnIk1QvMwAPY_2FPeypAcIvKquH9MZg1p7sYaA43-gNoKfSERAkNDimPIi4AKXYULUOnvkyeksAnvIvwc2yTvU9tCO7061K4lQ3xMxLTny22PrmcK6-R9zZW3XJRNSWUt002wM-tahFziS8jsGuEN1AI_kUjeDVk46S68zKDpEkrnZzYh1QftTsVNAF818_PwIdcO-luJIJ0t_QZB2MEEpQj8SLuBbPyLtVbHbkL5UdI-MvhQZD0",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SupportTicketModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {

      return null;
    }
  }
}