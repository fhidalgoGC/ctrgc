import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_widget.dart' show SideNavWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavModel extends FlutterFlowModel<SideNavWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegionDashboard widget.
  bool mouseRegionDashboardHovered = false;
  // State field(s) for MouseRegionBuyers widget.
  bool mouseRegionBuyersHovered = false;
  // State field(s) for MouseRegionSellers widget.
  bool mouseRegionSellersHovered = false;
  // State field(s) for MouseRegionPurchaseContracts widget.
  bool mouseRegionPurchaseContractsHovered = false;
  // State field(s) for MouseRegionSaleContracts widget.
  bool mouseRegionSaleContractsHovered = false;
  // State field(s) for MouseRegionCloseSession widget.
  bool mouseRegionCloseSessionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
