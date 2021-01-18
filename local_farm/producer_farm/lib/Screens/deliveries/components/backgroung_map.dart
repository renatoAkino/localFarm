import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// /// Google Map in the background
// class CustomGoogleMap extends StatefulWidget {
//   RoutingController controller;
//   CustomGoogleMap({
//     Key key,
//     this.controller,
//   }) : super(key: key);

//   @override
//   _CustomGoogleMapState createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   GoogleMapController _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: GoogleMap(
//         onMapCreated: onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(-23.438620855027683, -46.53742358994361),
//         ),
//         mapType: MapType.normal,
//       ),
//     );
//   }

//   void onMapCreated(GoogleMapController ctlr) {
//     setState(() {
//       _mapController = ctlr;
//     });
//   }
// }
// // https://www.youtube.com/watch?v=opKKPMok1zc

//========================================================================
/// Google Map in the background
// class CustomGoogleMap extends StatelessWidget {
//   RoutingController controller;
//   CustomGoogleMap({
//     Key key,
//     this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       // child: Image.network('https://i.stack.imgur.com/YDVJI.png',
//       child: Image.network(
//           'https://blog.angelengineering.com/content/images/2020/01/Screen-Shot-2020-01-15-at-2.09.45-PM.png',
//           fit: BoxFit.cover),
//     );
//   }
// }
//========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class CustomGoogleMap extends StatelessWidget {
  RoutingController controller;
  CustomGoogleMap({
    Key key,
    this.controller,
  }) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(
        "skihH_wiMLgAPcAh@{Bd@qAf@aAb@o@\\a@f@e@h@a@n@[\\Mb@On@Kr@E^?d@Bb@Fd@J`@HhBd@jCn@lAXj@Hn@Dp@B`AChAG|AKn@?TBPBPHBDBFBDLJNDJ?JEHIDGDI@IBO@UAOCO?CBMBOFQDIFQDO@IBMBW?O?E@CA{@?s@@S?g@CwF@_@@K?IDCBCBG@G?IAGCGCCEAAKAG?[AkA?YA}A?e@AoAAuFCcC?WAmCAmCCaHAqBC_C?O?iA?KKaP?WCkCCu@Aa@?W?SEqFCuE?c@CwEAg@?_@Y@yABk@@mABuABa@?w@FuABw@BW@U?mCFu@H}ABmBDaDFq@@wDHmAB}EJiCDkCBi@AI?Q@Q@cCJk@@oGT{EFwCFcP^cAHaALs@L{@TiF~AiA^aBh@aR~FeF`BeDfAgJnCeDlAoFdBsDhAgGnBeHxBqBl@_@FcCd@_CNw@Bk@?qAGgBUqAWkA]aA]i@Uk@Ws@c@s@g@_Au@gA_AaBaBaFeF{ByB}@s@{@k@qAw@gBu@i@Oe@Mw@QaBY}CGuEJMIOCi@Sc@e@cC}Dg@}@Se@Ok@Ii@Gq@Ck@?o@B{@Ae@HiDFiBA_Af@aN?aB@qBKeCUeCMaAQkAk@_COYkAsDCI{@mBg@_Ae@w@eAqAs@s@gAy@WMaAe@eA]iAW{@I{BG}@DM@u@N{@Tw@\\mBhAeRtKwR~KaBdA}@\\s@Nw@Bu@@w@E{@Qc@OqAw@g@e@k@u@i@_Aa@}@a@oA[uAQiAK}@G_AC]mCwb@iBkZeAmMk@uEMgAs@gFuAkG{AqIgAyHq@qF[qEOwFCcI?aDA}AMaCAQOqB}@}EiA_EyCsJwA}E_AmEa@wDKmCAoBXuJ`Ak[By@NuEF_D@{CAsBQcNAm@GcEKyIEwDCgCC_BGgDEyAGmAKsAQyAO_A[wAc@_Bg@sAo@sAeA}A_AaAs@o@q@a@_Aa@}@Wu@OkAMuA@gALcKzAUDsF|@uKv@kHDqBCe@EqEU{Eq@wB_@cCe@uAYSCuA[qDmAiC_A{FmCqBeAy@m@]]yE{CmByAgA_AgCwB_CsBQOkEkDqC}AiCiAeBo@gBi@wBe@m@IoAMoAMqAGqAGy@EcJQaBCo@CcFK_CGy@CmADs@Aq@?s@@i@Bs@FyALeBJ_AAoAQ}Am@w@k@s@s@w@eAo@gAi@uAe@}A]oBo@wDKk@e@oBa@wAyAeDo@{AsAyC{BgEWOYq@oDuI{CaHuAoCaA}AqAoAwAgAmAg@_BYuDm@aBa@sAk@mA_AiAmAo@mAy@aBe@yAc@iA]qA_@iBYwA]kBg@eCe@mCg@gDq@}F}@cKmBiV}@eM[eDm@{H{Be[u@kMY{KAgHFeH@mABs@N_DR{CXqC^}Cp@eEhA{FzA_Ij@aD`AkGh@mEf@iE^wDXiDLeBNuBp@}Ir@gQv@iWR}FB}@FcDBeDG_EKsCQgCSkBYyB_@qBk@gCo@yBu@sBs@aBcAmBe@u@iAcBkD}EqB{CaA}A_BmCcB{CcBaDy@_BwBkEeAuBkCwGqBkFGOa@gAeBkFkBqG{@mDYyA[yBWsCSmDEcC?_B?u@BoBBqBHeEBqAD_BFiDLgGFeE`Ame@zAku@\\{Pt@m_@VoMHeEXaOHiETaLPuFZmHj@aKTqDv@uJRuBd@}EbAqI`Es]vAyLfCuWv@aJ\\}DxA{WVgHb@wQJwHFwPC_FAuDKoIMuI{@{XIeCgAaZm@cQGoAOaE]kIu@iS{@}Vk@sOa@iN[aNGcGGyG?[?q@Ak@AoEAiHDyHFkEJeIFaDTuJPuHj@yUvA_n@jAgf@HwCnCylAhAoc@b@iTp@kY\\oNhAqd@NwIRqND{PG{IIcKu@i[oBam@mGioBmAw^eAq[cGokBOoEiAyY_@mHeA{Py@mJa@aEg@iEg@gEm@wEcBuK{@aFw@qEY}@uBeKsA{FqBeIyBaI{D_MmD{J}C{HuAeDgCsFaCaF{HuNoIsMaCeD}EiGuAcBcGyGe@e@}EwEg@k@mC{CoAwAaGoG[]OMcJeGqBmA_C}AwEcEgGgF}GuGaFqFuDiE}AoBuC{DsC}De@s@a@o@iAgBgAeBiAqBaAcBu@uAeAmBeAuBsAoCuAwCwAaDeCcGsAmDuAuD}CeJiCyIqBwHaCsJcAmES{@YoA{A_HyA{Gg@}BqAcGiAmF_DiNoCyKoBcHwGiSsAwDA[gC{GkCsGyCkHq@kBi@gBo@kCe@gCsAsHm@qC]iAK_@Ys@Qc@S_@Sa@m@}@_@i@i@o@q@m@w@k@e@Yy@_@}@Wo@Mi@GyBG_C@mMNiGHo@EyDNsDTcDh@cGpBuG~CqO~Ku@h@mXbReEvB_DvAwGvAw@LI?EAGAIGKQMIKGGIIKGMe@uAk@{BoGwVnGvVj@zBP|ABV@L@LAXAVBXHRLLNBNRLVN^FVl@hCd@jBDd@B^Ff@?PETATBVFRHLNHL?LELMFQBM@OAMAOCKGq@H{@VcBTeAXu@fAyAdDaEzDoDfA{@T_@tHkFfJuG`RsMdAo@x@g@dAk@dAg@fAc@hAc@dBi@fAWhCe@tBW|AMxFM|BAv@AjB@h@Br@D`@DdARfAVr@R|@Tt@\\`Ad@hAp@n@d@f@`@h@f@`@^bAjAt@~@l@z@p@fAxAhCfBbD~AvCRNrEfJjCvFvA~CfBbErA~CvAvDrAnDx@~Bt@xB`BfFzA`FrA~Ez@`DxAbGdAnEhAjFnB|I|@`Ef@|B`BvHrAbG`@lBFVLf@n@vCnB`IXbATdAxApFjA|Dd@~AzAtEf@zAp@lBp@jBx@zB~@bCnBvEbA~B`AtBbAvBpAlChC`F~BbEjClEhAhBhAdBzAvBnAfBf@r@|@lAlH`J`FdFxEpEfAdAbGjFn@h@vD~Cd@b@|DnDrIjHdA`ArI|G|CrChGdGnGfHnF|Gx@`A`ChDlCxDjD|FtDnGvCzFbC~EfCvFrB~EbBhEzA`EfDvJzBlHzBfIpBfItB~I~AfIpBfLfBbLjAxIl@lFl@bGd@bFZbEb@dGZ~Eh@|KZhJ\\`KZ`Iv@dVpGfpB|@dXlEhtA`Cfu@zBzt@DfE@vL?|HGlJc@nTe@|Sm@|Vw@`[WbKa@tOy@t]WdKQnIuBd{@IrDaApd@aBno@_@jPGjCc@lRMpFIzFG`HCjDEpE?|L@xB@l@BrDDjCBjCDjBBhBFjCJnDV~IJlCPlFX|Hl@rPTvGPfEJvCNnERtFt@xSPlETnGVdHHbCRtEH`C@j@\\hINdFHfCHzDFxCD|BBjBB~BBrE@bB?pE?`DAjECrCEnEIvEOjGI`COtEOrDOtCQjDUbEa@zF_@tE_@zEi@rFo@lGy@nHw@fHs@fGg@dEy@tHi@rEm@hFg@tEUpBk@dG}@tKi@nHEbAa@vHYtHMbEc@bTUdKg@bUc@xVO`H[lPYtRc@zP[~OYfOi@|VGbDK`EEtBE|AEbBClAIhECfBCdBAx@?n@@`A@x@@z@DdANhCZvC`@hCZbB`@dBf@pBrAhE`B`FfAvCfFdMjEjJt@xAvAnCzAjClCnEtCnEvDlFxA~BfArBn@xAx@tBbAzD`@lBZjBVpBJjALlBHbB@t@FzCAxDEhDY|HSxH_@fMu@bP}@pMQ`CMvAi@zFUrB]pCcArHiAzGoCdNg@pCi@hDYnCUpCUpCOjCGvBGbD?lD@hHHxCNdGv@nMfCf[FpAd@fGtAjQrBvV|@fKh@dFf@fDh@xCd@rCr@rD~@nDj@dBd@|A|@|Ap@lAhApAZVv@l@zAj@lB`@tDn@lAVjAh@zA`AhApAv@pAvAlCfDdI|AtDDr@d@pA~@lClD`Jh@fBv@bCnBvGrBjGx@nBDHp@nAp@bAp@r@|@n@x@b@rAZvAH~@Ch@Ij@Ij@Ih@KdA@h@Ep@Cn@An@?n@@~AD~BDbHP`BB|BD|EJz@B|@Fz@F|@F|@J\\@x@NlCh@`Bd@|Al@pBz@pBhA~@l@fFpDrBnBxAnAh@d@hA`AlBxAdFfDNHbGdDnD|AdC`ApDjAjDz@XJxFfApDd@l@FvEVf@BlBBfF?lBETKvHg@lEo@lFy@~@OVExCe@jAOhAArALx@P`Bl@dAt@fA`Ah@l@d@t@f@z@`@bA`@bA^nATfARjAPpAJjA@\\@n@DzANfKDtC@x@DxEDjDDrCLrKFdEA~BEfCUnG{@bYIhCYnJ@fCLtC^nDv@zDnBpGrCfJz@~Cp@~CXnCHdAFnA@p@B|D@`AD`JLhEV|El@hFjA`I~CtPdAnGv@rGHhAx@bK|ArV|Cdf@HtAR|ALz@BNZzA`@lAb@`Al@`Al@r@f@f@jAx@t@V|@Tv@Hx@@x@It@O~@]fBeAbWkOjBgAhJiFlBiAt@[x@Up@KjAIxBFn@@\\B~@Vx@ZvBlAvApAbApAh@p@`@z@z@nBRn@t@bCt@xCVzA`@pDFxB?rBC|AElBQjEQlEOhDO~DIdBCtB?dGR~UNbUDlGGzSAtACbFGt@GfEMdDSxEWrEo@~ImAlO[|DcAvM]vCm@fCGf@_AfDc@bCCJOjAKjAIrAA`AA~@?`ABfAB`AJzE@x@A`AAdACfAGv@E`AGp@_@zECh@K|DK|AQxBKrAQtAYhB]pBeAxEe@rBgGzWeApEc@hByBrJ_D|Mm@fCgDnQiB|IuBlJUvAYjBW~BQxBIrBDrBTzB`@hDhAhIvA`JpBnPT`Ch@xEp@tGxBjS\\fEPxBRjDDjB?bCEjCKfDUnGKxCAzC?pBJfDRbDp@hKTxGPpH^v_@BrF@jD@dDDbNAr@?lCCbMKhMKzKQtHS~G[hGe@|Fs@~F_AhF[~Ac@dBs@~B{@dCy@rB}@lByAnCkBpC_BlBgAjAgAbAgChBgAl@oAp@iAb@oA`@eDr@eD^sGj@aAJy@J_Cn@_A\\aBt@_B`AiAz@oAlA}@~@oA`Bu@nAgAjBsAvC_A|Bs@rBm@~Bc@vB[rBWrCOnBOnC[rIkAv_@?bBDxADxA@bAAlAGpACVOtA[|BYxBQtBK`C}@~Yk@bROlEAXy@bWeCnz@ElAQzFM`GIhFMlFMfEk@pMOlEYjIQrFK|DCp@IbCw@nXUzHsArd@MpES`HQrEExAUvDe@rH[lGGtBWtGMhCIhAQjBUzA]pBQx@Ux@o@pBgBnFg@lAaF`Oo@dB_DdJsBlHa@zA]jAc@nBMv@Ov@SlBs@fJUbCa@vFW`DW|Cq@jIW~EQxEI|EOtJQpIGzCMxCObCGhAa@rEyC|^QtDWfFQjFEbDElH?|FBhD@vFA~@Cr@An@EpAKfCc@tJkArVWbHi@fL]tIc@jKcB~`@a@lJsCxq@wAj^sA~[ErAAxA?lABfABbAHjAJz@PtATjATbAVz@Vx@Zt@`@z@d@|@j@|@lCzDbCfD`DtE@@@@?@@@@@bCjD`A~Av@rBj@rBXlATpAHfA@t@?z@O`DA`A@v@Hx@Pv@Vp@\\h@d@^l@XpEjA|Bf@hANxBd@rCl@pEbAx@Vt@\\zAfAr@n@lAt@p@XD@jAR~@A~DUzAGdABbAF`@DnBXdAZdA`@h@Tj@XlD|Bp@f@lH`Fz@h@nAn@lFpDjGdEtDdChAp@j@Xl@Xh@Tf@TbBd@LHLTFLDD@?JBLENEH?HBbBb@~@\\rBbArBvApCbCVThA`ApB|AzAz@DBPJCVClA@jABz@BbAfAxQH`BTxD?HDl@@ZZ?NCr@Oz@[TKpAS`@I`@A`@@b@HpEnDJLl@l@TRNNLJPL`@Xl@\\hFjE`Av@b@X`@Nh@J^Dd@Aj@C`@O~@a@F?p@SNADDDDF@FAFGRDRN\\d@J\\DJBFJb@BTJv@Bp@?h@E`AIbASbBEd@A`@@ZDRLb@Pd@p@`BhElKr]d{@b@~@EBEN?H@PDJHFH?FCjDlI^hATz@N~@TlAP~@J^Ph@\\|@t@lBdBvEf@z@d@\\`@Zd@D^Ab@Oz@k@vCgCrBoAf@i@h@{A`@o@j@g@~@k@d@m@d@qA~@gCTUTEPCRFRNHNL^Jb@Nj@t@nDJ\\`@fBxEjSp@zAGHCJAN@LDJHDH@FEZbCHZn@vCzBpJV|@Tx@Rh@RZPZRTz@r@xArAj@p@d@v@f@z@^x@bBzDvDfI|CbHBDzDvIf@dAVl@Zd@Z^\\Rd@P`@FtDPfBDpGVn@@V@h@BfDPdGPdPl@~DLTDTH`@L`@RZHJFJL@JBLDJDFFDHBH?HAFCDGBCBGBKNOHGn@Kf@MRInA@`Oh@pRr@F?pPl@~CFrAHzBFz@DXBRDFDFFFLDV@LAL?PCNG^Or@Qj@KTWn@I^YrCCRK\\EFGFIBa@JKFIHGLER]jAGZCXCd@?d@Ej@E\\KXONUP]NYNQNMRETAV@XBv@A^CXGRMP_@b@MRKPGZCb@KrAIZST[ZGLQj@CTCb@A\\CXGROZSb@IVCZ?X@\\DZF^@TCTIVYt@CT?R@RFTLRJN`@ZTLf@Xr@Xz@P~IbApDl@bAL\\FPJFHJVNn@Hh@DVL^Vp@Pj@`CtEHNP\\ZZb@R`@JVP\\VLN^_AHELLJXPIHI??[m@OHINID_@~@FFJNHNXbARn@R`@NVJPNN^Xr@f@b@\\Z^T`@n@fAvApCjA~Bf@~@RXPPXRfAr@tBlAjF|CnF~CdAl@pAt@bDlBvC|AbCvAxBpA|BlAxP|Hr@\\n@R\\w@h@sBvAoG`AoDLYj@qAlBcD|AeD|@{BPg@\\{@JSLQPMRGb@I`@Gh@Av@?tA@h@?\\At@Gl@Ab@?vACd@Oh@SfCeAjB{@t@Sz@]p@Sl@Cb@BlAb@|@XZ?\\KfAaArAwAzAiCbDmGdAqBv@gApA{@lDyBz@i@aBoF_@oBCWIk@^U|DsEZYTMXMZEJ?P@d@JzBv@bNrEz@PD?x@LnGn@bFf@XB?F@J@HFHDDB@H?FCHGDO@IXBp@F`AFd@B~@Br@JfARtLzCj@Lf@Dj@B^@p@A`FKpXg@`AE`AErE[xD[n@ChA@zA@pi@|@z@Fx@Jz@RtUpGVFRD\\D`@?d@A`@Ef@Mf@Sf@YpC_CVSXOn@Yf@QbA]~Bw@l@_@j@i@d@m@b@q@Xo@Z}@Ty@nHe_@\\aBT}@Xs@Xi@Zg@^_@ZWb@Wh@Qf@Kl@CTArGSdDIr@Cn@Ep@Ix@O~@UxImCl@Mf@Gb@At@CpCBL?\\?H@TD^L|B~@pBjArAlAbAhAxCxDPRNLPF^FVAZGNKLGTYRg@Lc@Pk@Pa@NOLG\\SjBwAdAaAVYP_@BGb@s@^i@^]b@YBCh@]`BkA]_FCe@WiAS{@_@sAi@kBSmAEe@DEBI?KCICGGCG?GYOmAeBsYGcAC]GsAs@sKKuC@aFHiR@iE@YJwCJ_C?e@@o@Fk@Hu@@SFy@FaA\\aHHy@Dq@@Y@[@O?Q?KAG?OAECGCu@?E?UASAOA]AQAMAMAK@GAKCYAO?MBS@M?E@K?GAGCIIMCGGSEOAUEUE_ACmA?gABcAB{@F_AD[FWFWDOBABG@G?GCKBu@\\wBNaAHq@BWBe@Bi@@k@Ai@?o@EqB?c@?Y@U@Y@WFk@BOH_@DWFSJWVo@Zq@Xq@BCVo@LWLOFED@D?DABCDE@GBG?KAK@SD[Rm@Rs@FUFWF_@LcAP}@T{@AEb@JdAZh@Nl@Ph@Pb@L`@Tn@\\^Tj@`@LJt@x@f@d@Z^VVl@v@PXDSBGDKNe@L_@Ty@|AuFdCqJd@iBtAsF??r@kD|@qDz@{Cx@iC~@iBHQjH}MbByCbB}DtByDp@sAVa@HOFK^e@HKVUfA_AlAsALObBkAXQ|BuAb@Yn@e@LIhA{@fB{ArAgAvAsAxBmBVUVUzM{NROzAiBjCmCbDkDRS`B_BTS|@{@bBcBLKRW|EmEtAgBtAiBtAgBJMt@iAXY`AeAfAaAhAmAHMBDFDD@D?D?BABC@G@ICIAE\\UXM^MRGv@UxBk@LEFCDC@CBE?GHcBTeCHkA@kAC{@E}@q@aEe@gBI_@E]CkACw@IiEAw@B[@ODKf@u@^c@POPGXKtASx@IjDUpAK`@Ib@Mb@Wb@]f@u@P]Ne@dBeGfByFx@sBv@wBp@gCn@gC|A_Gn@aCp@oBdCaG~@_CZ_ATgAlBuI~AwEjBeEx@kCvAmGpBgF~CcI~CiGBEvEaItAaC~AuE^s@`@o@tAcBT_@Pa@z@mCfAeCDM?WGeD?_A@ODc@RFlAT?w@B_ABm@Bi@HuBBy@@_AAq@KyAEa@Os@YgBI{@@mABeADe@RaBnAgEv@wDNmAJuAH{AByACkBIcCYgEIyACqA@qA@mFA{@Au@CaA]aFy@iMkAsRq@yI[kESuBQwCQwB[yKu@_WIwOGeK?}@?e@Ag@Ck@E_A@_@JY@YGYCa@Cw@A{A?e@@g@FmA@e@?WA_@Ac@Ea@Gm@Gy@Iq@S{B[eCYkBWqAWiA_@cB]{A]_B_@uBQq@Sg@Ug@k@iA{@kBcCcFk@iAc@cAUi@Qo@Os@Ks@Ky@IoAKkCKaDSqGe@sNa@{K[}Ja@cMEiA]sJC[EkAAu@Au@Aw@B{D?uB?eA?oAEuAEmAGsAIy@OaBQqAUaBSuAoA}HKiABg@Ha@HGHMJ[@a@E[CIGOOOKa@[s@kAkDaAiEYkBUkBSsCKmDGmFAwAE_BIgAWwCOwAQgAUiAk@_Ce@cBs@yBwBoGgB_Gm@_Ci@oCYkBUcBYsCe@cG[mEa@mEc@eEYsB]wBa@qB]yAi@wBu@oCgCuImFkQ]uAk@aCEY?YDU@]E]IWMMMEKAK@OGKSIa@Mq@Uw@Uu@Yk@mCaJgCqIg@cBe@}Aa@cBa@kB_@sB]gCOcBM{AIsBIqBIyDK_GSgJHmBBsAB{@Bk@Fs@Fi@H_@NIJSBUAWESKMGuAKoBKyBIy@My@]}Ai@eC]uAi@{B_AeEg@qDu@kGM{@[qAUq@[m@e@m@OQYS]Oi@O[Gm@AsC@[I_Aa@_@s@Se@E[IYKUGo@?WBc@Fi@n@sJVuDDu@`@eGf@aHT}CFs@Hm@L_AN}@Ps@Nk@Xo@Xe@\\?ZKTYPc@Dg@?m@Ig@F]DQHMLGTCv@CXCJC\\I@C@C?C?w@?W?cA?sB?eA@YBSFUl@yBdAuD?W?OAOEMEMe@k@g@q@MQc@k@EESYCQCSAW?W?_@@YBSDSXiAHa@Lu@BYHy@@_@@g@@UDQFQHMTYvBoCT]bAoAZk@RNNSz@}AJQR[FMFODKBM@M?MAMAQGc@Gi@E_@E[Ok@CQC[AWAOAS?Q?i@@c@AWAa@Cc@Ca@Ga@Q_A?M@O@KDKFGZYRSNQRYRSXm@La@lAkCRc@~@uBRk@WWaD_DM]@Y@I@KAKAIEGEEEAc@k@Qc@I]w@sEKy@Ew@GeAA[AWA]W{DCQAk@BqCDqD?k@Ba@FcDAg@@i@BoAFoA@e@@_@DQD?DCBI@IAGCGECG@CSAKKcAAMEYAm@EuAAoBCcAKgB]cD]sDQoAY_BYwAEQa@mBQo@Qm@IYG]CM?ECUAQAIA[?[A[@s@As@As@A[Cg@EWEQFEDI@KAK??EIGEG?Cu@AgAGwBGcBGgAGi@E]Km@Og@Us@a@mAUo@Mk@Ia@UsAGa@Mm@K_@ESGe@Ea@WyBWcCGi@Km@Ie@Mm@Mk@]aBCMOs@]cBa@kBa@eB]uAa@wAkBmGq@_Cc@cBSy@Oe@o@cCIe@Kc@YmBGOEMOSKIOIUGOC]KgDy@yD}@}@[UEe@IIAa@IOESGUIOIk@UaAa@]Ok@WsAk@OEKAIEIGy@s@KEUUIGMOWUo@i@aBuAq@k@s@m@[]KKAAAEECCAE?A@A@GAO@IHELYt@a@dASd@EIEMIKkBmBs@u@]_@a@e@WUMMUMKGQIi@Sq@UKEaAYwA]WICACCKQGEEAGAMAQ@IAa@Gs@Mk@K}@U]I]GUAa@CG?E@IBc@Nq@LK@K@K@MDSDODOFSJYRWVGJGNEJGTKZE^W|AKj@IZQn@U^c@h@g@j@STUTYTYPSHOFUBS@WBGAUB[Aw@CmBImBEM@I@IBGBGDQN{AvAONqCnCg@f@_A~@i@`@y@`@UJYBIKGIKEKCKAKBMDIFGHGJELCNCXQj@ST_@VuA`@g@Pe@L_@LmAVmAXw@RQDg@Jy@JQ?K@]@W?aPEG?S?sDAuCAaOI]CYIGIKCMGOKKMIOEQEUCYCiC?Y@Q@]?]?YCc@C]Ey@IgHAoAA_@AWAWEUGSgC_Ic@qAm@mBKYm@kBGYESCWASGsAEsACe@A[EMCEEEEAM?QDGBOBK?E?EECCEGeA}CwDqLQi@Qq@G]Gc@Cc@CcAEuAC[?UCi@AQGwBGsB?ECg@Ce@Cu@A]?IEoAOoEEy@MqC@a@?AEaA?OEeAE{ACIAEG_@BI?KAICI@U@Q?SAg@Ao@AS?e@@a@Bc@B[N{BBe@BOBODMHOF?DEDGBKAKAGAECEECEACQAM@UBw@B}@Ds@HkAHYJSDABEBI@IAICKEEEQAUV{DXaEZgFBc@F{@BYN{BFaAf@_Ih@cIHg@Dk@BYB?DABABEBC@G?G?GCKCIGKEGKGE?E@EBCBCFAHi@PkBT[C}@HMBY@QB]AYE_@IAMCKGGGCCAE@GBCDCFQ?e@M{@We@MMAUCUGQGQGyA_@UKOGSESEw@SQEWEqDaAq@SeCo@iBg@_AQ[K?UCMGKGGKCK@KHGN{Bg@mCs@wAa@y@QOEo@Sa@IYIIEMEc@KMESEYC]Ia@QOE_@I{@SOGc@MOEc@Oc@Gk@OWIa@MuA]u@SOCwCu@w@S}@Us@UOEgCm@OGME_@MWGk@QUGQEo@OUEOCe@MeEgAe@Qg@MkAYC?_@MYIICSG[Ek@OYMKCa@Ks@Om@Qa@Mm@OSEOAKC}C{@KC_@OOEa@Ki@Oi@MSG{@Y]KQGGEGGKK?E?GAKCIEIGEGAG?E@GDc@x@ABSHQ@[@o@DgANi@Le@NUHqEzAq@No@NkAVuAXeAVa@L_@Na@Ro@\\k@X]Py@f@eAj@k@X[L[J[HOD_B\\aAJU@A?yAJcAVk@`@_@`@QTQZQ\\Wh@]n@QXY\\_@^_@X]Re@R]L[Lc@RyGfCw@?YKWSwA_Bo@g@CEgAiAwA}Au@iAKUc@{@GOSc@CIc@iA{@uBSi@Q_@M[_@cAGMAGCEeAiCYq@Wo@c@aAS[W]m@m@WSWSqB}@yAk@wAk@oAa@MAmCkAMMQMg@WGCG?EHEHGJ[\\]\\]d@URWRMJ_@TODOB[Fg@FS@MAwALoAN}@XSFoClAQFWHsBl@_@J]JcCt@uAf@g@Tg@XqEhCMHmBrACEACCAE?C@CBADAD?F?@GHMPg@\\kBtAsBdASFM@M?MGOCI?K@GBIFGHEJCFGPILGDKBG?K@GBKDQNULa@TMDYNaA\\_@L_@Lq@VKFa@Nc@L]JOIYIa@IIAME]IA?WIeJuC?KAICIEGECGAG@EDEFCHcMwDQE?G?GCGAEECE?C?EBCDCDgEgAOCAKCIEEECE?E@EDAHAFSCcHm@yBUu@EcA?uBF_@?I@?OE_BCiCC{@IqAA]Es@AoCEuEAcFEcHE{JGcK?a@My@Y{@Wc@DI@IBO@UAOCOEICGCCMKMCI?IBKHGHCFGTWRKDQBo@J}AJiAFaABq@Co@Ek@ImAYkCo@iBe@a@Ie@Kc@Ge@C_@?s@Do@Jc@N]Lo@Zi@`@g@d@]`@c@n@g@`Ae@pAi@zBQbAMfA");

    List<LatLng> polylineCoordinates = [];

    result.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });
    // print(result[0].latitude);

    var markers = <Marker>[
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-23.438620855027683, -46.53742358994361),
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/icons/placeholder.svg'),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-23.4285211719474, -46.54286454392993),
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/icons/placeholder.svg'),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-23.43576626864311, -46.546855686214364),
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/icons/placeholder.svg'),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-23.433442382820278, -46.52659998800095),
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/icons/placeholder.svg'),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-23.44981553925481, -46.527945117333864),
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/icons/placeholder.svg'),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-23.443458330786086, -46.52455385945282),
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/icons/placeholder.svg'),
        ),
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          //   child: Text('This is a map that is showing (51.5, -0.9).'),
          // ),
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(-23.438620855027683, -46.53742358994361),
                zoom: 14.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  // For example purposes. It is recommended to use
                  // TileProvider with a caching and retry strategy, like
                  // NetworkTileProvider or CachedNetworkTileProvider
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(markers: markers),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
