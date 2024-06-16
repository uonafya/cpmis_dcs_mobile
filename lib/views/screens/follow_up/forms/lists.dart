const serviceList = [
  {"title": "Please Select", "value": ""},
  {"title": "Supported to access clinical HIV service", "value": "SAHV"},
  {"title": "Supported to access general clinical service", "value": "SAHL"},
  {
    "title": "Admitted in residential institution (CCI or rescue home)",
    "value": "SPRS"
  },
  {
    "title": "Arrest of perpetrator of abuse or violence to child",
    "value": "SRPA"
  },
  {
    "title": "Assisted with economic activity (eg farming income generation)",
    "value": "SSEC"
  },
  {"title": "Basic advice on economic strengthening", "value": "SCBE"},
  {"title": "Bereavement counselling - basic", "value": "SCBB"},
  {"title": "Couples counselling (for caregivers) - basic", "value": "SCBC"},
  {"title": "Nutrition counseling - basic", "value": "SCBN"},
  {"title": "Psychosocial counseling - basic", "value": "SCBP"},
  {"title": "Spiritual counseling - basic", "value": "SCBS"},
  {
    "title": "Substance drug or alcohol abuse counseling - basic",
    "value": "SCBU"
  },
  {
    "title":
        "Parenting and positive discipline (for caregivers) counseling - basic",
    "value": "SPAR"
  },
  {"title": "ART adherence counseling - basic", "value": "STBA"},
  {
    "title": "Basic counseling on family planning (for caregivers)",
    "value": "SCBF"
  },
  {"title": "Basic counseling on HIV prevention", "value": "SCBH"},
  {"title": "Basic counseling on malaria prevention", "value": "SCBM"},
  {"title": "Basic counseling on other health issues", "value": "SCBO"},
  {"title": "Care and guardianship arrangements assessment", "value": "SSCR"},
  {
    "title": "Case conference with other service providers about the child",
    "value": "STCF"
  },
  {
    "title": "Child offender compulsory supervision and aftercare",
    "value": "SPCO"
  },
  {"title": "Child offender probation supervision meeting", "value": "SPRO"},
  {
    "title":
        "Child offender professional representation/advocacy/accompany to court",
    "value": "SRCO"
  },
  {
    "title": "Child protection risk assessment / investigation",
    "value": "SSCP"
  },
  {"title": "Declared free for adoption (adoption society)", "value": "SPAF"},
  {"title": "Economic or livelihood assessment", "value": "SSEL"},
  {"title": "Educational needs assessment", "value": "SSED"},
  {
    "title": "Enrolled in vocational training (incl lifeskills training)",
    "value": "SVEE"
  },
  {"title": "Facilitation of written promise from parents", "value": "SWPR"},
  {"title": "Family mediation or arbitration", "value": "SMED"},
  {"title": "Family supervision", "value": "SFSP"},
  {
    "title":
        "Family tracing - making contact with home or relatives (separated or institutionalized child)",
    "value": "SPHM"
  },
  {"title": "Formulation of individual treatment plan", "value": "SITP"},
  {"title": "Foster certificate renewal", "value": "SPFR"},
  {"title": "Health assessment", "value": "SSHL"},
  {"title": "HIV testing", "value": "STHV"},
  {"title": "Home repaired/renovated", "value": "SSRP"},
  {"title": "Home sprayed for mosquitoes", "value": "SSMS"},
  {
    "title": "Joint parental responsibility agreement facilitation",
    "value": "SJPA"
  },
  {"title": "Legal aid or support", "value": "SSLA"},
  {"title": "Legal protection assessment", "value": "SSLG"},
  {"title": "Measurement to assess nutritional status", "value": "STNT"},
  {
    "title":
        "Medical examination and or physical evidence collection of victim of abuse or violence",
    "value": "SMXM"
  },
  {
    "title": "Non-formal training education or life skills provided",
    "value": "STRB"
  },
  {"title": "Nutritional assessment", "value": "SSNT"},
  {"title": "PEP and PEP counseling", "value": "SPEP"},
  {
    "title": "Perpetrator of abuse/violence to child brought to court",
    "value": "SRPC"
  },
  {"title": "Placed for adoption", "value": "SPAD"},
  {"title": "Placed in community based foster care home", "value": "SPFC"},
  {"title": "Placed in emergency foster care", "value": "SPFE"},
  {"title": "Placed in foster care", "value": "SPFS"},
  {
    "title": "Placed in pre-adoption bonding with prospective parents",
    "value": "SPAB"
  },
  {
    "title": "Placed with family member (kinship/Kafaalah placement)",
    "value": "SPFM"
  },
  {"title": "Placed/enrolled in school", "value": "SSCE"},
  {
    "title": "Home environment adjustment assessment review/report",
    "value": "SPPM"
  },
  {"title": "Pre-placement family assessment", "value": "SPFA"},
  {"title": "Prevention (revocation) of a child marriage", "value": "SCMP"},
  {"title": "Professional assessment for potential abuse", "value": "SCPA"},
  {"title": "Professional counseling", "value": "SCPU"},
  {"title": "Basic counseling", "value": "SCPO"},
  {
    "title": "Professional counseling for child witness to crime",
    "value": "SCPW"
  },
  {"title": "Professional counseling for trauma", "value": "SCPT"},
  {
    "title": "Professional counseling for victim of abuse violence or rape",
    "value": "SCPV"
  },
  {"title": "Professional services for child with disability", "value": "SCPD"},
  {
    "title": "Provided with agricultural inputs - food security pack",
    "value": "SGFP"
  },
  {"title": "Provided with artificial food supplement", "value": "SGFS"},
  {"title": "Provided with cash transfer", "value": "SGCT"},
  {"title": "Provided with contraceptives", "value": "SCON"},
  {
    "title": "Provided with equipment or inputs for economic strengthening",
    "value": "SGIG"
  },
  {
    "title":
        "Provided with equipment to mitigate disability (eg wheelchair hearing aid etc)",
    "value": "STEM"
  },
  {"title": "Provided with food", "value": "SGFD"},
  {
    "title":
        "Provided with health care supplies (medicine health care appliance)",
    "value": "SGHL"
  },
  {"title": "Provided with mosquito net", "value": "SGMN"},
  {
    "title":
        "Provided with other basic need (eg clothes blanket bedding bicycle soap sanitary products etc)",
    "value": "SGBN"
  },
  {"title": "Provided with presidential school bursary", "value": "SPSB"},
  {"title": "Provided with school fees/bursary", "value": "SGSF"},
  {"title": "Provided with school supplies or books", "value": "SGSR"},
  {"title": "Provided with transport for repatriation", "value": "SGTR"},
  {"title": "Provided with transport to access a service", "value": "STRN"},
  {"title": "Psychosocial assessment", "value": "SSPS"},
  {"title": "Removed from child labour", "value": "SRCL"},
  {"title": "Rescue and cancellation of a child marriage", "value": "SCMC"},
];

