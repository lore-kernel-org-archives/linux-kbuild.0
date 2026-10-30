Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394090;
	b=nkQ59BxDFv29pDArDLVkWmm0qcpgRQQ6bRFP7OUanhmWGFcVtZzQg882EFMMoD7wrShq
	 ZHehSszuus7Ro97qJxDp5XSqyKjS/+NHQAc+LkrZRnryEQ89VhxCpJbQ/sogMf9+4DpzQ
	 3mQXToBUVsn161SR5JSOX6ivnw0vSpQ0pZ5Upz+M6AFGsxgkf3ncpA71cllJF0uXsqlTR
	 TNKYJmur62yAJe3bNWig9UFwn0jumYNwxk0KvAjqBp6Yoe+n1bBnn8pzUePSwLrED1in2
	 CRFUMP+lP+lr5/8LOqiRbawNGp3WYM3gG8UKQQWbk9JL6+YiKAmiWkEgVnzot9GbIvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394090;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:CC:
	 X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lboqsmIAlA3b6834pdw231iO/gtmIEQpprll671Abto=;
	b=1hkp/i0TQHzuenosePFf03sIO06vUGEVmVxBZ/JGjVln9RA6FwJgotDqxOyWZezYLfmO
	 dFNP2U5JVnE13YjDggAH4MowUD9Wg67fkN3PMVouAUwFMXZ7WQqhhTDwOWrR88zJ5bUVv
	 tyFTOC8DgY8p4lXeNPHdEwqE28TIdPKWzlgBeaFNg8K/LHxVXgKBFrYyc6BZLTcLH1ikv
	 +b27GhtDhh02ubu57LBSwa8j9zxlQhV/I4xxebL0Xsl1UAhZpqimGyZml7ZvVBJSo5by1
	 WjL3Yb4iWRmDPrrOZtvSwYpcgXePTHUKr0IJCOvBsxJf431V9jItekEnBwWrPDicuTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=F1BpP7XM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9914606A323;
	Fri, 30 Oct 2026 21:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9914606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=F1BpP7XM
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UKCeCE1185069;
	Fri, 30 Oct 2026 21:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=lb
	oqsmIAlA3b6834pdw231iO/gtmIEQpprll671Abto=; b=F1BpP7XMn3JyzLLBSy
	A2bhPcPc2pGHPIAbRbJ47QfG5zjYSexoucE+7GyoRxJiqg+LRverAmGS7hgt4LN0
	kwnZytAszmf7yz5R9ItwVahqKg8WBEtrdGxrItaa6/3TSB9DjXV9j+mHAgoDxceG
	Y1vRVGnuz7qQFU6iNFDEV5+Ii9JykM12vOJd4SJAHX41GWbBnOar/ddNpTxYRUJs
	HAh0oCrRSm/qbtAIp/LuOlIIse12dk83bhwmMctxTUCxaL8MJoFX7qnjvskLxupm
	qIQjHZ3eldck6EEwYFKre68dy2Att33tBLnmPtWpvm98uQ6AWx1z7eHdWUpnszzN
	XpFg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hn22wgds6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:58 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 6476E8014E0;
	Fri, 30 Oct 2026 21:00:57 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:54 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:54 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooeA8bST/zkbu6iRjqO0FDf7uyBPm89ouBWKjECMgcuXDRaC/E2+2ywAhJqiBycBTKKF8rfaoTlAesJi+Cbx3FJ7SkYE/tSW8+r81QMcoZGVyQUANYWObiDFCrjVeRo/mK9vuF+cn4UVi03b4t+X9YoORdbzpG2vBHwE+VhgTEsCYnGkuClS/To+8JN6bKsN51G2Pj/VNJDT4PsrTudoUikM6vu7zu5iDfCfMl34tu4XSnyM75bm6nK4EDMjh1ErObjxvfb89C3GUQzeWe0DVX44HwX67wzNnU0+Pxma5rRRrEPQa+XtjeUE83Zce4/j8H9bz623hbO3HeKTtj9Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lboqsmIAlA3b6834pdw231iO/gtmIEQpprll671Abto=;
 b=PGkzus4qjNHRJGSnAl5JHTozqMXYJ4ntWo9mX7J80JE2q6qfYqXtw1gmY7XJHHXNuHraxA8WNyaSw7CZfe4HnVHk0k0JaFYd88zcpCxmHdv2kZP/HxPziyyFJ9aGoSt88/nhCiTLkMIUiDBSP8MPZsTisGVptplIyAc+sk7yzRxcYgWmRodWELx7S7TDiA/l7PmbE/aVBiruwi0Q8Bo2AHDK7NZyYzwLq6j/IODjjR9bWE4PQvYrhr9y3h5Kpm4ZntF+YcFZfSw6fVv8KyyHHwKNF9zuGNQJeFHMSwN5dNFwf2Z53IvL0thVYyswLnKphrIco/UXXxS0/T2BqLJkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:46 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:46 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:10 -0700
Subject: [PATCH 14/23] net: hpe: sl: add the sysfs interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-14-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
To: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>, Doug Ledford <doug.ledford@hpe.com>,
        "Sandeep
 Bhoot" <sandeep.bhoot@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 (2603:10b6:8:225::20)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|IA4PR84MB951192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e823927-571f-421e-7251-08df36c8dd6a
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022075727099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VhY4kdjMfYOKEs/uXM8zGHYP5aCumkRy4AdG79BMDoZfoNxiDBje0tTK2zEzMSrbkSpXFszlqQ13HvmEV/NqMxQvKMgfuxWKthBdVwIH7rYp8qFcQlTdoUwWXxWyAJIvXxV5OlglCy5j6gpojn422vN73O8sX29tQjPH+y1SSKAJFZtVMm2YIiuhnAy/ZBXX+SJq69SOIb3est2+EwSFRS6HqmOcABMWK4S5fOd5dF3olQ9eMCsj2m1lHbsjlpMDZHeSsOkYNPI7G85+2Yc900SVDkRn2SM3MePw6sKMyXFoAclObPdddgL3ex4PBRHodnzp11aA49dghGN+06JtpDdVMp1v+XM2IYbLpvYMeuj+njl4GM/BFCHt3BMfCAqBsRE0dUsYnK6uM6mGREiXI6UB14CC6aIPf9L3eAH1FvgaYT0KtpH9CcO0vnQTRx//5+yYr++tsVuGP5haBXmiQoPaD0UGS3/LIi2sqxCFsCnakSBRP2oVQJhNI9N/0FlY381wIGN0aIBLeyi5ebuk4mxS7ZNv/XSdCUwz62qx/bekVDBL+UwSoWt2qTEaGH+lGWX1mBy1hHbQG6HGLa3q/V87ATB3fT2rYJDEGjFhrB6mGa2h6GZvxvFP4Y4jX6FOl9brduTi3ZE8wuN2+LLbl1dAnIf3fy+2zqlmVfDfWPkblaWiUbg4rOmTpttTn43S/xiJUB/qVpDHM5iDtNDMHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z002WHZTOGJ1U3BmRTlEbkRzZklYN2xXL2hXM1l5SHRVT3RlazhwcGdDSjNn?=
 =?utf-8?B?RjhiZG12OU90QWo1RTNaT2RHNzUvZDhGUlErb3FzK0NFNGNqR015a3lwSkxa?=
 =?utf-8?B?K28zOWI2bmE4SGErY0RJOGM4Z05LdFdlREtHcDV1UkpTNGxQVkg1RCtqdVg3?=
 =?utf-8?B?RWc2eEdRdm9FMWZvRjQ3Wkh1SnBpRUl5YWxkYVg5MzAwQm02czBrOU1lTXdD?=
 =?utf-8?B?ZUo2Q1RtZzhEaTFtY3FZUzRKQThGTWhPUlc5ODBTZERZRmhrd2NTSE53K3NB?=
 =?utf-8?B?ejFKQUFZZEc3Y1VaU3lQejlNeGdhbmx1cmxxNkJpdzB3dnE4L3BNdFhtYkgr?=
 =?utf-8?B?TkNnT1NMK2FGL1hXc0wxN21oaHlWRUEwK25oWmJrMWs3ZVhvb25BY1VLeEpK?=
 =?utf-8?B?cWFDWjhoTFZGU284eDZBOUFEMGlUeUprU2g2ZmF5VDJjcVd3Z1NYT2ZMenFp?=
 =?utf-8?B?Y0owUVBnQXN2UG1SbkxRY05lS2E3VVhLaW9DdEJVK2lpQzhBcDhpQmZOUVU3?=
 =?utf-8?B?T1lKblU0aTNJQ3cyRE9SeWRXclJScGQybG1UeFo2MDgraWlRWm9vQnFNb3NO?=
 =?utf-8?B?dzNlSkxhMTFKS2pad0FzYTJ3RWxGc0hjYjA5YWJDbkFXc1ZmcG80US9XK1oz?=
 =?utf-8?B?NnpYZDdRRVF6Q21yTWFibzV1byswZUM0OFplQUI1aFh0NDR1RnM2NGorOTdQ?=
 =?utf-8?B?aEk3SFgyNmR5SE5mUi9hVDRqOGhuTW81RUxFN1BLQnVTSWFETHYvWmd2bzBF?=
 =?utf-8?B?NkV3S3lSd256WCtGdEhrOW10d3JoRENsNzlTYjlmc01VV1pqMTFKb25XYWVw?=
 =?utf-8?B?TW5rQmkrNk9qa1Bpdk9lVkFLLzE5dlR1VFc2VFJmQXJudVRzRFg4Y1BpalFM?=
 =?utf-8?B?OGloL1dndGgwTWhrNDk2OHZDbTgrdnpHZmI1U1J4RXlOMERrMjAwZnhVWXk1?=
 =?utf-8?B?MVgvd2Zyc0d0bEEwSFNkb1UrTHVJZWhTZnFXZmE5emVqM0JOcE52T3dhNUNm?=
 =?utf-8?B?dzVsUDdMbmdsT3hMcEhQSXp2eldycEdHZVovTzVqUnRlRnJWYkVTRjhHVnBX?=
 =?utf-8?B?SkFnYTVCdVI4NG15QkNjUER0QnJmRndiamNpdEt4RTNnNVp0SFRGNkYzV2ll?=
 =?utf-8?B?Zk15RVVyRS9pS3pqVHlpMFNoSDVHYkF2M2FMU3FlYzRQbG45Vk01YVhOSWpn?=
 =?utf-8?B?ZGN5UitvZzFkRWplUSsyWjg4NmxuUmlxUVRtSkRtZk5HblQ3WDF5amZRM0w0?=
 =?utf-8?B?TG5LdFVkVkwwaGdBQW9KZ3NTV3ZTTHNMUGhSYTdydWE3K2tJMTFvUWwxaFBK?=
 =?utf-8?B?MmZyQlNDUS9IUkViclRNejdaS3h5SS9ROVN3aUZMbFVmR2dwV3FneHA3Q3pT?=
 =?utf-8?B?d0dMSXZsc2x4M2VHZURyWFZaWXlJRUQzTTZCK0ZtTGJkT0NGL3RKR3NQR01W?=
 =?utf-8?B?eDE0VTltQWJ6cHN4ejB1bGx1VDg5YzJDbDVIcmRkQXhtWjVJZ2xZV09qSFlv?=
 =?utf-8?B?NG1BdW9aeUhuWnNObEtZU3drQllTaG5GQjF0c3NRU0Y0RzY4am1OMDVwKzFO?=
 =?utf-8?B?a3BMQVYxUmRaZ2xpMmpBZm91MFR2ZFpjaFFMaTJud3l5KzVHUDNtVXE2RkFt?=
 =?utf-8?B?N3VNUC8yRklUbVRvT09SaU9XNjE5VEVhTXZpZ05LQlkvVncvU1ZqRTZjV0lX?=
 =?utf-8?B?SDNwelpOMC9rdUpFVjRnNklRNmxvYTVoNUxDeUpYTXd1Q1VFSi8yc3ZvTGVP?=
 =?utf-8?B?dUlMNEU4ZG4yQVkwbFhZMXRpYmJIMEFZcGFWczQzNFYxcmlHN1oyOTBZYXB5?=
 =?utf-8?B?TEowcVEzTHJEU1NhcHdkSkhRT3ExWnI4YjhPK1BMa2xZS3BWbXd5THBBWWU0?=
 =?utf-8?B?ZkdrYURYVkZkRHJKWlNSMVZnYlpqY21JSU95YVkxTVlXdlNVRjdzK2dyQTFJ?=
 =?utf-8?B?cXFqb0lFd0o0aFZmMVJKM2ZPSGNCZWhuYm10dlFhZnBabVNtMmhHck5SWHBJ?=
 =?utf-8?B?b0tXbzBUZ2lxNDQzMXBhcmJNVk14WDJKVmZPdm1xTEd0Y1hUQmhmdHdOZVpQ?=
 =?utf-8?B?aUo2bk1JcGwrWnVJYlpkUE9hN0htR0hSNWpqVDZZTUhuUkJwQitHV2JFR29a?=
 =?utf-8?B?RldYalFZZUd6VGw5QUVnclQ4UTY3N2piWXFNMHY4bkh4YkNFZmpDY29uWit4?=
 =?utf-8?B?R2xpa0dGaVNPYzNJT1JURk1YWk0zc21xNmhRRXRZdHoreDFWSVZuZGgrL1d3?=
 =?utf-8?B?Y09JcU81cDhLcWxtaUttNExqUVRUc3lHWDdIejFDbVdlQ2txb2k5ZnNWTDY4?=
 =?utf-8?B?N3Z1dHYvaUR4R3Z6R0Z1M1R0VDBEWWk1WENqU1hUcnAxeE8zZElFdz09?=
X-Exchange-RoutingPolicyChecked: natfP04c+MXDBX8QmkWAVzY6bYiBNYSHjcNcG/mmcTHw30hQfzK+E+qylPHe2ekqsfpKxTLuxJ54XgSZVHFeOSRztMl1R5kaoNod9FD77XxABgVAeX94xQHi39h2KFMWNkUagPwjcOw3li9WvLuurprlA7ZrOsVMaeXWpGAUdLw3MojGlbnV6SYxh3q26QseoSDrU1z4A+mUfXvlohXDCi47lK0iswm1HdW5OHK+XXyviohTBjgg4yTX25XcVJETJq/Oa2rQ991lpGfjb5ip7cnlReRHOEhWpef/UX1Yw521ntdqWxWoJmG8HxiwoggCl/74S2Yr5cM1yNUppI+eqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e823927-571f-421e-7251-08df36c8dd6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:46.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uATsWLPV7zDVw+GdFOrcbkKxvdAGVvgz9lgEAC0Ugg8tjIg7v4dDhNY5XZy9a62WntbTvoHQ6mDWf98qb2KxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXysfFTSMivWPH
 n+dI+HcQxmyiKTsl2YOUYi/ExdrGflQzyilJsftvjziWHZye/u1Kl5eM2u+TzEr4zRfbVeRy7tG
 PvocUKP1fZl84EGl817tEM3t/BIMMIM=
X-Proofpoint-GUID: 8aO4huqfHgT71_ZVZFYvKvcPXLZxQpr7
X-Proofpoint-ORIG-GUID: 8aO4huqfHgT71_ZVZFYvKvcPXLZxQpr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX6JstFzTntFOc
 XsSmxDZolnvrK7FLnJVcM0h19wgz03adtL4X1UP2ikqyQS2BtQUjD5hAKi9z0Hd0BrCZwF/Nm2s
 chOdNmCFEclPWBIMs4HHT/SniZhX349MovrHEPP1XxgdAn0sC1LJJPTvLA+qpmV8PSYLQDh7+hP
 w0SZcfXW+RYKyoVoC5YagLaWrGOEfTTEl2G/W5nUDJXR/gXrR+OyC0/WMUA+7x/Ka2SxaWEYpNU
 MUS09rSBSE0U0BnMmC5g678RNfP3bn7Cj47KxOGAE/wvaohwViQrRXuO7yIzjpjK5ZpNzkqCE2B
 3SMNAbjjGsnPPuCSftRJUmr5Eqr4QDBkLlO/A+Q/YnyW8sLQKjjQAZzDSoGBECLdMF7mCvUIWt+
 Oczko/daWqd1UHa68psUxm25FwHeK/IvGX6XUndIM+UCa4NRtNVNULOifeuUBGbfbczaPJj8e+Q
 u8crxT2oljYbQczSw0A==
X-Authority-Analysis: v=2.4 cv=JfUpPkKV c=1 sm=1 tr=0 ts=6ae5058a cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=6XKncaru_qjgLvANlS_8:22 a=MvuuwTCpAAAA:8 a=Z7PFGMq4_24wirIJ3j0A:9
 a=zul3UiU5sbC5z5GV:21 a=QEXdDO2ut3YA:10
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300083

Add the sysfs interface for logical devices, link groups, links, LLR,
MAC, media, SerDes, SBus and PMI.  The many small files follow the
one-attribute-per-file sysfs rule.

Known open issue (Sashiko L14, V2): the SL sysfs tree (about 378
attributes) has no Documentation/ABI entries yet. The attribute
documentation, including which attributes are stable interfaces and
which belong in debugfs, is being prepared with the hardware engineers
and will be part of V2.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (586), CONST_STRUCT (60), LONG_LINE_STRING (20)
- CHECK: UNNECESSARY_PARENTHESES (63), BRACES (1)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_ldev.c  |  410 ++++++
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp.c  |   98 ++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_config.c   |  438 ++++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_policy.c   |   53 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link.c  |  830 +++++++++++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_link_caps.c |  303 ++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_config.c   |  388 +++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_counters.c | 1498 ++++++++++++++++++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_degrade.c  |  336 +++++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec.c  |  148 ++
 .../hpe/sl/sysfs/sl_sysfs_link_fec_current.c       |  336 +++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_down.c |  316 +++++
 .../hpe/sl/sysfs/sl_sysfs_link_fec_mon_check.c     |  195 +++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up.c   |  299 ++++
 .../hpe/sl/sysfs/sl_sysfs_link_fec_up_check.c      |  137 ++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_pml_rec.c  |  193 +++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_policy.c   |  261 ++++
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr.c   |  221 +++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_config.c    |  140 ++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_counters.c  |  397 ++++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_loop_time.c |  221 +++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_policy.c    |   74 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac.c   |  192 +++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_mac_counters.c  |  339 +++++
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media.c | 1274 +++++++++++++++++
 .../hpe/sl/sysfs/sl_sysfs_media_counters.c         |  599 ++++++++
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi.c   |   80 ++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_rd.c    |  197 +++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_wr.c    |  220 +++
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus.c  |   89 ++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi.c  |   80 ++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_rd.c   |  244 ++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_wr.c   |  244 ++++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rd.c   |  197 +++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rst.c  |  105 ++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_wr.c   |  197 +++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes.c    |  302 ++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_eye.c    |  197 +++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_lol.c    |  141 ++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_los.c    |  142 ++
 .../hpe/sl/sysfs/sl_sysfs_serdes_settings.c        |  506 +++++++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_state.c  |  121 ++
 .../hpe/sl/sysfs/sl_sysfs_serdes_swizzle.c         |  126 ++
 43 files changed, 12884 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_ldev.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_ldev.c