const serviceProviderList = [
  {"title": "Please Select", "value": ""},
  {"title": "Charitable Children Institution", "value": "SPCC"},
  {"title": "Civil registration department", "value": "SPCR"},
  {"title": "Community-based organisation", "value": "SPCB"},
  {"title": "Faith-based organisation", "value": "SPFB"},
  {"title": "Immigration department", "value": "SPID"},
  {"title": "Judiciary", "value": "SPJD"},
  {"title": "Ministry of Education", "value": "SPME"},
  {"title": "Ministry of Health", "value": "SPMH"},
  {"title": "Non-governmental organisation", "value": "SPNG"},
  {"title": "DCS", "value": "SPDC"},
  {"title": "Probation", "value": "SPPB"},
  {"title": "Police", "value": "SPPL"},
  {"title": "Attorney General", "value": "SPAG"},
  {"title": "Office of the Director of Public Prosecution", "value": "SPOD"}
];

const caseCategoryList = [
  {"title": "Please Select", "value": ""},
  {"title": "Abandoned", "value": "CDIS"},
  {"title": "Abduction", "value": "CDSA"},
  {"title": "Child Affected by HIV/AIDS", "value": "CLAB"},
  {"title": "Child Delinquency", "value": "CORP"},
  {"title": "Child headed household", "value": "COSR"},
  {"title": "Child Labour", "value": "CTRF"},
  {"title": "Child Marriage", "value": "CCCM"},
  {"title": "Child of imprisoned parent(s)", "value": "SCCI"},
  {"title": "Child offender", "value": "CSAB"},
  {"title": "Child out of school", "value": "CSAD"},
  {"title": "Child pregnancy", "value": "CSHV"},
  {"title": "Child radicalization", "value": "CSDQ"},
  {"title": "Child truancy", "value": "CCCT"},
  {"title": "Child with disability", "value": "CSCL"},
  {"title": "Children / Persons on the streets", "value": "CCIP"},
  {"title": "Custody", "value": "CCCP"},
  {"title": "Defilement", "value": "CCDF"},
  {"title": "Disputed paternity", "value": "CSCT"},
  {"title": "Drug and Substance Abuse", "value": "CSDS"},
  {"title": "Emotional Abuse", "value": "CCEA"},
  {"title": "FGM", "value": "CSCS"},
  {"title": "Harmful cultural practice", "value": "CSCU"},
  {"title": "Incest", "value": "CSDF"},
  {"title": "Inheritance/Succession", "value": "CSDP"},
  {"title": "Internally displaced child", "value": "CFGM"},
  {"title": "Missing Child (Lost & Found)", "value": "CHCP"},
  {"title": "Neglect", "value": "CSIC"},
  {"title": "Orphaned Child", "value": "CIDC"},
  {"title": "Parental child abduction", "value": "CLFC"},
];