new file mode 100644
index 000000000000..9aac5aa41404
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_ldev.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl.h"
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_module.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static const char *sl_cable_type_str(u32 type)
+{
+	switch (type) {
+	case SL_CABLE_TYPE_PEC:
+		return "PEC";
+	case SL_CABLE_TYPE_AOC:
+		return "AOC";
+	case SL_CABLE_TYPE_POC:
+		return "POC";
+	case SL_CABLE_TYPE_AEC:
+		return "AEC";
+	default:
+		return "unknown";
+	}
+}
+
+static ssize_t mod_ver_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_ldev *ctrl_ldev;
+
+	ctrl_ldev = container_of(kobj, struct sl_ctrl_ldev, sl_info_kobj);
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+		   "mod ver show (ldev = 0x%p, ver = v%s)", ctrl_ldev, sl_version_str_get());
+
+	return sysfs_emit(buf, "v%s\n", sl_version_str_get());
+}
+
+static ssize_t mod_hash_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_ldev *ctrl_ldev;
+
+	ctrl_ldev = container_of(kobj, struct sl_ctrl_ldev, sl_info_kobj);
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+		   "mod hash show (ldev = 0x%p, hash = %s)", ctrl_ldev, sl_git_hash_str_get());
+
+	return sysfs_emit(buf, "%s\n", sl_git_hash_str_get());
+}
+
+static struct kobj_attribute mod_ver  = __ATTR_RO(mod_ver);
+static struct kobj_attribute mod_hash = __ATTR_RO(mod_hash);
+
+static struct attribute *ldev_attrs[] = {
+	&mod_ver.attr,
+	&mod_hash.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ldev);
+
+static struct kobj_type sl_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = ldev_groups,
+};
+
+static struct attribute *supported_cables_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(supported_cables);
+
+static struct kobj_type supported_cables_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = supported_cables_groups,
+};
+
+static struct attribute *cable_types_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(cable_types);
+
+static struct kobj_type cable_types_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = cable_types_groups,
+};
+
+static struct attribute *cable_vendors_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(cable_vendors);
+
+static struct kobj_type cable_vendors_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = cable_vendors_groups,
+};
+
+static ssize_t length_cm_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_ldev_cable_hpe_pn_kobj *hpe_pn_kobj;
+
+	hpe_pn_kobj = container_of(kobj, struct sl_ctrl_ldev_cable_hpe_pn_kobj, kobj);
+
+	sl_log_dbg(hpe_pn_kobj->ctrl_ldev, LOG_BLOCK, LOG_NAME,
+		   "length_cm show (ctrl_ldev = 0x%p, length_cm = %u)",
+		   hpe_pn_kobj->ctrl_ldev, cable_db[hpe_pn_kobj->cable_idx].length_cm);
+
+	return sysfs_emit(buf, "%u\n", cable_db[hpe_pn_kobj->cable_idx].length_cm);
+}
+
+static ssize_t max_speed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_ldev_cable_hpe_pn_kobj *hpe_pn_kobj;
+
+	hpe_pn_kobj = container_of(kobj, struct sl_ctrl_ldev_cable_hpe_pn_kobj, kobj);
+
+	sl_log_dbg(hpe_pn_kobj->ctrl_ldev, LOG_BLOCK, LOG_NAME,
+		   "max_speed show (ctrl_ldev = 0x%p, max_speed = %s)",
+		   hpe_pn_kobj->ctrl_ldev, sl_media_speed_str(cable_db[hpe_pn_kobj->cable_idx].max_speed));
+
+	return sysfs_emit(buf, "%s\n", sl_media_speed_str(cable_db[hpe_pn_kobj->cable_idx].max_speed));
+}
+
+static struct kobj_attribute cable_hpe_pn_length_cm = __ATTR_RO(length_cm);
+static struct kobj_attribute cable_hpe_pn_max_speed = __ATTR_RO(max_speed);
+
+static struct attribute *cable_hpe_pn_attrs[] = {
+	&cable_hpe_pn_length_cm.attr,
+	&cable_hpe_pn_max_speed.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(cable_hpe_pn);
+
+static struct kobj_type cable_hpe_pns_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = cable_hpe_pn_groups,
+};
+
+static void sl_sysfs_cable_types_delete(struct sl_ctrl_ldev *ctrl_ldev, int type_idx)
+{
+	int k;
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "types delete");
+
+	for (k = 0; k < type_idx; ++k) {
+		sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "types delete (type = %d)", k);
+		kobject_put(&ctrl_ldev->cable_types_kobj[k]);
+	}
+}
+
+static int sl_sysfs_cable_types_create(struct sl_ctrl_ldev *ctrl_ldev)
+{
+	int type_idx;
+	int rtn;
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "types create");
+
+	for (type_idx = 0; type_idx < SL_CABLE_TYPES_NUM; ++type_idx) {
+		sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "types create (type = %d)", type_idx);
+		rtn = kobject_init_and_add(&ctrl_ldev->cable_types_kobj[type_idx],
+					   &cable_types_info, &ctrl_ldev->supported_cables_kobj,
+					   sl_cable_type_str(type_idx));
+		if (rtn) {
+			sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+				   "types create failed (type = %d) [%d]", type_idx, rtn);
+			kobject_put(&ctrl_ldev->cable_types_kobj[type_idx]);
+			sl_sysfs_cable_types_delete(ctrl_ldev, type_idx);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static void sl_sysfs_cable_vendors_delete(struct sl_ctrl_ldev *ctrl_ldev, int type_idx, int vendor_idx)
+{
+	int k;
+	int l;
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "vendors delete");
+
+	for (k = 0; k < type_idx; ++k) {
+		for (l = 0; l < vendor_idx; ++l) {
+			sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+				   "vendors delete (type = %d, vendor = %d)", k, l);
+			kobject_put(&ctrl_ldev->cable_vendors_kobj[k][l]);
+		}
+	}
+}
+
+static int sl_sysfs_cable_vendors_create(struct sl_ctrl_ldev *ctrl_ldev)
+{
+	int type_idx;
+	int vendor_idx;
+	int rtn;
+	int x;
+
+	BUILD_BUG_ON((SL_MEDIA_VENDOR_AMPHENOL > 10) || (SL_CABLE_VENDORS_NUM > 10));
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "vendors create");
+
+	for (type_idx = 0; type_idx < SL_CABLE_TYPES_NUM; ++type_idx) {
+		for (vendor_idx = 0; vendor_idx < SL_CABLE_VENDORS_NUM; ++vendor_idx) {
+			sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+				   "vendors create (type = %d, vendor = %d)", type_idx, vendor_idx);
+			rtn = kobject_init_and_add(&ctrl_ldev->cable_vendors_kobj[type_idx][vendor_idx],
+						   &cable_vendors_info, &ctrl_ldev->cable_types_kobj[type_idx],
+						   sl_media_vendor_str(vendor_idx + SL_MEDIA_VENDOR_TE));
+			if (rtn) {
+				sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+					   "vendors create failed (type = %d, vendor = %d) [%d]",
+					   type_idx, vendor_idx, rtn);
+				kobject_put(&ctrl_ldev->cable_vendors_kobj[type_idx][vendor_idx]);
+				for (x = 0; x < vendor_idx; ++x) {
+					sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+						   "vendors create delete (type = %d, vendor = %d)", type_idx, x);
+					kobject_put(&ctrl_ldev->cable_vendors_kobj[type_idx][x]);
+				}
+				sl_sysfs_cable_vendors_delete(ctrl_ldev, type_idx, SL_CABLE_VENDORS_NUM);
+				sl_sysfs_cable_types_delete(ctrl_ldev, SL_CABLE_TYPES_NUM);
+				return -ENOMEM;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void sl_sysfs_cable_db_delete(struct sl_ctrl_ldev *ctrl_ldev, int db_idx)
+{
+	int k;
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "db delete");
+
+	for (k = 0; k < db_idx; ++k) {
+		sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "db delete (idx = %d)", k);
+		kobject_put(&ctrl_ldev->cable_hpe_pns_kobj[k].kobj);
+	}
+}
+
+static int sl_sysfs_cable_db_create(struct sl_ctrl_ldev *ctrl_ldev)
+{
+	char hpe_pn[SL_MEDIA_HPE_PN_SIZE + SL_MEDIA_VENDOR_PN_SIZE];
+	int  i;
+	int  type_kobj_num;
+	int  rtn;
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "db create");
+
+	for (i = 0; i < ARRAY_SIZE(cable_db); ++i) {
+		sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "db create (idx = %d)", i);
+		switch (cable_db[i].type) {
+		case SL_MEDIA_TYPE_PEC:
+			type_kobj_num = SL_CABLE_TYPE_PEC;
+			break;
+		case SL_MEDIA_TYPE_AOC:
+			type_kobj_num = SL_CABLE_TYPE_AOC;
+			break;
+		case SL_MEDIA_TYPE_POC:
+			type_kobj_num = SL_CABLE_TYPE_POC;
+			break;
+		case SL_MEDIA_TYPE_AEC:
+			type_kobj_num = SL_CABLE_TYPE_AEC;
+			break;
+		default:
+			sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+				   "unknown (type = %u)", cable_db[i].type);
+			continue;
+		}
+		ctrl_ldev->cable_hpe_pns_kobj[i].ctrl_ldev = ctrl_ldev;
+		ctrl_ldev->cable_hpe_pns_kobj[i].cable_idx = i;
+		snprintf(hpe_pn, sizeof(hpe_pn), "%u_%s", cable_db[i].hpe_pn, cable_db[i].vendor_pn_str);
+		rtn = kobject_init_and_add(&ctrl_ldev->cable_hpe_pns_kobj[i].kobj, &cable_hpe_pns_info,
+					   &ctrl_ldev->cable_vendors_kobj[type_kobj_num][cable_db[i].vendor - SL_MEDIA_VENDOR_TE],
+					   hpe_pn);
+		if (rtn) {
+			sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+				   "hpe_pn create failed (idx = %d, type = 0x%X %s, vendor = %u %s, len = %ucm, hpe_pn = %u) [%d]",
+				   i, cable_db[i].type, sl_media_type_str(cable_db[i].type),
+				   cable_db[i].vendor, sl_media_vendor_str(cable_db[i].vendor),
+				   cable_db[i].length_cm, cable_db[i].hpe_pn, rtn);
+			kobject_put(&ctrl_ldev->cable_hpe_pns_kobj[i].kobj);
+			sl_sysfs_cable_db_delete(ctrl_ldev, i);
+			sl_sysfs_cable_vendors_delete(ctrl_ldev, SL_CABLE_TYPES_NUM, SL_CABLE_VENDORS_NUM);
+			sl_sysfs_cable_types_delete(ctrl_ldev, SL_CABLE_TYPES_NUM);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static int sl_sysfs_cable_info_create(struct sl_ctrl_ldev *ctrl_ldev)
+{
+	int rtn;
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "cable info create (ldev = 0x%p)", ctrl_ldev);
+
+	rtn = kobject_init_and_add(&ctrl_ldev->supported_cables_kobj, &supported_cables_info,
+				   ctrl_ldev->parent_kobj, "supported_cables");
+	if (rtn) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME, "supported cables create failed [%d]", rtn);
+		kobject_put(&ctrl_ldev->supported_cables_kobj);
+		return -ENOMEM;
+	}
+
+	rtn = sl_sysfs_cable_types_create(ctrl_ldev);
+	if (rtn) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME, "cable types create failed [%d]", rtn);
+		kobject_put(&ctrl_ldev->supported_cables_kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_cable_vendors_create(ctrl_ldev);
+	if (rtn) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME, "cable vendors create failed [%d]", rtn);
+		kobject_put(&ctrl_ldev->supported_cables_kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_cable_db_create(ctrl_ldev);
+	if (rtn) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME, "cable db create failed [%d]", rtn);
+		kobject_put(&ctrl_ldev->supported_cables_kobj);
+		return rtn;
+	}
+
+	return 0;
+}
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_ldev_create(u8 ldev_num, struct kobject *parent)
+{
+#ifdef CONFIG_SYSFS
+	int                 rtn;
+	struct sl_ctrl_ldev *ctrl_ldev;
+
+	ctrl_ldev = sl_ctrl_ldev_get(ldev_num);
+	if (!ctrl_ldev) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "sysfs create ldev not found (ldev_num = %u)", ldev_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_ldev_kref_get_unless_zero(ctrl_ldev)) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME,
+			   "kref_get_unless_zero failed (ldev = 0x%p)", ctrl_ldev);
+		return -EBADRQC;
+	}
+
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "ldev create (ldev = 0x%p)", ctrl_ldev);
+
+	if (ctrl_ldev->is_sysfs_ok) {
+		rtn = 0;
+		goto out;
+	}
+
+	ctrl_ldev->parent_kobj = parent;
+	ctrl_ldev->is_sysfs_ok = false;
+
+	rtn = kobject_init_and_add(&(ctrl_ldev->sl_info_kobj), &sl_info, ctrl_ldev->parent_kobj, "sl_info");
+	if (rtn) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME, "sl_info create failed [%d]", rtn);
+		kobject_put(&ctrl_ldev->sl_info_kobj);
+		rtn = -ENOMEM;
+		goto out;
+	}
+
+	rtn = sl_sysfs_cable_info_create(ctrl_ldev);
+	if (rtn) {
+		sl_log_err(ctrl_ldev, LOG_BLOCK, LOG_NAME, "cable info create failed [%d]", rtn);
+		kobject_put(&ctrl_ldev->sl_info_kobj);
+		goto out;
+	}
+
+	ctrl_ldev->is_sysfs_ok = true;
+	rtn = 0;
+
+out:
+	sl_ctrl_ldev_put(ctrl_ldev);
+
+	return rtn;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_ldev_delete(struct sl_ctrl_ldev *ctrl_ldev)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_ldev, LOG_BLOCK, LOG_NAME, "ldev delete (ldev = 0x%p)", ctrl_ldev);
+
+	if (!ctrl_ldev->parent_kobj)
+		return;
+	if (!ctrl_ldev->is_sysfs_ok)
+		return;
+
+	sl_sysfs_cable_db_delete(ctrl_ldev, ARRAY_SIZE(cable_db));
+	sl_sysfs_cable_vendors_delete(ctrl_ldev, SL_CABLE_TYPES_NUM, SL_CABLE_VENDORS_NUM);
+	sl_sysfs_cable_types_delete(ctrl_ldev, SL_CABLE_TYPES_NUM);
+
+	kobject_put(&ctrl_ldev->supported_cables_kobj);
+	kobject_put(&ctrl_ldev->sl_info_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp.c
new file mode 100644
index 000000000000..f0533c8fd888
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_core_link.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+int sl_sysfs_lgrp_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp create (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = sl_sysfs_lgrp_config_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "config create failed [%d]", rtn);
+		return -ENOMEM;
+	}
+
+	rtn = sl_sysfs_lgrp_policy_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "policy create failed [%d]", rtn);
+		goto out_config;
+	}
+
+	rtn = sl_sysfs_serdes_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "serdes create failed [%d]", rtn);
+		goto out_policy;
+	}
+
+	rtn = sl_sysfs_media_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media create failed [%d]", rtn);
+		goto out_serdes;
+	}
+
+	rtn = sl_sysfs_pmi_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi create failed [%d]", rtn);
+		goto out_media;
+	}
+
+	rtn = sl_sysfs_sbus_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus create failed [%d]", rtn);
+		goto out_pmi;
+	}
+
+	rtn = sl_sysfs_sbus_pmi_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi create failed [%d]", rtn);
+		goto out_sbus;
+	}
+
+	return 0;
+
+out_sbus:
+	sl_sysfs_sbus_delete(ctrl_lgrp);
+out_pmi:
+	sl_sysfs_pmi_delete(ctrl_lgrp);
+out_media:
+	sl_sysfs_media_delete(ctrl_lgrp);
+out_serdes:
+	sl_sysfs_serdes_delete(ctrl_lgrp);
+out_policy:
+	sl_sysfs_lgrp_policy_delete(ctrl_lgrp);
+out_config:
+	sl_sysfs_lgrp_config_delete(ctrl_lgrp);
+	return -ENOMEM;
+}
+
+void sl_sysfs_lgrp_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj)
+		return;
+
+	sl_sysfs_sbus_pmi_delete(ctrl_lgrp);
+	sl_sysfs_sbus_delete(ctrl_lgrp);
+	sl_sysfs_pmi_delete(ctrl_lgrp);
+	sl_sysfs_media_delete(ctrl_lgrp);
+	sl_sysfs_serdes_delete(ctrl_lgrp);
+	sl_sysfs_lgrp_policy_delete(ctrl_lgrp);
+	sl_sysfs_lgrp_config_delete(ctrl_lgrp);
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_config.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_config.c
new file mode 100644
index 000000000000..b2181e5114ee
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_config.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/hpe/sl/sl_lgrp.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "data/sl_ctrl_data_lgrp.h"
+#include "data/sl_ctrl_data_lgrp_trace.h"
+
+#define is_flag_set(_flags, _flag) ({              \
+		typeof(_flags) __flags = (_flags); \
+		typeof(_flag)  __flag  = (_flag);  \
+						   \
+		((__flags & __flag) == __flag);    \
+})
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t mfs_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  mfs;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_mfs_get(ctrl_lgrp, &mfs);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "mfs show (mfs = %u)", mfs);
+
+	return sysfs_emit(buf, "%u\n", mfs);
+}
+
+static ssize_t furcation_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  furcation;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_furcation_get(ctrl_lgrp, &furcation);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "furcation show (furcation = %u %s)",
+		   furcation, sl_lgrp_furcation_str(furcation));
+
+	return sysfs_emit(buf, "%s\n", sl_lgrp_furcation_str(furcation));
+}
+
+static ssize_t fec_mode_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  fec_mode;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_fec_mode_get(ctrl_lgrp, &fec_mode);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "fec mode show (mode = %u %s)",
+		   fec_mode, sl_lgrp_fec_mode_str(fec_mode));
+
+	return sysfs_emit(buf, "%s\n", sl_lgrp_fec_mode_str(fec_mode));
+}
+
+static ssize_t tech_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	int                  idx;
+	char                 output[50];
+	u32                  tech_map;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_tech_map_get(ctrl_lgrp, &tech_map);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "tech map show (map = 0x%X)", tech_map);
+
+	if (tech_map == 0)
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CK_400G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CK_400G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CK_200G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CK_200G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CK_100G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CK_100G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_BS_200G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_BS_200G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CD_100G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CD_100G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CD_50G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CD_50G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_BJ_100G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_BJ_100G));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t fec_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	int                  idx;
+	char                 output[20];
+	u32                  fec_map;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_fec_map_get(ctrl_lgrp, &fec_map);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "fec map show (map = 0x%X)", fec_map);
+
+	if (fec_map == 0)
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(fec_map, SL_LGRP_CONFIG_FEC_RS_LL))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_fec_str(SL_LGRP_CONFIG_FEC_RS_LL));
+	if (is_flag_set(fec_map, SL_LGRP_CONFIG_FEC_RS))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_fec_str(SL_LGRP_CONFIG_FEC_RS));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t link_type_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  options;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_options_get(ctrl_lgrp, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (options & SL_LGRP_CONFIG_OPT_FABRIC)
+		return sysfs_emit(buf, "fabric\n");
+
+	return sysfs_emit(buf, "edge\n");
+}
+
+static ssize_t loopback_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  options;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_options_get(ctrl_lgrp, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "loopback show (options = 0x%X)", options);
+
+	if (options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)
+		return sysfs_emit(buf, "enabled-serdes\n");
+
+	return sysfs_emit(buf, "disabled\n");
+}
+
+static struct kobj_attribute lgrp_mfs       = __ATTR_RO(mfs);
+static struct kobj_attribute lgrp_furcation = __ATTR_RO(furcation);
+static struct kobj_attribute lgrp_fec_mode  = __ATTR_RO(fec_mode);
+static struct kobj_attribute lgrp_tech_map  = __ATTR_RO(tech_map);
+static struct kobj_attribute lgrp_fec_map   = __ATTR_RO(fec_map);
+static struct kobj_attribute lgrp_link_type = __ATTR_RO(link_type);
+static struct kobj_attribute lgrp_loopback  = __ATTR_RO(loopback);
+
+static ssize_t err_trace_enable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	bool                 is_err_trace_enabled;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_is_err_trace_enabled(ctrl_lgrp, &is_err_trace_enabled);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "err trace enable show (is_err_trace_enabled = %u)", is_err_trace_enabled);
+
+	return sysfs_emit(buf, "%u\n", is_err_trace_enabled);
+}
+
+static ssize_t err_trace_enable_store(struct kobject *kobj, struct kobj_attribute *kattr, const char *buf, size_t count)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u8                   val;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = kstrtou8(buf, 0, &val);
+	if (rtn) {
+		sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "err trace enable store failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "err trace enable store (val = %u)", val);
+
+	rtn = sl_ctrl_data_lgrp_err_trace_enable_set(ctrl_lgrp, val);
+	if (rtn) {
+		sl_log_err_trace(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				 "err trace enable store failed [%d]", rtn);
+		return rtn;
+	}
+
+	return count;
+}
+
+static struct kobj_attribute lgrp_err_trace_enable = __ATTR_RW(err_trace_enable);
+
+static ssize_t warn_trace_enable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	bool                 is_warn_trace_enabled;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_is_warn_trace_enabled(ctrl_lgrp, &is_warn_trace_enabled);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "warn trace enable show (is_warn_trace_enabled = %u)",
+		   is_warn_trace_enabled);
+
+	return sysfs_emit(buf, "%u\n", is_warn_trace_enabled);
+}
+
+static ssize_t warn_trace_enable_store(struct kobject *kobj, struct kobj_attribute *kattr,
+				       const char *buf, size_t count)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u8                   val;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = kstrtou8(buf, 0, &val);
+	if (rtn) {
+		sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "warn trace enable store failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "warn trace enable store (val = %u)", val);
+
+	rtn = sl_ctrl_data_lgrp_warn_trace_set(ctrl_lgrp, val);
+	if (rtn) {
+		sl_log_err_trace(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				 "warn trace enable store failed [%d]", rtn);
+		return rtn;
+	}
+
+	return count;
+}
+
+static struct kobj_attribute lgrp_warn_trace_enable = __ATTR_RW(warn_trace_enable);
+
+static ssize_t serdes_lane_io_trace_enable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	bool                 serdes_lane_io_trace;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	serdes_lane_io_trace = sl_ctrl_data_lgrp_is_serdes_lane_io_trace_enabled(ctrl_lgrp);
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "core init io trace enable show (serdes_lane_io_trace = %s)",
+		   serdes_lane_io_trace ? "enabled" : "disabled");
+
+	return sysfs_emit(buf, "%u\n", serdes_lane_io_trace ? 1 : 0);
+}
+
+static ssize_t serdes_lane_io_trace_enable_store(struct kobject *kobj, struct kobj_attribute *kattr,
+						 const char *buf, size_t count)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u8                   val;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = kstrtou8(buf, 0, &val);
+	if (rtn) {
+		sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "core init io trace enable store failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "core init io trace enable store (val = %u)", val);
+
+	rtn = sl_ctrl_data_lgrp_serdes_lane_io_trace_set(ctrl_lgrp, (val == 1) ? true : false);
+	if (rtn) {
+		sl_log_err_trace(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				 "core init io trace enable store failed [%d]", rtn);
+		return rtn;
+	}
+
+	return count;
+}
+
+static struct kobj_attribute lgrp_serdes_lane_io_trace_enable = __ATTR_RW(serdes_lane_io_trace_enable);
+
+static ssize_t fabric_link_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  options;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_options_get(ctrl_lgrp, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "fabric link show (fabric link = %s)",
+		   (options & SL_LGRP_CONFIG_OPT_FABRIC) ? "enabled" : "disabled");
+
+	return sysfs_emit(buf, "%s\n",
+			 (options & SL_LGRP_CONFIG_OPT_FABRIC) ? "enabled" : "disabled");
+}
+
+static struct kobj_attribute lgrp_fabric_link = __ATTR_RO(fabric_link);
+
+static ssize_t r1_partner_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u32                  options;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, config_kobj);
+
+	rtn = sl_ctrl_data_lgrp_options_get(ctrl_lgrp, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "r1 partner show (r1 partner = %s)",
+		   (options & SL_LGRP_CONFIG_OPT_R1) ? "enabled" : "disabled");
+
+	return sysfs_emit(buf, "%s\n", (options & SL_LGRP_CONFIG_OPT_R1) ? "enabled" : "disabled");
+}
+
+static struct kobj_attribute lgrp_r1_partner  = __ATTR_RO(r1_partner);
+
+static struct attribute *lgrp_config_attrs[] = {
+	&lgrp_mfs.attr,
+	&lgrp_furcation.attr,
+	&lgrp_fec_mode.attr,
+	&lgrp_tech_map.attr,
+	&lgrp_fec_map.attr,
+	&lgrp_link_type.attr,
+	&lgrp_loopback.attr,
+	&lgrp_err_trace_enable.attr,
+	&lgrp_warn_trace_enable.attr,
+	&lgrp_serdes_lane_io_trace_enable.attr,
+	&lgrp_fabric_link.attr,
+	&lgrp_r1_partner.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(lgrp_config);
+
+static struct kobj_type config_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = lgrp_config_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_lgrp_config_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp config create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->config_kobj), &config_info, ctrl_lgrp->parent_kobj, "config");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp config create failed [%d]", rtn);
+		kobject_put(&(ctrl_lgrp->config_kobj));
+		return -ENOMEM;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_lgrp_config_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp config delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&(ctrl_lgrp->config_kobj));
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_policy.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_policy.c
new file mode 100644
index 000000000000..ccb9bf627ee4
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_policy.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_core_link.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static struct attribute *lgrp_policy_attrs[] = {
+	NULL
+};
+ATTRIBUTE_GROUPS(lgrp_policy);
+
+static struct kobj_type policy_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = lgrp_policy_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_lgrp_policy_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp policy create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->policy_kobj), &policy_info, ctrl_lgrp->parent_kobj, "policies");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp policy create failed [%d]", rtn);
+		kobject_put(&(ctrl_lgrp->policy_kobj));
+		return -ENOMEM;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_lgrp_policy_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "lgrp policy delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&(ctrl_lgrp->policy_kobj));
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link.c
new file mode 100644
index 000000000000..df0f51c5f77e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link.c
@@ -0,0 +1,830 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "data/sl_ctrl_data_link.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "hw/sl_core_hw_an.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  state;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "state show (link = 0x%p, state = %u %s)", ctrl_link, state, sl_link_state_str(state));
+
+	return sysfs_emit(buf, "%s\n", sl_link_state_str(state));
+}
+
+static ssize_t speed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  state;
+	u32                  speed;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_link_state_get_cmd(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+					 ctrl_link->ctrl_lgrp->num, ctrl_link->num, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	rtn = sl_core_link_speed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num, &speed);
+	if (rtn == -ENOLINK)
+		return sysfs_emit(buf, "no-link\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "speed show (state = %u %s, speed = 0x%X %s)",
+		   state, sl_link_state_str(state), speed, sl_lgrp_config_tech_str(speed));
+
+	if ((state != SL_LINK_STATE_UP) && (state != SL_LINK_STATE_UP_DOWN_REQ))
+		return sysfs_emit(buf, "no-link\n");
+
+	return sysfs_emit(buf, "%s\n", sl_lgrp_config_tech_str(speed));
+}
+
+static ssize_t ccw_warn_limit_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	bool                 is_limit_crossed;
+	time64_t             limit_crossed_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_core_link_ccw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						      ctrl_link->num, &is_limit_crossed, &limit_crossed_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "ccw warn limit crossed show (is_limit_crossed = %d %s)", is_limit_crossed,
+		is_limit_crossed ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_limit_crossed ? "yes" : "no");
+}
+
+static ssize_t ccw_warn_limit_last_crossed_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	bool                 is_limit_crossed;
+	time64_t             limit_crossed_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_core_link_ccw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						      ctrl_link->num, &is_limit_crossed, &limit_crossed_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "ccw warn limit last crossed time show (is_limit_crossed = 0x%X, time = %lld %ptTt %ptTd)",
+		is_limit_crossed, limit_crossed_time, &limit_crossed_time, &limit_crossed_time);
+
+	if (!is_limit_crossed)
+		return sysfs_emit(buf, "not-crossed\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &limit_crossed_time, &limit_crossed_time);
+}
+
+static ssize_t ucw_warn_limit_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	bool                 is_limit_crossed;
+	time64_t             limit_crossed_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_core_link_ucw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						      ctrl_link->num, &is_limit_crossed, &limit_crossed_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "ucw warn limit crossed show (is_limit_crossed = %d %s)", is_limit_crossed,
+		is_limit_crossed ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_limit_crossed ? "yes" : "no");
+}
+
+static ssize_t ucw_warn_limit_last_crossed_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	bool                 is_limit_crossed;
+	time64_t             limit_crossed_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_core_link_ucw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						      ctrl_link->num, &is_limit_crossed, &limit_crossed_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "ucw warn limit last crossed time show (is_limit_crossed = 0x%X, time = %lld %ptTt %ptTd)",
+		is_limit_crossed, limit_crossed_time, &limit_crossed_time, &limit_crossed_time);
+
+	if (!is_limit_crossed)
+		return sysfs_emit(buf, "not-crossed\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &limit_crossed_time, &limit_crossed_time);
+}
+
+static ssize_t up_count_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  up_count;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_link_up_count_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+					ctrl_link->num, &up_count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "up count show (up_count = %u)", up_count);
+
+	return sysfs_emit(buf, "%u\n", up_count);
+}
+
+static ssize_t time_to_link_up_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	u32                  state;
+	struct sl_ctrl_link *ctrl_link;
+	s64                  attempt_time_ms;
+	s64                  total_time_ms;
+	s64                  up_time_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((state != SL_LINK_STATE_UP) && (state != SL_LINK_STATE_UP_DOWN_REQ))
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_ctrl_link_up_clocks_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+					 ctrl_link->num, &attempt_time_ms, &total_time_ms, &up_time_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "time to link up show (attempt_time = %lldms, total_time = %lldms)",
+		   attempt_time_ms, total_time_ms);
+
+	return sysfs_emit(buf, "%lld\n", attempt_time_ms);
+}
+
+static ssize_t total_time_to_link_up_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	u32                  state;
+	struct sl_ctrl_link *ctrl_link;
+	s64                  attempt_time_ms;
+	s64                  total_time_ms;
+	s64                  up_time_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((state != SL_LINK_STATE_UP) && (state != SL_LINK_STATE_UP_DOWN_REQ))
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_ctrl_link_up_clocks_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+					 ctrl_link->num, &attempt_time_ms, &total_time_ms, &up_time_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "total time to link up show (attempt_time = %lldms, total_time = %lldms)",
+		   attempt_time_ms, total_time_ms);
+
+	return sysfs_emit(buf, "%lld\n", total_time_ms);
+}
+
+static ssize_t up_time_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	u32                  state;
+	struct sl_ctrl_link *ctrl_link;
+	s64                  attempt_time_ms;
+	s64                  total_time_ms;
+	s64                  up_time_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((state != SL_LINK_STATE_UP) && (state != SL_LINK_STATE_UP_DOWN_REQ))
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_ctrl_link_up_clocks_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+					 ctrl_link->num, &attempt_time_ms, &total_time_ms, &up_time_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "up time show (up_time = %lldms)", up_time_ms);
+
+	return sysfs_emit(buf, "%lld\n", up_time_ms);
+}
+
+static ssize_t lp_caps_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	u32                  lp_caps_state;
+	struct sl_ctrl_link *ctrl_link;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_link_an_lp_caps_state_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						ctrl_link->num, &lp_caps_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "an lp caps state show (lp_caps_state = %u %s)",
+		   lp_caps_state, sl_link_an_lp_caps_state_str(lp_caps_state));
+
+	return sysfs_emit(buf, "%s\n", sl_link_an_lp_caps_state_str(lp_caps_state));
+}
+
+static ssize_t last_autoneg_fail_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  fail_cause;
+	time64_t             fail_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_link_an_fail_cause_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+					     ctrl_link->num, &fail_cause, &fail_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "last autoneg fail casue show (cause = %u %s)",
+		   fail_cause, sl_core_link_an_fail_cause_str(fail_cause));
+
+	if (fail_cause == SL_CORE_HW_AN_FAIL_CAUSE_NONE)
+		return sysfs_emit(buf, "no-fail\n");
+
+	return sysfs_emit(buf, "%s\n", sl_core_link_an_fail_cause_str(fail_cause));
+}
+
+static ssize_t last_autoneg_fail_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  fail_cause;
+	time64_t             fail_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_link_an_fail_cause_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+					     ctrl_link->num, &fail_cause, &fail_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "last autoneg fail time show (cause = %u %s, time = %lld %ptTt %ptTd)",
+		   fail_cause, sl_core_link_an_fail_cause_str(fail_cause), fail_time, &fail_time, &fail_time);
+
+	if (fail_cause == SL_CORE_HW_AN_FAIL_CAUSE_NONE)
+		return sysfs_emit(buf, "no-fail\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &fail_time, &fail_time);
+}
+
+static ssize_t info_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  info_map;
+	char                 info_map_str[900];
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, kobj);
+
+	rtn = sl_ctrl_link_info_map_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+					ctrl_link->ctrl_lgrp->num, ctrl_link->num, &info_map);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "info map show sl_ctrl_link_info_map_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-link\n");
+	}
+
+	sl_core_info_map_str(info_map, info_map_str, sizeof(info_map_str));
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "info map show (info_map = 0x%llX %s)", info_map, info_map_str);
+
+	return sysfs_emit(buf, "%s\n", info_map_str);
+}
+
+static struct kobj_attribute link_state                            = __ATTR_RO(state);
+static struct kobj_attribute link_speed                            = __ATTR_RO(speed);
+static struct kobj_attribute link_ccw_warn_limit_crossed           = __ATTR_RO(ccw_warn_limit_crossed);
+static struct kobj_attribute link_ccw_warn_limit_last_crossed_time = __ATTR_RO(ccw_warn_limit_last_crossed_time);
+static struct kobj_attribute link_ucw_warn_limit_crossed           = __ATTR_RO(ucw_warn_limit_crossed);
+static struct kobj_attribute link_ucw_warn_limit_last_crossed_time = __ATTR_RO(ucw_warn_limit_last_crossed_time);
+static struct kobj_attribute link_up_count                         = __ATTR_RO(up_count);
+static struct kobj_attribute link_up_time_ms                       = __ATTR_RO(up_time_ms);
+static struct kobj_attribute link_time_to_link_up_ms               = __ATTR_RO(time_to_link_up_ms);
+static struct kobj_attribute link_total_time_to_link_up_ms         = __ATTR_RO(total_time_to_link_up_ms);
+static struct kobj_attribute link_lp_caps_state                    = __ATTR_RO(lp_caps_state);
+static struct kobj_attribute link_last_autoneg_fail_cause          = __ATTR_RO(last_autoneg_fail_cause);
+static struct kobj_attribute link_last_autoneg_fail_time           = __ATTR_RO(last_autoneg_fail_time);
+static struct kobj_attribute link_info_map                         = __ATTR_RO(info_map);
+
+static struct attribute *link_attrs[] = {
+	&link_state.attr,
+	&link_speed.attr,
+	&link_ccw_warn_limit_crossed.attr,
+	&link_ccw_warn_limit_last_crossed_time.attr,
+	&link_ucw_warn_limit_crossed.attr,
+	&link_ucw_warn_limit_last_crossed_time.attr,
+	&link_up_count.attr,
+	&link_up_time_ms.attr,
+	&link_time_to_link_up_ms.attr,
+	&link_total_time_to_link_up_ms.attr,
+	&link_lp_caps_state.attr,
+	&link_last_autoneg_fail_cause.attr,
+	&link_last_autoneg_fail_time.attr,
+	&link_info_map.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link);
+
+static struct kobj_type link_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_groups,
+};
+
+static ssize_t last_down_cause_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u64                  down_cause_map;
+	time64_t             down_time;
+	char                 cause_str[SL_LINK_DOWN_CAUSE_STR_SIZE];
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, last_down_kobj);
+
+	rtn = sl_core_link_last_down_cause_map_info_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+							ctrl_link->num, num, &down_cause_map, &down_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_link_down_cause_map_with_info_str(down_cause_map, cause_str, sizeof(cause_str));
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "last down cause show (num = %u, cause_map = 0x%llX %s)",
+		   num, down_cause_map, cause_str);
+
+	return sysfs_emit(buf, "%s\n", cause_str);
+}
+
+#define link_last_down_cause_map(_num)                                                                               \
+	static inline ssize_t cause_map_##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                            \
+		return last_down_cause_map_show(kobj, kattr, buf, (_num));                                           \
+	}                                                                                                            \
+	static struct kobj_attribute link_last_down_cause_map_##_num = __ATTR_RO(cause_map_##_num)
+
+link_last_down_cause_map(0);
+link_last_down_cause_map(1);
+link_last_down_cause_map(2);
+link_last_down_cause_map(3);
+link_last_down_cause_map(4);
+link_last_down_cause_map(5);
+link_last_down_cause_map(6);
+link_last_down_cause_map(7);
+link_last_down_cause_map(8);
+link_last_down_cause_map(9);
+
+static ssize_t last_down_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u64                  down_cause_map;
+	time64_t             down_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, last_down_kobj);
+
+	rtn = sl_core_link_last_down_cause_map_info_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+							ctrl_link->num, num, &down_cause_map, &down_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "last down time show (num = %u, cause_map = 0x%llX, time = %lld %ptTt %ptTd)",
+		   num, down_cause_map, down_time, &down_time, &down_time);
+
+	if (down_cause_map == SL_LINK_DOWN_CAUSE_NONE)
+		return sysfs_emit(buf, "none\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &down_time, &down_time);
+}
+
+#define link_last_down_time(_num)                                                                               \
+	static inline ssize_t time_##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                       \
+		return last_down_time_show(kobj, kattr, buf, (_num));                                           \
+	}                                                                                                       \
+	static struct kobj_attribute link_last_down_time_##_num = __ATTR_RO(time_##_num)
+
+link_last_down_time(0);
+link_last_down_time(1);
+link_last_down_time(2);
+link_last_down_time(3);
+link_last_down_time(4);
+link_last_down_time(5);
+link_last_down_time(6);
+link_last_down_time(7);
+link_last_down_time(8);
+link_last_down_time(9);
+
+static struct attribute *last_down_attrs[] = {
+	&link_last_down_cause_map_0.attr,
+	&link_last_down_time_0.attr,
+	&link_last_down_cause_map_1.attr,
+	&link_last_down_time_1.attr,
+	&link_last_down_cause_map_2.attr,
+	&link_last_down_time_2.attr,
+	&link_last_down_cause_map_3.attr,
+	&link_last_down_time_3.attr,
+	&link_last_down_cause_map_4.attr,
+	&link_last_down_time_4.attr,
+	&link_last_down_cause_map_5.attr,
+	&link_last_down_time_5.attr,
+	&link_last_down_cause_map_6.attr,
+	&link_last_down_time_6.attr,
+	&link_last_down_cause_map_7.attr,
+	&link_last_down_time_7.attr,
+	&link_last_down_cause_map_8.attr,
+	&link_last_down_time_8.attr,
+	&link_last_down_cause_map_9.attr,
+	&link_last_down_time_9.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(last_down);
+
+static struct kobj_type last_down = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = last_down_groups,
+};
+
+static ssize_t last_up_fail_cause_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u64                  up_fail_cause_map;
+	time64_t             up_fail_time;
+	char                 cause_str[SL_LINK_UP_FAIL_CAUSE_STR_SIZE];
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, last_up_fail_kobj);
+	rtn = sl_core_link_last_up_fail_cause_map_info_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+							   ctrl_link->num, num, &up_fail_cause_map, &up_fail_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_link_down_cause_map_with_info_str(up_fail_cause_map, cause_str, sizeof(cause_str));
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "last up_fail cause show (num = %u, cause_map = 0x%llX %s)",
+		   num, up_fail_cause_map, cause_str);
+
+	return sysfs_emit(buf, "%s\n", cause_str);
+}
+
+#define link_last_up_fail_cause_map(_num)                                                                                    \
+	static inline ssize_t up_fail_cause_map_##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                                    \
+		return last_up_fail_cause_map_show(kobj, kattr, buf, (_num));                                                \
+	}                                                                                                                    \
+	static struct kobj_attribute link_last_up_fail_cause_map_##_num = __ATTR_RO(up_fail_cause_map_##_num)
+
+link_last_up_fail_cause_map(0);
+link_last_up_fail_cause_map(1);
+link_last_up_fail_cause_map(2);
+link_last_up_fail_cause_map(3);
+link_last_up_fail_cause_map(4);
+link_last_up_fail_cause_map(5);
+link_last_up_fail_cause_map(6);
+link_last_up_fail_cause_map(7);
+link_last_up_fail_cause_map(8);
+link_last_up_fail_cause_map(9);
+
+static ssize_t last_up_fail_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u64                  up_fail_cause_map;
+	time64_t             up_fail_time;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, last_up_fail_kobj);
+	rtn = sl_core_link_last_up_fail_cause_map_info_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+							   ctrl_link->num, num, &up_fail_cause_map, &up_fail_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "last up_fail time show (num = %u, cause_map = 0x%llX, time = %lld %ptTt %ptTd)",
+		   num, up_fail_cause_map, up_fail_time, &up_fail_time, &up_fail_time);
+
+	if (up_fail_cause_map == SL_LINK_DOWN_CAUSE_NONE)
+		return sysfs_emit(buf, "none\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &up_fail_time, &up_fail_time);
+}
+
+#define link_last_up_fail_time(_num)                                                                                    \
+	static inline ssize_t up_fail_time_##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                               \
+		return last_up_fail_time_show(kobj, kattr, buf, (_num));                                                \
+	}                                                                                                               \
+	static struct kobj_attribute link_last_up_fail_time_##_num = __ATTR_RO(up_fail_time_##_num)
+
+link_last_up_fail_time(0);
+link_last_up_fail_time(1);
+link_last_up_fail_time(2);
+link_last_up_fail_time(3);
+link_last_up_fail_time(4);
+link_last_up_fail_time(5);
+link_last_up_fail_time(6);
+link_last_up_fail_time(7);
+link_last_up_fail_time(8);
+link_last_up_fail_time(9);
+
+static struct attribute *last_up_fail_attrs[] = {
+	&link_last_up_fail_cause_map_0.attr,
+	&link_last_up_fail_time_0.attr,
+	&link_last_up_fail_cause_map_1.attr,
+	&link_last_up_fail_time_1.attr,
+	&link_last_up_fail_cause_map_2.attr,
+	&link_last_up_fail_time_2.attr,
+	&link_last_up_fail_cause_map_3.attr,
+	&link_last_up_fail_time_3.attr,
+	&link_last_up_fail_cause_map_4.attr,
+	&link_last_up_fail_time_4.attr,
+	&link_last_up_fail_cause_map_5.attr,
+	&link_last_up_fail_time_5.attr,
+	&link_last_up_fail_cause_map_6.attr,
+	&link_last_up_fail_time_6.attr,
+	&link_last_up_fail_cause_map_7.attr,
+	&link_last_up_fail_time_7.attr,
+	&link_last_up_fail_cause_map_8.attr,
+	&link_last_up_fail_time_8.attr,
+	&link_last_up_fail_cause_map_9.attr,
+	&link_last_up_fail_time_9.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(last_up_fail);
+
+static struct kobj_type last_up_fail = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = last_up_fail_groups,
+};
+
+static int sl_sysfs_link_last_up_fail_create(struct sl_ctrl_link *ctrl_link)
+{
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_link->last_up_fail_kobj,
+				   &last_up_fail, &ctrl_link->kobj, "last_up_fail");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "last up_fail create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->last_up_fail_kobj);
+		return rtn;
+	}
+
+	return 0;
+}
+
+static void sl_sysfs_link_last_up_fail_delete(struct sl_ctrl_link *ctrl_link)
+{
+	kobject_put(&ctrl_link->last_up_fail_kobj);
+}
+
+static int sl_sysfs_link_last_down_create(struct sl_ctrl_link *ctrl_link)
+{
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_link->last_down_kobj,
+				   &last_down, &ctrl_link->kobj, "last_down");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "last down create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->last_down_kobj);
+		return rtn;
+	}
+
+	return 0;
+}
+
+static void sl_sysfs_link_last_down_delete(struct sl_ctrl_link *ctrl_link)
+{
+	kobject_put(&ctrl_link->last_down_kobj);
+}
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int                  rtn;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link create (num = %u)", ctrl_link->num);
+
+	if (!ctrl_link->parent_kobj) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME, "link create missing parent");
+		return -EBADRQC;
+	}
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return -ENODEV;
+
+	rtn = kobject_init_and_add(&ctrl_link->kobj, &link_info, ctrl_link->parent_kobj, "link");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_policy_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_policy_create failed [%d]", rtn);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_config_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_config_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_degrade_create(core_link, &ctrl_link->kobj);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_degrade_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_pml_rec_create(core_link, &ctrl_link->kobj);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME, "sl_sysfs_link_pml_rec_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		sl_sysfs_link_degrade_delete(core_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_fec_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_fec_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		sl_sysfs_link_degrade_delete(core_link);
+		sl_sysfs_link_pml_rec_delete(core_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_caps_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_caps_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		sl_sysfs_link_degrade_delete(core_link);
+		sl_sysfs_link_pml_rec_delete(core_link);
+		sl_sysfs_link_fec_delete(ctrl_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_counters_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_counters_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		sl_sysfs_link_degrade_delete(core_link);
+		sl_sysfs_link_pml_rec_delete(core_link);
+		sl_sysfs_link_fec_delete(ctrl_link);
+		sl_sysfs_link_caps_delete(ctrl_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_last_down_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_last_down_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		sl_sysfs_link_degrade_delete(core_link);
+		sl_sysfs_link_pml_rec_delete(core_link);
+		sl_sysfs_link_fec_delete(ctrl_link);
+		sl_sysfs_link_caps_delete(ctrl_link);
+		sl_sysfs_link_counters_delete(ctrl_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_last_up_fail_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "sl_sysfs_link_last_up_fail_create failed [%d]", rtn);
+		sl_sysfs_link_policy_delete(ctrl_link);
+		sl_sysfs_link_config_delete(ctrl_link);
+		sl_sysfs_link_degrade_delete(core_link);
+		sl_sysfs_link_pml_rec_delete(core_link);
+		sl_sysfs_link_fec_delete(ctrl_link);
+		sl_sysfs_link_caps_delete(ctrl_link);
+		sl_sysfs_link_counters_delete(ctrl_link);
+		sl_sysfs_link_last_down_delete(ctrl_link);
+		kobject_put(&ctrl_link->kobj);
+		return rtn;
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link create (link_kobj = 0x%p)", &ctrl_link->kobj);
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link delete (num = %u)", ctrl_link->num);
+
+	if (!ctrl_link->parent_kobj)
+		return;
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return;
+
+	sl_sysfs_link_policy_delete(ctrl_link);
+	sl_sysfs_link_config_delete(ctrl_link);
+	sl_sysfs_link_degrade_delete(core_link);
+	sl_sysfs_link_pml_rec_delete(core_link);
+	sl_sysfs_link_fec_delete(ctrl_link);
+	sl_sysfs_link_caps_delete(ctrl_link);
+	sl_sysfs_link_counters_delete(ctrl_link);
+	sl_sysfs_link_last_down_delete(ctrl_link);
+	sl_sysfs_link_last_up_fail_delete(ctrl_link);
+	kobject_put(&ctrl_link->kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_caps.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_caps.c
new file mode 100644
index 000000000000..f52b34b31bd3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_caps.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_link.h"
+#include "sl_core_link.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t tech_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_core_lgrp *core_lgrp;
+	int                  idx;
+	char                 output[80];
+	u32                  tech_map;
+	u32                  link_state;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, caps_kobj);
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = core_link->core_lgrp;
+
+	tech_map = core_lgrp->link_caps[core_link->num].tech_map;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "tech map show (link = 0x%p, map = 0x%X)", core_link, tech_map);
+
+	rtn = sl_core_link_state_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((tech_map == 0) ||
+	    ((link_state != SL_CORE_LINK_STATE_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_GOING_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_AN)) ||
+		!is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CK_400G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CK_400G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CK_200G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CK_200G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CK_100G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CK_100G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_BS_200G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_BS_200G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CD_100G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CD_100G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_CD_50G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_CD_50G));
+	if (is_flag_set(tech_map, SL_LGRP_CONFIG_TECH_BJ_100G))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_tech_str(SL_LGRP_CONFIG_TECH_BJ_100G));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t pause_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_core_lgrp *core_lgrp;
+	int                  idx;
+	char                 output[20];
+	u32                  pause_map;
+	u32                  link_state;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, caps_kobj);
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = core_link->core_lgrp;
+
+	pause_map = core_lgrp->link_caps[core_link->num].pause_map;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "pause map show (link = 0x%p, map = 0x%X)", core_link, pause_map);
+
+	rtn = sl_core_link_state_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((pause_map == 0) ||
+	    ((link_state != SL_CORE_LINK_STATE_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_GOING_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_AN)) ||
+		!is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(pause_map, SL_LINK_CONFIG_PAUSE_ASYM))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_pause_str(SL_LINK_CONFIG_PAUSE_ASYM));
+	if (is_flag_set(pause_map, SL_LINK_CONFIG_PAUSE_SYM))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_pause_str(SL_LINK_CONFIG_PAUSE_SYM));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t fec_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_core_lgrp *core_lgrp;
+	int                  idx;
+	char                 output[20];
+	u32                  fec_map;
+	u32                  link_state;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, caps_kobj);
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = core_link->core_lgrp;
+
+	fec_map = core_lgrp->link_caps[core_link->num].fec_map;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "fec map show (link = 0x%p, map = 0x%X)", core_link, fec_map);
+
+	rtn = sl_core_link_state_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((fec_map == 0) ||
+	    ((link_state != SL_CORE_LINK_STATE_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_GOING_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_AN)) ||
+		!is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(fec_map, SL_LGRP_CONFIG_FEC_RS_LL))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_fec_str(SL_LGRP_CONFIG_FEC_RS_LL));
+	if (is_flag_set(fec_map, SL_LGRP_CONFIG_FEC_RS))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_lgrp_config_fec_str(SL_LGRP_CONFIG_FEC_RS));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t hpe_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_core_lgrp *core_lgrp;
+	int                  idx;
+	char                 output[80];
+	u32                  hpe_map;
+	u32                  link_state;
+	int		     rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, caps_kobj);
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = core_link->core_lgrp;
+
+	hpe_map = core_lgrp->link_caps[core_link->num].hpe_map;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "hpe map show (link = 0x%p, map = 0x%X)", core_link, hpe_map);
+
+	rtn = sl_core_link_state_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				     ctrl_link->ctrl_lgrp->num, ctrl_link->num, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if ((hpe_map == 0) ||
+	    ((link_state != SL_CORE_LINK_STATE_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_GOING_UP) &&
+		 (link_state != SL_CORE_LINK_STATE_AN)) ||
+		!is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_LINKTRAIN))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_LINKTRAIN));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_PRECODING))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_PRECODING));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_PCAL))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_PCAL));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_R3))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R3));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_R2))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R2));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_C3))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R3));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_C2))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R2));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_LLR))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_LLR));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static struct kobj_attribute tech_map  = __ATTR_RO(tech_map);
+static struct kobj_attribute fec_map   = __ATTR_RO(fec_map);
+static struct kobj_attribute pause_map = __ATTR_RO(pause_map);
+static struct kobj_attribute hpe_map   = __ATTR_RO(hpe_map);
+
+static struct attribute *link_caps_attrs[] = {
+	&tech_map.attr,
+	&fec_map.attr,
+	&pause_map.attr,
+	&hpe_map.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_caps);
+
+static struct kobj_type link_caps = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_caps_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_caps_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link caps create (num = %u)", ctrl_link->num);
+
+	rtn = kobject_init_and_add(&ctrl_link->caps_kobj, &link_caps, &ctrl_link->kobj, "caps");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link caps create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->caps_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_caps_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link caps delete (num = %u)", ctrl_link->num);
+
+	kobject_put(&ctrl_link->caps_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_config.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_config.c
new file mode 100644
index 000000000000..a61072c56ca3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_config.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "data/sl_ctrl_data_link.h"
+#include "sl_ctrl_link.h"
+#include "sl_core_link.h"
+#include "data/sl_ctrl_data_link.h"
+#include "sl_test_common.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t link_up_timeout_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  link_up_timeout_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_up_timeout_ms_get(ctrl_link, &link_up_timeout_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link up timeout show (link_up_timeout = %ums)", link_up_timeout_ms);
+
+	return sysfs_emit(buf, "%u\n", link_up_timeout_ms);
+}
+
+static ssize_t link_up_tries_max_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  link_up_tries_max;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_up_tries_max_get(ctrl_link, &link_up_tries_max);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link up tries max show (link_up_tries_max = %d)", link_up_tries_max);
+
+	if (link_up_tries_max == SL_LINK_INFINITE_UP_TRIES)
+		return sysfs_emit(buf, "infinite\n");
+	else
+		return sysfs_emit(buf, "%d\n", link_up_tries_max);
+}
+
+static ssize_t fec_up_settle_wait_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  fec_up_settle_wait_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_settle_wait_ms_get(ctrl_link, &fec_up_settle_wait_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_up_settle_wait show (fec_up_settle_wait = %dms)", fec_up_settle_wait_ms);
+
+	return sysfs_emit(buf, "%d\n", fec_up_settle_wait_ms);
+}
+
+static ssize_t fec_up_check_wait_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  fec_up_check_wait_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_check_wait_ms_get(ctrl_link, &fec_up_check_wait_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_up_check_wait show (fec_up_check_wait = %dms)", fec_up_check_wait_ms);
+
+	return sysfs_emit(buf, "%d\n", fec_up_check_wait_ms);
+}
+
+static ssize_t fec_up_ucw_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32		     fec_up_ucw_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_ucw_limit_get(ctrl_link, &fec_up_ucw_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_up_ucw_limit show (fec_up_ucw_limit = %d)", fec_up_ucw_limit);
+
+	return sysfs_emit(buf, "%d\n", fec_up_ucw_limit);
+}
+
+static ssize_t fec_up_ccw_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32		     fec_up_ccw_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_ccw_limit_get(ctrl_link, &fec_up_ccw_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_up_ccw_limit show (fec_up_ccw_limit = %d)", fec_up_ccw_limit);
+
+	return sysfs_emit(buf, "%d\n", fec_up_ccw_limit);
+}
+
+static ssize_t lock_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_config_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "lock show (options = 0x%X)", options);
+
+	return sysfs_emit(buf, "%s\n", is_flag_set(options,
+			 SL_LINK_CONFIG_OPT_LOCK) ? "enabled" : "disabled");
+}
+
+static ssize_t pause_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	int                  idx;
+	char                 output[20];
+	u32                  pause_map;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_pause_map_get(ctrl_link, &pause_map);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "pause map show (link = 0x%p, map = 0x%X)", ctrl_link, pause_map);
+
+	if (pause_map == 0)
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(pause_map, SL_LINK_CONFIG_PAUSE_ASYM))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_pause_str(SL_LINK_CONFIG_PAUSE_ASYM));
+	if (is_flag_set(pause_map, SL_LINK_CONFIG_PAUSE_SYM))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_pause_str(SL_LINK_CONFIG_PAUSE_SYM));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t hpe_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	int                  idx;
+	char                 output[80];
+	u32                  hpe_map;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_hpe_map_get(ctrl_link, &hpe_map);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "hpe map show (link = 0x%p, map = 0x%X)", ctrl_link, hpe_map);
+
+	if (hpe_map == 0)
+		return sysfs_emit(buf, "none\n");
+
+	idx = 0;
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_LINKTRAIN))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_LINKTRAIN));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_PRECODING))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_PRECODING));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_PCAL))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_PCAL));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_R3))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R3));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_R2))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R2));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_C3))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R3));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_C2))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_R2));
+	if (is_flag_set(hpe_map, SL_LINK_CONFIG_HPE_LLR))
+		idx += snprintf(output + idx, sizeof(output) - idx, "%s ",
+			sl_link_config_hpe_str(SL_LINK_CONFIG_HPE_LLR));
+	if (!idx)
+		return sysfs_emit(buf, "none\n");
+	output[idx - 1] = '\0';
+
+	return sysfs_emit(buf, "%s\n", output);
+}
+
+static ssize_t autoneg_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_config_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "autoneg show (options = 0x%X)", options);
+
+	if (is_flag_set(options, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		return sysfs_emit(buf, "enabled\n");
+
+	if (is_flag_set(options, SL_LINK_CONFIG_OPT_AUTONEG_CONTINUOUS_ENABLE))
+		return sysfs_emit(buf, "enabled-continuous\n");
+
+	return sysfs_emit(buf, "disabled\n");
+}
+
+static ssize_t loopback_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_config_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "loopback show (options = 0x%X)", options);
+
+	if (is_flag_set(options, SL_LINK_CONFIG_OPT_HEADSHELL_LOOPBACK_ENABLE))
+		return sysfs_emit(buf, "enabled-headshell\n");
+
+	if (is_flag_set(options, SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE))
+		return sysfs_emit(buf, "enabled-remote\n");
+
+	return sysfs_emit(buf, "disabled\n");
+}
+
+static ssize_t auto_lane_degrade_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_config_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "auto lane degrade show (options = 0x%X)", options);
+
+	if (is_flag_set(options, SL_LINK_CONFIG_OPT_ALD_ENABLE))
+		return sysfs_emit(buf, "enabled\n");
+
+	return sysfs_emit(buf, "disabled\n");
+}
+
+static ssize_t pml_recovery_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, config_kobj);
+
+	rtn = sl_ctrl_data_link_config_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "pml recovery show (options = 0x%X)", options);
+
+	if (is_flag_set(options, SL_LINK_CONFIG_OPT_PML_REC_ENABLE))
+		return sysfs_emit(buf, "enabled\n");
+
+	return sysfs_emit(buf, "disabled\n");
+}
+
+static struct kobj_attribute link_up_timeout_ms    = __ATTR_RO(link_up_timeout_ms);
+static struct kobj_attribute link_up_tries_max_ms  = __ATTR_RO(link_up_tries_max);
+static struct kobj_attribute fec_up_settle_wait_ms = __ATTR_RO(fec_up_settle_wait_ms);
+static struct kobj_attribute fec_up_check_wait_ms  = __ATTR_RO(fec_up_check_wait_ms);
+static struct kobj_attribute fec_up_ucw_limit      = __ATTR_RO(fec_up_ucw_limit);
+static struct kobj_attribute fec_up_ccw_limit      = __ATTR_RO(fec_up_ccw_limit);
+static struct kobj_attribute lock                  = __ATTR_RO(lock);
+static struct kobj_attribute pause_map             = __ATTR_RO(pause_map);
+static struct kobj_attribute hpe_map               = __ATTR_RO(hpe_map);
+static struct kobj_attribute autoneg               = __ATTR_RO(autoneg);
+static struct kobj_attribute loopback              = __ATTR_RO(loopback);
+static struct kobj_attribute auto_lane_degrade     = __ATTR_RO(auto_lane_degrade);
+static struct kobj_attribute pml_recovery          = __ATTR_RO(pml_recovery);
+
+static struct attribute *link_config_attrs[] = {
+	&link_up_timeout_ms.attr,
+	&link_up_tries_max_ms.attr,
+	&fec_up_settle_wait_ms.attr,
+	&fec_up_check_wait_ms.attr,
+	&fec_up_ucw_limit.attr,
+	&fec_up_ccw_limit.attr,
+	&lock.attr,
+	&pause_map.attr,
+	&hpe_map.attr,
+	&autoneg.attr,
+	&loopback.attr,
+	&auto_lane_degrade.attr,
+	&pml_recovery.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_config);
+
+static struct kobj_type link_config = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_config_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_config_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link config create (num = %u)", ctrl_link->num);
+
+	rtn = kobject_init_and_add(&ctrl_link->config_kobj, &link_config, &ctrl_link->kobj, "config");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link config create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->config_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_config_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link config delete (num = %u)", ctrl_link->num);
+
+	kobject_put(&ctrl_link->config_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_counters.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_counters.c
new file mode 100644
index 000000000000..fdfb84636d0e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_counters.c
@@ -0,0 +1,1498 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025,2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_link.h"
+#include "sl_core_link.h"
+#include "sl_ctrl_link_counters.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t link_up_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_retry_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_RETRY, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up retry show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_down_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_DOWN_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link down cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_down_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_DOWN, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link down show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_canceled_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_CANCELED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up canceled show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_cancel_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_CANCEL_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up cancel cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_reset_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_RESET_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link reset cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_fault_async_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_FAULT_ASYNC, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link fault async show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_ccw_warn_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_CCW_WARN_CROSSED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link ccw warn crossed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_ucw_warn_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UCW_WARN_CROSSED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link ucw warn crossed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_down_ccw_limit_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_DOWN_CCW_LIMIT_CROSSED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link down ccw limit crossed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_down_ucw_limit_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_DOWN_UCW_LIMIT_CROSSED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link down ucw limit crossed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_down_ccw_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_DOWN_CCW_CAUSE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link down ccw cause show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_down_ucw_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_DOWN_UCW_CAUSE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link down ucw cause show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_fail_ccw_limit_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_FAIL_CCW_LIMIT_CROSSED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up fail ccw limit crossed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_up_fail_ucw_limit_crossed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_UP_FAIL_UCW_LIMIT_CROSSED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link up fail ucw limit crossed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_autoneg_np_retry_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_retry_count_get(ctrl_link, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link autoneg np retry show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t link_autoneg_attempt_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_counters_get(ctrl_link, LINK_HW_AN_ATTEMPT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link autoneg attempt show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_ucw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_UCW, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause ucw show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_lf_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_LF, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause lf show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_rf_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_RF, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause rf show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_down_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_DOWN, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause down show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_up_tries_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_UP_TRIES, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause up tries show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_autoneg_nomatch_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_AUTONEG_NOMATCH, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause autoneg nomatch show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_autoneg_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_AUTONEG, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause autoneg show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_config_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_CONFIG, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause config show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_intr_enable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_INTR_ENABLE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause intr enable show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_timeout_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_TIMEOUT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause timeout show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_canceled_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_CANCELED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause canceled show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_unsupported_cable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_UNSUPPORTED_CABLE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause unsupported cable show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_command_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_COMMAND, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause command show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_downshift_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_DOWNSHIFT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause downshift show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_llr_replay_max_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_LLR_REPLAY_MAX, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause llr replay max show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_upshift_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_UPSHIFT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause upshift show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_autoneg_config_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_AUTONEG_CONFIG, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause autoneg config show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_pcs_fault_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_PCS_FAULT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause pcs fault show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_serdes_pll_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_SERDES_PLL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause serdes pll show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_serdes_config_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_SERDES_CONFIG, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause serdes config show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_serdes_signal_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_SERDES_SIGNAL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause serdes signal show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_serdes_quality_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_SERDES_QUALITY, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause serdes quality show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_no_media_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_NO_MEDIA, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause no media show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_ccw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_CCW, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause ccw show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_hot_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_MEDIA_HOT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause hot show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_warm_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_MEDIA_WARM, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause warm show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_intr_register_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_INTR_REGISTER, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause intr register show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_media_error_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_MEDIA_ERROR, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause media error show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_up_canceled_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_UP_CANCELED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause up canceled show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_unsupported_speed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_UNSUPPORTED_SPEED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause unsupported speed show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_ss200_cable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_SS200_CABLE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause ss200 cable show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_tx_lol_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_TX_LOL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause tx lol show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_rx_lol_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_RX_LOL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause rx lol show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_tx_los_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_TX_LOS, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause tx los show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_rx_los_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_cause_counters_get(ctrl_link, LINK_CAUSE_RX_LOS, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link cause rx los show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_lp_caps_serdes_link_up_fail_show(struct kobject *kobj,
+							 struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_LP_CAPS_SERDES_LINK_UP_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause lp caps serdes link up fail show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_lp_caps_not_complete_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_LP_CAPS_NOT_COMPLETE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause lp caps not complete show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_not_complete_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_NOT_COMPLETE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause not complete show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_test_caps_nomatch_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_TEST_CAPS_NOMATCH, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause test caps nomatch show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_serdes_link_up_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_SERDES_LINK_UP_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause serdes link up fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_bp_store_state_bad_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_BP_STORE_STATE_BAD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause bp store state bad show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_bp_store_lp_ability_not_set_show(struct kobject *kobj, struct kobj_attribute *kattr,
+							 char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_BP_STORE_LP_ABILITY_NOT_SET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause bp store lp ability not set show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_bp_store_state_error_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_BP_STORE_STATE_ERROR, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause bp store state error show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_bp_store_bp_not_set_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_BP_STORE_BP_NOT_SET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause bp store bp not set show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_bp_send_intr_enable_fail_show(struct kobject *kobj, struct kobj_attribute *kattr,
+						      char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_BP_SEND_INTR_ENABLE_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause bp send intr enable fail show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_np_store_state_bad_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_NP_STORE_STATE_BAD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause np store state bad show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_np_store_bp_set_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_NP_STORE_BP_SET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause np store state bp set show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_np_check_state_bad_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_NP_CHECK_STATE_BAD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause np check state bad show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_intr_state_invalid_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_INTR_STATE_INVALID, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause intr state invalid show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_intr_an_retry_np_send_fail_show(struct kobject *kobj, struct kobj_attribute *kattr,
+							char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_INTR_AN_RETRY_NP_SEND_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause intr an retry np send fail show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_intr_out_of_pages_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_INTR_OUT_OF_PAGES, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause intr out og pages show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_intr_np_send_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_INTR_NP_SEND_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause intr np send fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_pages_decode_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause pages decode fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_pages_decode_no_bp_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_NO_BP, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause pages decode no bp show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t an_cause_pages_decode_oui_invalid_show(struct kobject *kobj, struct kobj_attribute *kattr,
+						      char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  counter;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, counters_kobj);
+
+	rtn = sl_ctrl_link_an_cause_counters_get(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_OUI_INVALID, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link an cause pages decode oui invalid show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static struct kobj_attribute link_up_cmd                    = __ATTR_RO(link_up_cmd);
+static struct kobj_attribute link_up_retry                  = __ATTR_RO(link_up_retry);
+static struct kobj_attribute link_up                        = __ATTR_RO(link_up);
+static struct kobj_attribute link_up_fail                   = __ATTR_RO(link_up_fail);
+static struct kobj_attribute link_down_cmd                  = __ATTR_RO(link_down_cmd);
+static struct kobj_attribute link_down                      = __ATTR_RO(link_down);
+static struct kobj_attribute link_up_cancel_cmd             = __ATTR_RO(link_up_cancel_cmd);
+static struct kobj_attribute link_up_canceled               = __ATTR_RO(link_up_canceled);
+static struct kobj_attribute link_reset_cmd                 = __ATTR_RO(link_reset_cmd);
+static struct kobj_attribute link_fault_async               = __ATTR_RO(link_fault_async);
+static struct kobj_attribute link_ccw_warn_crossed          = __ATTR_RO(link_ccw_warn_crossed);
+static struct kobj_attribute link_ucw_warn_crossed          = __ATTR_RO(link_ucw_warn_crossed);
+static struct kobj_attribute link_down_ccw_limit_crossed    = __ATTR_RO(link_down_ccw_limit_crossed);
+static struct kobj_attribute link_down_ucw_limit_crossed    = __ATTR_RO(link_down_ucw_limit_crossed);
+static struct kobj_attribute link_down_ccw_cause            = __ATTR_RO(link_down_ccw_cause);
+static struct kobj_attribute link_down_ucw_cause            = __ATTR_RO(link_down_ucw_cause);
+static struct kobj_attribute link_up_fail_ccw_limit_crossed = __ATTR_RO(link_up_fail_ccw_limit_crossed);
+static struct kobj_attribute link_up_fail_ucw_limit_crossed = __ATTR_RO(link_up_fail_ucw_limit_crossed);
+static struct kobj_attribute link_autoneg_np_retry          = __ATTR_RO(link_autoneg_np_retry);
+static struct kobj_attribute link_autoneg_attempt           = __ATTR_RO(link_autoneg_attempt);
+
+static struct kobj_attribute link_cause_ucw               = __ATTR_RO(cause_ucw);
+static struct kobj_attribute link_cause_lf                = __ATTR_RO(cause_lf);
+static struct kobj_attribute link_cause_rf                = __ATTR_RO(cause_rf);
+static struct kobj_attribute link_cause_down              = __ATTR_RO(cause_down);
+static struct kobj_attribute link_cause_up_tries          = __ATTR_RO(cause_up_tries);
+static struct kobj_attribute link_cause_autoneg_nomatch   = __ATTR_RO(cause_autoneg_nomatch);
+static struct kobj_attribute link_cause_autoneg           = __ATTR_RO(cause_autoneg);
+static struct kobj_attribute link_cause_config            = __ATTR_RO(cause_config);
+static struct kobj_attribute link_cause_intr_enable       = __ATTR_RO(cause_intr_enable);
+static struct kobj_attribute link_cause_timeout           = __ATTR_RO(cause_timeout);
+static struct kobj_attribute link_cause_canceled          = __ATTR_RO(cause_canceled);
+static struct kobj_attribute link_cause_unsupported_cable = __ATTR_RO(cause_unsupported_cable);
+static struct kobj_attribute link_cause_command           = __ATTR_RO(cause_command);
+static struct kobj_attribute link_cause_downshift         = __ATTR_RO(cause_downshift);
+static struct kobj_attribute link_cause_llr_replay_max    = __ATTR_RO(cause_llr_replay_max);
+static struct kobj_attribute link_cause_upshift           = __ATTR_RO(cause_upshift);
+static struct kobj_attribute link_cause_autoneg_config    = __ATTR_RO(cause_autoneg_config);
+static struct kobj_attribute link_cause_pcs_fault         = __ATTR_RO(cause_pcs_fault);
+static struct kobj_attribute link_cause_serdes_pll        = __ATTR_RO(cause_serdes_pll);
+static struct kobj_attribute link_cause_serdes_config     = __ATTR_RO(cause_serdes_config);
+static struct kobj_attribute link_cause_serdes_signal     = __ATTR_RO(cause_serdes_signal);
+static struct kobj_attribute link_cause_serdes_quality    = __ATTR_RO(cause_serdes_quality);
+static struct kobj_attribute link_cause_no_media          = __ATTR_RO(cause_no_media);
+static struct kobj_attribute link_cause_ccw               = __ATTR_RO(cause_ccw);
+static struct kobj_attribute link_cause_hot               = __ATTR_RO(cause_hot);
+static struct kobj_attribute link_cause_warm              = __ATTR_RO(cause_warm);
+static struct kobj_attribute link_cause_intr_register     = __ATTR_RO(cause_intr_register);
+static struct kobj_attribute link_cause_media_error       = __ATTR_RO(cause_media_error);
+static struct kobj_attribute link_cause_up_canceled       = __ATTR_RO(cause_up_canceled);
+static struct kobj_attribute link_cause_unsupported_speed = __ATTR_RO(cause_unsupported_speed);
+static struct kobj_attribute link_cause_ss200_cable       = __ATTR_RO(cause_ss200_cable);
+static struct kobj_attribute link_cause_tx_lol            = __ATTR_RO(cause_tx_lol);
+static struct kobj_attribute link_cause_rx_lol            = __ATTR_RO(cause_rx_lol);
+static struct kobj_attribute link_cause_tx_los            = __ATTR_RO(cause_tx_los);
+static struct kobj_attribute link_cause_rx_los            = __ATTR_RO(cause_rx_los);
+
+static struct kobj_attribute link_an_cause_lp_caps_serdes_link_up_fail =
+			     __ATTR_RO(an_cause_lp_caps_serdes_link_up_fail);
+static struct kobj_attribute link_an_cause_lp_caps_not_complete        = __ATTR_RO(an_cause_lp_caps_not_complete);
+static struct kobj_attribute link_an_cause_not_complete                = __ATTR_RO(an_cause_not_complete);
+static struct kobj_attribute link_an_cause_test_caps_nomatch           = __ATTR_RO(an_cause_test_caps_nomatch);
+static struct kobj_attribute link_an_cause_serdes_link_up_fail         = __ATTR_RO(an_cause_serdes_link_up_fail);
+static struct kobj_attribute link_an_cause_bp_store_state_bad          = __ATTR_RO(an_cause_bp_store_state_bad);
+static struct kobj_attribute link_an_cause_bp_store_lp_ability_not_set =
+			     __ATTR_RO(an_cause_bp_store_lp_ability_not_set);
+static struct kobj_attribute link_an_cause_bp_store_state_error        = __ATTR_RO(an_cause_bp_store_state_error);
+static struct kobj_attribute link_an_cause_bp_store_bp_not_set         = __ATTR_RO(an_cause_bp_store_bp_not_set);
+static struct kobj_attribute link_an_cause_bp_send_intr_enable_fail    =
+			     __ATTR_RO(an_cause_bp_send_intr_enable_fail);
+static struct kobj_attribute link_an_cause_np_store_state_bad          = __ATTR_RO(an_cause_np_store_state_bad);
+static struct kobj_attribute link_an_cause_np_store_bp_set             = __ATTR_RO(an_cause_np_store_bp_set);
+static struct kobj_attribute link_an_cause_np_check_state_bad          = __ATTR_RO(an_cause_np_check_state_bad);
+static struct kobj_attribute link_an_cause_intr_state_invalid          = __ATTR_RO(an_cause_intr_state_invalid);
+static struct kobj_attribute link_an_cause_intr_an_retry_np_send_fail  =
+			     __ATTR_RO(an_cause_intr_an_retry_np_send_fail);
+static struct kobj_attribute link_an_cause_intr_out_of_pages           = __ATTR_RO(an_cause_intr_out_of_pages);
+static struct kobj_attribute link_an_cause_intr_np_send_fail           = __ATTR_RO(an_cause_intr_np_send_fail);
+static struct kobj_attribute link_an_cause_pages_decode_fail           = __ATTR_RO(an_cause_pages_decode_fail);
+static struct kobj_attribute link_an_cause_pages_decode_no_bp          = __ATTR_RO(an_cause_pages_decode_no_bp);
+static struct kobj_attribute link_an_cause_pages_decode_oui_invalid    =
+			     __ATTR_RO(an_cause_pages_decode_oui_invalid);
+
+static struct attribute *link_counters_attrs[] = {
+	&link_up_cmd.attr,
+	&link_up_retry.attr,
+	&link_up.attr,
+	&link_up_fail.attr,
+	&link_down_cmd.attr,
+	&link_down.attr,
+	&link_up_cancel_cmd.attr,
+	&link_up_canceled.attr,
+	&link_reset_cmd.attr,
+	&link_fault_async.attr,
+	&link_ccw_warn_crossed.attr,
+	&link_ucw_warn_crossed.attr,
+	&link_down_ccw_limit_crossed.attr,
+	&link_down_ucw_limit_crossed.attr,
+	&link_down_ccw_cause.attr,
+	&link_down_ucw_cause.attr,
+	&link_up_fail_ccw_limit_crossed.attr,
+	&link_up_fail_ucw_limit_crossed.attr,
+	&link_autoneg_np_retry.attr,
+	&link_autoneg_attempt.attr,
+	&link_cause_ucw.attr,
+	&link_cause_lf.attr,
+	&link_cause_rf.attr,
+	&link_cause_down.attr,
+	&link_cause_up_tries.attr,
+	&link_cause_autoneg_nomatch.attr,
+	&link_cause_autoneg.attr,
+	&link_cause_config.attr,
+	&link_cause_intr_enable.attr,
+	&link_cause_timeout.attr,
+	&link_cause_canceled.attr,
+	&link_cause_unsupported_cable.attr,
+	&link_cause_command.attr,
+	&link_cause_downshift.attr,
+	&link_cause_llr_replay_max.attr,
+	&link_cause_upshift.attr,
+	&link_cause_autoneg_config.attr,
+	&link_cause_pcs_fault.attr,
+	&link_cause_serdes_pll.attr,
+	&link_cause_serdes_config.attr,
+	&link_cause_serdes_signal.attr,
+	&link_cause_serdes_quality.attr,
+	&link_cause_no_media.attr,
+	&link_cause_ccw.attr,
+	&link_cause_hot.attr,
+	&link_cause_warm.attr,
+	&link_cause_intr_register.attr,
+	&link_cause_media_error.attr,
+	&link_cause_up_canceled.attr,
+	&link_cause_unsupported_speed.attr,
+	&link_cause_ss200_cable.attr,
+	&link_cause_tx_lol.attr,
+	&link_cause_rx_lol.attr,
+	&link_cause_tx_los.attr,
+	&link_cause_rx_los.attr,
+	&link_an_cause_lp_caps_serdes_link_up_fail.attr,
+	&link_an_cause_lp_caps_not_complete.attr,
+	&link_an_cause_not_complete.attr,
+	&link_an_cause_test_caps_nomatch.attr,
+	&link_an_cause_serdes_link_up_fail.attr,
+	&link_an_cause_bp_store_state_bad.attr,
+	&link_an_cause_bp_store_lp_ability_not_set.attr,
+	&link_an_cause_bp_store_state_error.attr,
+	&link_an_cause_bp_store_bp_not_set.attr,
+	&link_an_cause_bp_send_intr_enable_fail.attr,
+	&link_an_cause_np_store_state_bad.attr,
+	&link_an_cause_np_store_bp_set.attr,
+	&link_an_cause_np_check_state_bad.attr,
+	&link_an_cause_intr_state_invalid.attr,
+	&link_an_cause_intr_an_retry_np_send_fail.attr,
+	&link_an_cause_intr_out_of_pages.attr,
+	&link_an_cause_intr_np_send_fail.attr,
+	&link_an_cause_pages_decode_fail.attr,
+	&link_an_cause_pages_decode_no_bp.attr,
+	&link_an_cause_pages_decode_oui_invalid.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_counters);
+
+static struct kobj_type link_counters = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_counters_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_counters_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link counters create");
+
+	rtn = kobject_init_and_add(&ctrl_link->counters_kobj, &link_counters, &ctrl_link->kobj, "counters");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link counters create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->counters_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_counters_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link counters delete");
+	kobject_put(&ctrl_link->counters_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_degrade.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_degrade.c
new file mode 100644
index 000000000000..3ba254a54560
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_degrade.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include "sl_log.h"
+#include "data/sl_core_data_link.h"
+
+#include "sl_sysfs.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	int                  degrade_state;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_core_data_link_degrade_state_get(core_link, &degrade_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "degrade state show (state = %u %s)",
+		   degrade_state, sl_link_degrade_state_str(degrade_state));
+
+	return sysfs_emit(buf, "%s\n", sl_link_degrade_state_str(degrade_state));
+}
+
+static ssize_t is_rx_degraded_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	bool                 is_rx_degraded;
+	u32                  link_state;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_core_data_link_is_rx_degrade_get(core_link, &is_rx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "is rx degraded show (is_rx_degraded = %s)",
+		   is_rx_degraded ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_rx_degraded ? "yes" : "no");
+}
+
+static ssize_t rx_degrade_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	u8                   rx_degrade_map;
+	bool                 is_rx_degraded;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_is_rx_degrade_get(core_link, &is_rx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (!is_rx_degraded)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_degrade_rx_degrade_map_get(core_link, &rx_degrade_map);
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "--\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "rx degrade lane map show (rx_degrade_map = 0x%X)", rx_degrade_map);
+
+	return sysfs_emit(buf, "0x%X\n", rx_degrade_map);
+}
+
+static ssize_t rx_link_speed_gbps_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	u16                  link_speed;
+	bool                 is_rx_degraded;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_is_rx_degrade_get(core_link, &is_rx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (!is_rx_degraded)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_degrade_rx_link_speed_get(core_link, &link_speed);
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "--\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "rx degrade link speed gbps show (link_speed = %u)", link_speed);
+
+	return sysfs_emit(buf, "%u\n", link_speed);
+}
+
+static ssize_t is_tx_degraded_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	bool                 is_tx_degraded;
+	u32                  link_state;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_core_data_link_is_tx_degrade_get(core_link, &is_tx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "is tx degraded show (degrade = %s)",
+		   is_tx_degraded ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_tx_degraded ? "yes" : "no");
+}
+
+static ssize_t tx_degrade_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	u8                   tx_degrade_map;
+	bool                 is_tx_degraded;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_is_tx_degrade_get(core_link, &is_tx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (!is_tx_degraded)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_degrade_tx_degrade_map_get(core_link, &tx_degrade_map);
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "--\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "tx degrade lane map show (tx_degrade_map = 0x%X)", tx_degrade_map);
+
+	return sysfs_emit(buf, "0x%X\n", tx_degrade_map);
+}
+
+static ssize_t tx_link_speed_gbps_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	u16                  link_speed;
+	bool                 is_tx_degraded;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_is_tx_degrade_get(core_link, &is_tx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (!is_tx_degraded)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_degrade_tx_link_speed_get(core_link, &link_speed);
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "--\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "tx degrade link speed gbps show (link_speed = %u)", link_speed);
+
+	return sysfs_emit(buf, "%u\n", link_speed);
+}
+
+static ssize_t is_recoverable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	bool                 is_tx_degraded;
+	bool                 is_rx_degraded;
+	bool                 is_recoverable;
+
+	core_link = container_of(kobj, struct sl_core_link, degrade_kobj);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (link_state != SL_CORE_LINK_STATE_UP)
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_core_data_link_is_tx_degrade_get(core_link, &is_tx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	rtn = sl_core_data_link_is_rx_degrade_get(core_link, &is_rx_degraded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (!is_rx_degraded && !is_tx_degraded)
+		return sysfs_emit(buf, "--\n");
+
+	rtn = sl_core_data_link_degrade_is_recoverable_get(core_link, &is_recoverable);
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "inactive\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "is recoverable show (is_recoverable = %s)", is_recoverable ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_recoverable ? "yes" : "no");
+}
+
+static struct kobj_attribute link_degrade_state              = __ATTR_RO(state);
+static struct kobj_attribute link_is_rx_degraded             = __ATTR_RO(is_rx_degraded);
+static struct kobj_attribute link_rx_degrade_lane_map        = __ATTR_RO(rx_degrade_map);
+static struct kobj_attribute link_rx_degrade_link_speed_gbps = __ATTR_RO(rx_link_speed_gbps);
+static struct kobj_attribute link_is_tx_degraded             = __ATTR_RO(is_tx_degraded);
+static struct kobj_attribute link_tx_degrade_lane_map        = __ATTR_RO(tx_degrade_map);
+static struct kobj_attribute link_tx_degrade_link_speed_gbps = __ATTR_RO(tx_link_speed_gbps);
+static struct kobj_attribute link_is_recoverable             = __ATTR_RO(is_recoverable);
+
+static struct attribute *link_degrade_attrs[] = {
+	&link_degrade_state.attr,
+	&link_is_rx_degraded.attr,
+	&link_rx_degrade_lane_map.attr,
+	&link_rx_degrade_link_speed_gbps.attr,
+	&link_is_tx_degraded.attr,
+	&link_tx_degrade_lane_map.attr,
+	&link_tx_degrade_link_speed_gbps.attr,
+	&link_is_recoverable.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_degrade);
+
+static struct kobj_type link_degrade = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_degrade_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_degrade_create(struct sl_core_link *core_link, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "link degrade create (num = %u)", core_link->num);
+
+	rtn = kobject_init_and_add(&core_link->degrade_kobj, &link_degrade, parent_kobj, "auto_lane_degrade");
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+			   "link degrade create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&core_link->degrade_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_degrade_delete(struct sl_core_link *core_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "link degrade delete (num = %u)", core_link->num);
+
+	kobject_put(&core_link->degrade_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec.c
new file mode 100644
index 000000000000..37edb89f8595
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_core_link.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_link_fec.h"
+#include "sl_sysfs_link_fec_current.h"
+#include "sl_sysfs_link_fec_mon_check.h"
+#include "sl_sysfs_link_fec_up_check.h"
+#include "sl_sysfs_link_fec_up.h"
+#include "sl_sysfs_link_fec_down.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t monitor_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  state;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.kobj);
+
+	rtn = sl_ctrl_link_fec_mon_state_get(ctrl_link, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "monitor state show (link = 0x%p, state = %u, %s)", ctrl_link, state,
+		   sl_ctrl_link_fec_mon_state_str(state));
+
+	return sysfs_emit(buf, "%s\n", sl_ctrl_link_fec_mon_state_str(state));
+}
+
+static struct kobj_attribute fec_monitor_state = __ATTR_RO(monitor_state);
+
+static struct attribute *link_fec_attrs[] = {
+	&fec_monitor_state.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec);
+
+static struct kobj_type link_fec = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_fec_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int                  rtn;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link fec create (num = %u)", ctrl_link->num);
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return -ENODEV;
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.kobj, &link_fec, &ctrl_link->kobj, "fec");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->fec.kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_fec_current_create(core_link, &ctrl_link->fec.kobj);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec current create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->fec.kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_fec_mon_check_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME, "fec mon check create failed [%d]", rtn);
+		sl_sysfs_link_fec_current_delete(core_link);
+		kobject_put(&ctrl_link->fec.kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_fec_up_check_create(core_link, &ctrl_link->fec.kobj);
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME, "fec up check create failed [%d]", rtn);
+		sl_sysfs_link_fec_current_delete(core_link);
+		sl_sysfs_link_fec_mon_check_delete(ctrl_link);
+		kobject_put(&ctrl_link->fec.kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_fec_up_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec up create kobject_init_and_add failed [%d]", rtn);
+		sl_sysfs_link_fec_current_delete(core_link);
+		sl_sysfs_link_fec_mon_check_delete(ctrl_link);
+		sl_sysfs_link_fec_up_check_delete(core_link);
+		kobject_put(&ctrl_link->fec.kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_link_fec_down_create(ctrl_link);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec down create kobject_init_and_add failed [%d]", rtn);
+		sl_sysfs_link_fec_current_delete(core_link);
+		sl_sysfs_link_fec_mon_check_delete(ctrl_link);
+		sl_sysfs_link_fec_up_check_delete(core_link);
+		sl_sysfs_link_fec_up_delete(ctrl_link);
+		kobject_put(&ctrl_link->fec.kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_fec_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link fec delete (num = %u)", ctrl_link->num);
+
+	core_link = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!core_link)
+		return;
+
+	sl_sysfs_link_fec_current_delete(core_link);
+	sl_sysfs_link_fec_mon_check_delete(ctrl_link);
+	sl_sysfs_link_fec_up_check_delete(core_link);
+	sl_sysfs_link_fec_up_delete(ctrl_link);
+	sl_sysfs_link_fec_down_delete(ctrl_link);
+	kobject_put(&ctrl_link->fec.kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_current.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_current.c
new file mode 100644
index 000000000000..30514651d6fe
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_current.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_core_link.h"
+
+#include "sl_sysfs_link_fec_current.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t ccw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	u64                  ccw;
+	struct sl_core_link *core_link;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.current_kobj);
+
+	rtn = sl_core_link_fec_ccw_get(core_link, &ccw);
+	if (rtn == -ENOLINK) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "ccw show sl_core_link_fec_ccw_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-link\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "ccw show sl_core_link_fec_ccw_get failed [%d]", rtn);
+		return sysfs_emit(buf, "io-error\n");
+	}
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "ccw show (ccw = %llu)", ccw);
+
+	return sysfs_emit(buf, "%llu\n", ccw);
+}
+
+static ssize_t ucw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	u64                  ucw;
+	struct sl_core_link *core_link;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.current_kobj);
+
+	rtn = sl_core_link_fec_ucw_get(core_link, &ucw);
+	if (rtn == -ENOLINK) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "ucw show sl_core_link_fec_ucw_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-link\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "ucw show sl_core_link_fec_ucw_get failed [%d]", rtn);
+		return sysfs_emit(buf, "io-error\n");
+	}
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "ucw show (ucw = %llu)", ucw);
+
+	return sysfs_emit(buf, "%llu\n", ucw);
+}
+
+static ssize_t gcw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int		     rtn;
+	u64                  gcw;
+	struct sl_core_link *core_link;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.current_kobj);
+
+	rtn = sl_core_link_fec_gcw_get(core_link, &gcw);
+	if (rtn == -ENOLINK) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "gcw show sl_core_link_fec_gcw_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-link\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "gcw show sl_core_link_fec_gcw_get failed [%d]", rtn);
+		return sysfs_emit(buf, "io-error\n");
+	}
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "gcw show (link = 0x%p, gcw = %llu)", core_link, gcw);
+
+	return sysfs_emit(buf, "%llu\n", gcw);
+}
+
+static struct kobj_attribute link_fec_ccw = __ATTR_RO(ccw);
+static struct kobj_attribute link_fec_ucw = __ATTR_RO(ucw);
+static struct kobj_attribute link_fec_gcw = __ATTR_RO(gcw);
+
+static struct attribute *link_fec_current_attrs[] = {
+	&link_fec_ccw.attr,
+	&link_fec_ucw.attr,
+	&link_fec_gcw.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_current);
+
+static struct kobj_type link_fec_current = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_current_groups,
+};
+
+static struct attribute *link_fec_current_lane_attrs[] = {
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_current_lane);
+
+static struct kobj_type link_fec_current_lane = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_current_lane_groups,
+};
+
+static ssize_t link_fec_current_fecl_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                            rtn;
+	struct sl_core_link_fecl_kobj *fecl_kobj;
+	struct sl_core_link           *core_link;
+	u8                             fecl_num;
+	u64                            fecl;
+
+	fecl_kobj = container_of(kobj, struct sl_core_link_fecl_kobj, kobj);
+
+	core_link = fecl_kobj->core_link;
+
+	fecl_num = ((4 * fecl_kobj->lane_num) + num);
+
+	rtn = sl_core_link_fec_lane_cntr_get(core_link, fecl_num, &fecl);
+	if (rtn == -ENOLINK) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "current fecl show sl_core_link_fec_lane_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-link\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "current fecl show sl_core_link_fec_lane_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "io-error\n");
+	}
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "current fecl show (num = %u, lane_num = %u, fecl %u = %llu)",
+		   num, fecl_kobj->lane_num, fecl_num, fecl);
+
+	return sysfs_emit(buf, "%llu\n", fecl);
+}
+
+#define link_fec_current_fecl(_num)                                                                            \
+	static inline ssize_t fecl##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                      \
+		return link_fec_current_fecl_show(kobj, kattr, buf, (_num));                                   \
+	}                                                                                                      \
+	static struct kobj_attribute link_fecl##_num = __ATTR_RO(fecl##_num)
+
+static ssize_t link_fec_current_bin_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u64                  ccw_bin;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.current_tail_kobj);
+
+	rtn = sl_core_link_fec_tail_cntr_get(core_link, num, &ccw_bin);
+	if (rtn == -ENOLINK) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "current bin show sl_core_link_fec_tail_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-link\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(core_link, LOG_BLOCK, LOG_NAME,
+				 "current bin show sl_core_link_fec_tail_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "io-error\n");
+	}
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "current bin show (bin %u = %llu)", num, ccw_bin);
+
+	return sysfs_emit(buf, "%llu\n", ccw_bin);
+}
+
+#define link_fec_current_tail0(_num)                                                                    \
+	static ssize_t bin0##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                               \
+		return link_fec_current_bin_show(kobj, kattr, buf, _num);                               \
+	}                                                                                               \
+	static struct kobj_attribute fec_bin0##_num = __ATTR_RO(bin0##_num)
+
+#define link_fec_current_tail(_num)                                                                           \
+	static inline ssize_t bin##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                     \
+		return link_fec_current_bin_show(kobj, kattr, buf, (_num));                                   \
+	}                                                                                                     \
+	static struct kobj_attribute fec_bin##_num = __ATTR_RO(bin##_num)
+
+link_fec_current_fecl(0);
+link_fec_current_fecl(1);
+link_fec_current_fecl(2);
+link_fec_current_fecl(3);
+
+static struct attribute *link_fec_current_fecl_attrs[] = {
+	&link_fecl0.attr,
+	&link_fecl1.attr,
+	&link_fecl2.attr,
+	&link_fecl3.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_current_fecl);
+
+static struct kobj_type link_fec_current_fecl = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_current_fecl_groups,
+};
+
+link_fec_current_tail0(0);
+link_fec_current_tail0(1);
+link_fec_current_tail0(2);
+link_fec_current_tail0(3);
+link_fec_current_tail0(4);
+link_fec_current_tail0(5);
+link_fec_current_tail0(6);
+link_fec_current_tail0(7);
+link_fec_current_tail0(8);
+link_fec_current_tail0(9);
+link_fec_current_tail(10);
+link_fec_current_tail(11);
+link_fec_current_tail(12);
+link_fec_current_tail(13);
+link_fec_current_tail(14);
+
+static struct attribute *link_fec_current_tail_attrs[] = {
+	&fec_bin00.attr,
+	&fec_bin01.attr,
+	&fec_bin02.attr,
+	&fec_bin03.attr,
+	&fec_bin04.attr,
+	&fec_bin05.attr,
+	&fec_bin06.attr,
+	&fec_bin07.attr,
+	&fec_bin08.attr,
+	&fec_bin09.attr,
+	&fec_bin10.attr,
+	&fec_bin11.attr,
+	&fec_bin12.attr,
+	&fec_bin13.attr,
+	&fec_bin14.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_current_tail);
+
+static struct kobj_type link_fec_current_tail = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_current_tail_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_fec_current_create(struct sl_core_link *core_link, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+	int x;
+	int out;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "link fec current create (num = %u)", core_link->num);
+
+	rtn = kobject_init_and_add(&core_link->fec.current_kobj, &link_fec_current, parent_kobj, "current");
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+			   "link fec current create kobject_init_and_add failed [%d]", rtn);
+		goto out_current;
+	}
+
+	rtn = kobject_init_and_add(&core_link->fec.current_lane_kobj,
+				   &link_fec_current_lane, &core_link->fec.current_kobj, "lane");
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+			   "link fec current lane create kobject_init_and_add failed [%d]", rtn);
+		goto out_current_lane;
+	}
+	for (x = 0; x < SL_MAX_LANES; ++x) {
+		rtn = kobject_init_and_add(&core_link->fec.current_fecl_kobjs[x].kobj,
+					   &link_fec_current_fecl, &core_link->fec.current_lane_kobj, "%d", x);
+		if (rtn) {
+			sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+				   "link fec current fecl create kobject_init_and_add failed [%d]", rtn);
+			goto out_current_fecl;
+		}
+		core_link->fec.current_fecl_kobjs[x].core_link = core_link;
+		core_link->fec.current_fecl_kobjs[x].lane_num = x;
+	}
+
+	rtn = kobject_init_and_add(&core_link->fec.current_tail_kobj,
+				   &link_fec_current_tail, &core_link->fec.current_kobj, "tail");
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+			   "link fec current tail create kobject_init_and_add failed [%d]", rtn);
+		goto out_current_tail;
+	}
+
+	return 0;
+
+out_current_tail:
+	kobject_put(&core_link->fec.current_tail_kobj);
+out_current_fecl:
+	if (x < SL_MAX_LANES)
+		kobject_put(&core_link->fec.current_fecl_kobjs[x].kobj);
+	for (out = 0; out < x; ++out)
+		kobject_put(&core_link->fec.current_fecl_kobjs[out].kobj);
+out_current_lane:
+	kobject_put(&core_link->fec.current_lane_kobj);
+out_current:
+	kobject_put(&core_link->fec.current_kobj);
+
+	return rtn;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_fec_current_delete(struct sl_core_link *core_link)
+{
+#ifdef CONFIG_SYSFS
+	int x;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "link fec current delete (link_num = %u)", core_link->num);
+
+	kobject_put(&core_link->fec.current_tail_kobj);
+	for (x = 0; x < SL_MAX_LANES; ++x)
+		kobject_put(&core_link->fec.current_fecl_kobjs[x].kobj);
+	kobject_put(&core_link->fec.current_lane_kobj);
+	kobject_put(&core_link->fec.current_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_down.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_down.c
new file mode 100644
index 000000000000..6962b2c678da
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_down.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "data/sl_ctrl_data_link.h"
+
+#include "sl_sysfs_link_fec_down.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t ccw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  ccw;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.down_kobj);
+
+	rtn = sl_ctrl_data_link_fec_down_cache_ccw_cntr_get(ctrl_link, &ccw);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "ccw show sl_ctrl_data_link_fec_down_cache_ccw_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "ccw show (link = 0x%p, ccw = %llu)", ctrl_link, ccw);
+
+	return sysfs_emit(buf, "%llu\n", ccw);
+}
+
+static ssize_t ucw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  ucw;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.down_kobj);
+
+	rtn = sl_ctrl_data_link_fec_down_cache_ucw_cntr_get(ctrl_link, &ucw);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "ucw show sl_ctrl_data_link_fec_down_cache_ucw_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "ucw show (link = 0x%p, ucw = %llu)", ctrl_link, ucw);
+
+	return sysfs_emit(buf, "%llu\n", ucw);
+}
+
+static ssize_t gcw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  gcw;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.down_kobj);
+
+	rtn = sl_ctrl_data_link_fec_down_cache_gcw_cntr_get(ctrl_link, &gcw);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "gcw show sl_ctrl_data_link_fec_down_cache_gcw_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "gcw show (link = 0x%p, gcw = %llu)", ctrl_link, gcw);
+
+	return sysfs_emit(buf, "%llu\n", gcw);
+}
+
+static struct kobj_attribute link_fec_ccw = __ATTR_RO(ccw);
+static struct kobj_attribute link_fec_ucw = __ATTR_RO(ucw);
+static struct kobj_attribute link_fec_gcw = __ATTR_RO(gcw);
+
+static struct attribute *link_fec_down_attrs[] = {
+	&link_fec_ccw.attr,
+	&link_fec_ucw.attr,
+	&link_fec_gcw.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_down);
+
+static struct kobj_type link_fec_down = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_down_groups,
+};
+
+static struct attribute *link_fec_down_lane_attrs[] = {
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_down_lane);
+
+static struct kobj_type link_fec_down_lane = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_down_lane_groups,
+};
+
+static ssize_t link_fec_down_fecl_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                            rtn;
+	struct sl_ctrl_link           *ctrl_link;
+	struct sl_ctrl_link_fecl_kobj *fecl_kobj;
+	u8                             fecl_num;
+	u64                            lane_cntr;
+
+	fecl_kobj = container_of(kobj, struct sl_ctrl_link_fecl_kobj, kobj);
+	ctrl_link = fecl_kobj->ctrl_link;
+
+	fecl_num = ((4 * fecl_kobj->lane_num) + num);
+
+	rtn = sl_ctrl_data_link_fec_down_cache_lane_cntr_get(ctrl_link, fecl_num, &lane_cntr);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "current fecl show sl_ctrl_data_link_fec_down_cache_lane_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(fecl_kobj->ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "current fecl show (link = 0x%p, num = %u, lane_num = %u, fecl %u = %llu)",
+		ctrl_link, num, fecl_kobj->lane_num, fecl_num, lane_cntr);
+
+	return sysfs_emit(buf, "%llu\n", lane_cntr);
+}
+
+#define link_fec_down_fecl(_num)                                                                               \
+	static inline ssize_t fecl##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                      \
+		return link_fec_down_fecl_show(kobj, kattr, buf, (_num));                                      \
+	}                                                                                                      \
+	static struct kobj_attribute link_fecl##_num = __ATTR_RO(fecl##_num)
+
+static ssize_t link_fec_down_bin_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  tail_cntr;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.down_tail_kobj);
+
+	rtn = sl_ctrl_data_link_fec_down_cache_tail_cntr_get(ctrl_link, num, &tail_cntr);
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "down bin show sl_ctrl_data_link_fec_down_cache_tail_cntr_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "down bin show (link = 0x%p, bin %u = %llu)",
+		ctrl_link, num, tail_cntr);
+
+	return sysfs_emit(buf, "%llu\n", tail_cntr);
+}
+
+#define link_fec_down_tail0(_num)                                                                       \
+	static ssize_t bin0##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                               \
+		return link_fec_down_bin_show(kobj, kattr, buf, _num);                                  \
+	}                                                                                               \
+	static struct kobj_attribute fec_bin0##_num = __ATTR_RO(bin0##_num)
+
+#define link_fec_down_tail(_num)                                                                              \
+	static inline ssize_t bin##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                     \
+		return link_fec_down_bin_show(kobj, kattr, buf, (_num));                                      \
+	}                                                                                                     \
+	static struct kobj_attribute fec_bin##_num = __ATTR_RO(bin##_num)
+
+link_fec_down_fecl(0);
+link_fec_down_fecl(1);
+link_fec_down_fecl(2);
+link_fec_down_fecl(3);
+
+static struct attribute *link_fec_down_fecl_attrs[] = {
+	&link_fecl0.attr,
+	&link_fecl1.attr,
+	&link_fecl2.attr,
+	&link_fecl3.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_down_fecl);
+
+static struct kobj_type link_fec_down_fecl = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_down_fecl_groups,
+};
+
+link_fec_down_tail0(0);
+link_fec_down_tail0(1);
+link_fec_down_tail0(2);
+link_fec_down_tail0(3);
+link_fec_down_tail0(4);
+link_fec_down_tail0(5);
+link_fec_down_tail0(6);
+link_fec_down_tail0(7);
+link_fec_down_tail0(8);
+link_fec_down_tail0(9);
+link_fec_down_tail(10);
+link_fec_down_tail(11);
+link_fec_down_tail(12);
+link_fec_down_tail(13);
+link_fec_down_tail(14);
+
+static struct attribute *link_fec_down_tail_attrs[] = {
+	&fec_bin00.attr,
+	&fec_bin01.attr,
+	&fec_bin02.attr,
+	&fec_bin03.attr,
+	&fec_bin04.attr,
+	&fec_bin05.attr,
+	&fec_bin06.attr,
+	&fec_bin07.attr,
+	&fec_bin08.attr,
+	&fec_bin09.attr,
+	&fec_bin10.attr,
+	&fec_bin11.attr,
+	&fec_bin12.attr,
+	&fec_bin13.attr,
+	&fec_bin14.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_down_tail);
+
+static struct kobj_type link_fec_down_tail = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_down_tail_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_fec_down_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+	int x;
+	int out;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link fec down create (num = %u)", ctrl_link->num);
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.down_kobj, &link_fec_down,
+				   &ctrl_link->fec.kobj, "down");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec down create kobject_init_and_add failed [%d]", rtn);
+		goto out_down;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.down_lane_kobj,
+				   &link_fec_down_lane, &ctrl_link->fec.down_kobj, "lane");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec down lane create kobject_init_and_add failed [%d]", rtn);
+		goto out_down_lane;
+	}
+	for (x = 0; x < SL_MAX_LANES; ++x) {
+		rtn = kobject_init_and_add(&ctrl_link->fec.down_fecl_kobjs[x].kobj,
+					   &link_fec_down_fecl, &ctrl_link->fec.down_lane_kobj, "%d", x);
+		if (rtn) {
+			sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+				   "link fec down fecl create kobject_init_and_add failed [%d]", rtn);
+			goto out_down_fecl;
+		}
+		ctrl_link->fec.down_fecl_kobjs[x].ctrl_link = ctrl_link;
+		ctrl_link->fec.down_fecl_kobjs[x].lane_num = x;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.down_tail_kobj,
+				   &link_fec_down_tail, &ctrl_link->fec.down_kobj, "tail");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec down tail create kobject_init_and_add failed [%d]", rtn);
+		goto out_down_tail;
+	}
+
+	return 0;
+
+out_down_tail:
+	kobject_put(&ctrl_link->fec.down_tail_kobj);
+out_down_fecl:
+	if (x < SL_MAX_LANES)
+		kobject_put(&ctrl_link->fec.down_fecl_kobjs[x].kobj);
+	for (out = 0; out < x; ++out)
+		kobject_put(&ctrl_link->fec.down_fecl_kobjs[out].kobj);
+out_down_lane:
+	kobject_put(&ctrl_link->fec.down_lane_kobj);
+out_down:
+	kobject_put(&ctrl_link->fec.down_kobj);
+
+	return rtn;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_fec_down_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int x;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link fec down delete (link_num = %u)", ctrl_link->num);
+
+	kobject_put(&ctrl_link->fec.down_tail_kobj);
+	for (x = 0; x < SL_MAX_LANES; ++x)
+		kobject_put(&ctrl_link->fec.down_fecl_kobjs[x].kobj);
+	kobject_put(&ctrl_link->fec.down_lane_kobj);
+	kobject_put(&ctrl_link->fec.down_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_mon_check.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_mon_check.c
new file mode 100644
index 000000000000..f989399518fc
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_mon_check.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "data/sl_ctrl_data_link.h"
+
+#include "sl_sysfs_link_fec_mon_check.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t ucw_down_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  ucw_down_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.mon_check_kobj);
+
+	rtn = sl_ctrl_data_link_fec_mon_ucw_down_limit_get(ctrl_link, &ucw_down_limit);
+	if (rtn == -EBADRQC) {
+		sl_log_warn_trace(ctrl_link, LOG_BLOCK, LOG_NAME,
+				  "ucw down limit show monitoring not enabled");
+		return sysfs_emit(buf, "not-monitoring\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(ctrl_link, LOG_BLOCK, LOG_NAME, "fec_mon_ucw_down_limit_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "ucw down limit show (ucw_down_limit = %d)", ucw_down_limit);
+
+	if (ucw_down_limit == -1)
+		return sysfs_emit(buf, "calculated\n");
+
+	return sysfs_emit(buf, "%d\n", ucw_down_limit);
+}
+
+static ssize_t ucw_warn_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  ucw_warn_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.mon_check_kobj);
+
+	rtn = sl_ctrl_data_link_fec_mon_ucw_warn_limit_get(ctrl_link, &ucw_warn_limit);
+	if (rtn == -EBADRQC) {
+		sl_log_warn_trace(ctrl_link, LOG_BLOCK, LOG_NAME,
+				  "ucw warn limit show monitoring not enabled");
+		return sysfs_emit(buf, "not-monitoring\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(ctrl_link, LOG_BLOCK, LOG_NAME, "fec_mon_ucw_warn_limit_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "ucw warn limit show (ucw_warn_limit = %d)", ucw_warn_limit);
+
+	if (ucw_warn_limit == -1)
+		return sysfs_emit(buf, "calculated\n");
+
+	return sysfs_emit(buf, "%d\n", ucw_warn_limit);
+}
+
+static ssize_t ccw_down_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_link *ctrl_link;
+	s32                  ccw_down_limit;
+	int                  rtn;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.mon_check_kobj);
+
+	rtn = sl_ctrl_data_link_fec_mon_ccw_down_limit_get(ctrl_link, &ccw_down_limit);
+	if (rtn == -EBADRQC) {
+		sl_log_warn_trace(ctrl_link, LOG_BLOCK, LOG_NAME,
+				  "ccw down limit show monitoring not enabled");
+		return sysfs_emit(buf, "not-monitoring\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(ctrl_link, LOG_BLOCK, LOG_NAME, "fec_mon_ccw_down_limit_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_ccw_down_limit show (ccw_down_limit = %d)", ccw_down_limit);
+
+	if (ccw_down_limit == -1)
+		return sysfs_emit(buf, "calculated\n");
+
+	return sysfs_emit(buf, "%d\n", ccw_down_limit);
+}
+
+static ssize_t ccw_warn_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  ccw_warn_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.mon_check_kobj);
+
+	rtn = sl_ctrl_data_link_fec_mon_ccw_warn_limit_get(ctrl_link, &ccw_warn_limit);
+	if (rtn == -EBADRQC) {
+		sl_log_warn_trace(ctrl_link, LOG_BLOCK, LOG_NAME,
+				  "ccw warn limit show monitoring not enabled");
+		return sysfs_emit(buf, "not-monitoring\n");
+	}
+	if (rtn) {
+		sl_log_err_trace(ctrl_link, LOG_BLOCK, LOG_NAME, "fec_mon_ccw_warn_limit_get failed [%d]", rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_ccw_warn_limit show (ccw_warn_limit = %d)", ccw_warn_limit);
+
+	if (ccw_warn_limit == -1)
+		return sysfs_emit(buf, "calculated\n");
+
+	return sysfs_emit(buf, "%d\n", ccw_warn_limit);
+}
+
+static ssize_t period_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  period_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.mon_check_kobj);
+
+	rtn = sl_ctrl_data_link_fec_mon_period_ms_get(ctrl_link, &period_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_period_ms_show show (period_ms = %u)", period_ms);
+
+	return sysfs_emit(buf, "%u\n", period_ms);
+}
+
+static struct kobj_attribute ucw_down_limit = __ATTR_RO(ucw_down_limit);
+static struct kobj_attribute ucw_warn_limit = __ATTR_RO(ucw_warn_limit);
+static struct kobj_attribute ccw_down_limit = __ATTR_RO(ccw_down_limit);
+static struct kobj_attribute ccw_warn_limit = __ATTR_RO(ccw_warn_limit);
+static struct kobj_attribute period_ms      = __ATTR_RO(period_ms);
+
+static struct attribute *link_fec_mon_check_attrs[] = {
+	&ucw_down_limit.attr,
+	&ucw_warn_limit.attr,
+	&ccw_down_limit.attr,
+	&ccw_warn_limit.attr,
+	&period_ms.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_mon_check);
+
+static struct kobj_type link_fec_mon_check = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_mon_check_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_fec_mon_check_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link fec mon check create (num = %u)", ctrl_link->num);
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.mon_check_kobj, &link_fec_mon_check,
+				   &ctrl_link->fec.kobj, "monitor_check");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link monitor check create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->fec.mon_check_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_fec_mon_check_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link fec mon check delete (num = %u)", ctrl_link->num);
+
+	kobject_put(&ctrl_link->fec.mon_check_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up.c
new file mode 100644
index 000000000000..ecf92c043e01
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "data/sl_ctrl_data_link.h"
+
+#include "sl_sysfs_link_fec_up.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t ccw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  ccw;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.up_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_cache_ccw_cntr_get(ctrl_link, &ccw);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "ccw show (ccw = %llu)", ccw);
+
+	return sysfs_emit(buf, "%llu\n", ccw);
+}
+
+static ssize_t ucw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  ucw;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.up_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_cache_ucw_cntr_get(ctrl_link, &ucw);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "ucw show (ucw = %llu)", ucw);
+
+	return sysfs_emit(buf, "%llu\n", ucw);
+}
+
+static ssize_t gcw_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                  gcw;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.up_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_cache_gcw_cntr_get(ctrl_link, &gcw);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "gcw show (link = 0x%p, gcw = %llu)", ctrl_link, gcw);
+
+	return sysfs_emit(buf, "%llu\n", gcw);
+}
+
+static struct kobj_attribute link_fec_ccw = __ATTR_RO(ccw);
+static struct kobj_attribute link_fec_ucw = __ATTR_RO(ucw);
+static struct kobj_attribute link_fec_gcw = __ATTR_RO(gcw);
+
+static struct attribute *link_fec_up_attrs[] = {
+	&link_fec_ccw.attr,
+	&link_fec_ucw.attr,
+	&link_fec_gcw.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_up);
+
+static struct kobj_type link_fec_up = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_up_groups,
+};
+
+static struct attribute *link_fec_up_lane_attrs[] = {
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_up_lane);
+
+static struct kobj_type link_fec_up_lane = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_up_lane_groups,
+};
+
+static ssize_t link_fec_up_fecl_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                            rtn;
+	struct sl_ctrl_link           *ctrl_link;
+	struct sl_ctrl_link_fecl_kobj *fecl_kobj;
+	u8                             fecl_num;
+	u64                            fecl;
+
+	fecl_kobj = container_of(kobj, struct sl_ctrl_link_fecl_kobj, kobj);
+	ctrl_link = fecl_kobj->ctrl_link;
+
+	fecl_num = ((4 * fecl_kobj->lane_num) + num);
+
+	rtn = sl_ctrl_data_link_fec_up_cache_lane_cntr_get(ctrl_link, fecl_num, &fecl);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(fecl_kobj->ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "current fecl show (link = 0x%p, num = %u, lane_num = %u, fecl %u = %llu)",
+		fecl_kobj->ctrl_link, num, fecl_kobj->lane_num, fecl_num, fecl);
+
+	return sysfs_emit(buf, "%llu\n", fecl);
+}
+
+#define link_fec_up_fecl(_num)                                                                                 \
+	static inline ssize_t fecl##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                      \
+		return link_fec_up_fecl_show(kobj, kattr, buf, (_num));                                        \
+	}                                                                                                      \
+	static struct kobj_attribute link_fecl##_num = __ATTR_RO(fecl##_num)
+
+static ssize_t link_fec_up_bin_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u64                 tail_cntr;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, fec.up_tail_kobj);
+
+	rtn = sl_ctrl_data_link_fec_up_cache_tail_cntr_get(ctrl_link, num, &tail_cntr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "up bin show (link = 0x%p, bin %u = %llu)",
+		ctrl_link, num, tail_cntr);
+
+	return sysfs_emit(buf, "%llu\n", tail_cntr);
+}
+
+#define link_fec_up_tail0(_num)                                                                         \
+	static ssize_t bin0##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                               \
+		return link_fec_up_bin_show(kobj, kattr, buf, _num);                                    \
+	}                                                                                               \
+	static struct kobj_attribute fec_bin0##_num = __ATTR_RO(bin0##_num)
+
+#define link_fec_up_tail(_num)                                                                                \
+	static inline ssize_t bin##_num##_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                     \
+		return link_fec_up_bin_show(kobj, kattr, buf, (_num));                                        \
+	}                                                                                                     \
+	static struct kobj_attribute fec_bin##_num = __ATTR_RO(bin##_num)
+
+link_fec_up_fecl(0);
+link_fec_up_fecl(1);
+link_fec_up_fecl(2);
+link_fec_up_fecl(3);
+
+static struct attribute *link_fec_up_fecl_attrs[] = {
+	&link_fecl0.attr,
+	&link_fecl1.attr,
+	&link_fecl2.attr,
+	&link_fecl3.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_up_fecl);
+
+static struct kobj_type link_fec_up_fecl = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_up_fecl_groups,
+};
+
+link_fec_up_tail0(0);
+link_fec_up_tail0(1);
+link_fec_up_tail0(2);
+link_fec_up_tail0(3);
+link_fec_up_tail0(4);
+link_fec_up_tail0(5);
+link_fec_up_tail0(6);
+link_fec_up_tail0(7);
+link_fec_up_tail0(8);
+link_fec_up_tail0(9);
+link_fec_up_tail(10);
+link_fec_up_tail(11);
+link_fec_up_tail(12);
+link_fec_up_tail(13);
+link_fec_up_tail(14);
+
+static struct attribute *link_fec_up_tail_attrs[] = {
+	&fec_bin00.attr,
+	&fec_bin01.attr,
+	&fec_bin02.attr,
+	&fec_bin03.attr,
+	&fec_bin04.attr,
+	&fec_bin05.attr,
+	&fec_bin06.attr,
+	&fec_bin07.attr,
+	&fec_bin08.attr,
+	&fec_bin09.attr,
+	&fec_bin10.attr,
+	&fec_bin11.attr,
+	&fec_bin12.attr,
+	&fec_bin13.attr,
+	&fec_bin14.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_up_tail);
+
+static struct kobj_type link_fec_up_tail = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_up_tail_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_fec_up_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+	int x;
+	int out;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link fec up create (num = %u)", ctrl_link->num);
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.up_kobj, &link_fec_up,
+				   &ctrl_link->fec.kobj, "up");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec up create kobject_init_and_add failed [%d]", rtn);
+		goto out_up;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.up_lane_kobj,
+				   &link_fec_up_lane, &ctrl_link->fec.up_kobj, "lane");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec up lane create kobject_init_and_add failed [%d]", rtn);
+		goto out_up_lane;
+	}
+	for (x = 0; x < SL_MAX_LANES; ++x) {
+		rtn = kobject_init_and_add(&ctrl_link->fec.up_fecl_kobjs[x].kobj,
+					   &link_fec_up_fecl, &ctrl_link->fec.up_lane_kobj, "%d", x);
+		if (rtn) {
+			sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+				   "link fec up fecl create kobject_init_and_add failed [%d]", rtn);
+			goto out_up_fecl;
+		}
+		ctrl_link->fec.up_fecl_kobjs[x].ctrl_link = ctrl_link;
+		ctrl_link->fec.up_fecl_kobjs[x].lane_num = x;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_link->fec.up_tail_kobj,
+				   &link_fec_up_tail, &ctrl_link->fec.up_kobj, "tail");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link fec up tail create kobject_init_and_add failed [%d]", rtn);
+		goto out_up_tail;
+	}
+
+	return 0;
+
+out_up_tail:
+	kobject_put(&ctrl_link->fec.up_tail_kobj);
+out_up_fecl:
+	if (x < SL_MAX_LANES)
+		kobject_put(&ctrl_link->fec.up_fecl_kobjs[x].kobj);
+	for (out = 0; out < x; ++out)
+		kobject_put(&ctrl_link->fec.up_fecl_kobjs[out].kobj);
+out_up_lane:
+	kobject_put(&ctrl_link->fec.up_lane_kobj);
+out_up:
+	kobject_put(&ctrl_link->fec.up_kobj);
+
+	return rtn;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_fec_up_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int x;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link fec up delete (link_num = %u)", ctrl_link->num);
+
+	kobject_put(&ctrl_link->fec.up_tail_kobj);
+	for (x = 0; x < SL_MAX_LANES; ++x)
+		kobject_put(&ctrl_link->fec.up_fecl_kobjs[x].kobj);
+	kobject_put(&ctrl_link->fec.up_lane_kobj);
+	kobject_put(&ctrl_link->fec.up_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up_check.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up_check.c
new file mode 100644
index 000000000000..763dde6ca217
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up_check.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_core_link.h"
+#include "data/sl_core_data_link.h"
+
+#include "sl_sysfs_link_fec_up_check.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t ucw_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	s32                  ucw_limit;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.up_check_kobj);
+
+	rtn = sl_core_data_link_fec_up_ucw_limit_get(core_link, &ucw_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "fec_up_ucw_limit show (ucw_limit = %d)", ucw_limit);
+
+	return sysfs_emit(buf, "%d\n", ucw_limit);
+}
+
+static ssize_t ccw_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	s32                  ccw_limit;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.up_check_kobj);
+
+	rtn = sl_core_data_link_fec_up_ccw_limit_get(core_link, &ccw_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "fec_up_ccw_limit show (ccw_limit = %d)", ccw_limit);
+
+	return sysfs_emit(buf, "%d\n", ccw_limit);
+}
+
+static ssize_t settle_wait_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  settle_wait_ms;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.up_check_kobj);
+
+	rtn = sl_core_data_link_fec_up_settle_wait_ms_get(core_link, &settle_wait_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "settle_wait_ms show (settle_wait_ms = %u)", settle_wait_ms);
+
+	return sysfs_emit(buf, "%u\n", settle_wait_ms);
+}
+
+static ssize_t check_wait_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  check_wait_ms;
+
+	core_link = container_of(kobj, struct sl_core_link, fec.up_check_kobj);
+
+	rtn = sl_core_data_link_fec_up_check_wait_ms_get(core_link, &check_wait_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "check_wait_ms show (check_wait_ms = %u)", check_wait_ms);
+
+	return sysfs_emit(buf, "%u\n", check_wait_ms);
+}
+
+static struct kobj_attribute ucw_limit      = __ATTR_RO(ucw_limit);
+static struct kobj_attribute ccw_limit      = __ATTR_RO(ccw_limit);
+static struct kobj_attribute settle_wait_ms = __ATTR_RO(settle_wait_ms);
+static struct kobj_attribute check_wait_ms  = __ATTR_RO(check_wait_ms);
+
+static struct attribute *link_fec_up_check_attrs[] = {
+	&ucw_limit.attr,
+	&ccw_limit.attr,
+	&settle_wait_ms.attr,
+	&check_wait_ms.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_fec_up_check);
+
+static struct kobj_type link_fec_up_check = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_fec_up_check_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_fec_up_check_create(struct sl_core_link *core_link, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "link fec up check create (num = %u)", core_link->num);
+
+	rtn = kobject_init_and_add(&core_link->fec.up_check_kobj, &link_fec_up_check, parent_kobj, "up_check");
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+			   "link up_check create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&core_link->fec.up_check_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_fec_up_check_delete(struct sl_core_link *core_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "link fec up check delete (num = %u)", core_link->num);
+
+	kobject_put(&core_link->fec.up_check_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_pml_rec.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_pml_rec.c
new file mode 100644
index 000000000000..dc076274157d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_pml_rec.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include "sl_log.h"
+#include "data/sl_core_data_link.h"
+
+#include "sl_sysfs.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t pml_rec_attempts_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  attempts;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_attempts_get(core_link, &attempts);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec attempts show (attempts = %d)", attempts);
+
+	return sysfs_emit(buf, "%d\n", attempts);
+}
+
+static ssize_t pml_rec_successes_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  successes;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_successes_get(core_link, &successes);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec successes show (successes = %d)", successes);
+
+	return sysfs_emit(buf, "%d\n", successes);
+}
+
+static ssize_t pml_rec_link_fault_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  link_fault_cause;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_link_fault_cause_get(core_link, &link_fault_cause);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec link_fault_cause show (link_fault_cause = %d)", link_fault_cause);
+
+	return sysfs_emit(buf, "%d\n", link_fault_cause);
+}
+
+static ssize_t pml_rec_link_down_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  link_down_cause;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_link_down_cause_get(core_link, &link_down_cause);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec link_down_cause show (link_down_cause = %d)", link_down_cause);
+
+	return sysfs_emit(buf, "%d\n", link_down_cause);
+}
+
+static ssize_t pml_rec_link_fault_failed_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  link_fault_failed_cause;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_link_fault_failed_cause_get(core_link, &link_fault_failed_cause);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec link_fault_failed_cause show (link_fault_failed_cause = %d)",
+		   link_fault_failed_cause);
+
+	return sysfs_emit(buf, "%d\n", link_fault_failed_cause);
+}
+
+static ssize_t pml_rec_link_down_failed_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  link_down_failed_cause;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_link_down_failed_cause_get(core_link, &link_down_failed_cause);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec link_down_cause show (link_down_failed_cause = %d)",
+		   link_down_failed_cause);
+
+	return sysfs_emit(buf, "%d\n", link_down_failed_cause);
+}
+
+static ssize_t pml_rec_rate_limit_exceeded_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_core_link *core_link;
+	int                  rate_limit_exceeded;
+	int		     rtn;
+
+	core_link = container_of(kobj, struct sl_core_link, pml_rec_kobj);
+
+	rtn = sl_core_data_link_pml_rec_rate_limit_exceeded_get(core_link, &rate_limit_exceeded);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "pml rec rate_limit_exceeded show (rate_limit_exceeded = %d)",
+		   rate_limit_exceeded);
+
+	return sysfs_emit(buf, "%d\n", rate_limit_exceeded);
+}
+
+static struct kobj_attribute link_pml_rec_attempts                = __ATTR_RO(pml_rec_attempts);
+static struct kobj_attribute link_pml_rec_successes               = __ATTR_RO(pml_rec_successes);
+static struct kobj_attribute link_pml_rec_link_fault_cause        = __ATTR_RO(pml_rec_link_fault_cause);
+static struct kobj_attribute link_pml_rec_link_down_cause         = __ATTR_RO(pml_rec_link_down_cause);
+static struct kobj_attribute link_pml_rec_link_fault_failed_cause = __ATTR_RO(pml_rec_link_fault_failed_cause);
+static struct kobj_attribute link_pml_rec_link_down_failed_cause  = __ATTR_RO(pml_rec_link_down_failed_cause);
+static struct kobj_attribute link_pml_rec_rate_limit_exceeded     = __ATTR_RO(pml_rec_rate_limit_exceeded);
+
+static struct attribute *link_pml_rec_attrs[] = {
+	&link_pml_rec_attempts.attr,
+	&link_pml_rec_successes.attr,
+	&link_pml_rec_link_fault_cause.attr,
+	&link_pml_rec_link_down_cause.attr,
+	&link_pml_rec_link_fault_failed_cause.attr,
+	&link_pml_rec_link_down_failed_cause.attr,
+	&link_pml_rec_rate_limit_exceeded.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_pml_rec);
+
+static struct kobj_type link_pml_rec = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_pml_rec_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_pml_rec_create(struct sl_core_link *core_link, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "link pml rec create (num = %u)", core_link->num);
+
+	rtn = kobject_init_and_add(&core_link->pml_rec_kobj, &link_pml_rec, parent_kobj, "pml_recovery");
+	if (rtn) {
+		sl_log_err(core_link, LOG_BLOCK, LOG_NAME,
+			   "link pml rec create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&core_link->pml_rec_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_pml_rec_delete(struct sl_core_link *core_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME, "link pml rec delete (num = %u)", core_link->num);
+
+	kobject_put(&core_link->pml_rec_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_policy.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_policy.c
new file mode 100644
index 000000000000..110486b5d274
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link_policy.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "data/sl_ctrl_data_link.h"
+#include "sl_ctrl_link.h"
+#include "sl_test_common.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t fec_mon_period_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  fec_mon_period_ms;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_fec_mon_period_ms_get(ctrl_link, &fec_mon_period_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_period_ms show (fec_mon_period_ms = %d)", fec_mon_period_ms);
+
+	return sysfs_emit(buf, "%d\n", fec_mon_period_ms);
+}
+
+static ssize_t fec_mon_ucw_down_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  fec_mon_ucw_down_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_fec_mon_ucw_down_limit_get(ctrl_link, &fec_mon_ucw_down_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_ucw_down_limit show (fec_mon_ucw_down_limit = %d)", fec_mon_ucw_down_limit);
+
+	return sysfs_emit(buf, "%d\n", fec_mon_ucw_down_limit);
+}
+
+static ssize_t fec_mon_ucw_warn_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  fec_mon_ucw_warn_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_fec_mon_ucw_warn_limit_get(ctrl_link, &fec_mon_ucw_warn_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_ucw_warn_limit show (fec_mon_ucw_warn_limit = %d)", fec_mon_ucw_warn_limit);
+
+	return sysfs_emit(buf, "%d\n", fec_mon_ucw_warn_limit);
+}
+
+static ssize_t fec_mon_ccw_down_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  fec_mon_ccw_down_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_fec_mon_ccw_down_limit_get(ctrl_link, &fec_mon_ccw_down_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_ccw_down_limit show (fec_mon_ccw_down_limit = %d)", fec_mon_ccw_down_limit);
+
+	return sysfs_emit(buf, "%d\n", fec_mon_ccw_down_limit);
+}
+
+static ssize_t fec_mon_ccw_warn_limit_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	s32                  fec_mon_ccw_warn_limit;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_fec_mon_ccw_warn_limit_get(ctrl_link, &fec_mon_ccw_warn_limit);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "fec_mon_ccw_warn_limit show (fec_mon_ccw_warn_limit = %d)", fec_mon_ccw_warn_limit);
+
+	return sysfs_emit(buf, "%d\n", fec_mon_ccw_warn_limit);
+}
+
+static ssize_t lock_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link_policy_option_locked show (options = 0x%X)", options);
+
+	return sysfs_emit(buf, "%s\n", (options & SL_LINK_POLICY_OPT_LOCK) ? "enabled" : "disabled");
+}
+
+static ssize_t keep_serdes_up_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link_policy_option_keep_serdes_up show (options = 0x%X)", options);
+
+	return sysfs_emit(buf, "%s\n",
+			 (options & SL_LINK_POLICY_OPT_KEEP_SERDES_UP) ? "enabled" : "disabled");
+}
+
+static ssize_t use_unsupported_cable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link_policy_option_use_unsupported_cable show (options = 0x%X)", options);
+
+	return sysfs_emit(buf, "%s\n",
+			 (options & SL_LINK_POLICY_OPT_USE_UNSUPPORTED_CABLE) ? "enabled" : "disabled");
+}
+
+static ssize_t use_supported_ss200_cable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link_policy_option_use_supported_ss200_cable show (options = 0x%X)", options);
+
+	return sysfs_emit(buf, "%s\n",
+			 (options & SL_LINK_POLICY_OPT_USE_SUPPORTED_SS200_CABLE) ? "enabled" : "disabled");
+}
+
+static ssize_t ignore_media_error_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	u32                  options;
+
+	ctrl_link = container_of(kobj, struct sl_ctrl_link, policy_kobj);
+
+	rtn = sl_ctrl_data_link_policy_options_get(ctrl_link, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME,
+		   "link_policy_option_ignore_media_error show (options = %u)", options);
+
+	return sysfs_emit(buf, "%s\n",
+			 (options & SL_LINK_POLICY_OPT_IGNORE_MEDIA_ERROR) ? "enabled" : "disabled");
+}
+
+static struct kobj_attribute fec_mon_period_ms         = __ATTR_RO(fec_mon_period_ms);
+static struct kobj_attribute fec_mon_ucw_down_limit    = __ATTR_RO(fec_mon_ucw_down_limit);
+static struct kobj_attribute fec_mon_ucw_warn_limit    = __ATTR_RO(fec_mon_ucw_warn_limit);
+static struct kobj_attribute fec_mon_ccw_down_limit    = __ATTR_RO(fec_mon_ccw_down_limit);
+static struct kobj_attribute fec_mon_ccw_warn_limit    = __ATTR_RO(fec_mon_ccw_warn_limit);
+static struct kobj_attribute lock                      = __ATTR_RO(lock);
+static struct kobj_attribute keep_serdes_up            = __ATTR_RO(keep_serdes_up);
+static struct kobj_attribute use_unsupported_cable     = __ATTR_RO(use_unsupported_cable);
+static struct kobj_attribute use_supported_ss200_cable = __ATTR_RO(use_supported_ss200_cable);
+static struct kobj_attribute ignore_media_error        = __ATTR_RO(ignore_media_error);
+
+static struct attribute *link_policy_attrs[] = {
+	&fec_mon_period_ms.attr,
+	&fec_mon_ucw_down_limit.attr,
+	&fec_mon_ucw_warn_limit.attr,
+	&fec_mon_ccw_down_limit.attr,
+	&fec_mon_ccw_warn_limit.attr,
+	&lock.attr,
+	&keep_serdes_up.attr,
+	&use_unsupported_cable.attr,
+	&use_supported_ss200_cable.attr,
+	&ignore_media_error.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(link_policy);
+
+static struct kobj_type link_policy = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_policy_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_link_policy_create(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link policy create (num = %u)", ctrl_link->num);
+
+	rtn = kobject_init_and_add(&ctrl_link->policy_kobj, &link_policy, &ctrl_link->kobj, "policies");
+	if (rtn) {
+		sl_log_err(ctrl_link, LOG_BLOCK, LOG_NAME,
+			   "link policy create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_link->policy_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_link_policy_delete(struct sl_ctrl_link *ctrl_link)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_link, LOG_BLOCK, LOG_NAME, "link config delete (num = %u)", ctrl_link->num);
+
+	kobject_put(&ctrl_link->policy_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr.c
new file mode 100644
index 000000000000..fd142ad85ea1
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/hpe/sl/sl_llr.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_core_str.h"
+#include "sl_ctrl_llr.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+
+#include "data/sl_core_data_llr.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t last_fail_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u32                 llr_fail_cause;
+	time64_t            llr_fail_time;
+
+	core_llr = container_of(kobj, struct sl_core_llr, kobj);
+
+	rtn = sl_core_data_llr_last_fail_cause_get(core_llr, &llr_fail_cause, &llr_fail_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "last fail cause show (cause = %u %s)", llr_fail_cause, sl_core_llr_fail_cause_str(llr_fail_cause));
+
+	if (llr_fail_cause == SL_LLR_FAIL_CAUSE_NONE)
+		return sysfs_emit(buf, "no-fail\n");
+
+	return sysfs_emit(buf, "%s\n", sl_core_llr_fail_cause_str(llr_fail_cause));
+}
+
+static ssize_t last_fail_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u32                 llr_fail_cause;
+	time64_t            llr_fail_time;
+
+	core_llr = container_of(kobj, struct sl_core_llr, kobj);
+
+	rtn = sl_core_data_llr_last_fail_cause_get(core_llr, &llr_fail_cause, &llr_fail_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "last fail time show (cause = %u %s, time = %lld %ptTt %ptTd)",
+		   llr_fail_cause, sl_core_llr_fail_cause_str(llr_fail_cause),
+		   llr_fail_time, &llr_fail_time, &llr_fail_time);
+
+	if (llr_fail_cause == SL_LLR_FAIL_CAUSE_NONE)
+		return sysfs_emit(buf, "no-fail\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &llr_fail_time, &llr_fail_time);
+}
+
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state core_llr_state;
+	u32 llr_state;
+
+	core_llr = container_of(kobj, struct sl_core_llr, kobj);
+
+	rtn = sl_core_data_llr_state_get(core_llr, &core_llr_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	llr_state = sl_ctrl_llr_state_from_core_llr_state(core_llr_state);
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "state show (core_llr_state = %u %s, llr_state = %u %s)",
+		   core_llr_state, sl_core_llr_state_str(core_llr_state),
+		   llr_state, sl_llr_state_str(llr_state));
+
+	return sysfs_emit(buf, "%s\n", sl_llr_state_str(llr_state));
+}
+
+static ssize_t info_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u64                 info_map;
+	char                info_map_str[900];
+
+	core_llr = container_of(kobj, struct sl_core_llr, kobj);
+
+	rtn = sl_core_data_llr_info_map_get(core_llr, &info_map);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_core_info_map_str(info_map, info_map_str, sizeof(info_map_str));
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "info map show (info_map = 0x%llX %s)", info_map, info_map_str);
+
+	return sysfs_emit(buf, "%s\n", info_map_str);
+}
+
+static struct kobj_attribute llr_state           = __ATTR_RO(state);
+static struct kobj_attribute llr_last_fail_cause = __ATTR_RO(last_fail_cause);
+static struct kobj_attribute llr_last_fail_time  = __ATTR_RO(last_fail_time);
+static struct kobj_attribute llr_info_map        = __ATTR_RO(info_map);
+
+static struct attribute *llr_attrs[] = {
+	&llr_state.attr,
+	&llr_last_fail_cause.attr,
+	&llr_last_fail_time.attr,
+	&llr_info_map.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(llr);
+
+static struct kobj_type llr_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = llr_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_llr_create(struct sl_ctrl_llr *ctrl_llr)
+{
+#ifdef CONFIG_SYSFS
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ctrl_llr->ctrl_lgrp->ctrl_ldev->num,
+				   ctrl_llr->ctrl_lgrp->num, ctrl_llr->num);
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr create (num = %u)", ctrl_llr->num);
+
+	if (!ctrl_llr->parent_kobj) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = kobject_init_and_add(&core_llr->kobj, &llr_info, ctrl_llr->parent_kobj, "llr");
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME,
+			   "llr create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&core_llr->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_llr_config_create(ctrl_llr, &core_llr->kobj);
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME,
+			   "llr config create failed [%d]", rtn);
+		kobject_put(&core_llr->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_llr_policy_create(core_llr, &core_llr->kobj);
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME,
+			   "llr policy create failed [%d]", rtn);
+		kobject_put(&core_llr->kobj);
+		sl_sysfs_llr_config_delete(ctrl_llr);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_llr_loop_time_create(core_llr, &core_llr->kobj);
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME,
+			   "llr loop time create failed [%d]", rtn);
+		kobject_put(&core_llr->kobj);
+		sl_sysfs_llr_config_delete(ctrl_llr);
+		sl_sysfs_llr_policy_delete(core_llr);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_llr_counters_create(ctrl_llr, &core_llr->kobj);
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME, "sl_sysfs_llr_counters_create failed [%d]", rtn);
+		kobject_put(&core_llr->kobj);
+		sl_sysfs_llr_config_delete(ctrl_llr);
+		sl_sysfs_llr_policy_delete(core_llr);
+		sl_sysfs_llr_loop_time_delete(core_llr);
+		return rtn;
+	}
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME,
+		   "llr create (llr_kobj = 0x%p)", &core_llr->kobj);
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_llr_delete(struct sl_ctrl_llr *ctrl_llr)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_core_llr *core_llr;
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "delete (num = %u)", ctrl_llr->num);
+
+	if (!ctrl_llr->parent_kobj)
+		return;
+
+	core_llr = sl_core_llr_get(ctrl_llr->ctrl_lgrp->ctrl_ldev->num,
+				   ctrl_llr->ctrl_lgrp->num, ctrl_llr->num);
+
+	sl_sysfs_llr_counters_delete(ctrl_llr);
+	sl_sysfs_llr_loop_time_delete(core_llr);
+	sl_sysfs_llr_policy_delete(core_llr);
+	sl_sysfs_llr_config_delete(ctrl_llr);
+	kobject_put(&core_llr->kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_config.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_config.c
new file mode 100644
index 000000000000..0fde52d669ca
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_config.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/hpe/sl/sl_lgrp.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "data/sl_ctrl_data_llr.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t mode_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 mode;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, config_kobj);
+
+	rtn = sl_ctrl_data_llr_config_mode_get(ctrl_llr, &mode);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME,
+		   "mode (mode = %u %s)",
+		   mode, sl_lgrp_llr_mode_str(mode));
+
+	return sysfs_emit(buf, "%s\n", sl_lgrp_llr_mode_str(mode));
+}
+
+static ssize_t setup_timeout_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 setup_timeout_ms;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, config_kobj);
+
+	rtn = sl_ctrl_data_llr_config_setup_timeout_ms_get(ctrl_llr, &setup_timeout_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME,
+		   "setup timeout show (setup_timeout = %ums)",
+		   setup_timeout_ms);
+
+	return sysfs_emit(buf, "%u\n", setup_timeout_ms);
+}
+
+static ssize_t start_timeout_ms_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 start_timeout_ms;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, config_kobj);
+
+	rtn = sl_ctrl_data_llr_config_start_timeout_ms_get(ctrl_llr, &start_timeout_ms);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME,
+		   "start timeout show (start_timeout = %ums)",
+		   start_timeout_ms);
+
+	return sysfs_emit(buf, "%u\n", start_timeout_ms);
+}
+
+static ssize_t link_down_behavior_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 link_dn_behavior;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, config_kobj);
+
+	rtn = sl_ctrl_data_llr_config_link_dn_behavior_get(ctrl_llr, &link_dn_behavior);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME,
+		   "down behavior show (dn_behavior = %u %s)",
+		   link_dn_behavior, sl_llr_link_dn_behavior_str(link_dn_behavior));
+
+	return sysfs_emit(buf, "%s\n", sl_llr_link_dn_behavior_str(link_dn_behavior));
+}
+
+static struct kobj_attribute mode             = __ATTR_RO(mode);
+static struct kobj_attribute setup_timeout_ms = __ATTR_RO(setup_timeout_ms);
+static struct kobj_attribute start_timeout_ms = __ATTR_RO(start_timeout_ms);
+static struct kobj_attribute dn_behavior      = __ATTR_RO(link_down_behavior);
+
+static struct attribute *llr_config_attrs[] = {
+	&mode.attr,
+	&setup_timeout_ms.attr,
+	&start_timeout_ms.attr,
+	&dn_behavior.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(llr_config);
+
+static struct kobj_type llr_config = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = llr_config_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_llr_config_create(struct sl_ctrl_llr *ctrl_llr, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr config create (num = %u)", ctrl_llr->num);
+
+	rtn = kobject_init_and_add(&ctrl_llr->config_kobj, &llr_config, parent_kobj, "config");
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME,
+			   "llr config create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_llr->config_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_llr_config_delete(struct sl_ctrl_llr *ctrl_llr)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr config delete (num = %u)", ctrl_llr->num);
+
+	kobject_put(&ctrl_llr->config_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_counters.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_counters.c
new file mode 100644
index 000000000000..516f130c76ff
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_counters.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_sysfs.h"
+#include "sl_log.h"
+#include "sl_ctrl_llr.h"
+#include "sl_ctrl_llr_counters.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t llr_setup_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_SETUP_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr setup cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_setup_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_SETUP, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr setup show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_setup_timeout_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_SETUP_TIMEOUT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr setup timeout show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_setup_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_SETUP_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr setup fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_configured_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_CONFIGURED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr configured show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_start_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_START_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr start cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_running_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_RUNNING, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr running show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_start_timeout_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_START_TIMEOUT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr start timeout show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_start_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_START_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr start fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_stop_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_STOP_CMD, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr stop cmd show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t llr_stop_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_counter_get(ctrl_llr, LLR_STOP_FAIL, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr stop fail show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_setup_config_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_SETUP_CONFIG, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause setup config show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_setup_intr_enable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_SETUP_INTR_ENABLE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause setup intr enable show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_setup_timeout_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_SETUP_TIMEOUT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause setup timeout show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_start_intr_enable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_START_INTR_ENABLE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause start intr enable show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_start_timeout_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_START_TIMEOUT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause start timeout show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_command_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_COMMAND, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause command show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_canceled_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u32                 counter;
+	u32                 rtn;
+
+	ctrl_llr = container_of(kobj, struct sl_ctrl_llr, counters_kobj);
+
+	rtn = sl_ctrl_llr_cause_counter_get(ctrl_llr, LLR_CAUSE_CANCELED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr cause canceled show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static struct kobj_attribute llr_setup_cmd     = __ATTR_RO(llr_setup_cmd);
+static struct kobj_attribute llr_setup         = __ATTR_RO(llr_setup);
+static struct kobj_attribute llr_setup_timeout = __ATTR_RO(llr_setup_timeout);
+static struct kobj_attribute llr_setup_fail    = __ATTR_RO(llr_setup_fail);
+static struct kobj_attribute llr_configured    = __ATTR_RO(llr_configured);
+static struct kobj_attribute llr_start_cmd     = __ATTR_RO(llr_start_cmd);
+static struct kobj_attribute llr_running       = __ATTR_RO(llr_running);
+static struct kobj_attribute llr_start_timeout = __ATTR_RO(llr_start_timeout);
+static struct kobj_attribute llr_start_fail    = __ATTR_RO(llr_start_fail);
+static struct kobj_attribute llr_stop_cmd      = __ATTR_RO(llr_stop_cmd);
+static struct kobj_attribute llr_stop_fail     = __ATTR_RO(llr_stop_fail);
+
+static struct kobj_attribute llr_cause_setup_config      = __ATTR_RO(cause_setup_config);
+static struct kobj_attribute llr_cause_setup_intr_enable = __ATTR_RO(cause_setup_intr_enable);
+static struct kobj_attribute llr_cause_setup_timeout     = __ATTR_RO(cause_setup_timeout);
+static struct kobj_attribute llr_cause_start_intr_enable = __ATTR_RO(cause_start_intr_enable);
+static struct kobj_attribute llr_cause_start_timeout     = __ATTR_RO(cause_start_timeout);
+static struct kobj_attribute llr_cause_command           = __ATTR_RO(cause_command);
+static struct kobj_attribute llr_cause_canceled          = __ATTR_RO(cause_canceled);
+
+static struct attribute *llr_counters_attrs[] = {
+	&llr_setup_cmd.attr,
+	&llr_setup.attr,
+	&llr_setup_timeout.attr,
+	&llr_setup_fail.attr,
+	&llr_configured.attr,
+	&llr_start_cmd.attr,
+	&llr_running.attr,
+	&llr_start_timeout.attr,
+	&llr_start_fail.attr,
+	&llr_stop_cmd.attr,
+	&llr_stop_fail.attr,
+	&llr_cause_setup_config.attr,
+	&llr_cause_setup_intr_enable.attr,
+	&llr_cause_setup_timeout.attr,
+	&llr_cause_start_intr_enable.attr,
+	&llr_cause_start_timeout.attr,
+	&llr_cause_command.attr,
+	&llr_cause_canceled.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(llr_counters);
+
+static struct kobj_type llr_counters = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = llr_counters_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_llr_counters_create(struct sl_ctrl_llr *ctrl_llr, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr counters create");
+
+	rtn = kobject_init_and_add(&ctrl_llr->counters_kobj, &llr_counters, parent_kobj, "counters");
+	if (rtn) {
+		sl_log_err(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr counters create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_llr->counters_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_llr_counters_delete(struct sl_ctrl_llr *ctrl_llr)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_llr, LOG_BLOCK, LOG_NAME, "llr counters delete");
+	kobject_put(&ctrl_llr->counters_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_loop_time.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_loop_time.c
new file mode 100644
index 000000000000..977bb176b454
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_loop_time.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "data/sl_core_data_llr.h"
+
+#include "sl_sysfs.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t llr_loop_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf, u8 num)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u64                 loop_time[SL_CORE_LLR_MAX_LOOP_TIME_COUNT];
+
+	core_llr = container_of(kobj, struct sl_core_llr, loop_time_kobj);
+
+	rtn = sl_core_data_llr_loop_time_get(core_llr, loop_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "loop time show (loop_time[%u] = %lluns)", num, loop_time[num]);
+
+	return sysfs_emit(buf, "%llu\n", loop_time[num]);
+}
+
+#define llr_loop_time(_num)                                                                                        \
+	static inline ssize_t time_##_num##_ns_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                                                          \
+		return llr_loop_time_show(kobj, kattr, buf, (_num));                                               \
+	}                                                                                                          \
+	static struct kobj_attribute llr_loop_time_##_num = __ATTR_RO(time_##_num##_ns)
+
+llr_loop_time(0);
+llr_loop_time(1);
+llr_loop_time(2);
+llr_loop_time(3);
+llr_loop_time(4);
+llr_loop_time(5);
+llr_loop_time(6);
+llr_loop_time(7);
+llr_loop_time(8);
+llr_loop_time(9);
+
+#define sl_sysfs_llr_loop_time_file(_num)                                                       \
+	do {                                                                                    \
+		rtn = sysfs_create_file(&core_llr->loop_time_kobj, &llr_loop_time_##_num.attr); \
+		if (rtn) {                                                                      \
+			sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,                               \
+				"llr loop time create file failed [%d]", rtn);                  \
+			goto out;                                                               \
+		}                                                                               \
+	} while (0)
+
+static ssize_t calc_ns_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u64                 calculated_ns;
+
+	core_llr = container_of(kobj, struct sl_core_llr, loop_time_kobj);
+
+	rtn = sl_core_data_llr_loop_calculated_ns_get(core_llr, &calculated_ns);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "calc show (calculated_ns = %lluns)", calculated_ns);
+
+	return sysfs_emit(buf, "%llu\n", calculated_ns);
+}
+
+static ssize_t min_ns_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u64                 min_ns;
+
+	core_llr = container_of(kobj, struct sl_core_llr, loop_time_kobj);
+
+	rtn = sl_core_data_llr_loop_min_ns_get(core_llr, &min_ns);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "min show (min_ns = %lluns)", min_ns);
+
+	return sysfs_emit(buf, "%llu\n", min_ns);
+}
+
+static ssize_t max_ns_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u64                 max_ns;
+
+	core_llr = container_of(kobj, struct sl_core_llr, loop_time_kobj);
+
+	rtn = sl_core_data_llr_loop_max_ns_get(core_llr, &max_ns);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "max show (max_ns = %lluns)", max_ns);
+
+	return sysfs_emit(buf, "%llu\n", max_ns);
+}
+
+static ssize_t average_ns_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u64                 average_ns;
+
+	core_llr = container_of(kobj, struct sl_core_llr, loop_time_kobj);
+
+	rtn = sl_core_data_llr_loop_average_ns_get(core_llr, &average_ns);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME,
+		   "average show (average_ns = %lluns)", average_ns);
+
+	return sysfs_emit(buf, "%llu\n", average_ns);
+}
+
+static struct kobj_attribute llr_loop_calc    = __ATTR_RO(calc_ns);
+static struct kobj_attribute llr_loop_min     = __ATTR_RO(min_ns);
+static struct kobj_attribute llr_loop_max     = __ATTR_RO(max_ns);
+static struct kobj_attribute llr_loop_average = __ATTR_RO(average_ns);
+
+static struct attribute *llr_loop_time_attrs[] = {
+	NULL
+};
+ATTRIBUTE_GROUPS(llr_loop_time);
+
+static struct kobj_type llr_loop_time = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = llr_loop_time_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_llr_loop_time_create(struct sl_core_llr *core_llr, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME, "llr loop time create (num = %u)", core_llr->num);
+
+	rtn = kobject_init_and_add(&core_llr->loop_time_kobj, &llr_loop_time, parent_kobj, "loop");
+	if (rtn) {
+		sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,
+			   "llr loop time create kobject_init_and_add failed [%d]", rtn);
+		goto out;
+	}
+
+	BUILD_BUG_ON(SL_CORE_LLR_MAX_LOOP_TIME_COUNT < 10);
+
+	sl_sysfs_llr_loop_time_file(0);
+	sl_sysfs_llr_loop_time_file(1);
+	sl_sysfs_llr_loop_time_file(2);
+	sl_sysfs_llr_loop_time_file(3);
+	sl_sysfs_llr_loop_time_file(4);
+	sl_sysfs_llr_loop_time_file(5);
+	sl_sysfs_llr_loop_time_file(6);
+	sl_sysfs_llr_loop_time_file(7);
+	sl_sysfs_llr_loop_time_file(8);
+	sl_sysfs_llr_loop_time_file(9);
+
+	rtn = sysfs_create_file(&core_llr->loop_time_kobj, &llr_loop_calc.attr);
+	if (rtn) {
+		sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,
+			   "llr loop time create file failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = sysfs_create_file(&core_llr->loop_time_kobj, &llr_loop_min.attr);
+	if (rtn) {
+		sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,
+			   "llr loop time create file failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = sysfs_create_file(&core_llr->loop_time_kobj, &llr_loop_max.attr);
+	if (rtn) {
+		sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,
+			   "llr loop time create file failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = sysfs_create_file(&core_llr->loop_time_kobj, &llr_loop_average.attr);
+	if (rtn) {
+		sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,
+			   "llr loop time create file failed [%d]", rtn);
+		goto out;
+	}
+
+	return 0;
+out:
+	kobject_put(&core_llr->loop_time_kobj);
+	return rtn;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_llr_loop_time_delete(struct sl_core_llr *core_llr)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME, "llr loop time delete (num = %u)", core_llr->num);
+
+	kobject_put(&core_llr->loop_time_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_policy.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_policy.c
new file mode 100644
index 000000000000..8b35765570c6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr_policy.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "data/sl_core_data_llr.h"
+
+#include "sl_sysfs.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t continuous_tries_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	u32                 options;
+
+	core_llr = container_of(kobj, struct sl_core_llr, policy_kobj);
+
+	rtn = sl_core_data_llr_policy_options_get(core_llr, &options);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	return sysfs_emit(buf, "%s\n",
+		(options & SL_LLR_POLICY_OPT_CONTINUOUS_START_TRIES) ? "enabled" : "disabled");
+}
+
+static struct kobj_attribute continuous_tries = __ATTR_RO(continuous_tries);
+
+static struct attribute *llr_policy_attrs[] = {
+	&continuous_tries.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(llr_policy);
+
+static struct kobj_type llr_policy = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = llr_policy_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_llr_policy_create(struct sl_core_llr *core_llr, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME, "llr policy create (num = %u)", core_llr->num);
+
+	rtn = kobject_init_and_add(&core_llr->policy_kobj, &llr_policy, parent_kobj, "policies");
+	if (rtn) {
+		sl_log_err(core_llr, LOG_BLOCK, LOG_NAME,
+			   "llr policy create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&core_llr->policy_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_llr_policy_delete(struct sl_core_llr *core_llr)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(core_llr, LOG_BLOCK, LOG_NAME, "llr policy delete (num = %u)", core_llr->num);
+
+	kobject_put(&core_llr->policy_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac.c
new file mode 100644
index 000000000000..5587398a98f9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/hpe/sl/sl_mac.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_mac.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_str.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t rx_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 state;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, kobj);
+
+	rtn = sl_ctrl_mac_rx_state_get(ctrl_mac->ctrl_lgrp->ctrl_ldev->num,
+				       ctrl_mac->ctrl_lgrp->num, ctrl_mac->num, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME,
+		   "rx state show (mac = 0x%p, state = %u)", ctrl_mac, state);
+
+	return sysfs_emit(buf, "%s\n", sl_mac_state_str(state));
+}
+
+static ssize_t rx_last_start_result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	int                 last_start_result;
+	int                 rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, kobj);
+
+	rtn = sl_core_mac_rx_last_start_result_get(ctrl_mac->ctrl_lgrp->ctrl_ldev->num,
+						   ctrl_mac->ctrl_lgrp->num, ctrl_mac->num, &last_start_result);
+
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME,
+		   "rx last start result show (mac = 0x%p, last_start_result = %d)", ctrl_mac, last_start_result);
+
+	return sysfs_emit(buf, "%d\n", last_start_result);
+}
+
+static ssize_t tx_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 state;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, kobj);
+
+	rtn = sl_ctrl_mac_tx_state_get(ctrl_mac->ctrl_lgrp->ctrl_ldev->num,
+				       ctrl_mac->ctrl_lgrp->num, ctrl_mac->num, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME,
+		   "tx state show (mac = 0x%p, state = %u)", ctrl_mac, state);
+
+	return sysfs_emit(buf, "%s\n", sl_mac_state_str(state));
+}
+
+static ssize_t tx_last_start_result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	int                 last_start_result;
+	int                 rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, kobj);
+
+	rtn = sl_core_mac_tx_last_start_result_get(ctrl_mac->ctrl_lgrp->ctrl_ldev->num,
+						   ctrl_mac->ctrl_lgrp->num, ctrl_mac->num, &last_start_result);
+
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME,
+		   "tx last start result show (mac = 0x%p, last_start_result = %d)", ctrl_mac, last_start_result);
+
+	return sysfs_emit(buf, "%d\n", last_start_result);
+}
+
+static ssize_t info_map_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                 rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+	u64                 info_map;
+	char                info_map_str[900];
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, kobj);
+
+	rtn = sl_ctrl_mac_info_map_get(ctrl_mac->ctrl_lgrp->ctrl_ldev->num,
+				       ctrl_mac->ctrl_lgrp->num, ctrl_mac->num, &info_map);
+	if (rtn) {
+		sl_log_err(ctrl_mac, LOG_BLOCK, LOG_NAME,
+			   "info map show sl_ctrl_mac_info_map_get failed [%d]", rtn);
+		return sysfs_emit(buf, "no-mac\n");
+	}
+
+	sl_core_info_map_str(info_map, info_map_str, sizeof(info_map_str));
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME,
+		   "info map show (info_map = 0x%llX %s)", info_map, info_map_str);
+
+	return sysfs_emit(buf, "%s\n", info_map_str);
+}
+
+static struct kobj_attribute rx_state             = __ATTR_RO(rx_state);
+static struct kobj_attribute rx_last_start_result = __ATTR_RO(rx_last_start_result);
+static struct kobj_attribute tx_state             = __ATTR_RO(tx_state);
+static struct kobj_attribute tx_last_start_result = __ATTR_RO(tx_last_start_result);
+static struct kobj_attribute info_map             = __ATTR_RO(info_map);
+
+static struct attribute *mac_attrs[] = {
+	&rx_state.attr,
+	&rx_last_start_result.attr,
+	&tx_state.attr,
+	&tx_last_start_result.attr,
+	&info_map.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mac);
+
+static struct kobj_type mac_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = mac_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_mac_create(struct sl_ctrl_mac *ctrl_mac)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac create (num = %u)", ctrl_mac->num);
+
+	if (!ctrl_mac->parent_kobj) {
+		sl_log_err(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_mac->kobj, &mac_info, ctrl_mac->parent_kobj, "mac");
+	if (rtn) {
+		sl_log_err(ctrl_mac, LOG_BLOCK, LOG_NAME,
+			   "mac create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_mac->kobj);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_mac_counters_create(ctrl_mac);
+	if (rtn) {
+		sl_log_err(ctrl_mac, LOG_BLOCK, LOG_NAME, "sl_sysfs_mac_counters_create failed [%d]", rtn);
+		kobject_put(&ctrl_mac->kobj);
+		return rtn;
+	}
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME,
+		   "mac create (mac_kobj = 0x%p)", &ctrl_mac->kobj);
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_mac_delete(struct sl_ctrl_mac *ctrl_mac)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "delete (num = %u)", ctrl_mac->num);
+
+	if (!ctrl_mac->parent_kobj)
+		return;
+
+	sl_sysfs_mac_counters_delete(ctrl_mac);
+	kobject_put(&ctrl_mac->kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac_counters.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac_counters.c
new file mode 100644
index 000000000000..97ab44983d8e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac_counters.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_sysfs.h"
+#include "sl_log.h"
+#include "sl_ctrl_mac.h"
+#include "sl_ctrl_mac_counters.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t mac_tx_start_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_TX_START_CMD, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac tx start cmd show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_tx_started_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_TX_STARTED, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac tx started show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_tx_start_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_TX_START_FAIL, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac tx start fail show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_tx_stop_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_TX_STOP_CMD, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac tx stop cmd show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_tx_stopped_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_TX_STOPPED, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac tx stopped show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_tx_stop_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_TX_STOP_FAIL, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac tx stop fail show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_rx_start_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RX_START_CMD, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac rx start cmd show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_rx_started_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RX_STARTED, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac rx started show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_rx_start_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RX_START_FAIL, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac rx start fail show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_rx_stop_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RX_STOP_CMD, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac rx stop cmd show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_rx_stopped_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RX_STOPPED, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac rx stopped show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_rx_stop_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RX_STOP_FAIL, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac rx stop fail show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_reset_cmd_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RESET_CMD, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac reset cmd show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_reset_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RESET, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac reset show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static ssize_t mac_reset_fail_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                 count;
+	int		    rtn;
+
+	ctrl_mac = container_of(kobj, struct sl_ctrl_mac, counters_kobj);
+
+	rtn = sl_ctrl_mac_counter_get(ctrl_mac, MAC_RESET_FAIL, &count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac reset fail show (count = %u)", count);
+
+	return sysfs_emit(buf, "%u\n", count);
+}
+
+static struct kobj_attribute mac_tx_start_cmd  = __ATTR_RO(mac_tx_start_cmd);
+static struct kobj_attribute mac_tx_started    = __ATTR_RO(mac_tx_started);
+static struct kobj_attribute mac_tx_start_fail = __ATTR_RO(mac_tx_start_fail);
+static struct kobj_attribute mac_tx_stop_cmd   = __ATTR_RO(mac_tx_stop_cmd);
+static struct kobj_attribute mac_tx_stopped    = __ATTR_RO(mac_tx_stopped);
+static struct kobj_attribute mac_tx_stop_fail  = __ATTR_RO(mac_tx_stop_fail);
+static struct kobj_attribute mac_rx_start_cmd  = __ATTR_RO(mac_rx_start_cmd);
+static struct kobj_attribute mac_rx_started    = __ATTR_RO(mac_rx_started);
+static struct kobj_attribute mac_rx_start_fail = __ATTR_RO(mac_rx_start_fail);
+static struct kobj_attribute mac_rx_stop_cmd   = __ATTR_RO(mac_rx_stop_cmd);
+static struct kobj_attribute mac_rx_stopped    = __ATTR_RO(mac_rx_stopped);
+static struct kobj_attribute mac_rx_stop_fail  = __ATTR_RO(mac_rx_stop_fail);
+static struct kobj_attribute mac_reset_cmd     = __ATTR_RO(mac_reset_cmd);
+static struct kobj_attribute mac_reset         = __ATTR_RO(mac_reset);
+static struct kobj_attribute mac_reset_fail    = __ATTR_RO(mac_reset_fail);
+
+static struct attribute *mac_counters_attrs[] = {
+	&mac_tx_start_cmd.attr,
+	&mac_tx_started.attr,
+	&mac_tx_start_fail.attr,
+	&mac_tx_stop_cmd.attr,
+	&mac_tx_stopped.attr,
+	&mac_tx_stop_fail.attr,
+	&mac_rx_start_cmd.attr,
+	&mac_rx_started.attr,
+	&mac_rx_start_fail.attr,
+	&mac_rx_stop_cmd.attr,
+	&mac_rx_stopped.attr,
+	&mac_rx_stop_fail.attr,
+	&mac_reset_cmd.attr,
+	&mac_reset.attr,
+	&mac_reset_fail.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mac_counters);
+
+static struct kobj_type mac_counters = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = mac_counters_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_mac_counters_create(struct sl_ctrl_mac *ctrl_mac)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac counters create");
+
+	rtn = kobject_init_and_add(&ctrl_mac->counters_kobj, &mac_counters, &ctrl_mac->kobj, "counters");
+	if (rtn) {
+		sl_log_err(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac counters create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_mac->counters_kobj);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_mac_counters_delete(struct sl_ctrl_mac *ctrl_mac)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_mac, LOG_BLOCK, LOG_NAME, "mac counters delete");
+	kobject_put(&ctrl_mac->counters_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media.c
new file mode 100644
index 000000000000..8973fcc2f378
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media.c
@@ -0,0 +1,1274 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_core_str.h"
+#include "sl_core_lgrp.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+#include "data/sl_media_data_jack.h"
+#include "base/sl_media_eeprom.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    state;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	rtn = sl_media_jack_state_get(media_lgrp->media_jack, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "state show (media_lgrp = 0x%p, state = %u %s)",
+		   media_lgrp, state, sl_media_state_str(state));
+
+	return sysfs_emit(buf, "%s\n", sl_media_state_str(state));
+}
+
+static ssize_t jack_power_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	bool                  is_high_powered;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	is_high_powered = sl_media_jack_is_high_powered(media_lgrp->media_jack);
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "power state show (media_lgrp = 0x%p, state = %s)",
+		   media_lgrp, is_high_powered ? "high" : "low");
+
+	return sysfs_emit(buf, "%s\n", is_high_powered ? "high" : "low");
+}
+
+static ssize_t temperature_celsius_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                   rtn;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    temp;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp   = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_cable_temp_get(media_lgrp->media_ldev->num, media_lgrp->num, &temp);
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "not-active\n");
+	if (rtn == -EIO)
+		return sysfs_emit(buf, "io-error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "temperature_celsius show (media_lgrp = 0x%p, temp = %uc)", media_lgrp, temp);
+
+	return sysfs_emit(buf, "%u\n", temp);
+}
+
+static ssize_t temperature_warn_limit_celsius_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                   rtn;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    temp_warn_limit_c;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp  = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_cable_temp_warn_limit_get(media_lgrp->media_ldev->num,
+						      media_lgrp->num, &temp_warn_limit_c);
+
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "not-active\n");
+	if (rtn == -EIO)
+		return sysfs_emit(buf, "io-error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "temperature_warn_limit_celsius show (media_lgrp = 0x%p, temp = %uc)",
+		   media_lgrp, temp_warn_limit_c);
+
+	return sysfs_emit(buf, "%u\n", temp_warn_limit_c);
+}
+
+static ssize_t temperature_down_limit_celsius_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                   rtn;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    temp_down_limit_c;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp  = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_cable_temp_down_limit_get(media_lgrp->media_ldev->num,
+						      media_lgrp->num, &temp_down_limit_c);
+
+	if (rtn == -EBADRQC)
+		return sysfs_emit(buf, "not-active\n");
+	if (rtn == -EIO)
+		return sysfs_emit(buf, "io-error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "temperature_down_limit_celsius show (media_lgrp = 0x%p, temp = %uc)",
+		   media_lgrp, temp_down_limit_c);
+
+	return sysfs_emit(buf, "%u\n", temp_down_limit_c);
+}
+
+static ssize_t temperature_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    temperature_state;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp   = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	if (!sl_media_lgrp_media_type_is_active(media_lgrp->media_ldev->num, media_lgrp->num))
+		return sysfs_emit(buf, "not-active\n");
+
+	rtn  = sl_media_jack_cable_temp_state_get(media_lgrp->media_jack, &temperature_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "temperature state show (media_lgrp = 0x%p, temperature_state = %u %s)",
+		   media_lgrp, temperature_state, sl_media_temp_state_str(temperature_state));
+
+	return sysfs_emit(buf, "%s\n", sl_media_temp_state_str(temperature_state));
+}
+
+static ssize_t vendor_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   vendor;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_vendor_get(media_lgrp, &vendor);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "vendor show (media_lgrp = 0x%p, vendor = %u %s)",
+		   media_lgrp, vendor, sl_media_vendor_str(vendor));
+
+	return sysfs_emit(buf, "%s\n", sl_media_vendor_str(vendor));
+}
+
+static ssize_t vendor_part_num_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	char                  vendor_pn_str[SL_MEDIA_VENDOR_PN_SIZE];
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp  = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_vendor_pn_str_get(media_lgrp, vendor_pn_str);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "vendor part num show (media_lgrp = 0x%p, vendor_pn_str = %s)",
+		   media_lgrp, vendor_pn_str);
+
+	return sysfs_emit(buf, "%s\n", vendor_pn_str);
+}
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   type;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_type_get(media_lgrp, &type);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "type show (media_lgrp = 0x%p, type = %u %s)",
+		   media_lgrp, type, sl_media_type_str(type));
+
+	return sysfs_emit(buf, "%s\n", sl_media_type_str(type));
+}
+
+static ssize_t shape_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   shape;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_shape_get(media_lgrp, &shape);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "shape show (media_lgrp = 0x%p, shape = %u %s)", media_lgrp, shape, sl_media_shape_str(shape));
+
+	return sysfs_emit(buf, "%s\n", sl_media_shape_str(shape));
+}
+
+static ssize_t cable_end_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    cable_end;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_cable_end_get(media_lgrp->media_jack, &cable_end);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "cable_end show (media_lgrp = 0x%p, cable_end = %u %s)",
+		media_lgrp, cable_end, sl_media_cable_end_str(cable_end));
+
+	return sysfs_emit(buf, "%s\n", sl_media_cable_end_str(cable_end));
+}
+
+static ssize_t length_cm_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   length_cm;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_length_get(media_lgrp, &length_cm);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "length_cm show (media_lgrp = 0x%p, length_cm = %u)",
+		   media_lgrp, length_cm);
+
+	return sysfs_emit(buf, "%u\n", length_cm);
+}
+
+static ssize_t max_speed_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   max_speed;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_max_speed_get(media_lgrp, &max_speed);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "max speed show (media_lgrp = 0x%p, max_speed = %u %s)",
+		   media_lgrp, max_speed, sl_media_speed_str(max_speed));
+
+	return sysfs_emit(buf, "%s\n", sl_media_speed_str(max_speed));
+}
+
+static ssize_t serial_num_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	char                  serial_num_str[SL_MEDIA_SERIAL_NUM_SIZE];
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_serial_num_str_get(media_lgrp, serial_num_str);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "serial num show (media_lgrp = 0x%p, serial_num = %s)",
+		   media_lgrp, serial_num_str);
+
+	return sysfs_emit(buf, "%s\n", serial_num_str);
+}
+
+static ssize_t hpe_part_num_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	char                  hpe_pn_str[SL_MEDIA_HPE_PN_SIZE];
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_hpe_pn_str_get(media_lgrp, hpe_pn_str);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "hpe part num show (media_lgrp = 0x%p, hpe_pn = %s)",
+		   media_lgrp, hpe_pn_str);
+
+	return sysfs_emit(buf, "%s\n", hpe_pn_str);
+}
+
+static ssize_t jack_num_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "jack_num show (media_lgrp = 0x%p, jack_num = %u)",
+		media_lgrp, media_lgrp->media_jack->physical_num);
+
+	return sysfs_emit(buf, "%u\n", media_lgrp->media_jack->physical_num);
+}
+
+static ssize_t jack_type_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   density;
+	u32                   jack_type;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_jack_type_get(media_lgrp, &jack_type);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	rtn = sl_media_lgrp_jack_type_qsfp_density_get(media_lgrp, &density);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "jack type show (media_lgrp = 0x%p, jack_type = %u %s)",
+		   media_lgrp, jack_type, sl_media_jack_type_str(jack_type, density));
+
+	return sysfs_emit(buf, "%s\n", sl_media_jack_type_str(jack_type, density));
+}
+
+static ssize_t furcation_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   furcation;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_furcation_get(media_lgrp, &furcation);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "furcation show (media_lgrp = 0x%p, furcation = %u %s)",
+		   media_lgrp, furcation, sl_media_furcation_str(furcation));
+
+	return sysfs_emit(buf, "%s\n", sl_media_furcation_str(furcation));
+}
+
+static ssize_t is_supported_cable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	bool                  unsupported;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	unsupported = sl_media_lgrp_is_cable_unsupported(media_lgrp);
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "is_supported_cable show (media_lgrp = 0x%p, is_supported_cable = %s)",
+		   media_lgrp, unsupported ? "no" : "yes");
+
+	return sysfs_emit(buf, "%s\n", unsupported ? "no" : "yes");
+}
+
+static ssize_t date_code_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	char                  date_code_str[SL_MEDIA_DATE_CODE_SIZE];
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_date_code_str_get(media_lgrp, date_code_str);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "date code show (media_lgrp = 0x%p, date_code = %s)",
+		   media_lgrp, date_code_str);
+
+	return sysfs_emit(buf, "%s\n", date_code_str);
+}
+
+static ssize_t firmware_version_hex_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    fw_ver[SL_MEDIA_FIRMWARE_VERSION_SIZE];
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_fw_ver_str_get(media_lgrp, fw_ver);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "firmware version hex show (media_lgrp = 0x%p, firmware_version_hex = %02X.%02X)",
+		media_lgrp, fw_ver[0], fw_ver[1]);
+
+	return sysfs_emit(buf, "%02X.%02X\n", fw_ver[0], fw_ver[1]);
+}
+
+static ssize_t target_firmware_version_hex_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    target_fw_ver_str[25];
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_eeprom_target_fw_ver_str_get(media_lgrp->media_jack, target_fw_ver_str, sizeof(target_fw_ver_str));
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "target firmware version hex show (media_lgrp = 0x%p, target_firmware_version_hex = %s)",
+		media_lgrp, target_fw_ver_str);
+
+	return sysfs_emit(buf, "%s\n", target_fw_ver_str);
+}
+
+static ssize_t cable_speed_state_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    cable_speed_state;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_cable_shift_state_get(media_lgrp->media_jack, &cable_speed_state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "cable_speed state show (media_lgrp = 0x%p, cable_speed_state = %u %s)",
+		   media_lgrp, cable_speed_state, sl_media_cable_speed_state_str(cable_speed_state));
+
+	return sysfs_emit(buf, "%s\n", sl_media_cable_speed_state_str(cable_speed_state));
+}
+
+static ssize_t active_cable_200g_host_interface_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    host_interface;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_active_cable_200g_host_interface_get(media_lgrp->media_jack, &host_interface);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "active cable 200g host interface show (media_lgrp = 0x%p, host_interface = 0x%X)",
+		   media_lgrp, host_interface);
+
+	return sysfs_emit(buf, "0x%02x\n", host_interface);
+}
+
+static ssize_t active_cable_200g_lane_count_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    lane_count;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_active_cable_200g_lane_count_get(media_lgrp->media_jack, &lane_count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "active cable 200g lane coiunt show (media_lgrp = 0x%p, lane_count = 0x%X)",
+		   media_lgrp, lane_count);
+
+	return sysfs_emit(buf, "0x%02x\n", lane_count);
+}
+
+static ssize_t active_cable_200g_appsel_num_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    appsel_num;
+	int rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_active_cable_200g_appsel_num_get(media_lgrp->media_jack, &appsel_num);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "active cable 200g appsel no show (media_lgrp = 0x%p, appsel_num = 0x%X)", media_lgrp, appsel_num);
+
+	return sysfs_emit(buf, "0x%02x\n", appsel_num);
+}
+
+static ssize_t active_cable_400g_host_interface_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    host_interface;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_active_cable_400g_host_interface_get(media_lgrp->media_jack, &host_interface);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "active cable 400g host interface show (media_lgrp = 0x%p, host_interface = 0x%X)",
+		   media_lgrp, host_interface);
+
+	return sysfs_emit(buf, "0x%02x\n", host_interface);
+}
+
+static ssize_t active_cable_400g_lane_count_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    lane_count;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_active_cable_400g_lane_count_get(media_lgrp->media_jack, &lane_count);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "active cable 400g lane count show (media_lgrp = 0x%p, lane_count = 0x%X)",
+		   media_lgrp, lane_count);
+
+	return sysfs_emit(buf, "0x%02x\n", lane_count);
+}
+
+static ssize_t active_cable_400g_appsel_num_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    appsel_num;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_jack_active_cable_400g_appsel_num_get(media_lgrp->media_jack, &appsel_num);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "active cable 400g appsel no show (media_lgrp = 0x%p, appsel_num = 0x%X)", media_lgrp, appsel_num);
+
+	return sysfs_emit(buf, "0x%02x\n", appsel_num);
+}
+
+static ssize_t last_fault_cause_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   fault_cause;
+	time64_t              fault_time;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	rtn = sl_media_jack_fault_cause_get(media_lgrp->media_jack, &fault_cause, &fault_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "last_fault cause show (cause = %u %s)", fault_cause,
+		   sl_media_fault_cause_str(fault_cause));
+
+	if (fault_cause == SL_MEDIA_FAULT_CAUSE_NONE)
+		return sysfs_emit(buf, "no-fault\n");
+
+	return sysfs_emit(buf, "%s\n", sl_media_fault_cause_str(fault_cause));
+}
+
+static ssize_t last_fault_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   fault_cause;
+	time64_t              fault_time;
+	int		      rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+
+	rtn = sl_media_jack_fault_cause_get(media_lgrp->media_jack, &fault_cause, &fault_time);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "last fault time show (cause = %u %s, time = %lld %ptTt %ptTd)",
+		fault_cause, sl_media_fault_cause_str(fault_cause),
+		fault_time, &fault_time, &fault_time);
+
+	if (fault_cause == SL_MEDIA_FAULT_CAUSE_NONE)
+		return sysfs_emit(buf, "no-fault\n");
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &fault_time, &fault_time);
+}
+
+static ssize_t is_supported_ss200_cable_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+
+	sl_log_dbg(media_lgrp, LOG_BLOCK, LOG_NAME,
+		   "is supported ss200 cable show (is_supported_ss200_cable = %s)",
+		media_lgrp->media_jack->is_supported_ss200_cable ? "yes" : "no");
+
+	if (media_lgrp->media_jack->is_supported_ss200_cable)
+		return sysfs_emit(buf, "yes\n");
+
+	return sysfs_emit(buf, "no\n");
+}
+
+static ssize_t jack_part_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	u8                    ldev_num;
+	u8                    lgrp_num;
+	u32                   jack_part;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ldev_num = media_lgrp->media_ldev->num;
+	lgrp_num = media_lgrp->num;
+
+	jack_part = sl_core_lgrp_jack_part_get(ldev_num, lgrp_num);
+
+	sl_log_dbg(media_lgrp, LOG_BLOCK, LOG_NAME,
+		   "jack part show (jack_part = %u %s)", jack_part, sl_core_lgrp_dt_jack_part_str(jack_part));
+
+	return sysfs_emit(buf, "%s\n", sl_core_lgrp_dt_jack_part_str(jack_part));
+}
+
+static ssize_t signal_cache_time_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                  rtn;
+	struct sl_media_lgrp *media_lgrp;
+	u8                   ldev_num;
+	u8                   lgrp_num;
+	time64_t             signal_cache_time_s;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+	ldev_num = media_lgrp->media_ldev->num;
+	lgrp_num = media_lgrp->num;
+
+	rtn = sl_media_jack_signal_cache_time_s_get(ldev_num, lgrp_num, &signal_cache_time_s);
+	if (rtn) {
+		sl_log_err_trace(media_lgrp, LOG_BLOCK, LOG_NAME, "signal cache time show failed [%d]", rtn);
+		return sysfs_emit(buf, "no-cache\n");
+	}
+
+	sl_log_dbg(media_lgrp, LOG_BLOCK, LOG_NAME,
+		   "signal cache time show (signal_cache_time_s = %llu)", signal_cache_time_s);
+
+	return sysfs_emit(buf, "%ptTt %ptTd\n", &signal_cache_time_s, &signal_cache_time_s);
+}
+
+static ssize_t error_info_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                   rtn;
+	u32                   error_map;
+	struct sl_media_lgrp *media_lgrp;
+	char                  error_str[SL_MEDIA_JACK_ATTR_ERR_STR_SIZE];
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, kobj);
+
+	rtn = sl_media_jack_attr_error_map_get(media_lgrp->media_jack, &error_map);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	rtn = sl_media_jack_attr_error_map_str(error_map, error_str, sizeof(error_str));
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(media_lgrp, LOG_BLOCK, LOG_NAME,
+		   "error info show (error_map = 0x%x %s)", error_map, error_str);
+
+	return sysfs_emit(buf, "%s\n", error_str);
+}
+
+static struct kobj_attribute media_state                            = __ATTR_RO(state);
+static struct kobj_attribute media_jack_power_state                 = __ATTR_RO(jack_power_state);
+static struct kobj_attribute media_temperature_celsius              = __ATTR_RO(temperature_celsius);
+static struct kobj_attribute media_temperature_warn_limit_celsius   = __ATTR_RO(temperature_warn_limit_celsius);
+static struct kobj_attribute media_temperature_down_limit_celsius   = __ATTR_RO(temperature_down_limit_celsius);
+static struct kobj_attribute media_temperature_state                = __ATTR_RO(temperature_state);
+static struct kobj_attribute media_vendor                           = __ATTR_RO(vendor);
+static struct kobj_attribute media_vendor_part_num                  = __ATTR_RO(vendor_part_num);
+static struct kobj_attribute media_type                             = __ATTR_RO(type);
+static struct kobj_attribute media_shape                            = __ATTR_RO(shape);
+static struct kobj_attribute media_cable_end                        = __ATTR_RO(cable_end);
+static struct kobj_attribute media_length_cm                        = __ATTR_RO(length_cm);
+static struct kobj_attribute media_max_speed                        = __ATTR_RO(max_speed);
+static struct kobj_attribute media_serial_num                       = __ATTR_RO(serial_num);
+static struct kobj_attribute media_hpe_part_num                     = __ATTR_RO(hpe_part_num);
+static struct kobj_attribute media_jack_num                         = __ATTR_RO(jack_num);
+static struct kobj_attribute media_jack_type                        = __ATTR_RO(jack_type);
+static struct kobj_attribute media_furcation                        = __ATTR_RO(furcation);
+static struct kobj_attribute media_is_supported_cable               = __ATTR_RO(is_supported_cable);
+static struct kobj_attribute media_date_code                        = __ATTR_RO(date_code);
+static struct kobj_attribute media_firmware_version_hex             = __ATTR_RO(firmware_version_hex);
+static struct kobj_attribute media_target_firmware_version_hex      = __ATTR_RO(target_firmware_version_hex);
+static struct kobj_attribute media_cable_speed_state                = __ATTR_RO(cable_speed_state);
+static struct kobj_attribute media_active_cable_200g_host_interface = __ATTR_RO(active_cable_200g_host_interface);
+static struct kobj_attribute media_active_cable_200g_lane_count     = __ATTR_RO(active_cable_200g_lane_count);
+static struct kobj_attribute media_active_cable_200g_appsel_num     = __ATTR_RO(active_cable_200g_appsel_num);
+static struct kobj_attribute media_active_cable_400g_host_interface = __ATTR_RO(active_cable_400g_host_interface);
+static struct kobj_attribute media_active_cable_400g_lane_count     = __ATTR_RO(active_cable_400g_lane_count);
+static struct kobj_attribute media_active_cable_400g_appsel_num     = __ATTR_RO(active_cable_400g_appsel_num);
+static struct kobj_attribute media_last_fault_cause                 = __ATTR_RO(last_fault_cause);
+static struct kobj_attribute media_last_fault_time                  = __ATTR_RO(last_fault_time);
+static struct kobj_attribute media_is_supported_ss200_cable         = __ATTR_RO(is_supported_ss200_cable);
+static struct kobj_attribute media_jack_part                        = __ATTR_RO(jack_part);
+static struct kobj_attribute media_signal_cache_time                = __ATTR_RO(signal_cache_time);
+static struct kobj_attribute media_error_info                       = __ATTR_RO(error_info);
+
+static struct attribute *media_attrs[] = {
+	&media_state.attr,
+	&media_jack_power_state.attr,
+	&media_temperature_celsius.attr,
+	&media_temperature_warn_limit_celsius.attr,
+	&media_temperature_down_limit_celsius.attr,
+	&media_temperature_state.attr,
+	&media_vendor.attr,
+	&media_vendor_part_num.attr,
+	&media_type.attr,
+	&media_shape.attr,
+	&media_cable_end.attr,
+	&media_length_cm.attr,
+	&media_max_speed.attr,
+	&media_serial_num.attr,
+	&media_hpe_part_num.attr,
+	&media_jack_num.attr,
+	&media_jack_type.attr,
+	&media_furcation.attr,
+	&media_is_supported_cable.attr,
+	&media_date_code.attr,
+	&media_firmware_version_hex.attr,
+	&media_target_firmware_version_hex.attr,
+	&media_cable_speed_state.attr,
+	&media_active_cable_200g_host_interface.attr,
+	&media_active_cable_200g_lane_count.attr,
+	&media_active_cable_200g_appsel_num.attr,
+	&media_active_cable_400g_host_interface.attr,
+	&media_active_cable_400g_lane_count.attr,
+	&media_active_cable_400g_appsel_num.attr,
+	&media_last_fault_cause.attr,
+	&media_last_fault_time.attr,
+	&media_is_supported_ss200_cable.attr,
+	&media_jack_part.attr,
+	&media_signal_cache_time.attr,
+	&media_error_info.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(media);
+
+static struct kobj_type media_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = media_groups,
+};
+
+static ssize_t host_interface_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp_speed_kobject *speed_kobj;
+	struct sl_ctrl_lgrp                *ctrl_lgrp;
+	u32                                 speed;
+	u32                                 type;
+	int				    rtn;
+
+	speed_kobj = container_of(kobj, struct sl_media_lgrp_speed_kobject, kobj);
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(speed_kobj->media_lgrp->media_ldev->num, speed_kobj->media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(speed_kobj->media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(speed_kobj->media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_type_get(speed_kobj->media_lgrp, &type);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	speed = speed_kobj->speed;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "host interface show (media_lgrp = 0x%p, host_interface = %s)",
+		speed_kobj->media_lgrp, sl_media_host_interface_str(speed, type));
+
+	return sysfs_emit(buf, "%s\n", sl_media_host_interface_str(speed, type));
+}
+
+static ssize_t projected_ber_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp_speed_kobject *speed_kobj;
+	struct sl_ctrl_lgrp                *ctrl_lgrp;
+	u8                                  media_interface;
+	u32                                 type;
+	int				    rtn;
+
+	speed_kobj = container_of(kobj, struct sl_media_lgrp_speed_kobject, kobj);
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(speed_kobj->media_lgrp->media_ldev->num, speed_kobj->media_lgrp->num);
+
+	if (!sl_media_jack_is_cable_online(speed_kobj->media_lgrp->media_jack)) {
+		if (sl_media_jack_is_cable_format_unsupported(speed_kobj->media_lgrp->media_jack))
+			return sysfs_emit(buf, "unsupported-format\n");
+		return sysfs_emit(buf, "no-cable\n");
+	}
+
+	rtn = sl_media_lgrp_type_get(speed_kobj->media_lgrp, &type);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	if (type == SL_MEDIA_TYPE_PEC || type == SL_MEDIA_TYPE_BKP) {
+		sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "projected_ber show (media_lgrp = 0x%p, projected_ber = 0)", speed_kobj->media_lgrp);
+		return sysfs_emit(buf, "0\n");
+	}
+
+	rtn = sl_media_eeprom_media_interface_get(speed_kobj->media_lgrp->media_jack, &media_interface);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "projected_ber show (media_lgrp = 0x%p, projected_ber = %s)",
+		   speed_kobj->media_lgrp, sl_media_ber_str(media_interface));
+
+	return sysfs_emit(buf, "%s\n", sl_media_ber_str(media_interface));
+}
+
+static struct kobj_attribute media_speed_host_interface = __ATTR_RO(host_interface);
+static struct kobj_attribute media_speed_projected_ber  = __ATTR_RO(projected_ber);
+
+static struct attribute *media_speed_attrs[] = {
+	&media_speed_host_interface.attr,
+	&media_speed_projected_ber.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(media_speed);
+
+static struct kobj_type media_speed_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = media_speed_groups,
+};
+
+static void parent_speed_release(struct kobject *kobj)
+{
+}
+
+static struct kobj_type parent_speed_info = {
+	.release = parent_speed_release,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_media_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int                   rtn;
+	u8                    state;
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media create");
+
+	if (!ctrl_lgrp->parent_kobj) {
+		sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media create missing parent");
+		return 0;
+	}
+
+	media_lgrp = sl_media_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!media_lgrp) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media_lgrp_get failed");
+		return -EFAULT;
+	}
+
+	rtn = kobject_init_and_add(&media_lgrp->kobj, &media_info, ctrl_lgrp->parent_kobj, "media");
+	if (rtn) {
+		kobject_put(&media_lgrp->kobj);
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "kobject_init_and_add failed [%d]", rtn);
+		return rtn;
+	}
+
+	rtn = kobject_init_and_add(&media_lgrp->parent_speed_kobj, &parent_speed_info, &media_lgrp->kobj, "speeds");
+	if (rtn) {
+		kobject_put(&media_lgrp->parent_speed_kobj);
+		kobject_put(&media_lgrp->kobj);
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "kobject_init_and_add failed [%d]", rtn);
+		return rtn;
+	}
+
+	rtn = sl_sysfs_media_counters_create(ctrl_lgrp);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media counters create failed [%d]", rtn);
+		goto out_parents;
+	}
+
+	/*
+	 * This if condition will be false for nic here
+	 */
+	rtn = sl_media_jack_state_get(media_lgrp->media_jack, &state);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media_jack_state_get failed [%d]", rtn);
+		goto out_counters;
+	}
+
+	if (state == SL_MEDIA_JACK_CABLE_ONLINE) {
+		/*
+		 * kobj cleanup in the callee function
+		 */
+		rtn = sl_sysfs_media_speeds_create(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media speeds create failed [%d]", rtn);
+			goto out_counters;
+		}
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "create (media_kobj = 0x%p)", &media_lgrp->kobj);
+
+	return 0;
+out_counters:
+	sl_sysfs_media_counters_delete(ctrl_lgrp);
+out_parents:
+	kobject_put(&media_lgrp->parent_speed_kobj);
+	kobject_put(&media_lgrp->kobj);
+	return rtn;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+int sl_sysfs_media_speeds_create(u8 ldev_num, u8 lgrp_num)
+{
+#ifdef CONFIG_SYSFS
+	int                   rtn;
+	int                   i;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+
+	if (media_lgrp->speeds_kobj_init)
+		return 0;
+
+	media_lgrp->supported_speeds_num = 0;
+	if (media_lgrp->cable_info->real_cable_status == CABLE_MEDIA_ATTR_ADDED) {
+		for_each_set_bit(i, &media_lgrp->cable_info->media_attr.speeds_map,
+				 sizeof(media_lgrp->cable_info->media_attr.speeds_map) * BITS_PER_BYTE) {
+			media_lgrp->speeds_kobj[media_lgrp->supported_speeds_num].media_lgrp = media_lgrp;
+			media_lgrp->speeds_kobj[media_lgrp->supported_speeds_num].speed = BIT(i);
+			rtn = kobject_init_and_add(&media_lgrp->speeds_kobj[media_lgrp->supported_speeds_num].kobj,
+						   &media_speed_info, &media_lgrp->parent_speed_kobj, sl_media_speed_str(BIT(i)));
+			if (rtn) {
+				for (i = 0; i <= media_lgrp->supported_speeds_num; ++i)
+					kobject_put(&media_lgrp->speeds_kobj[i].kobj);
+				media_lgrp->supported_speeds_num = 0;
+				sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "kobject_init_and_add failed [%d]", rtn);
+				return rtn;
+			}
+			media_lgrp->supported_speeds_num++;
+		}
+	} else if (media_lgrp->cable_info->fake_cable_status == CABLE_MEDIA_ATTR_ADDED) {
+		for_each_set_bit(i, &media_lgrp->cable_info->stashed_media_attr.speeds_map,
+				 sizeof(media_lgrp->cable_info->stashed_media_attr.speeds_map) * BITS_PER_BYTE) {
+			media_lgrp->speeds_kobj[media_lgrp->supported_speeds_num].media_lgrp = media_lgrp;
+			media_lgrp->speeds_kobj[media_lgrp->supported_speeds_num].speed = BIT(i);
+			rtn = kobject_init_and_add(&media_lgrp->speeds_kobj[media_lgrp->supported_speeds_num].kobj,
+						   &media_speed_info, &media_lgrp->parent_speed_kobj, sl_media_speed_str(BIT(i)));
+			if (rtn) {
+				for (i = 0; i <= media_lgrp->supported_speeds_num; ++i)
+					kobject_put(&media_lgrp->speeds_kobj[i].kobj);
+				media_lgrp->supported_speeds_num = 0;
+				sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "kobject_init_and_add failed [%d]", rtn);
+				return rtn;
+			}
+			media_lgrp->supported_speeds_num++;
+		}
+	}
+
+	media_lgrp->speeds_kobj_init = true;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media speed nodes created");
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_media_speeds_delete(u8 ldev_num, u8 lgrp_num)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_media_lgrp *media_lgrp;
+	u8 i;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+	if (!media_lgrp)
+		return;
+
+	if (media_lgrp->speeds_kobj_init) {
+		for (i = 0; i < media_lgrp->supported_speeds_num; ++i)
+			kobject_put(&media_lgrp->speeds_kobj[i].kobj);
+	}
+	media_lgrp->speeds_kobj_init = false;
+	media_lgrp->supported_speeds_num = 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_media_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media delete");
+
+	if (!ctrl_lgrp->parent_kobj)
+		return;
+
+	sl_sysfs_media_counters_delete(ctrl_lgrp);
+
+	media_lgrp = sl_media_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!media_lgrp) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media_lgrp_get failed");
+		return;
+	}
+
+	sl_sysfs_media_speeds_delete(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	kobject_put(&media_lgrp->parent_speed_kobj);
+	kobject_put(&media_lgrp->kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media_counters.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media_counters.c
new file mode 100644
index 000000000000..682c106d4d3a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media_counters.c
@@ -0,0 +1,599 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025,2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_sysfs.h"
+#include "sl_log.h"
+#include "sl_media_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_media_counters.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t cause_eeprom_format_unsupported_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_EEPROM_FORMAT_UNSUPPORTED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause eeprom format unsupported show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_eeprom_vendor_unsupported_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_EEPROM_VENDOR_UNSUPPORTED, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause eeprom vendor unsupported show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_eeprom_jack_io_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_EEPROM_JACK_IO, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause eeprom jack io show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_online_status_get_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_ONLINE_STATUS_GET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause online status get show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_online_timedout_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_ONLINE_TIMEDOUT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause online timedout show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_online_jack_io_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_ONLINE_JACK_IO, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause online jack io show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_online_jack_get_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_ONLINE_JACK_GET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause online jack get show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_serdes_settings_get_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SERDES_SETTINGS_GET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause serdes settings get show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_scan_status_get_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SCAN_STATUS_GET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause scan status get show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_scan_hdl_get_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SCAN_HDL_GET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause scan hdl get show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_scan_jack_get_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SCAN_JACK_GET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause scan jack get show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_media_attr_set_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_MEDIA_ATTR_SET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause media attr set show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_intr_event_jack_io_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_INTR_EVENT_JACK_IO, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause intr event jack io show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_power_set_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_POWER_SET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause power set show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_down_jack_io_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift down jack io show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_down_jack_io_low_power_set_show(struct kobject *kobj,
+							   struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO_LOW_POWER_SET,
+					      &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift down jack io low power set show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_down_jack_io_high_power_set_show(struct kobject *kobj,
+							    struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack,
+					      MEDIA_CAUSE_SHIFT_DOWN_JACK_IO_HIGH_POWER_SET, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift down jack io high power set show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_up_jack_io_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift up jack io show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_up_jack_io_low_power_set_show(struct kobject *kobj, struct kobj_attribute *kattr,
+							 char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO_LOW_POWER_SET,
+					      &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift up jack io low power set show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_up_jack_io_high_power_set_show(struct kobject *kobj, struct kobj_attribute *kattr,
+							  char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO_HIGH_POWER_SET,
+					      &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift up jack io high power set show (counter = %u)",
+		   counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_shift_state_jack_io_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_SHIFT_STATE_JACK_IO, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause shift state jack io show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_offline_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_OFFLINE, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause offline show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_hot_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_HOT, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause hot show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static ssize_t cause_warm_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u32                   counter;
+	u32                   rtn;
+
+	media_lgrp = container_of(kobj, struct sl_media_lgrp, counters_kobj);
+
+	rtn = sl_ctrl_media_cause_counter_get(media_lgrp->media_jack, MEDIA_CAUSE_WARM, &counter);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num);
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media cause warm show (counter = %u)", counter);
+
+	return sysfs_emit(buf, "%u\n", counter);
+}
+
+static struct kobj_attribute media_cause_eeprom_format_unsupported         =
+			     __ATTR_RO(cause_eeprom_format_unsupported);
+static struct kobj_attribute media_cause_eeprom_vendor_unsupported         =
+			     __ATTR_RO(cause_eeprom_vendor_unsupported);
+static struct kobj_attribute media_cause_eeprom_jack_io                    = __ATTR_RO(cause_eeprom_jack_io);
+static struct kobj_attribute media_cause_online_status_get                 = __ATTR_RO(cause_online_status_get);
+static struct kobj_attribute media_cause_online_timedout                   = __ATTR_RO(cause_online_timedout);
+static struct kobj_attribute media_cause_online_jack_io                    = __ATTR_RO(cause_online_jack_io);
+static struct kobj_attribute media_cause_online_jack_get                   = __ATTR_RO(cause_online_jack_get);
+static struct kobj_attribute media_cause_serdes_settings_get               = __ATTR_RO(cause_serdes_settings_get);
+static struct kobj_attribute media_cause_scan_status_get                   = __ATTR_RO(cause_scan_status_get);
+static struct kobj_attribute media_cause_scan_hdl_get                      = __ATTR_RO(cause_scan_hdl_get);
+static struct kobj_attribute media_cause_scan_jack_get                     = __ATTR_RO(cause_scan_jack_get);
+static struct kobj_attribute media_cause_media_attr_set                    = __ATTR_RO(cause_media_attr_set);
+static struct kobj_attribute media_cause_intr_event_jack_io                = __ATTR_RO(cause_intr_event_jack_io);
+static struct kobj_attribute media_cause_power_set                         = __ATTR_RO(cause_power_set);
+static struct kobj_attribute media_cause_shift_down_jack_io                = __ATTR_RO(cause_shift_down_jack_io);
+static struct kobj_attribute media_cause_shift_down_jack_io_low_power_set  =
+			     __ATTR_RO(cause_shift_down_jack_io_low_power_set);
+static struct kobj_attribute media_cause_shift_down_jack_io_high_power_set =
+			     __ATTR_RO(cause_shift_down_jack_io_high_power_set);
+static struct kobj_attribute media_cause_shift_up_jack_io                  = __ATTR_RO(cause_shift_up_jack_io);
+static struct kobj_attribute media_cause_shift_up_jack_io_low_power_set    =
+			     __ATTR_RO(cause_shift_up_jack_io_low_power_set);
+static struct kobj_attribute media_cause_shift_up_jack_io_high_power_set   =
+			     __ATTR_RO(cause_shift_up_jack_io_high_power_set);
+static struct kobj_attribute media_cause_shift_state_jack_io               =
+			     __ATTR_RO(cause_shift_state_jack_io);
+static struct kobj_attribute media_cause_offline                           = __ATTR_RO(cause_offline);
+static struct kobj_attribute media_cause_hot                               = __ATTR_RO(cause_hot);
+static struct kobj_attribute media_cause_warm                              = __ATTR_RO(cause_warm);
+
+static struct attribute *media_counters_attrs[] = {
+	&media_cause_eeprom_format_unsupported.attr,
+	&media_cause_eeprom_vendor_unsupported.attr,
+	&media_cause_eeprom_jack_io.attr,
+	&media_cause_online_status_get.attr,
+	&media_cause_online_timedout.attr,
+	&media_cause_online_jack_io.attr,
+	&media_cause_online_jack_get.attr,
+	&media_cause_serdes_settings_get.attr,
+	&media_cause_scan_status_get.attr,
+	&media_cause_scan_hdl_get.attr,
+	&media_cause_scan_jack_get.attr,
+	&media_cause_media_attr_set.attr,
+	&media_cause_intr_event_jack_io.attr,
+	&media_cause_power_set.attr,
+	&media_cause_shift_down_jack_io.attr,
+	&media_cause_shift_down_jack_io_low_power_set.attr,
+	&media_cause_shift_down_jack_io_high_power_set.attr,
+	&media_cause_shift_up_jack_io.attr,
+	&media_cause_shift_up_jack_io_low_power_set.attr,
+	&media_cause_shift_up_jack_io_high_power_set.attr,
+	&media_cause_shift_state_jack_io.attr,
+	&media_cause_offline.attr,
+	&media_cause_hot.attr,
+	&media_cause_warm.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(media_counters);
+
+static struct kobj_type media_counters = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = media_counters_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_media_counters_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_media_lgrp *media_lgrp;
+	int                   rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media counters create");
+
+	media_lgrp = sl_media_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!media_lgrp) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media_lgrp_get failed");
+		return -EFAULT;
+	}
+
+	rtn = kobject_init_and_add(&media_lgrp->counters_kobj, &media_counters, &media_lgrp->kobj,
+				   "counters");
+	if (rtn) {
+		kobject_put(&media_lgrp->counters_kobj);
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "media counters create kobject_init_and_add failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_media_counters_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media counters delete");
+
+	media_lgrp = sl_media_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!media_lgrp) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "media_lgrp_get failed");
+		return;
+	}
+
+	kobject_put(&media_lgrp->counters_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi.c
new file mode 100644
index 000000000000..605a7748e242
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static struct attribute *pmi_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(pmi);
+
+static struct kobj_type pmi_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = pmi_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_pmi_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->pmi_kobj, &pmi_info, ctrl_lgrp->parent_kobj, "pmi");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi create kobject_init_and_add failed [%d]", rtn);
+		goto out_pmi;
+	}
+
+	rtn = sl_sysfs_pmi_rd_create(ctrl_lgrp, &ctrl_lgrp->pmi_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd create failed [%d]", rtn);
+		goto out_pmi;
+	}
+
+	rtn = sl_sysfs_pmi_wr_create(ctrl_lgrp, &ctrl_lgrp->pmi_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr create failed [%d]", rtn);
+		goto out_rd;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi create (pmi_kobj = 0x%p)", &ctrl_lgrp->pmi_kobj);
+	return 0;
+
+out_rd:
+	sl_sysfs_pmi_rd_delete(ctrl_lgrp);
+out_pmi:
+	kobject_put(&ctrl_lgrp->pmi_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_pmi_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj)
+		return;
+
+	sl_sysfs_pmi_wr_delete(ctrl_lgrp);
+	sl_sysfs_pmi_rd_delete(ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->pmi_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_rd.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_rd.c
new file mode 100644
index 000000000000..8e997c4ce3f5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_rd.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_rd_addr_get(core_lgrp, &addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd addr show (addr = 0x%04X)", addr);
+
+	return sysfs_emit(buf, "0x%04X\n", addr);
+}
+
+static ssize_t data_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  data;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_rd_data_get(core_lgrp, &data);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd data show (data = 0x%04X)", data);
+
+	return sysfs_emit(buf, "0x%04X\n", data);
+}
+
+static ssize_t dev_id_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_id;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_rd_dev_id_get(core_lgrp, &dev_id);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd dev id show (dev_id = 0x%02X)", dev_id);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_id);
+}
+
+static ssize_t lane_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   lane;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_rd_lane_get(core_lgrp, &lane);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd lane show (lane = 0x%02X)", lane);
+
+	return sysfs_emit(buf, "0x%02X\n", lane);
+}
+
+static ssize_t pll_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   pll;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_rd_pll_get(core_lgrp, &pll);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd pll show (pll = 0x%02X)", pll);
+
+	return sysfs_emit(buf, "0x%02X\n", pll);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_rd_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute addr   = __ATTR_RO(addr);
+static struct kobj_attribute data   = __ATTR_RO(data);
+static struct kobj_attribute dev_id = __ATTR_RO(dev_id);
+static struct kobj_attribute lane   = __ATTR_RO(lane);
+static struct kobj_attribute pll    = __ATTR_RO(pll);
+static struct kobj_attribute result = __ATTR_RO(result);
+
+static struct attribute *pmi_rd_attrs[] = {
+	&addr.attr,
+	&data.attr,
+	&dev_id.attr,
+	&lane.attr,
+	&pll.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(pmi_rd);
+
+static struct kobj_type pmi_rd_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = pmi_rd_groups,
+};
+#endif
+
+int sl_sysfs_pmi_rd_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->pmi_rd_kobj, &pmi_rd_info, parent_kobj, "rd");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd create kobject_init_and_add failed [%d]", rtn);
+		goto out_pmi_rd;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd create (pmi_rd_kobj = 0x%p)", &ctrl_lgrp->pmi_rd_kobj);
+	return 0;
+
+out_pmi_rd:
+	kobject_put(&ctrl_lgrp->pmi_rd_kobj);
+
+	return -ENOMEM;
+#else
+	return 0;
+#endif
+}
+
+void sl_sysfs_pmi_rd_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi rd delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->pmi_rd_kobj);
+#endif
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_wr.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_wr.c
new file mode 100644
index 000000000000..ccc672378bf5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_wr.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_addr_get(core_lgrp, &addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr addr show (addr = 0x%04X)", addr);
+
+	return sysfs_emit(buf, "0x%04X\n", addr);
+}
+
+static ssize_t data_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  data;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_data_get(core_lgrp, &data);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr data show (data = 0x%04X)", data);
+
+	return sysfs_emit(buf, "0x%04X\n", data);
+}
+
+static ssize_t mask_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  mask;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_mask_get(core_lgrp, &mask);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr mask show (mask = 0x%04X)", mask);
+
+	return sysfs_emit(buf, "0x%04X\n", mask);
+}
+
+static ssize_t dev_id_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_id;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_dev_id_get(core_lgrp, &dev_id);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr dev id show (dev_id = 0x%02X)", dev_id);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_id);
+}
+
+static ssize_t lane_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   lane;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_lane_get(core_lgrp, &lane);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr lane show (lane = 0x%02X)", lane);
+
+	return sysfs_emit(buf, "0x%02X\n", lane);
+}
+
+static ssize_t pll_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   pll;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_pll_get(core_lgrp, &pll);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr pll show (pll = 0x%02X)", pll);
+
+	return sysfs_emit(buf, "0x%02X\n", pll);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pmi_wr_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute addr   = __ATTR_RO(addr);
+static struct kobj_attribute data   = __ATTR_RO(data);
+static struct kobj_attribute mask   = __ATTR_RO(mask);
+static struct kobj_attribute dev_id = __ATTR_RO(dev_id);
+static struct kobj_attribute lane   = __ATTR_RO(lane);
+static struct kobj_attribute pll    = __ATTR_RO(pll);
+static struct kobj_attribute result = __ATTR_RO(result);
+
+static struct attribute *pmi_wr_attrs[] = {
+	&addr.attr,
+	&data.attr,
+	&mask.attr,
+	&dev_id.attr,
+	&lane.attr,
+	&pll.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(pmi_wr);
+
+static struct kobj_type pmi_wr_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = pmi_wr_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_pmi_wr_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->pmi_wr_kobj, &pmi_wr_info, parent_kobj, "wr");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr create kobject_init_and_add failed [%d]", rtn);
+		goto out_pmi_wr;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr create (pmi_wr_kobj = 0x%p)", &ctrl_lgrp->pmi_wr_kobj);
+	return 0;
+
+out_pmi_wr:
+	kobject_put(&ctrl_lgrp->pmi_wr_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_pmi_wr_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "pmi wr delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->pmi_wr_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus.c
new file mode 100644
index 000000000000..a71c396e59f3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static struct attribute *sbus_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus);
+
+static struct kobj_type sbus_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_kobj, &sbus_info, ctrl_lgrp->parent_kobj, "sbus");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus;
+	}
+
+	rtn = sl_sysfs_sbus_rd_create(ctrl_lgrp, &ctrl_lgrp->sbus_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd create failed [%d]", rtn);
+		goto out_sbus;
+	}
+
+	rtn = sl_sysfs_sbus_wr_create(ctrl_lgrp, &ctrl_lgrp->sbus_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr create failed [%d]", rtn);
+		goto out_rd;
+	}
+
+	rtn = sl_sysfs_sbus_rst_create(ctrl_lgrp, &ctrl_lgrp->sbus_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rst create failed [%d]", rtn);
+		goto out_wr;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus create (sbus_kobj = 0x%p)", &ctrl_lgrp->sbus_kobj);
+	return 0;
+
+out_wr:
+	sl_sysfs_sbus_wr_delete(ctrl_lgrp);
+out_rd:
+	sl_sysfs_sbus_rd_delete(ctrl_lgrp);
+out_sbus:
+	kobject_put(&ctrl_lgrp->sbus_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj)
+		return;
+
+	sl_sysfs_sbus_rst_delete(ctrl_lgrp);
+	sl_sysfs_sbus_wr_delete(ctrl_lgrp);
+	sl_sysfs_sbus_rd_delete(ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi.c
new file mode 100644
index 000000000000..5048b0f69f76
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static struct attribute *sbus_pmi_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus_pmi);
+
+static struct kobj_type sbus_pmi_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_pmi_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_pmi_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi create (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_pmi_kobj, &sbus_pmi_info, ctrl_lgrp->parent_kobj, "sbus_pmi");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus_pmi;
+	}
+
+	rtn = sl_sysfs_sbus_pmi_rd_create(ctrl_lgrp, &ctrl_lgrp->sbus_pmi_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd create failed [%d]", rtn);
+		goto out_sbus_pmi;
+	}
+
+	rtn = sl_sysfs_sbus_pmi_wr_create(ctrl_lgrp, &ctrl_lgrp->sbus_pmi_kobj);
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr create failed [%d]", rtn);
+		goto out_rd;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi create (sbus_pmi_kobj = 0x%p)", &ctrl_lgrp->sbus_pmi_kobj);
+	return 0;
+
+out_rd:
+	sl_sysfs_sbus_pmi_rd_delete(ctrl_lgrp);
+out_sbus_pmi:
+	kobject_put(&ctrl_lgrp->sbus_pmi_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_pmi_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj)
+		return;
+
+	sl_sysfs_sbus_pmi_wr_delete(ctrl_lgrp);
+	sl_sysfs_sbus_pmi_rd_delete(ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_pmi_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_rd.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_rd.c
new file mode 100644
index 000000000000..c8042fe67eb6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_rd.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t dev_addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_dev_addr_get(core_lgrp, &dev_addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd dev_addr show (dev_addr = 0x%02X)", dev_addr);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_addr);
+}
+
+static ssize_t addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_addr_get(core_lgrp, &addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd addr show (addr = 0x%04X)", addr);
+
+	return sysfs_emit(buf, "0x%04X\n", addr);
+}
+
+static ssize_t data_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  data;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_data_get(core_lgrp, &data);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd data show (data = 0x%04X)", data);
+
+	return sysfs_emit(buf, "0x%04X\n", data);
+}
+
+static ssize_t mask_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  mask;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_mask_get(core_lgrp, &mask);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd mask show (mask = 0x%04X)", mask);
+
+	return sysfs_emit(buf, "0x%04X\n", mask);
+}
+
+static ssize_t dev_id_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_id;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_dev_id_get(core_lgrp, &dev_id);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd dev id show (dev_id = 0x%02X)", dev_id);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_id);
+}
+
+static ssize_t lane_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   lane;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_lane_get(core_lgrp, &lane);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd lane show (lane = 0x%02X)", lane);
+
+	return sysfs_emit(buf, "0x%02X\n", lane);
+}
+
+static ssize_t pll_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   pll;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_pll_get(core_lgrp, &pll);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd pll show (pll = 0x%02X)", pll);
+
+	return sysfs_emit(buf, "0x%02X\n", pll);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_rd_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute dev_addr = __ATTR_RO(dev_addr);
+static struct kobj_attribute addr     = __ATTR_RO(addr);
+static struct kobj_attribute data     = __ATTR_RO(data);
+static struct kobj_attribute mask     = __ATTR_RO(mask);
+static struct kobj_attribute dev_id   = __ATTR_RO(dev_id);
+static struct kobj_attribute lane     = __ATTR_RO(lane);
+static struct kobj_attribute pll      = __ATTR_RO(pll);
+static struct kobj_attribute result   = __ATTR_RO(result);
+
+static struct attribute *sbus_pmi_rd_attrs[] = {
+	&dev_addr.attr,
+	&addr.attr,
+	&data.attr,
+	&mask.attr,
+	&dev_id.attr,
+	&lane.attr,
+	&pll.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus_pmi_rd);
+
+static struct kobj_type sbus_pmi_rd_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_pmi_rd_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_pmi_rd_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_pmi_rd_kobj, &sbus_pmi_rd_info, parent_kobj, "rd");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus_pmi_rd;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd create (sbus_pmi_rd_kobj = 0x%p)",
+		   &ctrl_lgrp->sbus_pmi_rd_kobj);
+	return 0;
+
+out_sbus_pmi_rd:
+	kobject_put(&ctrl_lgrp->sbus_pmi_rd_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_pmi_rd_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi rd delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_pmi_rd_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_wr.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_wr.c
new file mode 100644
index 000000000000..a9de4a9e42ea
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_wr.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t dev_addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_dev_addr_get(core_lgrp, &dev_addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr dev_addr show (dev_addr = 0x%02X)", dev_addr);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_addr);
+}
+
+static ssize_t addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_addr_get(core_lgrp, &addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr addr show (addr = 0x%04X)", addr);
+
+	return sysfs_emit(buf, "0x%04X\n", addr);
+}
+
+static ssize_t data_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  data;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_data_get(core_lgrp, &data);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr data show (data = 0x%04X)", data);
+
+	return sysfs_emit(buf, "0x%04X\n", data);
+}
+
+static ssize_t mask_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u16                  mask;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_mask_get(core_lgrp, &mask);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr mask show (mask = 0x%04X)", mask);
+
+	return sysfs_emit(buf, "0x%04X\n", mask);
+}
+
+static ssize_t dev_id_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_id;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_dev_id_get(core_lgrp, &dev_id);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr dev id show (dev_id = 0x%02X)", dev_id);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_id);
+}
+
+static ssize_t lane_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   lane;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_lane_get(core_lgrp, &lane);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr lane show (lane = 0x%02X)", lane);
+
+	return sysfs_emit(buf, "0x%02X\n", lane);
+}
+
+static ssize_t pll_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   pll;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_pll_get(core_lgrp, &pll);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr pll show (pll = 0x%02X)", pll);
+
+	return sysfs_emit(buf, "0x%02X\n", pll);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_pmi_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_pmi_wr_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute dev_addr = __ATTR_RO(dev_addr);
+static struct kobj_attribute addr     = __ATTR_RO(addr);
+static struct kobj_attribute data     = __ATTR_RO(data);
+static struct kobj_attribute mask     = __ATTR_RO(mask);
+static struct kobj_attribute dev_id   = __ATTR_RO(dev_id);
+static struct kobj_attribute lane     = __ATTR_RO(lane);
+static struct kobj_attribute pll      = __ATTR_RO(pll);
+static struct kobj_attribute result   = __ATTR_RO(result);
+
+static struct attribute *sbus_pmi_wr_attrs[] = {
+	&dev_addr.attr,
+	&addr.attr,
+	&data.attr,
+	&mask.attr,
+	&dev_id.attr,
+	&lane.attr,
+	&pll.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus_pmi_wr);
+
+static struct kobj_type sbus_pmi_wr_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_pmi_wr_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_pmi_wr_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_pmi_wr_kobj, &sbus_pmi_wr_info, parent_kobj, "wr");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus_pmi_wr;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr create (sbus_pmi_wr_kobj = 0x%p)",
+		   &ctrl_lgrp->sbus_pmi_wr_kobj);
+	return 0;
+
+out_sbus_pmi_wr:
+	kobject_put(&ctrl_lgrp->sbus_pmi_wr_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_pmi_wr_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus_pmi wr delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_pmi_wr_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rd.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rd.c
new file mode 100644
index 000000000000..8f4e74f9dd2d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rd.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t dev_addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rd_dev_addr_get(core_lgrp, &dev_addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd dev addr show (dev_addr = 0x%02X)", dev_addr);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_addr);
+}
+
+static ssize_t data_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u32                  data;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rd_data_get(core_lgrp, &data);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd data show (data = 0x%08X)", data);
+
+	return sysfs_emit(buf, "0x%08X\n", data);
+}
+
+static ssize_t mask_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u32                  mask;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rd_mask_get(core_lgrp, &mask);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd mask show (mask = 0x%08X)", mask);
+
+	return sysfs_emit(buf, "0x%08X\n", mask);
+}
+
+static ssize_t reg_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   reg;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rd_reg_get(core_lgrp, &reg);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd reg show (reg = 0x%02X)", reg);
+
+	return sysfs_emit(buf, "0x%02X\n", reg);
+}
+
+static ssize_t lsb_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   lsb;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rd_lsb_get(core_lgrp, &lsb);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd lsb show (lsb = %u)", lsb);
+
+	return sysfs_emit(buf, "%u\n", lsb);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rd_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rd_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute dev_addr = __ATTR_RO(dev_addr);
+static struct kobj_attribute data     = __ATTR_RO(data);
+static struct kobj_attribute mask     = __ATTR_RO(mask);
+static struct kobj_attribute reg      = __ATTR_RO(reg);
+static struct kobj_attribute lsb      = __ATTR_RO(lsb);
+static struct kobj_attribute result   = __ATTR_RO(result);
+
+static struct attribute *sbus_rd_attrs[] = {
+	&dev_addr.attr,
+	&data.attr,
+	&mask.attr,
+	&reg.attr,
+	&lsb.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus_rd);
+
+static struct kobj_type sbus_rd_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_rd_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_rd_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_rd_kobj, &sbus_rd_info, parent_kobj, "rd");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus_rd;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd create (sbus_rd_kobj = 0x%p)", &ctrl_lgrp->sbus_rd_kobj);
+	return 0;
+
+out_sbus_rd:
+	kobject_put(&ctrl_lgrp->sbus_rd_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_rd_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rd delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_rd_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rst.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rst.c
new file mode 100644
index 000000000000..872a80636630
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rst.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t dev_addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rst_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rst_dev_addr_get(core_lgrp, &dev_addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rst dev addr show (dev_addr = 0x%02X)", dev_addr);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_addr);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_rst_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_rst_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus rst result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute dev_addr = __ATTR_RO(dev_addr);
+static struct kobj_attribute result   = __ATTR_RO(result);
+
+static struct attribute *sbus_rst_attrs[] = {
+	&dev_addr.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus_rst);
+
+static struct kobj_type sbus_rst_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_rst_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_rst_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_rst_kobj, &sbus_rst_info, parent_kobj, "rst");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rst create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus_rst;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rst create (sbus_rst_kobj = 0x%p)", &ctrl_lgrp->sbus_rst_kobj);
+	return 0;
+
+out_sbus_rst:
+	kobject_put(&ctrl_lgrp->sbus_rst_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_rst_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus rst delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_rst_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_wr.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_wr.c
new file mode 100644
index 000000000000..036977d964d6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_wr.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t dev_addr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   dev_addr;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_wr_dev_addr_get(core_lgrp, &dev_addr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr dev addr show (dev_addr = 0x%02X)", dev_addr);
+
+	return sysfs_emit(buf, "0x%02X\n", dev_addr);
+}
+
+static ssize_t data_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u32                  data;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_wr_data_get(core_lgrp, &data);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr data show (data = 0x%08X)", data);
+
+	return sysfs_emit(buf, "0x%08X\n", data);
+}
+
+static ssize_t mask_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u32                  mask;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_wr_mask_get(core_lgrp, &mask);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr mask show (mask = 0x%08X)", mask);
+
+	return sysfs_emit(buf, "0x%08X\n", mask);
+}
+
+static ssize_t reg_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   reg;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_wr_reg_get(core_lgrp, &reg);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr reg show (reg = 0x%02X)", reg);
+
+	return sysfs_emit(buf, "0x%02X\n", reg);
+}
+
+static ssize_t lsb_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u8                   lsb;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_wr_lsb_get(core_lgrp, &lsb);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr lsb show (lsb = %u)", lsb);
+
+	return sysfs_emit(buf, "%u\n", lsb);
+}
+
+static ssize_t result_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	int                  result;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, sbus_wr_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_sbus_wr_result_get(core_lgrp, &result);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr result show (result = %d)", result);
+
+	return sysfs_emit(buf, "%d\n", result);
+}
+
+static struct kobj_attribute dev_addr = __ATTR_RO(dev_addr);
+static struct kobj_attribute data     = __ATTR_RO(data);
+static struct kobj_attribute mask     = __ATTR_RO(mask);
+static struct kobj_attribute reg      = __ATTR_RO(reg);
+static struct kobj_attribute lsb      = __ATTR_RO(lsb);
+static struct kobj_attribute result   = __ATTR_RO(result);
+
+static struct attribute *sbus_wr_attrs[] = {
+	&dev_addr.attr,
+	&data.attr,
+	&mask.attr,
+	&reg.attr,
+	&lsb.attr,
+	&result.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbus_wr);
+
+static struct kobj_type sbus_wr_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sbus_wr_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_sbus_wr_create(struct sl_ctrl_lgrp *ctrl_lgrp, struct kobject *parent_kobj)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->sbus_wr_kobj, &sbus_wr_info, parent_kobj, "wr");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr create kobject_init_and_add failed [%d]", rtn);
+		goto out_sbus_wr;
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr create (sbus_wr_kobj = 0x%p)", &ctrl_lgrp->sbus_wr_kobj);
+	return 0;
+
+out_sbus_wr:
+	kobject_put(&ctrl_lgrp->sbus_wr_kobj);
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_sbus_wr_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "sbus wr delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->sbus_wr_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes.c
new file mode 100644
index 000000000000..08d2858fea54
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_str.h"
+#include "sl_sysfs_serdes_settings.h"
+#include "sl_sysfs_serdes_eye.h"
+#include "sl_sysfs_serdes_state.h"
+#include "sl_sysfs_serdes_swizzle.h"
+#include "sl_sysfs_serdes_lol.h"
+#include "sl_sysfs_serdes_los.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+u8 lane_num_to_link_num(struct sl_ctrl_lgrp *ctrl_lgrp, u8 lane_num)
+{
+	switch (ctrl_lgrp->config.furcation) {
+	case SL_MEDIA_FURCATION_X1:
+	default:
+		return 0;
+	case SL_MEDIA_FURCATION_X2:
+		if (lane_num & BIT(1))
+			return 1;
+		else
+			return 0;
+	case SL_MEDIA_FURCATION_X4:
+		return lane_num;
+	}
+}
+
+#ifdef CONFIG_SYSFS
+static ssize_t hw_rev_1_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, serdes_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "hw ver show (hw_rev_1 = 0x%X)",
+		core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)].rev_id_1);
+
+	return sysfs_emit(buf, "0x%X\n",
+		core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)].rev_id_1);
+}
+
+static ssize_t hw_rev_2_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, serdes_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "hw ver show (hw_rev_2 = 0x%X)",
+		core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)].rev_id_2);
+
+	return sysfs_emit(buf, "0x%X\n",
+		core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)].rev_id_2);
+}
+
+static ssize_t hw_version_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, serdes_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "hw ver show (hw_version = 0x%X)",
+		core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)].version);
+
+	return sysfs_emit(buf, "0x%X\n",
+		core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)].version);
+}
+
+static ssize_t fw_signature_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, serdes_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "fw signature show (fw_signature = 0x%X)",
+		core_lgrp->core_ldev->serdes.fw_info[LGRP_TO_SERDES(core_lgrp->num)].signature);
+
+	return sysfs_emit(buf, "0x%X\n",
+		core_lgrp->core_ldev->serdes.fw_info[LGRP_TO_SERDES(core_lgrp->num)].signature);
+}
+
+static ssize_t fw_version_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	ctrl_lgrp = container_of(kobj, struct sl_ctrl_lgrp, serdes_kobj);
+	core_lgrp = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "fw version show (fw_version = 0x%X)",
+		core_lgrp->core_ldev->serdes.fw_info[LGRP_TO_SERDES(core_lgrp->num)].version);
+
+	return sysfs_emit(buf, "0x%X\n",
+		core_lgrp->core_ldev->serdes.fw_info[LGRP_TO_SERDES(core_lgrp->num)].version);
+}
+
+static struct kobj_attribute hw_rev_id_1   = __ATTR_RO(hw_rev_1);
+static struct kobj_attribute hw_rev_id_2   = __ATTR_RO(hw_rev_2);
+static struct kobj_attribute hw_version    = __ATTR_RO(hw_version);
+static struct kobj_attribute fw_signature  = __ATTR_RO(fw_signature);
+static struct kobj_attribute fw_version    = __ATTR_RO(fw_version);
+
+static struct attribute *serdes_attrs[] = {
+	&hw_rev_id_1.attr,
+	&hw_rev_id_2.attr,
+	&hw_version.attr,
+	&fw_signature.attr,
+	&fw_version.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(serdes);
+
+static struct kobj_type serdes_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_groups,
+};
+
+static struct attribute *serdes_lane_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(serdes_lane);
+
+static struct kobj_type serdes_lane_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_create(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+	int asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "serdes create (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "serdes create missing parent");
+		return -EBADRQC;
+	}
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_kobj),
+				   &serdes_info, ctrl_lgrp->parent_kobj, "serdes");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes create kobject_init_and_add failed [%d]", rtn);
+		goto out_serdes;
+	}
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_lane_kobj),
+				   &serdes_lane_info, &(ctrl_lgrp->serdes_kobj), "lane");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes create kobject_init_and_add failed [%d]", rtn);
+		goto out_lane;
+	}
+
+	for (asic_lane_num = 0; asic_lane_num < SL_ASIC_MAX_LANES; ++asic_lane_num) {
+
+		rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]),
+					   &serdes_lane_info, &(ctrl_lgrp->serdes_lane_kobj), "%u", asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes create lane kobject_init_and_add failed [%d]", rtn);
+			goto out_lanes;
+		}
+
+		rtn = sl_sysfs_serdes_lane_state_create(ctrl_lgrp, asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes_lane_state_create failed [%d]", rtn);
+			goto out_lanes;
+		}
+
+		rtn = sl_sysfs_serdes_lane_swizzle_create(ctrl_lgrp, asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes_lane_swizzle_create failed [%d]", rtn);
+			goto out_state;
+		}
+
+		rtn = sl_sysfs_serdes_lane_settings_create(ctrl_lgrp, asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes_lane_settings_create failed [%d]", rtn);
+			goto out_swizzle;
+		}
+
+		rtn = sl_sysfs_serdes_lane_eye_create(ctrl_lgrp, asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes_lane_eye_create failed [%d]", rtn);
+			goto out_settings;
+		}
+
+		rtn = sl_sysfs_serdes_lane_lol_create(ctrl_lgrp, asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes_lane_lol_create failed [%d]", rtn);
+			goto out_eye;
+		}
+
+		rtn = sl_sysfs_serdes_lane_los_create(ctrl_lgrp, asic_lane_num);
+		if (rtn) {
+			sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+				   "serdes_lane_los_create failed [%d]", rtn);
+			goto out_lol;
+		}
+	}
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes create (serdes_kobj = 0x%p)", &(ctrl_lgrp->serdes_kobj));
+	return 0;
+
+out_lol:
+	sl_sysfs_serdes_lane_lol_delete(ctrl_lgrp, asic_lane_num);
+out_eye:
+	sl_sysfs_serdes_lane_eye_delete(ctrl_lgrp, asic_lane_num);
+out_settings:
+	sl_sysfs_serdes_lane_settings_delete(ctrl_lgrp, asic_lane_num);
+out_swizzle:
+	sl_sysfs_serdes_lane_swizzle_delete(ctrl_lgrp, asic_lane_num);
+out_state:
+	sl_sysfs_serdes_lane_state_delete(ctrl_lgrp, asic_lane_num);
+out_lanes:
+	kobject_put(&(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]));
+	for (asic_lane_num = asic_lane_num - 1; asic_lane_num >= 0; --asic_lane_num) {
+		sl_sysfs_serdes_lane_los_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_lol_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_eye_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_settings_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_swizzle_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_state_delete(ctrl_lgrp, asic_lane_num);
+		kobject_put(&(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]));
+	}
+out_lane:
+	kobject_put(&(ctrl_lgrp->serdes_lane_kobj));
+out_serdes:
+	kobject_put(&(ctrl_lgrp->serdes_kobj));
+
+	return -ENOMEM;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_delete(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+#ifdef CONFIG_SYSFS
+	u8 asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME, "serdes delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->parent_kobj)
+		return;
+
+	for (asic_lane_num = 0; asic_lane_num < SL_ASIC_MAX_LANES; ++asic_lane_num) {
+		sl_sysfs_serdes_lane_los_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_lol_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_eye_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_settings_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_swizzle_delete(ctrl_lgrp, asic_lane_num);
+		sl_sysfs_serdes_lane_state_delete(ctrl_lgrp, asic_lane_num);
+		kobject_put(&(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]));
+	}
+	kobject_put(&(ctrl_lgrp->serdes_lane_kobj));
+	kobject_put(&ctrl_lgrp->serdes_kobj);
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_eye.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_eye.c
new file mode 100644
index 000000000000..9dac679a96d9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_eye.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_sysfs_serdes_eye.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t value_upper_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                              rtn;
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               eye_upper;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_eye_upper_get(core_lgrp, lane_kobj->asic_lane_num, &eye_upper);
+	if (rtn == -EIO)
+		return sysfs_emit(buf, "no-serdes\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "eye value upper show (asic_lane_num = %u, eye = %u)",
+		lane_kobj->asic_lane_num, eye_upper);
+
+	return sysfs_emit(buf, "%u\n", eye_upper);
+}
+
+static ssize_t value_lower_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                              rtn;
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               eye_lower;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_eye_lower_get(core_lgrp, lane_kobj->asic_lane_num, &eye_lower);
+	if (rtn == -EIO)
+		return sysfs_emit(buf, "no-serdes\n");
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "eye value lower show (asic_lane_num = %u, eye = %u)",
+		lane_kobj->asic_lane_num, eye_lower);
+
+	return sysfs_emit(buf, "%u\n", eye_lower);
+}
+
+static ssize_t limit_high_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "eye limit high show (asic_lane_num = %u, limit = %u)",
+		lane_kobj->asic_lane_num, core_lgrp->serdes.eye_limits[lane_kobj->asic_lane_num].high);
+
+	return sysfs_emit(buf, "%u\n",
+		core_lgrp->serdes.eye_limits[lane_kobj->asic_lane_num].high);
+}
+
+static ssize_t limit_low_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "eye limit low show (asic_lane_num = %u, limit = %u)",
+		lane_kobj->asic_lane_num, core_lgrp->serdes.eye_limits[lane_kobj->asic_lane_num].low);
+
+	return sysfs_emit(buf, "%u\n",
+		core_lgrp->serdes.eye_limits[lane_kobj->asic_lane_num].low);
+}
+
+static struct kobj_attribute eye_value_upper = __ATTR_RO(value_upper);
+static struct kobj_attribute eye_value_lower = __ATTR_RO(value_lower);
+static struct kobj_attribute eye_limit_high  = __ATTR_RO(limit_high);
+static struct kobj_attribute eye_limit_low   = __ATTR_RO(limit_low);
+
+static struct attribute *serdes_lane_eye_attrs[] = {
+	&eye_value_upper.attr,
+	&eye_value_lower.attr,
+	&eye_limit_high.attr,
+	&eye_limit_low.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(serdes_lane_eye);
+
+static struct kobj_type serdes_lane_eye_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_eye_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_lane_eye_create(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane eye create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_lane_eye_kobjs[asic_lane_num].kobj),
+				   &serdes_lane_eye_info, &(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]), "eye");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes lane eye create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&(ctrl_lgrp->serdes_lane_eye_kobjs[asic_lane_num].kobj));
+		return -ENOMEM;
+	}
+	ctrl_lgrp->serdes_lane_eye_kobjs[asic_lane_num].ctrl_lgrp      = ctrl_lgrp;
+	ctrl_lgrp->serdes_lane_eye_kobjs[asic_lane_num].asic_lane_num = asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane eye create (serdes_kobj = 0x%p)", &(ctrl_lgrp->serdes_kobj));
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_lane_eye_delete(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane eye delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&(ctrl_lgrp->serdes_lane_eye_kobjs[asic_lane_num].kobj));
+	ctrl_lgrp->serdes_lane_eye_kobjs[asic_lane_num].ctrl_lgrp = NULL;
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_lol.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_lol.c
new file mode 100644
index 000000000000..d7162e985822
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_lol.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_sysfs_serdes_lol.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t tx_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                              rtn;
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	bool                             is_tx_lol;
+	struct sl_ctrl_lgrp             *ctrl_lgrp;
+	u8                               ldev_num;
+	u8                               lgrp_num;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	ctrl_lgrp = lane_kobj->ctrl_lgrp;
+	ldev_num = lane_kobj->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = lane_kobj->ctrl_lgrp->num;
+
+	rtn = sl_core_lgrp_tx_lane_is_lol(ldev_num, lgrp_num, lane_kobj->asic_lane_num, &is_tx_lol);
+	if (rtn == -ENOENT) {
+		sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+				"lol tx show (asic_lane_num = %u) - tx_lane_is_lol no cache [%d]",
+				lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "no-cache\n");
+	}
+
+	if (rtn) {
+		sl_core_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "lol tx show (asic_lane_num = %u) - tx_lane_is_lol failed [%d]",
+				      lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+			"lol tx show (asic_lane_num = %u, is_tx_lol = %s)",
+			lane_kobj->asic_lane_num, is_tx_lol ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_tx_lol ? "yes" : "no");
+}
+
+static ssize_t rx_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                              rtn;
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	bool                             is_rx_lol;
+	struct sl_ctrl_lgrp             *ctrl_lgrp;
+	u8                               ldev_num;
+	u8                               lgrp_num;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	ctrl_lgrp = lane_kobj->ctrl_lgrp;
+	ldev_num = lane_kobj->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = lane_kobj->ctrl_lgrp->num;
+
+	rtn = sl_core_lgrp_rx_lane_is_lol(ldev_num, lgrp_num, lane_kobj->asic_lane_num, &is_rx_lol);
+	if (rtn == -ENOENT) {
+		sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+				"lol rx show (asic_lane_num = %u) - rx_lane_is_lol no cache [%d]",
+				lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "no-cache\n");
+	}
+
+	if (rtn) {
+		sl_core_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "lol rx show (asic_lane_num = %u) - rx_lane_is_lol failed [%d]",
+				      lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+			"lol rx show (asic_lane_num = %u, is_rx_lol = %s)",
+			lane_kobj->asic_lane_num, is_rx_lol ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_rx_lol ? "yes" : "no");
+}
+
+static struct kobj_attribute lol_tx = __ATTR_RO(tx);
+static struct kobj_attribute lol_rx = __ATTR_RO(rx);
+
+static struct attribute *serdes_lane_lol_attrs[] = {
+	&lol_tx.attr,
+	&lol_rx.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(serdes_lane_lol);
+
+static struct kobj_type serdes_lane_lol_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_lol_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_lane_lol_create(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane lol create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->serdes_lane_lol_kobjs[asic_lane_num].kobj,
+				   &serdes_lane_lol_info, &ctrl_lgrp->serdes_lane_kobjs[asic_lane_num], "lol");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes lane lol create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_lgrp->serdes_lane_lol_kobjs[asic_lane_num].kobj);
+		return -ENOMEM;
+	}
+	ctrl_lgrp->serdes_lane_lol_kobjs[asic_lane_num].ctrl_lgrp     = ctrl_lgrp;
+	ctrl_lgrp->serdes_lane_lol_kobjs[asic_lane_num].asic_lane_num = asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane lol create (serdes_kobj = 0x%p)", &ctrl_lgrp->serdes_kobj);
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_lane_lol_delete(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane los delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->serdes_lane_lol_kobjs[asic_lane_num].kobj);
+	ctrl_lgrp->serdes_lane_lol_kobjs[asic_lane_num].ctrl_lgrp = NULL;
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_los.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_los.c
new file mode 100644
index 000000000000..bdcb6b8ae4ae
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_los.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include "asm-generic/int-ll64.h"
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_sysfs_serdes_los.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t tx_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                              rtn;
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	bool                             is_tx_los;
+	struct sl_ctrl_lgrp             *ctrl_lgrp;
+	u8                               ldev_num;
+	u8                               lgrp_num;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	ctrl_lgrp = lane_kobj->ctrl_lgrp;
+	ldev_num = lane_kobj->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = lane_kobj->ctrl_lgrp->num;
+
+	rtn = sl_core_lgrp_tx_lane_is_los(ldev_num, lgrp_num, lane_kobj->asic_lane_num, &is_tx_los);
+	if (rtn == -ENOENT) {
+		sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+				"los tx show (asic_lane_num = %u) - tx_lane_is_los no cache [%d]",
+				lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "no-cache\n");
+	}
+
+	if (rtn) {
+		sl_core_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "los tx show (asic_lane_num = %u) - tx_lane_is_los failed [%d]",
+				      lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+			"los tx show (asic_lane_num = %u, is_tx_los = %s)",
+			lane_kobj->asic_lane_num, is_tx_los ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_tx_los ? "yes" : "no");
+}
+
+static ssize_t rx_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	int                              rtn;
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	bool                             is_rx_los;
+	struct sl_ctrl_lgrp             *ctrl_lgrp;
+	u8                               ldev_num;
+	u8                               lgrp_num;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	ctrl_lgrp = lane_kobj->ctrl_lgrp;
+	ldev_num = lane_kobj->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = lane_kobj->ctrl_lgrp->num;
+
+	rtn = sl_core_lgrp_rx_lane_is_los(ldev_num, lgrp_num, lane_kobj->asic_lane_num, &is_rx_los);
+	if (rtn == -ENOENT) {
+		sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+				"los rx show (asic_lane_num = %u) - rx_lane_is_los no cache [%d]",
+				lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "no-cache\n");
+	}
+
+	if (rtn) {
+		sl_core_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "los rx show (asic_lane_num = %u) - rx_lane_is_los failed [%d]",
+				      lane_kobj->asic_lane_num, rtn);
+		return sysfs_emit(buf, "error\n");
+	}
+
+	sl_core_log_dbg(ctrl_lgrp, LOG_NAME,
+			"los rx show (asic_lane_num = %u, is_rx_los = %s)",
+			lane_kobj->asic_lane_num, is_rx_los ? "yes" : "no");
+
+	return sysfs_emit(buf, "%s\n", is_rx_los ? "yes" : "no");
+}
+
+static struct kobj_attribute los_tx = __ATTR_RO(tx);
+static struct kobj_attribute los_rx = __ATTR_RO(rx);
+
+static struct attribute *serdes_lane_los_attrs[] = {
+	&los_tx.attr,
+	&los_rx.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(serdes_lane_los);
+
+static struct kobj_type serdes_lane_los_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_los_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_lane_los_create(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane los create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&ctrl_lgrp->serdes_lane_los_kobjs[asic_lane_num].kobj,
+				   &serdes_lane_los_info, &ctrl_lgrp->serdes_lane_kobjs[asic_lane_num], "los");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes lane los create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&ctrl_lgrp->serdes_lane_los_kobjs[asic_lane_num].kobj);
+		return -ENOMEM;
+	}
+	ctrl_lgrp->serdes_lane_los_kobjs[asic_lane_num].ctrl_lgrp     = ctrl_lgrp;
+	ctrl_lgrp->serdes_lane_los_kobjs[asic_lane_num].asic_lane_num = asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane los create (serdes_kobj = 0x%p)", &ctrl_lgrp->serdes_kobj);
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_lane_los_delete(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane los delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&ctrl_lgrp->serdes_lane_los_kobjs[asic_lane_num].kobj);
+	ctrl_lgrp->serdes_lane_los_kobjs[asic_lane_num].ctrl_lgrp = NULL;
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_settings.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_settings.c
new file mode 100644
index 000000000000..b33174640663
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_settings.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "sl_sysfs_serdes_settings.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t pre1_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	s16                              pre1;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pre1_get(core_lgrp, lane_kobj->asic_lane_num, &pre1);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "settings pre1 show (pre1 = %d)", pre1);
+
+	return sysfs_emit(buf, "%d\n", pre1);
+}
+
+static ssize_t pre2_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	s16                              pre2;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pre2_get(core_lgrp, lane_kobj->asic_lane_num, &pre2);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "settings pre2 show (pre2 = %d)", pre2);
+
+	return sysfs_emit(buf, "%d\n", pre2);
+}
+
+static ssize_t pre3_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	s16                              pre3;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_pre3_get(core_lgrp, lane_kobj->asic_lane_num, &pre3);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "settings pre3 show (pre3 = %d)", pre3);
+
+	return sysfs_emit(buf, "%d\n", pre3);
+}
+
+static ssize_t cursor_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	s16                              cursor;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_cursor_get(core_lgrp, lane_kobj->asic_lane_num, &cursor);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "settings cursor show (cursor = %d)", cursor);
+
+	return sysfs_emit(buf, "%d\n", cursor);
+}
+
+static ssize_t post1_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	s16                              post1;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_post1_get(core_lgrp, lane_kobj->asic_lane_num, &post1);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "settings post1 show (post1 = %d)", post1);
+
+	return sysfs_emit(buf, "%d\n", post1);
+}
+
+static ssize_t post2_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	s16                              post2;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_post2_get(core_lgrp, lane_kobj->asic_lane_num, &post2);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "settings post2 show (post2 = %d)", post2);
+
+	return sysfs_emit(buf, "%d\n", post2);
+}
+
+static ssize_t media_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "settings media show (media = %d)", core_link->serdes.media_serdes_settings.media);
+	return sysfs_emit(buf, "%d\n", core_link->serdes.media_serdes_settings.media);
+}
+
+static struct kobj_attribute settings_pre1   = __ATTR_RO(pre1);
+static struct kobj_attribute settings_pre2   = __ATTR_RO(pre2);
+static struct kobj_attribute settings_pre3   = __ATTR_RO(pre3);
+static struct kobj_attribute settings_cursor = __ATTR_RO(cursor);
+static struct kobj_attribute settings_post1  = __ATTR_RO(post1);
+static struct kobj_attribute settings_post2  = __ATTR_RO(post2);
+static struct kobj_attribute settings_media  = __ATTR_RO(media);
+
+static ssize_t osr_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               osr;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_osr_get(core_lgrp, lane_kobj->asic_lane_num, &osr);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "settings osr show (osr = %u %s)", osr, sl_core_serdes_lane_osr_str(osr));
+
+	return sysfs_emit(buf, "%s\n", sl_core_serdes_lane_osr_str(osr));
+}
+
+static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               encoding;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_encoding_get(core_lgrp, lane_kobj->asic_lane_num, &encoding);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "settings encoding show (encoding = %u %s)",
+		   encoding, sl_core_serdes_lane_encoding_str(encoding));
+
+	return sysfs_emit(buf, "%s\n", sl_core_serdes_lane_encoding_str(encoding));
+}
+
+static ssize_t clocking_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u16                              clocking;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	rtn = sl_core_link_clocking_get(core_link, &clocking);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_link, LOG_BLOCK, LOG_NAME,
+		   "settings clocking show (clocking = %u %s)",
+		   clocking, sl_core_serdes_lane_clocking_str(clocking));
+
+	return sysfs_emit(buf, "%s\n", sl_core_serdes_lane_clocking_str(clocking));
+}
+
+static ssize_t width_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               width;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_width_get(core_lgrp, lane_kobj->asic_lane_num, &width);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "settings width show (width = %u %s)",
+		   width, sl_core_serdes_lane_width_str(width));
+
+	return sysfs_emit(buf, "%s\n", sl_core_serdes_lane_width_str(width));
+}
+
+static ssize_t dfe_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               dfe;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_dfe_get(core_lgrp, lane_kobj->asic_lane_num, &dfe);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "settings dfe show (dfe = %s)", (dfe) ? "enabled" : "disabled");
+
+	return sysfs_emit(buf, "%s\n", (dfe) ? "enabled" : "disabled");
+}
+
+static ssize_t scramble_dis_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               scramble_dis;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rtn = sl_core_lgrp_scramble_dis_get(core_lgrp, lane_kobj->asic_lane_num, &scramble_dis);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "settings scramble_dis show (scramble_dis = %s)", (scramble_dis) ? "set" : "not-set");
+
+	return sysfs_emit(buf, "%s\n", (scramble_dis) ? "set" : "not-set");
+}
+
+static struct kobj_attribute settings_osr          = __ATTR_RO(osr);
+static struct kobj_attribute settings_encoding     = __ATTR_RO(encoding);
+static struct kobj_attribute settings_clocking     = __ATTR_RO(clocking);
+static struct kobj_attribute settings_width        = __ATTR_RO(width);
+static struct kobj_attribute settings_dfe          = __ATTR_RO(dfe);
+static struct kobj_attribute settings_scramble_dis = __ATTR_RO(scramble_dis);
+
+static ssize_t link_training_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	if (is_flag_set(core_link->core_lgrp->link_caps[core_link->num].hpe_map, SL_LINK_CONFIG_HPE_LINKTRAIN))
+		return sysfs_emit(buf, "enabled\n");
+	else
+		return sysfs_emit(buf, "disabled\n");
+}
+
+static struct kobj_attribute settings_link_training = __ATTR_RO(link_training);
+
+static struct attribute *serdes_lane_settings_attrs[] = {
+	/* media */
+	&settings_pre1.attr,
+	&settings_pre2.attr,
+	&settings_pre3.attr,
+	&settings_cursor.attr,
+	&settings_post1.attr,
+	&settings_post2.attr,
+	&settings_media.attr,
+	/* core */
+	&settings_osr.attr,
+	&settings_encoding.attr,
+	&settings_clocking.attr,
+	&settings_width.attr,
+	&settings_dfe.attr,
+	&settings_scramble_dis.attr,
+	&settings_link_training.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(serdes_lane_settings);
+
+static struct kobj_type serdes_lane_settings_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_settings_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_lane_settings_create(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane settings create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_lane_settings_kobjs[asic_lane_num].kobj),
+				   &serdes_lane_settings_info, &(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]), "settings");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes lane settings create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&(ctrl_lgrp->serdes_lane_settings_kobjs[asic_lane_num].kobj));
+		return -ENOMEM;
+	}
+	ctrl_lgrp->serdes_lane_settings_kobjs[asic_lane_num].ctrl_lgrp      = ctrl_lgrp;
+	ctrl_lgrp->serdes_lane_settings_kobjs[asic_lane_num].asic_lane_num = asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane settings create (serdes_kobj = 0x%p)", &(ctrl_lgrp->serdes_kobj));
+
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_lane_settings_delete(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane settings delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&(ctrl_lgrp->serdes_lane_settings_kobjs[asic_lane_num].kobj));
+	ctrl_lgrp->serdes_lane_settings_kobjs[asic_lane_num].ctrl_lgrp = NULL;
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_state.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_state.c
new file mode 100644
index 000000000000..7fc14970a588
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_state.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "sl_log.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_str.h"
+#include "sl_sysfs_serdes_state.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t tx_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u32                              state;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+	rtn	  = sl_core_hw_serdes_tx_lane_state_get(core_lgrp, lane_kobj->asic_lane_num, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "state tx show (asic_lane_num = %u, state = %u %s)",
+		lane_kobj->asic_lane_num, state, sl_core_serdes_lane_state_str(state));
+
+	return sysfs_emit(buf, "%s\n", sl_core_serdes_lane_state_str(state));
+}
+
+static ssize_t rx_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	u32                              state;
+	int				 rtn;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+	rtn	  = sl_core_hw_serdes_rx_lane_state_get(core_lgrp, lane_kobj->asic_lane_num, &state);
+	if (rtn)
+		return sysfs_emit(buf, "error\n");
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME,
+		   "state rx show (asic_lane_num = %u, state = %u %s)",
+		lane_kobj->asic_lane_num, state, sl_core_serdes_lane_state_str(state));
+
+	return sysfs_emit(buf, "%s\n", sl_core_serdes_lane_state_str(state));
+}
+
+static struct kobj_attribute state_tx = __ATTR_RO(tx);
+static struct kobj_attribute state_rx = __ATTR_RO(rx);
+
+static struct attribute *serdes_lane_state_attrs[] = {
+	&state_tx.attr,
+	&state_rx.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(serdes_lane_state);
+
+static struct kobj_type serdes_lane_state_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_state_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_lane_state_create(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane state create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_lane_state_kobjs[asic_lane_num].kobj),
+				   &serdes_lane_state_info, &(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]), "state");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes lane state create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&(ctrl_lgrp->serdes_lane_state_kobjs[asic_lane_num].kobj));
+		return -ENOMEM;
+	}
+	ctrl_lgrp->serdes_lane_state_kobjs[asic_lane_num].ctrl_lgrp      = ctrl_lgrp;
+	ctrl_lgrp->serdes_lane_state_kobjs[asic_lane_num].asic_lane_num = asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane state create (serdes_kobj = 0x%p)", &(ctrl_lgrp->serdes_kobj));
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_lane_state_delete(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane state delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&(ctrl_lgrp->serdes_lane_state_kobjs[asic_lane_num].kobj));
+	ctrl_lgrp->serdes_lane_state_kobjs[asic_lane_num].ctrl_lgrp = NULL;
+#endif /* CONFIG_SYSFS */
+}
diff --git a/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_swizzle.c b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_swizzle.c
new file mode 100644
index 000000000000..5f2d17fc15e9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes_swizzle.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/sysfs.h>
+#include <linux/kobject.h>
+
+#include "sl_log.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_str.h"
+#include "sl_sysfs_serdes_swizzle.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_SYSFS_LOG_NAME
+
+#ifdef CONFIG_SYSFS
+static ssize_t tx_source_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               tx_source;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	tx_source = core_lgrp->serdes.dt.lane_info[lane_kobj->asic_lane_num].tx_source;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "tx_source show (tx_source = %u)", tx_source);
+
+	return sysfs_emit(buf, "%u\n", tx_source);
+}
+
+static ssize_t rx_source_show(struct kobject *kobj, struct kobj_attribute *kattr, char *buf)
+{
+	struct sl_lgrp_serdes_lane_kobj *lane_kobj;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u8                               rx_source;
+
+	lane_kobj = container_of(kobj, struct sl_lgrp_serdes_lane_kobj, kobj);
+	if (!lane_kobj->ctrl_lgrp)
+		return sysfs_emit(buf, "no-lane\n");
+
+	core_link = sl_core_link_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num,
+				     lane_num_to_link_num(lane_kobj->ctrl_lgrp, lane_kobj->asic_lane_num));
+	if (!core_link)
+		return sysfs_emit(buf, "no-link\n");
+
+	core_lgrp = sl_core_lgrp_get(lane_kobj->ctrl_lgrp->ctrl_ldev->num, lane_kobj->ctrl_lgrp->num);
+	if (!core_lgrp)
+		return -ENODEV;
+
+	rx_source = core_lgrp->serdes.dt.lane_info[lane_kobj->asic_lane_num].rx_source;
+
+	sl_log_dbg(core_lgrp, LOG_BLOCK, LOG_NAME, "rx_source show (rx_source = %u)", rx_source);
+
+	return sysfs_emit(buf, "%u\n", rx_source);
+}
+
+static struct kobj_attribute tx_source = __ATTR_RO(tx_source);
+static struct kobj_attribute rx_source = __ATTR_RO(rx_source);
+
+static struct attribute *serdes_lane_swizzle_attrs[] = {
+	&tx_source.attr,
+	&rx_source.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(serdes_lane_swizzle);
+
+static struct kobj_type serdes_lane_swizzle_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = serdes_lane_swizzle_groups,
+};
+#endif /* CONFIG_SYSFS */
+
+int sl_sysfs_serdes_lane_swizzle_create(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	int rtn;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane swizzle create (lgrp = 0x%p)", ctrl_lgrp);
+
+	rtn = kobject_init_and_add(&(ctrl_lgrp->serdes_lane_swizzle_kobjs[asic_lane_num].kobj),
+				   &serdes_lane_swizzle_info, &(ctrl_lgrp->serdes_lane_kobjs[asic_lane_num]), "swizzle");
+	if (rtn) {
+		sl_log_err(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+			   "serdes lane swizzle create kobject_init_and_add failed [%d]", rtn);
+		kobject_put(&(ctrl_lgrp->serdes_lane_swizzle_kobjs[asic_lane_num].kobj));
+		return -ENOMEM;
+	}
+	ctrl_lgrp->serdes_lane_swizzle_kobjs[asic_lane_num].ctrl_lgrp      = ctrl_lgrp;
+	ctrl_lgrp->serdes_lane_swizzle_kobjs[asic_lane_num].asic_lane_num = asic_lane_num;
+
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane swizzle create (serdes_kobj = 0x%p)", &(ctrl_lgrp->serdes_kobj));
+	return 0;
+#else /* CONFIG_SYSFS */
+	return 0;
+#endif /* CONFIG_SYSFS */
+}
+
+void sl_sysfs_serdes_lane_swizzle_delete(struct sl_ctrl_lgrp *ctrl_lgrp, u8 asic_lane_num)
+{
+#ifdef CONFIG_SYSFS
+	sl_log_dbg(ctrl_lgrp, LOG_BLOCK, LOG_NAME,
+		   "serdes lane swizzle delete (lgrp = 0x%p)", ctrl_lgrp);
+
+	kobject_put(&(ctrl_lgrp->serdes_lane_swizzle_kobjs[asic_lane_num].kobj));
+	ctrl_lgrp->serdes_lane_swizzle_kobjs[asic_lane_num].ctrl_lgrp = NULL;
+#endif /* CONFIG_SYSFS */
+}

-- 
2.56.0