const specifyReferralList = [
  {"title": "Please Select", "value": ""},
  {"title": "Police", "value": "RDPL"},
  {"title": "ODPP", "value": "RDOD"},
  {"title": "Court/Kadhi", "value": "RDCT"},
  {"title": "Public health facility", "value": "RDPH"},
  {"title": "Private health facility", "value": "RDPV"},
  {"title": "Chief/Asst. Chief (Community leaders)", "value": "RDCL"},
  {"title": "Non-Governmental Organization (NGO)", "value": "RDNG"},
  {"title": "Statutory Institution (SI)", "value": "RMRH"},
  {"title": "Charitable Children's Institution (CCI)", "value": "RMCI"},
  {"title": "Civil registrar", "value": "RDCR"},
  {"title": "Sub-County Children Office", "value": "RDSC"},
  {"title": "County Children Office", "value": "RDCO"},
  {"title": "Voluntary children's officer (VCO)", "value": "RDVC"},
  {"title": "County administration office", "value": "RDCA"},
  {"title": "Subcounty administration office", "value": "RDSO"},
  {"title": "Ward administration office", "value": "RDWO"},
  {"title": "Education office", "value": "RDED"},
  {"title": "NHIF", "value": "RDNH"},
  {"title": "IOM", "value": "RDIO"},
  {"title": "Diplomatic Mission", "value": "RDDM"},
  {"title": "Private Health Insurance", "value": "RDPI"},
  {"title": "CTiP Secretariat", "value": "RDCS"}
];

const referralForList = [
  {"title": "Please Select", "value": ""},
  {"title": "Agricultural extension services", "value": "RMAX"},
  {"title": "Alternative family care placement service", "value": "RMAF"},
  {"title": "Arrest of perpetrator", "value": "RMPA"},
  {"title": "Case management", "value": "RMCS"},
  {"title": "Child care program", "value": "RMCC"},
  {"title": "Disability support services", "value": "RMDB"},
  {
    "title": "Economic strengthening program/project/savings and credit scheme",
    "value": "RMES"
  },
  {"title": "Enrolment in cash transfer or assistance scheme", "value": "RMCT"},
  {"title": "Enrolment in school", "value": "RMSK"},
  {"title": "Family planning (FP) services", "value": "RMFP"},
  {"title": "Family support services", "value": "RMFS"},
  {"title": "Further investigations", "value": "RMIV"},
  {"title": "Health insurance scheme", "value": "RMHS"},
  {
    "title": "HIV care and treatment services in health facility",
    "value": "RHHV"
  },
  {"title": "HIV testing", "value": "RMHT"},
  {"title": "Legal services", "value": "RMLG"},
  {"title": "Nutritional support program", "value": "RMNP"},
  {"title": "PEP in health facility", "value": "RMPP"},
  {"title": "Professional counselling", "value": "RMPC"},
  {
    "title":
        "Support services for independent living or child headed households (NGO)",
    "value": "RMCH"
  },
  {"title": "Temporary shelter", "value": "RMTS"},
  {"title": "Rescue from Harm", "value": "RMRS"},
  {"title": "Training or education program", "value": "RMTE"},
  {"title": "Victim support group", "value": "RMVG"},
  {"title": "Victim support unit", "value": "RMVS"},
  {"title": "Water and sanitation services", "value": "RMWT"},
  {"title": "Youth program (for graduating OVC)", "value": "RMYP"},
  {"title": "Prosecution", "value": "RMPR"},
  {"title": "Treatment and or Medical examination", "value": "RMTX"},
  {"title": "Renewal of committal orders", "value": "RMRO"},
  {"title": "Revocation of committal orders", "value": "RMRV"},
  {"title": "Safe House", "value": "RMSH"},
  {"title": "Repatriation", "value": "RMRE"},
  {"title": "Screening of VoT", "value": "RMSV"}
];
