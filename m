Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793394108;
	b=VdEuIynyFoIPvNXVhtRHkZFrGQWilWUtxH95roGOkLr+Ng/Nv8rsKLq4lJTwvbmolk20
	 Oo2ZezYZlndHqmeDz8Ylh847utADTPOAMVzBkntzIF1hIVS2dpVLA7XdRW/vfJWrqE4zZ
	 +FwJk2HqIOLYl1z356hkuXSH7aF9uIPCtl8rzksJpXAaUovf9Q+cTTSQIQpo3LInAeD8H
	 C34FS2m2P5YuQv7saoRZmb6P1jNC7ZopbMLzuDIaNIeinQfBGMkMs1C2erklUwvAgR5g9
	 QBpsgfhqQtq1DG7/9WGauetqX2eb/3c0qe8I+7/1D4IQxx3L464NFEqTdjUiNJjB07w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:CC:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DHAqlNXNAH4VQycPKNGHgdZB+LZ5Ys2Xf4AcdnkGRP8=;
	b=TOT7M/LzILEPfkkCTzIhGE7HAEYrAYdZQqd4aFWNYhgtL7sZzH3SjFj9gNbNzdVLx/rb
	 ZCf3goD3swhxLboW2OR7Yl3aD3iGgD982XLJ67+fopgRxK45lVp9raSZNx41e5pavGTQ+
	 46NlGdWyS7/4PYKLRr/SAWgQCh2FnR6zRRvp4rbvTQOI11NPkrIFj8OhAiWx3DrF16xRI
	 sRWiXFWGOhQFMneYOGnS8S8jcXW81PBumxEnjYcte8iE35tbz2eyfOBDnnuR0PWX0glJB
	 Ugfwhy0c6FOu+bvof2G42bYtvibhNqJg5LOBRUAG6EcqEbWvHt2ite59Ec9VsOIpR5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=NPLQ04Fa;
	arc=fail smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22560A3815;
	Fri, 30 Oct 2026 21:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB22560A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=NPLQ04Fa
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UI066X770924;
	Fri, 30 Oct 2026 21:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=DH
	AqlNXNAH4VQycPKNGHgdZB+LZ5Ys2Xf4AcdnkGRP8=; b=NPLQ04Fa/5+9bl/mrm
	I/LQGmn0U+oH+SskcINSeeWOBtKZTM8vqz8aWjs1ijmYJ0akmudoabAf4MlnEitw
	oEw4xC1d28k/bbkFqVmu0E0Ml3/m5S0v3cro2iMwAnPY9DBt0Sm6UcVzfz353dmo
	GQ+Feul9CixNhrW/pilJyRmcgRtvhi5brgJD6DytXZPsHlUlO+0c0Z7B7bcDe3aS
	OSfeOwNdVwcNkG7esQHQKGb3I2tVv7OOP6YghH4pTQ6daY+fsWXBf/VEo1s2UKJO
	+Qa7vcvKoWje0D0EW3HaOIRGOLc1rXCP03BhVS0tdG3mKa28ZOlOXmX8/GLQUTRc
	Czvw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmvmy4y1f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:10 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 1F0E8D25A;
	Fri, 30 Oct 2026 21:01:09 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:42 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:41 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:41 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlhT9zemnHrajckEc0mu4bxNgeft/6A9JcRSWPdzFIEmHeggbYtRPS3chxbud+tJU9mo7GO9BmYnX1/wgrdaylUR2aHXOV8gll47tzcxgi8LqNwzEEor088diC5xnYntVSZYMxP2SI8D19UH7hYsqi3ADiAvsyVdejqBU5DFoLymItB2kGfAXvA1TO8hG/A0qpz1I/hRMBV2BFEn+Ujz5Kt06Bqr5wB7onLPa+wEoPqAP2u1U5D/kHee8w64SaCdoZviRuOt1K3heY75SavoGzWRP4M1WkPQEuGiaxUsThaUZQ1nNBsyFoHre27rVFpbkHA79XKBAVzz4Rq5Evw5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHAqlNXNAH4VQycPKNGHgdZB+LZ5Ys2Xf4AcdnkGRP8=;
 b=s5akUhPF3unZmUtMpos//SKVTxUIgx9ekiBEXPjbFDJj3srYxSaskC9blb4/Guto6K8T5lVA71mXR/6urbANoQxKzggXADAEyAuwUSXDTy/ARpDdYCKsHdbpbTzwjKGubplp4lU0hWY3X3h4YBN3LcrTLQlq1eMloyu+Ean1cVP9x30vNovgzTtDOE1DS1G1cxPKZ/dZhVfSYFGldO6QoVUPHrM8THiKnuhQuotiD266z+aMHGIxS3Esz/VbwxL9K5QlaTAFFLg06sR+JxhiaA6p6zWEdVRoWzyXGvDmeWNSoTCusm/U2A6L9LqJh93y+5yIAFlfMBKQgYGLxtZIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:34 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:34 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:07 -0700
Subject: [PATCH 11/23] net: hpe: sl: add the core link state machines
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-11-8c2c391cc283@hpe.com>
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
        "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>,
        Sandeep Bhoot
	<sandeep.bhoot@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: CH0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:610:b0::21) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 82c9bf30-e4da-430a-1fa0-08df36c8d69b
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|18092099006|22082099003|3023799007|921020|56012099006|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003|261009221227099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 17bx0tnJBKzc/A0WdwLKfbpVKgS2MkD/1NhUrw2FtkVK26CkkhprLTAJuQ/LPvxZPdZURQlKWCuri8xjGYJKtu9+fF0DtIyU5ROuEz3VjZrav0YyX7jeViNCP4U0+vtNZ0lLDAxEoFq2SylyeH4gHTWooJK+mtxuBHMwFhbS+crs7IDd3vOC6raC+SR9GDq7luUc622uQTbGJCDFejnco5Hq3Gl+VNputEMECLnge9jluzZwoqlfueHF/s/QTEghT1RDZP7UhBWARntwl/rQk9BTDbI4akcmxjJNcA2rGC0uQEeatjhIaxJsv/bdmmZo8RY50hVx6VEwiOZtTp8XQL67VcqS7aGtpCo8mjzZYGN6pFJMGHp/saMJA4ncYOYfQUnNIZ5ENFYToT9dfEbAJVhrjOV4Gm6ZB/ImgewIdwGOHmIaSySgM5O2j703SEeMdfAr1rBwxZdpmhAULBFfuDRtpjV5cXJ8j0XQCdBCBjUmoV99PjTXxjj3sbM235NmwFoj6tgt85w7blaCcwvmOLwkRJF+xNAXMbiCV5UYCvKONqkI69P2ZKvfPSGuxIXfgr8inQLWOKSCuqaq7Fw79fAhpUsk8Cntu+PwqB81fSijhZ8aIf3Lnzno7oY9JaWe9P5T+yF7m2HLQd5KuOPt2DA4UMWiV4sjnxYrqDfQMk4YMw/YNdSjbGtIFGKKpHprLcS7JUoV1MAVRY8EPXov8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(18092099006)(22082099003)(3023799007)(921020)(56012099006)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261009221227099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUVCWjg3Y1BpTGtoeE1SeDVpWk9vZHREZUZ2ckJaUnRPdTA1TUVaRXRwS1pq?=
 =?utf-8?B?MDg2UFlJRjlWN3VJWTRYY0FUZFBKYmNRbVI1VlV2Uk9XdVJ0R3RwNDI5ZXZS?=
 =?utf-8?B?RURCd2ZwL1E1OTlPdncrZW9BVStxY2pSdllaU3BLakxWT3VrSzEwRkJuVGtj?=
 =?utf-8?B?VVdaTWlhdVFRcU9pYkcrV0RoeHBFV2R3YnAzYitoMEpDbHVvVXUvS3IzL2RQ?=
 =?utf-8?B?d3FUcGp5V0gzVXZPOVVqT05ERUgraDNaQ3RoWHo1R1oxNGxGSXFvWUE5QjZR?=
 =?utf-8?B?NXJKd3JCdldxSGRXa1AveUI5azNwZksrMzBCU3ZyMlBERmhsYmRubStlRXhh?=
 =?utf-8?B?Ujd0UTJMQkEyeHhrSWkyNFZiS2FxMlFHeTVEVTRRYTZvbGZGKy9TQi92MWFB?=
 =?utf-8?B?S1Nmcm9MdEpDTExkZEQxUzNzdXB3ZWp6L2g4dEh3cWJkUU1KWGdIVjZHT2Zy?=
 =?utf-8?B?ZGo4Qnh1TnlUMG5Uc2RMb2Erc3FOMlpyc3FaYWF0WEdaNmxMU3pmUC83QUsw?=
 =?utf-8?B?dXJUYWJ2VWxWWWJXZldkM0RNMGhtSDA0RDB4Mk5lSUpyN0NRNzhNY1ZWRU4v?=
 =?utf-8?B?ZkxXUlZBSVRld2xxM0dIWHd6bWdqY3pMckVyUlhvcnVCZW1vTGhRMCtuQjBl?=
 =?utf-8?B?UmRiMlFlV1NFM2pHTmpTSnl4WGxjMkZjQ2VyL3M0MWthZWhMT01hSWpzZnlz?=
 =?utf-8?B?NjFzUGZCRHdnbjZQL3dKQ0h4V0lyRFplTzN0V1FoTkUySjFpLzBKaGdxZ1Ix?=
 =?utf-8?B?K281Nnp4elVPSGZBVFlBSGVqYWg4alNyN1IrZklQRGhRUnZvejJSVGxReFc2?=
 =?utf-8?B?RkRlOTJLTFNxMVpoS0FKSms4U0FOQzQ0NE9uZEYybllwRnEwMEpRdVkzQ0RB?=
 =?utf-8?B?aWUrUUxyeDBiY0hzNHNZZ2d5YzMrUnJWZkxINzNlNkQzdTFPRFY4VFpEQTAz?=
 =?utf-8?B?ck9qOEVPK0I3dGk0MENGV1EvZGJsYllZK0w5anRvdG9IVFRRenBzREJSRlNC?=
 =?utf-8?B?OTc4Yks0SEkrelhHUVVhbEROOExXRU1MUkVOMUdZbGxpVlZ5Ti9URFV5Uktz?=
 =?utf-8?B?UGpsNGVMc28yVVBtRDZFTlBLaElrKy9CcHlZb0tLTkJkWGJtcVpXRzlQVG9k?=
 =?utf-8?B?K2hMdGJQd3VUODNWU041LzVMYVZ0UWZMSUNCUnlZOWs3anZQeDFxTjU2Ty9I?=
 =?utf-8?B?Qi9CYTV0dHVJOFVUUXo1cXhVcks1cUI4ejRvMnhFTGQ5cEJ4a0VaQUMxZnVo?=
 =?utf-8?B?dndmRkFtd3Q5R29ubDVpNWNvcmY3MmF2b1BZUVN5eEt5R2hCUTVjbHBpMkZ3?=
 =?utf-8?B?aWdwc25zWmVhUVFmYWs3S2dlcUZXdEEyZm96Q0Y4QzZBbzZPS01HWGVRRzF5?=
 =?utf-8?B?V3owZW5XRGhjTytrQmpEamhXYzByRmJvQVczWXFkRVNSQXRrdWIyQ0tXUkQ1?=
 =?utf-8?B?Z0E5S1Y4MURpY3VLQkRIZkNWQkNRc3p1TUhXd2x6VXorbDVvL0JYTjIra3B4?=
 =?utf-8?B?NUZDR2tOblp3bFQyZGZ5dFpsa2lBS0lHRkFpVGhVVW1oMUpSWVlLYlZDREcy?=
 =?utf-8?B?NkVVOUdyQjFXVzAxOW0xZ0c2eGI3RWpYL0h6bnFCQXNWSzBXUmdRN1VqcUFM?=
 =?utf-8?B?VWlNc1NNc1lGSGhFMHgrL2RPNC93UTdjMk92b0tUVFMzWGhENG91QWtvZmdW?=
 =?utf-8?B?T0JMWXR3R2JMbDdFWTRHdXh3K0hqYkJhUnRZWFJzK1VGK2xwNUxaYnN1OUov?=
 =?utf-8?B?azlzK3BQY2YwdlErVy9wem16am5IL21HeUdEN1QxZ1dmTHpBRU4waUlTZlNk?=
 =?utf-8?B?ek9ZWkhPSGZTVkJ6T2UwUGNwODJBZVRyeUtHK2wxYTR3RWVOUGR3a0NoVk9p?=
 =?utf-8?B?WDFkYk9lNzZNMXhWUGgzdnVGQTFCQSsvM0FpZVZGZjg3enZnWCtlYmF5ODRo?=
 =?utf-8?B?TjNsVEpiWHlWd3VmbFI3Z3FyVngxbmpXSU5sSm02L1lrU2VhZnAvQjJOQXI0?=
 =?utf-8?B?dHJRT25uTVlpL2xIODJ5OWVhalRiZTNBZ09wQ0ExMnJBV0lyOXJ3U3orM0lV?=
 =?utf-8?B?cG9veUk0dTN0eTUvMGFuT0pFRjNTTVFWNnl0KzZPeHp1dm1KNFJPdEMvNHRI?=
 =?utf-8?B?VHUvUktDMllpdUMza0ZnZVdFWFhER2hLRjZPcm5MOXk5NFV2OVBqNEdDNHcv?=
 =?utf-8?B?L0w3aFF5UWdpUGZGbG5EeTRZL3Q0dzQyN3kxSmJNeEpGUCtjaTlGc2VJa08w?=
 =?utf-8?B?WUIyUkhDNUw1RkgrUVNrNERSS0NvWEFKZm9hQ0pPQjJpSTlxUUptVlpwWkdY?=
 =?utf-8?B?RU5mbDhuYTRqZnErL1hET2J5cGlpbjcwNXBXVjZRK200YVBQY3ZtQT09?=
X-Exchange-RoutingPolicyChecked: B8U0yZXdBna6yMO//Nx1FayB2DTCLWe2Pk3JGMqFGkELymCFMuEZPgMLOle0VnqOKp84EhCDPT9F2hHm2ZK7Z/QMp0RgM22gXftb/u/H6YZ3P1+vTuJW5tSW4/Vgh4bh91XflDwUiHWvSvNKFqKpwSqUH4+waCMot4GmrK/OzLY/dLbSnA+mzYgpeak7KYWX1sbIsfS8ckdXZgiFqy6IOpQI2Kb2UFzRCNs4Dk69tQzrNv4qq50//3U9o2/U0I3lPtMY573T6rRWm2AHGUVwIpvT71mRpMt0YLz9D5MkxAAeL+fYasuemGzuvZGq8eMczGwycMivmlc8xpUUJ7ygbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c9bf30-e4da-430a-1fa0-08df36c8d69b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:34.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGQkwsHICXI71beWwMts4ermJA6IKOj7CCqSwTmuYn789jCqgW+NbwAi4fwbYnAtB9VnPG1MWPHCA9+IsA8dFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: CuD099V6mVdUZ8uP7YUWgaZ3RSZG9CGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXxWjvlRxGiV2n
 pBmmhzOGKwurjMu9Ha/Mh+hzH+xNUPLog6C6IKoJKaRwQO/z+m0BlnosaJGmqSsEnHL+7UUpJUB
 PH0YNFn24aM1qn3wV6CiSqvGo39huwCTmtraZ1OXL8dSSWLom+ghzw/r1HbK/l/IFkHYJSjETDB
 mnAkuOiUVuZp1yKctd5BWOXenIxyNxjhegRNgrsAeMDK3RcZTTsDgqlpNlJRoMSa6S2/Tz3jg1L
 dnQtT+D0mRL4oFNUs3obr0HGS3Op0fci4SQ4pxX2OV3pIx3gJEUh7exrk2qGN052lZdYoU3Nz/o
 pS0akbZ2L6HhSmFHdJiCN0ceuXIvdptJQCZSlyKEsh3Z45xU/dukh6KtpXr9xqFAggzecs3t85Z
 rGhrrthoof/FbJBvPOauyT1YMUUKClSTeJfxzdDMsoRHc4S4uE7PHEoD+mMpA1Ed626mwtY/sni
 eo3phIo9F6I1kH1Zodw==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6ae50596 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ModqzXLkJJ0tFyq98apW:22 a=MvuuwTCpAAAA:8 a=hct8ATeFExnyJkusK0wA:9
 a=MTSWqNpXELp0pJEy:21 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CuD099V6mVdUZ8uP7YUWgaZ3RSZG9CGv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX6Bvl0WqWse+P
 QhNYzuq787OPoG92GnYUeIH/jpE6dsmA6H0BFHRTpkkZjUtHw1cVTgaMbFAiPRX9IrDZOGS11DB
 vMPmmQ2rCN7rtU4+tLOEw6ARnqcw5Do=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the SL core: the link, LLR and MAC state machines, their timers
and work items, and the hardware access layer including auto-
negotiation, FEC, PCS and SerDes firmware handling.

sl_core_data_lgrp_del() returns early, without deleting the link group,
while the group is still being configured.  The function returns void,
so callers cannot learn this and may go on to tear down the parent
logical device.  The early return is documented in the code.

If creating a link fails after its interrupt handlers are registered,
sl_core_data_link_new() now runs the normal link cleanup before freeing
the link, so no handler, timer or work item can reference freed memory.

Known open issue (Sashiko M23, deferred):
sl_core_hw_pcs_keep_all_lanes_active_set() is an empty hook marked with
a TODO. It belongs to graceful lane-degrade support, which SL does not
implement yet; it is low priority and will be addressed after this
series.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (595), LONG_LINE_COMMENT (101), LONG_LINE_STRING
  (57), SPLIT_STRING (8), LEADING_SPACE (1)
- CHECK: UNNECESSARY_PARENTHESES (240), MACRO_ARG_REUSE (8), BRACES (6),
  ALLOC_SIZEOF_STRUCT (5), COMPARISON_TO_NULL (3), CAMELCASE (2),
  OPEN_ENDED_LINE (1), USLEEP_RANGE (1)

Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 .../ethernet/hpe/sl/core/base/sl_core_timer_link.c |  109 +
 .../ethernet/hpe/sl/core/base/sl_core_timer_llr.c  |   84 +
 .../hpe/sl/core/data/nic/sl_core_data_link.c       |   11 +
 .../hpe/sl/core/data/nic/sl_core_data_mac.c        |   11 +
 .../ethernet/hpe/sl/core/data/sl_core_data_ldev.c  |  122 ++
 .../ethernet/hpe/sl/core/data/sl_core_data_lgrp.c  |  351 ++++
 .../hpe/sl/core/data/sl_core_data_lgrp_trace.c     |   50 +
 .../ethernet/hpe/sl/core/data/sl_core_data_link.c  | 1343 ++++++++++++
 .../ethernet/hpe/sl/core/data/sl_core_data_llr.c   |  526 +++++
 .../ethernet/hpe/sl/core/data/sl_core_data_mac.c   |  273 +++
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_an.c    |   26 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_fec.c   |  113 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_llr.c   |   44 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_mac.c   |   32 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_pcs.c   |   14 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an.c    |  602 ++++++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an_lp.c |  254 +++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an_up.c |  270 +++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_intr.c  |  222 ++
 .../ethernet/hpe/sl/core/hw/sl_core_hw_intr_llr.c  |  181 ++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_link.c  | 2172 ++++++++++++++++++++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.c   |  905 ++++++++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_mac.c   |  172 ++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_pcs.c   |  365 ++++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_pmi.c   |   54 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_reset.c |   67 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus.c  |  125 ++
 .../ethernet/hpe/sl/core/hw/sl_core_hw_sbus_pmi.c  |  112 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_serdes.c    |  212 ++
 .../hpe/sl/core/hw/sl_core_hw_serdes_core.c        |  439 ++++
 .../ethernet/hpe/sl/core/hw/sl_core_hw_serdes_fw.c |  191 ++
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane.c        | 1085 ++++++++++
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane_rx.c     |  241 +++
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane_tx.c     |  394 ++++
 .../hpe/sl/core/hw/sl_core_hw_serdes_link.c        |  349 ++++
 .../ethernet/hpe/sl/core/hw/sl_core_hw_uc_ram.c    |   84 +
 drivers/net/ethernet/hpe/sl/core/sl_core_ldev.c    |  192 ++
 drivers/net/ethernet/hpe/sl/core/sl_core_lgrp.c    |  659 ++++++
 drivers/net/ethernet/hpe/sl/core/sl_core_link.c    |  623 ++++++
 drivers/net/ethernet/hpe/sl/core/sl_core_link_an.c |  166 ++
 .../net/ethernet/hpe/sl/core/sl_core_link_fec.c    |  233 +++
 drivers/net/ethernet/hpe/sl/core/sl_core_llr.c     |  350 ++++
 drivers/net/ethernet/hpe/sl/core/sl_core_mac.c     |  183 ++
 drivers/net/ethernet/hpe/sl/core/sl_core_str.c     |  283 +++
 44 files changed, 14294 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sl/core/base/sl_core_timer_link.c b/drivers/net/ethernet/hpe/sl/core/base/sl_core_timer_link.c
new file mode 100644
index 000000000000..4b0af513afb6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/base/sl_core_timer_link.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "sl_platform.h"
+#include "base/sl_core_timer_link.h"
+#include "base/sl_core_log.h"
+
+#include "hw/sl_core_hw_intr.h"
+
+#define LOG_NAME SL_CORE_TIMER_LINK_LOG_NAME
+
+void sl_core_timer_link_begin(struct sl_core_link *core_link, u32 timer_num)
+{
+	int  rtn;
+	enum sl_core_link_state link_state;
+	bool is_canceled_or_timed_out;
+
+	if (core_link->timers[timer_num].data.timeout_ms == 0) {
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "begin %s timeout is 0 (timer_num = %u)",
+				      core_link->timers[timer_num].data.log, timer_num);
+		return;
+	}
+
+	core_link->timers[timer_num].timer.expires =
+		jiffies + msecs_to_jiffies(core_link->timers[timer_num].data.timeout_ms);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"begin %s (core_link = 0x%p, timer_num = %u, timeout = %dms, jiffies = %ld)",
+			core_link->timers[timer_num].data.log, core_link, timer_num,
+			core_link->timers[timer_num].data.timeout_ms,
+			core_link->timers[timer_num].timer.expires);
+
+	rtn = sl_core_link_is_canceled_or_timed_out(core_link, &is_canceled_or_timed_out);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "begin %s is_canceled_or_timed_out failed (timer_num = %u) [%d]",
+				      core_link->timers[timer_num].data.log, timer_num, rtn);
+		return;
+	}
+
+	if (is_canceled_or_timed_out) {
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"begin %s canceled (timer_num = %u)",
+				      core_link->timers[timer_num].data.log, timer_num);
+		return;
+	}
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UNCONFIGURED:
+	case SL_CORE_LINK_STATE_CONFIGURING:
+	case SL_CORE_LINK_STATE_CONFIGURED:
+	case SL_CORE_LINK_STATE_DOWN:
+	case SL_CORE_LINK_STATE_AN:
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_UP:
+		add_timer(&core_link->timers[timer_num].timer);
+		spin_unlock(&core_link->link.data_lock);
+		return;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"begin %s invalid state (link_state = %u %s, timer_num = %u)",
+				core_link->timers[timer_num].data.log,
+				link_state, sl_core_link_state_str(link_state), timer_num);
+		spin_unlock(&core_link->link.data_lock);
+		return;
+	}
+}
+
+/**
+ * sl_core_timer_link_timeout - Timer callback function executed in interrupt context.
+ * @timer: Pointer to the timer_list structure associated with the timer.
+ *
+ * Context: Interrupt context.
+ */
+void sl_core_timer_link_timeout(struct timer_list *timer)
+{
+	struct sl_core_timer_link_info *info;
+	struct sl_core_link            *core_link;
+
+	info = timer_container_of(info, timer, timer);
+	core_link = info->data.link;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"timeout %s (core_link = 0x%p, timer_num = %u, work_num = %u)",
+			info->data.log, core_link, info->data.timer_num,
+			info->data.work_num);
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue,
+		   &core_link->work[info->data.work_num]);
+}
+
+void sl_core_timer_link_end(struct sl_core_link *core_link, u32 timer_num)
+{
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"end %s (core_link = 0x%p, timer_num = %u)",
+			core_link->timers[timer_num].data.log, core_link, timer_num);
+
+	timer_delete_sync(&core_link->timers[timer_num].timer);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/base/sl_core_timer_llr.c b/drivers/net/ethernet/hpe/sl/core/base/sl_core_timer_llr.c
new file mode 100644
index 000000000000..3f5a13470b92
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/base/sl_core_timer_llr.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+
+#include "sl_core_str.h"
+#include "sl_core_llr.h"
+#include "sl_platform.h"
+#include "base/sl_core_timer_llr.h"
+#include "base/sl_core_log.h"
+
+#define LOG_NAME SL_CORE_TIMER_LLR_LOG_NAME
+
+void sl_core_timer_llr_begin(struct sl_core_llr *core_llr, u32 timer_num)
+{
+	enum sl_core_llr_state llr_state;
+
+	if (core_llr->timers[timer_num].data.timeout_ms == 0) {
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "begin %s timeout is 0 (timer_num = %u)",
+				      core_llr->timers[timer_num].data.log, timer_num);
+		return;
+	}
+
+	core_llr->timers[timer_num].timer.expires =
+		jiffies + msecs_to_jiffies(core_llr->timers[timer_num].data.timeout_ms);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"begin %s (core_llr = 0x%p, timer_num = %u, timeout = %dms, jiffies = %ld)",
+			core_llr->timers[timer_num].data.log, core_llr, timer_num,
+			core_llr->timers[timer_num].data.timeout_ms,
+			core_llr->timers[timer_num].timer.expires);
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETTING_UP:
+	case SL_CORE_LLR_STATE_STARTING:
+		add_timer(&core_llr->timers[timer_num].timer);
+		spin_unlock(&core_llr->data_lock);
+		return;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME,
+				"begin %s invalid state (llr_state = %u %s, timer_num = %u)",
+				core_llr->timers[timer_num].data.log,
+				llr_state, sl_core_llr_state_str(llr_state), timer_num);
+		spin_unlock(&core_llr->data_lock);
+		return;
+	}
+}
+
+/**
+ * sl_core_timer_llr_timeout - Timer callback function executed in interrupt context.
+ * @timer: Pointer to the timer_list structure associated with the timer.
+ *
+ * Context: Interrupt context.
+ */
+void sl_core_timer_llr_timeout(struct timer_list *timer)
+{
+	struct sl_core_timer_llr_info *info;
+	struct sl_core_llr            *core_llr;
+
+	info = timer_container_of(info, timer, timer);
+	core_llr = info->data.core_llr;
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"timeout %s (core_llr = 0x%p, timer_num = %u, work_num = %u)",
+			info->data.log, core_llr,
+			info->data.timer_num, info->data.work_num);
+
+	queue_work(core_llr->core_lgrp->core_ldev->workqueue,
+		   &core_llr->work[info->data.work_num]);
+}
+
+void sl_core_timer_llr_end(struct sl_core_llr *core_llr, u32 timer_num)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"end %s (core_llr = 0x%p, timer_num = %u)",
+			core_llr->timers[timer_num].data.log, core_llr, timer_num);
+
+	timer_delete_sync(&core_llr->timers[timer_num].timer);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/nic/sl_core_data_link.c b/drivers/net/ethernet/hpe/sl/core/data/nic/sl_core_data_link.c
new file mode 100644
index 000000000000..e4f6b7800e6c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/nic/sl_core_data_link.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "data/sl_core_data_link.h"
+
+u16 sl_core_data_link_clock_period_get(void)
+{
+	return 0x38D;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/nic/sl_core_data_mac.c b/drivers/net/ethernet/hpe/sl/core/data/nic/sl_core_data_mac.c
new file mode 100644
index 000000000000..cb3ce36ff124
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/nic/sl_core_data_mac.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "data/sl_core_data_mac.h"
+
+u8 sl_core_data_mac_tx_cdt_init_get(void)
+{
+	return 64;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_ldev.c b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_ldev.c
new file mode 100644
index 000000000000..1d1dc0f73b17
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_ldev.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include <linux/hpe/sl/sl_ldev.h>
+
+#include "sl_asic.h"
+#include "base/sl_core_log.h"
+#include "sl_core_ldev.h"
+#include "data/sl_core_data_ldev.h"
+#include "data/sl_core_data_lgrp.h"
+#include "hw/sl_core_hw_serdes_osprey.h"
+
+static struct sl_core_ldev *core_ldevs[SL_ASIC_MAX_LDEVS];
+static DEFINE_SPINLOCK(core_ldevs_lock);
+
+#define LOG_NAME SL_CORE_DATA_LDEV_LOG_NAME
+
+int sl_core_data_ldev_new(u8 ldev_num, struct sl_accessors *accessors,
+			  struct sl_ops *ops, struct workqueue_struct *workqueue)
+{
+	int                  rtn;
+	struct sl_core_ldev *core_ldev;
+	u16                  proto;
+
+	core_ldev = sl_core_ldev_get(ldev_num);
+	if (core_ldev) {
+		sl_core_log_err(NULL, LOG_NAME, "exists (ldev = 0x%p)", core_ldev);
+		return -EBADRQC;
+	}
+
+	core_ldev = kzalloc(sizeof(struct sl_core_ldev), GFP_KERNEL);
+	if (core_ldev == NULL)
+		return -ENOMEM;
+
+	core_ldev->magic           = SL_CORE_LDEV_MAGIC;
+	core_ldev->num             = ldev_num;
+	core_ldev->accessors       = *accessors;
+	core_ldev->ops             = *ops;
+	spin_lock_init(&(core_ldev->data_lock));
+
+	rtn = core_ldev->ops.mb_info_get(core_ldev->accessors.mb,
+		&(core_ldev->platform), &(core_ldev->revision), &proto);
+	if (rtn) {
+		sl_core_log_err(core_ldev, LOG_NAME, "mb_info_get failed [%d]", rtn);
+		kfree(core_ldev);
+		return -EIO;
+	}
+
+	core_ldev->workqueue = workqueue;
+
+	core_ldev->serdes.addrs = serdes_addrs_osprey;
+
+	sl_core_log_dbg(core_ldev, LOG_NAME, "new (ldev = 0x%p, platform = %u, revision = %u)",
+			core_ldev, core_ldev->platform, core_ldev->revision);
+
+	spin_lock(&core_ldevs_lock);
+	core_ldevs[ldev_num] = core_ldev;
+	spin_unlock(&core_ldevs_lock);
+
+	return 0;
+}
+
+int sl_core_data_ldev_del(u8 ldev_num)
+{
+	struct sl_core_ldev *core_ldev;
+	int                  lgrp_num;
+	int                  rtn;
+	int                  err = 0;
+
+	core_ldev = sl_core_ldev_get(ldev_num);
+	if (!core_ldev) {
+		sl_core_log_dbg(NULL, LOG_NAME, "not found (ldev_num = %u)", ldev_num);
+		return 0;
+	}
+
+	/*
+	 * The lgrps and links look this ldev up and point back at it, so they
+	 * must be deleted while it is still published and allocated. Try every
+	 * lgrp so as much as possible is deleted, and keep the first error.
+	 */
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+		rtn = sl_core_data_lgrp_del(ldev_num, lgrp_num);
+		if (rtn && !err)
+			err = rtn;
+	}
+
+	/* An lgrp that could not be deleted still points at this ldev, so keep it. */
+	if (err) {
+		sl_core_log_err(core_ldev, LOG_NAME, "del - lgrp_del failed [%d]", err);
+		return err;
+	}
+
+	spin_lock(&core_ldevs_lock);
+	core_ldevs[ldev_num] = NULL;
+	spin_unlock(&core_ldevs_lock);
+
+	sl_core_log_dbg(core_ldev, LOG_NAME, "del (ldev = 0x%p)", core_ldev);
+
+	kfree(core_ldev);
+
+	return 0;
+}
+
+struct sl_core_ldev *sl_core_data_ldev_get(u8 ldev_num)
+{
+	struct sl_core_ldev *core_ldev;
+
+	spin_lock(&core_ldevs_lock);
+	core_ldev = core_ldevs[ldev_num];
+	spin_unlock(&core_ldevs_lock);
+
+	sl_core_log_dbg(NULL, LOG_NAME, "get (ldev_num = %u, ldev = 0x%p)",
+			ldev_num, core_ldev);
+
+	return core_ldev;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp.c b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp.c
new file mode 100644
index 000000000000..a1485787965b
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/bitops.h>
+
+#include "sl_asic.h"
+#include "sl_platform.h"
+#include "base/sl_core_log.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "data/sl_core_data_ldev.h"
+#include "data/sl_core_data_lgrp.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_reset.h"
+#include "hw/sl_core_hw_serdes.h"
+
+static struct sl_core_lgrp *core_lgrps[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS];
+static DEFINE_SPINLOCK(core_lgrps_lock);
+
+#define LOG_NAME SL_CORE_DATA_LGRP_LOG_NAME
+
+int sl_core_data_lgrp_new(u8 ldev_num, u8 lgrp_num)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp;
+
+	spin_lock(&core_lgrps_lock);
+	core_lgrp = core_lgrps[ldev_num][lgrp_num];
+	spin_unlock(&core_lgrps_lock);
+	if (core_lgrp) {
+		sl_core_log_err(NULL, LOG_NAME, "new - lgrp exists");
+		return -EBADRQC;
+	}
+
+	core_lgrp = kzalloc(sizeof(struct sl_core_lgrp), GFP_KERNEL);
+	if (core_lgrp == NULL)
+		return -ENOMEM;
+
+	core_lgrp->magic     = SL_CORE_LGRP_MAGIC;
+	core_lgrp->core_ldev = sl_core_data_ldev_get(ldev_num);
+	core_lgrp->num       = lgrp_num;
+	kref_init(&core_lgrp->ref);
+	snprintf(core_lgrp->log_connect_id, sizeof(core_lgrp->log_connect_id), "core-lgrp%02u", lgrp_num);
+	spin_lock_init(&(core_lgrp->log_lock));
+	spin_lock_init(&(core_lgrp->data_lock));
+
+	if (SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev)) {
+		rtn = core_lgrp->core_ldev->ops.dt_info_get(core_lgrp->core_ldev->accessors.dt,
+			ldev_num, lgrp_num, &(core_lgrp->serdes.dt));
+		if (rtn)
+			sl_core_log_dbg(core_lgrp, LOG_NAME, "new - dt_info_get failed [%d]", rtn);
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "DT lane = 0 tx = %u tx_inv = %u rx = %u rx_inv = %u",
+				core_lgrp->serdes.dt.lane_info[0].tx_source, core_lgrp->serdes.dt.lane_info[0].tx_invert,
+			core_lgrp->serdes.dt.lane_info[0].rx_source, core_lgrp->serdes.dt.lane_info[0].rx_invert);
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "DT lane = 1 tx = %u tx_inv = %u rx = %u rx_inv = %u",
+				core_lgrp->serdes.dt.lane_info[1].tx_source, core_lgrp->serdes.dt.lane_info[1].tx_invert,
+			core_lgrp->serdes.dt.lane_info[1].rx_source, core_lgrp->serdes.dt.lane_info[1].rx_invert);
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "DT lane = 2 tx = %u tx_inv = %u rx = %u rx_inv = %u",
+				core_lgrp->serdes.dt.lane_info[2].tx_source, core_lgrp->serdes.dt.lane_info[2].tx_invert,
+			core_lgrp->serdes.dt.lane_info[2].rx_source, core_lgrp->serdes.dt.lane_info[2].rx_invert);
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "DT lane = 3 tx = %u tx_inv = %u rx = %u rx_inv = %u",
+				core_lgrp->serdes.dt.lane_info[3].tx_source, core_lgrp->serdes.dt.lane_info[3].tx_invert,
+			core_lgrp->serdes.dt.lane_info[3].rx_source, core_lgrp->serdes.dt.lane_info[3].rx_invert);
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "DT jack_type = %u %s", core_lgrp->serdes.dt.jack_type,
+				sl_core_lgrp_dt_jack_part_str(core_lgrp->serdes.dt.jack_type));
+	} else {
+		/* straight for emulator */
+		core_lgrp->serdes.dt.lane_info[0].tx_source = 0;
+		core_lgrp->serdes.dt.lane_info[1].tx_source = 1;
+		core_lgrp->serdes.dt.lane_info[2].tx_source = 2;
+		core_lgrp->serdes.dt.lane_info[3].tx_source = 3;
+		core_lgrp->serdes.dt.lane_info[0].rx_source = 0;
+		core_lgrp->serdes.dt.lane_info[1].rx_source = 1;
+		core_lgrp->serdes.dt.lane_info[2].rx_source = 2;
+		core_lgrp->serdes.dt.lane_info[3].rx_source = 3;
+
+		/* No swap for emulator */
+		core_lgrp->serdes.dt.jack_type = lgrp_num % 2 ? SL_DT_JACK_TYPE_DD : SL_DT_JACK_TYPE_LEGACY;
+	}
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "new - dt info (id = %u, addr = 0x%X)",
+			core_lgrp->serdes.dt.dev_id, core_lgrp->serdes.dt.dev_addr);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "new (lgrp = 0x%p)", core_lgrp);
+
+	spin_lock(&core_lgrps_lock);
+	if (core_lgrps[ldev_num][lgrp_num]) {
+		spin_unlock(&core_lgrps_lock);
+		sl_core_lgrp_put(core_lgrp);
+		return -EBADRQC;
+	}
+	core_lgrps[ldev_num][lgrp_num] = core_lgrp;
+	spin_unlock(&core_lgrps_lock);
+
+	return 0;
+}
+
+void sl_core_data_lgrp_connect_id_set(u8 ldev_num, u8 lgrp_num, const char *connect_id)
+{
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	unsigned long        irq_flags;
+
+	core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_lgrp)
+		return;
+
+	spin_lock_irqsave(&(core_lgrp->log_lock), irq_flags);
+	strscpy_pad(core_lgrp->log_connect_id, connect_id,
+		    sizeof(core_lgrp->log_connect_id));
+	spin_unlock_irqrestore(&(core_lgrp->log_lock), irq_flags);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "connect_id = %s", connect_id);
+}
+
+int sl_core_data_lgrp_del(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_core_lgrp *core_lgrp;
+	u8                   link_num;
+	bool                 is_configuring = false;
+	bool                 is_deleting = false;
+	int                  rtn;
+	int                  err = 0;
+
+	/*
+	 * Look the lgrp up, check it and claim it for deletion in one step.
+	 * core_lgrps_lock, with data_lock taken inside it, keeps another
+	 * deleter from finding the same lgrp and freeing it too. Only the
+	 * caller that sets is_deleting goes on to free it.
+	 */
+	spin_lock(&core_lgrps_lock);
+	core_lgrp = core_lgrps[ldev_num][lgrp_num];
+	if (core_lgrp) {
+		spin_lock(&core_lgrp->data_lock);
+		is_configuring = core_lgrp->is_configuring;
+		is_deleting = core_lgrp->is_deleting;
+		if (!is_configuring && !is_deleting)
+			core_lgrp->is_deleting = true;
+		spin_unlock(&core_lgrp->data_lock);
+	}
+	spin_unlock(&core_lgrps_lock);
+
+	if (!core_lgrp) {
+		sl_core_log_dbg(NULL, LOG_NAME, "del - not found (lgrp_num = %u)", lgrp_num);
+		return 0;
+	}
+
+	if (is_configuring) {
+		sl_core_log_err(NULL, LOG_NAME, "del - lgrp is configuring");
+		return -EBUSY;
+	}
+
+	if (is_deleting) {
+		sl_core_log_err(NULL, LOG_NAME, "del - lgrp is already being deleted");
+		return -EBUSY;
+	}
+
+	/*
+	 * A configuration that starts after the claim above is not stopped
+	 * here, as before, and a caller that looked the lgrp up earlier and
+	 * uses it after the free below is not covered either: the lookup does
+	 * not pin the lgrp.
+	 */
+
+	/* Try every link so as much as possible is deleted, and keep the first error. */
+	for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
+		rtn = sl_core_data_link_del(ldev_num, lgrp_num, link_num);
+		if (rtn && !err)
+			err = rtn;
+	}
+
+	/*
+	 * A link that could not be deleted still points at this lgrp, so keep
+	 * it, and release the claim so that the delete can be retried.
+	 */
+	if (err)
+		goto out_retry;
+
+	spin_lock(&core_lgrps_lock);
+	if (refcount_read(&core_lgrp->ref.refcount) != 1) {
+		spin_unlock(&core_lgrps_lock);
+		err = -EBUSY;
+		goto out_retry;
+	}
+	core_lgrps[ldev_num][lgrp_num] = NULL;
+	spin_unlock(&core_lgrps_lock);
+
+	sl_core_lgrp_put(core_lgrp);
+	return 0;
+
+out_retry:
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->is_deleting = false;
+	spin_unlock(&core_lgrp->data_lock);
+	sl_core_log_err(NULL, LOG_NAME, "del - busy or child failure [%d]", err);
+	return err;
+}
+
+struct sl_core_lgrp *sl_core_data_lgrp_get(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_core_lgrp *core_lgrp;
+
+	spin_lock(&core_lgrps_lock);
+	core_lgrp = core_lgrps[ldev_num][lgrp_num];
+	if (core_lgrp) {
+		spin_lock(&core_lgrp->data_lock);
+		if (core_lgrp->is_deleting) {
+			spin_unlock(&core_lgrp->data_lock);
+			core_lgrp = NULL;
+		} else {
+			kref_get(&core_lgrp->ref);
+			spin_unlock(&core_lgrp->data_lock);
+		}
+	}
+	spin_unlock(&core_lgrps_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "get (lgrp = 0x%p)", core_lgrp);
+
+	return core_lgrp;
+}
+
+static void sl_core_data_lgrp_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct sl_core_lgrp, ref));
+}
+
+void sl_core_lgrp_put(struct sl_core_lgrp *core_lgrp)
+{
+	if (core_lgrp)
+		kref_put(&core_lgrp->ref, sl_core_data_lgrp_release);
+}
+
+int sl_core_data_lgrp_link_config_check(struct sl_core_lgrp *core_lgrp)
+{
+	int                  rtn;
+	int                  link_num;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "link config check");
+
+	for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
+		core_link = sl_core_link_get(core_lgrp->core_ldev->num, core_lgrp->num, link_num);
+		if (!core_link)
+			continue;
+
+		rtn = sl_core_data_link_state_get(core_link, &link_state);
+		if (rtn) {
+			sl_core_log_err_trace(core_lgrp, LOG_NAME,
+					      "lgrp link config check - link_state_get failed [%d]", rtn);
+			return rtn;
+		}
+
+		switch (link_state) {
+		case SL_CORE_LINK_STATE_UNCONFIGURED:
+		case SL_CORE_LINK_STATE_CONFIGURING:
+		case SL_CORE_LINK_STATE_CONFIGURED:
+		case SL_CORE_LINK_STATE_DOWN:
+			continue;
+		default:
+			sl_core_log_err(core_lgrp, LOG_NAME,
+					"lgrp link config check wrong state (link_num = %u, state = %u %s)",
+					link_num, link_state, sl_core_link_state_str(link_state));
+			return -EBADRQC;
+		}
+	}
+
+	return 0;
+}
+
+void sl_core_data_lgrp_hw_attr_set(struct sl_core_lgrp *core_lgrp, struct sl_hw_attr *hw_attr)
+{
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"hw attr set (cxi = %u, nic = %u)", hw_attr->cxi_num, hw_attr->nic_num);
+
+	core_lgrp->hw_attr = *hw_attr;
+}
+
+void sl_core_data_lgrp_config_set(struct sl_core_lgrp *core_lgrp, struct sl_lgrp_config *lgrp_config)
+{
+	int  rtn;
+	bool need_swizzled;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "config set");
+
+	/* if furcation changes, then we have to reset */
+	if (lgrp_config->furcation != core_lgrp->config.furcation)
+		sl_core_hw_reset_lgrp(core_lgrp);
+
+	/* if loopback enable changes, then we have to swizzle */
+	need_swizzled = false;
+	if ((lgrp_config->options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE) !=
+		(core_lgrp->config.options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE))
+		need_swizzled = true;
+
+	core_lgrp->config = *lgrp_config;
+
+	if (need_swizzled) {
+		rtn = sl_core_hw_serdes_swizzles(core_lgrp);
+		if (rtn)
+			sl_core_log_warn_trace(core_lgrp, LOG_NAME,
+					       "hw_serdes_swizzles failed [%d]", rtn);
+	}
+}
+
+u32 sl_core_data_lgrp_config_flags_get(struct sl_core_lgrp *core_lgrp)
+{
+	u32 flags;
+
+	spin_lock(&core_lgrp->data_lock);
+	flags = core_lgrp->config.options;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "config flags get (flags = 0x%X)", flags);
+
+	return flags;
+}
+
+int sl_core_data_lgrp_err_trace_enable_set(struct sl_core_lgrp *core_lgrp, bool err_trace_enable)
+{
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->err_trace_enable = err_trace_enable;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "set (err_trace_enable = %s)", err_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+int sl_core_data_lgrp_warn_trace_enable_set(struct sl_core_lgrp *core_lgrp, bool warn_trace_enable)
+{
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->warn_trace_enable = warn_trace_enable;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "set (warn_trace_enable = %s)", warn_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+int sl_core_data_lgrp_io_trace_set(struct sl_core_lgrp *core_lgrp, bool io_trace)
+{
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->io_trace = io_trace;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "set (io_trace = %s)", io_trace ? "enabled" : "disabled");
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp_trace.c b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp_trace.c
new file mode 100644
index 000000000000..00a7f5490625
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp_trace.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+
+#include "data/sl_core_data_lgrp_trace.h"
+
+#define LOG_NAME SL_CORE_DATA_LGRP_LOG_NAME
+
+int sl_core_data_lgrp_is_err_trace_enabled(struct sl_core_lgrp *core_lgrp, bool *err_trace_enable)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*err_trace_enable = core_lgrp->err_trace_enable;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"is err trace enabled (err_trace_enable = %s)",
+			*err_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+int sl_core_data_lgrp_is_warn_trace_enabled(struct sl_core_lgrp *core_lgrp, bool *warn_trace_enable)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*warn_trace_enable = core_lgrp->warn_trace_enable;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"is warn trace enabled (warn_trace_enable = %s)",
+			*warn_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+bool sl_core_data_lgrp_is_io_trace_enabled(struct sl_core_lgrp *core_lgrp)
+{
+	bool io_trace;
+
+	spin_lock(&core_lgrp->data_lock);
+	io_trace = core_lgrp->io_trace;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"is io trace enabled (io_trace = %s)",
+			io_trace ? "enabled" : "disabled");
+
+	return io_trace;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_link.c b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_link.c
new file mode 100644
index 000000000000..6cc97e7f9230
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_link.c
@@ -0,0 +1,1343 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/workqueue.h>
+#include <linux/ktime.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_link_counters.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_intr.h"
+#include "hw/sl_core_hw_link.h"
+#include "hw/sl_core_hw_an.h"
+#include "hw/sl_core_hw_an_up.h"
+#include "hw/sl_core_hw_an_lp.h"
+#include "sl_core_hw_intr_flgs.h"
+#include "hw/sl_core_hw_settings.h"
+#include "hw/sl_core_hw_llr.h"
+#include "hw/sl_core_hw_io.h"
+
+/* 0x01002510 (hni_pcs_corrected_cw)
+ * 0x01002618 (hni_pcs_corrected_cw_bin_14)
+ * (0x01002618 + 0x8) - 0x01002510 = 0x110 = Size
+ */
+#define SL_CORE_HW_FEC_CNTRS_OFFSET 0x01002510
+#define SL_CORE_HW_FEC_CNTRS_SIZE   0x110
+
+#define SL_CORE_HW_FEC_UP_SETTLE_WAIT_MS 250
+#define SL_CORE_HW_FEC_UP_CHECK_WAIT_MS  500
+
+static struct sl_core_link *core_links[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+static DEFINE_SPINLOCK(core_links_lock);
+
+#define LOG_NAME SL_CORE_DATA_LINK_LOG_NAME
+
+static void sl_core_data_link_free(struct sl_core_link *core_link);
+
+#define SL_CORE_TIMER_INIT(_link, _timer_num, _work_num, _log)           \
+	do {                                                             \
+		(_link)->timers[_timer_num].data.link      = _link;      \
+		(_link)->timers[_timer_num].data.timer_num = _timer_num; \
+		(_link)->timers[_timer_num].data.work_num  = _work_num;  \
+		strscpy_pad((_link)->timers[_timer_num].data.log, _log, \
+			sizeof((_link)->timers[_timer_num].data.log));   \
+	} while (0)
+#define SL_CORE_INTR_INIT(_link, _intr_num, _work_num, _log)           \
+	do {                                                           \
+		(_link)->intrs[_intr_num].flgs =                       \
+			sl_core_hw_intr_flgs[_intr_num][(_link)->num]; \
+		(_link)->intrs[_intr_num].data.link     = _link;       \
+		(_link)->intrs[_intr_num].data.intr_num = _intr_num;   \
+		(_link)->intrs[_intr_num].data.work_num = _work_num;   \
+		strscpy_pad((_link)->intrs[_intr_num].data.log, _log, \
+			sizeof((_link)->intrs[_intr_num].data.log));   \
+	} while (0)
+
+static int sl_core_data_link_init(struct sl_core_lgrp *core_lgrp, u8 link_num, struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"link init (link = 0x%p, lgrp = 0x%p)", core_link, core_lgrp);
+
+	/* ----- general ----- */
+
+	core_link->magic         = SL_CORE_LINK_MAGIC;
+	core_link->num           = link_num;
+	core_link->core_lgrp     = core_lgrp;
+	kref_get(&core_lgrp->ref);
+	core_link->an.fail_cause = SL_CORE_HW_AN_FAIL_CAUSE_NONE;
+	spin_lock_init(&(core_link->data_lock));
+	kref_init(&core_link->ref);
+	spin_lock_init(&(core_link->irq_data_lock));
+	spin_lock_init(&(core_link->serdes.data_lock));
+
+	/* ----- link ----- */
+
+	spin_lock_init(&(core_link->link.data_lock));
+
+	timer_setup(&(core_link->timers[SL_CORE_TIMER_LINK_UP].timer),
+		    sl_core_timer_link_timeout, 0);
+	SL_CORE_TIMER_INIT(core_link, SL_CORE_TIMER_LINK_UP,
+			   SL_CORE_WORK_LINK_UP_TIMEOUT, "link up");
+	timer_setup(&(core_link->timers[SL_CORE_TIMER_LINK_UP_CHECK].timer),
+		    sl_core_timer_link_timeout, 0);
+	SL_CORE_TIMER_INIT(core_link, SL_CORE_TIMER_LINK_UP_CHECK,
+			   SL_CORE_WORK_LINK_UP_CHECK, "link up check");
+	timer_setup(&(core_link->timers[SL_CORE_TIMER_LINK_UP_HIGH_POWER].timer),
+		    sl_core_timer_link_timeout, 0);
+	SL_CORE_TIMER_INIT(core_link, SL_CORE_TIMER_LINK_UP_HIGH_POWER,
+			   SL_CORE_WORK_LINK_UP, "link up high power");
+
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_LINK_UP,
+			  SL_CORE_WORK_LINK_UP_INTR, "link up");
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER,
+			  SL_CORE_WORK_LINK_HIGH_SER_INTR, "link high SER");
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION,
+			  SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR, "link llr max starvation");
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED,
+			  SL_CORE_WORK_LINK_LLR_STARVED_INTR, "link llr starved");
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_LINK_FAULT,
+			  SL_CORE_WORK_LINK_FAULT_INTR, "link fault");
+
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_START]),
+		  sl_core_hw_an_up_start_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_START]),
+		  sl_core_hw_link_up_start_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP]),
+		  sl_core_hw_link_up_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_INTR]),
+		  sl_core_hw_link_up_intr_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_TIMEOUT]),
+		  sl_core_hw_link_up_timeout_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_CHECK]),
+		  sl_core_hw_link_up_check_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_HIGH_SER_INTR]),
+		  sl_core_hw_link_high_ser_intr_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]),
+		  sl_core_hw_link_llr_max_starvation_intr_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]),
+		  sl_core_hw_link_llr_starved_intr_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_FAULT_INTR]),
+		  sl_core_hw_link_fault_intr_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_CANCEL]),
+		  sl_core_hw_link_up_cancel_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_FAIL]),
+		  sl_core_hw_link_up_fail_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_DOWN]),
+		  sl_core_hw_link_down_work);
+
+	/* ----- pml recovery ----- */
+
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]),
+		  sl_core_hw_link_pml_rec_poll_work);
+
+	/* ----- an ----- */
+
+	spin_lock_init(&(core_link->an.data_lock));
+	core_link->an.lp_caps_state = SL_CORE_LINK_LP_CAPS_NOT_RUNNING;
+
+	timer_setup(&(core_link->timers[SL_CORE_TIMER_LINK_AN_LP_CAPS_GET].timer),
+		    sl_core_timer_link_timeout, 0);
+	SL_CORE_TIMER_INIT(core_link, SL_CORE_TIMER_LINK_AN_LP_CAPS_GET,
+			   SL_CORE_WORK_LINK_AN_LP_CAPS_GET_TIMEOUT, "an lp caps get");
+
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV, 0, "an page recv");
+
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET]),
+		  sl_core_hw_an_lp_caps_get_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_TIMEOUT]),
+		  sl_core_hw_an_lp_caps_get_timeout_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_DONE]),
+		  sl_core_hw_an_lp_caps_get_done_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_AN_UP]),
+		  sl_core_hw_an_up_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_DONE]),
+		  sl_core_hw_an_up_done_work);
+
+	/* ----- fec ----- */
+
+	timer_setup(&(core_link->timers[SL_CORE_TIMER_LINK_UP_FEC_SETTLE].timer),
+		    sl_core_timer_link_timeout, 0);
+	SL_CORE_TIMER_INIT(core_link, SL_CORE_TIMER_LINK_UP_FEC_SETTLE,
+			   SL_CORE_WORK_LINK_UP_FEC_SETTLE, "link up fec settle");
+	timer_setup(&(core_link->timers[SL_CORE_TIMER_LINK_UP_FEC_CHECK].timer),
+		    sl_core_timer_link_timeout, 0);
+	SL_CORE_TIMER_INIT(core_link, SL_CORE_TIMER_LINK_UP_FEC_CHECK,
+			   SL_CORE_WORK_LINK_UP_FEC_CHECK, "link up fec check");
+
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_SETTLE]),
+		  sl_core_hw_link_up_fec_settle_work);
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_CHECK]),
+		  sl_core_hw_link_up_fec_check_work);
+
+	spin_lock_init(&core_link->fec.test_lock);
+
+	atomic_set(&core_link->an.retry_count, 0);
+
+	/* ----- ald ----- */
+
+	SL_CORE_INTR_INIT(core_link, SL_CORE_HW_INTR_LANE_DEGRADE,
+			  SL_CORE_WORK_LINK_LANE_DEGRADE_INTR, "lane degrade");
+
+	INIT_WORK(&(core_link->work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]),
+		  sl_core_hw_link_lane_degrade_intr_work);
+
+	/* do very last thing */
+	core_link->link.state = SL_CORE_LINK_STATE_UNCONFIGURED;
+	sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	return 0;
+}
+
+int sl_core_data_link_new(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_ldev *core_ldev;
+	u8                   is_configuring;
+
+	core_ldev = sl_core_ldev_get(ldev_num);
+	core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_lgrp)
+		return -ENODEV;
+	spin_lock(&core_lgrp->data_lock);
+	is_configuring = core_lgrp->is_configuring;
+	spin_unlock(&core_lgrp->data_lock);
+	if (is_configuring) {
+		sl_core_log_err(core_lgrp, LOG_NAME, "lgrp is configuring");
+		return -EBADRQC;
+	}
+
+	spin_lock(&core_links_lock);
+	core_link = core_links[ldev_num][lgrp_num][link_num];
+	spin_unlock(&core_links_lock);
+	if (core_link) {
+		sl_core_log_err(NULL, LOG_NAME, "link exists");
+		return -EBADRQC;
+	}
+
+	core_link = kzalloc(sizeof(struct sl_core_link), GFP_KERNEL);
+	if (core_link == NULL)
+		return -ENOMEM;
+
+	rtn = sl_core_data_link_init(core_lgrp, link_num, core_link);
+	if (rtn != 0) {
+		sl_core_log_err(core_link, LOG_NAME, "core_data_link_init failed [%d]", rtn);
+		kfree(core_link);
+		return rtn;
+	}
+
+	core_link->is_deleting = true;
+	spin_lock(&core_links_lock);
+	if (core_links[ldev_num][lgrp_num][link_num]) {
+		spin_unlock(&core_links_lock);
+		sl_core_data_link_put_pinned(core_link);
+		return -EBADRQC;
+	}
+	core_links[ldev_num][lgrp_num][link_num] = core_link;
+	spin_unlock(&core_links_lock);
+
+	rtn = sl_core_hw_intr_hdlr_register(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "core_hw_intr_hdlr_register failed [%d]", rtn);
+		goto out_unwind;
+	}
+
+	if (link_num == 0) {
+		rtn = sl_core_hw_intr_register(core_link, core_link->intrs[SL_CORE_HW_INTR_LANE_DEGRADE].flgs,
+					       sl_core_hw_intr_hdlr, &(core_link->intrs[SL_CORE_HW_INTR_LANE_DEGRADE].data));
+		if (rtn != 0) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "intr register degrade failed [%d]", rtn);
+			goto out_unwind;
+		}
+	}
+
+	sl_core_hw_llr_link_init(core_link);
+
+	if (core_ldev->ops.dmac_alloc) {
+		rtn = core_ldev->ops.dmac_alloc(
+			core_ldev->accessors.dmac,
+			SL_CORE_HW_FEC_CNTRS_OFFSET,
+			SL_CORE_HW_FEC_CNTRS_SIZE);
+		if (rtn) {
+			sl_core_log_err(core_link, LOG_NAME, "dmac_alloc failed [%d]", rtn);
+			goto out_unwind;
+		}
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "new (link = 0x%p)", core_link);
+
+	spin_lock(&core_links_lock);
+	core_link->is_deleting = false;
+	spin_unlock(&core_links_lock);
+
+	return 0;
+
+out_unwind:
+	spin_lock(&core_links_lock);
+	core_links[ldev_num][lgrp_num][link_num] = NULL;
+	spin_unlock(&core_links_lock);
+	/* Registration may be partial; unregistering a never-registered handler only warns. */
+	sl_core_hw_intr_hdlr_unregister(core_link);
+	sl_core_data_link_free(core_link);
+	sl_core_data_link_put_pinned(core_link);
+	return rtn;
+}
+
+static void sl_core_data_link_free(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"link free (link = 0x%p, lgrp = 0x%p)", core_link, core_link->core_lgrp);
+
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_AN_LP_CAPS_GET);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_SETTLE);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_HIGH_POWER);
+
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_TIMEOUT]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_DONE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_DONE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_TIMEOUT]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_SETTLE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FAIL]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CANCEL]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_DOWN]));
+
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_HIGH_SER_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_FAULT_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]));
+}
+
+int sl_core_data_link_del(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_core_link *core_link;
+	struct sl_core_lgrp *core_lgrp;
+	struct sl_core_ldev *core_ldev;
+
+	spin_lock(&core_links_lock);
+	core_link = core_links[ldev_num][lgrp_num][link_num];
+	if (!core_link) {
+		spin_unlock(&core_links_lock);
+		sl_core_log_dbg(NULL, LOG_NAME,
+				"not found (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return 0;
+	}
+
+	/* A link is deleted before its lgrp and ldev, so both must still be published. */
+	core_lgrp = core_link->core_lgrp;
+	core_ldev = core_lgrp->core_ldev;
+
+	spin_lock(&core_lgrp->data_lock);
+	if (core_lgrp->is_configuring || core_link->is_deleting ||
+	    refcount_read(&core_link->ref.refcount) != 1) {
+		spin_unlock(&core_lgrp->data_lock);
+		spin_unlock(&core_links_lock);
+		return -EBUSY;
+	}
+	core_link->is_deleting = true;
+	spin_unlock(&core_lgrp->data_lock);
+	spin_unlock(&core_links_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "del (link = 0x%p)", core_link);
+
+	sl_core_hw_intr_hdlr_unregister(core_link);
+
+	sl_core_data_link_free(core_link);
+
+	if (core_ldev->ops.dmac_free)
+		core_ldev->ops.dmac_free(core_ldev->accessors.dmac);
+
+	spin_lock(&core_links_lock);
+	core_links[ldev_num][lgrp_num][link_num] = NULL;
+	spin_unlock(&core_links_lock);
+
+	/* Drop the table's reference; the memory stays until pinned users are done. */
+	sl_core_data_link_put_pinned(core_link);
+
+	return 0;
+}
+
+struct sl_core_link *sl_core_data_link_get(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_core_link *core_link;
+
+	spin_lock(&core_links_lock);
+	core_link = core_links[ldev_num][lgrp_num][link_num];
+	if (core_link && !core_link->is_deleting)
+		kref_get(&core_link->ref);
+	else
+		core_link = NULL;
+	spin_unlock(&core_links_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (link = 0x%p)", core_link);
+
+	return core_link;
+}
+
+/*
+ * Both lookup variants retain the link, its resources and its parent until
+ * the matching put. Deletion returns -EBUSY while lookup references remain.
+ * Returns NULL if the link is absent, initializing or being deleted.
+ */
+struct sl_core_link *sl_core_data_link_get_pinned(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	return sl_core_data_link_get(ldev_num, lgrp_num, link_num);
+}
+
+static void sl_core_data_link_release(struct kref *ref)
+{
+	struct sl_core_link *core_link = container_of(ref, struct sl_core_link, ref);
+
+	sl_core_lgrp_put(core_link->core_lgrp);
+	kfree(core_link);
+}
+
+void sl_core_data_link_put_pinned(struct sl_core_link *core_link)
+{
+	kref_put(&core_link->ref, sl_core_data_link_release);
+}
+
+void sl_core_data_link_config_set(struct sl_core_link *core_link,
+				  struct sl_core_link_config *link_config)
+{
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"config set (flags = 0x%X, hpe_map = 0x%X, pause_map = 0x%X)",
+		link_config->flags, link_config->hpe_map, link_config->pause_map);
+
+	spin_lock(&core_link->data_lock);
+	core_link->config = *link_config;
+	if (!is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		memset(core_link->core_lgrp->link_caps, 0, sizeof(core_link->core_lgrp->link_caps));
+	spin_unlock(&core_link->data_lock);
+
+	sl_core_data_link_state_set(core_link, SL_CORE_LINK_STATE_CONFIGURED);
+}
+
+int sl_core_data_link_settings(struct sl_core_link *core_link)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	struct sl_lgrp_config *lgrp_config;
+	struct sl_link_caps   *link_caps;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "settings");
+
+	lgrp_config = &(core_link->core_lgrp->config);
+	link_caps   = &(core_link->core_lgrp->link_caps[core_link->num]);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"settings - tech map  = 0x%08X", link_caps->tech_map);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"settings - fec map   = 0x%08X", link_caps->fec_map);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"settings - pause map = 0x%08X", link_caps->pause_map);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"settings - hpe map   = 0x%08X", link_caps->hpe_map);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"settings - furcation = %u", lgrp_config->furcation);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"settings - options   = %u", lgrp_config->options);
+
+	/* abilities */
+	if (hweight_long(link_caps->tech_map) != 1) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "settings - tech map invalid (map = 0x%08X)",
+				      link_caps->tech_map);
+		return -EINVAL;
+	}
+	if (hweight_long(link_caps->fec_map) > 1) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "settings - fec map invalid (map = 0x%08X)",
+				      link_caps->fec_map);
+		return -EINVAL;
+	}
+
+	/* PCS */
+	core_link->pcs.settings.clock_period = sl_core_data_link_clock_period_get();
+	if (SL_LGRP_CONFIG_TECH_CK_400G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_CK_400G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_CK_400G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_CK_400G;
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_CK_400G;
+		if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_FABRIC)) {
+			core_link->pcs.settings.tx_cdc_ready_level         = 8;
+			core_link->pcs.settings.tx_en_pk_bw_limiter        = 1;
+			core_link->pcs.settings.tx_gearbox_credits         = 12;
+			core_link->pcs.settings.cw_gap                     = 6;
+		} else {
+			core_link->pcs.settings.tx_cdc_ready_level         = 8;
+			core_link->pcs.settings.tx_en_pk_bw_limiter        = 1;
+			core_link->pcs.settings.tx_gearbox_credits         = 8;
+			core_link->pcs.settings.cw_gap                     = 6;
+		}
+		if (sl_core_link_config_is_enable_ald_set(core_link))
+			core_link->pcs.settings.tx_gearbox_credits = 12;
+	}
+	if (SL_LGRP_CONFIG_TECH_CK_200G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_CK_200G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_CK_200G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_CK_200G(core_link->num);
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_CK_200G(core_link->num);
+		core_link->pcs.settings.tx_cdc_ready_level         = 8;
+		core_link->pcs.settings.tx_en_pk_bw_limiter        = 1;
+		core_link->pcs.settings.tx_gearbox_credits         = 8;
+		core_link->pcs.settings.cw_gap                     = 6;
+	}
+	if (SL_LGRP_CONFIG_TECH_CK_100G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_CK_100G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_CK_100G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_CK_100G(core_link->num);
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_CK_100G(core_link->num);
+		core_link->pcs.settings.tx_cdc_ready_level         = 8;
+		core_link->pcs.settings.tx_en_pk_bw_limiter        = 1;
+		core_link->pcs.settings.tx_gearbox_credits         = 4;
+		core_link->pcs.settings.cw_gap                     = 16;
+	}
+	if (SL_LGRP_CONFIG_TECH_BS_200G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_BS_200G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_BS_200G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_BS_200G;
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_BS_200G;
+		if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_FABRIC)) {
+			core_link->pcs.settings.tx_cdc_ready_level         = 8;
+			core_link->pcs.settings.tx_en_pk_bw_limiter        = 0;
+			core_link->pcs.settings.tx_gearbox_credits         = 12;
+			core_link->pcs.settings.cw_gap                     = 6;
+		} else {
+			core_link->pcs.settings.tx_cdc_ready_level         = 8;
+			core_link->pcs.settings.tx_en_pk_bw_limiter        = 0;
+			core_link->pcs.settings.tx_gearbox_credits         = 8;
+			if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_R1))
+				core_link->pcs.settings.cw_gap             = 24;
+			else
+				core_link->pcs.settings.cw_gap             = 6;
+		}
+		if (sl_core_link_config_is_enable_ald_set(core_link))
+			core_link->pcs.settings.tx_gearbox_credits = 12;
+	}
+	if (SL_LGRP_CONFIG_TECH_CD_100G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_CD_100G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_CD_100G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_CD_100G(core_link->num);
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_CD_100G(core_link->num);
+		core_link->pcs.settings.tx_cdc_ready_level         = 8;
+		core_link->pcs.settings.tx_en_pk_bw_limiter        = 1;
+		core_link->pcs.settings.tx_gearbox_credits         = 4;
+		core_link->pcs.settings.cw_gap                     = 6;
+	}
+	if (SL_LGRP_CONFIG_TECH_CD_50G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_CD_50G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_CD_50G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_CD_50G(core_link->num);
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_CD_50G(core_link->num);
+		core_link->pcs.settings.tx_cdc_ready_level         = 8;
+		core_link->pcs.settings.tx_en_pk_bw_limiter        = 1;
+		core_link->pcs.settings.tx_gearbox_credits         = 2;
+		core_link->pcs.settings.cw_gap                     = 12;
+	}
+	if (SL_LGRP_CONFIG_TECH_BJ_100G & link_caps->tech_map) {
+		core_link->pcs.settings.speed                      = SL_LGRP_CONFIG_TECH_BJ_100G;
+		core_link->pcs.settings.pcs_mode                   = SL_CORE_HW_PCS_MODE_BJ_100G;
+		core_link->pcs.settings.rx_active_lanes            = SL_CORE_HW_ACTIVE_LANES_BJ_100G;
+		core_link->pcs.settings.rx_am_lock_lanes           = SL_CORE_HW_AM_LOCK_LANES_BJ_100G;
+		core_link->pcs.settings.tx_cdc_ready_level         = 8;
+		core_link->pcs.settings.tx_en_pk_bw_limiter        = 0;
+		core_link->pcs.settings.tx_gearbox_credits         = 8;
+		core_link->pcs.settings.cw_gap                     = 6;
+	}
+
+	if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_FABRIC)) {
+		core_link->pcs.settings.mac_tx_credits = 8;
+	} else {
+		switch (lgrp_config->furcation) {
+		case SL_MEDIA_FURCATION_X1:
+			core_link->pcs.settings.mac_tx_credits = 8;
+			break;
+		case SL_MEDIA_FURCATION_X2:
+			core_link->pcs.settings.mac_tx_credits = 4;
+			break;
+		case SL_MEDIA_FURCATION_X4:
+			core_link->pcs.settings.mac_tx_credits = 2;
+			break;
+		}
+	}
+
+	switch (lgrp_config->furcation) {
+	case SL_MEDIA_FURCATION_X1:
+		core_link->pcs.settings.underrun_clr = 0;
+		break;
+	case SL_MEDIA_FURCATION_X2:
+		core_link->pcs.settings.underrun_clr = (~(3 << (core_link->num * 2)) & 0xF);
+		break;
+	case SL_MEDIA_FURCATION_X4:
+		core_link->pcs.settings.underrun_clr = (~(1 << core_link->num) & 0xF);
+		break;
+	}
+
+	/* FEC */
+	if (SL_LGRP_CONFIG_FEC_RS_LL & link_caps->fec_map) {
+		core_link->pcs.settings.rs_mode  = SL_CORE_HW_RS_MODE_CORRECT;
+		core_link->fec.settings.mode     = SL_LGRP_FEC_MODE_CORRECT;
+		core_link->fec.settings.type     = SL_LGRP_CONFIG_FEC_RS_LL;
+	} else if (SL_LGRP_CONFIG_FEC_RS & link_caps->fec_map) {
+		core_link->pcs.settings.rs_mode  = SL_CORE_HW_RS_MODE_CORRECT;
+		core_link->fec.settings.mode     = SL_LGRP_FEC_MODE_CORRECT;
+		core_link->fec.settings.type     = SL_LGRP_CONFIG_FEC_RS;
+	} else {
+		core_link->pcs.settings.rs_mode  = SL_CORE_HW_RS_MODE_OFF;
+		core_link->fec.settings.mode     = SL_LGRP_FEC_MODE_OFF;
+		core_link->fec.settings.type     = 0;
+	}
+
+	core_link->fec.settings.up_settle_wait_ms = (core_link->config.fec_up_settle_wait_ms < 0) ?
+		SL_CORE_HW_FEC_UP_SETTLE_WAIT_MS : core_link->config.fec_up_settle_wait_ms;
+	core_link->fec.settings.up_check_wait_ms  = (core_link->config.fec_up_check_wait_ms < 0) ?
+		SL_CORE_HW_FEC_UP_CHECK_WAIT_MS : core_link->config.fec_up_check_wait_ms;
+
+	if (core_link->config.fec_up_ucw_limit < 0) {
+		held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num, core_link->num);
+		if (!held_link_1)
+			return -ENODEV;
+		core_link->fec.settings.up_ucw_limit =
+			sl_ctrl_link_fec_limit_calc(held_link_1,
+						    SL_CTRL_LINK_FEC_UCW_MANT,
+						    SL_CTRL_LINK_FEC_UCW_EXP);
+	} else {
+		core_link->fec.settings.up_ucw_limit = core_link->config.fec_up_ucw_limit;
+	}
+
+	if (core_link->config.fec_up_ccw_limit < 0)
+		core_link->fec.settings.up_ccw_limit = 0;
+	else
+		core_link->fec.settings.up_ccw_limit = core_link->config.fec_up_ccw_limit;
+
+	return 0;
+}
+
+void sl_core_data_link_timeouts(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "timeouts");
+
+	if (core_link->config.link_up_timeout_ms == 0) {
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "timeouts - link up timeout is 0, setting to default");
+		core_link->timers[SL_CORE_TIMER_LINK_UP].data.timeout_ms = 10000;
+	} else {
+		core_link->timers[SL_CORE_TIMER_LINK_UP].data.timeout_ms = core_link->config.link_up_timeout_ms;
+	}
+
+	core_link->timers[SL_CORE_TIMER_LINK_UP_CHECK].data.timeout_ms = 100;
+
+	core_link->timers[SL_CORE_TIMER_LINK_UP_FEC_SETTLE].data.timeout_ms = core_link->fec.settings.up_settle_wait_ms;
+	core_link->timers[SL_CORE_TIMER_LINK_UP_FEC_CHECK].data.timeout_ms  = core_link->fec.settings.up_check_wait_ms;
+}
+
+void sl_core_data_link_state_set(struct sl_core_link *core_link,
+				 enum sl_core_link_state link_state)
+{
+	spin_lock(&core_link->link.data_lock);
+	core_link->link.state = link_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"set (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+}
+
+int sl_core_data_link_state_get(struct sl_core_link *core_link,
+				enum sl_core_link_state *link_state)
+{
+	spin_lock(&core_link->link.data_lock);
+	*link_state = core_link->link.state;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"get (link_state = %u %s)",
+			*link_state, sl_core_link_state_str(*link_state));
+
+	return 0;
+}
+
+int sl_core_data_link_speed_get(struct sl_core_link *core_link, u32 *link_speed)
+{
+	u32 state;
+
+	spin_lock(&core_link->link.data_lock);
+	state       = core_link->link.state;
+	*link_speed = core_link->pcs.settings.speed;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (state != SL_CORE_LINK_STATE_UP &&
+	    state != SL_CORE_LINK_STATE_GOING_DOWN) {
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "get speed no link (state = %u %s)",
+				       state, sl_core_link_state_str(state));
+		return -ENOLINK;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get speed = %u", *link_speed);
+
+	return 0;
+}
+
+u16 sl_core_data_link_clocking_get(struct sl_core_link *core_link)
+{
+	u16 link_clocking;
+
+	spin_lock(&core_link->link.data_lock);
+	link_clocking = core_link->serdes.core_serdes_settings.clocking;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"get clocking = %u", link_clocking);
+
+	return link_clocking;
+}
+
+void sl_core_data_link_info_map_clr(struct sl_core_link *core_link, u32 bit_num)
+{
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&core_link->irq_data_lock, irq_flags);
+
+	if (bit_num == SL_CORE_INFO_MAP_NUM_BITS)
+		bitmap_zero((unsigned long *)&(core_link->info_map), SL_CORE_INFO_MAP_NUM_BITS);
+	else
+		clear_bit(bit_num, (unsigned long *)&(core_link->info_map));
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"clr info map 0x%016llX", core_link->info_map);
+
+	spin_unlock_irqrestore(&core_link->irq_data_lock, irq_flags);
+}
+
+void sl_core_data_link_info_map_set(struct sl_core_link *core_link, u32 bit_num)
+{
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&core_link->irq_data_lock, irq_flags);
+
+	set_bit(bit_num, (unsigned long *)&(core_link->info_map));
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"set info map 0x%016llX", core_link->info_map);
+
+	spin_unlock_irqrestore(&core_link->irq_data_lock, irq_flags);
+}
+
+u64 sl_core_data_link_info_map_get(struct sl_core_link *core_link)
+{
+	u64           info_map;
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&core_link->irq_data_lock, irq_flags);
+	info_map = core_link->info_map;
+	spin_unlock_irqrestore(&core_link->irq_data_lock, irq_flags);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"get info map 0x%016llX", info_map);
+
+	return info_map;
+}
+
+void sl_core_data_link_is_last_down_new_set(struct sl_core_link *core_link, bool is_last_down_new)
+{
+	spin_lock(&core_link->link.data_lock);
+	core_link->link.is_last_down_new = is_last_down_new;
+	spin_unlock(&core_link->link.data_lock);
+}
+
+void sl_core_data_link_last_down_cause_map_set(struct sl_core_link *core_link, u64 down_cause_map)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	spin_lock(&core_link->link.data_lock);
+
+	if (core_link->link.is_last_down_new) {
+		core_link->link.last_down_entry_num++;
+		if (core_link->link.last_down_entry_num >= SL_CTRL_LAST_DOWN_NUM_ENTRIES)
+			core_link->link.last_down_entry_num = 0;
+
+		core_link->link.last_down_cause_map[core_link->link.last_down_entry_num] = down_cause_map;
+		core_link->link.last_down_time[core_link->link.last_down_entry_num]      = ktime_get_real_seconds();
+
+		core_link->link.is_last_down_new = false;
+	} else {
+		core_link->link.last_down_cause_map[core_link->link.last_down_entry_num] |= down_cause_map;
+	}
+
+	spin_unlock(&core_link->link.data_lock);
+
+	held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				       core_link->core_lgrp->num, core_link->num);
+	if (!held_link_1)
+		return;
+	sl_ctrl_link_cause_counter_inc(held_link_1, down_cause_map);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last down cause map set (num = %u, down_cause_map = 0x%llX)",
+			core_link->link.last_down_entry_num, down_cause_map);
+}
+
+int sl_core_data_link_last_down_cause_map_info_get(struct sl_core_link *core_link,
+						   u8                   entry_num,
+						    u64                 *down_cause_map,
+						    time64_t            *down_time)
+{
+	u8 actual_entry_num;
+
+	spin_lock(&core_link->link.data_lock);
+
+	if (entry_num > core_link->link.last_down_entry_num)
+		actual_entry_num = SL_CTRL_LAST_DOWN_NUM_ENTRIES - (entry_num - core_link->link.last_down_entry_num);
+	else
+		actual_entry_num = core_link->link.last_down_entry_num - entry_num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last down cause map info get (entry_num = %u, last_down_num = %u, actual_num = %u",
+			entry_num, core_link->link.last_down_entry_num, actual_entry_num);
+
+	*down_cause_map = core_link->link.last_down_cause_map[actual_entry_num];
+	*down_time      = core_link->link.last_down_time[actual_entry_num];
+
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last down cause map info get (down_cause_map = 0x%llX, down_time = %lld %ptTt %ptTd)",
+			*down_cause_map, *down_time, down_time, down_time);
+
+	return 0;
+}
+
+u64 sl_core_data_link_last_down_cause_map_get(struct sl_core_link *core_link)
+{
+	u64 down_cause_map;
+
+	spin_lock(&core_link->link.data_lock);
+	down_cause_map = core_link->link.last_down_cause_map[core_link->link.last_down_entry_num];
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last down cause map get (down_cause_map = 0x%llX)", down_cause_map);
+
+	return down_cause_map;
+}
+
+void sl_core_data_link_is_last_up_fail_new_set(struct sl_core_link *core_link, bool is_last_up_fail_new)
+{
+	spin_lock(&core_link->link.data_lock);
+	core_link->link.is_last_up_fail_new = is_last_up_fail_new;
+	spin_unlock(&core_link->link.data_lock);
+}
+
+void sl_core_data_link_last_up_fail_cause_map_set(struct sl_core_link *core_link, u64 up_fail_cause_map)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	spin_lock(&core_link->link.data_lock);
+
+	if (core_link->link.is_last_up_fail_new) {
+		core_link->link.last_up_fail_entry_num++;
+		if (core_link->link.last_up_fail_entry_num >= SL_CTRL_LAST_UP_FAIL_NUM_ENTRIES)
+			core_link->link.last_up_fail_entry_num = 0;
+
+		core_link->link.last_up_fail_cause_map[core_link->link.last_up_fail_entry_num] = up_fail_cause_map;
+		core_link->link.last_up_fail_time[core_link->link.last_up_fail_entry_num]      = ktime_get_real_seconds();
+
+		core_link->link.is_last_up_fail_new = false;
+	} else {
+		core_link->link.last_up_fail_cause_map[core_link->link.last_up_fail_entry_num] |= up_fail_cause_map;
+	}
+
+	spin_unlock(&core_link->link.data_lock);
+
+	held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				       core_link->core_lgrp->num, core_link->num);
+	if (!held_link_1)
+		return;
+	sl_ctrl_link_cause_counter_inc(held_link_1, up_fail_cause_map);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last up_fail cause map set (num = %u, up_fail_cause_map = 0x%llX)",
+			core_link->link.last_up_fail_entry_num, up_fail_cause_map);
+}
+
+int sl_core_data_link_last_up_fail_cause_map_info_get(struct sl_core_link *core_link,
+						      u8                   entry_num,
+						       u64                 *up_fail_cause_map,
+						       time64_t            *up_fail_time)
+{
+	u8 actual_entry_num;
+
+	spin_lock(&core_link->link.data_lock);
+
+	if (entry_num > core_link->link.last_up_fail_entry_num)
+		actual_entry_num = SL_CTRL_LAST_UP_FAIL_NUM_ENTRIES - (entry_num - core_link->link.last_up_fail_entry_num);
+	else
+		actual_entry_num = core_link->link.last_up_fail_entry_num - entry_num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last up_fail cause map info get (entry_num = %u, last_up_fail_num = %u, actual_num = %u",
+			entry_num, core_link->link.last_up_fail_entry_num, actual_entry_num);
+
+	*up_fail_cause_map = core_link->link.last_up_fail_cause_map[actual_entry_num];
+	*up_fail_time      = core_link->link.last_up_fail_time[actual_entry_num];
+
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last up_fail cause map info get (up_fail_cause_map = 0x%llX, up_fail_time = %lld %ptTt %ptTd)",
+			*up_fail_cause_map, *up_fail_time, up_fail_time, up_fail_time);
+
+	return 0;
+}
+
+u64 sl_core_data_link_last_up_fail_cause_map_get(struct sl_core_link *core_link)
+{
+	u64 up_fail_cause_map;
+
+	spin_lock(&core_link->link.data_lock);
+	up_fail_cause_map = core_link->link.last_up_fail_cause_map[core_link->link.last_up_fail_entry_num];
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"last up_fail cause map get (up_fail_cause_map = 0x%llX)", up_fail_cause_map);
+
+	return up_fail_cause_map;
+}
+
+void sl_core_data_link_ccw_warn_limit_crossed_set(struct sl_core_link *core_link, bool is_limit_crossed)
+{
+	spin_lock(&core_link->link.data_lock);
+	core_link->link.is_ccw_warn_limit_crossed = is_limit_crossed;
+	core_link->link.last_ccw_warn_limit_crossed_time  = ktime_get_real_seconds();
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"ccw warn limit crossed set (is_limit_crossed = %d %s)", core_link->link.is_ccw_warn_limit_crossed,
+		core_link->link.is_ccw_warn_limit_crossed ? "yes" : "no");
+}
+
+int sl_core_data_link_ccw_warn_limit_crossed_get(struct sl_core_link *core_link, bool *is_limit_crossed,
+						 time64_t *limit_crossed_time)
+{
+	spin_lock(&core_link->link.data_lock);
+	*is_limit_crossed = core_link->link.is_ccw_warn_limit_crossed;
+	*limit_crossed_time = core_link->link.last_ccw_warn_limit_crossed_time;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"ccw warn limit crossed get (is_limit_crossed = %d %s)", *is_limit_crossed,
+			*is_limit_crossed ? "yes" : "no");
+
+	return 0;
+}
+
+void sl_core_data_link_ucw_warn_limit_crossed_set(struct sl_core_link *core_link, bool is_limit_crossed)
+{
+	spin_lock(&core_link->link.data_lock);
+	core_link->link.is_ucw_warn_limit_crossed = is_limit_crossed;
+	core_link->link.last_ucw_warn_limit_crossed_time  = ktime_get_real_seconds();
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"ucw warn limit crossed set (is_limit_crossed = %d %s)", core_link->link.is_ucw_warn_limit_crossed,
+		core_link->link.is_ucw_warn_limit_crossed ? "yes" : "no");
+}
+
+int sl_core_data_link_ucw_warn_limit_crossed_get(struct sl_core_link *core_link, bool *is_limit_crossed,
+						 time64_t *limit_crossed_time)
+{
+	spin_lock(&core_link->link.data_lock);
+	*is_limit_crossed = core_link->link.is_ucw_warn_limit_crossed;
+	*limit_crossed_time = core_link->link.last_ucw_warn_limit_crossed_time;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"ucw warn limit crossed get (is_limit_crossed = %d %s)", *is_limit_crossed,
+			*is_limit_crossed ? "yes" : "no");
+
+	return 0;
+}
+
+u32 sl_core_data_link_fec_mode_get(struct sl_core_link *core_link)
+{
+	u32 fec_mode;
+
+	spin_lock(&core_link->link.data_lock);
+	fec_mode = core_link->fec.settings.mode;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"fec_mode get = %u %s", fec_mode, sl_lgrp_fec_mode_str(fec_mode));
+
+	return fec_mode;
+}
+
+u32 sl_core_data_link_fec_type_get(struct sl_core_link *core_link)
+{
+	u32 fec_type;
+
+	spin_lock(&core_link->link.data_lock);
+	fec_type = core_link->fec.settings.type;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"fec_type get = %u %s", fec_type, sl_lgrp_config_fec_str(fec_type));
+
+	return fec_type;
+}
+
+u32 sl_core_data_link_an_lp_caps_state_get(struct sl_core_link *core_link)
+{
+	u32 lp_caps_state;
+
+	spin_lock(&core_link->an.data_lock);
+	lp_caps_state = core_link->an.lp_caps_state;
+	spin_unlock(&core_link->an.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps state get (lp_caps_state = %u %s)",
+			lp_caps_state, sl_link_an_lp_caps_state_str(lp_caps_state));
+
+	return lp_caps_state;
+}
+
+void sl_core_data_link_an_lp_caps_state_set(struct sl_core_link *core_link, u32 lp_caps_state)
+{
+	spin_lock(&core_link->an.data_lock);
+	core_link->an.lp_caps_state = lp_caps_state;
+	spin_unlock(&core_link->an.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps state set (lp_caps_state = %u %s)",
+			lp_caps_state, sl_link_an_lp_caps_state_str(lp_caps_state));
+}
+
+int sl_core_data_link_an_fail_cause_get(struct sl_core_link *core_link, u32 *fail_cause, time64_t *fail_time)
+{
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&core_link->irq_data_lock, irq_flags);
+	*fail_cause = core_link->an.fail_cause;
+	*fail_time  = core_link->an.fail_time;
+	spin_unlock_irqrestore(&core_link->irq_data_lock, irq_flags);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "an fail cause get (fail_cause = %u %s)",
+			*fail_cause, sl_core_link_an_fail_cause_str(*fail_cause));
+
+	return 0;
+}
+
+void sl_core_data_link_an_fail_cause_set(struct sl_core_link *core_link, u32 fail_cause)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&core_link->irq_data_lock, irq_flags);
+	core_link->an.fail_cause = fail_cause;
+	core_link->an.fail_time  = ktime_get_real_seconds();
+	spin_unlock_irqrestore(&core_link->irq_data_lock, irq_flags);
+
+	held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				       core_link->core_lgrp->num, core_link->num);
+	if (!held_link_1)
+		return;
+	sl_ctrl_link_an_cause_counter_inc(held_link_1,
+					  fail_cause);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "an fail cause set (fail_cause = %u %s)",
+			fail_cause, sl_core_link_an_fail_cause_str(fail_cause));
+}
+
+u32 sl_core_data_link_an_retry_count_get(struct sl_core_link *core_link)
+{
+	u32 retry_count;
+
+	retry_count = atomic_read(&core_link->an.retry_count);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "an retry count get (retry_count = %u)", retry_count);
+
+	return retry_count;
+}
+
+u32 sl_core_data_link_config_flags_get(struct sl_core_link *core_link)
+{
+	u32 flags;
+
+	spin_lock(&core_link->data_lock);
+	flags = core_link->config.flags;
+	spin_unlock(&core_link->data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "config flags get (flags = 0x%X)", flags);
+
+	return flags;
+}
+
+static char *sl_core_link_degrade_state_str(int degrade_state)
+{
+	switch (degrade_state) {
+	case SL_LINK_DEGRADE_STATE_INVALID:
+		return "invalid";
+	case SL_LINK_DEGRADE_STATE_ACTIVE:
+		return "active";
+	case SL_LINK_DEGRADE_STATE_INACTIVE:
+		return "inactive";
+	case SL_LINK_DEGRADE_STATE_FAILED:
+		return "failed";
+	default:
+		return "unknown";
+	}
+}
+
+int sl_core_data_link_degrade_state_get(struct sl_core_link *core_link, int *degrade_state)
+{
+	spin_lock(&core_link->link.data_lock);
+	*degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (degrade_state = %d %s",
+			*degrade_state, sl_core_link_degrade_state_str(*degrade_state));
+
+	return 0;
+}
+
+int sl_core_data_link_is_rx_degrade_get(struct sl_core_link *core_link, bool *is_rx_degrade)
+{
+	spin_lock(&core_link->link.data_lock);
+	*is_rx_degrade = core_link->degrade_info.is_rx_degrade;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (is_rx_degrade = %s)", *is_rx_degrade ? "yes" : "no");
+
+	return 0;
+}
+
+int sl_core_data_link_is_tx_degrade_get(struct sl_core_link *core_link, bool *is_tx_degrade)
+{
+	spin_lock(&core_link->link.data_lock);
+	*is_tx_degrade = core_link->degrade_info.is_tx_degrade;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (is_tx_degrade = %s)", *is_tx_degrade ? "yes" : "no");
+
+	return 0;
+}
+
+int sl_core_data_link_degrade_tx_link_speed_get(struct sl_core_link *core_link, u16 *tx_link_speed)
+{
+	int degrade_state;
+
+	spin_lock(&core_link->link.data_lock);
+	*tx_link_speed = core_link->degrade_info.tx_link_speed;
+	degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (degrade_state != SL_LINK_DEGRADE_STATE_ACTIVE) {
+		sl_core_log_dbg(core_link, LOG_NAME, "get tx_link_speed failed (degrade_state = %d %s)",
+				degrade_state, sl_core_link_degrade_state_str(degrade_state));
+		return -EBADRQC;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (tx_link_speed = %u)", *tx_link_speed);
+
+	return 0;
+}
+
+int sl_core_data_link_degrade_rx_link_speed_get(struct sl_core_link *core_link, u16 *rx_link_speed)
+{
+	int degrade_state;
+
+	spin_lock(&core_link->link.data_lock);
+	*rx_link_speed = core_link->degrade_info.rx_link_speed;
+	degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (degrade_state != SL_LINK_DEGRADE_STATE_ACTIVE) {
+		sl_core_log_dbg(core_link, LOG_NAME, "get rx_link_speed failed (degrade_state = %d %s)",
+				degrade_state, sl_core_link_degrade_state_str(degrade_state));
+		return -EBADRQC;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (rx_link_speed = %u)", *rx_link_speed);
+
+	return 0;
+}
+
+int sl_core_data_link_degrade_tx_degrade_map_get(struct sl_core_link *core_link, u8 *tx_degrade_map)
+{
+	int degrade_state;
+
+	spin_lock(&core_link->link.data_lock);
+	*tx_degrade_map = core_link->degrade_info.tx_degrade_map;
+	degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (degrade_state != SL_LINK_DEGRADE_STATE_ACTIVE) {
+		sl_core_log_dbg(core_link, LOG_NAME, "get tx_degrade_map failed (degrade_state = %d %s)",
+				degrade_state, sl_core_link_degrade_state_str(degrade_state));
+		return -EBADRQC;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (tx_degrade_map = 0x%02X)", *tx_degrade_map);
+
+	return 0;
+}
+
+int sl_core_data_link_degrade_rx_degrade_map_get(struct sl_core_link *core_link, u8 *rx_degrade_map)
+{
+	int degrade_state;
+
+	spin_lock(&core_link->link.data_lock);
+	*rx_degrade_map = core_link->degrade_info.rx_degrade_map;
+	degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (degrade_state != SL_LINK_DEGRADE_STATE_ACTIVE) {
+		sl_core_log_dbg(core_link, LOG_NAME, "get rx_degrade_map failed (degrade_state = %d %s)",
+				degrade_state, sl_core_link_degrade_state_str(degrade_state));
+		return -EBADRQC;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (rx_degrade_map = 0x%02X)", *rx_degrade_map);
+
+	return 0;
+}
+
+int sl_core_data_link_degrade_is_recoverable_get(struct sl_core_link *core_link, bool *is_recoverable)
+{
+	int degrade_state;
+
+	spin_lock(&core_link->link.data_lock);
+	*is_recoverable = core_link->degrade_info.is_recoverable;
+	degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (degrade_state != SL_LINK_DEGRADE_STATE_ACTIVE) {
+		sl_core_log_dbg(core_link, LOG_NAME, "get is_recoverable failed (degrade_state = %d %s)",
+				degrade_state, sl_core_link_degrade_state_str(degrade_state));
+		return -EBADRQC;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (is_recoverable = %u)", *is_recoverable);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_attempts_get(struct sl_core_link *core_link, int *attempts)
+{
+	*attempts = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_ATTEMPTS]);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_successes_get(struct sl_core_link *core_link, int *successes)
+{
+	*successes = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_SUCCESSES]);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_link_fault_cause_get(struct sl_core_link *core_link, int *fault_cause)
+{
+	*fault_cause = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_LOCAL_FAULT_CAUSE]);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_link_down_cause_get(struct sl_core_link *core_link, int *down_cause)
+{
+	*down_cause = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_DOWN_CAUSE]);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_link_fault_failed_cause_get(struct sl_core_link *core_link, int *fault_failed_cause)
+{
+	*fault_failed_cause = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_LOCAL_FAULT_FAILED_CAUSE]);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_link_down_failed_cause_get(struct sl_core_link *core_link, int *down_failed_cause)
+{
+	*down_failed_cause = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_DOWN_FAILED_CAUSE]);
+
+	return 0;
+}
+
+int sl_core_data_link_pml_rec_rate_limit_exceeded_get(struct sl_core_link *core_link, int *rate_limit_exceeded)
+{
+	*rate_limit_exceeded = atomic_read(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_RATE_LIMIT_EXCEEDED]);
+
+	return 0;
+}
+
+int sl_core_data_link_fec_up_settle_wait_ms_get(struct sl_core_link *core_link, u32 *fec_settle_wait_ms)
+{
+	spin_lock(&core_link->link.data_lock);
+	*fec_settle_wait_ms = core_link->fec.settings.up_settle_wait_ms;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (fec_settle_wait_ms = %u)", *fec_settle_wait_ms);
+
+	return 0;
+}
+
+int sl_core_data_link_fec_up_check_wait_ms_get(struct sl_core_link *core_link, u32 *fec_check_wait_ms)
+{
+	spin_lock(&core_link->link.data_lock);
+	*fec_check_wait_ms = core_link->fec.settings.up_check_wait_ms;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (fec_check_wait_ms = %u)", *fec_check_wait_ms);
+
+	return 0;
+}
+
+int sl_core_data_link_fec_up_ucw_limit_get(struct sl_core_link *core_link, s32 *fec_up_ucw_limit)
+{
+	spin_lock(&core_link->link.data_lock);
+	*fec_up_ucw_limit = core_link->fec.settings.up_ucw_limit;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (fec_up_ucw_limit = %d)", *fec_up_ucw_limit);
+
+	return 0;
+}
+
+int sl_core_data_link_fec_up_ccw_limit_get(struct sl_core_link *core_link, s32 *fec_up_ccw_limit)
+{
+	spin_lock(&core_link->link.data_lock);
+	*fec_up_ccw_limit = core_link->fec.settings.up_ccw_limit;
+	spin_unlock(&core_link->link.data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (fec_up_ccw_limit = %d)", *fec_up_ccw_limit);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_llr.c b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_llr.c
new file mode 100644
index 000000000000..7ab3ca4a9f64
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_llr.c
@@ -0,0 +1,526 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+#include <linux/hpe/sl/sl_lgrp.h>
+#include <linux/hpe/sl/sl_media.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_llr.h"
+#include "sl_core_str.h"
+#include "hw/sl_core_hw_llr.h"
+#include "hw/sl_core_hw_intr_llr.h"
+#include "sl_core_hw_intr_flgs_llr.h"
+#include "data/sl_core_data_llr.h"
+#include "sl_ctrl_llr_counters.h"
+
+static struct sl_core_llr *core_llrs[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+static DEFINE_SPINLOCK(core_llrs_lock);
+
+#define LOG_NAME SL_CORE_DATA_LLR_LOG_NAME
+
+#define SL_CORE_TIMER_LLR_INIT(_llr, _timer_num, _work_num, _log)        \
+	do {                                                             \
+		(_llr)->timers[_timer_num].data.core_llr   = _llr;       \
+		(_llr)->timers[_timer_num].data.timer_num  = _timer_num; \
+		(_llr)->timers[_timer_num].data.work_num   = _work_num;  \
+		strscpy_pad((_llr)->timers[_timer_num].data.log, _log,  \
+			sizeof((_llr)->timers[_timer_num].data.log));    \
+	} while (0)
+#define SL_CORE_INTR_LLR_INIT(_llr, _intr_num, _work_num, _log)           \
+	do {                                                              \
+		(_llr)->intrs[_intr_num].flgs =                           \
+			sl_core_hw_intr_flgs_llr[_intr_num][(_llr)->num]; \
+		(_llr)->intrs[_intr_num].data.core_llr = _llr;            \
+		(_llr)->intrs[_intr_num].data.intr_num = _intr_num;       \
+		(_llr)->intrs[_intr_num].data.work_num = _work_num;       \
+		strscpy_pad((_llr)->intrs[_intr_num].data.log, _log,     \
+			sizeof((_llr)->intrs[_intr_num].data.log));       \
+	} while (0)
+
+int sl_core_data_llr_new(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_data_llr_get(ldev_num, lgrp_num, llr_num);
+	if (core_llr) {
+		sl_core_log_err(NULL, LOG_NAME, "exists (llr = 0x%p)", core_llr);
+		return -EBADRQC;
+	}
+
+	core_llr = kzalloc(sizeof(struct sl_core_llr), GFP_KERNEL);
+	if (!core_llr)
+		return -ENOMEM;
+
+	core_llr->magic               = SL_CORE_LLR_MAGIC;
+	core_llr->num                 = llr_num;
+	core_llr->core_lgrp           = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_llr->core_lgrp) {
+		kfree(core_llr);
+		return -ENODEV;
+	}
+	core_llr->last_fail_cause     = SL_LLR_FAIL_CAUSE_NONE;
+
+	spin_lock_init(&core_llr->data_lock);
+
+	sl_core_hw_llr_stop(core_llr);
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_NEW);
+	init_completion(&core_llr->stop_complete);
+
+	timer_setup(&(core_llr->timers[SL_CORE_TIMER_LLR_SETUP].timer),
+		    sl_core_timer_llr_timeout, 0);
+	SL_CORE_TIMER_LLR_INIT(core_llr, SL_CORE_TIMER_LLR_SETUP,
+			       SL_CORE_WORK_LLR_SETUP_TIMEOUT, "llr setup");
+	timer_setup(&(core_llr->timers[SL_CORE_TIMER_LLR_START].timer),
+		    sl_core_timer_llr_timeout, 0);
+	SL_CORE_TIMER_LLR_INIT(core_llr, SL_CORE_TIMER_LLR_START,
+			       SL_CORE_WORK_LLR_START_TIMEOUT, "llr start");
+
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_SETUP]),
+		  sl_core_hw_llr_setup_work);
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_TIMEOUT]),
+		  sl_core_hw_llr_setup_timeout_work);
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_UNEXP_LOOP_TIME_INTR]),
+		  sl_core_hw_llr_setup_unexp_loop_time_intr_work);
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_LOOP_TIME_INTR]),
+		  sl_core_hw_llr_setup_loop_time_intr_work);
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_START]),
+		  sl_core_hw_llr_start_work);
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_START_TIMEOUT]),
+		  sl_core_hw_llr_start_timeout_work);
+	INIT_WORK(&(core_llr->work[SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR]),
+		  sl_core_hw_llr_start_init_complete_intr_work);
+
+	SL_CORE_INTR_LLR_INIT(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME,
+			      SL_CORE_WORK_LLR_SETUP_UNEXP_LOOP_TIME_INTR, "llr setup unexp loop time");
+	SL_CORE_INTR_LLR_INIT(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME,
+			      SL_CORE_WORK_LLR_SETUP_LOOP_TIME_INTR, "llr setup loop time");
+	SL_CORE_INTR_LLR_INIT(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE,
+			      SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR, "llr start init complete");
+
+	rtn = sl_core_hw_intr_llr_hdlr_register(core_llr);
+	if (rtn != 0) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"core_hw_intr_llr_hdlr_register failed [%d]", rtn);
+		sl_core_lgrp_put(core_llr->core_lgrp);
+		kfree(core_llr);
+		return rtn;
+	}
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "new (llr = 0x%p)", core_llr);
+
+	spin_lock(&core_llrs_lock);
+	core_llrs[ldev_num][lgrp_num][llr_num] = core_llr;
+	spin_unlock(&core_llrs_lock);
+
+	return 0;
+}
+
+void sl_core_data_llr_del(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!core_llr) {
+		sl_core_log_err(NULL, LOG_NAME, "not found (llr_num = %u)", llr_num);
+		return;
+	}
+
+	spin_lock(&core_llrs_lock);
+	core_llrs[ldev_num][lgrp_num][llr_num] = NULL;
+	spin_unlock(&core_llrs_lock);
+
+	sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_SETUP);
+	sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_START);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_TIMEOUT]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START_TIMEOUT]));
+
+	sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+	sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+	sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_UNEXP_LOOP_TIME_INTR]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_LOOP_TIME_INTR]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR]));
+
+	sl_core_hw_intr_llr_hdlr_unregister(core_llr);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "del (llr = 0x%p)", core_llr);
+
+	sl_core_lgrp_put(core_llr->core_lgrp);
+	kfree(core_llr);
+}
+
+struct sl_core_llr *sl_core_data_llr_get(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	struct sl_core_llr *core_llr;
+
+	spin_lock(&core_llrs_lock);
+	core_llr = core_llrs[ldev_num][lgrp_num][llr_num];
+	spin_unlock(&core_llrs_lock);
+
+	sl_core_log_dbg(NULL, LOG_NAME,
+			"get (ldev_num = %u, lgrp_num = %u, llr_num = %u, llr = 0x%p)",
+			ldev_num, lgrp_num, llr_num, core_llr);
+
+	return core_llr;
+}
+
+#define SL_CORE_DATA_LLR_CONFIG_SETUP_TIMEOUT_MS     3000
+#define SL_CORE_DATA_LLR_CONFIG_SETUP_TIMEOUT_MAX_MS 180000
+#define SL_CORE_DATA_LLR_CONFIG_START_TIMEOUT_MS     3000
+#define SL_CORE_DATA_LLR_CONFIG_START_TIMEOUT_MAX_MS 180000
+int sl_core_data_llr_config_set(struct sl_core_llr *core_llr, struct sl_llr_config *llr_config)
+{
+	core_llr->settings.size              = 1;
+	core_llr->settings.lossless_when_off = 1;
+
+	switch (llr_config->link_dn_behavior) {
+	default:
+	case SL_LLR_LINK_DN_BEHAVIOR_DISCARD:
+		core_llr->settings.link_down_behavior = SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_DISCARD;
+		break;
+	case SL_LLR_LINK_DN_BEHAVIOR_BLOCK:
+		core_llr->settings.link_down_behavior = SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_BLOCK;
+		break;
+	case SL_LLR_LINK_DN_BEHAVIOR_BEST_EFFORT:
+		core_llr->settings.link_down_behavior = SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_BEST_EFFORT;
+		break;
+	}
+
+	core_llr->settings.filter_ctl_frames   = 1;
+	core_llr->settings.ctl_frame_smac      = 0;
+	core_llr->settings.ctl_frame_ethertype = 0x88B6;
+	core_llr->settings.retry_threshold     = 2;
+	core_llr->settings.allow_re_init       = 0;
+	core_llr->settings.replay_ct_max       = 0xFF;
+	core_llr->settings.replay_timer_max    = 15500;
+
+	if ((llr_config->setup_timeout_ms <= 0) ||
+	    (llr_config->setup_timeout_ms > SL_CORE_DATA_LLR_CONFIG_SETUP_TIMEOUT_MAX_MS)) {
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "config set setting setup timeout to default (%ums)",
+			SL_CORE_DATA_LLR_CONFIG_SETUP_TIMEOUT_MS);
+		core_llr->timers[SL_CORE_TIMER_LLR_SETUP].data.timeout_ms = SL_CORE_DATA_LLR_CONFIG_SETUP_TIMEOUT_MS;
+	} else {
+		core_llr->timers[SL_CORE_TIMER_LLR_SETUP].data.timeout_ms = llr_config->setup_timeout_ms;
+	}
+	if ((llr_config->start_timeout_ms <= 0) ||
+	    (llr_config->start_timeout_ms > SL_CORE_DATA_LLR_CONFIG_START_TIMEOUT_MAX_MS)) {
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "config set setting start timeout to default (%ums)",
+			SL_CORE_DATA_LLR_CONFIG_START_TIMEOUT_MS);
+		core_llr->timers[SL_CORE_TIMER_LLR_START].data.timeout_ms = SL_CORE_DATA_LLR_CONFIG_START_TIMEOUT_MS;
+	} else {
+		core_llr->timers[SL_CORE_TIMER_LLR_START].data.timeout_ms = llr_config->start_timeout_ms;
+	}
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"config set settings (link_dn_behavior %u %s = %u)",
+		llr_config->link_dn_behavior, sl_llr_link_dn_behavior_str(llr_config->link_dn_behavior),
+		core_llr->settings.link_down_behavior);
+
+	return 0;
+}
+
+int sl_core_data_llr_policy_set(struct sl_core_llr *core_llr, struct sl_llr_policy *llr_policy)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "policy set");
+
+	spin_lock(&core_llr->data_lock);
+	core_llr->policy = *llr_policy;
+	spin_unlock(&core_llr->data_lock);
+
+	return 0;
+}
+
+int sl_core_data_llr_policy_get(struct sl_core_llr *core_llr, struct sl_llr_policy *llr_policy)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "policy get");
+
+	spin_lock(&core_llr->data_lock);
+	*llr_policy = core_llr->policy;
+	spin_unlock(&core_llr->data_lock);
+
+	return 0;
+}
+
+int sl_core_data_llr_settings(struct sl_core_llr *core_llr)
+{
+	struct sl_lgrp_config *lgrp_config;
+	struct sl_link_caps   *link_caps;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "settings");
+
+	sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_NONE);
+
+	lgrp_config = &(core_llr->core_lgrp->config);
+	link_caps   = &(core_llr->core_lgrp->link_caps[core_llr->num]);
+
+	if (hweight_long(link_caps->tech_map) != 1) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "settings - tech map invalid (map = 0x%08X)",
+			link_caps->tech_map);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_SETUP_CONFIG);
+		return -EINVAL;
+	}
+
+	if (SL_LGRP_CONFIG_TECH_CK_400G & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 50;
+	if (SL_LGRP_CONFIG_TECH_CK_200G & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 25;
+	if (SL_LGRP_CONFIG_TECH_CK_100G & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 13;
+	if (SL_LGRP_CONFIG_TECH_BS_200G & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 25;
+	if (SL_LGRP_CONFIG_TECH_CD_100G & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 13;
+	if (SL_LGRP_CONFIG_TECH_CD_50G  & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 7;
+	if (SL_LGRP_CONFIG_TECH_BJ_100G & link_caps->tech_map)
+		core_llr->settings.bytes_per_ns = 13;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "settings (bytes = %u)", core_llr->settings.bytes_per_ns);
+
+	if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_FABRIC)) {
+		core_llr->settings.max_cap_data   = 0x800ULL;
+		core_llr->settings.max_cap_seq    = 0x800ULL;
+	} else {
+		switch (lgrp_config->furcation) {
+		case SL_MEDIA_FURCATION_X1:
+			core_llr->settings.max_cap_data   = 0x800ULL;
+			core_llr->settings.max_cap_seq    = 0x800ULL;
+			break;
+		case SL_MEDIA_FURCATION_X2:
+			core_llr->settings.max_cap_data   = 0x400ULL;
+			core_llr->settings.max_cap_seq    = 0x400ULL;
+			break;
+		case SL_MEDIA_FURCATION_X4:
+			core_llr->settings.max_cap_data   = 0x200ULL;
+			core_llr->settings.max_cap_seq    = 0x200ULL;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+void sl_core_data_llr_state_set(struct sl_core_llr *core_llr,
+				enum sl_core_llr_state llr_state)
+{
+	spin_lock(&core_llr->data_lock);
+	core_llr->state = llr_state;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "set (llr_state = %u %s)",
+			llr_state, sl_core_llr_state_str(llr_state));
+}
+
+int sl_core_data_llr_state_get(struct sl_core_llr *core_llr,
+			       enum sl_core_llr_state *llr_state)
+{
+	spin_lock(&core_llr->data_lock);
+	*llr_state = core_llr->state;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "get (llr_state = %u %s)",
+			*llr_state, sl_core_llr_state_str(*llr_state));
+
+	return 0;
+}
+
+void sl_core_data_llr_data_set(struct sl_core_llr *core_llr, struct sl_llr_data llr_data)
+{
+	spin_lock(&core_llr->data_lock);
+	core_llr->is_data_valid = true;
+	core_llr->data          = llr_data;
+	core_llr->data.magic    = SL_CORE_LLR_DATA_MAGIC;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"data set (min = %lldns, max = %lldns, average = %lldns, calc = %lldns)",
+		llr_data.loop.min, llr_data.loop.max,
+		llr_data.loop.average, llr_data.loop.calculated);
+}
+
+struct sl_llr_data sl_core_data_llr_data_get(struct sl_core_llr *core_llr)
+{
+	struct sl_llr_data llr_data;
+
+	spin_lock(&core_llr->data_lock);
+	llr_data = core_llr->data;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"data get (min = %lluns, max = %lluns, average = %lluns, calc = %lluns)",
+		llr_data.loop.min, llr_data.loop.max,
+		llr_data.loop.average, llr_data.loop.calculated);
+
+	return llr_data;
+}
+
+void sl_core_data_llr_data_clr(struct sl_core_llr *core_llr)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "data clear");
+
+	spin_lock(&core_llr->data_lock);
+	core_llr->is_data_valid = false;
+	memset(&(core_llr->data), 0, sizeof(core_llr->data));
+	spin_unlock(&core_llr->data_lock);
+}
+
+bool sl_core_data_llr_data_is_valid(struct sl_core_llr *core_llr)
+{
+	bool is_valid;
+
+	spin_lock(&core_llr->data_lock);
+	is_valid = core_llr->is_data_valid;
+	spin_unlock(&core_llr->data_lock);
+
+	return is_valid;
+}
+
+void sl_core_data_llr_info_map_clr(struct sl_core_llr *core_llr, u32 bit_num)
+{
+	spin_lock(&core_llr->data_lock);
+
+	if (bit_num == SL_CORE_INFO_MAP_NUM_BITS)
+		bitmap_zero((unsigned long *)&(core_llr->info_map), SL_CORE_INFO_MAP_NUM_BITS);
+	else
+		clear_bit(bit_num, (unsigned long *)&(core_llr->info_map));
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"clr info map 0x%016llX", core_llr->info_map);
+
+	spin_unlock(&core_llr->data_lock);
+}
+
+void sl_core_data_llr_info_map_set(struct sl_core_llr *core_llr, u32 bit_num)
+{
+	spin_lock(&core_llr->data_lock);
+	set_bit(bit_num, (unsigned long *)&(core_llr->info_map));
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"set info map 0x%016llX", core_llr->info_map);
+
+	spin_unlock(&core_llr->data_lock);
+}
+
+int sl_core_data_llr_info_map_get(struct sl_core_llr *core_llr, u64 *info_map)
+{
+	spin_lock(&core_llr->data_lock);
+	*info_map = core_llr->info_map;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"get (info_map = 0x%016llX)", *info_map);
+
+	return 0;
+}
+
+int sl_core_data_llr_last_fail_cause_get(struct sl_core_llr *core_llr, u32 *llr_fail_cause,
+					 time64_t *llr_fail_time)
+{
+	spin_lock(&core_llr->data_lock);
+	*llr_fail_cause = core_llr->last_fail_cause;
+	*llr_fail_time  = core_llr->last_fail_time;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"last llr fail cause get (cause = %u %s)", *llr_fail_cause,
+		sl_core_llr_fail_cause_str(*llr_fail_cause));
+
+	return 0;
+}
+
+void sl_core_data_llr_last_fail_cause_set(struct sl_core_llr *core_llr, u32 llr_fail_cause)
+{
+	spin_lock(&core_llr->data_lock);
+	core_llr->last_fail_cause = llr_fail_cause;
+	core_llr->last_fail_time  = ktime_get_real_seconds();
+	spin_unlock(&core_llr->data_lock);
+
+	sl_ctrl_llr_cause_counter_inc(core_llr, llr_fail_cause);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"last llr fail cause set (cause = %u %s)", llr_fail_cause, sl_core_llr_fail_cause_str(llr_fail_cause));
+}
+
+int sl_core_data_llr_policy_options_get(struct sl_core_llr *core_llr, u32 *options)
+{
+	spin_lock(&core_llr->data_lock);
+	*options = core_llr->policy.options;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "get (options = 0x%X)", *options);
+
+	return 0;
+}
+
+int sl_core_data_llr_loop_time_get(struct sl_core_llr *core_llr, u64 *loop_time)
+{
+	spin_lock(&core_llr->data_lock);
+	memcpy(loop_time, core_llr->loop_time, sizeof(core_llr->loop_time));
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"get (loop time 0 = %lluns, 1 = %lluns, 2 = %lluns, 3 = %lluns, 4 = %lluns, "
+			"5 = %lluns, 6 = %lluns, 7 = %lluns, 8 = %lluns, 9 = %lluns)",
+			loop_time[0], loop_time[1], loop_time[2], loop_time[3], loop_time[4],
+			loop_time[5], loop_time[6], loop_time[7], loop_time[8], loop_time[9]);
+
+	return 0;
+}
+
+int sl_core_data_llr_loop_calculated_ns_get(struct sl_core_llr *core_llr, u64 *calculated_ns)
+{
+	spin_lock(&core_llr->data_lock);
+	*calculated_ns = core_llr->data.loop.calculated;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "get (calculated_ns = %lldns)", *calculated_ns);
+
+	return 0;
+}
+
+int sl_core_data_llr_loop_min_ns_get(struct sl_core_llr *core_llr, u64 *min_ns)
+{
+	spin_lock(&core_llr->data_lock);
+	*min_ns = core_llr->data.loop.min;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "get (min_ns = %lldns)", *min_ns);
+
+	return 0;
+}
+
+int sl_core_data_llr_loop_max_ns_get(struct sl_core_llr *core_llr, u64 *max_ns)
+{
+	spin_lock(&core_llr->data_lock);
+	*max_ns = core_llr->data.loop.max;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "get (max_ns = %lldns)", *max_ns);
+
+	return 0;
+}
+
+int sl_core_data_llr_loop_average_ns_get(struct sl_core_llr *core_llr, u64 *average_ns)
+{
+	spin_lock(&core_llr->data_lock);
+	*average_ns = core_llr->data.loop.average;
+	spin_unlock(&core_llr->data_lock);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "get (average_ns = %lldns)", *average_ns);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_mac.c b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_mac.c
new file mode 100644
index 000000000000..e058ca4f4af8
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/data/sl_core_data_mac.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <linux/hpe/sl/sl_lgrp.h>
+#include <linux/hpe/sl/sl_media.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_mac.h"
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_link.h"
+#include "data/sl_core_data_mac.h"
+#include "hw/sl_core_hw_mac.h"
+#include "hw/sl_core_hw_settings.h"
+
+static struct sl_core_mac *core_macs[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+static DEFINE_SPINLOCK(core_macs_lock);
+
+#define LOG_NAME SL_CORE_DATA_MAC_LOG_NAME
+
+int sl_core_data_mac_new(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_data_mac_get(ldev_num, lgrp_num, mac_num);
+	if (core_mac) {
+		sl_core_log_err(NULL, LOG_NAME, "exists (mac = 0x%p)", core_mac);
+		return -EBADRQC;
+	}
+
+	core_mac = kzalloc(sizeof(struct sl_core_mac), GFP_KERNEL);
+	if (!core_mac)
+		return -ENOMEM;
+
+	core_mac->magic     = SL_CORE_MAC_MAGIC;
+	core_mac->num       = mac_num;
+	core_mac->core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_mac->core_lgrp) {
+		kfree(core_mac);
+		return -ENODEV;
+	}
+
+	spin_lock_init(&core_mac->data_lock);
+
+	sl_core_hw_mac_tx_stop(core_mac);
+	sl_core_hw_mac_rx_stop(core_mac);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "new (link = 0x%p)", core_mac);
+
+	spin_lock(&core_macs_lock);
+	core_macs[ldev_num][lgrp_num][mac_num] = core_mac;
+	spin_unlock(&core_macs_lock);
+
+	return 0;
+}
+
+void sl_core_data_mac_del(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!core_mac) {
+		sl_core_log_dbg(NULL, LOG_NAME, "not found (mac_num = %u)", mac_num);
+		return;
+	}
+
+	sl_core_hw_mac_tx_stop(core_mac);
+	sl_core_hw_mac_rx_stop(core_mac);
+
+	spin_lock(&core_macs_lock);
+	core_macs[ldev_num][lgrp_num][mac_num] = NULL;
+	spin_unlock(&core_macs_lock);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "del (mac = 0x%p)", core_mac);
+
+	sl_core_lgrp_put(core_mac->core_lgrp);
+	kfree(core_mac);
+}
+
+struct sl_core_mac *sl_core_data_mac_get(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_core_mac *core_mac;
+
+	spin_lock(&core_macs_lock);
+	core_mac = core_macs[ldev_num][lgrp_num][mac_num];
+	spin_unlock(&core_macs_lock);
+
+	sl_core_log_dbg(NULL, LOG_NAME,
+			"get (ldev_num = %u, lgrp_num = %u, mac_num = %u, mac = 0x%p)",
+			ldev_num, lgrp_num, mac_num, core_mac);
+
+	return core_mac;
+}
+
+int sl_core_data_mac_tx_settings(struct sl_core_mac *core_mac)
+{
+	struct sl_lgrp_config *lgrp_config;
+	struct sl_link_caps   *link_caps;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx settings");
+
+	lgrp_config = &(core_mac->core_lgrp->config);
+	link_caps   = &(core_mac->core_lgrp->link_caps[core_mac->num]);
+
+	if (hweight_long(link_caps->tech_map) != 1) {
+		sl_core_log_err_trace(core_mac, LOG_NAME, "tx settings - tech map invalid (map = 0x%08X)",
+				      link_caps->tech_map);
+		return -EINVAL;
+	}
+
+	if (SL_LGRP_CONFIG_TECH_CK_400G & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_400G;
+	if (SL_LGRP_CONFIG_TECH_CK_200G & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_200G;
+	if (SL_LGRP_CONFIG_TECH_CK_100G & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_100G;
+	if (SL_LGRP_CONFIG_TECH_BS_200G & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_200G;
+	if (SL_LGRP_CONFIG_TECH_CD_100G & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_100G;
+	if (SL_LGRP_CONFIG_TECH_CD_50G  & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_50G;
+	if (SL_LGRP_CONFIG_TECH_BJ_100G & link_caps->tech_map)
+		core_mac->settings.tx_ifg_adj = SL_CORE_HW_IFG_ADJ_100G;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx settings (ifg = %u)", core_mac->settings.tx_ifg_adj);
+
+	if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_FABRIC)) {
+		core_mac->settings.tx_ifg_adj          = SL_CORE_HW_IFG_ADJ_NONE;
+		core_mac->settings.tx_ifg_mode         = 0;
+		core_mac->settings.tx_pad_idle_thresh  = 10;
+		core_mac->settings.tx_idle_delay       = 0;
+		core_mac->settings.tx_priority_thresh  = 0;
+		core_mac->settings.tx_cdt_thresh_2     = 0;
+		core_mac->settings.tx_cdt_thresh       = 15;
+		core_mac->settings.tx_cdt_init_val     = 72;
+		core_mac->settings.tx_pcs_credits      = 8;
+		core_mac->settings.tx_short_preamble   = 1;
+		core_mac->settings.llr_if_credits      = 8;
+	} else {
+		core_mac->settings.tx_ifg_mode         = 1;
+		core_mac->settings.tx_pad_idle_thresh  = 10;
+		switch (lgrp_config->furcation) {
+		case SL_MEDIA_FURCATION_X1:
+			core_mac->settings.tx_idle_delay      = 0;
+			core_mac->settings.tx_priority_thresh = 0;
+			core_mac->settings.tx_cdt_thresh_2    = 0;
+			core_mac->settings.tx_cdt_thresh      = 15;
+			core_mac->settings.tx_cdt_init_val    = sl_core_data_mac_tx_cdt_init_get();
+			core_mac->settings.tx_pcs_credits     = 8;
+			core_mac->settings.llr_if_credits     = 8;
+			break;
+		case SL_MEDIA_FURCATION_X2:
+			core_mac->settings.tx_idle_delay      = 0;
+			core_mac->settings.tx_priority_thresh = 32;
+			core_mac->settings.tx_cdt_thresh_2    = 32;
+			core_mac->settings.tx_cdt_thresh      = 15;
+			core_mac->settings.tx_cdt_init_val    = 72;
+			core_mac->settings.tx_pcs_credits     = 4;
+			core_mac->settings.llr_if_credits     = 4;
+			break;
+		case SL_MEDIA_FURCATION_X4:
+			core_mac->settings.tx_idle_delay      = 1;
+			core_mac->settings.tx_priority_thresh = 23;
+			core_mac->settings.tx_cdt_thresh_2    = 20;
+			core_mac->settings.tx_cdt_thresh      = 12;
+			core_mac->settings.tx_cdt_init_val    = 40;
+			core_mac->settings.tx_pcs_credits     = 2;
+			core_mac->settings.llr_if_credits     = 2;
+			break;
+		}
+		core_mac->settings.tx_short_preamble = 0;
+	}
+
+	if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_8BYTE_PREAMBLE))
+		core_mac->settings.tx_short_preamble = 0;
+
+	return 0;
+}
+
+int sl_core_data_mac_rx_settings(struct sl_core_mac *core_mac)
+{
+	struct sl_lgrp_config *lgrp_config;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx settings");
+
+	lgrp_config = &(core_mac->core_lgrp->config);
+
+	if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_FABRIC)) {
+		core_mac->settings.rx_flit_packing_cnt = 1;
+		core_mac->settings.rx_short_preamble   = 1;
+	} else {
+		core_mac->settings.rx_flit_packing_cnt = 1;
+		core_mac->settings.rx_short_preamble   = 0;
+	}
+
+	if (is_flag_set(lgrp_config->options, SL_LGRP_CONFIG_OPT_8BYTE_PREAMBLE))
+		core_mac->settings.rx_short_preamble   = 0;
+
+	return 0;
+}
+
+u32 sl_core_data_mac_tx_state_get(struct sl_core_mac *core_mac)
+{
+	switch (sl_core_hw_mac_tx_state_get(core_mac)) {
+	case 0:
+		sl_core_log_dbg(core_mac, LOG_NAME, "get TX OFF");
+		return SL_CORE_MAC_STATE_OFF;
+	case 1:
+		sl_core_log_dbg(core_mac, LOG_NAME, "get TX ON");
+		return SL_CORE_MAC_STATE_ON;
+	}
+
+	return SL_CORE_MAC_STATE_INVALID;
+}
+
+u32 sl_core_data_mac_rx_state_get(struct sl_core_mac *core_mac)
+{
+	switch (sl_core_hw_mac_rx_state_get(core_mac)) {
+	case 0:
+		sl_core_log_dbg(core_mac, LOG_NAME, "get RX OFF");
+		return SL_CORE_MAC_STATE_OFF;
+	case 1:
+		sl_core_log_dbg(core_mac, LOG_NAME, "get RX ON");
+		return SL_CORE_MAC_STATE_ON;
+	}
+
+	return SL_CORE_MAC_STATE_INVALID;
+}
+
+void sl_core_data_mac_info_map_clr(struct sl_core_mac *core_mac, u32 bit_num)
+{
+	spin_lock(&core_mac->data_lock);
+
+	if (bit_num == SL_CORE_INFO_MAP_NUM_BITS)
+		bitmap_zero((unsigned long *)&(core_mac->info_map), SL_CORE_INFO_MAP_NUM_BITS);
+	else
+		clear_bit(bit_num, (unsigned long *)&(core_mac->info_map));
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"clr info map 0x%016llX", core_mac->info_map);
+
+	spin_unlock(&core_mac->data_lock);
+}
+
+void sl_core_data_mac_info_map_set(struct sl_core_mac *core_mac, u32 bit_num)
+{
+	spin_lock(&core_mac->data_lock);
+	set_bit(bit_num, (unsigned long *)&(core_mac->info_map));
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"set info map 0x%016llX", core_mac->info_map);
+
+	spin_unlock(&core_mac->data_lock);
+}
+
+u64 sl_core_data_mac_info_map_get(struct sl_core_mac *core_mac)
+{
+	u64 info_map;
+
+	spin_lock(&core_mac->data_lock);
+	info_map = core_mac->info_map;
+	spin_unlock(&core_mac->data_lock);
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"get info map 0x%016llX", info_map);
+
+	return info_map;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_an.c b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_an.c
new file mode 100644
index 000000000000..b066b2c5d437
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_an.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_link.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_an.h"
+
+#define LOG_NAME SL_CORE_HW_AN_LOG_NAME
+
+void sl_core_hw_an_config_timers(struct sl_core_link *core_link)
+{
+	u32                                       port;
+	union ss2_port_pml_cfg_pcs_autoneg_timers autoneg_timers = {};
+
+	port = core_link->core_lgrp->num;
+	autoneg_timers.link_fail_inhibit_timer_max = 0x3FFFFFFFF;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "config timers (port = %d)", port);
+
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG_TIMERS + 8, autoneg_timers.qw[1]);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG_TIMERS + 8);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_fec.c b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_fec.c
new file mode 100644
index 000000000000..7a6a6166eed3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_fec.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_core_ldev.h"
+#include "sl_core_link.h"
+#include "sl_core_link_fec.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_fec.h"
+
+#define LOG_NAME SL_CORE_HW_FEC_LOG_NAME
+
+static int sl_core_hw_fec_dmac_xfer(struct sl_core_link *core_link, void *data)
+{
+	int                   rtn;
+	struct sl_core_ldev  *core_ldev;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "dmac_xfer");
+
+	core_ldev = core_link->core_lgrp->core_ldev;
+
+	if (!core_ldev->ops.dmac_xfer) {
+		sl_core_log_dbg(core_link, LOG_NAME, "dmac_xfer NULL");
+		return 0;
+	}
+
+	rtn = core_ldev->ops.dmac_xfer(core_ldev->accessors.dmac, data);
+	if (rtn) {
+		sl_core_log_err(core_link, LOG_NAME, "op dmac_xfer failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+int sl_core_hw_fec_cw_cntrs_get(struct sl_core_link *core_link, struct sl_core_link_fec_cw_cntrs *cw_cntrs)
+{
+	int                                rtn;
+	struct sl_core_link_fec_data_cntrs data_cntrs;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "cw_cntrs_get");
+
+	rtn = sl_core_hw_fec_dmac_xfer(core_link, &data_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "cw_cntrs_get dmac_xfer failed [%d]", rtn);
+		return rtn;
+	}
+
+	*cw_cntrs = data_cntrs.cw_cntrs;
+
+	return 0;
+}
+
+int sl_core_hw_fec_lane_cntrs_get(struct sl_core_link *core_link, struct sl_core_link_fec_lane_cntrs *lane_cntrs)
+{
+	int                                rtn;
+	struct sl_core_link_fec_data_cntrs data_cntrs;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lane_cntrs_get");
+
+	rtn = sl_core_hw_fec_dmac_xfer(core_link, &data_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "lane_cntrs_get dmac_xfer failed [%d]", rtn);
+		return rtn;
+	}
+
+	*lane_cntrs = data_cntrs.lane_cntrs;
+
+	return 0;
+}
+
+int sl_core_hw_fec_tail_cntrs_get(struct sl_core_link *core_link,
+				  struct sl_core_link_fec_tail_cntrs *tail_cntrs)
+{
+	int                                rtn;
+	struct sl_core_link_fec_data_cntrs data_cntrs;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tail_cntr_get");
+
+	rtn = sl_core_hw_fec_dmac_xfer(core_link, &data_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "tail_cntr_get dmac_xfer failed [%d]", rtn);
+		return rtn;
+	}
+
+	*tail_cntrs = data_cntrs.tail_cntrs;
+
+	return 0;
+}
+
+int sl_core_hw_fec_data_get(struct sl_core_link *core_link,
+			    struct sl_core_link_fec_cw_cntrs *cw_cntrs,
+			    struct sl_core_link_fec_lane_cntrs *lane_cntrs,
+			    struct sl_core_link_fec_tail_cntrs *tail_cntr)
+{
+	int                                rtn;
+	struct sl_core_link_fec_data_cntrs data_cntrs;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_data_get");
+
+	rtn = sl_core_hw_fec_dmac_xfer(core_link, &data_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "fec_data_get dmac_xfer failed [%d]", rtn);
+		return rtn;
+	}
+
+	*cw_cntrs    = data_cntrs.cw_cntrs;
+	*lane_cntrs  = data_cntrs.lane_cntrs;
+	*tail_cntr   = data_cntrs.tail_cntrs;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_llr.c b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_llr.c
new file mode 100644
index 000000000000..dacd4729b8df
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_llr.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025,2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_link.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_llr.h"
+
+#define LOG_NAME SL_CORE_HW_LLR_LOG_NAME
+
+void sl_core_hw_llr_config_timeouts(struct sl_core_llr *core_llr)
+{
+	u32                  port;
+	u64                  data64;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	bool                 is_pml_rec_enabled;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "config timeouts (port = %d)", port);
+
+	core_link = sl_core_link_get(core_llr->core_lgrp->core_ldev->num, core_llr->core_lgrp->num, core_llr->num);
+	if (!core_link)
+		return;
+
+	is_pml_rec_enabled = sl_core_link_config_is_enable_pml_recovery_set(core_link);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_TIMEOUTS(core_llr->num), &data64);
+	if (is_pml_rec_enabled) {
+		data64 = SS2_PORT_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_UPDATE(data64,
+										 (core_link->config.pml_rec_timeout_ms + 8) * 1000000);
+		data64 = SS2_PORT_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_UPDATE(data64,
+										    (core_link->config.pml_rec_timeout_ms + 8) * 1000000);
+	} else {
+		data64 = SS2_PORT_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_UPDATE(data64, 0xEE6B2800);
+		data64 = SS2_PORT_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_UPDATE(data64, 0x389ACA00);
+	}
+
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_TIMEOUTS(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_TIMEOUTS(core_llr->num));
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_mac.c b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_mac.c
new file mode 100644
index 000000000000..6bbf76001a85
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_mac.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_mac.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_mac.h"
+
+#define LOG_NAME SL_CORE_HW_MAC_LOG_NAME
+
+void sl_core_hw_mac_tx_config_subport(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx config subport (port = %d)", port);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_CDT_THRESH_UPDATE(data64,
+								       core_mac->settings.tx_cdt_thresh);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_CDT_INIT_VAL_UPDATE(data64,
+									 core_mac->settings.tx_cdt_init_val);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_SUBPORT_SHORT_PREAMBLE_UPDATE(data64,
+								       core_mac->settings.tx_short_preamble);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num));
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_pcs.c b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_pcs.c
new file mode 100644
index 000000000000..405006239baf
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/nic/sl_core_hw_pcs.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_core_link.h"
+#include "hw/sl_core_hw_pcs.h"
+
+#define LOG_NAME SL_CORE_HW_PCS_LOG_NAME
+
+void sl_core_hw_pcs_keep_all_lanes_active_set(struct sl_core_link *core_link, u64 value)
+{
+	/* TODO: Add graceful lane-degrade support, currently absent from SL. */
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an.c
new file mode 100644
index 000000000000..fed65e85d5d9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an.c
@@ -0,0 +1,602 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/random.h>
+#include <linux/workqueue.h>
+
+#include "sl_core_link.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_an.h"
+#include "hw/sl_core_hw_pcs.h"
+
+#define LOG_NAME SL_CORE_HW_AN_LOG_NAME
+
+#define SL_CORE_HW_AN_STATE_COMPLETE_ACK  5
+#define SL_CORE_HW_AN_STATE_AN_GOOD_CHECK 9
+
+void sl_core_hw_an_tx_pages_encode(struct sl_core_link *core_link, struct sl_link_caps *my_caps)
+{
+	int x;
+
+	memset(core_link->an.tx_pages, 0, sizeof(core_link->an.tx_pages));
+
+	/* 1 - base page */
+	core_link->an.tx_pages[0] |= SL_CORE_HW_AN_BP_802_3;
+	core_link->an.tx_pages[0] |= ((u64)(my_caps->pause_map & SL_LINK_CONFIG_PAUSE_MASK) <<
+		SL_CORE_HW_AN_BP_PAUSE_SHIFT);
+	core_link->an.tx_pages[0] |= ((u64)(my_caps->tech_map & SL_LGRP_CONFIG_TECH_MASK) <<
+		SL_CORE_HW_AN_BP_TECH_SHIFT);
+	core_link->an.tx_pages[0] |= ((u64)(my_caps->fec_map & SL_LGRP_CONFIG_FEC_MASK) <<
+		SL_CORE_HW_AN_BP_FEC_SHIFT);
+
+	/* 2 - OUI message next page */
+	set_bit(SL_CORE_HW_AN_NP_BIT_MP, (unsigned long *)&(core_link->an.tx_pages[1]));
+	core_link->an.tx_pages[1] |= SL_CORE_HW_AN_NP_MSG_OUI_EXTD;
+	core_link->an.tx_pages[1] |= SL_CORE_HW_AN_NP_OUI_HPE;
+
+	/* 3 - unformatted page with OUI message next page */
+	core_link->an.tx_pages[2] |= SL_CORE_HW_AN_NP_OUI_VER_0_1;
+	core_link->an.tx_pages[2] |= ((my_caps->hpe_map & SL_LINK_CONFIG_HPE_MASK) <<
+		SL_CORE_HW_AN_NP_HPE_SHIFT);
+	core_link->an.tx_pages[2] |= (2ULL << SL_CORE_HW_AN_NP_BIT_OUI_ASIC_VER);
+
+	core_link->an.tx_count = 3;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx pages encode (count = %u)", core_link->an.tx_count);
+	for (x = 0; x < core_link->an.tx_count; ++x)
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"tx pages encode pages (%d = 0x%016llX)", x, core_link->an.tx_pages[x]);
+}
+
+#define SL_CORE_HW_AN_NUONCE_MASK 0xF
+static u64 sl_core_hw_an_nonce_get(struct sl_core_link *core_link)
+{
+	u8 num;
+
+	do {
+		get_random_bytes(&num, sizeof(num));
+		num &= SL_CORE_HW_AN_NUONCE_MASK;
+	} while (num == 0);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "nonce = 0x%X", num);
+
+	return num;
+}
+
+void sl_core_hw_an_stop(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "stop (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_AUTONEG_RESET_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_SUBPORT_ENABLE_AUTO_NEG_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num));
+}
+
+static void sl_core_hw_an_start(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "start (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_SUBPORT_ENABLE_AUTO_NEG_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_AUTONEG_RESET_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num));
+}
+
+void sl_core_hw_an_init(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "init");
+
+	core_link->an.state    = SL_CORE_HW_AN_STATE_START;
+	core_link->an.page_num = 0;
+	core_link->an.tx_count = 0;
+	core_link->an.rx_count = 0;
+	memset(core_link->an.rx_pages, 0, sizeof(core_link->an.rx_pages));
+}
+
+void sl_core_hw_an_config(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "config (port = %d)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_SUBPORT_PCS_ENABLE_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_PCS_SUBPORT_ENABLE_AUTO_NEG_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_AUTONEG_RESET_UPDATE(data64, 1);
+	data64 = SS2_PORT_PML_CFG_PCS_AUTONEG_RESTART_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), data64);
+
+	sl_core_hw_pcs_config_swizzles(core_link);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_hw_an_config_timers(core_link);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+}
+
+static void sl_core_hw_an_base_page_write(struct sl_core_link *core_link)
+{
+	u32 port;
+	u64 page;
+
+	port = core_link->core_lgrp->num;
+	page = core_link->an.tx_pages[core_link->an.page_num];
+
+	/* add control bits */
+	if (core_link->an.page_num < core_link->an.tx_count - 1)
+		set_bit(SL_CORE_HW_AN_BP_BIT_NP, (unsigned long *)&(page));
+	page |= (sl_core_hw_an_nonce_get(core_link) << SL_CORE_HW_AN_BP_BIT_TRANS_NONCE);
+
+	/* store toggle bit */
+	core_link->an.toggle = test_bit(SL_CORE_HW_AN_NP_BIT_T, (unsigned long *)&(page));
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"base page write (port = %u, pg %u = 0x%016llX, toggle = %d)",
+		port, core_link->an.page_num, page, core_link->an.toggle);
+
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG_BASE_PAGE(core_link->num), page);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG_BASE_PAGE(core_link->num));
+}
+
+static void sl_core_hw_an_next_page_write(struct sl_core_link *core_link)
+{
+	u32 port;
+	u64 page;
+
+	port = core_link->core_lgrp->num;
+	if (core_link->an.page_num < core_link->an.tx_count)
+		page = core_link->an.tx_pages[core_link->an.page_num];
+	else
+		page = SL_CORE_HW_AN_NP_MSG_NULL;
+
+	/* add control bits */
+	if (core_link->an.page_num < core_link->an.tx_count - 1)
+		set_bit(SL_CORE_HW_AN_NP_BIT_NP, (unsigned long *)&(page));
+	if (core_link->an.toggle)
+		set_bit(SL_CORE_HW_AN_NP_BIT_T, (unsigned long *)&(page));
+	core_link->an.toggle = !core_link->an.toggle;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"next page write (port = %u, pg %u = 0x%016llX, toggle = %d)",
+		port, core_link->an.page_num, page, core_link->an.toggle);
+
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG_NEXT_PAGE(core_link->num), page);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG_NEXT_PAGE(core_link->num));
+}
+
+static void sl_core_hw_an_next_page_go(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "next page go (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_AUTONEG(core_link->num));
+}
+
+int sl_core_hw_an_base_page_send(struct sl_core_link *core_link)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "base page send (pg = %u)", core_link->an.page_num);
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_NEXT_PAGE);
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_ERROR);
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_DONE);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_AN_BASE_PAGE);
+	core_link->an.state = SL_CORE_HW_AN_STATE_BASE;
+
+	sl_core_hw_an_base_page_write(core_link);
+
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV);
+
+	rtn = sl_core_hw_intr_enable(core_link,
+				     core_link->intrs[SL_CORE_HW_INTR_AN_PAGE_RECV].flgs, sl_core_hw_an_intr_hdlr);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "base page send intr enable failed [%d]", rtn);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_BP_SEND_INTR_ENABLE_FAIL);
+		return rtn;
+	}
+
+	sl_core_hw_an_start(core_link);
+
+	return 0;
+}
+
+static int sl_core_hw_an_next_page_send(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "next page send (pg = %u)", core_link->an.page_num);
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_BASE_PAGE);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_AN_NEXT_PAGE);
+	core_link->an.state = SL_CORE_HW_AN_STATE_NEXT;
+
+	sl_core_hw_an_next_page_write(core_link);
+
+	sl_core_hw_an_next_page_go(core_link);
+
+	return 0;
+}
+
+static void sl_core_hw_an_base_page_store(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+	u64 state;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE(core_link->num), &data64);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"base page store (port = %u, pg %u = 0x%016llX, state = %llu)",
+		port, core_link->an.page_num, data64,
+		SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(data64));
+
+	state = SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(data64);
+	if ((state != SL_CORE_HW_AN_STATE_COMPLETE_ACK) &&
+	    (state != SL_CORE_HW_AN_STATE_AN_GOOD_CHECK)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "base page store bad state (pg %u = 0x%016llX)",
+			core_link->an.page_num, data64);
+		sl_core_data_link_an_fail_cause_set(core_link, SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_STATE_BAD);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		return;
+	}
+
+	if (!SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_ABILITY_GET(data64)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "base page store lp ability not set (pg %u = 0x%016llX)",
+			core_link->an.page_num, data64);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_LP_ABILITY_NOT_SET);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		return;
+	}
+
+	if (!SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_GET(data64)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "base page store base page not set (pg %u = 0x%016llX)",
+			core_link->an.page_num, data64);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_BP_NOT_SET);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		return;
+	}
+
+	core_link->an.rx_pages[core_link->an.page_num] =
+		SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_BASE_PAGE_GET(data64);
+	core_link->an.rx_count++;
+
+	if (SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_COMPLETE_GET(data64)) {
+		core_link->an.state = SL_CORE_HW_AN_STATE_COMPLETE;
+		return;
+	}
+
+	if (!test_bit(SL_CORE_HW_AN_BP_BIT_NP,
+		      (unsigned long *)&(core_link->an.rx_pages[core_link->an.page_num]))) {
+		core_link->an.state = SL_CORE_HW_AN_STATE_LP_DONE;
+		return;
+	}
+}
+
+static void sl_core_hw_an_next_page_store(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+	u64 state;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE(core_link->num), &data64);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"next page store (port = %u, pg %u = 0x%016llX, state = %llu)",
+		port, core_link->an.page_num, data64,
+		SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_STATE_GET(data64));
+
+	state = SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(data64);
+	if ((state != SL_CORE_HW_AN_STATE_COMPLETE_ACK) &&
+	    (state != SL_CORE_HW_AN_STATE_AN_GOOD_CHECK)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "next page store bad state (pg %u = 0x%016llX)",
+			core_link->an.page_num, data64);
+		sl_core_data_link_an_fail_cause_set(core_link, SL_CORE_HW_AN_FAIL_CAUSE_NP_STORE_STATE_BAD);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		return;
+	}
+
+	if (SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_BASE_PAGE_GET(data64)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "next page store base page set (pg %u = 0x%016llX)",
+			core_link->an.page_num, data64);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_NP_STORE_BP_SET);
+		core_link->an.state = SL_CORE_HW_AN_STATE_RETRY;
+		return;
+	}
+
+	core_link->an.rx_pages[core_link->an.page_num] =
+		SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_NEXT_PAGE_GET(data64);
+	core_link->an.rx_count++;
+
+	if (SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_COMPLETE_GET(data64)) {
+		core_link->an.state = SL_CORE_HW_AN_STATE_COMPLETE;
+		return;
+	}
+
+	if (!test_bit(SL_CORE_HW_AN_NP_BIT_NP,
+		      (unsigned long *)&(core_link->an.rx_pages[core_link->an.page_num]))) {
+		core_link->an.state = SL_CORE_HW_AN_STATE_LP_DONE;
+		return;
+	}
+}
+
+static void sl_core_hw_an_next_page_check(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+	u64 state;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE(core_link->num), &data64);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"next page check (port = %u, data = 0x%016llX)", port, data64);
+
+	state = SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(data64);
+	if ((state != SL_CORE_HW_AN_STATE_COMPLETE_ACK) &&
+	    (state != SL_CORE_HW_AN_STATE_AN_GOOD_CHECK)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "next page check bad state (pg %u = 0x%016llX)",
+			core_link->an.page_num, data64);
+		sl_core_data_link_an_fail_cause_set(core_link, SL_CORE_HW_AN_FAIL_CAUSE_NP_CHECK_STATE_BAD);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		return;
+	}
+
+	if (SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_COMPLETE_GET(data64)) {
+		core_link->an.state = SL_CORE_HW_AN_STATE_COMPLETE;
+		return;
+	}
+}
+
+#define AN_IS_OUI_HPE_EXTD(_page)                                                   \
+	(((_page) & (SL_CORE_HW_AN_NP_MSG_MASK | SL_CORE_HW_AN_NP_OUI_HPE_MASK)) == \
+		(SL_CORE_HW_AN_NP_MSG_OUI_EXTD | SL_CORE_HW_AN_NP_OUI_HPE))
+#define AN_OUI_VER_GET(_page) \
+	((_page) & SL_CORE_HW_AN_NP_OUI_VER_MASK)
+#define AN_HPE_MAP_GET(_page) \
+	(((_page) >> SL_CORE_HW_AN_NP_HPE_SHIFT) & SL_LINK_CONFIG_HPE_MASK)
+
+int sl_core_hw_an_rx_pages_decode(struct sl_core_link *core_link,
+				  struct sl_link_caps *my_caps, struct sl_link_caps *link_caps)
+{
+	int x;
+	u32 pause_map;
+	u32 tech_map;
+	u32 fec_map;
+	u32 hpe_map;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "rx pages decode (count = %u)", core_link->an.rx_count);
+	for (x = 0; x < core_link->an.rx_count; ++x)
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"rx pages decode pages (%d = 0x%016llX)", x, core_link->an.rx_pages[x]);
+
+	/* base page */
+	if (!(core_link->an.rx_pages[0] & SL_CORE_HW_AN_BP_802_3)) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "rx pages decode no base page");
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_NO_BP);
+		return -EIO;
+	}
+	pause_map  = (core_link->an.rx_pages[0] >> SL_CORE_HW_AN_BP_PAUSE_SHIFT);
+	pause_map &= SL_LINK_CONFIG_PAUSE_MASK;
+	pause_map &= core_link->config.pause_map;
+	tech_map   = (core_link->an.rx_pages[0] >> SL_CORE_HW_AN_BP_TECH_SHIFT);
+	tech_map  &= SL_LGRP_CONFIG_TECH_MASK;
+	tech_map  &= core_link->core_lgrp->config.tech_map;
+	fec_map    = (core_link->an.rx_pages[0] >> SL_CORE_HW_AN_BP_FEC_SHIFT);
+	fec_map   &= SL_LGRP_CONFIG_FEC_MASK;
+	fec_map   &= core_link->core_lgrp->config.fec_map;
+
+	/* next pages */
+	hpe_map = 0;
+	for (x = 1; x < core_link->an.rx_count; ++x) {
+		if (AN_IS_OUI_HPE_EXTD(core_link->an.rx_pages[x])) {
+			x++;
+			switch (AN_OUI_VER_GET(core_link->an.rx_pages[x])) {
+			case SL_CORE_HW_AN_NP_OUI_VER_0_2:
+				sl_core_log_dbg(core_link, LOG_NAME, "rx pages decode v2 oui");
+				fallthrough;
+			case SL_CORE_HW_AN_NP_OUI_VER_0_1:
+				sl_core_log_dbg(core_link, LOG_NAME, "rx pages decode v1 oui");
+				hpe_map = AN_HPE_MAP_GET(core_link->an.rx_pages[x]);
+				break;
+			default:
+				sl_core_log_err_trace(core_link, LOG_NAME,
+						      "rx pages decode invalid oui (ver = 0x%llX)",
+						      AN_OUI_VER_GET(core_link->an.rx_pages[x]));
+				sl_core_data_link_an_fail_cause_set(core_link,
+								    SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_OUI_INVALID);
+				return -EIO;
+			}
+			break;
+		}
+	}
+
+	/* common maps */
+	tech_map &= my_caps->tech_map;
+	for (x = 31; x >= 0; --x) {
+		if (tech_map & BIT(x)) {
+			link_caps->tech_map = BIT(x);
+			break;
+		}
+	}
+	link_caps->pause_map = pause_map & my_caps->pause_map;
+	link_caps->fec_map   = fec_map & my_caps->fec_map;
+	link_caps->fec_map  |= SL_LGRP_CONFIG_FEC_RS;
+	link_caps->hpe_map   = hpe_map & my_caps->hpe_map;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"rx pages decode (pause = 0x%X, tech = 0x%X, fec = 0x%X, hpe = 0x%X)",
+			link_caps->pause_map, link_caps->tech_map, link_caps->fec_map, link_caps->hpe_map);
+
+	return 0;
+}
+
+/**
+ * sl_core_hw_an_page_recv_intr - Handle page AN receive interrupt
+ * @core_link: Pointer to the core link structure
+ *
+ * Context: Interrupt Context
+ */
+static void sl_core_hw_an_page_recv_intr(struct sl_core_link *core_link)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"page recv intr (state = %u)", core_link->an.state);
+
+	switch (core_link->an.state) {
+	case SL_CORE_HW_AN_STATE_BASE:
+		sl_core_hw_an_base_page_store(core_link);
+		break;
+	case SL_CORE_HW_AN_STATE_NEXT:
+		sl_core_hw_an_next_page_store(core_link);
+		break;
+	case SL_CORE_HW_AN_STATE_LP_DONE:
+		sl_core_hw_an_next_page_check(core_link);
+		break;
+	default:
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "page recv intr invalid (state = %u)", core_link->an.state);
+		sl_core_data_link_an_fail_cause_set(core_link, SL_CORE_HW_AN_FAIL_CAUSE_INTR_STATE_INVALID);
+		goto out;
+	}
+
+	if (core_link->an.state == SL_CORE_HW_AN_STATE_COMPLETE) {
+		sl_core_log_dbg(core_link, LOG_NAME, "page recv intr autoneg complete");
+		sl_core_data_link_an_fail_cause_set(core_link, SL_CORE_HW_AN_FAIL_CAUSE_NONE);
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_NEXT_PAGE);
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_BASE_PAGE);
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_ERROR);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_AN_DONE);
+		goto out;
+	}
+
+	if (core_link->an.state == SL_CORE_HW_AN_STATE_ERROR) {
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_NEXT_PAGE);
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_BASE_PAGE);
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_AN_DONE);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_AN_ERROR);
+		goto out;
+	}
+
+	if (core_link->an.state == SL_CORE_HW_AN_STATE_RETRY) {
+		atomic_inc(&core_link->an.retry_count);
+		rtn = sl_core_hw_an_next_page_send(core_link);
+		if (rtn != 0) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "page recv intr an next page send retry failed [%d]", rtn);
+			sl_core_data_link_an_fail_cause_set(core_link,
+							    SL_CORE_HW_AN_FAIL_CAUSE_INTR_AN_RETRY_NP_SEND_FAIL);
+			core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+			goto out;
+		}
+		return;
+	}
+
+	core_link->an.page_num++;
+
+	if (core_link->an.page_num >= SL_CORE_LINK_AN_MAX_PAGES) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "page recv intr out of pages");
+		sl_core_data_link_an_fail_cause_set(core_link, SL_CORE_HW_AN_FAIL_CAUSE_INTR_OUT_OF_PAGES);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		goto out;
+	}
+
+	rtn = sl_core_hw_an_next_page_send(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "page recv intr an next page send failed [%d]", rtn);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_INTR_NP_SEND_FAIL);
+		core_link->an.state = SL_CORE_HW_AN_STATE_ERROR;
+		goto out;
+	}
+
+	return;
+
+out:
+	rtn = sl_core_hw_intr_disable(core_link,
+				      core_link->intrs[SL_CORE_HW_INTR_AN_PAGE_RECV].flgs, sl_core_hw_an_intr_hdlr);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME, "page recv intr disable failed [%d]", rtn);
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[core_link->an.done_work_num]);
+}
+
+void sl_core_hw_an_intr_hdlr(u64 *err_flgs, int num_err_flgs, void *data)
+{
+	struct sl_core_hw_intr_data *info;
+	struct sl_core_link         *core_link;
+
+	info = data;
+	core_link = info->link;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"hdlr %s (link = 0x%p, intr = %u)",
+		info->log, core_link, info->intr_num);
+
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV);
+
+	sl_core_hw_an_page_recv_intr(core_link);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an_lp.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an_lp.c
new file mode 100644
index 000000000000..75ba235c555e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an_lp.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include "sl_platform.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_serdes_link.h"
+#include "hw/sl_core_hw_an.h"
+#include "hw/sl_core_hw_an_lp.h"
+
+#define LOG_NAME SL_CORE_HW_AN_LOG_NAME
+
+static void sl_core_an_lp_caps_get_callback(struct sl_core_link *link)
+{
+	int rtn;
+
+	sl_core_log_dbg(link, LOG_NAME, "lp caps get callback");
+
+	rtn = link->an.callbacks.lp_caps_get(link->an.tag,
+		&(link->an.lp_caps), link->an.lp_caps_state);
+	if (rtn != 0)
+		sl_core_log_warn_trace(link, LOG_NAME,
+				       "lp caps get callback - failed [%d]", rtn);
+}
+
+void sl_core_hw_an_lp_caps_get_cmd(struct sl_core_link *core_link,
+				   enum sl_core_link_state link_state,
+				   sl_core_link_an_callback_t callback,
+				   void *tag, struct sl_link_caps *caps, u32 timeout_ms, u32 flags)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps get cmd");
+
+	sl_core_hw_an_stop(core_link);
+
+	core_link->an.link_state             = link_state;
+	core_link->an.tag                    = tag;
+	core_link->an.callbacks.lp_caps_get  = callback;
+	core_link->an.done_work_num          = SL_CORE_WORK_LINK_AN_LP_CAPS_GET_DONE;
+	core_link->an.my_caps                = *caps;
+
+	sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_RUNNING);
+
+	core_link->timers[SL_CORE_TIMER_LINK_AN_LP_CAPS_GET].data.timeout_ms = timeout_ms;
+
+	/* test check */
+	if (core_link->an.use_test_caps) {
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "lp caps get cmd - using test caps");
+		core_link->an.lp_caps       = core_link->an.test_caps;
+		sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_DATA);
+		sl_core_data_link_state_set(core_link, core_link->an.link_state);
+		sl_core_an_lp_caps_get_callback(core_link);
+		return;
+	}
+
+	memset(&(core_link->an.lp_caps), 0, sizeof(core_link->an.lp_caps));
+	core_link->an.lp_caps.magic = SL_CORE_LINK_AN_MAGIC;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_link->core_lgrp->core_ldev)) {
+		sl_core_data_link_state_set(core_link, core_link->an.link_state);
+		sl_core_an_lp_caps_get_callback(core_link);
+		return;
+	}
+
+	sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_AN_LP_CAPS_GET);
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "lp caps get cmd - an page recv disable failed [%d]", rtn);
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET]);
+}
+
+void sl_core_hw_an_lp_caps_get_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up lp caps get work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps get work - failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_AN) {
+		sl_core_log_dbg(core_link, LOG_NAME, "up lp caps get work - invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_hw_serdes_link_down(core_link);
+
+	rtn = sl_core_hw_serdes_link_up_an(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps get work hw_serdes_link_up_an failed [%d]", rtn);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_LP_CAPS_SERDES_LINK_UP_FAIL);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_AN_LP_CAPS_GET);
+		sl_core_hw_serdes_link_down(core_link);
+		sl_core_data_link_state_set(core_link, core_link->an.link_state);
+		sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_ERROR);
+		sl_core_an_lp_caps_get_callback(core_link);
+		return;
+	}
+
+	sl_core_hw_an_init(core_link);
+
+	sl_core_hw_an_config(core_link);
+
+	sl_core_hw_an_tx_pages_encode(core_link, &(core_link->an.my_caps));
+
+	rtn = sl_core_hw_an_base_page_send(core_link);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "lp caps get work an base page send failed [%d]", rtn);
+}
+
+void sl_core_hw_an_lp_caps_stop_cmd(struct sl_core_link *core_link)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps stop cmd");
+
+	if (sl_core_data_link_an_lp_caps_state_get(core_link) == SL_CORE_LINK_LP_CAPS_NOT_RUNNING) {
+		sl_core_log_dbg(core_link, LOG_NAME, "lp caps stop cmd - already stopped");
+		return;
+	}
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "lp caps stop cmd - an page recv disable failed [%d]", rtn);
+
+	cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET]);
+	cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_TIMEOUT]);
+
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_AN_LP_CAPS_GET);
+
+	sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_NOT_RUNNING);
+	sl_core_data_link_state_set(core_link, core_link->an.link_state);
+}
+
+void sl_core_hw_an_lp_caps_get_timeout_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_TIMEOUT]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps get timeout work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps get timeout work - failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_AN) {
+		sl_core_log_dbg(core_link, LOG_NAME, "lp caps get timeout work - invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "lp caps get timeout work an page recv disable failed [%d]", rtn);
+
+	sl_core_hw_an_stop(core_link);
+	sl_core_hw_serdes_link_down(core_link);
+
+	sl_core_data_link_state_set(core_link, core_link->an.link_state);
+	sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_TIMEOUT);
+
+	sl_core_an_lp_caps_get_callback(core_link);
+}
+
+void sl_core_hw_an_lp_caps_get_done_work(struct work_struct *work)
+{
+	int                  rtn;
+	int                  x;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_AN_LP_CAPS_GET_DONE]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps get done work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps get done work - failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_AN) {
+		sl_core_log_dbg(core_link, LOG_NAME, "lp caps get done work - invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	for (x = 0; x < core_link->an.rx_count; ++x)
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"lp caps get done work rx pages (%d = 0x%016llX)",
+			x, core_link->an.rx_pages[x]);
+
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_AN_LP_CAPS_GET);
+
+	sl_core_hw_an_stop(core_link);
+	sl_core_hw_serdes_link_down(core_link);
+	sl_core_data_link_state_set(core_link, core_link->an.link_state);
+
+	if (core_link->an.state != SL_CORE_HW_AN_STATE_COMPLETE) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps get done work not complete");
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_LP_CAPS_NOT_COMPLETE);
+		sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_ERROR);
+		goto out;
+	}
+
+	rtn = sl_core_hw_an_rx_pages_decode(core_link,
+					    &(core_link->an.my_caps), &(core_link->an.lp_caps));
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps get done work hw_an_rx_pages_decode failure [%d]", rtn);
+		sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_ERROR);
+		goto out;
+	}
+
+	sl_core_data_link_an_lp_caps_state_set(core_link, SL_CORE_LINK_LP_CAPS_DATA);
+
+out:
+	sl_core_an_lp_caps_get_callback(core_link);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an_up.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an_up.c
new file mode 100644
index 000000000000..8ccbb815a4b2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_an_up.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/delay.h>
+
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_serdes_link.h"
+#include "hw/sl_core_hw_an.h"
+#include "hw/sl_core_hw_an_up.h"
+#include "hw/sl_core_hw_link.h"
+#include "sl_ctrl_link_counters.h"
+#include "sl_ctrl_link.h"
+
+#define LOG_NAME SL_CORE_HW_AN_LOG_NAME
+
+#define SL_CORE_HW_AN_RESTART_DELAY_MS     200
+#define SL_CORE_HW_AN_RESTART_DELAY_MS_MAX (SL_CORE_HW_AN_RESTART_DELAY_MS * 10)
+
+static void sl_core_hw_an_up_start_test_caps(struct sl_core_link *core_link)
+{
+	int rtn;
+	int bit;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up start test caps");
+
+	core_link->core_lgrp->link_caps[core_link->num].pause_map =
+		(core_link->config.pause_map & core_link->an.test_caps.pause_map);
+	core_link->core_lgrp->link_caps[core_link->num].tech_map  =
+		(core_link->core_lgrp->config.tech_map & core_link->an.test_caps.tech_map);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"up start test caps input (tech map = 0x%08X, 0x%08X, 0x%08X)",
+		core_link->core_lgrp->config.tech_map,
+		core_link->an.test_caps.tech_map,
+		core_link->core_lgrp->link_caps[core_link->num].tech_map);
+	if (core_link->core_lgrp->link_caps[core_link->num].tech_map) {
+		bit = 0;
+		while (core_link->core_lgrp->link_caps[core_link->num].tech_map >>= 1)
+			bit++;
+		core_link->core_lgrp->link_caps[core_link->num].tech_map = BIT(bit);
+	}
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"up start test caps result (tech map = 0x%08X)",
+			core_link->core_lgrp->link_caps[core_link->num].tech_map);
+	core_link->core_lgrp->link_caps[core_link->num].fec_map =
+		(core_link->core_lgrp->config.fec_map & core_link->an.test_caps.fec_map);
+	core_link->core_lgrp->link_caps[core_link->num].hpe_map =
+		(core_link->config.hpe_map & core_link->an.test_caps.hpe_map);
+
+	if (core_link->core_lgrp->link_caps[core_link->num].tech_map == 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "up start test caps no match");
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_TEST_CAPS_NOMATCH);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_AUTONEG_NOMATCH_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "link down internal failed [%d]", rtn);
+
+		return;
+	}
+
+	sl_core_hw_link_up_after_an_start(core_link);
+}
+
+void sl_core_hw_an_up_start_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_AN_UP_START]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up start work (link = 0x%p)", core_link);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up start work - failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_AN) {
+		sl_core_log_dbg(core_link, LOG_NAME, "up start work - invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_hw_an_stop(core_link);
+
+	/* init caps */
+	memset(&(core_link->core_lgrp->link_caps[core_link->num]), 0, sizeof(struct sl_link_caps));
+
+	core_link->an.done_work_num = SL_CORE_WORK_LINK_AN_UP_DONE;
+
+	sl_core_data_link_timeouts(core_link);
+
+	sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_UP);
+
+	if (core_link->an.use_test_caps) {
+		sl_core_hw_an_up_start_test_caps(core_link);
+		return;
+	}
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_AN_UP]);
+}
+
+static void sl_core_hw_an_up(struct sl_core_link *core_link)
+{
+	int                  rtn;
+	struct sl_link_caps  my_caps;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up");
+
+	ctrl_link = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				     core_link->core_lgrp->num, core_link->num);
+	if (ctrl_link)
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_HW_AN_ATTEMPT);
+
+	sl_core_hw_an_init(core_link);
+
+	sl_core_hw_an_config(core_link);
+
+	my_caps.tech_map  = core_link->core_lgrp->config.tech_map;
+	my_caps.fec_map   = core_link->core_lgrp->config.fec_map;
+	my_caps.pause_map = core_link->config.pause_map;
+	my_caps.hpe_map   = core_link->config.hpe_map;
+	sl_core_hw_an_tx_pages_encode(core_link, &(my_caps));
+
+	rtn = sl_core_hw_an_base_page_send(core_link);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up an base page send failed [%d]", rtn);
+}
+
+void sl_core_hw_an_up_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_AN_UP]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up work - failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_AN) {
+		sl_core_log_dbg(core_link, LOG_NAME, "up work - invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_AN_PAGE_RECV);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up work an page recv disable failed [%d]", rtn);
+
+	sl_core_hw_serdes_link_down(core_link);
+
+	rtn = sl_core_hw_serdes_link_up_an(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up work hw_serdes_link_up_an failed [%d]", rtn);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_SERDES_LINK_UP_FAIL);
+
+		sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "link down internal failed [%d]", rtn);
+
+		return;
+	}
+
+	core_link->an.restart_sleep_ms = SL_CORE_HW_AN_RESTART_DELAY_MS;
+
+	sl_core_hw_an_up(core_link);
+}
+
+static void sl_core_an_up_restart(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "up restart");
+
+	sl_core_hw_an_up(core_link);
+}
+
+void sl_core_hw_an_up_done_work(struct work_struct *work)
+{
+	int                  rtn;
+	int                  x;
+	struct sl_core_link *core_link;
+	struct sl_link_caps  my_caps;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_AN_UP_DONE]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up done work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up done work - failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_AN) {
+		sl_core_log_dbg(core_link, LOG_NAME, "up done work - invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_hw_an_stop(core_link);
+
+	for (x = 0; x < core_link->an.rx_count; ++x)
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"up done work rx pages (%d = 0x%016llX)",
+			x, core_link->an.rx_pages[x]);
+
+	if (core_link->an.state != SL_CORE_HW_AN_STATE_COMPLETE) {
+		/* try again if asked to */
+		if (is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_CONTINUOUS_ENABLE)) {
+			sl_core_log_dbg(core_link, LOG_NAME,
+					"up done work restart (delay = %dms)", core_link->an.restart_sleep_ms);
+			msleep(core_link->an.restart_sleep_ms);
+			if ((core_link->an.restart_sleep_ms) &&
+			    (core_link->an.restart_sleep_ms < SL_CORE_HW_AN_RESTART_DELAY_MS_MAX))
+				core_link->an.restart_sleep_ms += SL_CORE_HW_AN_RESTART_DELAY_MS;
+			sl_core_an_up_restart(core_link);
+			return;
+		}
+		sl_core_log_err_trace(core_link, LOG_NAME, "up done work auto neg not complete");
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_NOT_COMPLETE);
+		goto out_down;
+	}
+
+	my_caps.tech_map  = core_link->core_lgrp->config.tech_map;
+	my_caps.fec_map   = core_link->core_lgrp->config.fec_map;
+	my_caps.pause_map = core_link->config.pause_map;
+	my_caps.hpe_map   = core_link->config.hpe_map;
+	rtn = sl_core_hw_an_rx_pages_decode(core_link, &my_caps,
+					    &(core_link->core_lgrp->link_caps[core_link->num]));
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up done work hw_an_rx_pages_decode failure [%d]", rtn);
+		sl_core_data_link_an_fail_cause_set(core_link,
+						    SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_FAIL);
+		goto out_down;
+	}
+
+	sl_core_hw_link_up_after_an_start(core_link);
+
+	return;
+
+out_down:
+
+	sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_AUTONEG_MAP);
+	sl_core_link_up_fail(core_link);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_intr.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_intr.c
new file mode 100644
index 000000000000..6564c9cb5613
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_intr.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#include "sl_core_link.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_intr.h"
+#include "hw/sl_core_hw_an.h"
+
+#define LOG_NAME SL_CORE_HW_INTR_LOG_NAME
+
+static void sl_core_hw_intr_flgs_clr_source(struct sl_core_link *core_link, u32 intr_num)
+{
+	int x;
+	u64 addr;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"flgs clr source (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_link->intrs[intr_num].source[0],
+		core_link->intrs[intr_num].source[1],
+		core_link->intrs[intr_num].source[2],
+		core_link->intrs[intr_num].source[3]);
+
+	addr = SS2_PORT_PML_ERR_CLR;
+	for (x = 0; x < SL_CORE_HW_INTR_FLGS_COUNT; ++x, addr += 8)
+		sl_core_write64(core_link, addr, core_link->intrs[intr_num].source[x]);
+	sl_core_flush64(core_link, SS2_PORT_PML_ERR_CLR);
+}
+
+void sl_core_hw_intr_hdlr(u64 *err_flgs, int num_err_flgs, void *data)
+{
+	int                          rtn;
+	struct sl_core_hw_intr_data *info;
+	struct sl_core_link         *core_link;
+	int                          x;
+
+	info = data;
+	core_link = info->link;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"hdlr - %s (link = 0x%p, intr = %u, work = %u)",
+		info->log, core_link, info->intr_num, info->work_num);
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, info->intr_num);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "hdlr - %s - flgs disable failed [%d]",
+			info->log, rtn);
+
+	for (x = 0; x < SL_CORE_HW_INTR_FLGS_COUNT; ++x)
+		core_link->intrs[info->intr_num].source[x] |= err_flgs[x];
+
+	sl_core_hw_intr_flgs_clr_source(core_link, info->intr_num);
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[info->work_num]);
+}
+
+int sl_core_hw_intr_hdlr_register(struct sl_core_link *core_link)
+{
+	int rtn;
+	int x;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "register");
+
+	for (x = 0; x < SL_CORE_HW_INTR_COUNT; ++x) {
+		if (x == SL_CORE_HW_INTR_AN_PAGE_RECV)
+			rtn = sl_core_hw_intr_register(core_link, core_link->intrs[x].flgs,
+						       sl_core_hw_an_intr_hdlr, &(core_link->intrs[x].data));
+		else if (x == SL_CORE_HW_INTR_LANE_DEGRADE)
+			continue;
+		else
+			rtn = sl_core_hw_intr_register(core_link, core_link->intrs[x].flgs,
+						       sl_core_hw_intr_hdlr, &(core_link->intrs[x].data));
+		if (rtn != 0) {
+			sl_core_log_err(core_link, LOG_NAME,
+					"register - %d failed [%d]", x, rtn);
+			return rtn;
+		}
+	}
+
+	return 0;
+}
+
+void sl_core_hw_intr_hdlr_unregister(struct sl_core_link *core_link)
+{
+	int rtn;
+	int x;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "unregister");
+
+	for (x = 0; x < SL_CORE_HW_INTR_COUNT; ++x) {
+		if (x == SL_CORE_HW_INTR_AN_PAGE_RECV)
+			rtn = sl_core_hw_intr_unregister(core_link, core_link->intrs[x].flgs,
+							 sl_core_hw_an_intr_hdlr);
+		else
+			rtn = sl_core_hw_intr_unregister(core_link, core_link->intrs[x].flgs,
+							 sl_core_hw_intr_hdlr);
+		if (rtn != 0)
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "unregister - %d failed [%d]", x, rtn);
+	}
+}
+
+void sl_core_hw_intr_flgs_check(struct sl_core_link *core_link, u32 intr_num)
+{
+	int x;
+	u64 addr;
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "flgs check (port = %d)", port);
+
+	addr = SS2_PORT_PML_ERR_FLG;
+	for (x = 0; x < SL_CORE_HW_INTR_FLGS_COUNT; ++x, addr += 8) {
+		sl_core_read64(core_link, addr, &data64);
+		if ((data64 & core_link->intrs[intr_num].flgs[x]) != 0) {
+			sl_core_log_dbg(core_link, LOG_NAME,
+					"flgs check (intr = %d, 0x%016llX = 0x%016llX)",
+				intr_num, addr, data64);
+		}
+	}
+}
+
+void sl_core_hw_intr_flgs_clr(struct sl_core_link *core_link, u32 intr_num)
+{
+	int x;
+	u64 addr;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"flgs clr (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_link->intrs[intr_num].flgs[0],
+		core_link->intrs[intr_num].flgs[1],
+		core_link->intrs[intr_num].flgs[2],
+		core_link->intrs[intr_num].flgs[3]);
+
+	addr = SS2_PORT_PML_ERR_CLR;
+	for (x = 0; x < SL_CORE_HW_INTR_FLGS_COUNT; ++x, addr += 8)
+		sl_core_write64(core_link, addr, core_link->intrs[intr_num].flgs[x]);
+	sl_core_flush64(core_link, SS2_PORT_PML_ERR_CLR);
+}
+
+int sl_core_hw_intr_flgs_enable(struct sl_core_link *core_link, u32 intr_num)
+{
+	int rtn;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"flgs enable (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_link->intrs[intr_num].flgs[0],
+		core_link->intrs[intr_num].flgs[1],
+		core_link->intrs[intr_num].flgs[2],
+		core_link->intrs[intr_num].flgs[3]);
+
+	memset(&(core_link->intrs[intr_num].source), 0, sizeof(core_link->intrs[intr_num].source));
+
+	if (intr_num == SL_CORE_HW_INTR_AN_PAGE_RECV)
+		rtn = sl_core_hw_intr_enable(core_link,
+					     core_link->intrs[intr_num].flgs, sl_core_hw_an_intr_hdlr);
+	else
+		rtn = sl_core_hw_intr_enable(core_link,
+					     core_link->intrs[intr_num].flgs, sl_core_hw_intr_hdlr);
+	if (rtn != 0) {
+		if (rtn != -EALREADY)
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "flgs enable failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+int sl_core_hw_intr_flgs_disable(struct sl_core_link *core_link, u32 intr_num)
+{
+	int rtn;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"flgs disable (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_link->intrs[intr_num].flgs[0],
+		core_link->intrs[intr_num].flgs[1],
+		core_link->intrs[intr_num].flgs[2],
+		core_link->intrs[intr_num].flgs[3]);
+
+	if (intr_num == SL_CORE_HW_INTR_AN_PAGE_RECV)
+		rtn = sl_core_hw_intr_disable(core_link,
+					      core_link->intrs[intr_num].flgs, sl_core_hw_an_intr_hdlr);
+	else
+		rtn = sl_core_hw_intr_disable(core_link,
+					      core_link->intrs[intr_num].flgs, sl_core_hw_intr_hdlr);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "flgs disable failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_intr_llr.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_intr_llr.c
new file mode 100644
index 000000000000..79680a74c204
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_intr_llr.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#include "sl_core_llr.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_intr_llr.h"
+
+#define LOG_NAME SL_CORE_HW_INTR_LLR_LOG_NAME
+
+/**
+ * sl_core_hw_intr_llr_hdlr - Interrupt handler for LLR error flags.
+ * @err_flgs: Pointer to an array of set error flags.
+ * @num_err_flgs: Number of error flags in the array.
+ * @data: Pointer context for handling the interrupt.
+ *
+ * Context: Interrupt context.
+ */
+void sl_core_hw_intr_llr_hdlr(u64 *err_flgs, int num_err_flgs, void *data)
+{
+	int                              rtn;
+	struct sl_core_hw_intr_llr_data *info;
+	struct sl_core_llr              *core_llr;
+
+	info = data;
+	core_llr = info->core_llr;
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"hdlr - %s (llr = 0x%p, intr = %d, work = %d)",
+		info->log, core_llr, info->intr_num, info->work_num);
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, info->intr_num);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "hdlr - %s - flgs disable failed [%d]",
+			info->log, rtn);
+
+	memcpy(&(core_llr->intrs[info->intr_num].source), err_flgs,
+	       sizeof(core_llr->intrs[info->intr_num].source));
+
+	queue_work(core_llr->core_lgrp->core_ldev->workqueue, &core_llr->work[info->work_num]);
+}
+
+int sl_core_hw_intr_llr_hdlr_register(struct sl_core_llr *core_llr)
+{
+	int rtn;
+	int x;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "register");
+
+	for (x = 0; x < SL_CORE_HW_INTR_LLR_COUNT; ++x) {
+		rtn = sl_core_hw_intr_llr_register(core_llr, core_llr->intrs[x].flgs,
+						   sl_core_hw_intr_llr_hdlr, &(core_llr->intrs[x].data));
+		if (rtn != 0) {
+			sl_core_log_err_trace(core_llr, LOG_NAME, "register - %d failed [%d]", x, rtn);
+			return rtn;
+		}
+	}
+
+	return 0;
+}
+
+void sl_core_hw_intr_llr_hdlr_unregister(struct sl_core_llr *core_llr)
+{
+	int rtn;
+	int x;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "unregister");
+
+	for (x = 0; x < SL_CORE_HW_INTR_LLR_COUNT; ++x) {
+		rtn = sl_core_hw_intr_llr_unregister(core_llr, core_llr->intrs[x].flgs,
+						     sl_core_hw_intr_llr_hdlr);
+		if (rtn != 0)
+			sl_core_log_warn_trace(core_llr, LOG_NAME,
+					       "unregister - %d failed [%d]", x, rtn);
+	}
+}
+
+void sl_core_hw_intr_llr_flgs_check(struct sl_core_llr *core_llr, u32 intr_num)
+{
+	int x;
+	u64 addr;
+	u64 data64;
+	u32 port;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "flgs check (port = %d)", port);
+
+	addr = SS2_PORT_PML_ERR_FLG;
+	for (x = 0; x < SL_CORE_HW_INTR_LLR_FLGS_COUNT; ++x, addr += 8) {
+		sl_core_llr_read64(core_llr, addr, &data64);
+		if ((data64 & core_llr->intrs[intr_num].flgs[x]) != 0) {
+			sl_core_log_dbg(core_llr, LOG_NAME,
+					"flgs check (intr = %d, 0x%016llX = 0x%016llX)",
+				intr_num, addr, data64);
+		}
+	}
+}
+
+void sl_core_hw_intr_llr_flgs_clr(struct sl_core_llr *core_llr, u32 intr_num)
+{
+	int x;
+	u64 addr;
+	u32 port;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"flgs clr (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_llr->intrs[intr_num].flgs[0],
+		core_llr->intrs[intr_num].flgs[1],
+		core_llr->intrs[intr_num].flgs[2],
+		core_llr->intrs[intr_num].flgs[3]);
+
+	addr = SS2_PORT_PML_ERR_CLR;
+	for (x = 0; x < SL_CORE_HW_INTR_LLR_FLGS_COUNT; ++x, addr += 8)
+		sl_core_llr_write64(core_llr, addr, core_llr->intrs[intr_num].flgs[x]);
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_ERR_CLR);
+}
+
+int sl_core_hw_intr_llr_flgs_enable(struct sl_core_llr *core_llr, u32 intr_num)
+{
+	int rtn;
+	u32 port;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"flgs enable (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_llr->intrs[intr_num].flgs[0],
+		core_llr->intrs[intr_num].flgs[1],
+		core_llr->intrs[intr_num].flgs[2],
+		core_llr->intrs[intr_num].flgs[3]);
+
+	rtn = sl_core_hw_intr_llr_enable(core_llr,
+					 core_llr->intrs[intr_num].flgs, sl_core_hw_intr_llr_hdlr);
+	if (rtn != 0) {
+		if (rtn != -EALREADY)
+			sl_core_log_err_trace(core_llr, LOG_NAME,
+					      "flgs enable failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+int sl_core_hw_intr_llr_flgs_disable(struct sl_core_llr *core_llr, u32 intr_num)
+{
+	int rtn;
+	u32 port;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME,
+			"flgs disable (port = %d, intr = %d, "
+		"flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+		port, intr_num,
+		core_llr->intrs[intr_num].flgs[0],
+		core_llr->intrs[intr_num].flgs[1],
+		core_llr->intrs[intr_num].flgs[2],
+		core_llr->intrs[intr_num].flgs[3]);
+
+	rtn = sl_core_hw_intr_llr_disable(core_llr,
+					  core_llr->intrs[intr_num].flgs, sl_core_hw_intr_llr_hdlr);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "flgs disable failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_link.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_link.c
new file mode 100644
index 000000000000..4e6f3bdfbbbd
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_link.c
@@ -0,0 +1,2172 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <linux/delay.h>
+#include <linux/ktime.h>
+
+#include "sl_platform.h"
+#include "sl_ctrl_link.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "sl_media_jack.h"
+#include "sl_media_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_lgrp.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_link.h"
+#include "hw/sl_core_hw_mac.h"
+#include "hw/sl_core_hw_an.h"
+#include "hw/sl_core_hw_serdes_link.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "hw/sl_core_hw_settings.h"
+#include "hw/sl_core_hw_pcs.h"
+#include "hw/sl_core_hw_fec.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_reset.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_link_counters.h"
+
+#define LOG_NAME SL_CORE_HW_LINK_LOG_NAME
+
+static void sl_core_hw_link_off(struct sl_core_link *core_link)
+{
+	struct sl_core_mac    *core_mac;
+	struct sl_core_llr    *core_llr;
+	u64                   rx_state;
+	u64                   tx_state;
+	struct sl_media_lgrp *media_lgrp;
+	u8		      temperature_state;
+	int		      rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link off");
+
+	core_mac = sl_core_mac_get(core_link->core_lgrp->core_ldev->num,
+				   core_link->core_lgrp->num, core_link->num);
+	core_llr = sl_core_llr_get(core_link->core_lgrp->core_ldev->num,
+				   core_link->core_lgrp->num, core_link->num);
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num,
+				       core_link->core_lgrp->num);
+
+	if (core_llr)
+		sl_core_llr_stop(core_link->core_lgrp->core_ldev->num,
+				 core_link->core_lgrp->num, core_link->num);
+
+	msleep(100);
+
+	if (core_mac) {
+		rx_state = sl_core_hw_mac_rx_state_get(core_mac);
+		tx_state = sl_core_hw_mac_tx_state_get(core_mac);
+		/* stop TX mac before PCS so we don't lock up PCS */
+		sl_core_hw_mac_tx_stop(core_mac);
+	}
+
+	sl_core_hw_pcs_stop(core_link);
+
+	if (core_mac)
+		sl_core_hw_mac_rx_stop(core_mac);
+
+	sl_core_hw_serdes_link_down(core_link);
+
+	rtn  = sl_media_jack_cable_temp_state_get(media_lgrp->media_jack, &temperature_state);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME, "link off cable_temp_state_get failed [%d]", rtn);
+
+	if (temperature_state == SL_MEDIA_JACK_TEMP_STATE_HOT)
+		sl_media_jack_cable_low_power_set(media_lgrp->media_jack);
+
+	/* resetting the link resets the LLR which is needed to reset ordered sets */
+	sl_core_hw_reset_link(core_link);
+
+	if (core_mac) {
+		if (tx_state == SL_CORE_MAC_STATE_ON)
+			sl_core_hw_mac_tx_start(core_mac);
+		if (rx_state == SL_CORE_MAC_STATE_ON)
+			sl_core_hw_mac_rx_start(core_mac);
+	}
+}
+
+static void sl_core_hw_link_high_ser_intr_work_priv(struct sl_core_link *core_link)
+{
+	int  rtn;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "high SER intr work priv");
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_HIGH_SER);
+
+	sl_core_log_warn_trace(core_link, LOG_NAME, "high symbol error ratio occurred");
+
+	while (sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER) == -EALREADY) {
+		rtn = sl_core_data_link_state_get(core_link, &link_state);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "high SER intr work priv link_state_get failed [%d]", rtn);
+			return;
+		}
+
+		switch (link_state) {
+		case SL_CORE_LINK_STATE_GOING_DOWN:
+		case SL_CORE_LINK_STATE_CANCELING:
+		case SL_CORE_LINK_STATE_TIMEOUT:
+			sl_core_log_err(core_link, LOG_NAME,
+					"high SER intr work priv invalid state (state = %u %s)",
+					link_state, sl_core_link_state_str(link_state));
+			return;
+		default:
+			sl_core_log_dbg(core_link, LOG_NAME,
+					"high SER intr work priv clearing flags (state = %u %s)",
+					link_state, sl_core_link_state_str(link_state));
+			usleep_range(10000, 12000);
+			sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+			continue;
+		}
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_HIGH_SER);
+}
+
+void sl_core_hw_link_up_callback(struct sl_core_link *core_link, struct sl_core_link_up_info *core_link_up_info)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up callback (callback = 0x%p, state = %d %s)",
+			core_link->link.callbacks.up, core_link_up_info->state,
+			sl_link_state_str(core_link_up_info->state));
+
+	rtn = core_link->link.callbacks.up(core_link->link.tags.up, core_link_up_info);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME, "up callback failed [%d]", rtn);
+}
+
+static void sl_core_hw_link_down_callback(struct sl_core_link *core_link)
+{
+	sl_core_link_down_callback_t callback;
+	void *tag;
+	int rtn;
+	u64 info_map;
+	u64 down_cause_map;
+	u32 state;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"down callback (callback = 0x%p)", core_link->link.callbacks.down);
+
+	spin_lock(&core_link->link.data_lock);
+	state          = core_link->link.state;
+	down_cause_map = core_link->link.last_down_cause_map[core_link->link.last_down_entry_num];
+	info_map       = core_link->info_map;
+	callback = core_link->link.callbacks.down;
+	tag = core_link->link.tags.down;
+	core_link->link.callbacks.down = NULL;
+	core_link->link.tags.down = NULL;
+	spin_unlock(&core_link->link.data_lock);
+
+	if (!callback)
+		return;
+
+	rtn = callback(tag, state, down_cause_map, info_map);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME, "down callback failed [%d]", rtn);
+}
+
+static int sl_core_hw_link_media_check(struct sl_core_link *core_link)
+{
+	struct sl_media_lgrp *media_lgrp;
+	int                   rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "media check (link = 0x%p)", core_link);
+
+	if (is_flag_set(sl_core_data_lgrp_config_flags_get(core_link->core_lgrp),
+			SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "media check skipping serdes loopback set");
+		return 0;
+	}
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_MEDIA_CHECK);
+
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	if (sl_media_lgrp_is_cable_unsupported(media_lgrp) &&
+	    !sl_core_link_policy_is_use_unsupported_cable_set(core_link)) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "media check cable unsupported and override not set");
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "media check link_up_fail failed [%d]", rtn);
+		rtn = -EINVAL;
+		goto out;
+	}
+
+	if (media_lgrp->media_jack->is_supported_ss200_cable &&
+	    !sl_core_link_policy_is_use_supported_ss200_cable_set(core_link)) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "media check cable supported ss200 and override not set");
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SS200_CABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "media check link_up_fail failed [%d]", rtn);
+		rtn = -EINVAL;
+		goto out;
+	}
+
+	if (sl_media_lgrp_media_has_error(media_lgrp) &&
+	    !sl_core_link_policy_is_ignore_media_errors_set(core_link) &&
+		!media_lgrp->media_jack->is_supported_ss200_cable) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "media check error and override not set");
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_MEDIA_ERROR_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "media check link_up_fail failed [%d]", rtn);
+		rtn = -EINVAL;
+		goto out;
+	}
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_MEDIA_OK);
+	rtn = 0;
+
+out:
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_MEDIA_CHECK);
+
+	return rtn;
+}
+
+void sl_core_hw_link_up_cmd(struct sl_core_link *core_link,
+			    sl_core_link_up_callback_t callback, void *tag)
+{
+	int rtn;
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+
+	sl_core_data_link_is_last_down_new_set(core_link, true);
+	sl_core_data_link_is_last_up_fail_new_set(core_link, true);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"up cmd (link = 0x%p, callback = 0x%p, flags = 0x%X)",
+			core_link, callback, core_link->config.flags);
+
+	core_link->link.tags.up      = tag;
+	core_link->link.callbacks.up = callback;
+
+	rtn = sl_core_hw_link_media_check(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "up cmd link_media_check failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_link_ccw_warn_limit_crossed_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num,
+						core_link->num, false);
+	sl_core_link_ucw_warn_limit_crossed_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num,
+						core_link->num, false);
+
+	/* clear link caps */
+	memset(core_link->core_lgrp->link_caps, 0, sizeof(core_link->core_lgrp->link_caps));
+
+	if (is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+		queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_AN_UP_START]);
+	else
+		queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_UP_START]);
+}
+
+void sl_core_hw_link_up_start_work(struct work_struct *work)
+{
+	int                   rtn;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_core_link  *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_START]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up start work (link = 0x%p)", core_link);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up start work link_state_get failed [%d]", rtn);
+		return;
+	}
+	if (link_state != SL_CORE_LINK_STATE_GOING_UP) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "up start work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	spin_lock(&core_link->data_lock);
+	spin_lock(&core_link->core_lgrp->data_lock);
+	core_link->core_lgrp->link_caps[core_link->num].tech_map  = core_link->core_lgrp->config.tech_map;
+	core_link->core_lgrp->link_caps[core_link->num].fec_map   = core_link->core_lgrp->config.fec_map;
+	core_link->core_lgrp->link_caps[core_link->num].pause_map = core_link->config.pause_map;
+	core_link->core_lgrp->link_caps[core_link->num].hpe_map   = core_link->config.hpe_map;
+	spin_unlock(&core_link->core_lgrp->data_lock);
+	spin_unlock(&core_link->data_lock);
+
+	rtn = sl_core_data_link_settings(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up start data_link_settings failed [%d]", rtn);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_CONFIG_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up start work link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_data_link_timeouts(core_link);
+
+	sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_UP);
+
+	sl_core_hw_link_off(core_link);
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up start work link up disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up start work link high SER disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up start work link llr max starvation disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up start work link llr starved disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up start work link fault disable failed [%d]", rtn);
+
+	/* clear faults here to see if faults happen during up */
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+	if (sl_media_lgrp_media_type_is_active(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num)) {
+		media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num);
+		if (time_before(jiffies, media_lgrp->media_jack->cable_high_power_wait_time_end)) {
+			core_link->timers[SL_CORE_TIMER_LINK_UP_HIGH_POWER].data.timeout_ms =
+				jiffies_to_msecs(media_lgrp->media_jack->cable_high_power_wait_time_end - jiffies);
+			sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_UP_HIGH_POWER);
+			return;
+		}
+	}
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_UP]);
+}
+
+void sl_core_hw_link_up_after_an_start(struct sl_core_link *core_link)
+{
+	int           rtn;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up after an start (link = 0x%p)", core_link);
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_AN:
+		core_link->link.state = SL_CORE_LINK_STATE_GOING_UP;
+		sl_core_log_dbg(core_link, LOG_NAME, "up after an start going up");
+		spin_unlock(&core_link->link.data_lock);
+		break;
+	case SL_CORE_LINK_STATE_CANCELING:
+		sl_core_log_dbg(core_link, LOG_NAME, "up after an start canceled");
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		sl_core_log_dbg(core_link, LOG_NAME, "up after an start timeout");
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"up after an start invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	};
+
+	rtn = sl_core_data_link_settings(core_link);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up after an start data_link_settings failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_AUTONEG_CONFIG_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "up after an start link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_data_link_timeouts(core_link);
+
+	sl_core_hw_link_off(core_link);
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up after an start link up disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up after an start link high SER disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up after an start link llr max starvation disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up after an start link llr starved disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up after an start link fault disable failed [%d]", rtn);
+
+	/* clear faults here to see if faults happen during up */
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_UP]);
+}
+
+void sl_core_hw_link_up_work(struct work_struct *work)
+{
+	int                   rtn;
+	struct sl_core_link  *core_link;
+	enum sl_core_link_state link_state;
+	struct sl_media_lgrp *media_lgrp;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up work (link = 0x%p)", core_link);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up work link_state_get failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+	if ((link_state != SL_CORE_LINK_STATE_GOING_UP) && (link_state != SL_CORE_LINK_STATE_AN)) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "up work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	sl_core_hw_serdes_link_down(core_link);
+
+	sl_core_hw_pcs_config(core_link);
+
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+	if ((media_lgrp->media_jack->is_supported_ss200_cable) &&
+	    ((core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_CK_400G) ||
+		(core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_CK_200G)  ||
+		(core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_CK_100G))) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "up work link_up failed speed unsupported [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_UNSUPPORTED_SPEED_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_warn_trace(core_link, LOG_NAME, "up work link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up work (speed = %d)", core_link->pcs.settings.pcs_mode);
+
+	if (core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_BS_200G) {
+		rtn = sl_media_jack_cable_downshift(core_link->core_lgrp->core_ldev->num,
+						    core_link->core_lgrp->num, core_link->num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "up work downshift failed [%d]", rtn);
+			sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_DOWNSHIFT_MAP);
+			rtn = sl_core_link_up_fail(core_link);
+			if (rtn)
+				sl_core_log_warn_trace(core_link, LOG_NAME, "up work link_up_fail failed [%d]", rtn);
+			return;
+		}
+	} else {
+		rtn = sl_media_jack_cable_upshift(core_link->core_lgrp->core_ldev->num,
+						  core_link->core_lgrp->num, core_link->num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "up work upshift failed [%d]", rtn);
+			sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_UPSHIFT_MAP);
+			rtn = sl_core_link_up_fail(core_link);
+			if (rtn)
+				sl_core_log_warn_trace(core_link, LOG_NAME, "up work link_up_fail failed [%d]", rtn);
+			return;
+		}
+	}
+
+	rtn = sl_core_hw_serdes_link_up(core_link);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up work hw_serdes_link_up failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		/* no cause set here because serdes code will set it */
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up work link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_UP);
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up work link up enable failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_INTR_ENABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up work link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_link->core_lgrp->core_ldev))
+		sl_core_hw_pcs_tx_start(core_link);
+
+	sl_core_hw_pcs_rx_start(core_link);
+
+	atomic_set(&core_link->pml_rec.pml_rec_down_cause_remote_fault, 0);
+}
+
+void sl_core_hw_link_up_intr_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_INTR]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up intr work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up intr work link_state_get failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+	if ((link_state != SL_CORE_LINK_STATE_GOING_UP) && (link_state != SL_CORE_LINK_STATE_AN)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up intr work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_UP_CHECK);
+}
+
+static bool sl_core_hw_link_is_media_present(struct sl_core_link *core_link)
+{
+	u32                   flags;
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "is media present");
+
+	flags = sl_core_data_lgrp_config_flags_get(core_link->core_lgrp);
+
+	if (is_flag_set(flags, SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"is media present serdes loopback set (flags = %u)", flags);
+		return true;
+	}
+
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	return sl_media_jack_is_cable_online(media_lgrp->media_jack);
+}
+
+static int sl_core_hw_link_media_signal_get(struct sl_core_link *core_link,
+					    struct sl_media_jack_signal *media_signal)
+{
+	u32 lgrp_flags;
+	u32 link_flags;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "media signal get");
+
+	lgrp_flags = sl_core_data_lgrp_config_flags_get(core_link->core_lgrp);
+	if (is_flag_set(lgrp_flags, SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"media signal get serdes loopback set (flags = %u)", lgrp_flags);
+		memset(media_signal, 0, sizeof(*media_signal));
+		return 0;
+	}
+
+	link_flags = sl_core_data_link_config_flags_get(core_link);
+	if (is_flag_set(link_flags, SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE)) {
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"media signal get los lol up fail hide set (flags = %u)", link_flags);
+		memset(media_signal, 0, sizeof(*media_signal));
+		return 0;
+	}
+
+	return sl_media_jack_signal_get(core_link->core_lgrp->core_ldev->num,
+					core_link->core_lgrp->num, core_link->serdes.lane_map, media_signal);
+}
+
+static void sl_core_hw_link_up_success(struct sl_core_link *core_link)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	struct sl_ctrl_link *held_link_2 __free(sl_ctrl_link_put) = NULL;
+	struct sl_ctrl_link *held_link_3 __free(sl_ctrl_link_put) = NULL;
+	int                                 rtn;
+	struct sl_core_link_fec_cw_cntrs    cw_cntrs;
+	struct sl_core_link_fec_lane_cntrs  lane_cntrs;
+	struct sl_core_link_fec_tail_cntrs  tail_cntrs;
+	struct sl_core_link_up_info         link_up_info;
+	enum sl_core_link_state link_state;
+	struct sl_media_lgrp               *media_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up success");
+
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	sl_media_jack_fault_cause_set(media_lgrp->media_jack, SL_MEDIA_FAULT_CAUSE_NONE);
+
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	if (rtn == -EAGAIN) {
+		sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+		sl_core_hw_link_high_ser_intr_work_priv(core_link);
+	} else if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up success link high SER enable failed [%d]", rtn);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_INTR_ENABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up success link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up success link llr max starvation enable failed [%d]", rtn);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_INTR_ENABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up success link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up success link llr starved enable failed [%d]", rtn);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_INTR_ENABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up success link fault enable failed [%d]", rtn);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_INTR_ENABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up success link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				       core_link->core_lgrp->num, core_link->num);
+	if (held_link_1)
+		sl_ctrl_link_fec_down_cache_clear(held_link_1);
+
+	rtn = sl_core_hw_fec_data_get(core_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	if (rtn) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "up success w_fec_data_get failed [%d]", rtn);
+		held_link_2 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num, core_link->num);
+		if (held_link_2)
+			sl_ctrl_link_fec_up_cache_clear(held_link_2);
+	} else {
+		held_link_3 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num, core_link->num);
+		if (held_link_3)
+			sl_ctrl_link_fec_up_cache_store(held_link_3,
+							&cw_cntrs, &lane_cntrs, &tail_cntrs);
+	}
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_GOING_UP:
+		sl_core_log_dbg(core_link, LOG_NAME, "up success up");
+		set_bit(SL_CORE_INFO_MAP_LINK_UP, (unsigned long *)&(core_link->info_map));
+
+		core_link->link.state                  = SL_CORE_LINK_STATE_UP;
+
+		link_up_info.state                     = core_link->link.state;
+		link_up_info.info_map                  = core_link->info_map;
+		link_up_info.speed                     = core_link->pcs.settings.speed;
+		link_up_info.fec_mode                  = core_link->fec.settings.mode;
+		link_up_info.fec_type                  = core_link->fec.settings.type;
+
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_NONE);
+		link_up_info.cause_map                 = sl_core_data_link_last_up_fail_cause_map_get(core_link);
+		sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+		sl_core_hw_link_up_callback(core_link, &link_up_info);
+		return;
+	default:
+		sl_core_log_err(core_link, LOG_NAME, "up success invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return;
+	};
+}
+
+static void sl_core_hw_link_up_ald(struct sl_core_link  *core_link)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link up ald");
+
+	if ((core_link->num != 0)                             ||
+	    !sl_core_link_config_is_enable_ald_set(core_link) ||
+	    (core_link->core_lgrp->config.furcation != SL_MEDIA_FURCATION_X1)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "link up ald not configured");
+		spin_lock(&core_link->data_lock);
+		core_link->degrade_state = SL_LINK_DEGRADE_STATE_INACTIVE;
+		spin_unlock(&core_link->data_lock);
+		return;
+	}
+
+	memset(&(core_link->degrade_info), 0, sizeof(core_link->degrade_info));
+
+	rtn = sl_core_hw_pcs_enable_auto_lane_degrade(core_link);
+	if (rtn) {
+		spin_lock(&core_link->data_lock);
+		core_link->degrade_state = SL_LINK_DEGRADE_STATE_FAILED;
+		spin_unlock(&core_link->data_lock);
+		return;
+	}
+
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "link up ald intr enable failed [%d]", rtn);
+		spin_lock(&core_link->data_lock);
+		core_link->degrade_state = SL_LINK_DEGRADE_STATE_FAILED;
+		spin_unlock(&core_link->data_lock);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_INTR_ENABLE_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "link up ald link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	spin_lock(&core_link->data_lock);
+	core_link->degrade_state = SL_LINK_DEGRADE_STATE_ACTIVE;
+	spin_unlock(&core_link->data_lock);
+}
+
+void sl_core_hw_link_up_check_work(struct work_struct *work)
+{
+	int                   rtn;
+	u8                    temperature_state;
+	u8                    temperature_prev_state;
+	u32                   port;
+	enum sl_core_link_state link_state;
+	u64                   data64;
+	struct sl_core_link  *core_link;
+	struct sl_media_lgrp *media_lgrp;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_CHECK]);
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up check work (port = %u)", port);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up check work link_state_get failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	if ((link_state != SL_CORE_LINK_STATE_GOING_UP) && (link_state != SL_CORE_LINK_STATE_AN)) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "up check work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	if (!sl_media_lgrp_media_type_is_active(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num) ||
+	    is_flag_set(sl_core_data_lgrp_config_flags_get(core_link->core_lgrp),
+			SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE))
+		goto out;
+
+	rtn  = sl_media_jack_cable_temp_state_get(media_lgrp->media_jack, &temperature_state);
+	if (rtn) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "up check work cable_temp_state_get failed [%d]", rtn);
+		goto out;
+	}
+
+	if (temperature_state == SL_MEDIA_JACK_TEMP_STATE_HOT) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "up check work media hot detected (jack_num = %u)",
+				       media_lgrp->media_jack->physical_num);
+
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link,
+							     SL_LINK_DOWN_CAUSE_MEDIA_HOT_LINK_UP_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "up check work media hot link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	if (temperature_state == SL_MEDIA_JACK_TEMP_STATE_WARM) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "up check work media warm detected (jack_num = %u)",
+				       media_lgrp->media_jack->physical_num);
+
+		rtn  = sl_media_jack_cable_temp_prev_state_get(media_lgrp->media_jack, &temperature_prev_state);
+		if (rtn) {
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "up check work cable_temp_prev_state_get failed [%d]", rtn);
+			goto out;
+		}
+
+		if (temperature_prev_state == SL_MEDIA_JACK_TEMP_STATE_HOT) {
+			sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+			sl_media_jack_fault_cause_set(media_lgrp->media_jack, SL_MEDIA_FAULT_CAUSE_WARM);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link,
+								     SL_LINK_DOWN_CAUSE_MEDIA_WARM_LINK_UP_MAP);
+			rtn = sl_core_link_up_fail(core_link);
+			if (rtn)
+				sl_core_log_warn_trace(core_link, LOG_NAME,
+						       "up check work media warm link_up_fail failed [%d]", rtn);
+			return;
+		}
+	}
+
+out:
+	/* check PCS */
+	if (!sl_core_hw_pcs_is_ok(core_link)) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "up check work pcs is not ok");
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_PCS_FAULT_MAP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up check work link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	/* check to see if there were faults during up */
+	sl_core_hw_intr_flgs_check(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+	/* clear underrun */
+	sl_core_read64(core_link, SS2_PORT_PML_ERR_INFO_PCS_TX_DP, &data64);
+	data64 = SS2_PORT_PML_ERR_INFO_PCS_TX_DP_TX_CDC_UNDERRUN_UPDATE(data64,
+									core_link->pcs.settings.underrun_clr);
+	sl_core_write64(core_link, SS2_PORT_PML_ERR_INFO_PCS_TX_DP, data64);
+
+	if (core_link->fec.settings.up_settle_wait_ms) {
+		sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_UP_FEC_SETTLE);
+		return;
+	}
+
+	sl_core_hw_link_up_ald(core_link);
+
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+
+	sl_core_hw_link_up_success(core_link);
+}
+
+void sl_core_hw_link_up_fec_settle_work(struct work_struct *work)
+{
+	int                                 rtn;
+	struct sl_core_link_fec_cw_cntrs    cw_cntrs;
+	struct sl_core_link_fec_lane_cntrs  lane_cntrs;
+	struct sl_core_link_fec_tail_cntrs  tail_cntrs;
+	struct sl_core_link                *core_link;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_FEC_SETTLE]);
+	ctrl_link = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				     core_link->core_lgrp->num, core_link->num);
+	if (!ctrl_link)
+		return;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up fec settle work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fec settle work link_state_get failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	if ((link_state != SL_CORE_LINK_STATE_GOING_UP) && (link_state != SL_CORE_LINK_STATE_AN)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fec settle work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	rtn = sl_core_hw_fec_data_get(core_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up fec settle work hw_fec_data_get failed [%d]", rtn);
+	else
+		sl_ctrl_link_fec_data_store(ctrl_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+
+	sl_core_timer_link_begin(core_link, SL_CORE_TIMER_LINK_UP_FEC_CHECK);
+}
+
+void sl_core_hw_link_up_fec_check_work(struct work_struct *work)
+{
+	int                                 rtn;
+	struct sl_core_link_fec_cw_cntrs    cw_cntrs;
+	struct sl_core_link_fec_lane_cntrs  lane_cntrs;
+	struct sl_core_link_fec_tail_cntrs  tail_cntrs;
+	struct sl_fec_info                  fec_info;
+	struct sl_core_link                *core_link;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_FEC_CHECK]);
+	ctrl_link = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+				     core_link->core_lgrp->num, core_link->num);
+	if (!ctrl_link)
+		return;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up fec check work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fec check work link_state_get failed [%d]", rtn);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	if ((link_state != SL_CORE_LINK_STATE_GOING_UP) && (link_state != SL_CORE_LINK_STATE_AN)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fec check work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		return;
+	}
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_FEC_CHECK);
+
+	rtn = sl_core_hw_fec_data_get(core_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "up fec check work hw_fec_data_get failed [%d]", rtn);
+	else
+		sl_ctrl_link_fec_data_store(ctrl_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+
+	sl_ctrl_link_fec_data_calc(ctrl_link);
+	fec_info = sl_ctrl_link_fec_data_info_get(ctrl_link);
+
+	if (SL_CTRL_LINK_FEC_UCW_LIMIT_CHECK(core_link->fec.settings.up_ucw_limit, &fec_info)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fec check UCW exceeded up limit (UCW = %llu, CCW = %llu)",
+				      fec_info.ucw, fec_info.ccw);
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_FAIL_UCW_LIMIT_CROSSED);
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_FEC_OK);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_UCW_UP_CHECK_MAP);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up fec check link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	if (SL_CTRL_LINK_FEC_CCW_LIMIT_CHECK(core_link->fec.settings.up_ccw_limit, &fec_info)) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fec check CCW exceeded up limit (UCW = %llu, CCW = %llu)",
+				      fec_info.ucw, fec_info.ccw);
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_FAIL_CCW_LIMIT_CROSSED);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_CCW_UP_CHECK_MAP);
+		sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+		rtn = sl_core_link_up_fail(core_link);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME, "up fec check link_up_fail failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_FEC_CHECK);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_FEC_OK);
+
+	sl_core_hw_link_up_ald(core_link);
+
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+
+	sl_core_hw_link_up_success(core_link);
+}
+
+static void sl_core_hw_link_last_up_fail_cause_map_set_from_signal(struct sl_core_link *core_link,
+								   struct sl_media_jack_signal *media_signal)
+{
+	if (media_signal->tx.lol_map & core_link->serdes.lane_map)
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_TX_LOL_UP_MAP);
+
+	if (media_signal->rx.lol_map & core_link->serdes.lane_map)
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_RX_LOL_UP_MAP);
+
+	if (media_signal->tx.los_map & core_link->serdes.lane_map)
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_TX_LOS_UP_MAP);
+
+	if (media_signal->rx.los_map & core_link->serdes.lane_map)
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_RX_LOS_UP_MAP);
+}
+
+void sl_core_hw_link_up_timeout_work(struct work_struct *work)
+{
+	struct sl_core_link         *core_link;
+	struct sl_core_link_up_info  link_up_info;
+	enum sl_core_link_state link_state;
+	int                          rtn;
+	struct sl_media_jack_signal  media_signal;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_TIMEOUT]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up timeout work");
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_AN:
+		sl_core_log_dbg(core_link, LOG_NAME, "up timeout work going down");
+		core_link->link.state = SL_CORE_LINK_STATE_TIMEOUT;
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_TIMEOUT_MAP);
+		break;
+	default:
+		sl_core_log_err(core_link, LOG_NAME, "up timeout work invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return;
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LINK_UP_TIMEOUT);
+
+	/* stop timers */
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_SETTLE);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_HIGH_POWER);
+
+	/* cancel work - except for timeout work */
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_DONE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_SETTLE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FAIL]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CANCEL]));
+
+	/* disable interrupts */
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (core_link->num == 0)
+		sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_HIGH_SER_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_FAULT_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]));
+	if (core_link->num == 0)
+		cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]));
+
+	/* Check media */
+	if (sl_core_hw_link_is_media_present(core_link)) {
+		/* Check signal before turning the link off */
+		rtn = sl_core_hw_link_media_signal_get(core_link, &media_signal);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "up timeout work media signal get failed [%d]", rtn);
+		else
+			sl_core_hw_link_last_up_fail_cause_map_set_from_signal(core_link, &media_signal);
+	} else {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_NO_MEDIA);
+	}
+
+	/* stop hardware */
+	sl_core_hw_an_stop(core_link);
+	sl_core_hw_link_off(core_link);
+
+	sl_core_data_link_state_set(core_link, SL_CORE_LINK_STATE_DOWN);
+
+	sl_core_hw_link_up_callback(core_link, sl_core_link_up_info_get(core_link, &link_up_info));
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+}
+
+void sl_core_hw_link_up_cancel_work(struct work_struct *work)
+{
+	struct sl_core_link         *core_link;
+	struct sl_core_link_up_info  link_up_info;
+	enum sl_core_link_state link_state;
+	int                          rtn;
+	struct sl_media_jack_signal  media_signal;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_CANCEL]);
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up cancel work link_state_get failed [%d]", rtn);
+		return;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up cancel work (link_state = %u %s)", link_state,
+			sl_core_link_state_str(link_state));
+
+	if (link_state != SL_CORE_LINK_STATE_CANCELING) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up cancel work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LINK_UP_CANCEL);
+
+	/* stop timers */
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_SETTLE);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_HIGH_POWER);
+
+	/* cancel work */
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_DONE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_TIMEOUT]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_SETTLE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FAIL]));
+
+	/* disable interrupts */
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (core_link->num == 0)
+		sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+
+	/* Cancel work queued from interrupt */
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_HIGH_SER_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_FAULT_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]));
+	if (core_link->num == 0)
+		cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]));
+
+	/* Check media */
+	if (sl_core_hw_link_is_media_present(core_link)) {
+		/* Check signal before turning the link off */
+		rtn = sl_core_hw_link_media_signal_get(core_link, &media_signal);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "up timeout work media signal get failed [%d]", rtn);
+		else
+			sl_core_hw_link_last_up_fail_cause_map_set_from_signal(core_link, &media_signal);
+	} else {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_NO_MEDIA);
+	}
+
+	/* stop hardware */
+	sl_core_hw_an_stop(core_link);
+	sl_core_hw_link_off(core_link);
+
+	sl_core_data_link_state_set(core_link, SL_CORE_LINK_STATE_DOWN);
+
+	sl_core_hw_link_up_callback(core_link, sl_core_link_up_info_get(core_link, &link_up_info));
+
+	sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_UP_CANCELED_MAP);
+	sl_core_hw_link_down_callback(core_link);
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+}
+
+void sl_core_hw_link_up_fail_work(struct work_struct *work)
+{
+	struct sl_core_link         *core_link;
+	struct sl_core_link_up_info  link_up_info;
+	enum sl_core_link_state link_state;
+	int                          rtn;
+	struct sl_media_jack_signal  media_signal;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_UP_FAIL]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up fail work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fail work link_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_GOING_DOWN) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "up fail work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LINK_UP_FAIL);
+
+	/* stop timers */
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_SETTLE);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_FEC_CHECK);
+	sl_core_timer_link_end(core_link, SL_CORE_TIMER_LINK_UP_HIGH_POWER);
+
+	/* cancel work */
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_AN_UP_DONE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_START]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_TIMEOUT]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_SETTLE]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_FEC_CHECK]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_CANCEL]));
+
+	/* disable interrupts */
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (core_link->num == 0)
+		sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+
+	/* Cancel work queued from interrupt */
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_UP_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_HIGH_SER_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_FAULT_INTR]));
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]));
+	if (core_link->num == 0)
+		cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]));
+
+	/* Check media */
+	if (sl_core_hw_link_is_media_present(core_link)) {
+		/* Check signal before turning the link off */
+		rtn = sl_core_hw_link_media_signal_get(core_link, &media_signal);
+		if (rtn)
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "up timeout work media signal get failed [%d]", rtn);
+		else
+			sl_core_hw_link_last_up_fail_cause_map_set_from_signal(core_link, &media_signal);
+	} else {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_NO_MEDIA);
+	}
+
+	/* stop hardware */
+	sl_core_hw_an_stop(core_link);
+	sl_core_hw_link_off(core_link);
+
+	sl_core_data_link_state_set(core_link, SL_CORE_LINK_STATE_DOWN);
+
+	sl_core_hw_link_up_callback(core_link, sl_core_link_up_info_get(core_link, &link_up_info));
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+}
+
+void sl_core_hw_link_down_work(struct work_struct *work)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	int                                 rtn;
+	struct sl_core_link_fec_cw_cntrs    cw_cntrs;
+	struct sl_core_link_fec_lane_cntrs  lane_cntrs;
+	struct sl_core_link_fec_tail_cntrs  tail_cntrs;
+	struct sl_core_link                *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_DOWN]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "down work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "down work link_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_GOING_DOWN) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "down work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LINK_DOWN);
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_HIGH_SER);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "down work link high SER disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "down work link llr max starvation disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "down work link llr starved disable failed [%d]", rtn);
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "down work link fault disable failed [%d]", rtn);
+	if (core_link->num == 0) {
+		rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+		if (rtn != 0)
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "down work lane degrade disable failed [%d]", rtn);
+	}
+
+	cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_HIGH_SER_INTR]);
+	cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]);
+	cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]);
+	cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_FAULT_INTR]);
+	cancel_work_sync(&(core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]));
+	if (core_link->num == 0)
+		cancel_work_sync(&core_link->work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]);
+
+	rtn = sl_core_hw_fec_data_get(core_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	if (rtn) {
+		sl_core_log_warn_trace(core_link, LOG_NAME, "down work hw_fec_data_get failed [%d]", rtn);
+	} else {
+		held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num, core_link->num);
+		if (held_link_1)
+			sl_ctrl_link_fec_down_cache_store(held_link_1,
+							  &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	}
+
+	/* Check media */
+	if (!sl_core_hw_link_is_media_present(core_link))
+		sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_NO_MEDIA);
+
+	sl_core_hw_link_off(core_link);
+
+	sl_core_data_link_state_set(core_link, SL_CORE_LINK_STATE_DOWN);
+
+	sl_core_hw_link_down_callback(core_link);
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+}
+
+void sl_core_hw_link_high_ser_intr_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_HIGH_SER_INTR]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "high SER intr work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "high SER intr work link_state_get failed [%d]", rtn);
+		return;
+	}
+
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UP:
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_AN:
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+		break;
+	default:
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "high SER intr work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+			return;
+	}
+
+	sl_core_hw_link_high_ser_intr_work_priv(core_link);
+}
+
+void sl_core_hw_link_llr_max_starvation_intr_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_LLR_MAX_STARVATION_INTR]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "llr max starvation intr work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "llr max starvation intr work link_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_UP) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "llr max starvation intr work invalid state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LLR_MAX_STARVATION);
+
+	sl_core_log_warn_trace(core_link, LOG_NAME, "llr max starvation occurred");
+
+	while (sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION) == -EALREADY) {
+		rtn = sl_core_data_link_state_get(core_link, &link_state);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "llr max starvation intr work link_state_get failed [%d]", rtn);
+			return;
+		}
+
+		switch (link_state) {
+		case SL_CORE_LINK_STATE_GOING_DOWN:
+		case SL_CORE_LINK_STATE_CANCELING:
+		case SL_CORE_LINK_STATE_TIMEOUT:
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "llr max starvation intr work invalid state (state = %u %s)",
+					      link_state, sl_core_link_state_str(link_state));
+			return;
+		default:
+			sl_core_log_dbg(core_link, LOG_NAME,
+					"llr max starvation intr work clearing flags (state = %u %s)",
+					link_state, sl_core_link_state_str(link_state));
+			usleep_range(10000, 12000);
+			sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_LLR_MAX_STARVATION);
+			continue;
+		}
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_LLR_MAX_STARVATION);
+}
+
+void sl_core_hw_link_llr_starved_intr_work(struct work_struct *work)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	enum sl_core_link_state link_state;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_LLR_STARVED_INTR]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "llr starved intr work");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "llr starved intr work failed to get link state [%d]", rtn);
+		return;
+	}
+
+	if (link_state != SL_CORE_LINK_STATE_UP) {
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"llr starved intr work invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		return;
+	}
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LLR_STARVED);
+
+	sl_core_log_warn_trace(core_link, LOG_NAME, "llr starved occurred");
+
+	while (sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED) == -EALREADY) {
+		rtn = sl_core_data_link_state_get(core_link, &link_state);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "llr starved intr work link_state_get failed [%d]", rtn);
+			return;
+		}
+
+		switch (link_state) {
+		case SL_CORE_LINK_STATE_GOING_DOWN:
+		case SL_CORE_LINK_STATE_CANCELING:
+		case SL_CORE_LINK_STATE_TIMEOUT:
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "llr starved intr work invalid state (state = %u %s)",
+					      link_state, sl_core_link_state_str(link_state));
+			return;
+		default:
+			sl_core_log_dbg(core_link, LOG_NAME,
+					"llr starved intr work clearing flags (state = %u %s)",
+					link_state, sl_core_link_state_str(link_state));
+			usleep_range(10000, 12000);
+			sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_LLR_STARVED);
+			continue;
+		}
+	}
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_LLR_STARVED);
+}
+
+static void sl_core_hw_link_fault_callback_start(struct sl_core_link *core_link)
+{
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fault callback start");
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UP:
+		core_link->link.state = SL_CORE_LINK_STATE_GOING_DOWN;
+		spin_unlock(&core_link->link.data_lock);
+		core_link->config.fault_start_callback(core_link->core_lgrp->core_ldev->num,
+						       core_link->core_lgrp->num, core_link->num);
+		break;
+	default:
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"fault callback start invalid state (link_state = %u %s)",
+				link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return;
+	}
+}
+
+static void sl_core_hw_link_fault_link_down(struct sl_core_link *core_link)
+{
+	struct sl_ctrl_link *held_link_1 __free(sl_ctrl_link_put) = NULL;
+	int                                 rtn;
+	struct sl_core_link_fec_cw_cntrs    cw_cntrs;
+	struct sl_core_link_fec_lane_cntrs  lane_cntrs;
+	struct sl_core_link_fec_tail_cntrs  tail_cntrs;
+	struct sl_media_lgrp               *media_lgrp;
+	u8                                  temperature_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fault link down");
+
+	rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LINK_UP);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "fault link down link up disable failed [%d]", rtn);
+	if (core_link->num == 0) {
+		rtn = sl_core_hw_intr_flgs_disable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+		if (rtn != 0)
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "fault link down lane degrade disable failed [%d]", rtn);
+	}
+
+	rtn = sl_core_hw_fec_data_get(core_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	if (rtn) {
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "fault link down hw_fec_data_get failed [%d]", rtn);
+	} else {
+		held_link_1 = sl_ctrl_link_get(core_link->core_lgrp->core_ldev->num,
+					       core_link->core_lgrp->num, core_link->num);
+		if (held_link_1)
+			sl_ctrl_link_fec_down_cache_store(held_link_1,
+							  &cw_cntrs, &lane_cntrs, &tail_cntrs);
+	}
+
+	sl_core_hw_link_off(core_link);
+
+	if (!sl_core_hw_link_is_media_present(core_link))
+		sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_NO_MEDIA);
+	if (!is_flag_set(sl_core_data_lgrp_config_flags_get(core_link->core_lgrp),
+			 SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		if (sl_media_lgrp_media_type_is_active(core_link->core_lgrp->core_ldev->num,
+						       core_link->core_lgrp->num)) {
+			media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+			rtn  = sl_media_jack_cable_temp_state_get(media_lgrp->media_jack, &temperature_state);
+			if (rtn)
+				sl_core_log_warn_trace(core_link, LOG_NAME,
+						       "fault link down cable_temp_state_get failed [%d]", rtn);
+
+			if (temperature_state ==   SL_MEDIA_JACK_TEMP_STATE_HOT) {
+				sl_core_log_warn_trace(core_link, LOG_NAME,
+						       "fault link down cable hot detected");
+				sl_core_data_link_last_down_cause_map_set(core_link,
+									  SL_LINK_DOWN_CAUSE_MEDIA_HOT_FAULT_MAP);
+				sl_media_jack_cable_low_power_set(media_lgrp->media_jack);
+			}
+		}
+	}
+	sl_core_data_link_state_set(core_link, SL_CORE_LINK_STATE_DOWN);
+
+	rtn = core_link->config.fault_callback(core_link->link.tags.up, SL_CORE_LINK_STATE_DOWN,
+					       sl_core_data_link_last_down_cause_map_get(core_link),
+					       sl_core_data_link_info_map_get(core_link));
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "fault link down callback failed [%d]", rtn);
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+}
+
+static bool sl_core_hw_link_is_pml_rec_window_valid(struct sl_core_link *core_link, ktime_t current_time)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "is pml rec window valid");
+
+	if (ktime_ms_delta(current_time, core_link->pml_rec.pml_rec_window_start_time) >
+	    core_link->config.pml_rec_rate_limit_window_size_ms)
+		return false;
+
+	return true;
+}
+
+static void sl_core_hw_link_pml_rec_success(struct sl_core_link *core_link)
+{
+	struct sl_ctrl_lgrp     *ctrl_lgrp;
+	union sl_lgrp_notif_info info;
+	int                      rtn;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "pml recovery success work");
+
+	info.pml_rec_info = core_link->pml_rec.pml_rec_info;
+	rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_lgrp, core_link->num, SL_LGRP_NOTIF_PML_RECOVERY, &info, 0);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "pml recovery success work ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+	msleep(200);
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "pml recovery success work intr flgs enable failed [%d]", rtn);
+}
+
+static void sl_core_hw_link_pml_rec_fail(struct sl_core_link *core_link)
+{
+	struct sl_ctrl_lgrp     *ctrl_lgrp;
+	union sl_lgrp_notif_info info;
+	int                      rtn;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "pml recovery fail work");
+
+	info.pml_rec_info = core_link->pml_rec.pml_rec_info;
+	rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_lgrp, core_link->num, SL_LGRP_NOTIF_PML_RECOVERY, &info, 0);
+	if (rtn)
+		sl_media_log_warn_trace(core_link, LOG_NAME,
+					"pml recovery fail work ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+	sl_core_hw_link_fault_callback_start(core_link);
+
+	sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+
+	if (core_link->pml_rec.pml_rec_last_down_cause == PML_REC_DOWN_CAUSE_LOCAL_FAULT) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "local fault occurred");
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_LOCAL_FAULT);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_LF_MAP);
+	} else if (core_link->pml_rec.pml_rec_last_down_cause == PML_REC_DOWN_CAUSE_LINK_DOWN) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "link down occurred");
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_LINK_DOWN);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_DOWN_MAP);
+	}
+
+	sl_core_hw_link_fault_link_down(core_link);
+}
+
+void sl_core_hw_link_pml_rec_poll_work(struct work_struct *work)
+{
+	struct sl_core_link *core_link;
+	ktime_t              current_time;
+	s64                  elapsed_time;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_PML_REC_POLL]);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "pml rec poll work");
+
+	while (1) {
+		if (atomic_read(&core_link->pml_rec.pml_rec_running) == 0)
+			return;
+
+		current_time = ktime_get();
+
+		if (!sl_core_hw_link_is_pml_rec_window_valid(core_link, current_time)) {
+			sl_core_log_dbg(core_link, LOG_NAME, "pml rec poll work window elapsed");
+			core_link->pml_rec.pml_rec_window_start_time   = current_time;
+			core_link->pml_rec.pml_rec_poll_start_time     = current_time;
+			core_link->pml_rec.pml_rec_attempts_total_time = 0;
+		}
+
+		core_link->pml_rec.pml_rec_attempts_total_time = ktime_add(core_link->pml_rec.pml_rec_attempts_total_time,
+									   ktime_sub(current_time, core_link->pml_rec.pml_rec_poll_start_time));
+
+		sl_core_log_dbg(core_link, LOG_NAME, "pml rec poll work (attempt_total_time = %lldms)",
+				ktime_to_ms(core_link->pml_rec.pml_rec_attempts_total_time));
+
+		if (sl_core_hw_pcs_is_pml_rec_success(core_link)) {
+
+			elapsed_time = ktime_ms_delta(current_time, core_link->pml_rec.pml_rec_attempt_start_time);
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "pml rec poll work successful (elapsed_time = %lldms, down_cause = %s)",
+					       elapsed_time,
+					       sl_core_link_pml_rec_down_cause_str(core_link->pml_rec.pml_rec_last_down_cause));
+
+			atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_SUCCESSES]);
+			atomic_set(&core_link->pml_rec.pml_rec_running, 0);
+
+			sl_core_hw_link_pml_rec_success(core_link);
+
+			return;
+		}
+
+		if (ktime_ms_delta(current_time, core_link->pml_rec.pml_rec_attempt_start_time) >
+		    core_link->config.pml_rec_timeout_ms) {
+
+			elapsed_time = ktime_ms_delta(current_time, core_link->pml_rec.pml_rec_attempt_start_time);
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "pml rec poll work timedout (elapsed_time = %lldms, down_cause = %s)",
+					      elapsed_time,
+					      sl_core_link_pml_rec_down_cause_str(core_link->pml_rec.pml_rec_last_down_cause));
+
+			if (core_link->pml_rec.pml_rec_last_down_cause == PML_REC_DOWN_CAUSE_LOCAL_FAULT)
+				atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_LOCAL_FAULT_FAILED_CAUSE]);
+			else if (core_link->pml_rec.pml_rec_last_down_cause == PML_REC_DOWN_CAUSE_LINK_DOWN)
+				atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_DOWN_FAILED_CAUSE]);
+
+			atomic_set(&core_link->pml_rec.pml_rec_running, 0);
+
+			sl_core_hw_link_pml_rec_fail(core_link);
+
+			return;
+		}
+
+		if (ktime_to_ms(core_link->pml_rec.pml_rec_attempts_total_time) >
+		    core_link->config.pml_rec_rate_limit_max_time_ms) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "pml recovery rate limit exceeded");
+
+			if (core_link->pml_rec.pml_rec_last_down_cause == PML_REC_DOWN_CAUSE_LOCAL_FAULT)
+				atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_LOCAL_FAULT_FAILED_CAUSE]);
+			else if (core_link->pml_rec.pml_rec_last_down_cause == PML_REC_DOWN_CAUSE_LINK_DOWN)
+				atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_DOWN_FAILED_CAUSE]);
+
+			atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_RATE_LIMIT_EXCEEDED]);
+			atomic_set(&core_link->pml_rec.pml_rec_running, 0);
+			atomic_set(&core_link->pml_rec.pml_rec_rate_limit_exceeded, 1);
+
+			sl_core_hw_link_pml_rec_fail(core_link);
+
+			return;
+		}
+
+		core_link->pml_rec.pml_rec_poll_start_time = current_time;
+
+		usleep_range(3500, 4000);
+	}
+}
+
+static void sl_core_hw_link_pml_recovery(struct sl_core_link *core_link)
+{
+	ktime_t current_time;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "pml recovery");
+
+	core_link->pml_rec.pml_rec_info.magic = SL_LINK_PML_REC_MAGIC;
+	core_link->pml_rec.pml_rec_info.ver   = SL_LINK_PML_REC_VER;
+	core_link->pml_rec.pml_rec_info.size  = sizeof(struct sl_link_pml_rec_info);
+
+	atomic_set(&core_link->pml_rec.pml_rec_running, 1);
+
+	current_time = ktime_get();
+
+	if ((core_link->pml_rec.pml_rec_window_start_time == 0) ||
+	    (!sl_core_hw_link_is_pml_rec_window_valid(core_link, current_time))) {
+
+		core_link->pml_rec.pml_rec_window_start_time   = current_time;
+		core_link->pml_rec.pml_rec_attempts_total_time = 0;
+	}
+
+	core_link->pml_rec.pml_rec_attempt_start_time = current_time;
+	core_link->pml_rec.pml_rec_poll_start_time    = current_time;
+
+	sl_core_hw_pcs_toggle(core_link);
+
+	atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_ATTEMPTS]);
+
+	queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_PML_REC_POLL]);
+}
+
+static inline void sl_core_hw_link_fault_handling_start(struct sl_core_link *core_link)
+{
+	sl_core_hw_link_fault_callback_start(core_link);
+	sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num,
+			      core_link->core_lgrp->num);
+}
+
+void sl_core_hw_link_fault_intr_work(struct work_struct *work)
+{
+	u64                  link_down;
+	u64                  remote_fault;
+	u64                  local_fault;
+	u64                  llr_replay_max;
+	struct sl_core_link *core_link;
+	u64                  data64;
+	u64                  replay_ct_max;
+	u32                  port;
+	int                  rtn;
+	ktime_t              current_time;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_FAULT_INTR]);
+	port      = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"fault intr work (port = %u, flgs = 0x%016llX, 0x%016llX, 0x%016llX, 0x%016llX)",
+			port,
+			core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[0],
+			core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1],
+			core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[2],
+			core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[3]);
+
+	switch (core_link->num) {
+	case 0:
+		link_down =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_0_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		remote_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_0_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		local_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_0_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		llr_replay_max =
+		SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_0_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		break;
+	case 1:
+		link_down =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_1_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		remote_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_1_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		local_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_1_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		llr_replay_max =
+		SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_1_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		break;
+	case 2:
+		link_down =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_2_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		remote_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_2_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		local_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_2_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		llr_replay_max =
+		SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_2_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		break;
+	case 3:
+		link_down =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_3_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		remote_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_3_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		local_fault =
+		SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_3_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		llr_replay_max =
+		SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_3_GET(core_link->intrs[SL_CORE_HW_INTR_LINK_FAULT].source[1]);
+		break;
+	default:
+		link_down      = 0;
+		remote_fault   = 0;
+		local_fault    = 0;
+		llr_replay_max = 0;
+		break;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"fault intr work (llr_replay = 0x%llX, local = 0x%llX, remote = 0x%llX, down = 0x%llX)",
+			llr_replay_max, local_fault, remote_fault, link_down);
+
+	if (llr_replay_max) {
+		sl_core_log_dbg(core_link, LOG_NAME, "fault intr work LLR replay max");
+		goto link_down;
+	}
+
+	if (!sl_core_link_config_is_enable_pml_recovery_set(core_link)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "fault intr work PML recovery not set");
+		goto link_down;
+	}
+
+	if (sl_core_link_is_pml_recovery_running(core_link)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "fault intr work PML recovery running already");
+		goto link_down;
+	}
+
+	current_time = ktime_get();
+	if (sl_core_hw_link_is_pml_rec_window_valid(core_link, current_time)) {
+		if (ktime_to_ms(core_link->pml_rec.pml_rec_attempts_total_time) >
+		    core_link->config.pml_rec_rate_limit_max_time_ms) {
+			if (atomic_read(&core_link->pml_rec.pml_rec_rate_limit_exceeded) == 0) {
+				atomic_set(&core_link->pml_rec.pml_rec_rate_limit_exceeded, 1);
+				atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_RATE_LIMIT_EXCEEDED]);
+			}
+
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fault intr work rate limit exceeded for this window");
+			goto link_down;
+		}
+	}
+
+	atomic_set(&core_link->pml_rec.pml_rec_rate_limit_exceeded, 0);
+
+	if (local_fault) {
+		if (atomic_read(&core_link->pml_rec.pml_rec_down_cause_remote_fault) == 1) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fault intr work link down ignored remote fault previously");
+			goto link_down;
+		}
+
+		atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_LOCAL_FAULT_CAUSE]);
+
+		core_link->pml_rec.pml_rec_last_down_cause = PML_REC_DOWN_CAUSE_LOCAL_FAULT;
+		sl_core_hw_link_pml_recovery(core_link);
+		return;
+	} else if (link_down) {
+		if (atomic_read(&core_link->pml_rec.pml_rec_down_cause_remote_fault) == 1) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fault intr work link down ignored remote fault previously");
+			goto link_down;
+		}
+
+		atomic_inc(&core_link->pml_rec.pml_rec_info.pml_rec_counters[SL_LINK_PML_REC_LINK_DOWN_CAUSE]);
+
+		core_link->pml_rec.pml_rec_last_down_cause = PML_REC_DOWN_CAUSE_LINK_DOWN;
+		sl_core_hw_link_pml_recovery(core_link);
+		return;
+	} else if (remote_fault) {
+		core_link->pml_rec.pml_rec_last_down_cause = PML_REC_DOWN_CAUSE_REMOTE_FAULT;
+		atomic_set(&core_link->pml_rec.pml_rec_down_cause_remote_fault, 1);
+
+		msleep(200);
+		sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+		rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+		if (rtn)
+			sl_core_log_warn_trace(core_link, LOG_NAME,
+					       "fault intr work intr flgs enable failed [%d]", rtn);
+		return;
+	}
+
+link_down:
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_NUM_BITS);
+
+	if (sl_core_link_config_is_enable_pml_recovery_set(core_link) &&
+	    atomic_read(&core_link->pml_rec.pml_rec_down_cause_remote_fault) == 1) {
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "fault intr work setting down cause as remote fault because ignored previously");
+		sl_core_hw_link_fault_handling_start(core_link);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_REMOTE_FAULT);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_RF_MAP);
+		goto out;
+	}
+
+	if (llr_replay_max) {
+		sl_core_read64(core_link, SS2_PORT_PML_CFG_LLR_SM(core_link->num), &data64);
+		replay_ct_max = SS2_PORT_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(data64);
+
+		if (replay_ct_max == 0xFF && !local_fault && !remote_fault && !link_down) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "llr replay max occurred, ignored");
+			msleep(200);
+			sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+
+			rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LINK_FAULT);
+			if (rtn)
+				sl_core_log_warn_trace(core_link, LOG_NAME,
+						       "fault intr work intr flgs enable failed [%d]", rtn);
+			return;
+		}
+
+		sl_core_log_err_trace(core_link, LOG_NAME, "llr replay max occurred");
+		sl_core_hw_link_fault_handling_start(core_link);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LLR_REPLAY_MAX);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_LLR_REPLAY_MAX_MAP);
+	}
+
+	if (local_fault) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "local fault occurred");
+		sl_core_hw_link_fault_handling_start(core_link);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_LOCAL_FAULT);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_LF_MAP);
+	}
+
+	if (remote_fault) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "remote fault occurred");
+		sl_core_hw_link_fault_handling_start(core_link);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_REMOTE_FAULT);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_RF_MAP);
+	}
+
+	if (link_down) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "link down occurred");
+		sl_core_hw_link_fault_handling_start(core_link);
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_LINK_DOWN);
+		if (!(sl_core_data_link_last_down_cause_map_get(core_link) & SL_LINK_DOWN_CAUSE_COMMAND))
+			sl_core_data_link_last_down_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_DOWN_MAP);
+	}
+
+out:
+	sl_core_hw_link_fault_link_down(core_link);
+}
+
+static inline int sl_core_hw_link_speed_get(u32 pcs_mode, int hweight)
+{
+    return hweight * (pcs_mode == SL_CORE_HW_PCS_MODE_CK_400G ? 100 : 50);
+}
+
+void sl_core_hw_link_lane_degrade_intr_work(struct work_struct *work)
+{
+	struct sl_core_link        *core_link;
+	union sl_lgrp_notif_info    info;
+	struct sl_link_degrade_info ald_info;
+	bool                        is_recoverable;
+	u32                         port;
+	u64                         val64;
+	u64                         data64;
+	int                         rtn;
+
+	core_link = container_of(work, struct sl_core_link, work[SL_CORE_WORK_LINK_LANE_DEGRADE_INTR]);
+	port      = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"lane degrade intr work (port = %u, source = 0x%016llX)",
+			port, core_link->intrs[SL_CORE_HW_INTR_LANE_DEGRADE].source[1]);
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_LINK_DEGRADED);
+
+	/* wait before reading CSR so the lane degrade values stabilize */
+	msleep(20);
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_PCS_LANE_DEGRADE, &data64);
+
+	val64 = SS2_PORT_PML_STS_PCS_LANE_DEGRADE_WORD0_RX_PLS_AVAILABLE_GET(data64);
+	ald_info.rx_degrade_map = (u8)val64;
+
+	val64 = SS2_PORT_PML_STS_PCS_LANE_DEGRADE_WORD0_LP_PLS_AVAILABLE_GET(data64);
+	ald_info.tx_degrade_map = (u8)val64;
+
+	if ((ald_info.rx_degrade_map != core_link->degrade_info.rx_degrade_map) &&
+	    (ald_info.rx_degrade_map != 0xF))
+		ald_info.is_rx_degrade = true;
+	else
+		ald_info.is_rx_degrade = false;
+
+	if ((ald_info.tx_degrade_map != core_link->degrade_info.tx_degrade_map) &&
+	    (ald_info.tx_degrade_map != 0xF))
+		ald_info.is_tx_degrade = true;
+	else
+		ald_info.is_tx_degrade = false;
+
+	ald_info.rx_link_speed = sl_core_hw_link_speed_get(core_link->pcs.settings.pcs_mode,
+							   hweight8(ald_info.rx_degrade_map));
+	ald_info.tx_link_speed = sl_core_hw_link_speed_get(core_link->pcs.settings.pcs_mode,
+							   hweight8(ald_info.tx_degrade_map));
+
+	core_link->degrade_info.magic = SL_LINK_DEGRADE_INFO_MAGIC;
+	core_link->degrade_info.ver   = SL_LINK_DEGRADE_INFO_VER;
+	core_link->degrade_info.size  = sizeof(struct sl_link_degrade_info);
+
+	spin_lock(&core_link->data_lock);
+	core_link->degrade_info = ald_info;
+	info.degrade_info       = ald_info;
+	spin_unlock(&core_link->data_lock);
+
+	sl_core_hw_serdes_degraded_lanes_state_set(core_link, ald_info.tx_degrade_map, ald_info.rx_degrade_map);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"lane degrade intr work (is_rx_degrade = %s, rx_degrade_map = 0x%X, rx_link_speed = %u)",
+			info.degrade_info.is_rx_degrade ? "yes" : "no",
+			info.degrade_info.rx_degrade_map, info.degrade_info.rx_link_speed);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"lane degrade intr work (is_tx_degrade = %s, tx_degrade_map = 0x%X, tx_link_speed = %u)",
+			info.degrade_info.is_tx_degrade ? "yes" : "no",
+			info.degrade_info.tx_degrade_map, info.degrade_info.tx_link_speed);
+
+	rtn = sl_ctrl_lgrp_notif_enqueue(sl_ctrl_lgrp_get(core_link->core_lgrp->core_ldev->num,
+							  core_link->core_lgrp->num),
+					 core_link->num, SL_LGRP_NOTIF_LANE_DEGRADE, &info, 0);
+	if (rtn)
+		sl_media_log_warn_trace(core_link, LOG_NAME,
+					"lane degrade intr work ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+	rtn = sl_core_hw_serdes_lanes_up_prbs(core_link, ald_info.tx_degrade_map, ald_info.rx_degrade_map);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lane degrade intr work lanes up prbs failed [%d] (tx_degrade_map = 0x%X, rx_degrade_map = 0x%X)",
+				      rtn, ald_info.tx_degrade_map, ald_info.rx_degrade_map);
+		is_recoverable = false;
+	} else {
+		is_recoverable = true;
+	}
+
+	spin_lock(&core_link->data_lock);
+	core_link->degrade_info.is_recoverable = is_recoverable;
+	info.is_degrade_recoverable = is_recoverable;
+	spin_unlock(&core_link->data_lock);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lane degrade intr work (is_recoverable = %s)",
+			info.is_degrade_recoverable ? "yes" : "no");
+
+	rtn = sl_ctrl_lgrp_notif_enqueue(sl_ctrl_lgrp_get(core_link->core_lgrp->core_ldev->num,
+							  core_link->core_lgrp->num),
+					 core_link->num, SL_LGRP_NOTIF_LANE_DEGRADE_RECOVERY, &info, 0);
+	if (rtn)
+		sl_media_log_warn_trace(core_link, LOG_NAME,
+					"lane degrade intr work ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+	sl_core_hw_intr_flgs_clr(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+	rtn = sl_core_hw_intr_flgs_enable(core_link, SL_CORE_HW_INTR_LANE_DEGRADE);
+	if (rtn)
+		sl_core_log_err_trace(core_link, LOG_NAME, "lane degrade intr work ald enable failed [%d]", rtn);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.c
new file mode 100644
index 000000000000..dbfc6ceff294
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.c
@@ -0,0 +1,905 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/workqueue.h>
+
+#include "sl_core_str.h"
+#include "sl_core_link.h"
+#include "sl_core_llr.h"
+#include "base/sl_core_timer_llr.h"
+#include "base/sl_core_log.h"
+#include "data/sl_core_data_llr.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_llr.h"
+#include "hw/sl_core_hw_pcs.h"
+
+#define SL_CORE_LLR_BYTES_PER_FRAME    9216ULL
+#define SL_CORE_LLR_NUM_FRAMES         2ULL
+#define SL_CORE_LLR_BYTE_QUANTA        64ULL
+#define SL_CORE_LLR_FRAME_SIZE         32ULL
+#define SL_CORE_LLR_ASIC_TX_DELAY_MS   25
+#define SL_CORE_LLR_ASIC_RX_DELAY_MS   91
+
+#define SL_CORE_LLR_STOP_TIMEOUT       2000
+
+#define LOG_NAME SL_CORE_HW_LLR_LOG_NAME
+
+void sl_core_hw_llr_link_init(struct sl_core_link *core_link)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link init (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_LLR_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_LINK_DOWN_BEHAVIOR_UPDATE(data64,
+									SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_DISCARD);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_LLR_SUBPORT(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_LLR_SUBPORT(core_link->num));
+}
+
+static void sl_core_hw_llr_setup_callback(struct sl_core_llr *core_llr)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "setup callback");
+
+	core_llr->callbacks.setup(core_llr->tag, core_llr->state,
+		core_llr->info_map, core_llr->data);
+}
+
+static void sl_core_hw_llr_start_callback(struct sl_core_llr *core_llr)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "start callback");
+
+	core_llr->callbacks.start(core_llr->tag, core_llr->state, core_llr->info_map);
+}
+
+static void sl_core_hw_llr_loop_time_start(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "loop time start (port = %d)", port);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_ENABLE_LOOP_TIMING_UPDATE(data64, 1); /* enable */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+static void sl_core_hw_llr_loop_time_stop(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "loop time stop (port = %d)", port);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_ENABLE_LOOP_TIMING_UPDATE(data64, 0); /* disable */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+static void sl_core_hw_llr_ordered_sets_start(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "ordered sets start (port = %d)", port);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(data64, 1); /* enable */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_TX_PCS_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(data64, 1); /* enable */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_TX_PCS_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+static void sl_core_hw_llr_ordered_sets_stop(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "ordered sets stop (port = %d)", port);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(data64, 0); /* disable */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_TX_PCS_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(data64, 0); /* disable */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_TX_PCS_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+static void sl_core_hw_llr_on(struct sl_core_llr *core_llr)
+{
+	u32                  port;
+	u64                  data64;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "on (port = %d)", port);
+
+	core_link = sl_core_link_get(core_llr->core_lgrp->core_ldev->num,
+				     core_llr->core_lgrp->num, core_llr->num);
+	if (!core_link)
+		return;
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_RX_PCS, &data64);
+	/* NOTE: these need to match the restart_lock settings on the link */
+	if (sl_core_link_config_is_enable_ald_set(core_link)) {
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(data64, 0);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(data64, 0);
+	} else {
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(data64, 1);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(data64, 1);
+	}
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+	if (sl_core_link_config_is_enable_ald_set(core_link))
+		sl_core_hw_pcs_keep_all_lanes_active_set(core_link, 1);
+	else
+		sl_core_hw_pcs_keep_all_lanes_active_set(core_link, 0);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_LLR_MODE_UPDATE(data64, 2); /* ON */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+static void sl_core_hw_llr_off(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "off (port = %d)", port);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_LLR_MODE_UPDATE(data64, 0); /* OFF */
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+static void sl_core_hw_llr_discard(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "discard (port = %d)", port);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_LINK_DOWN_BEHAVIOR_UPDATE(data64,
+									SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_DISCARD);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num));
+}
+
+#define SL_CORE_PACKET_BYTES_MAX 9000
+static void sl_core_hw_llr_capacity_set(struct sl_core_llr *core_llr)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	u32                port;
+	u64                bytes;
+	u64                calc_data;
+	int                x;
+	u64                total_time;
+	u64                data64;
+	struct sl_llr_data llr_data;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "capacity set (port = %d)", port);
+
+	llr_data.loop.min = core_llr->loop_time[0];
+	llr_data.loop.max = core_llr->loop_time[0];
+	total_time        = core_llr->loop_time[0];
+	for (x = 1; x < SL_CORE_LLR_MAX_LOOP_TIME_COUNT; ++x) {
+		llr_data.loop.min  = min(core_llr->loop_time[x], llr_data.loop.min);
+		llr_data.loop.max  = max(core_llr->loop_time[x], llr_data.loop.max);
+		total_time        += core_llr->loop_time[x];
+	}
+	llr_data.loop.average = DIV_ROUND_UP(total_time, SL_CORE_LLR_MAX_LOOP_TIME_COUNT);
+
+	if (core_llr->core_lgrp->config.options & SL_LGRP_CONFIG_OPT_FABRIC) {
+		calc_data = 0x800; /* reset value */
+	} else {
+		bytes = (llr_data.loop.average * core_llr->settings.bytes_per_ns) +
+			(SL_CORE_LLR_BYTES_PER_FRAME * SL_CORE_LLR_NUM_FRAMES) +
+			SL_CORE_PACKET_BYTES_MAX;
+
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"capacity set (average = %lldns, byte_per_ns = %d, bytes = %lld)",
+			llr_data.loop.average, core_llr->settings.bytes_per_ns, bytes);
+
+		calc_data = DIV_ROUND_UP(bytes, SL_CORE_LLR_BYTE_QUANTA);
+		if (calc_data > core_llr->settings.max_cap_data)
+			calc_data = core_llr->settings.max_cap_data;
+	}
+	sl_core_log_dbg(core_llr, LOG_NAME, "capacity set (data = %lld)", calc_data);
+
+	held_link_1 = sl_core_link_get(core_llr->core_lgrp->core_ldev->num,
+				       core_llr->core_lgrp->num, core_llr->num);
+	if (!held_link_1)
+		return;
+	if (sl_core_link_config_is_enable_pml_recovery_set(held_link_1))
+		core_llr->settings.replay_ct_max = 0xFF;
+	else
+		core_llr->settings.replay_ct_max = 0xFE;
+
+	core_llr->settings.replay_timer_max = (3 * llr_data.loop.average + 500);
+
+	if (core_llr->settings.replay_timer_max < 1000)
+		core_llr->settings.replay_timer_max = 1000;
+
+	if (core_llr->settings.replay_timer_max > 15500)
+		core_llr->settings.replay_timer_max = 15500;
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_CAPACITY(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_CAPACITY_MAX_DATA_UPDATE(data64, calc_data);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_CAPACITY(core_llr->num), data64);
+
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_CAPACITY(core_llr->num));
+
+	{
+	u64 len  = 100;
+	u64 rate = 4;
+
+	llr_data.loop.calculated  = 2 * len * rate / 100;
+	llr_data.loop.calculated += 2 * (SL_CORE_LLR_ASIC_TX_DELAY_MS + SL_CORE_LLR_ASIC_RX_DELAY_MS);
+	}
+
+	sl_core_data_llr_data_set(core_llr, llr_data);
+}
+
+static void sl_core_hw_llr_config(struct sl_core_llr *core_llr)
+{
+	u32 port;
+	u64 data64;
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "config (port = %d)", port);
+
+	sl_core_data_llr_info_map_set(core_llr, SL_CORE_INFO_MAP_LLR_CONFIG);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR, &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SIZE_UPDATE(data64,
+						  core_llr->settings.size);
+	data64 = SS2_PORT_PML_CFG_LLR_ACK_NACK_ERR_CHECK_UPDATE(data64, 1);
+	data64 = SS2_PORT_PML_CFG_LLR_PREAMBLE_SEQ_CHECK_UPDATE(data64, 1);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR, data64);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_FILTER_LOSSLESS_WHEN_OFF_UPDATE(data64,
+									      core_llr->settings.lossless_when_off);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_LINK_DOWN_BEHAVIOR_UPDATE(data64,
+									core_llr->settings.link_down_behavior);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_FILTER_CTL_FRAMES_UPDATE(data64,
+								       core_llr->settings.filter_ctl_frames);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_ENABLE_LOOP_TIMING_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_LLR_MODE_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_MAX_STARVATION_LIMIT_UPDATE(data64, 1550);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SUBPORT(core_llr->num), data64);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_CF_SMAC, &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_CF_SMAC_CTL_FRAME_SMAC_UPDATE(data64,
+								    core_llr->settings.ctl_frame_smac);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_CF_SMAC, data64);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_CF_ETYPE, &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_CF_ETYPE_CTL_FRAME_ETHERTYPE_UPDATE(data64,
+									  core_llr->settings.ctl_frame_ethertype);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_CF_ETYPE, data64);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SM(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SM_RETRY_THRESHOLD_UPDATE(data64,
+								core_llr->settings.retry_threshold);
+	data64 = SS2_PORT_PML_CFG_LLR_SM_ALLOW_RE_INIT_UPDATE(data64,
+							      core_llr->settings.allow_re_init);
+	data64 = SS2_PORT_PML_CFG_LLR_SM_REPLAY_CT_MAX_UPDATE(data64,
+							      core_llr->settings.replay_ct_max);
+	data64 = SS2_PORT_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_UPDATE(data64,
+								 core_llr->settings.replay_timer_max);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SM(core_llr->num), data64);
+
+	sl_core_hw_llr_config_timeouts(core_llr);
+}
+
+//---------------------------- SETUP
+
+void sl_core_hw_llr_setup_cmd(struct sl_core_llr *core_llr,
+			      sl_core_llr_setup_callback_t callback, void *tag, u32 flags)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "setup cmd (core_llr = 0x%p)", core_llr);
+
+	init_completion(&core_llr->stop_complete);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_CONFIG);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETUP);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETUP_TIMEOUT);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_RUNNING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_START_TIMEOUT);
+	sl_core_data_llr_info_map_set(core_llr, SL_CORE_INFO_MAP_LLR_SETTING_UP);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_REPLAY_MAX);
+
+	core_llr->tag             = tag;
+	core_llr->callbacks.setup = callback;
+	core_llr->flags.setup     = flags;
+
+	sl_core_timer_llr_begin(core_llr, SL_CORE_TIMER_LLR_SETUP);
+
+	sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "setup cmd llr_flgs_disable failed [%d]", rtn);
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+	sl_core_hw_llr_config(core_llr);
+
+	queue_work(core_llr->core_lgrp->core_ldev->workqueue, &(core_llr->work[SL_CORE_WORK_LLR_SETUP]));
+}
+
+void sl_core_hw_llr_setup_work(struct work_struct *work)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_SETUP]);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "setup work");
+
+	rtn = sl_core_data_llr_state_get(core_llr, &llr_state);
+	if (rtn) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"setup work llr_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (llr_state != SL_CORE_LLR_STATE_SETTING_UP) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "setup work invalid state (link_state = %u %s)",
+				      llr_state, sl_core_llr_state_str(llr_state));
+		return;
+	}
+
+	sl_core_hw_intr_llr_flgs_clr(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+	sl_core_hw_intr_llr_flgs_enable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+
+	sl_core_hw_intr_llr_flgs_clr(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+	rtn = sl_core_hw_intr_llr_flgs_enable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "setup work llr_flgs_enable failed [%d]", rtn);
+		sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_SETUP);
+		sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_SETUP_CANCELING);
+		sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETTING_UP);
+		sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+		sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+		cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_UNEXP_LOOP_TIME_INTR]));
+		cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_LOOP_TIME_INTR]));
+		sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_CONFIGURED);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_SETUP_INTR_ENABLE);
+		sl_core_hw_llr_setup_callback(core_llr);
+		complete_all(&core_llr->stop_complete);
+		return;
+	}
+
+	sl_core_hw_llr_ordered_sets_start(core_llr);
+	sl_core_hw_llr_loop_time_start(core_llr);
+}
+
+void sl_core_hw_llr_setup_loop_time_intr_work(struct work_struct *work)
+{
+	int                 rtn;
+	u32                 port;
+	int                 x;
+	u64                 data64;
+	u64                 loop_time;
+	struct sl_core_llr *core_llr;
+	int                 tries;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_SETUP_LOOP_TIME_INTR]);
+
+	rtn = sl_core_data_llr_state_get(core_llr, &llr_state);
+	if (rtn) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"loop time intr work - llr_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (llr_state != SL_CORE_LLR_STATE_SETTING_UP) {
+		sl_core_log_err_trace(core_llr, LOG_NAME, "loop time intr work - invalid state (link_state = %u %s)",
+				      llr_state, sl_core_llr_state_str(llr_state));
+		return;
+	}
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "loop time intr work (port = %d)", port);
+
+	x = 0;
+	tries = 0;
+	while (x < SL_CORE_LLR_MAX_LOOP_TIME_COUNT) {
+		if (sl_core_llr_setup_should_stop(core_llr)) {
+			sl_core_log_dbg(core_llr, LOG_NAME, "loop time intr work canceled");
+			return;
+		}
+
+		sl_core_llr_write64(core_llr, SS2_PORT_PML_STS_LLR_LOOP_TIME(core_llr->num), 0);
+		sl_core_llr_flush64(core_llr, SS2_PORT_PML_STS_LLR_LOOP_TIME(core_llr->num));
+		udelay(50);
+		sl_core_llr_read64(core_llr, SS2_PORT_PML_STS_LLR_LOOP_TIME(core_llr->num), &data64);
+		loop_time = SS2_PORT_PML_STS_LLR_LOOP_TIME_LOOP_TIME_GET(data64);
+
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"loop time intr work (time %2d = %lluns)", x, loop_time);
+
+		if (tries++ > 100)
+			break;
+
+		if (loop_time == 0)
+			continue;
+
+		core_llr->loop_time[x] = loop_time;
+
+		++x;
+	}
+
+	sl_core_hw_llr_capacity_set(core_llr);
+
+	sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_SETUP);
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETTING_UP:
+		sl_core_log_dbg(core_llr, LOG_NAME, "setup loop time - setup");
+		core_llr->state = SL_CORE_LLR_STATE_SETUP;
+		clear_bit(SL_CORE_INFO_MAP_LLR_SETTING_UP, (unsigned long *)&(core_llr->info_map));
+		set_bit(SL_CORE_INFO_MAP_LLR_SETUP, (unsigned long *)&(core_llr->info_map));
+		spin_unlock(&core_llr->data_lock);
+
+		sl_core_hw_llr_setup_callback(core_llr);
+
+		return;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME, "setup loop time - invalid state (link_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return;
+	}
+}
+
+void sl_core_hw_llr_setup_unexp_loop_time_intr_work(struct work_struct *work)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_SETUP_UNEXP_LOOP_TIME_INTR]);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "unexpected loop time received");
+
+	rtn = sl_core_data_llr_state_get(core_llr, &llr_state);
+	if (rtn) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"unexpected loop time intr work - llr_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (llr_state != SL_CORE_LLR_STATE_SETTING_UP) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "unexpected loop time intr work - invalid state (link_state = %u %s)",
+				      llr_state, sl_core_llr_state_str(llr_state));
+		return;
+	}
+}
+
+void sl_core_hw_llr_setup_timeout_work(struct work_struct *work)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_SETUP_TIMEOUT]);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "setup timeout work");
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETTING_UP:
+		core_llr->state = SL_CORE_LLR_STATE_SETUP_TIMEOUT;
+		spin_unlock(&core_llr->data_lock);
+		break;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME, "start timeout work - invalid state (llr_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return;
+	}
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETTING_UP);
+	sl_core_data_llr_info_map_set(core_llr, SL_CORE_INFO_MAP_LLR_SETUP_TIMEOUT);
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+
+	sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "setup timeout work llr_flgs_disable failed [%d]", rtn);
+
+	sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_SETUP_TIMEOUT);
+	sl_core_hw_llr_setup_callback(core_llr);
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_CONFIGURED);
+
+	complete_all(&core_llr->stop_complete);
+}
+
+void sl_core_hw_llr_settingup_cancel_cmd(struct sl_core_llr *core_llr)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "settingup cancel cmd");
+
+	sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_SETUP);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_TIMEOUT]));
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_UNEXP_LOOP_TIME);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "settingup cancel cmd llr_flgs_disable failed [%d]", rtn);
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_SETUP_LOOP_TIME);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "settingup cancel cmd llr_flgs_disable failed [%d]", rtn);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_LOOP_TIME_INTR]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_SETUP_UNEXP_LOOP_TIME_INTR]));
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETTING_UP);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETUP);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETUP_TIMEOUT);
+
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_CONFIGURED);
+
+	sl_core_hw_llr_setup_callback(core_llr);
+
+	complete_all(&core_llr->stop_complete);
+}
+
+//---------------------------- START
+
+void sl_core_hw_llr_start_cmd(struct sl_core_llr *core_llr,
+			      sl_core_llr_start_callback_t callback, void *tag, u32 flags)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "start cmd");
+
+	init_completion(&core_llr->stop_complete);
+
+	sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_NONE);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_RUNNING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_START_TIMEOUT);
+	sl_core_data_llr_info_map_set(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+
+	core_llr->tag             = tag;
+	core_llr->callbacks.start = callback;
+	core_llr->flags.start     = flags;
+
+	sl_core_timer_llr_begin(core_llr, SL_CORE_TIMER_LLR_START);
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "start cmd llr_flgs_disable failed [%d]", rtn);
+
+	queue_work(core_llr->core_lgrp->core_ldev->workqueue, &core_llr->work[SL_CORE_WORK_LLR_START]);
+}
+
+void sl_core_hw_llr_start_work(struct work_struct *work)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_START]);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "start work");
+
+	rtn = sl_core_data_llr_state_get(core_llr, &llr_state);
+	if (rtn) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"start work llr_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (llr_state != SL_CORE_LLR_STATE_STARTING) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "start work invalid state (link_state = %u %s)",
+				      llr_state, sl_core_llr_state_str(llr_state));
+		return;
+	}
+
+	sl_core_hw_intr_llr_flgs_clr(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+	rtn = sl_core_hw_intr_llr_flgs_enable(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "start work llr_flgs_enable failed [%d]", rtn);
+		sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_START);
+		sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_START_CANCELING);
+		sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+		sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+		cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR]));
+		sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_SETUP);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_START_INTR_ENABLE);
+		sl_core_hw_llr_start_callback(core_llr);
+		complete_all(&core_llr->stop_complete);
+		return;
+	}
+
+	sl_core_hw_llr_on(core_llr);
+}
+
+void sl_core_hw_llr_start_init_complete_intr_work(struct work_struct *work)
+{
+	int                 rtn;
+	u32                 port;
+	enum sl_core_llr_state llr_state;
+	u64                 data64;
+	struct sl_core_llr *core_llr;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR]);
+
+	rtn = sl_core_data_llr_state_get(core_llr, &llr_state);
+	if (rtn) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"start init complete intr work - llr_state_get failed [%d]", rtn);
+		return;
+	}
+
+	if (llr_state != SL_CORE_LLR_STATE_STARTING) {
+		sl_core_log_err_trace(core_llr, LOG_NAME,
+				      "start init complete intr work - invalid state (link_state = %u %s)",
+				      llr_state, sl_core_llr_state_str(llr_state));
+		return;
+	}
+
+	port = core_llr->core_lgrp->num;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "start init complete intr work (port = %d)", port);
+
+	if (sl_core_llr_start_should_stop(core_llr)) {
+		sl_core_log_dbg(core_llr, LOG_NAME, "start init complete intr work canceled");
+		return;
+	}
+
+	sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_START);
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+
+	sl_core_llr_read64(core_llr, SS2_PORT_PML_CFG_LLR_SM(core_llr->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SM_REPLAY_CT_MAX_UPDATE(data64,
+							      core_llr->settings.replay_ct_max);
+	data64 = SS2_PORT_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_UPDATE(data64,
+								 core_llr->settings.replay_timer_max);
+	sl_core_llr_write64(core_llr, SS2_PORT_PML_CFG_LLR_SM(core_llr->num), data64);
+	sl_core_llr_flush64(core_llr, SS2_PORT_PML_CFG_LLR_SM(core_llr->num));
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_STARTING:
+		sl_core_log_dbg(core_llr, LOG_NAME, "start init complete - running");
+		core_llr->state = SL_CORE_LLR_STATE_RUNNING;
+		set_bit(SL_CORE_INFO_MAP_LLR_RUNNING, (unsigned long *)&(core_llr->info_map));
+		clear_bit(SL_CORE_INFO_MAP_LLR_STARTING, (unsigned long *)&(core_llr->info_map));
+		spin_unlock(&core_llr->data_lock);
+
+		sl_core_hw_llr_start_callback(core_llr);
+		return;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME, "start init complete - invalid state (link_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return;
+	}
+}
+
+void sl_core_hw_llr_start_timeout_work(struct work_struct *work)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = container_of(work, struct sl_core_llr, work[SL_CORE_WORK_LLR_START_TIMEOUT]);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "start timeout work");
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_STARTING:
+		core_llr->state = SL_CORE_LLR_STATE_START_TIMEOUT;
+		spin_unlock(&core_llr->data_lock);
+		break;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME, "start timeout work - invalid state (llr_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return;
+	}
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START]));
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "start timeout work llr_flgs_disable failed [%d]", rtn);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR]));
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+	sl_core_hw_llr_off(core_llr);
+	sl_core_hw_llr_discard(core_llr);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_RUNNING);
+
+	sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_START_TIMEOUT);
+	sl_core_hw_llr_start_callback(core_llr);
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_SETUP);
+
+	complete_all(&core_llr->stop_complete);
+}
+
+void sl_core_hw_llr_starting_cancel_cmd(struct sl_core_llr *core_llr)
+{
+	int rtn;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "starting cancel cmd");
+
+	sl_core_timer_llr_end(core_llr, SL_CORE_TIMER_LLR_START);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START]));
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START_TIMEOUT]));
+
+	rtn = sl_core_hw_intr_llr_flgs_disable(core_llr, SL_CORE_HW_INTR_LLR_START_INIT_COMPLETE);
+	if (rtn != 0)
+		sl_core_log_warn_trace(core_llr, LOG_NAME,
+				       "starting cancel cmd llr_flgs_disable failed [%d]", rtn);
+
+	cancel_work_sync(&(core_llr->work[SL_CORE_WORK_LLR_START_INIT_COMPLETE_INTR]));
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+	sl_core_hw_llr_off(core_llr);
+	sl_core_hw_llr_discard(core_llr);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_RUNNING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_START_TIMEOUT);
+
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_SETUP);
+
+	sl_core_hw_llr_start_callback(core_llr);
+
+	complete_all(&core_llr->stop_complete);
+}
+
+//---------------------------- STOP
+
+void sl_core_hw_llr_stop(struct sl_core_llr *core_llr)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "stop");
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+	sl_core_hw_llr_off(core_llr);
+	sl_core_hw_llr_discard(core_llr);
+}
+
+void sl_core_hw_llr_setup_stop_cmd(struct sl_core_llr *core_llr)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "setup stop cmd");
+
+	sl_core_hw_llr_loop_time_stop(core_llr);
+	sl_core_hw_llr_ordered_sets_stop(core_llr);
+
+	sl_core_data_llr_data_clr(core_llr);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETTING_UP);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETUP);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_SETUP_TIMEOUT);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_RUNNING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_START_TIMEOUT);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_REPLAY_MAX);
+
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_CONFIGURED);
+
+	complete_all(&core_llr->stop_complete);
+}
+
+void sl_core_hw_llr_running_stop_cmd(struct sl_core_llr *core_llr)
+{
+	sl_core_log_dbg(core_llr, LOG_NAME, "running stop cmd");
+
+	sl_core_hw_llr_off(core_llr);
+	sl_core_hw_llr_discard(core_llr);
+
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_STARTING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_RUNNING);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_START_TIMEOUT);
+	sl_core_data_llr_info_map_clr(core_llr, SL_CORE_INFO_MAP_LLR_REPLAY_MAX);
+
+	sl_core_data_llr_state_set(core_llr, SL_CORE_LLR_STATE_SETUP);
+
+	complete_all(&core_llr->stop_complete);
+}
+
+int sl_core_hw_llr_stop_wait(struct sl_core_llr *core_llr)
+{
+	unsigned long timeleft;
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "stop wait");
+
+	timeleft = wait_for_completion_timeout(&core_llr->stop_complete,
+					       msecs_to_jiffies(SL_CORE_LLR_STOP_TIMEOUT));
+	if (timeleft == 0) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"completion_timeout (stop_complete = 0x%p, timeleft = %lu)",
+			&core_llr->stop_complete, timeleft);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_mac.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_mac.c
new file mode 100644
index 000000000000..4605c00a1723
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_mac.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_mac.h"
+#include "sl_core_str.h"
+#include "data/sl_core_data_mac.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_mac.h"
+
+#define LOG_NAME SL_CORE_HW_MAC_LOG_NAME
+
+void sl_core_hw_mac_tx_config(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx - config (port = %d)", port);
+
+	sl_core_data_mac_info_map_set(core_mac, SL_CORE_INFO_MAP_MAC_TX_CONFIG);
+
+	/* need to set mac_if_credits for llr before mac is turned on */
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_LLR_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_LLR_SUBPORT_MAC_IF_CREDITS_UPDATE(data64,
+								    core_mac->settings.llr_if_credits);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_LLR_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_TX_MAC, &data64);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_UPDATE(data64,
+								    core_mac->settings.tx_ifg_adj);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_IFG_MODE_UPDATE(data64,
+							 core_mac->settings.tx_ifg_mode);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_MAC_PAD_IDLE_THRESH_UPDATE(data64,
+								    core_mac->settings.tx_pad_idle_thresh);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_TX_MAC, data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_TX_MAC);
+
+	sl_core_hw_mac_tx_config_subport(core_mac);
+}
+
+void sl_core_hw_mac_tx_start(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx - start (port = %d)", port);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_UPDATE(data64, 1);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num));
+
+	sl_core_data_mac_info_map_set(core_mac, SL_CORE_INFO_MAP_MAC_TX);
+}
+
+void sl_core_hw_mac_tx_stop(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx - stop (port = %d)", port);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_UPDATE(data64, 0);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num));
+
+	sl_core_data_mac_info_map_clr(core_mac, SL_CORE_INFO_MAP_MAC_TX);
+}
+
+u64 sl_core_hw_mac_tx_state_get(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_mac->num), &data64);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx state get (port = %d, state = %llu %s)",
+			port, SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_GET(data64),
+		sl_core_mac_state_str(SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_GET(data64)));
+
+	return SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_GET(data64);
+}
+
+void sl_core_hw_mac_rx_config(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx - config (port = %d)", port);
+
+	sl_core_data_mac_info_map_set(core_mac, SL_CORE_INFO_MAP_MAC_RX_CONFIG);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_RX_MAC, &data64);
+	data64 = SS2_PORT_PML_CFG_RX_MAC_FLIT_PACKING_CNT_UPDATE(data64,
+								 core_mac->settings.rx_flit_packing_cnt);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_RX_MAC, data64);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_MAC_SUBPORT_SHORT_PREAMBLE_UPDATE(data64,
+								       core_mac->settings.rx_short_preamble);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num));
+}
+
+void sl_core_hw_mac_rx_start(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx - start (port = %d)", port);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_UPDATE(data64, 1);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num));
+
+	sl_core_data_mac_info_map_set(core_mac, SL_CORE_INFO_MAP_MAC_RX);
+}
+
+void sl_core_hw_mac_rx_stop(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx - stop (port = %d)", port);
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_UPDATE(data64, 0);
+	sl_core_mac_write64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), data64);
+
+	sl_core_mac_flush64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num));
+
+	sl_core_data_mac_info_map_clr(core_mac, SL_CORE_INFO_MAP_MAC_RX);
+}
+
+u64 sl_core_hw_mac_rx_state_get(struct sl_core_mac *core_mac)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_mac->core_lgrp->num;
+
+	sl_core_mac_read64(core_mac, SS2_PORT_PML_CFG_RX_MAC_SUBPORT(core_mac->num), &data64);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx state get (port = %d, state = %llu %s)",
+			port, SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_GET(data64),
+		sl_core_mac_state_str(SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_GET(data64)));
+
+	return SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_GET(data64);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_pcs.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_pcs.c
new file mode 100644
index 000000000000..a0dc85bcaf9c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_pcs.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include "sl_core_link.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_pcs.h"
+
+#define LOG_NAME SL_CORE_HW_PCS_LOG_NAME
+
+void sl_core_hw_pcs_config(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u64 lanes;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "config (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS, &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_TIMESTAMP_SHIFT_UPDATE(data64, 0);
+
+	if (sl_core_link_config_is_enable_ald_set(core_link))
+		data64 = SS2_PORT_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(data64, 1);
+	else
+		data64 = SS2_PORT_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(data64, 0);
+
+	data64 = SS2_PORT_PML_CFG_PCS_PCS_MODE_UPDATE(data64,
+						      core_link->pcs.settings.pcs_mode);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS, data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_GENERAL, &data64);
+	data64 = SS2_PORT_PML_CFG_GENERAL_CLOCK_PERIOD_PS_UPDATE(data64,
+								 core_link->pcs.settings.clock_period);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_GENERAL, data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_RS_MODE_UPDATE(data64,
+								core_link->pcs.settings.rs_mode);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_RX_SM_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_TX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_SUBPORT_GEARBOX_CREDITS_UPDATE(data64,
+									core_link->pcs.settings.tx_gearbox_credits);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_TX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_TX_PCS, &data64);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_CDC_READY_LEVEL_UPDATE(data64,
+								core_link->pcs.settings.tx_cdc_ready_level);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_EN_PK_BW_LIMITER_UPDATE(data64,
+								 core_link->pcs.settings.tx_en_pk_bw_limiter);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_EN_PK_BW_LIMITER_UPDATE(data64,
+								 core_link->pcs.settings.tx_en_pk_bw_limiter);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_CDC_READY_LEVEL_UPDATE(data64,
+								core_link->pcs.settings.tx_cdc_ready_level);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_TX_PCS, data64);
+
+	if (sl_core_link_config_is_enable_ald_set(core_link))
+		sl_core_hw_pcs_keep_all_lanes_active_set(core_link, 1);
+	else
+		sl_core_hw_pcs_keep_all_lanes_active_set(core_link, 0);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS, &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_CW_GAP_544_UPDATE(data64,
+							   core_link->pcs.settings.cw_gap);
+	if (sl_core_link_config_is_enable_ald_set(core_link)) {
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(data64, 0);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(data64, 0);
+	} else {
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(data64, 1);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(data64, 1);
+	}
+	lanes = SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_GET(data64);
+	lanes &= ~core_link->pcs.settings.rx_active_lanes;
+	data64 = SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(data64, lanes);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+	/* need to set mac_tx_pcs_credits before pcs is enabled */
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_TX_MAC_SUBPORT_PCS_CREDITS_UPDATE(data64,
+								    core_link->pcs.settings.mac_tx_credits);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_TX_MAC_SUBPORT(core_link->num), data64);
+
+	sl_core_hw_pcs_config_swizzles(core_link);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+}
+
+/* Timeout for Health Markers. We'll surely receive health markers in 100 us, if any */
+#define HM_RECV_TIMEOUT_US 100
+
+/* Max number of Physical Lanes available on Tx/Rx */
+#define MAX_PLS_AVAILABLE 0xF
+
+int sl_core_hw_pcs_enable_auto_lane_degrade(struct sl_core_link *core_link)
+{
+	u64           data64;
+	u32           port;
+	unsigned long timeout;
+	int           err;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "enable ald (port = %u)", port);
+
+	err = 0;
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS, &data64);
+	if (SS2_PORT_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(data64)) {
+		timeout = jiffies + usecs_to_jiffies(HM_RECV_TIMEOUT_US);
+		do {
+			sl_core_read64(core_link, SS2_PORT_PML_STS_PCS_LANE_DEGRADE, &data64);
+			if (time_after(jiffies, timeout)) {
+				sl_core_log_err_trace(core_link, LOG_NAME, "enable ald timeout for rx pls available");
+				err = -ETIMEDOUT;
+				goto out;
+			}
+		} while (SS2_PORT_PML_STS_PCS_LANE_DEGRADE_WORD0_RX_PLS_AVAILABLE_GET(data64) != MAX_PLS_AVAILABLE);
+
+		timeout = jiffies + usecs_to_jiffies(HM_RECV_TIMEOUT_US);
+		do {
+			sl_core_read64(core_link, SS2_PORT_PML_STS_PCS_LANE_DEGRADE, &data64);
+			if (time_after(jiffies, timeout)) {
+				sl_core_log_err_trace(core_link, LOG_NAME, "enable ald timeout for lp pls available");
+				err = -ETIMEDOUT;
+				goto out;
+			}
+		} while (SS2_PORT_PML_STS_PCS_LANE_DEGRADE_WORD0_LP_PLS_AVAILABLE_GET(data64) != MAX_PLS_AVAILABLE);
+
+		/*
+		 * enable RX degrade before TX degrade
+		 */
+		sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS, &data64);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(data64, 1);
+		sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+		sl_core_read64(core_link, SS2_PORT_PML_CFG_TX_PCS, &data64);
+		data64 = SS2_PORT_PML_CFG_TX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(data64, 1);
+		sl_core_write64(core_link, SS2_PORT_PML_CFG_TX_PCS, data64);
+
+		sl_core_flush64(core_link, SS2_PORT_PML_CFG_TX_PCS);
+
+		sl_core_log_dbg(core_link, LOG_NAME, "enable ald success");
+	}
+out:
+	if (err) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "enable ald failed");
+
+		sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS, &data64);
+		data64 = SS2_PORT_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(data64, 0);
+		sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS, data64);
+
+		sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS, &data64);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(data64, 1);
+		data64 = SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(data64, 1);
+		sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+		sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+
+		sl_core_hw_pcs_keep_all_lanes_active_set(core_link, 0);
+	}
+
+	return err;
+}
+
+void sl_core_hw_pcs_config_swizzles(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+	u8  lane_num;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "config swizzles (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS, &data64);
+	for (lane_num = 0; lane_num < SL_MAX_LANES; ++lane_num) {
+		switch (core_link->core_lgrp->serdes.dt.lane_info[lane_num].rx_source) {
+		case 3:
+			data64 = SS2_PORT_PML_CFG_RX_PCS_LANE_3_SOURCE_UPDATE(data64, lane_num);
+			break;
+		case 2:
+			data64 = SS2_PORT_PML_CFG_RX_PCS_LANE_2_SOURCE_UPDATE(data64, lane_num);
+			break;
+		case 1:
+			data64 = SS2_PORT_PML_CFG_RX_PCS_LANE_1_SOURCE_UPDATE(data64, lane_num);
+			break;
+		case 0:
+			data64 = SS2_PORT_PML_CFG_RX_PCS_LANE_0_SOURCE_UPDATE(data64, lane_num);
+			break;
+		}
+	}
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_TX_PCS, &data64);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_LANE_3_SOURCE_UPDATE(data64,
+							      core_link->core_lgrp->serdes.dt.lane_info[3].tx_source);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_LANE_2_SOURCE_UPDATE(data64,
+							      core_link->core_lgrp->serdes.dt.lane_info[2].tx_source);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_LANE_1_SOURCE_UPDATE(data64,
+							      core_link->core_lgrp->serdes.dt.lane_info[1].tx_source);
+	data64 = SS2_PORT_PML_CFG_TX_PCS_LANE_0_SOURCE_UPDATE(data64,
+							      core_link->core_lgrp->serdes.dt.lane_info[0].tx_source);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_TX_PCS, data64);
+}
+
+void sl_core_hw_pcs_tx_start(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx start (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_SUBPORT_PCS_ENABLE_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+}
+
+void sl_core_hw_pcs_rx_start(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u64 lanes;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"rx start (port = %u, active_lanes = 0x%X)",
+		port, core_link->pcs.settings.rx_active_lanes);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS, &data64);
+	lanes = SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_GET(data64);
+	lanes |= core_link->pcs.settings.rx_active_lanes;
+	data64 = SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(data64, lanes);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+}
+
+void sl_core_hw_pcs_stop(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u64 lanes;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"stop (port = %u, active_lanes = 0x%X)",
+		port, core_link->pcs.settings.rx_active_lanes);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS, &data64);
+	lanes = SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_GET(data64);
+	lanes &= ~core_link->pcs.settings.rx_active_lanes;
+	data64 = SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(data64, lanes);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS, data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+
+	msleep(20);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_PCS_SUBPORT_PCS_ENABLE_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(data64, 0);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_RX_SM_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_PCS_SUBPORT(core_link->num));
+}
+
+void sl_core_hw_pcs_toggle(struct sl_core_link *core_link)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "toggle (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(data64, 0);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_read64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), &data64);
+	data64 = SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(data64, 1);
+	sl_core_write64(core_link, SS2_PORT_PML_CFG_RX_PCS_SUBPORT(core_link->num), data64);
+
+	sl_core_flush64(core_link, SS2_PORT_PML_CFG_RX_PCS);
+}
+
+bool sl_core_hw_pcs_is_pml_rec_success(struct sl_core_link *core_link)
+{
+	u64  data64;
+	u32  port;
+	bool is_am_locked;
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_RX_PCS_AM_LOCK, &data64);
+	is_am_locked = (SS2_PORT_PML_STS_RX_PCS_AM_LOCK_AM_LOCK_GET(data64) == core_link->pcs.settings.rx_am_lock_lanes);
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_RX_PCS_SUBPORT(core_link->num), &data64);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"is pml rec success (port = %u, aligned = %s, locked = %s, fault = %s, local_fault = %s)",
+			 port,
+			 (SS2_PORT_PML_STS_RX_PCS_SUBPORT_ALIGN_STATUS_GET(data64) == 1) ? "yes" : "no",
+			 is_am_locked ? "yes" : "no",
+			 (SS2_PORT_PML_STS_RX_PCS_SUBPORT_FAULT_GET(data64) == 1) ? "yes" : "no",
+			 (SS2_PORT_PML_STS_RX_PCS_SUBPORT_LOCAL_FAULT_GET(data64) == 1) ? "yes" : "no");
+
+	return ((SS2_PORT_PML_STS_RX_PCS_SUBPORT_ALIGN_STATUS_GET(data64) == 1) &&
+		(is_am_locked)                                                  &&
+		(SS2_PORT_PML_STS_RX_PCS_SUBPORT_FAULT_GET(data64) == 0)        &&
+		(SS2_PORT_PML_STS_RX_PCS_SUBPORT_LOCAL_FAULT_GET(data64) == 0));
+}
+
+bool sl_core_hw_pcs_is_ok(struct sl_core_link *core_link)
+{
+	u64  data64;
+	u32  port;
+	bool pcs_is_ok;
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_CHECK);
+
+	port = core_link->core_lgrp->num;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "is ok (port = %u)", port);
+
+	sl_core_read64(core_link, SS2_PORT_PML_STS_RX_PCS_SUBPORT(core_link->num), &data64);
+
+	pcs_is_ok = ((SS2_PORT_PML_STS_RX_PCS_SUBPORT_ALIGN_STATUS_GET(data64) != 0) &&
+		(SS2_PORT_PML_STS_RX_PCS_SUBPORT_FAULT_GET(data64) == 0)             &&
+		(SS2_PORT_PML_STS_RX_PCS_SUBPORT_LOCAL_FAULT_GET(data64) == 0)       &&
+		(SS2_PORT_PML_STS_RX_PCS_SUBPORT_HI_SER_GET(data64) == 0));
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_PCS_CHECK);
+
+	if (pcs_is_ok)
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_PCS_OK);
+	else
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_PCS_OK);
+
+	return pcs_is_ok;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_pmi.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_pmi.c
new file mode 100644
index 000000000000..65bebcbcbed9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_pmi.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/umh.h>
+
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_pmi.h"
+
+#define LOG_NAME SL_CORE_HW_PMI_LOG_NAME
+
+int pmi_rd(struct sl_core_lgrp *core_lgrp, u8 dev_id, u8 lane, u8 pll, u16 addr, u16 *data)
+{
+	int rtn;
+
+	rtn = sl_core_pmi_rd(core_lgrp, PMI_ADDR32(dev_id, pll, lane, addr), data);
+	if (rtn)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "PMI RD (addr = 0x%04X, data = 0x%04X)", addr, *data);
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->pmi.rd.addr   =  addr;
+	core_lgrp->pmi.rd.data   = *data;
+	core_lgrp->pmi.rd.dev_id =  dev_id;
+	core_lgrp->pmi.rd.lane   =  lane;
+	core_lgrp->pmi.rd.pll    =  pll;
+	core_lgrp->pmi.rd.result =  rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
+
+int pmi_wr(struct sl_core_lgrp *core_lgrp, u8 dev_id, u8 lane, u8 pll, u16 addr, u16 data, u16 mask)
+{
+	int rtn;
+
+	rtn = sl_core_pmi_wr(core_lgrp, PMI_ADDR32(dev_id, pll, lane, addr), data, mask);
+	if (rtn)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "PMI WR (addr = 0x%04X, data = 0x%04X, mask = 0x%04X)",
+				      addr, data, mask);
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->pmi.wr.addr   = addr;
+	core_lgrp->pmi.wr.data   = data;
+	core_lgrp->pmi.wr.mask   = mask;
+	core_lgrp->pmi.wr.dev_id = dev_id;
+	core_lgrp->pmi.wr.lane   = lane;
+	core_lgrp->pmi.wr.pll    = pll;
+	core_lgrp->pmi.wr.result = rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_reset.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_reset.c
new file mode 100644
index 000000000000..dd6b5ab4b8ef
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_reset.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_asic.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_intr.h"
+#include "hw/sl_core_hw_reset.h"
+
+#define LOG_NAME SL_CORE_RESET_LOG_NAME
+
+static void sl_core_hw_reset_on(struct sl_core_lgrp *core_lgrp, u8 link_num)
+{
+	u32 port;
+
+	port = core_lgrp->num;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"on (port = %u, link_num = %u)", port, link_num);
+
+	core_lgrp->core_ldev->ops.write64(core_lgrp->core_ldev->accessors.pci,
+		SS2_PORT_PML_CFG_SUBPORT_RESET(link_num),
+		SS2_PORT_PML_CFG_SUBPORT_RESET_WARM_RST_FROM_CSR_SET(1));
+
+	(void)core_lgrp->core_ldev->ops.read64(core_lgrp->core_ldev->accessors.pci,
+		SS2_PORT_PML_CFG_SUBPORT_RESET(link_num));
+}
+
+static void sl_core_hw_reset_off(struct sl_core_lgrp *core_lgrp, u8 link_num)
+{
+	u32 port;
+
+	port = core_lgrp->num;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"off (port = %u, link_num = %u)", port, link_num);
+
+	core_lgrp->core_ldev->ops.write64(core_lgrp->core_ldev->accessors.pci,
+		SS2_PORT_PML_CFG_SUBPORT_RESET(link_num),
+		SS2_PORT_PML_CFG_SUBPORT_RESET_WARM_RST_FROM_CSR_SET(0));
+
+	(void)core_lgrp->core_ldev->ops.read64(core_lgrp->core_ldev->accessors.pci,
+		SS2_PORT_PML_CFG_SUBPORT_RESET(link_num));
+}
+
+void sl_core_hw_reset_link(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "link");
+
+	sl_core_hw_reset_on(core_link->core_lgrp, core_link->num);
+	sl_core_hw_reset_off(core_link->core_lgrp, core_link->num);
+}
+
+void sl_core_hw_reset_lgrp(struct sl_core_lgrp *core_lgrp)
+{
+	u8 link_num;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "lgrp");
+
+	for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num)
+		sl_core_hw_reset_on(core_lgrp, link_num);
+	for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num)
+		sl_core_hw_reset_off(core_lgrp, link_num);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus.c
new file mode 100644
index 000000000000..fc1d22f8bc51
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/umh.h>
+
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_sbus.h"
+
+#define LOG_NAME SL_CORE_HW_SBUS_LOG_NAME
+
+int sbus_wr(struct sl_core_lgrp *core_lgrp, u8 dev_addr, u8 reg, u32 data)
+{
+	int rtn;
+
+	rtn = sl_core_sbus_wr(core_lgrp, dev_addr, reg, data);
+	if (rtn != 0)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "SBUS WR (dev = 0x%02X, reg = 0x%02X, data = 0x%08X)",
+				      dev_addr, reg, data);
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus.wr.dev_addr = dev_addr;
+	core_lgrp->sbus.wr.data     = data;
+	core_lgrp->sbus.wr.mask     = 0xFFFFFFFF;
+	core_lgrp->sbus.wr.reg      = reg;
+	core_lgrp->sbus.wr.lsb      = 0;
+	core_lgrp->sbus.wr.result   = rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
+
+int sbus_field_wr(struct sl_core_lgrp *core_lgrp, u8 dev_addr, u8 reg, u8 lsb, u32 mask, u32 data)
+{
+	int rtn;
+	u32 data32;
+
+	rtn = sl_core_sbus_rd(core_lgrp, dev_addr, reg, &data32);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "SBUS field RD (dev = 0x%02X, reg = 0x%02X)", dev_addr, reg);
+		goto out;
+	}
+
+	data32 = ((data32 & (~(mask << lsb))) | (data << lsb));
+
+	rtn = sl_core_sbus_wr(core_lgrp, dev_addr, reg, data32);
+	if (rtn != 0)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "SBUS field WR (dev = 0x%02X, reg = 0x%02X, lsb = %u, data = 0x%08X)",
+				      dev_addr, reg, lsb, data32);
+
+out:
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus.wr.dev_addr = dev_addr;
+	core_lgrp->sbus.wr.data     = data;
+	core_lgrp->sbus.wr.mask     = mask;
+	core_lgrp->sbus.wr.reg      = reg;
+	core_lgrp->sbus.wr.lsb      = lsb;
+	core_lgrp->sbus.wr.result   = rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
+
+int sbus_rd(struct sl_core_lgrp *core_lgrp, u8 dev_addr, u8 reg, u32 *data)
+{
+	int rtn;
+
+	rtn = sl_core_sbus_rd(core_lgrp, dev_addr, reg, data);
+	if (rtn != 0)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "SBUS RD (dev = 0x%02X, reg = 0x%02X)", dev_addr, reg);
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus.rd.dev_addr =  dev_addr;
+	core_lgrp->sbus.rd.data     = *data;
+	core_lgrp->sbus.rd.mask     =  0xFFFFFFFF;
+	core_lgrp->sbus.rd.reg      =  reg;
+	core_lgrp->sbus.rd.lsb      =  0;
+	core_lgrp->sbus.rd.result   =  rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
+
+int sbus_field_rd(struct sl_core_lgrp *core_lgrp, u8 dev_addr, u8 reg, u8 lsb, u32 mask, u32 *data)
+{
+	int rtn;
+	u32 data32;
+
+	rtn = sl_core_sbus_rd(core_lgrp, dev_addr, reg, &data32);
+	if (rtn != 0)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "SBUS field RD (dev = 0x%02X, reg = 0x%02X, lsb = %u)",
+				      dev_addr, reg, lsb);
+
+	*data = ((data32 >> lsb) & mask);
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus.rd.dev_addr =  dev_addr;
+	core_lgrp->sbus.rd.data     = *data;
+	core_lgrp->sbus.rd.mask     =  mask;
+	core_lgrp->sbus.rd.reg      =  reg;
+	core_lgrp->sbus.rd.lsb      =  lsb;
+	core_lgrp->sbus.rd.result   =  rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
+
+int sbus_rst(struct sl_core_lgrp *core_lgrp, u8 dev_addr)
+{
+	int rtn;
+
+	rtn = sl_core_sbus_rst(core_lgrp, dev_addr);
+	if (rtn != 0)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "SBUS RST (dev = 0x%02X)", dev_addr);
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus.rst.dev_addr = dev_addr;
+	core_lgrp->sbus.rst.result   = rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus_pmi.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus_pmi.c
new file mode 100644
index 000000000000..c58c95e8ea4b
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus_pmi.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/umh.h>
+
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_sbus_pmi.h"
+
+#define LOG_NAME SL_CORE_HW_SBUS_PMI_LOG_NAME
+
+#define SL_CORE_HW_SBUS_PMI_ADDR_REG      2
+#define SL_CORE_HW_SBUS_PMI_DATA_MASK_REG 3
+#define SL_CORE_HW_SBUS_PMI_DATA_OUT_REG  4
+
+int sbus_pmi_rd(struct sl_core_lgrp *core_lgrp, u8 dev_addr, u8 dev_id, u8 lane,
+		u8 pll, u16 addr, u16 mask, u16 *data)
+{
+	int rtn;
+	u32 addr32;
+	u32 data32;
+
+	addr32 = PMI_ADDR32(dev_id, pll, lane, addr);
+
+	rtn = sl_core_sbus_wr(core_lgrp, dev_addr, SL_CORE_HW_SBUS_PMI_ADDR_REG, addr32); /* PMI_ADDR */
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "SBUS PMI RD (dev = 0x%02X, dev_id = 0x%02X, addr = 0x%04X, mask = 0x%04X)",
+				      dev_addr, dev_id, addr, mask);
+		goto out;
+	}
+
+	rtn = sl_core_sbus_rd(core_lgrp, dev_addr, SL_CORE_HW_SBUS_PMI_DATA_OUT_REG, &data32); /* PMI DATA OUT */
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "SBUS PMI RD (dev = 0x%02X, dev_id = 0x%02X, addr = 0x%04X, mask = 0x%04X)",
+				      dev_addr, dev_id, addr, mask);
+		goto out;
+	}
+
+	if (data32 & BIT(17)) { /* PMI ERROR */
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "SBUS PMI RD (dev = 0x%02X, dev_id = 0x%02X, addr = 0x%04X, mask = 0x%04X)",
+				      dev_addr, dev_id, addr, mask);
+		rtn = -EIO;
+		goto out;
+	}
+
+	*data = (u16)data32 & mask;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "SBUS PMI RD (dev = 0x%02X, addr = 0x%08X, data = 0x%08X)",
+			dev_addr, addr32, *data);
+
+out:
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus_pmi.rd.dev_addr =  dev_addr;
+	core_lgrp->sbus_pmi.rd.addr     =  addr;
+	core_lgrp->sbus_pmi.rd.data     = rtn ? 0 : *data;
+	core_lgrp->sbus_pmi.rd.mask     =  mask;
+	core_lgrp->sbus_pmi.rd.dev_id   =  dev_id;
+	core_lgrp->sbus_pmi.rd.lane     =  lane;
+	core_lgrp->sbus_pmi.rd.pll      =  pll;
+	core_lgrp->sbus_pmi.rd.result   =  rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
+
+int sbus_pmi_wr(struct sl_core_lgrp *core_lgrp, u8 dev_addr, u8 dev_id, u8 lane,
+		u8 pll, u16 addr, u16 data, u16 mask)
+{
+	int rtn;
+	u32 addr32;
+	u32 data32;
+
+	addr32 = PMI_ADDR32(dev_id, pll, lane, addr);
+	data32 = (~mask & 0xFFFF) | (data << 16);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "SBUS PMI WR (dev = 0x%02X, addr = 0x%08X, data = 0x%08X)",
+			dev_addr, addr32, data32);
+
+	rtn = sl_core_sbus_wr(core_lgrp, dev_addr, SL_CORE_HW_SBUS_PMI_ADDR_REG, addr32); /* PMI_ADDR */
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "SBUS PMI WR (dev = 0x%02X, dev_id = 0x%02X, addr = 0x%04X, data = 0x%04X, mask = 0x%04X)",
+				      dev_addr, dev_id, addr, data, mask);
+		goto out;
+	}
+
+	rtn = sl_core_sbus_wr(core_lgrp, dev_addr, SL_CORE_HW_SBUS_PMI_DATA_MASK_REG, data32); /* PMI MASK+DATA */
+	if (rtn != 0)
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "SBUS PMI WR (dev = 0x%02X, dev_id = 0x%02X, addr = 0x%04X, data = 0x%04X, mask = 0x%04X)",
+				      dev_addr, dev_id, addr, data, mask);
+
+out:
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->sbus_pmi.wr.dev_addr = dev_addr;
+	core_lgrp->sbus_pmi.wr.addr     = addr;
+	core_lgrp->sbus_pmi.wr.data     = data;
+	core_lgrp->sbus_pmi.wr.mask     = mask;
+	core_lgrp->sbus_pmi.wr.dev_id   = dev_id;
+	core_lgrp->sbus_pmi.wr.lane     = lane;
+	core_lgrp->sbus_pmi.wr.pll      = pll;
+	core_lgrp->sbus_pmi.wr.result   = rtn;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes.c
new file mode 100644
index 000000000000..ca2666c393cd
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/umh.h>
+
+#include "sl_asic.h"
+#include "sl_platform.h"
+#include "sl_core_link.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_ldev.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_serdes.h"
+#include "hw/sl_core_hw_sbus.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_uc_ram.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+int sl_core_hw_serdes_init(struct sl_core_lgrp *core_lgrp)
+{
+	int rtn;
+	u8  lane_num;
+	u8  which;
+	u32 addr;
+	u32 data;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "init");
+
+	for (lane_num = 0; lane_num < SL_ASIC_MAX_LANES; ++lane_num) {
+		which = (lane_num + ((core_lgrp->num & BIT(0)) * 4));
+		addr  = 0x08FFD190 | which;
+		data  = 0x00000000 | (which << 24) | (which << 16);
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"init (which = %d, reg2 = 0x%08X, reg3 = 0x%08X)", which, addr, data);
+		SL_CORE_HW_SBUS_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 0x2, addr);
+		SL_CORE_HW_SBUS_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 0x3, data);
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_swizzles(struct sl_core_lgrp *core_lgrp)
+{
+	int rtn;
+	u8  lane_num;
+	u8  which;
+	u16 data;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "swizzles");
+
+	if (is_flag_set(core_lgrp->config.options, SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "swizzles setting for loopback");
+		core_lgrp->serdes.dt.lane_info[0].tx_source = 0;
+		core_lgrp->serdes.dt.lane_info[1].tx_source = 1;
+		core_lgrp->serdes.dt.lane_info[2].tx_source = 2;
+		core_lgrp->serdes.dt.lane_info[3].tx_source = 3;
+		core_lgrp->serdes.dt.lane_info[0].rx_source = 0;
+		core_lgrp->serdes.dt.lane_info[1].rx_source = 1;
+		core_lgrp->serdes.dt.lane_info[2].rx_source = 2;
+		core_lgrp->serdes.dt.lane_info[3].rx_source = 3;
+	} else {
+		rtn = core_lgrp->core_ldev->ops.dt_info_get(core_lgrp->core_ldev->accessors.dt,
+			core_lgrp->core_ldev->num, core_lgrp->num, &(core_lgrp->serdes.dt));
+		if (rtn)
+			sl_core_log_warn_trace(core_lgrp, LOG_NAME, "swizzles dt_info_get failed [%d]", rtn);
+	}
+
+	for (lane_num = 0; lane_num < SL_ASIC_MAX_LANES; ++lane_num) {
+		which = (lane_num + ((core_lgrp->num & BIT(0)) * 4));
+		data  = 0x0000 |
+			((core_lgrp->serdes.dt.lane_info[lane_num].tx_source + ((core_lgrp->num & BIT(0)) * 4)) << 8) |
+			(core_lgrp->serdes.dt.lane_info[lane_num].rx_source + ((core_lgrp->num & BIT(0)) * 4));
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"swizzles (which = %d, addr = 0x%04X, data = 0x%04X)",
+			which, core_lgrp->core_ldev->serdes.addrs[SERDES_DIG_COM_B_LANE_ADDR_0] + which, data);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  core_lgrp->core_ldev->serdes.addrs[SERDES_DIG_COM_B_LANE_ADDR_0] + which, data, 0x1F1F);
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+#define FW_INFO_SIGNATURE                       0x464E49
+#define FW_INFO_NUM_MICROS_OFFSET               0x60
+#define FW_INFO_NUM_LANES_OFFSET                0xC
+#define FW_INFO_LANE_STATIC_VAR_RAM_BASE_OFFSET 0x74
+#define FW_INFO_LANE_STATIC_VAR_RAM_SIZE_OFFSET 0x78
+#define FW_INFO_LANE_VAR_RAM_BASE_OFFSET        0x74
+#define FW_INFO_LANE_VAR_RAM_SIZE_OFFSET        0x78
+#define FW_INFO_GRP_RAM_SIZE_OFFSET             0x68
+#define FW_INFO_LANE_MEM_PTR_OFFSET             0x1C
+#define FW_INFO_LANE_MEM_SIZE_OFFSET            0x08
+#define FW_INFO_SIZE                            128
+
+int sl_core_hw_serdes_hw_info_get(struct sl_core_lgrp *core_lgrp)
+{
+	int                       rtn;
+	u8                        rd_buff[FW_INFO_SIZE];
+	u16                       data16;
+	u32                       data32;
+	struct sl_serdes_hw_info *hw_info;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "hw info get");
+
+	hw_info = &(core_lgrp->core_ldev->serdes.hw_info[LGRP_TO_SERDES(core_lgrp->num)]);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_MICRO_B_COM_RMI_MICRO_SDK_STATUS0], &data16); /* micro status */
+	hw_info->num_cores = ((data16 >> 12) & 0x000F);
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_DIG_COM_REVID1], &data16); /* multiplicity */
+	hw_info->num_lanes = ((data16 >> 12) & 0x000F);
+	SL_CORE_HW_SBUS_FIELD_RD(core_lgrp, core_lgrp->serdes.dt.dev_addr, 0xFE, 24, 0xF, &data32);
+	hw_info->num_plls = (data32 & 0xFF);
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_DIG_COM_REVID0], &data16); /* hardware rev 1 */
+	hw_info->rev_id_1 = (data16 & 0x003F);
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_DIG_COM_REVID2], &data16); /* hardware rev 2 */
+	hw_info->rev_id_2 = (data16 & 0x000F);
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_HW_VERSION], &data16); /* hardware version */
+	hw_info->version = (data16 & 0x00FF);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "rev_id_1   = 0x%02X", hw_info->rev_id_1);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "rev_id_2   = 0x%02X", hw_info->rev_id_2);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "version    = 0x%02X", hw_info->version);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "num_cores  = %u", hw_info->num_cores);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "num_lanes  = %u", hw_info->num_lanes);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "num_plls   = %u", hw_info->num_plls);
+
+	SL_CORE_HW_UC_RAM_RD_BLK(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0x100, sizeof(rd_buff), rd_buff);
+
+	hw_info->num_micros = (*(u32 *)&rd_buff[FW_INFO_NUM_MICROS_OFFSET] & 0xF);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "num_micros = %d", hw_info->num_micros);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_fw_info_get(struct sl_core_lgrp *core_lgrp)
+{
+	int                       rtn;
+	u8                        rd_buff[FW_INFO_SIZE];
+	struct sl_serdes_fw_info *fw_info;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "fw info get");
+
+	fw_info = &(core_lgrp->core_ldev->serdes.fw_info[LGRP_TO_SERDES(core_lgrp->num)]);
+
+	SL_CORE_HW_UC_RAM_RD_BLK(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0x100, sizeof(rd_buff), rd_buff);
+
+	fw_info->signature = (*(u32 *)rd_buff & 0xFFFFFF);
+	fw_info->version   = ((*(u32 *)rd_buff >> 24) & 0xFF);
+
+	fw_info->lane_static_var_ram_base = *(u32 *)&rd_buff[FW_INFO_LANE_STATIC_VAR_RAM_BASE_OFFSET];
+	fw_info->lane_static_var_ram_size = *(u32 *)&rd_buff[FW_INFO_LANE_STATIC_VAR_RAM_SIZE_OFFSET];
+	fw_info->lane_var_ram_base        = *(u32 *)&rd_buff[FW_INFO_LANE_MEM_PTR_OFFSET];
+	fw_info->lane_var_ram_size        = (*(u32 *)&rd_buff[FW_INFO_LANE_MEM_SIZE_OFFSET] >> 16) & 0xFFFF;
+	fw_info->grp_ram_size             = *(u32 *)&rd_buff[FW_INFO_GRP_RAM_SIZE_OFFSET] & 0xFFFF;
+	fw_info->lane_count               = *(u32 *)&rd_buff[FW_INFO_NUM_LANES_OFFSET] & 0xFF;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "signature           = 0x%08X", fw_info->signature);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "version             = 0x%02X", fw_info->version);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "static var ram base = 0x%08X", fw_info->lane_static_var_ram_base);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "static var ram size = 0x%08X", fw_info->lane_static_var_ram_size);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "var ram base        = 0x%08X", fw_info->lane_var_ram_base);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "var ram size        = 0x%04X", fw_info->lane_var_ram_size);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "grp ram size        = 0x%04X", fw_info->grp_ram_size);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "lane count          = %u",     fw_info->lane_count);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+void sl_core_hw_serdes_state_set(struct sl_core_link *core_link, u8 state)
+{
+	spin_lock(&core_link->serdes.data_lock);
+	core_link->serdes.serdes_state = state;
+	spin_unlock(&core_link->serdes.data_lock);
+}
+
+u8 sl_core_hw_serdes_state_get(struct sl_core_link *core_link)
+{
+	u8 serdes_state;
+
+	spin_lock(&core_link->serdes.data_lock);
+	serdes_state = core_link->serdes.serdes_state;
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return serdes_state;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_core.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_core.c
new file mode 100644
index 000000000000..3ded5414651f
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_core.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include "sl_module.h"
+#include "sl_asic.h"
+#include "sl_platform.h"
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "data/sl_core_data_lgrp.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_serdes_fw.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "hw/sl_core_hw_serdes_core.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+#define SL_HW_SERDES_WAIT_UC_ACTIVE_TRIES 10
+static int sl_core_hw_serdes_core_proc_reset(struct sl_core_lgrp *core_lgrp)
+{
+	int  rtn;
+	u16  data16;
+	u8   x;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "proc reset");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_D_COM_RMI_MICRO_CONTROL0], 0x0000, 0x0001); /* set micro reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_D_COM_RMI_MICRO_CONTROL0], 0x0001, 0x0001); /* clear micro reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0000, 0x0001); /* disable CRC checking */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_C_COM_RAM_CONTROL2], (SL_HW_SERDES_FW_STACK_SIZE << 2), 0x7FFC); /* micro_core_stack_size */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_C_COM_RAM_CONTROL2], 0x8000, 0x8000); /* stack enable */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_COMMON_CLOCK], 0x0040, 0x0040); /* select common clock */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MDIO_MMDSEL_AER_COM_MDIO_BRCST_PORT_ADDR], 0x001F, 0x001F); /* broadcast port addr */
+
+	for (x = 0; x < SL_SERDES_NUM_LANES; ++x)
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, x, 0,
+				  addrs[SERDES_RXTXCOM_CKRST_CTRL_RXTXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL], 0x0000, 0x0001); /* disable lane */
+
+	usleep_range(10, 20);
+
+	for (x = 0; x < SL_SERDES_NUM_PLLS; ++x)
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, x,
+				  addrs[SERDES_CORE_PLL_COM_TOP_USER_CONTROL], 0x0000, 0x2000); /* set PLL reset */
+
+	usleep_range(10, 20);
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_DIG_COM_RESET_CONTROL_PMD], 0x0000, 0x0001); /* set core reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_DIG_COM_RESET_CONTROL_PMD], 0x0001, 0x0001); /* clear core reset */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_CORE_PLL_COM_RESET_CONTROL_PLL_DP], 0x0002, 0x0002); /* clear pll0 reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 1,
+			  addrs[SERDES_CORE_PLL_COM_RESET_CONTROL_PLL_DP], 0x0002, 0x0002); /* clear pll1 reset */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_D_COM_RMI_MICRO_CONTROL0], 0x0000, 0x0001); /* set micro reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_D_COM_RMI_MICRO_CONTROL0], 0x0001, 0x0001); /* clear micro reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0000, 0x0001); /* disable CRC checking */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_C_COM_RAM_CONTROL2], (SL_HW_SERDES_FW_STACK_SIZE << 2), 0x7FFC); /* micro_core_stack_size */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_C_COM_RAM_CONTROL2], 0x8000, 0x8000); /* stack enable */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_D_COM_RMI_MICRO_CONTROL0], 0x0001, 0x0001); /* clear micro reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_A_COM_CLOCK_CONTROL0], 0x0001, 0x0001); /* enable micro subsystem clock */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_A_COM_RESET_CONTROL0], 0x0001, 0x0001); /* clear micro subsystem reset */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_C_COM_RAM_CONTROL0], 0x0001, 0x0001); /* enable micro access to code RAM */
+
+	for (x = 0; x < SL_SERDES_NUM_MICROS; ++x) {
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, x,
+				  addrs[SERDES_MICRO_E_COM_MICRO_CORE_CLOCK_CONTROL0], 0x0001, 0x0001); /* enable micro clock */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, x,
+				  addrs[SERDES_MICRO_E_COM_MICRO_CORE_RESET_CONTROL0], 0x0001, 0x0001); /* clear micro reset */
+	}
+
+	for (x = 0; x < SL_HW_SERDES_WAIT_UC_ACTIVE_TRIES; ++x) {
+		usleep_range(1000, 2000);
+		SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_DIG_COM_RESET_CONTROL_PMD], &data16); /* all micros init */
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "micro init D101 = 0x%X", data16);
+		if ((data16 & 0x0002) == 0)
+			continue;
+		SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_MICRO_B_COM_RMI_MICRO_SDK_STATUS0], &data16); /* micro status */
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "micro status D21A = 0x%X", data16);
+		if ((data16 & 0x000F) != SL_SERDES_ACTIVE_MICROS)
+			continue;
+		break;
+	}
+	if (x >= SL_HW_SERDES_WAIT_UC_ACTIVE_TRIES) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "uc active failed");
+		rtn = -EIO;
+		goto out;
+	}
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "uc active");
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, x,
+			  addrs[SERDES_DIG_COM_TOP_USER_CONTROL_0], 0x04E2, 0xFFF); /* set heartbeat_count */
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+static int sl_core_hw_serdes_core_clock_init(struct sl_core_lgrp *core_lgrp)
+{
+	int  rtn;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "clock init");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_2], 0x0000, 0x0060); /* pll_rtl_div_en */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_4], 0x0000, 0x0400); /* pll_i_en_ext_cml_refclk_in */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_4], 0x0000, 0x0200); /* pll_i_en_ext_cml_refclk_out */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_4], 0x0000, 0x0100); /* pll_i_en_ext_cmos_refclk_in */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_CORE_PLL_COM_TOP_USER_CONTROL], 0x0000, 0x2000); /* set PLL reset */
+
+	/* defaults set */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_10], 0x003B, 0x03FF); /* integer portion */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_11], 0x0000, 0xFFFF); /* fractional portion low 16 bits */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_12], 0x0000, 0x0003); /* fractional portion top 2 bits */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_1], 0x0000, 0x0080); /* pll_refclk_freq2x_en */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_1], 0x0000, 0x0020); /* pll_refdiv2 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_1], 0x0000, 0x0040); /* pll_refdiv4 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_POWER_DOWN], 0x0000, 0x0002); /* pll_div4_2_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x1000, 0x3000); /* pll_pll_frac_mode */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x0800, 0x0800); /* pll_resetb_mmd */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_0], 0x0000, 0x0008); /* pll_en_lb_res */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_0], 0x0000, 0x0010); /* pll_en_lb_ind */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x0000, 0x0400); /* pll_lb_sel_pll0 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_1], 0x0040, 0x0070); /* pll_rz_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_1], 0x3800, 0x7800); /* pll_cp_calib_adj */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x0000, 0x03C0); /* pll_cap_l_pll0 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_3], 0x0000, 0x000F); /* pll_cap_r_pll0 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_3], 0x0002, 0x0007); /* pll_ictrl_pll0 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x0000, 0x0010); /* pll_fracn_enable */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_SELECT], 0x0030, 0x003C); /* pll_i_en_ovrrad */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_1], 0x0000, 0x0180); /* pll_cp_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_0], 0x1800, 0x1800); /* pll_fp3_r_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_1], 0x0000, 0x000F); /* pll_fp3_c_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x0000, 0x0020); /* pll_en_offset_fbck */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x0000, 0x0010); /* pll_en_offset_refclk */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x0000, 0x000C); /* pll_fracn_offset_ctrl */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x0000, 0x0003); /* pll_pfd_pulse_adj */
+
+	/* config set */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_POWER_DOWN], 0x0000, 0x0004); /* power up PLL */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_CONTROL], 0x0010, 0x0010); /* power up high band */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_CONTROL], 0x0008, 0x0008); /* power up low band */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_0], 0x0008, 0x0008); /* pll_en_lb_res */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_0], 0x0010, 0x0010); /* pll_i_en_kvh */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_CONTROL], 0x0000, 0x0008); /* power down low band */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_1], 0x3000, 0x7800); /* pll_cp_calib_adj */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_2], 0x00C0, 0x03C0); /* pll_cap_l_pll0 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_PLL_CONTROL_3], 0x0003, 0x000F); /* pll_cap_r_pll0 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_3], 0x0002, 0x0007); /* pll_i_clkchnl */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_COM_B_PLL_CTRL_1], 0x0010, 0x0070); /* pll_rz_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_FW_API_DATA0], 0x00C1, 0xFFFF); /* API data 0 */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_CORE_PLL_COM_TOP_USER_CONTROL], 0x2000, 0x2000); /* clear PLL reset */
+
+	usleep_range(5000, 10000);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+static int sl_core_hw_serdes_core_lgrp_reset(struct sl_core_lgrp *core_lgrp)
+{
+	int  rtn;
+	u8   lane_num;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "reset");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	for (lane_num = 0; lane_num < SL_SERDES_NUM_LANES; ++lane_num) {
+		/* TX */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, lane_num, 0,
+				  addrs[SERDES_TXCOM_CKRST_CTRL_TXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+			0x0000, 0x0001); /* tx_ln_dp_s_rstb */
+		usleep_range(10, 20);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, lane_num, 0,
+				  addrs[SERDES_TXCOM_CKRST_CTRL_TXCOM_LN_S_RSTB_CONTROL], 0x0000, 0x0001); /* tx_ln_s_rstb */
+		usleep_range(10, 20);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, lane_num, 0,
+				  addrs[SERDES_TXCOM_CKRST_CTRL_TXCOM_LN_S_RSTB_CONTROL], 0x0001, 0x0001); /* tx_ln_s_rstb */
+		/* RX */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, lane_num, 0,
+				  addrs[SERDES_RXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+			0x0000, 0x0001); /* rx_ln_dp_s_rstb */
+		usleep_range(10, 20);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, lane_num, 0,
+				  addrs[SERDES_RXCOM_CKRST_CTRL_RXCOM_LN_S_RSTB_CONTROL], 0x0000, 0x0001); /* rx_ln_s_rstb */
+		usleep_range(10, 20);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, lane_num, 0,
+				  addrs[SERDES_RXCOM_CKRST_CTRL_RXCOM_LN_S_RSTB_CONTROL], 0x0001, 0x0001); /* rx_ln_s_rstb */
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_core_init(struct sl_core_lgrp *core_lgrp)
+{
+	int rtn;
+	u64 trace_map;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "core init");
+
+	trace_map = sl_serdes_core_io_trace_lgrp_map_get();
+	sl_core_data_lgrp_io_trace_set(core_lgrp, test_bit(core_lgrp->num, (unsigned long *)&trace_map));
+
+	rtn = sl_core_hw_serdes_core_proc_reset(core_lgrp);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "core_proc_reset failed [%d]", rtn);
+		goto out;
+	}
+	rtn = sl_core_hw_serdes_core_clock_init(core_lgrp);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "core_clock_init failed [%d]", rtn);
+		goto out;
+	}
+	rtn = sl_core_hw_serdes_core_lgrp_reset(core_lgrp);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "core_lgrp_reset failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = 0;
+out:
+	sl_core_data_lgrp_io_trace_set(core_lgrp, false);
+	return rtn;
+}
+
+static int sl_core_hw_serdes_core_pll_set(struct sl_core_lgrp *core_lgrp, u16 clocking, u16 tx_pll_bw)
+{
+	int  rtn;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "pll set");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x0000, 0x0800); /* set PLL reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x0800, 0x0800); /* clear PLL reset */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_12], 0x0000, 0x0008); /* update PLL ratio */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x1000, 0x3000); /* MMD 8/9 mode */
+
+	if (clocking == SL_CORE_HW_SERDES_CLOCKING_82P5) {
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_10], 0x0052, 0x03FF); /* integer portion */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_11], 0x0000, 0xFFFF); /* fractional portion low 16 bits */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_12], 0x0002, 0x0003); /* fractional portion top 2 bits */
+	} else {
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_10], 0x0055, 0x03FF); /* integer portion */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_11], 0x0000, 0xFFFF); /* fractional portion low 16 bits */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_12], 0x0000, 0x0003); /* fractional portion top 2 bits */
+	}
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_12], 0x0008, 0x0008); /* update PLL ratio */
+	usleep_range(10, 20);
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_AMS_PLL_COM_PLL_CONTROL_12], 0x0000, 0x0008); /* update PLL ratio */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_SELECT], tx_pll_bw, 0x003C); /* pll_i_en_ovrrad */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x0000, 0x0800); /* set PLL reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_RESET2], 0x0800, 0x0800); /* clear PLL reset */
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+static int sl_core_hw_serdes_core_pll_check(struct sl_core_lgrp *core_lgrp)
+{
+	int  rtn;
+	u16  data16;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "pll check");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_PLL_CAL_COM_STS_0], &data16);
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "0x%X = 0x%X", addrs[SERDES_PLL_CAL_COM_STS_0], data16);
+	if ((data16 & 0x0200) == 0) { /* PLL lock status */
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "pll lock failed");
+		rtn = -EIO;
+		goto out;
+	}
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "pll locked");
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_core_pll(struct sl_core_lgrp *core_lgrp, u16 clocking, u16 tx_pll_bw)
+{
+	int  rtn;
+	u16 *addrs;
+	u64  trace_map;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	if (core_lgrp->serdes.clocking == clocking) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "pll clocking already set");
+		return 0;
+	}
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "pll");
+
+	trace_map = sl_serdes_core_io_trace_lgrp_map_get();
+	sl_core_data_lgrp_io_trace_set(core_lgrp, test_bit(core_lgrp->num, (unsigned long *)&trace_map));
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_CORE_PLL_COM_TOP_USER_CONTROL], 0x0000, 0x2000); /* set PLL reset */
+
+	rtn = sl_core_hw_serdes_core_pll_set(core_lgrp, clocking, tx_pll_bw);
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "core_pll_set failed [%d]", rtn);
+		goto out;
+	}
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+			  addrs[SERDES_CORE_PLL_COM_TOP_USER_CONTROL], 0x2000, 0x2000); /* clear PLL reset */
+
+	usleep_range(5000, 10000);
+
+	rtn = sl_core_hw_serdes_core_pll_check(core_lgrp);
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "core_pll_check failed [%d]", rtn);
+		goto out;
+	}
+
+	core_lgrp->serdes.clocking = clocking;
+
+	rtn = 0;
+out:
+	sl_core_data_lgrp_io_trace_set(core_lgrp, false);
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_fw.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_fw.c
new file mode 100644
index 000000000000..d051c40c9a66
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_fw.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/umh.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/unaligned.h>
+
+#include "sl_asic.h"
+#include "sl_platform.h"
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_sbus.h"
+#include "hw/sl_core_hw_sbus_pmi.h"
+#include "hw/sl_core_hw_serdes_fw.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+#define SL_HW_SERDES_INIT_CHECK_TRIES 50
+int sl_core_hw_serdes_fw_setup(struct sl_core_lgrp *core_lgrp)
+{
+	int  rtn;
+	int  x;
+	u16  data16;
+	u16 *addrs;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "fw setup");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_SBUS_FIELD_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 48, 0x0, 1, 0x1); /* POR_H_RSTB_SBUS */
+	SL_CORE_HW_SBUS_FIELD_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 48, 0x1, 2, 0x1); /* POR_H_RSTB_GATE */
+	usleep_range(1000, 2000);
+	SL_CORE_HW_SBUS_FIELD_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 48, 0x1, 1, 0x1); /* POR_H_RSTB_SBUS */
+
+	for (x = 0; x < SL_SERDES_NUM_MICROS; ++x) {
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, x,
+				  addrs[SERDES_MICRO_E_COM_MICRO_CORE_CLOCK_CONTROL0], 0x0000, 0x0001); /* disable micro clock */
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, x,
+				  addrs[SERDES_MICRO_E_COM_MICRO_CORE_RESET_CONTROL0], 0x0000, 0x0001); /* set micro reset */
+	}
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_C_COM_RAM_CONTROL0], 0x0001, 0x0001); /* enable writes to code RAM */
+
+	SL_CORE_HW_SBUS_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 0, 0x80000000); /* enable access to PRAM */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_A_COM_CLOCK_CONTROL0], 0x0001, 0x0001); /* enable micro master clocks */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_A_COM_RESET_CONTROL0], 0x0000, 0x0001); /* set micro master reset */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_A_COM_RESET_CONTROL0], 0x0001, 0x0001); /* remove micro master reset */
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_C_COM_RAM_CONTROL0], 0x0000, 0x0002); /* disable micro access to code RAM */
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0100, 0x0300); /* init code RAM */
+	for (x = 0; x < SL_HW_SERDES_INIT_CHECK_TRIES; ++x) {
+		usleep_range(1000, 2000);
+		SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+				  addrs[SERDES_MICRO_A_COM_AHB_STATUS0], &data16); /* check init done */
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "code RAM init 0x%X = 0x%X",
+				addrs[SERDES_MICRO_A_COM_AHB_STATUS0], data16);
+		if ((data16 & 0x0001) != 0)
+			break;
+	}
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0000, 0x0300); /* disable init */
+	if (x >= SL_HW_SERDES_INIT_CHECK_TRIES) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "fw setup RAM init timeout");
+		rtn = -EIO;
+		goto out;
+	}
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0200, 0x0300); /* init data RAM */
+	for (x = 0; x < SL_HW_SERDES_INIT_CHECK_TRIES; ++x) {
+		usleep_range(1000, 2000);
+		SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0xFF, 0,
+				  addrs[SERDES_MICRO_A_COM_AHB_STATUS0], &data16); /* check init done */
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "code RAM init 0x%X = 0x%X",
+				addrs[SERDES_MICRO_A_COM_AHB_STATUS0], data16);
+		if ((data16 & 0x0001) != 0)
+			break;
+	}
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0000, 0x0300); /* disable init */
+	if (x >= SL_HW_SERDES_INIT_CHECK_TRIES) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "code RAM init timeout");
+		rtn = -EIO;
+		goto out;
+	}
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0004, 0x0004); /* set init CRC */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0000, 0x0004); /* remove init CRC */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0002, 0x0002); /* set init checksum */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0000, 0x0002); /* remove init checksum */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0001, 0x0001); /* enable CRC engine */
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_PRAMIF_AHB_WRADDR_LSW], 0x0000, 0xFFFC); /* start address */
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_PRAMIF_AHB_WRADDR_MSW], 0x0000, 0xFFFF); /* start address */
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_A_COM_RESET_CONTROL0], 0x8000, 0x8000); /* remove reset from PRAM */
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_PRAMIF_CONTROL0], 0x0001, 0x0001); /* enable PRAM interface */
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_fw_write(struct sl_core_lgrp *core_lgrp)
+{
+	int                    rtn;
+	size_t                 x;
+	u32                    data32;
+	const struct firmware *fw;
+
+	fw = core_lgrp->core_ldev->serdes.fw;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	if (!fw || !fw->data || !fw->size ||
+	    !IS_ALIGNED(fw->size, sizeof(data32)))
+		return -EINVAL;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "fw write (size = %lu bytes)", fw->size);
+
+	for (x = 0; x < fw->size; x += 4) {
+		data32 = get_unaligned_le32(fw->data + x);
+		SL_CORE_HW_SBUS_WR(core_lgrp, 0xFA, 10, data32);
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_fw_finish(struct sl_core_lgrp *core_lgrp)
+{
+	int  rtn;
+	u16  data16;
+	u16 *addrs;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "fw finish");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_C_COM_RAM_CONTROL0], 0x0002, 0x0002); /* disable writes to code RAM */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCCONTROL0], 0x0000, 0x0001); /* disable CRC engine */
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id, 0, 0,
+			       addrs[SERDES_MICRO_A_COM_PRAMIF_CONTROL0], 0x0000, 0x0001); /* disable PRAM interface */
+
+	SL_CORE_HW_SBUS_WR(core_lgrp, core_lgrp->serdes.dt.dev_addr, 0, 0x00000000); /* disable access to PRAM */
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, 0, 0,
+			  addrs[SERDES_MICRO_B_COM_RMI_RAM_CR_CRCSTATUS0], &data16); /* read CRC */
+	if (data16 != SL_HW_SERDES_FW_IMAGE_CRC) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "fw finish crc check failure (crc = 0x%04X, expected = 0x%04X)",
+				      data16, SL_HW_SERDES_FW_IMAGE_CRC);
+		rtn = -EIO;
+		goto out;
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane.c
new file mode 100644
index 000000000000..b27fc03ecaa2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane.c
@@ -0,0 +1,1085 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_pcs.h"
+#include "hw/sl_core_hw_uc_ram.h"
+#include "hw/sl_core_hw_settings.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+#include "data/sl_core_data_link.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+u8 sl_core_hw_serdes_rx_asic_lane_num_get(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	for (asic_lane_num = 0; asic_lane_num < SL_MAX_LANES; ++asic_lane_num)
+		if (core_lgrp->serdes.dt.lane_info[asic_lane_num].rx_source +
+				(4 * (core_lgrp->num & BIT(0))) == serdes_lane_num) {
+			sl_core_log_dbg(core_lgrp, LOG_NAME,
+					"RX asic lane get (asic_lane_num = %u, serdes_lane_num = %u)",
+				asic_lane_num, serdes_lane_num);
+			return asic_lane_num;
+		}
+
+	sl_core_log_err_trace(core_lgrp, LOG_NAME,
+			      "RX asic lane get not found (serdes_lane_num = %u)", serdes_lane_num);
+	return 0;
+}
+
+u8 sl_core_hw_serdes_tx_asic_lane_num_get(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	for (asic_lane_num = 0; asic_lane_num < SL_MAX_LANES; ++asic_lane_num)
+		if (core_lgrp->serdes.dt.lane_info[asic_lane_num].tx_source +
+				(4 * (core_lgrp->num & BIT(0))) == serdes_lane_num) {
+			sl_core_log_dbg(core_lgrp, LOG_NAME,
+					"TX asic lane get (asic_lane_num = %u, serdes_lane_num = %u)",
+				asic_lane_num, serdes_lane_num);
+			return asic_lane_num;
+		}
+
+	sl_core_log_err_trace(core_lgrp, LOG_NAME,
+			      "TX asic lane get not found (serdes_lane_num = %u)", serdes_lane_num);
+	return 0;
+}
+
+static u8 sl_core_hw_serdes_rx_serdes_lane_num_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num)
+{
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"RX serdes lane get (asic_lane_num = %u, serdes_lane_num = %lu)", asic_lane_num,
+		core_lgrp->serdes.dt.lane_info[asic_lane_num].rx_source + (4 * (core_lgrp->num & BIT(0))));
+
+	return core_lgrp->serdes.dt.lane_info[asic_lane_num].rx_source + (4 * (core_lgrp->num & BIT(0)));
+}
+
+static u8 sl_core_hw_serdes_tx_serdes_lane_num_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num)
+{
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"TX serdes lane get (asic_lane_num = %u, serdes_lane_num = %lu)", asic_lane_num,
+		core_lgrp->serdes.dt.lane_info[asic_lane_num].tx_source + (4 * (core_lgrp->num & BIT(0))));
+
+	return core_lgrp->serdes.dt.lane_info[asic_lane_num].tx_source + (4 * (core_lgrp->num & BIT(0)));
+}
+
+int sl_core_hw_serdes_lane_pre1_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *pre1)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL2], &data16);
+
+	*pre1 = (s16)((data16 & 0x01FF) << 7) >> 7;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"pre1 get (data16 = 0x%X, pre1 = %d)", data16, *pre1);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_pre2_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *pre2)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL1], &data16);
+
+	*pre2 = (s16)((data16 & 0x01FF) << 7) >> 7;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"pre2 get (data16 = 0x%X, pre2 = %d)", data16, *pre2);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_pre3_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *pre3)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL0], &data16);
+
+	*pre3 = (s16)((data16 & 0x01FF) << 7) >> 7;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"pre3 get (data16 = 0x%X, pre3 = %d)", data16, *pre3);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_cursor_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *cursor)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL3], &data16);
+
+	*cursor = (s16)((data16 & 0x01FF) << 7) >> 7;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"cursor get (data16 = 0x%X, cursor = %d)", data16, *cursor);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_post1_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *post1)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL4], &data16);
+
+	*post1 = (s16)((data16 & 0x01FF) << 7) >> 7;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"post1 get (data16 = 0x%X, post1 = %d)", data16, *post1);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_post2_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *post2)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL5], &data16);
+
+	*post2 = (s16)((data16 & 0x01FF) << 7) >> 7;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"post2 get (data16 = 0x%X, post2 = %d)", data16, *post2);
+
+	return 0;
+out:
+	return rtn;
+}
+
+u16 sl_core_hw_serdes_mode(struct sl_core_lgrp *core_lgrp,
+			   struct sl_core_serdes_settings *settings)
+{
+	u16 mode;
+
+	mode = settings->osr;
+
+	if (settings->encoding != SL_CORE_HW_SERDES_ENCODING_NRZ)
+		mode |= (0x1 << 6);
+
+	mode |= (settings->width << 7);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "serdes mode = 0x%X", mode);
+
+	return mode;
+}
+
+int sl_core_hw_serdes_lane_osr_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *osr)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_lgrp->num;
+
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+
+	*osr = (SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_GET(data64) & 0x3F);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "osr get (port = %u, osr = %u)", port, *osr);
+
+	return 0;
+}
+
+int sl_core_hw_serdes_lane_encoding_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *encoding)
+{
+	int rtn;
+	u64 data64;
+	u32 port;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	port = core_lgrp->num;
+
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+
+	if (SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_GET(data64) & 0x40) {
+		serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+		SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  core_lgrp->core_ldev->serdes.addrs[SERDES_CDR_CONTROL_0], &data16); /* rx_pam4_er_mode */
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"encoding get (serdes_lane_num = %u, encoding = 0x%X)",
+			serdes_lane_num, (data16 & 0x8000));
+		if (data16 & 0x8000)
+			*encoding = SL_CORE_HW_SERDES_ENCODING_PAM4_ER;
+		else
+			*encoding = SL_CORE_HW_SERDES_ENCODING_PAM4_NR;
+	} else {
+		*encoding = SL_CORE_HW_SERDES_ENCODING_NRZ;
+	}
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"encoding get (port = %u, encoding = %u)", port, *encoding);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_width_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *width)
+{
+	u64 data64;
+	u32 port;
+
+	port = core_lgrp->num;
+
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+
+	*width = ((SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_GET(data64) >> 7) & 0x3);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"width get (port = %u, width = %u)", port, *width);
+
+	return 0;
+}
+
+u16 sl_core_hw_serdes_config(struct sl_core_lgrp *core_lgrp,
+			     struct sl_core_serdes_settings *core_serdes_settings,
+	struct sl_media_serdes_settings *media_serdes_settings)
+{
+	u16 config;
+
+	config = 0;
+
+	config |= ((core_serdes_settings->dfe & 0x1) << 2);
+
+	config |= ((media_serdes_settings->media & 0x3) << 5);
+
+	config |= ((core_serdes_settings->scramble_dis & 0x1) << 8);
+
+	switch (core_serdes_settings->encoding) {
+	case SL_CORE_HW_SERDES_ENCODING_PAM4_ER:
+		config |= (1 << 11);
+		break;
+	case SL_CORE_HW_SERDES_ENCODING_PAM4_NR:
+		config |= (1 << 14);
+		break;
+	case SL_CORE_HW_SERDES_ENCODING_NRZ:
+		config |= (1 << 15);
+		break;
+	}
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "serdes config = 0x%X", config);
+
+	return config;
+}
+
+int sl_core_hw_serdes_lane_dfe_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *dfe)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_rx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_FW_API_DATA0], &data16);
+
+	*dfe = ((data16 >> 2) & 0x1);
+
+	return 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_scramble_dis_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *scramble_dis)
+{
+	int rtn;
+	u16 data16;
+	u8  serdes_lane_num;
+
+	serdes_lane_num = sl_core_hw_serdes_rx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_FW_API_DATA0], &data16);
+
+	*scramble_dis = ((data16 >> 8) & 0x1);
+
+	return 0;
+out:
+	return rtn;
+}
+
+static int sl_core_hw_serdes_lane_up_clock_align(struct sl_core_lgrp *core_lgrp, u8 serdes_lane_num)
+{
+	int  rtn;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up clock align (serdes_lane_num = %u)", serdes_lane_num);
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_AMS_TX_TXCONTROL_3], 0x0000, 0x0080); /* ams_tx_sel_txmaster */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_5], 0x0000, 0x0800); /* tx_pi_pd_bypass_vco */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_5], 0x0000, 0x0400); /* tx_pi_pd_bypass_flt */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_5], 0x0000, 0x0010); /* tx_pi_hs_fifo_phserr_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_5], 0x0000, 0x0008); /* tx_pi_ext_pd_sel */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_0], 0x0000, 0x0001); /* tx_pi_en */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_0], 0x0000, 0x0002); /* tx_pi_jitter_filter_en */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_0], 0x0000, 0x0004); /* tx_pi_ext_ctrl_en */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_0], 0x0000, 0x7000); /* tx_pi_ext_phase_bwsel_integ */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_PI_TXPICONTROL_5], 0x0000, 0x0800); /* tx_pi_pd_bypass_vco */
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+#define LANE_UP_TX_CHECK_NUM_TRIES 10
+#define LANE_UP_TX_DATA_VALID_BIT  BIT(20)
+#define LANE_UP_TX_CLOCK_VALID_BIT BIT(16)
+#define LANE_UP_TX_CHECK_BITS      (LANE_UP_TX_DATA_VALID_BIT | \
+				    LANE_UP_TX_CLOCK_VALID_BIT)
+static int sl_core_hw_serdes_lane_up_tx_check(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	bool                 is_canceled_or_timed_out;
+	u8                   x;
+	u32                  port;
+	u64                  status;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up tx check (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_tx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_CHECK);
+
+	for (x = 0; x < LANE_UP_TX_CHECK_NUM_TRIES; ++x) {
+		rtn = sl_core_link_is_canceled_or_timed_out(core_link, &is_canceled_or_timed_out);
+		if (rtn) {
+			sl_core_log_err_trace(core_lgrp, LOG_NAME,
+					      "lane up tx check - is_canceled_or_timed_out failed [%d]", rtn);
+			return rtn;
+		}
+
+		if (is_canceled_or_timed_out) {
+			sl_core_log_dbg(core_link, LOG_NAME, "lane up tx check canceled");
+			return -ECANCELED;
+		}
+		msleep(100);
+		sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_STS_SERDES(asic_lane_num), &status);
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up tx check (asic_lane_num = %u, status = 0x%llX)", asic_lane_num, status);
+		if ((status & LANE_UP_TX_CHECK_BITS) == LANE_UP_TX_CHECK_BITS)
+			return 0;
+	}
+
+	sl_core_log_err_trace(core_lgrp, LOG_NAME,
+			      "lane up tx check fail (lane = %u, status = 0x%llX)", asic_lane_num, status);
+	return -EIO;
+}
+
+#define LANE_UP_RX_CHECK_NUM_TRIES        70
+#define LANE_UP_RX_CHECK_DATA_VALID_BIT   BIT(12)
+#define LANE_UP_RX_CHECK_CLOCK_VALID_BIT  BIT(8)
+#define LANE_UP_RX_CHECK_LOCK_BIT         BIT(4)
+#define LANE_UP_RX_CHECK_BITS             (LANE_UP_RX_CHECK_DATA_VALID_BIT  | \
+					   LANE_UP_RX_CHECK_CLOCK_VALID_BIT | \
+					   LANE_UP_RX_CHECK_LOCK_BIT)
+/* wait for 6s for PAM4 and 1.5s for NRZ */
+static int sl_core_hw_serdes_lane_up_rx_check(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	bool                 is_canceled_or_timed_out;
+	u8                   x;
+	u32                  port;
+	u64                  status;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up rx check (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_rx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_CHECK);
+
+	for (x = 0; x < LANE_UP_RX_CHECK_NUM_TRIES; ++x) {
+		rtn = sl_core_link_is_canceled_or_timed_out(core_link, &is_canceled_or_timed_out);
+		if (rtn) {
+			sl_core_log_err_trace(core_lgrp, LOG_NAME,
+					      "lane up rx check - is_canceled_or_timed_out failed [%d]", rtn);
+			return rtn;
+		}
+
+		if (is_canceled_or_timed_out) {
+			sl_core_log_dbg(core_link, LOG_NAME, "lane up rx check canceled");
+			return -ECANCELED;
+		}
+		msleep(300);
+		sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_STS_SERDES(asic_lane_num), &status);
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up rx check (asic_lane_num = %u, status = 0x%llX)", asic_lane_num, status);
+		if ((status & LANE_UP_RX_CHECK_BITS) == LANE_UP_RX_CHECK_BITS)
+			return 0;
+	}
+
+	sl_core_log_err_trace(core_lgrp, LOG_NAME,
+			      "lane up rx check fail (asic_lane_num = %u, status = 0x%llX)", asic_lane_num, status);
+	return -EIO;
+}
+
+#define LANE_UP_QUALITY_CHECK_NUM_TRIES 20
+static int sl_core_hw_serdes_lane_up_quality_check(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u8                   x;
+	u32                  port;
+	u8                   asic_lane_num;
+	u32                  addr;
+	u8                   eye_upper;
+	u8                   eye_lower;
+	u16                  data16;
+	struct sl_core_lgrp *core_lgrp;
+	u16                  extended;
+	u64                  data64;
+	bool                 is_canceled_or_timed_out;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up quality check (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	/* if link training decides extended reach, then modify eye limits */
+	if (is_flag_set(core_link->core_lgrp->link_caps[core_link->num].hpe_map, SL_LINK_CONFIG_HPE_LINKTRAIN)) {
+		sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+		if (SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_GET(data64) & 0x40) {
+			SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+					  core_lgrp->core_ldev->serdes.addrs[SERDES_CDR_CONTROL_0], &extended);
+			sl_core_log_dbg(core_lgrp, LOG_NAME,
+					"extended get (serdes_lane_num = %u, extended = 0x%X)",
+				serdes_lane_num, (extended & 0x8000));
+			if (extended & 0x8000) {
+				sl_core_log_dbg(core_lgrp, LOG_NAME, "lane up quality check extended reach");
+				core_link->core_lgrp->serdes.eye_limits[asic_lane_num].low  = 5;
+				core_link->core_lgrp->serdes.eye_limits[asic_lane_num].high = 30;
+				if (core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_BJ_100G) {
+					core_link->core_lgrp->serdes.eye_limits[asic_lane_num].low  = 25;
+					core_link->core_lgrp->serdes.eye_limits[asic_lane_num].high = 150;
+				}
+			}
+		}
+	}
+
+	addr = SL_CORE_HW_SERDES_LANE_ADDR(0x7, serdes_lane_num, core_lgrp);
+
+	for (x = 0; x < LANE_UP_QUALITY_CHECK_NUM_TRIES; ++x) {
+		rtn = sl_core_link_is_canceled_or_timed_out(core_link, &is_canceled_or_timed_out);
+		if (rtn) {
+			sl_core_log_err_trace(core_lgrp, LOG_NAME,
+					      "lane up quality check - is_canceled_or_timed_out failed [%d]", rtn);
+			return rtn;
+		}
+
+		if (is_canceled_or_timed_out) {
+			sl_core_log_dbg(core_lgrp, LOG_NAME, "lane up quality check canceled");
+			return -ECANCELED;
+		}
+		msleep(200);
+		SL_CORE_HW_UC_RAM_RD8(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id,
+				      serdes_lane_num, addr, &eye_upper);
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up quality check (serdes_lane_num = %u, asic_lane_num = %u, eye_upper = %u, low = %u, high = %u)",
+			serdes_lane_num, asic_lane_num, eye_upper,
+			core_lgrp->serdes.eye_limits[asic_lane_num].low,
+			core_lgrp->serdes.eye_limits[asic_lane_num].high);
+		if ((eye_upper > core_lgrp->serdes.eye_limits[asic_lane_num].low) &&
+		    (eye_upper < core_lgrp->serdes.eye_limits[asic_lane_num].high))
+			break;
+	}
+	if (x >= LANE_UP_QUALITY_CHECK_NUM_TRIES)
+		return -EIO;
+
+	addr = SL_CORE_HW_SERDES_LANE_ADDR(0x8, serdes_lane_num, core_lgrp);
+
+	for (x = 0; x < LANE_UP_QUALITY_CHECK_NUM_TRIES; ++x) {
+		rtn = sl_core_link_is_canceled_or_timed_out(core_link, &is_canceled_or_timed_out);
+		if (rtn) {
+			sl_core_log_err_trace(core_lgrp, LOG_NAME,
+					      "lane up quality check - is_canceled_or_timed_out failed [%d]", rtn);
+			return rtn;
+		}
+
+		if (is_canceled_or_timed_out) {
+			sl_core_log_dbg(core_lgrp, LOG_NAME, "lane up quality check canceled");
+			return -ECANCELED;
+		}
+		msleep(200);
+		SL_CORE_HW_UC_RAM_RD8(core_lgrp, core_lgrp->serdes.dt.dev_addr, core_lgrp->serdes.dt.dev_id,
+				      serdes_lane_num, addr, &eye_lower);
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up quality check (serdes_lane_num = %u, asic_lane_num = %u, eye_lower = %u, low = %u, high = %u)",
+			serdes_lane_num, asic_lane_num, eye_lower,
+			core_lgrp->serdes.eye_limits[asic_lane_num].low,
+			core_lgrp->serdes.eye_limits[asic_lane_num].high);
+		if ((eye_lower > core_lgrp->serdes.eye_limits[asic_lane_num].low) &&
+		    (eye_lower < core_lgrp->serdes.eye_limits[asic_lane_num].high))
+			break;
+	}
+	if (x >= LANE_UP_QUALITY_CHECK_NUM_TRIES)
+		return -EIO;
+
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_MISC_CONFIG],  &data16);
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up quality check (serdes_lane_num = %u, 0x%X = 0x%X)", serdes_lane_num,
+		 core_lgrp->core_ldev->serdes.addrs[SERDES_RX_MISC_CONFIG], data16);
+	SL_CORE_HW_PMI_RD(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TLB_TX_TLB_TX_PAM4_CONFIG_0],  &data16);
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up quality check (serdes_lane_num = %u, 0x%X = 0x%X)",
+		core_lgrp->core_ldev->serdes.addrs[SERDES_TLB_TX_TLB_TX_PAM4_CONFIG_0],
+		serdes_lane_num, data16);
+
+	return 0;
+out:
+	return rtn;
+}
+
+static void sl_core_hw_pmd_tx_enable(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	u64 data64;
+	u32 port;
+	u8  asic_lane_num;
+
+	port          = core_link->core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"pmd_tx_enable (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_lgrp_read64(core_link->core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_DISABLE_UPDATE(data64, 0);
+	sl_core_lgrp_write64(core_link->core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_link->core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+}
+
+int sl_core_hw_serdes_lanes_up(struct sl_core_link *core_link, bool is_autoneg)
+{
+	int           rtn;
+	unsigned long lane_map;
+	u8            serdes_lane_num;
+
+	lane_map = core_link->serdes.lane_map;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"lanes up (lane_map = 0x%02lX, is_autoneg = %d)", lane_map, is_autoneg);
+
+	/* start */
+	for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+		sl_core_log_dbg(core_link, LOG_NAME, "lanes up (serdes_lane_num = %u)", serdes_lane_num);
+		rtn = sl_core_hw_serdes_lane_up_rx_setup(core_link, serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_rx_setup failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_lane_up_tx_setup(core_link, serdes_lane_num, is_autoneg);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_tx_setup failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_lane_up_rx_config(core_link, serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_rx_config failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_lane_up_tx_config(core_link, serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_tx_config failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_lane_up_rx_start(core_link, serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_rx_start failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_lane_up_tx_start(core_link, serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_tx_start failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+	}
+
+	/* clock align */
+	for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+		rtn = sl_core_hw_serdes_lane_up_clock_align(core_link->core_lgrp, serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_clock_align failed [%d]", rtn);
+			sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+			goto out;
+		}
+	}
+
+	if (!is_autoneg) {
+
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_SERDES_CHECK);
+
+		for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+			rtn = sl_core_hw_serdes_lane_up_tx_check(core_link, serdes_lane_num);
+			if (rtn) {
+				sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_tx_check failed [%d]", rtn);
+				sl_core_data_link_last_up_fail_cause_map_set(core_link,
+									     SL_LINK_DOWN_CAUSE_SERDES_SIGNAL_MAP);
+				goto out;
+			}
+		}
+	}
+
+	/* sleep to give last lane time to settle */
+	msleep(20);
+
+	if (!is_autoneg) {
+		sl_core_hw_pcs_tx_start(core_link);
+
+		for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES)
+			sl_core_hw_pmd_tx_enable(core_link, serdes_lane_num);
+
+		for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+			rtn = sl_core_hw_serdes_lane_up_rx_check(core_link, serdes_lane_num);
+			if (rtn) {
+				sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_rx_check failed [%d]", rtn);
+				sl_core_data_link_last_up_fail_cause_map_set(core_link,
+									     SL_LINK_DOWN_CAUSE_SERDES_SIGNAL_MAP);
+				goto out;
+			}
+		}
+
+		if (!is_flag_set(core_link->core_lgrp->config.options, SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+			sl_core_log_dbg(core_link, LOG_NAME, "loopback off so check quality");
+			for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+				rtn = sl_core_hw_serdes_lane_up_quality_check(core_link, serdes_lane_num);
+				if (rtn) {
+					sl_core_log_err_trace(core_link, LOG_NAME,
+							      "lane_up_quality_check failed [%d]", rtn);
+					sl_core_data_link_last_up_fail_cause_map_set(core_link,
+										     SL_LINK_DOWN_CAUSE_SERDES_QUALITY_MAP);
+					goto out;
+				}
+			}
+		}
+
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_SERDES_CHECK);
+	}
+
+	/* up */
+	for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+		sl_core_hw_serdes_tx_lane_state_set(core_link->core_lgrp,
+						    sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num),
+			SL_CORE_HW_SERDES_LANE_STATE_UP);
+		sl_core_hw_serdes_rx_lane_state_set(core_link->core_lgrp,
+						    sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num),
+			SL_CORE_HW_SERDES_LANE_STATE_UP);
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+void sl_core_hw_serdes_lanes_down(struct sl_core_link *core_link)
+{
+	unsigned long lane_map;
+	u8            serdes_lane_num;
+
+	lane_map = core_link->serdes.lane_map;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lanes down (lane_map = 0x%02lX)", lane_map);
+
+	for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+		sl_core_hw_serdes_lane_down_tx_stop(core_link, serdes_lane_num);
+		sl_core_hw_serdes_lane_down_rx_stop(core_link, serdes_lane_num);
+	}
+
+	for_each_set_bit(serdes_lane_num, &lane_map, SL_MAX_SERDES_LANES) {
+		sl_core_hw_serdes_tx_lane_state_set(core_link->core_lgrp,
+						    sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num),
+			SL_CORE_HW_SERDES_LANE_STATE_DOWN);
+		sl_core_hw_serdes_rx_lane_state_set(core_link->core_lgrp,
+						    sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num),
+			SL_CORE_HW_SERDES_LANE_STATE_DOWN);
+	}
+}
+
+void sl_core_hw_serdes_degraded_lanes_state_set(struct sl_core_link *core_link, u8 tx_degrade_map, u8 rx_degrade_map)
+{
+	u8            tx_asic_lane_num;
+	u8            rx_asic_lane_num;
+	unsigned long tx_degrade_lane_map_ul;
+	unsigned long rx_degrade_lane_map_ul;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "degraded lanes state set (tx_degrade_map = 0x%X, rx_degrade_map = 0x%X)",
+			tx_degrade_map, rx_degrade_map);
+
+	tx_degrade_lane_map_ul = (unsigned long)tx_degrade_map ^ 0x0F;
+	rx_degrade_lane_map_ul = (unsigned long)rx_degrade_map ^ 0x0F;
+
+	for_each_set_bit(tx_asic_lane_num, &tx_degrade_lane_map_ul, SL_MAX_SERDES_LANES)
+		sl_core_hw_serdes_tx_lane_state_set(core_link->core_lgrp, tx_asic_lane_num,
+						    SL_CORE_HW_SERDES_LANE_STATE_DEGRADED);
+
+	for_each_set_bit(rx_asic_lane_num, &rx_degrade_lane_map_ul, SL_MAX_SERDES_LANES)
+		sl_core_hw_serdes_rx_lane_state_set(core_link->core_lgrp, rx_asic_lane_num,
+						    SL_CORE_HW_SERDES_LANE_STATE_DEGRADED);
+}
+
+int sl_core_hw_serdes_lanes_up_prbs(struct sl_core_link *core_link, u8 tx_degrade_map, u8 rx_degrade_map)
+{
+	int           rtn;
+	u8            tx_asic_lane_num;
+	u8            tx_serdes_lane_num;
+	u8            rx_asic_lane_num;
+	u8            rx_serdes_lane_num;
+	unsigned long tx_degrade_lane_map_ul;
+	unsigned long rx_degrade_lane_map_ul;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lanes up prbs (tx_degrade_map = 0x%X, rx_degrade_map = 0x%X)",
+			tx_degrade_map, rx_degrade_map);
+
+	tx_degrade_lane_map_ul = (unsigned long)tx_degrade_map ^ 0x0F;
+	rx_degrade_lane_map_ul = (unsigned long)rx_degrade_map ^ 0x0F;
+
+	for_each_set_bit(tx_asic_lane_num, &tx_degrade_lane_map_ul, SL_MAX_SERDES_LANES) {
+
+		tx_serdes_lane_num = sl_core_hw_serdes_tx_serdes_lane_num_get(core_link->core_lgrp, tx_asic_lane_num);
+
+		rtn = sl_core_hw_serdes_lane_tx_prbs_config(core_link, tx_serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "prbs config failed [%d] (asic_lane = %u, serdes_lane = %u)",
+					      rtn, tx_asic_lane_num, tx_serdes_lane_num);
+			return rtn;
+		}
+
+		rtn = sl_core_hw_serdes_lane_tx_prbs_enable(core_link, tx_serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "prbs enable failed [%d] (asic_lane = %u, serdes_lane = %u)",
+					      rtn, tx_asic_lane_num, tx_serdes_lane_num);
+			return rtn;
+		}
+
+		rtn = sl_core_hw_serdes_lane_tx_prbs_shrd_patt_gen_disable(core_link, tx_serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "prbs shared pattern gen disable failed [%d] (asic_lane = %u, serdes_lane = %u)",
+					      rtn, tx_asic_lane_num, tx_serdes_lane_num);
+			return rtn;
+		}
+
+		rtn = sl_core_hw_serdes_lane_tx_prbs_remote_loopback_disable(core_link, tx_serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "prbs remote loopback disable failed [%d] (asic_lane = %u, serdes_lane = %u)",
+					      rtn, tx_asic_lane_num, tx_serdes_lane_num);
+			return rtn;
+		}
+
+		rtn = sl_core_hw_serdes_lane_tx_prbs_checker_enable(core_link, tx_serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "prbs checker enable failed [%d] (asic_lane = %u, serdes_lane = %u)",
+					      rtn, tx_asic_lane_num, tx_serdes_lane_num);
+			return rtn;
+		}
+	}
+
+	/* sleep to give last lane time to settle */
+	msleep(20);
+
+	for_each_set_bit(rx_asic_lane_num, &rx_degrade_lane_map_ul, SL_MAX_SERDES_LANES) {
+
+		rx_serdes_lane_num = sl_core_hw_serdes_rx_serdes_lane_num_get(core_link->core_lgrp, rx_asic_lane_num);
+
+		rtn = sl_core_hw_serdes_lane_up_quality_check(core_link, rx_serdes_lane_num);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME, "lane_up_quality_check failed [%d] (rx_serdes_lane_num = %u)",
+					      rtn, rx_serdes_lane_num);
+			return rtn;
+		}
+	}
+
+	return 0;
+}
+
+int sl_core_hw_serdes_eye_upper_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *eye_upper)
+{
+	int rtn;
+	u32 addr;
+	u8  serdes_lane_num;
+
+	if (!sl_core_ldev_serdes_is_ready(core_lgrp->core_ldev))
+		return -EIO;
+
+	serdes_lane_num = sl_core_hw_serdes_rx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	addr = SL_CORE_HW_SERDES_LANE_ADDR(0x7, serdes_lane_num, core_lgrp);
+
+	SL_CORE_HW_UC_RAM_RD8(core_lgrp, core_lgrp->serdes.dt.dev_addr,
+			      core_lgrp->serdes.dt.dev_id, serdes_lane_num, addr, eye_upper);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"eye upper get (serdes_lane_num = %u, asic_lane_num = %u, eye_upper = %u)",
+		serdes_lane_num, asic_lane_num, *eye_upper);
+
+	rtn = 0;
+
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_eye_lower_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *eye_lower)
+{
+	int rtn;
+	u32 addr;
+	u8  serdes_lane_num;
+
+	if (!sl_core_ldev_serdes_is_ready(core_lgrp->core_ldev))
+		return -EIO;
+
+	serdes_lane_num = sl_core_hw_serdes_rx_serdes_lane_num_get(core_lgrp, asic_lane_num);
+
+	addr = SL_CORE_HW_SERDES_LANE_ADDR(0x8, serdes_lane_num, core_lgrp);
+
+	SL_CORE_HW_UC_RAM_RD8(core_lgrp, core_lgrp->serdes.dt.dev_addr,
+			      core_lgrp->serdes.dt.dev_id, serdes_lane_num, addr, eye_lower);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"eye lower get (serdes_lane_num = %u, asic_lane_num = %u, eye_lower = %u)",
+		serdes_lane_num, asic_lane_num, *eye_lower);
+
+	rtn = 0;
+
+out:
+	return rtn;
+}
+
+void sl_core_hw_serdes_tx_lane_state_set(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u32 state)
+{
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"tx lane state set (asic_lane_num = %u, state = %u %s)",
+		asic_lane_num, state, sl_core_serdes_lane_state_str(state));
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->serdes.lane_state[asic_lane_num].tx = state;
+	spin_unlock(&core_lgrp->data_lock);
+}
+
+int sl_core_hw_serdes_tx_lane_state_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u32 *state)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*state = core_lgrp->serdes.lane_state[asic_lane_num].tx;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"tx lane state get (asic_lane_num = %u, state = %u %s)",
+		asic_lane_num, *state, sl_core_serdes_lane_state_str(*state));
+
+	return 0;
+}
+
+void sl_core_hw_serdes_rx_lane_state_set(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u32 state)
+{
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"rx lane state set (asic_lane_num = %u, state = %u %s)",
+		asic_lane_num, state, sl_core_serdes_lane_state_str(state));
+
+	spin_lock(&core_lgrp->data_lock);
+	core_lgrp->serdes.lane_state[asic_lane_num].rx = state;
+	spin_unlock(&core_lgrp->data_lock);
+}
+
+int sl_core_hw_serdes_rx_lane_state_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u32 *state)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*state = core_lgrp->serdes.lane_state[asic_lane_num].rx;
+	spin_unlock(&core_lgrp->data_lock);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"rx lane state get (asic_lane_num = %u, state = %u %s)",
+		asic_lane_num, *state, sl_core_serdes_lane_state_str(*state));
+
+	return 0;
+}
+
+int sl_core_hw_serdes_tx_lane_is_lol(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, bool *is_tx_lol)
+{
+	int                         rtn;
+	u8                          serdes_lane_map;
+	struct sl_media_jack_signal media_signal;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "tx lane is lol (asic_lane_num = %u)", asic_lane_num);
+
+	serdes_lane_map = BIT(sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num));
+
+	rtn = sl_media_jack_signal_cache_get(core_lgrp->core_ldev->num, core_lgrp->num,
+					     serdes_lane_map, &media_signal);
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "signal cache get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*is_tx_lol = media_signal.tx.lol_map & serdes_lane_map;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "tx lane lol check (is_tx_lol = %s)", *is_tx_lol ? "yes" : "no");
+
+	return 0;
+}
+
+int sl_core_hw_serdes_rx_lane_is_lol(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, bool *is_rx_lol)
+{
+	int                         rtn;
+	u8                          serdes_lane_map;
+	struct sl_media_jack_signal media_signal;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "rx lane is lol (asic_lane_num = %u)", asic_lane_num);
+
+	serdes_lane_map = BIT(sl_core_hw_serdes_rx_serdes_lane_num_get(core_lgrp, asic_lane_num));
+
+	rtn = sl_media_jack_signal_cache_get(core_lgrp->core_ldev->num, core_lgrp->num,
+					     serdes_lane_map, &media_signal);
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "signal cache get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*is_rx_lol = media_signal.rx.lol_map & serdes_lane_map;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "rx lane lol check (is_rx_lol = %s)", *is_rx_lol ? "yes" : "no");
+
+	return 0;
+}
+
+int sl_core_hw_serdes_tx_lane_is_los(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, bool *is_tx_los)
+{
+	int                         rtn;
+	u8                          serdes_lane_map;
+	struct sl_media_jack_signal media_signal;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "tx lane is los (asic_lane_num = %u)", asic_lane_num);
+
+	serdes_lane_map = BIT(sl_core_hw_serdes_tx_serdes_lane_num_get(core_lgrp, asic_lane_num));
+
+	rtn = sl_media_jack_signal_cache_get(core_lgrp->core_ldev->num, core_lgrp->num,
+					     serdes_lane_map, &media_signal);
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "signal cache get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*is_tx_los = media_signal.tx.los_map & serdes_lane_map;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "tx lane los check (is_tx_los = %s)", *is_tx_los ? "yes" : "no");
+
+	return 0;
+}
+
+int sl_core_hw_serdes_rx_lane_is_los(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, bool *is_rx_los)
+{
+	int                         rtn;
+	u8                          serdes_lane_map;
+	struct sl_media_jack_signal media_signal;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "rx lane is los (asic_lane_num = %u)", asic_lane_num);
+
+	serdes_lane_map = BIT(sl_core_hw_serdes_rx_serdes_lane_num_get(core_lgrp, asic_lane_num));
+
+	rtn = sl_media_jack_signal_cache_get(core_lgrp->core_ldev->num, core_lgrp->num,
+					     serdes_lane_map, &media_signal);
+	if (rtn) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME, "signal cache get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*is_rx_los = media_signal.rx.los_map & serdes_lane_map;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "rx lane los check (is_rx_los = %s)", *is_rx_los ? "yes" : "no");
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane_rx.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane_rx.c
new file mode 100644
index 000000000000..1999c4f8a396
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane_rx.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+int sl_core_hw_serdes_lane_up_rx_setup(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up rx setup (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_rx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_SETUP);
+
+	/* clock gate */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_CKRST_CTRL_RX_CLOCK_N_RESET_DEBUG_CONTROL],
+		0x0000, 0x0010); /* rx_clk_vld_frc_val */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_CKRST_CTRL_RX_CLOCK_N_RESET_DEBUG_CONTROL],
+		0x0000, 0x0008); /* rx_clk_vld_frc */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_CKRST_CTRL_RX_CLOCK_N_RESET_DEBUG_CONTROL],
+		0x0000, 0x0001); /* rx_s_clkgate_frc_on */
+
+	/* power on */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_CKRST_CTRL_RX_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0000, 0x0001); /* rx_s_pwrdn */
+
+	usleep_range(10000, 20000); /* avoid power surge */
+
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_H_PWRDN_UPDATE(data64, 0); /* active high */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+
+	/* disable DP */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0000, 0x0001); /* RX_LN_DP_EN */
+
+	/* assert DP reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_DP_H_RSTB_UPDATE(data64, 0); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+
+	/* toggle reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_H_RSTB_UPDATE(data64, 0); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+	usleep_range(10, 20);
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_H_RSTB_UPDATE(data64, 1); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_up_rx_config(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up rx config (port = %u, serdes_lane_num = %u, asic_lane_num = %u, hpe_map = 0x%X)",
+		port, serdes_lane_num, asic_lane_num,
+		core_link->core_lgrp->link_caps[core_link->num].hpe_map);
+
+	sl_core_hw_serdes_rx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_CONFIG);
+
+	/* OSR */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_RX_OSR_MODE_UPDATE(data64,
+								   sl_core_hw_serdes_mode(core_lgrp, &(core_link->serdes.core_serdes_settings)));
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+
+	/* fw cfg */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_FW_API_DATA0],
+		sl_core_hw_serdes_config(core_lgrp,
+					 &(core_link->serdes.core_serdes_settings), &(core_link->serdes.media_serdes_settings)),
+		0xFFFF); /* LANE_CFG_FWAPI_DATA0 */
+
+	/* invert */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_MISC_CONFIG],
+		core_lgrp->serdes.dt.lane_info[asic_lane_num].rx_invert, 0x0001); /* RX_PMD_DP_INVERT */
+
+	/* link training */
+	if (is_flag_set(core_link->core_lgrp->link_caps[core_link->num].hpe_map, SL_LINK_CONFIG_HPE_LINKTRAIN)) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up rx config link train on (logical = %u)", serdes_lane_num);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  core_lgrp->core_ldev->serdes.addrs[SERDES_LINKTRN_IEEE_TX_LINKTRNIT_BASE_R_PMD_CONTROL],
+			0x0002, 0x0002); /* linktrn_ieee_training_enable */
+	} else {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up rx config link train off (logical = %u)", serdes_lane_num);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  core_lgrp->core_ldev->serdes.addrs[SERDES_LINKTRN_IEEE_TX_LINKTRNIT_BASE_R_PMD_CONTROL],
+			0x0000, 0x0002); /* linktrn_ieee_training_enable */
+	}
+
+	/* digital loopback */
+	if (is_flag_set(core_link->core_lgrp->config.options, SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up rx config loopback on (logical = %u)", serdes_lane_num);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  core_lgrp->core_ldev->serdes.addrs[SERDES_TLB_RX_DIG_LPBK_CONFIG],
+			0x0001, 0x0001); /* DIG_LPBK_EN */
+		sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_SERDES_LOOPBACK_ON);
+	} else {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up rx config loopback off (logical = %u)", serdes_lane_num);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  core_lgrp->core_ldev->serdes.addrs[SERDES_TLB_RX_DIG_LPBK_CONFIG],
+			0x0000, 0x0001); /* DIG_LPBK_EN */
+		sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_SERDES_LOOPBACK_ON);
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_up_rx_start(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up rx start (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_rx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_START);
+
+	/* enable DP */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0001, 0x0001); /* RX_LN_DP_EN */
+
+	/* release DP reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_DP_H_RSTB_UPDATE(data64, 1); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+void sl_core_hw_serdes_lane_down_rx_stop(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_rx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane down rx stop (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_rx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_STOP);
+
+	/* disable DP */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0000, 0x0001); /* RX_LN_DP_EN */
+
+	/* assert DP reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_DP_H_RSTB_UPDATE(data64, 0); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_RX(asic_lane_num));
+
+	/* power down */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_RX_CKRST_CTRL_RX_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0001, 0x0001); /* rx_s_pwrdn */
+
+	usleep_range(10000, 20000); /* avoid power surge */
+
+	/* clear the config */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_FW_API_DATA0],
+		0x0000, 0xFFFF); /* LANE_CFG_FWAPI_DATA0 */
+
+out:
+	return;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane_tx.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane_tx.c
new file mode 100644
index 000000000000..57e40566b61a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane_tx.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "hw/sl_core_hw_io.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+int sl_core_hw_serdes_lane_up_tx_setup(struct sl_core_link *core_link, u8 serdes_lane_num, bool is_autoneg)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up tx setup (port = %u, serdes_lane_num = %u, asic_lane_num = %u, is_autoneg = %d)",
+		port, serdes_lane_num, asic_lane_num, is_autoneg);
+
+	sl_core_hw_serdes_tx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_SETUP);
+
+	/* clock gate */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_CKRST_CTRL_TX_CLOCK_N_RESET_DEBUG_CONTROL],
+		0x0000, 0x0010); /* tx_clk_vld_frc_val */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_CKRST_CTRL_TX_CLOCK_N_RESET_DEBUG_CONTROL],
+		0x0000, 0x0008); /* tx_clk_vld_frc */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_CKRST_CTRL_TX_CLOCK_N_RESET_DEBUG_CONTROL],
+		0x0000, 0x0001); /* tx_s_clkgate_frc_on */
+
+	/* power on */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_CKRST_CTRL_TX_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0000, 0x0001); /* tx_s_pwrdn */
+
+	usleep_range(10000, 20000); /* avoid power surge */
+
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_H_PWRDN_UPDATE(data64, 0); /* active high */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	if (is_autoneg)
+		data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_DISABLE_UPDATE(data64, 0);
+	else
+		data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_DISABLE_UPDATE(data64, 1);
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+
+	/* disable TX */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_MISC_CONTROL0],
+		0x0001, 0x0001); /* sdk_tx_disable */
+
+	/* disable DP */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TXCOM_CKRST_CTRL_TXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0000, 0x0001); /* TX_LN_DP_EN */
+
+	/* assert DP reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_DP_H_RSTB_UPDATE(data64, 0); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+
+	/* toggle reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_H_RSTB_UPDATE(data64, 0); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+	usleep_range(10, 20);
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_H_RSTB_UPDATE(data64, 1); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_up_tx_config(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+	u16                 *addrs;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num);
+	addrs         = core_lgrp->core_ldev->serdes.addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up tx config (port = %u, serdes_lane_num = %u, asic_lane_num = %u, hpe_map = 0x%X)",
+		port, serdes_lane_num, asic_lane_num,
+		core_link->core_lgrp->link_caps[core_link->num].hpe_map);
+
+	sl_core_hw_serdes_tx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_CONFIG);
+
+	/* OSR */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_UPDATE(data64,
+								   sl_core_hw_serdes_mode(core_lgrp, &(core_link->serdes.core_serdes_settings)));
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up tx config (pre3 = %d, pre2 = %d, pre1 = %d, cursor = %d, post1 = %d, post2 = %d)",
+		core_link->serdes.media_serdes_settings.pre3, core_link->serdes.media_serdes_settings.pre2,
+		core_link->serdes.media_serdes_settings.pre1, core_link->serdes.media_serdes_settings.cursor,
+		core_link->serdes.media_serdes_settings.post1, core_link->serdes.media_serdes_settings.post2);
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_TX_TLB_TX_PAM4_CONFIG_0],
+		0x0000, 0x0002); /* PAM4_PRECODER_EN */
+
+	/* pre3 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL0],
+		core_link->serdes.media_serdes_settings.pre3, 0x01FF);
+	/* pre2 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL1],
+		core_link->serdes.media_serdes_settings.pre2, 0x01FF);
+	/* pre1 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL2],
+		core_link->serdes.media_serdes_settings.pre1, 0x01FF);
+	/* cursor */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL3],
+		core_link->serdes.media_serdes_settings.cursor, 0x01FF);
+	/* post 1 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL4],
+		core_link->serdes.media_serdes_settings.post1, 0x01FF);
+	/* post 2 */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL5],
+		core_link->serdes.media_serdes_settings.post2, 0x01FF);
+	/* tap enable */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL0], 0x1000, 0x7000);
+	/* load coefficients */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TX_FED_TXFIR_TAP_CONTROL0], 0x0800, 0x0800); /* TXFIR_TAP_LOAD */
+
+	/* invert */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_TX_TXMISC_CONFIG],
+		core_lgrp->serdes.dt.lane_info[asic_lane_num].tx_invert, 0x0001);
+
+	/* link training */
+	if (is_flag_set(core_link->core_lgrp->link_caps[core_link->num].hpe_map, SL_LINK_CONFIG_HPE_LINKTRAIN)) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up tx config link train on (serdes = %u)", serdes_lane_num);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  addrs[SERDES_LINKTRN_IEEE_TX_LINKTRNIT_BASE_R_PMD_CONTROL], 0x0002, 0x0002);
+	} else {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"lane up tx config link train off (serdes = %u)", serdes_lane_num);
+		SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+				  addrs[SERDES_LINKTRN_IEEE_TX_LINKTRNIT_BASE_R_PMD_CONTROL], 0x0000, 0x0002);
+	}
+
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_TX_RMT_LPBK_CONFIG], 0x0000, 0x0001); /* RMT_LPBK_EN */
+
+	/* set core mode */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_TX_PRBS_GEN_CONFIG], 0x0000, 0x0001); /* PRBS_GEN_EN */
+
+	/* patern generator disable */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_TX_PATT_GEN_CONFIG], 0x0000, 0x0001); /* PATT_GEN_EN */
+
+	/* PRBS check enable */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_RX_PRBS_CHK_CONFIG], 0x0000, 0x0001); /* PRBS_CHK_EN */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  addrs[SERDES_TLB_RX_PRBS_CHK_CONFIG], 0x0001, 0x0001); /* PRBS_CHK_EN */
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_up_tx_start(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane up tx start (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_tx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_START);
+
+	/* enable DP */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TXCOM_CKRST_CTRL_TXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0001, 0x0001); /* TX_LN_DP_EN */
+
+	/* release DP reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_DP_H_RSTB_UPDATE(data64, 1); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+
+	/* enable TX */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_MISC_CONTROL0],
+		0x0000, 0x0001); /* TX_DISABLE */
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+void sl_core_hw_serdes_lane_down_tx_stop(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	u64                  data64;
+	u32                  port;
+	u8                   asic_lane_num;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp     = core_link->core_lgrp;
+	port          = core_lgrp->num;
+	asic_lane_num = sl_core_hw_serdes_tx_asic_lane_num_get(core_link, serdes_lane_num);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"lane down tx stop (port = %u, serdes_lane_num = %u, asic_lane_num = %u)",
+		port, serdes_lane_num, asic_lane_num);
+
+	sl_core_hw_serdes_tx_lane_state_set(core_lgrp,
+					    asic_lane_num, SL_CORE_HW_SERDES_LANE_STATE_STOP);
+
+	/* disable TX */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_FED_TXFIR_MISC_CONTROL0],
+		0x0001, 0x0001); /* TX_DISABLE */
+
+	/* disable DP */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TXCOM_CKRST_CTRL_TXCOM_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0000, 0x0001); /* TX_LN_DP_EN */
+
+	/* assert DP reset */
+	sl_core_lgrp_read64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), &data64);
+	data64 = SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_DP_H_RSTB_UPDATE(data64, 0); /* active low */
+	sl_core_lgrp_write64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num), data64);
+	sl_core_lgrp_flush64(core_lgrp, SS2_PORT_PML_CFG_SERDES_TX(asic_lane_num));
+
+	/* power down */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  core_lgrp->core_ldev->serdes.addrs[SERDES_TX_CKRST_CTRL_TX_LANE_CLK_RESET_N_POWERDOWN_CONTROL],
+		0x0001, 0x0001); /* tx_s_pwrdn */
+
+	usleep_range(10000, 20000);  /* avoid power surge */
+
+out:
+	return;
+}
+
+int sl_core_hw_serdes_lane_tx_prbs_config(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx prbs config (serdes_lane_num = %u)", serdes_lane_num);
+
+	/* PRBS Gen Mode Select */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD171, 0x000A, 0x000E);
+
+	/* Set MSB for PRBS Mode Selection */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD171, 0x0000, 0x1000);
+
+	/* PRBS Invert Disable*/
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD171, 0x0000, 0x0010);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_tx_prbs_enable(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx prbs enable (serdes_lane_num = %u)", serdes_lane_num);
+
+	/* Enable PRBS Generator */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD171, 0x0001, 0x0001);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_tx_prbs_shrd_patt_gen_disable(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx prbs shared pattern gen disable (serdes_lane_num = %u)", serdes_lane_num);
+
+	/* Disable Fixed Pattern Generation */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD170, 0x0000, 0x0001);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_tx_prbs_remote_loopback_disable(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx prbs remote loopback disable (serdes_lane_num = %u)", serdes_lane_num);
+
+	/* Disable Loopback */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD172, 0x0000, 0x0001);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_serdes_lane_tx_prbs_checker_enable(struct sl_core_link *core_link, u8 serdes_lane_num)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp;
+
+	core_lgrp = core_link->core_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "tx prbs checker enable (serdes_lane_num = %u)", serdes_lane_num);
+
+	/* Disable PRBS checker */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD161, 0x0000, 0x0001);
+
+	/* Enable PRBS checker */
+	SL_CORE_HW_PMI_WR(core_lgrp, core_lgrp->serdes.dt.dev_id, serdes_lane_num, 0,
+			  0xD161, 0x0001, 0x0001);
+
+	rtn = 0;
+out:
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_link.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_link.c
new file mode 100644
index 000000000000..1c8211efe2d5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_link.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/umh.h>
+
+#include <linux/hpe/sl/sl_media.h>
+#include <linux/hpe/sl/sl_link.h>
+
+#include "sl_platform.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_core_link.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_serdes_core.h"
+#include "hw/sl_core_hw_serdes_link.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "hw/sl_core_hw_settings.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+#include "data/sl_core_data_link.h"
+#include "data/sl_core_data_lgrp.h"
+#include "data/sl_ctrl_data_lgrp_trace.h"
+
+#define LOG_NAME SL_CORE_SERDES_LOG_NAME
+
+#define SL_CORE_HW_SERDES_STATE_DOWN 0
+#define SL_CORE_HW_SERDES_STATE_UP   1
+
+static int sl_core_hw_serdes_link_up_an_settings(struct sl_core_link *core_link)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link up an settings");
+
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+	if (sl_media_lgrp_is_cable_unsupported(media_lgrp))
+		sl_core_log_warn_trace(core_link, LOG_NAME,
+				       "cable unsupported - using default serdes settings");
+
+	sl_media_lgrp_media_serdes_settings_get(core_link->core_lgrp->core_ldev->num,
+						core_link->core_lgrp->num, &core_link->serdes.media_serdes_settings);
+
+	core_link->serdes.core_serdes_settings.dfe          = SL_CORE_HW_SERDES_DFE_DISABLE;
+	core_link->serdes.core_serdes_settings.scramble_dis = SL_CORE_HW_SERDES_SCRAMBLE_DIS_SET;
+	core_link->serdes.core_serdes_settings.osr          = SL_CORE_HW_SERDES_OSR_OSX42P5;
+	core_link->serdes.core_serdes_settings.encoding     = SL_CORE_HW_SERDES_ENCODING_NRZ;
+	core_link->serdes.core_serdes_settings.clocking     = SL_CORE_HW_SERDES_CLOCKING_85;
+	core_link->serdes.core_serdes_settings.width        = SL_CORE_HW_SERDES_WIDTH_40;
+
+	switch (core_link->core_lgrp->config.furcation) {
+	case SL_MEDIA_FURCATION_X1:
+		core_link->serdes.lane_map = BIT(0);
+		break;
+	case SL_MEDIA_FURCATION_X2:
+		core_link->serdes.lane_map = BIT(0) << (core_link->num * 2);
+		break;
+	case SL_MEDIA_FURCATION_X4:
+		core_link->serdes.lane_map = BIT(core_link->num);
+		break;
+	default:
+		core_link->serdes.lane_map = 0;
+	}
+	core_link->serdes.lane_map <<= (4 * (core_link->core_lgrp->num & BIT(0)));
+	sl_core_log_dbg(core_link, LOG_NAME, "link up an settings (lane_map = 0x%02X)",
+			core_link->serdes.lane_map);
+
+	return 0;
+}
+
+int sl_core_hw_serdes_link_up_an(struct sl_core_link *core_link)
+{
+	int rtn;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_link->core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link up an");
+
+	rtn = sl_core_hw_serdes_link_up_an_settings(core_link);
+	if (rtn != 0) {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+		sl_core_log_err_trace(core_link, LOG_NAME, "serdes_link_up_an_settings failed [%d]", rtn);
+		return rtn;
+	}
+
+	rtn = sl_core_hw_serdes_core_pll(core_link->core_lgrp,
+					 core_link->serdes.core_serdes_settings.clocking, SL_CORE_HW_SERDES_TX_PLL_BW_DEFAULT);
+	if (rtn) {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_PLL_MAP);
+		sl_core_log_err_trace(core_link, LOG_NAME, "serdes_core_pll failed [%d]", rtn);
+		return -EIO;
+	}
+
+	rtn = sl_core_hw_serdes_lanes_up(core_link, SL_CORE_HW_SERDES_AUTONEG);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "serdes_lanes_up failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+static int sl_core_hw_serdes_link_up_settings(struct sl_core_link *core_link)
+{
+	struct sl_media_lgrp *media_lgrp;
+	u8		      cable_shift_state;
+	int		      rtn;
+
+	media_lgrp = sl_media_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"link up settings (config.flags = 0x%X, pcs_mode = %u, is_active = %s)",
+			core_link->config.flags, core_link->pcs.settings.pcs_mode,
+			sl_media_lgrp_media_type_is_active(media_lgrp->media_ldev->num, media_lgrp->num) ? "yes" : " no");
+
+	if (is_flag_set(core_link->core_lgrp->config.options, SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "link up settings loopback");
+		SL_CORE_HW_SERDES_LOOPBACK_SERDES_SETTINGS_SET(core_link);
+	} else {
+		sl_core_log_dbg(core_link, LOG_NAME, "link up settings normal");
+		sl_media_lgrp_media_serdes_settings_get(core_link->core_lgrp->core_ldev->num,
+							core_link->core_lgrp->num, &core_link->serdes.media_serdes_settings);
+	}
+
+	switch (core_link->pcs.settings.pcs_mode) {
+	case SL_CORE_HW_PCS_MODE_BJ_100G:
+		core_link->serdes.core_serdes_settings.encoding  = SL_CORE_HW_SERDES_ENCODING_NRZ;
+		core_link->serdes.core_serdes_settings.clocking  = SL_CORE_HW_SERDES_CLOCKING_82P5;
+		core_link->serdes.core_serdes_settings.width     = SL_CORE_HW_SERDES_WIDTH_40;
+		core_link->serdes.core_serdes_settings.osr       = SL_CORE_HW_SERDES_OSR_OSX2;
+		core_link->serdes.core_serdes_settings.tx_pll_bw = SL_CORE_HW_SERDES_TX_PLL_BW_DEFAULT;
+		break;
+	case SL_CORE_HW_PCS_MODE_CD_50G:
+	case SL_CORE_HW_PCS_MODE_CD_100G:
+	case SL_CORE_HW_PCS_MODE_BS_200G:
+		core_link->serdes.core_serdes_settings.encoding  = SL_CORE_HW_SERDES_ENCODING_PAM4_NR;
+		core_link->serdes.core_serdes_settings.clocking  = SL_CORE_HW_SERDES_CLOCKING_85;
+		core_link->serdes.core_serdes_settings.width     = SL_CORE_HW_SERDES_WIDTH_80;
+		core_link->serdes.core_serdes_settings.osr       = SL_CORE_HW_SERDES_OSR_OSX2;
+		core_link->serdes.core_serdes_settings.tx_pll_bw = SL_CORE_HW_SERDES_TX_PLL_BW_DEFAULT;
+		break;
+	case SL_CORE_HW_PCS_MODE_CK_100G:
+	case SL_CORE_HW_PCS_MODE_CK_200G:
+	case SL_CORE_HW_PCS_MODE_CK_400G:
+		core_link->serdes.core_serdes_settings.encoding  = SL_CORE_HW_SERDES_ENCODING_PAM4_NR;
+		core_link->serdes.core_serdes_settings.clocking  = SL_CORE_HW_SERDES_CLOCKING_85;
+		core_link->serdes.core_serdes_settings.width     = SL_CORE_HW_SERDES_WIDTH_160;
+		core_link->serdes.core_serdes_settings.osr       = SL_CORE_HW_SERDES_OSR_OSX1;
+		if (media_lgrp->cable_info->media_attr.type == SL_MEDIA_TYPE_AEC)
+			core_link->serdes.core_serdes_settings.tx_pll_bw = SL_CORE_HW_SERDES_TX_PLL_BW_100Glane_AEC;
+		else if (media_lgrp->cable_info->media_attr.type == SL_MEDIA_TYPE_AOC ||
+			 media_lgrp->cable_info->media_attr.type == SL_MEDIA_TYPE_POC)
+			core_link->serdes.core_serdes_settings.tx_pll_bw = SL_CORE_HW_SERDES_TX_PLL_BW_100Glane_AOC;
+		else
+			core_link->serdes.core_serdes_settings.tx_pll_bw = SL_CORE_HW_SERDES_TX_PLL_BW_DEFAULT;
+		break;
+	}
+
+	core_link->serdes.core_serdes_settings.dfe = SL_CORE_HW_SERDES_DFE_ENABLE;
+	rtn = sl_media_jack_cable_shift_state_get(media_lgrp->media_jack, &cable_shift_state);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME, "cable_shift_state_get failed [%d]", rtn);
+
+	if (cable_shift_state == SL_MEDIA_JACK_CABLE_SHIFT_STATE_DOWNSHIFTED)
+		core_link->serdes.core_serdes_settings.scramble_dis = SL_CORE_HW_SERDES_SCRAMBLE_DIS_SET;
+	else
+		core_link->serdes.core_serdes_settings.scramble_dis = SL_CORE_HW_SERDES_SCRAMBLE_DIS_NOTSET;
+
+	switch (core_link->core_lgrp->config.furcation) {
+	case SL_MEDIA_FURCATION_X1:
+		core_link->serdes.lane_map = (BIT(0) | BIT(1) | BIT(2) | BIT(3));
+		break;
+	case SL_MEDIA_FURCATION_X2:
+		core_link->serdes.lane_map = ((BIT(0) | BIT(1)) << (core_link->num * 2));
+		break;
+	case SL_MEDIA_FURCATION_X4:
+		core_link->serdes.lane_map = BIT(core_link->num);
+		break;
+	default:
+		core_link->serdes.lane_map = 0;
+	}
+	core_link->serdes.lane_map <<= (4 * (core_link->core_lgrp->num & BIT(0)));
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"link up settings (config.furcation = %u, lane_map = 0x%02X)",
+			core_link->core_lgrp->config.furcation, core_link->serdes.lane_map);
+
+	core_link->core_lgrp->serdes.eye_limits[0].low  = 15;
+	core_link->core_lgrp->serdes.eye_limits[0].high = 60;
+	core_link->core_lgrp->serdes.eye_limits[1].low  = 15;
+	core_link->core_lgrp->serdes.eye_limits[1].high = 60;
+	core_link->core_lgrp->serdes.eye_limits[2].low  = 15;
+	core_link->core_lgrp->serdes.eye_limits[2].high = 60;
+	core_link->core_lgrp->serdes.eye_limits[3].low  = 15;
+	core_link->core_lgrp->serdes.eye_limits[3].high = 60;
+	if (core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_BJ_100G) {
+		core_link->core_lgrp->serdes.eye_limits[0].low  = 25;
+		core_link->core_lgrp->serdes.eye_limits[0].high = 150;
+		core_link->core_lgrp->serdes.eye_limits[1].low  = 25;
+		core_link->core_lgrp->serdes.eye_limits[1].high = 150;
+		core_link->core_lgrp->serdes.eye_limits[2].low  = 25;
+		core_link->core_lgrp->serdes.eye_limits[2].high = 150;
+		core_link->core_lgrp->serdes.eye_limits[3].low  = 25;
+		core_link->core_lgrp->serdes.eye_limits[3].high = 150;
+	}
+
+	if (core_link->pcs.settings.pcs_mode == SL_CORE_HW_PCS_MODE_BS_200G &&
+	    sl_media_lgrp_media_type_is_active(media_lgrp->media_ldev->num, media_lgrp->num)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "link up settings 200G half rate");
+		core_link->serdes.media_serdes_settings.pre1   = 0;
+		core_link->serdes.media_serdes_settings.cursor = 80;
+		core_link->serdes.media_serdes_settings.post1  = 0;
+	}
+
+	/* test settings must be last */
+	if (core_link->serdes.use_test_settings) {
+		sl_core_log_warn(core_link, LOG_NAME, "link up settings test");
+		// media settings
+		core_link->serdes.media_serdes_settings.pre1        = core_link->serdes.test_settings.pre1;
+		core_link->serdes.media_serdes_settings.pre2        = core_link->serdes.test_settings.pre2;
+		core_link->serdes.media_serdes_settings.pre3        = core_link->serdes.test_settings.pre3;
+		core_link->serdes.media_serdes_settings.cursor      = core_link->serdes.test_settings.cursor;
+		core_link->serdes.media_serdes_settings.post1       = core_link->serdes.test_settings.post1;
+		core_link->serdes.media_serdes_settings.post2       = core_link->serdes.test_settings.post2;
+		core_link->serdes.media_serdes_settings.media       = core_link->serdes.test_settings.media;
+		// core settings
+		core_link->serdes.core_serdes_settings.osr          = core_link->serdes.test_settings.osr;
+		core_link->serdes.core_serdes_settings.encoding     = core_link->serdes.test_settings.encoding;
+		core_link->serdes.core_serdes_settings.clocking     = core_link->serdes.test_settings.clocking;
+		core_link->serdes.core_serdes_settings.width        = core_link->serdes.test_settings.width;
+		core_link->serdes.core_serdes_settings.dfe          = core_link->serdes.test_settings.dfe;
+		core_link->serdes.core_serdes_settings.scramble_dis = core_link->serdes.test_settings.scramble_dis;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"link up settings (pre1 = %d, pre2 = %d, pre3 = %d, cursor = %d, post1 = %d, post2 = %d, media = %d)",
+			core_link->serdes.test_settings.pre1, core_link->serdes.test_settings.pre2,
+			core_link->serdes.test_settings.pre3, core_link->serdes.test_settings.cursor,
+			core_link->serdes.test_settings.post1, core_link->serdes.test_settings.post2,
+			core_link->serdes.test_settings.media);
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"link up settings (osr = %u, encoding = %u, clocking = %u, width = %u, dfe = %u, scramble_dis = %u)",
+			core_link->serdes.test_settings.osr, core_link->serdes.test_settings.encoding,
+			core_link->serdes.test_settings.clocking, core_link->serdes.test_settings.width,
+			core_link->serdes.test_settings.dfe, core_link->serdes.test_settings.scramble_dis);
+
+	return 0;
+}
+
+int sl_core_hw_serdes_link_up(struct sl_core_link *core_link)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_link->core_lgrp->core_ldev))
+		return 0;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link up");
+
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_SERDES_START);
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	rtn = sl_core_hw_serdes_link_up_settings(core_link);
+	if (rtn != 0) {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_CONFIG_MAP);
+		sl_core_log_err_trace(core_link, LOG_NAME, "serdes_link_up_settings failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_core_data_lgrp_io_trace_set(core_link->core_lgrp,
+				       sl_ctrl_data_lgrp_is_serdes_lane_io_trace_enabled(ctrl_lgrp));
+
+	rtn = sl_core_hw_serdes_core_pll(core_link->core_lgrp,
+					 core_link->serdes.core_serdes_settings.clocking, core_link->serdes.core_serdes_settings.tx_pll_bw);
+	if (rtn) {
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_SERDES_PLL_MAP);
+		sl_core_log_err_trace(core_link, LOG_NAME, "serdes_core_pll failed [%d]", rtn);
+		sl_core_data_lgrp_io_trace_set(core_link->core_lgrp, false);
+		return -EIO;
+	}
+
+	rtn = sl_core_hw_serdes_lanes_up(core_link, SL_CORE_HW_SERDES_ATSPEED);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "serdes_lanes_up failed [%d]", rtn);
+		sl_core_data_lgrp_io_trace_set(core_link->core_lgrp, false);
+		return rtn;
+	}
+
+	sl_core_hw_serdes_state_set(core_link, SL_CORE_HW_SERDES_STATE_UP);
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_SERDES_START);
+	sl_core_data_link_info_map_set(core_link, SL_CORE_INFO_MAP_SERDES_OK);
+
+	sl_core_data_lgrp_io_trace_set(core_link->core_lgrp, false);
+	return 0;
+}
+
+static int sl_core_hw_serdes_link_down_settings(struct sl_core_link *core_link)
+{
+	sl_core_log_dbg(core_link, LOG_NAME, "link down settings");
+
+	switch (core_link->core_lgrp->config.furcation) {
+	case SL_MEDIA_FURCATION_X1:
+		core_link->serdes.lane_map = (BIT(0) | BIT(1) | BIT(2) | BIT(3));
+		break;
+	case SL_MEDIA_FURCATION_X2:
+		core_link->serdes.lane_map = ((BIT(0) | BIT(1)) << (core_link->num * 2));
+		break;
+	case SL_MEDIA_FURCATION_X4:
+		core_link->serdes.lane_map = BIT(core_link->num);
+		break;
+	}
+	core_link->serdes.lane_map <<= (4 * (core_link->core_lgrp->num & BIT(0)));
+	sl_core_log_dbg(core_link, LOG_NAME, "link down settings (lane_map = 0x%X)",
+			core_link->serdes.lane_map);
+
+	return 0;
+}
+
+void sl_core_hw_serdes_link_down(struct sl_core_link *core_link)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+
+	if (!SL_PLATFORM_IS_HARDWARE(core_link->core_lgrp->core_ldev))
+		return;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "link down");
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+
+	rtn = sl_core_hw_serdes_link_down_settings(core_link);
+	if (rtn)
+		sl_core_log_warn_trace(core_link, LOG_NAME, "serdes_link_down_settings failed [%d]", rtn);
+
+	sl_core_data_lgrp_io_trace_set(core_link->core_lgrp,
+				       sl_ctrl_data_lgrp_is_serdes_lane_io_trace_enabled(ctrl_lgrp));
+
+	sl_core_hw_serdes_lanes_down(core_link);
+
+	sl_core_data_lgrp_io_trace_set(core_link->core_lgrp, false);
+
+	memset(&(core_link->serdes.core_serdes_settings), 0, sizeof(struct sl_core_serdes_settings));
+	memset(&(core_link->serdes.media_serdes_settings), 0, sizeof(struct sl_media_serdes_settings));
+
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_SERDES_LOOPBACK_ON);
+	sl_core_hw_serdes_state_set(core_link, SL_CORE_HW_SERDES_STATE_DOWN);
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_SERDES_CHECK);
+	sl_core_data_link_info_map_clr(core_link, SL_CORE_INFO_MAP_SERDES_OK);
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_uc_ram.c b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_uc_ram.c
new file mode 100644
index 000000000000..22e4436c1da0
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_uc_ram.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_core_lgrp.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_sbus_pmi.h"
+#include "hw/sl_core_hw_pmi.h"
+#include "hw/sl_core_hw_uc_ram.h"
+#include "hw/sl_core_hw_serdes_addrs.h"
+
+#define LOG_NAME SL_CORE_HW_LOG_NAME
+
+int sl_core_hw_uc_ram_rd8(struct sl_core_lgrp *core_lgrp, u8 dev_addr,
+			  u8 dev_id, u8 lane_num, u32 addr, u8 *data)
+{
+	int  rtn;
+	u16  data16;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "uc ram rd");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, dev_addr, dev_id, lane_num, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0000, 0x2000); /* micro_autoinc_rdaddr_en */
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, dev_addr, dev_id, lane_num, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0000, 0x0030); /* micro_ra_rddatasize */
+	SL_CORE_HW_PMI_WR(core_lgrp, dev_id, lane_num, 0,
+			  addrs[SERDES_MICRO_A_COM_AHB_RDADDR_MSW], ((addr >> 16) & 0xFFFF), 0xFFFF); /* micro_ra_rdaddr_msw */
+	SL_CORE_HW_PMI_WR(core_lgrp, dev_id, lane_num, 0,
+			  addrs[SERDES_MICRO_A_COM_AHB_RDADDR_LSW], (addr & 0xFFFF), 0xFFFF); /* micro_ra_rdaddr_lsw */
+
+	/* rd data */
+	SL_CORE_HW_PMI_RD(core_lgrp, dev_id, lane_num, 0,
+			  addrs[SERDES_MICRO_A_COM_AHB_RDDATA_LSW], &data16); /* micro_ra_rddata_lsw */
+	*data = (data16 & 0x00FF);
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"uc ram rd8 (lane_num = %u, addr = 0x%08X, data = 0x%02X)",
+		lane_num, addr, *data);
+
+	rtn = 0;
+out:
+	return rtn;
+}
+
+int sl_core_hw_uc_ram_rd_blk(struct sl_core_lgrp *core_lgrp, u8 dev_addr,
+			     u8 dev_id, u32 start_addr, u8 rd_size, u8 *rd_buff)
+{
+	int  rtn;
+	u8   idx;
+	u16  data16;
+	u16 *addrs;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "uc ram rd blk");
+
+	addrs = core_lgrp->core_ldev->serdes.addrs;
+
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, dev_addr, dev_id, 0xFF, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x2000, 0x2000); /* micro_autoinc_rdaddr_en */
+	SL_CORE_HW_SBUS_PMI_WR(core_lgrp, dev_addr, dev_id, 0xFF, 0,
+			       addrs[SERDES_MICRO_A_COM_AHB_CONTROL0], 0x0010, 0x0030); /* micro_ra_rddatasize */
+	SL_CORE_HW_PMI_WR(core_lgrp, dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_A_COM_AHB_RDADDR_MSW], ((start_addr >> 16) & 0xFFFF), 0xFFFF); /* micro_ra_rdaddr_msw */
+	SL_CORE_HW_PMI_WR(core_lgrp, dev_id, 0xFF, 0,
+			  addrs[SERDES_MICRO_A_COM_AHB_RDADDR_LSW], (start_addr & 0xFFFE), 0xFFFF); /* micro_ra_rdaddr_lsw */
+
+	idx = 0;
+	while (rd_size > 0) {
+		SL_CORE_HW_PMI_RD(core_lgrp, dev_id, 0xFF, 0,
+				  addrs[SERDES_MICRO_A_COM_AHB_RDDATA_LSW], &data16); /* micro_ra_rddata_lsw */
+
+		rd_buff[idx] = (data16 & 0xFF);
+		rd_buff[idx + 1] = ((data16 >> 8) & 0xFF);
+		rd_size -= 2;
+		idx += 2;
+	}
+
+	rtn = 0;
+out:
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_ldev.c b/drivers/net/ethernet/hpe/sl/core/sl_core_ldev.c
new file mode 100644
index 000000000000..f5d92db587b4
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_ldev.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/workqueue.h>
+#include <linux/firmware.h>
+
+#include "sl_asic.h"
+#include "sl_module.h"
+#include "sl_core_ldev.h"
+#include "sl_core_lgrp.h"
+#include "data/sl_core_data_ldev.h"
+#include "hw/sl_core_hw_serdes.h"
+#include "hw/sl_core_hw_serdes_fw.h"
+#include "hw/sl_core_hw_serdes_core.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+
+#define LOG_NAME SL_CORE_LDEV_LOG_NAME
+
+int sl_core_ldev_new(u8 ldev_num, struct sl_accessors *accessors,
+		     struct sl_ops *ops, struct workqueue_struct *workqueue)
+{
+	return sl_core_data_ldev_new(ldev_num, accessors, ops, workqueue);
+}
+
+int sl_core_ldev_serdes_init(u8 ldev_num)
+{
+	int                  rtn;
+	int                  lgrp_num;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+	struct sl_core_ldev *core_ldev;
+
+	core_ldev = sl_core_ldev_get(ldev_num);
+	if (!core_ldev) {
+		sl_core_log_err(core_ldev, LOG_NAME,
+				"ldev invalid (ldev_num = %u)", ldev_num);
+		return -EIO;
+	}
+
+	sl_core_log_dbg(core_ldev, LOG_NAME, "serdes_init");
+
+	sl_core_ldev_serdes_is_ready_set(core_ldev, false);
+
+	rtn = request_firmware(&(core_ldev->serdes.fw), SL_HW_SERDES_FW_FILE, sl_device_get());
+	if (rtn) {
+		sl_core_log_err(core_ldev, LOG_NAME, "request_firmware failed [%d]", rtn);
+		return -EIO;
+	}
+
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+		sl_core_lgrp_put(core_lgrp);
+		core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+		if (!core_lgrp)
+			continue;
+		rtn = sl_core_hw_serdes_init(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_init (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+	}
+
+	/* setup for firmware load per serdes ip */
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; lgrp_num += 2) {
+		sl_core_lgrp_put(core_lgrp);
+		core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+		if (!core_lgrp) {
+			sl_core_lgrp_put(core_lgrp);
+			core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num + 1);
+			if (!core_lgrp)
+				continue;
+		}
+		rtn = sl_core_hw_serdes_fw_setup(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_fw_setup (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+	}
+
+	/* broadcast write the firmware to all serdes */
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; lgrp_num += 2) {
+		sl_core_lgrp_put(core_lgrp);
+		core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+		if (!core_lgrp)
+			continue;
+		rtn = sl_core_hw_serdes_fw_write(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_fw_write (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+		break;
+	}
+
+	/* finish firmware load and start the micros per serdes ip */
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; lgrp_num += 2) {
+		sl_core_lgrp_put(core_lgrp);
+		core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+		if (!core_lgrp) {
+			sl_core_lgrp_put(core_lgrp);
+			core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num + 1);
+			if (!core_lgrp)
+				continue;
+		}
+		rtn = sl_core_hw_serdes_fw_finish(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_fw_finish (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_fw_info_get(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_fw_info_get (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_hw_info_get(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_hw_info_get (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_core_init(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_core_init (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+		rtn = sl_core_hw_serdes_core_pll(core_lgrp,
+						 SL_CORE_HW_SERDES_CLOCKING_85, SL_CORE_HW_SERDES_TX_PLL_BW_DEFAULT);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_core_pll (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+	}
+
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+		sl_core_lgrp_put(core_lgrp);
+		core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+		if (!core_lgrp)
+			continue;
+		rtn = sl_core_hw_serdes_swizzles(core_lgrp);
+		if (rtn) {
+			sl_core_log_err(core_ldev, LOG_NAME,
+					"serdes_swizzles (lgrp_num = %u) failed [%d]", lgrp_num, rtn);
+			goto out;
+		}
+	}
+
+	sl_core_ldev_serdes_is_ready_set(core_ldev, true);
+
+	rtn = 0;
+out:
+	release_firmware(core_ldev->serdes.fw);
+
+	return rtn;
+}
+
+int sl_core_ldev_del(u8 ldev_num)
+{
+	return sl_core_data_ldev_del(ldev_num);
+}
+
+struct sl_core_ldev *sl_core_ldev_get(u8 ldev_num)
+{
+	return sl_core_data_ldev_get(ldev_num);
+}
+
+void sl_core_ldev_serdes_is_ready_set(struct sl_core_ldev *core_ldev, bool is_ready)
+{
+	sl_core_log_dbg(core_ldev, LOG_NAME,
+			"set is_ready to %s", is_ready ? "true" : "false");
+
+	spin_lock(&core_ldev->data_lock);
+	core_ldev->serdes.is_ready = is_ready;
+	spin_unlock(&core_ldev->data_lock);
+}
+
+bool sl_core_ldev_serdes_is_ready(struct sl_core_ldev *core_ldev)
+{
+	bool is_ready;
+
+	spin_lock(&core_ldev->data_lock);
+	is_ready = core_ldev->serdes.is_ready;
+	spin_unlock(&core_ldev->data_lock);
+
+	sl_core_log_dbg(core_ldev, LOG_NAME,
+			"is_ready = %s", is_ready ? "true" : "false");
+
+	return is_ready;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_lgrp.c b/drivers/net/ethernet/hpe/sl/core/sl_core_lgrp.c
new file mode 100644
index 000000000000..eff2625f5430
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_lgrp.c
@@ -0,0 +1,659 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+
+#include <linux/hpe/sl/sl_lgrp.h>
+
+#include "sl_core_lgrp.h"
+#include "data/sl_core_data_lgrp.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+
+#define LOG_NAME SL_CORE_LGRP_LOG_NAME
+
+int sl_core_lgrp_new(u8 ldev_num, u8 lgrp_num)
+{
+	return sl_core_data_lgrp_new(ldev_num, lgrp_num);
+}
+
+void sl_core_lgrp_connect_id_set(u8 ldev_num, u8 lgrp_num, const char *connect_id)
+{
+	sl_core_data_lgrp_connect_id_set(ldev_num, lgrp_num, connect_id);
+}
+
+int sl_core_lgrp_del(u8 ldev_num, u8 lgrp_num)
+{
+	return sl_core_data_lgrp_del(ldev_num, lgrp_num);
+}
+
+struct sl_core_lgrp *sl_core_lgrp_get(u8 ldev_num, u8 lgrp_num)
+{
+	return sl_core_data_lgrp_get(ldev_num, lgrp_num);
+}
+
+int sl_core_lgrp_hw_attr_set(u8 ldev_num, u8 lgrp_num, struct sl_hw_attr *hw_attr)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_lgrp)
+		return -EBADRQC;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "hw attr set");
+
+	spin_lock(&(core_lgrp->data_lock));
+	if (core_lgrp->is_configuring || core_lgrp->is_deleting) {
+		sl_core_log_err(core_lgrp, LOG_NAME, "hw attr set - lgrp is configuring");
+		spin_unlock(&(core_lgrp->data_lock));
+		return -EBADRQC;
+	}
+	core_lgrp->is_configuring = 1;
+	spin_unlock(&(core_lgrp->data_lock));
+
+	rtn = sl_core_data_lgrp_link_config_check(core_lgrp);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "hw attr set - core_data_lgrp_link_config_check failed [%d]", rtn);
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+	sl_core_data_lgrp_hw_attr_set(core_lgrp, hw_attr);
+
+	rtn = 0;
+
+out:
+	spin_lock(&(core_lgrp->data_lock));
+	core_lgrp->is_configuring = 0;
+	spin_unlock(&(core_lgrp->data_lock));
+
+	return rtn;
+}
+
+int sl_core_lgrp_config_set(u8 ldev_num, u8 lgrp_num, struct sl_lgrp_config *lgrp_config)
+{
+	int                  rtn;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_lgrp)
+		return -EBADRQC;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "config set");
+
+	spin_lock(&(core_lgrp->data_lock));
+	if (core_lgrp->is_configuring || core_lgrp->is_deleting) {
+		sl_core_log_err(core_lgrp, LOG_NAME, "config set - lgrp is configuring");
+		spin_unlock(&(core_lgrp->data_lock));
+		return -EBADRQC;
+	}
+	core_lgrp->is_configuring = 1;
+	spin_unlock(&(core_lgrp->data_lock));
+
+	rtn = sl_core_data_lgrp_link_config_check(core_lgrp);
+	if (rtn != 0) {
+		sl_core_log_err_trace(core_lgrp, LOG_NAME,
+				      "config set - core_data_lgrp_link_config_check failed [%d]", rtn);
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+	sl_core_data_lgrp_config_set(core_lgrp, lgrp_config);
+
+	rtn = 0;
+
+out:
+	spin_lock(&(core_lgrp->data_lock));
+	core_lgrp->is_configuring = 0;
+	spin_unlock(&(core_lgrp->data_lock));
+
+	return rtn;
+}
+
+int sl_core_lgrp_pre1_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *pre1)
+{
+	return sl_core_hw_serdes_lane_pre1_get(core_lgrp, asic_lane_num, pre1);
+}
+
+int sl_core_lgrp_pre2_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *pre2)
+{
+	return sl_core_hw_serdes_lane_pre2_get(core_lgrp, asic_lane_num, pre2);
+}
+
+int sl_core_lgrp_pre3_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *pre3)
+{
+	return sl_core_hw_serdes_lane_pre3_get(core_lgrp, asic_lane_num, pre3);
+}
+
+int sl_core_lgrp_cursor_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *cursor)
+{
+	return sl_core_hw_serdes_lane_cursor_get(core_lgrp, asic_lane_num, cursor);
+}
+
+int sl_core_lgrp_post1_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *post1)
+{
+	return sl_core_hw_serdes_lane_post1_get(core_lgrp, asic_lane_num, post1);
+}
+
+int sl_core_lgrp_post2_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, s16 *post2)
+{
+	return sl_core_hw_serdes_lane_post2_get(core_lgrp, asic_lane_num, post2);
+}
+
+int sl_core_lgrp_osr_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *osr)
+{
+	return sl_core_hw_serdes_lane_osr_get(core_lgrp, asic_lane_num, osr);
+}
+
+int sl_core_lgrp_encoding_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *encoding)
+{
+	return sl_core_hw_serdes_lane_encoding_get(core_lgrp, asic_lane_num, encoding);
+}
+
+int sl_core_lgrp_width_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *width)
+{
+	return sl_core_hw_serdes_lane_width_get(core_lgrp, asic_lane_num, width);
+}
+
+int sl_core_lgrp_dfe_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *dfe)
+{
+	return sl_core_hw_serdes_lane_dfe_get(core_lgrp, asic_lane_num, dfe);
+}
+
+int sl_core_lgrp_scramble_dis_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *scramble_dis)
+{
+	return sl_core_hw_serdes_lane_scramble_dis_get(core_lgrp, asic_lane_num, scramble_dis);
+}
+
+int sl_core_lgrp_eye_upper_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *eye_upper)
+{
+	return sl_core_hw_serdes_eye_upper_get(core_lgrp, asic_lane_num, eye_upper);
+}
+
+int sl_core_lgrp_eye_lower_get(struct sl_core_lgrp *core_lgrp, u8 asic_lane_num, u8 *eye_lower)
+{
+	return sl_core_hw_serdes_eye_lower_get(core_lgrp, asic_lane_num, eye_lower);
+}
+
+/* Shift media lane data based on the table below,
+ *
+ * | pgrp num | jack type | Swap Nibble |
+ * | -------- | --------- | ----------- |
+ * | even     | legacy    | no          |
+ * | even     | DD        | yes         |
+ * | odd      | legacy    | yes         |
+ * | odd      | DD        | no          |
+ */
+bool sl_core_lgrp_media_lane_data_swap(u8 ldev_num, u8 lgrp_num)
+{
+	u32                  jack_type;
+	bool                 swap;
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_lgrp)
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "media lane data swap");
+
+	if (PLATFORM_NIC) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME,
+				"media lane data swap - NIC platform, no swap");
+		return false;
+	}
+
+	jack_type    = core_lgrp->serdes.dt.jack_type;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME,
+			"media lane data swap (jack_type = %u)", jack_type);
+
+	if (jack_type == SL_DT_JACK_TYPE_EXAMAX_LEFT || jack_type == SL_DT_JACK_TYPE_EXAMAX_RIGHT ||
+	    jack_type == SL_DT_JACK_TYPE_LOW || jack_type == SL_DT_JACK_TYPE_HIGH) {
+		sl_core_log_dbg(core_lgrp, LOG_NAME, "media lane data swap (Examax jack - no shift)");
+		return false;
+	}
+
+	swap = (((core_lgrp->num & 1) && jack_type == SL_DT_JACK_TYPE_LEGACY) ||
+		(!(core_lgrp->num & 1) && jack_type == SL_DT_JACK_TYPE_DD));
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "media lane data swap (swap = %s)", swap ? "yes" : "no");
+
+	return swap;
+}
+
+u32 sl_core_lgrp_jack_part_get(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_core_lgrp *core_lgrp __free(sl_core_lgrp_put) = NULL;
+
+	core_lgrp = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!core_lgrp)
+		return 0;
+
+	sl_core_log_dbg(core_lgrp, LOG_NAME, "jack part get");
+
+	return core_lgrp->serdes.dt.jack_type;
+}
+
+int sl_core_lgrp_tx_lane_is_lol(u8 ldev_num, u8 lgrp_num, u8 asic_lane_num, bool *is_tx_lol)
+{
+	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) = NULL;
+	held_lgrp_1 = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!held_lgrp_1)
+		return -ENODEV;
+	return sl_core_hw_serdes_tx_lane_is_lol(held_lgrp_1, asic_lane_num, is_tx_lol);
+}
+
+int sl_core_lgrp_rx_lane_is_lol(u8 ldev_num, u8 lgrp_num, u8 asic_lane_num, bool *is_rx_lol)
+{
+	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) = NULL;
+	held_lgrp_1 = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!held_lgrp_1)
+		return -ENODEV;
+	return sl_core_hw_serdes_rx_lane_is_lol(held_lgrp_1, asic_lane_num, is_rx_lol);
+}
+
+int sl_core_lgrp_tx_lane_is_los(u8 ldev_num, u8 lgrp_num, u8 asic_lane_num, bool *is_tx_los)
+{
+	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) = NULL;
+	held_lgrp_1 = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!held_lgrp_1)
+		return -ENODEV;
+	return sl_core_hw_serdes_tx_lane_is_los(held_lgrp_1, asic_lane_num, is_tx_los);
+}
+
+int sl_core_lgrp_rx_lane_is_los(u8 ldev_num, u8 lgrp_num, u8 asic_lane_num, bool *is_rx_los)
+{
+	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) = NULL;
+	held_lgrp_1 = sl_core_lgrp_get(ldev_num, lgrp_num);
+	if (!held_lgrp_1)
+		return -ENODEV;
+	return sl_core_hw_serdes_rx_lane_is_los(held_lgrp_1, asic_lane_num, is_rx_los);
+}
+
+int sl_core_lgrp_pmi_rd_addr_get(struct sl_core_lgrp *core_lgrp, u16 *addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*addr = core_lgrp->pmi.rd.addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_rd_data_get(struct sl_core_lgrp *core_lgrp, u16 *data)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*data = core_lgrp->pmi.rd.data;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_rd_dev_id_get(struct sl_core_lgrp *core_lgrp, u8 *dev_id)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_id = core_lgrp->pmi.rd.dev_id;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_rd_lane_get(struct sl_core_lgrp *core_lgrp, u8 *lane)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*lane = core_lgrp->pmi.rd.lane;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_rd_pll_get(struct sl_core_lgrp *core_lgrp, u8 *pll)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*pll = core_lgrp->pmi.rd.pll;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_rd_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->pmi.rd.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_addr_get(struct sl_core_lgrp *core_lgrp, u16 *addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*addr = core_lgrp->pmi.wr.addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_data_get(struct sl_core_lgrp *core_lgrp, u16 *data)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*data = core_lgrp->pmi.wr.data;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_mask_get(struct sl_core_lgrp *core_lgrp, u16 *mask)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*mask = core_lgrp->pmi.wr.mask;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_dev_id_get(struct sl_core_lgrp *core_lgrp, u8 *dev_id)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_id = core_lgrp->pmi.wr.dev_id;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_lane_get(struct sl_core_lgrp *core_lgrp, u8 *lane)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*lane = core_lgrp->pmi.wr.lane;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_pll_get(struct sl_core_lgrp *core_lgrp, u8 *pll)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*pll = core_lgrp->pmi.wr.pll;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_pmi_wr_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->pmi.wr.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rd_dev_addr_get(struct sl_core_lgrp *core_lgrp, u8 *dev_addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_addr = core_lgrp->sbus.rd.dev_addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rd_data_get(struct sl_core_lgrp *core_lgrp, u32 *data)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*data = core_lgrp->sbus.rd.data;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rd_mask_get(struct sl_core_lgrp *core_lgrp, u32 *mask)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*mask = core_lgrp->sbus.rd.mask;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rd_reg_get(struct sl_core_lgrp *core_lgrp, u8 *reg)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*reg = core_lgrp->sbus.rd.reg;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rd_lsb_get(struct sl_core_lgrp *core_lgrp, u8 *lsb)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*lsb = core_lgrp->sbus.rd.lsb;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rd_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->sbus.rd.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_wr_dev_addr_get(struct sl_core_lgrp *core_lgrp, u8 *dev_addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_addr = core_lgrp->sbus.wr.dev_addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_wr_data_get(struct sl_core_lgrp *core_lgrp, u32 *data)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*data = core_lgrp->sbus.wr.data;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_wr_mask_get(struct sl_core_lgrp *core_lgrp, u32 *mask)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*mask = core_lgrp->sbus.wr.mask;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_wr_reg_get(struct sl_core_lgrp *core_lgrp, u8 *reg)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*reg = core_lgrp->sbus.wr.reg;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_wr_lsb_get(struct sl_core_lgrp *core_lgrp, u8 *lsb)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*lsb = core_lgrp->sbus.wr.lsb;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_wr_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->sbus.wr.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rst_dev_addr_get(struct sl_core_lgrp *core_lgrp, u8 *dev_addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_addr = core_lgrp->sbus.rst.dev_addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_rst_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->sbus.rst.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_dev_addr_get(struct sl_core_lgrp *core_lgrp, u8 *dev_addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_addr = core_lgrp->sbus_pmi.rd.dev_addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_addr_get(struct sl_core_lgrp *core_lgrp, u16 *addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*addr = core_lgrp->sbus_pmi.rd.addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_data_get(struct sl_core_lgrp *core_lgrp, u16 *data)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*data = core_lgrp->sbus_pmi.rd.data;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_mask_get(struct sl_core_lgrp *core_lgrp, u16 *mask)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*mask = core_lgrp->sbus_pmi.rd.mask;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_dev_id_get(struct sl_core_lgrp *core_lgrp, u8 *dev_id)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_id = core_lgrp->sbus_pmi.rd.dev_id;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_lane_get(struct sl_core_lgrp *core_lgrp, u8 *lane)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*lane = core_lgrp->sbus_pmi.rd.lane;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_pll_get(struct sl_core_lgrp *core_lgrp, u8 *pll)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*pll = core_lgrp->sbus_pmi.rd.pll;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_rd_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->sbus_pmi.rd.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_dev_addr_get(struct sl_core_lgrp *core_lgrp, u8 *dev_addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_addr = core_lgrp->sbus_pmi.wr.dev_addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_addr_get(struct sl_core_lgrp *core_lgrp, u16 *addr)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*addr = core_lgrp->sbus_pmi.wr.addr;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_data_get(struct sl_core_lgrp *core_lgrp, u16 *data)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*data = core_lgrp->sbus_pmi.wr.data;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_mask_get(struct sl_core_lgrp *core_lgrp, u16 *mask)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*mask = core_lgrp->sbus_pmi.wr.mask;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_dev_id_get(struct sl_core_lgrp *core_lgrp, u8 *dev_id)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*dev_id = core_lgrp->sbus_pmi.wr.dev_id;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_lane_get(struct sl_core_lgrp *core_lgrp, u8 *lane)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*lane = core_lgrp->sbus_pmi.wr.lane;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_pll_get(struct sl_core_lgrp *core_lgrp, u8 *pll)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*pll = core_lgrp->sbus_pmi.wr.pll;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
+
+int sl_core_lgrp_sbus_pmi_wr_result_get(struct sl_core_lgrp *core_lgrp, int *result)
+{
+	spin_lock(&core_lgrp->data_lock);
+	*result = core_lgrp->sbus_pmi.wr.result;
+	spin_unlock(&core_lgrp->data_lock);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_link.c b/drivers/net/ethernet/hpe/sl/core/sl_core_link.c
new file mode 100644
index 000000000000..7404d3b607fb
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_link.c
@@ -0,0 +1,623 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "base/sl_core_log.h"
+#include "data/sl_core_data_link.h"
+#include "data/sl_core_data_mac.h"
+#include "data/sl_core_data_llr.h"
+#include "hw/sl_core_hw_link.h"
+
+#define LOG_NAME SL_CORE_LINK_LOG_NAME
+
+int sl_core_link_new(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	return sl_core_data_link_new(ldev_num, lgrp_num, link_num);
+}
+
+int sl_core_link_del(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	return sl_core_data_link_del(ldev_num, lgrp_num, link_num);
+}
+
+struct sl_core_link *sl_core_link_get(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	return sl_core_data_link_get(ldev_num, lgrp_num, link_num);
+}
+
+void sl_core_link_put(struct sl_core_link *core_link)
+{
+	if (core_link)
+		sl_core_data_link_put_pinned(core_link);
+}
+
+struct sl_core_link *sl_core_link_get_pinned(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	return sl_core_data_link_get_pinned(ldev_num, lgrp_num, link_num);
+}
+
+void sl_core_link_put_pinned(struct sl_core_link *core_link)
+{
+	sl_core_data_link_put_pinned(core_link);
+}
+
+int sl_core_link_up(u8 ldev_num, u8 lgrp_num, u8 link_num,
+		    sl_core_link_up_callback_t callback, void *tag)
+{
+	enum sl_core_link_state link_state;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"up (link = 0x%p, flags = 0x%08X)", core_link, core_link->config.flags);
+
+	if (!sl_core_ldev_serdes_is_ready(core_link->core_lgrp->core_ldev)) {
+		sl_core_log_dbg(core_link, LOG_NAME, "up serdes isn't ready");
+		return -EIO;
+	}
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_AN:
+		sl_core_log_dbg(core_link, LOG_NAME, "up - already going up");
+		spin_unlock(&core_link->link.data_lock);
+		return 0;
+	case SL_CORE_LINK_STATE_UP:
+		sl_core_log_dbg(core_link, LOG_NAME, "up - already up");
+		spin_unlock(&core_link->link.data_lock);
+		return 0;
+	case SL_CORE_LINK_STATE_CONFIGURED:
+	case SL_CORE_LINK_STATE_DOWN:
+		sl_core_log_dbg(core_link, LOG_NAME, "up - going up");
+		core_link->link.state = is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_AUTONEG_ENABLE) ?
+			SL_CORE_LINK_STATE_AN : SL_CORE_LINK_STATE_GOING_UP;
+		link_state = core_link->link.state;
+		spin_unlock(&core_link->link.data_lock);
+		sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+		sl_core_hw_link_up_cmd(core_link, callback, tag);
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"up - invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_link_up_fail(struct sl_core_link *core_link)
+{
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "up fail");
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_CANCELING:
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		sl_core_log_dbg(core_link, LOG_NAME, "up fail - already going down");
+		spin_unlock(&core_link->link.data_lock);
+		return 0;
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_AN:
+		sl_core_log_dbg(core_link, LOG_NAME, "up fail - going down");
+		core_link->link.state = SL_CORE_LINK_STATE_GOING_DOWN;
+		queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_UP_FAIL]);
+		spin_unlock(&core_link->link.data_lock);
+		sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"up fail - invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_link_cancel(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			sl_core_link_down_callback_t callback, void *tag)
+{
+	enum sl_core_link_state link_state;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "cancel");
+
+	if (!callback) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "cancel - NULL callback");
+		return -EINVAL;
+	}
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_CANCELING:
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		sl_core_log_dbg(core_link, LOG_NAME, "cancel - already going down");
+		spin_unlock(&core_link->link.data_lock);
+		return 0;
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_AN:
+		sl_core_log_dbg(core_link, LOG_NAME, "canceling");
+		core_link->link.tags.down       = tag;
+		core_link->link.callbacks.down  = callback;
+		core_link->link.state           = SL_CORE_LINK_STATE_CANCELING;
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_data_link_last_up_fail_cause_map_set(core_link, SL_LINK_DOWN_CAUSE_CANCELED_MAP);
+		queue_work(core_link->core_lgrp->core_ldev->workqueue, &core_link->work[SL_CORE_WORK_LINK_UP_CANCEL]);
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"cancel - invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_link_down_request(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			      sl_core_link_down_callback_t callback, void *tag,
+			      u64 down_cause_map, bool *accepted)
+{
+	enum sl_core_link_state link_state;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	*accepted = false;
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "down");
+
+	if (!callback) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "down - NULL callback");
+		return -EINVAL;
+	}
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_CANCELING:
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		sl_core_log_dbg(core_link, LOG_NAME, "down - already going down");
+		spin_unlock(&core_link->link.data_lock);
+		return 0;
+	case SL_CORE_LINK_STATE_UP:
+		sl_core_log_dbg(core_link, LOG_NAME, "down - going down");
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_data_link_last_down_cause_map_set(core_link, down_cause_map);
+		spin_lock(&core_link->link.data_lock);
+		if (core_link->link.state != SL_CORE_LINK_STATE_UP) {
+			spin_unlock(&core_link->link.data_lock);
+			return 0;
+		}
+		core_link->link.tags.down      = tag;
+		core_link->link.callbacks.down = callback;
+		core_link->link.state          = SL_CORE_LINK_STATE_GOING_DOWN;
+		if (!queue_work(core_link->core_lgrp->core_ldev->workqueue,
+				&core_link->work[SL_CORE_WORK_LINK_DOWN])) {
+			core_link->link.state = SL_CORE_LINK_STATE_UP;
+			core_link->link.tags.down = NULL;
+			core_link->link.callbacks.down = NULL;
+			spin_unlock(&core_link->link.data_lock);
+			return -EBUSY;
+		}
+		*accepted = true;
+		spin_unlock(&core_link->link.data_lock);
+		sl_media_jack_led_set(core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num);
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"down - invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_link_down(u8 ldev_num, u8 lgrp_num, u8 link_num,
+		      sl_core_link_down_callback_t callback, void *tag, u64 down_cause_map)
+{
+	bool accepted;
+
+	return sl_core_link_down_request(ldev_num, lgrp_num, link_num, callback,
+					tag, down_cause_map, &accepted);
+}
+
+int sl_core_link_reset(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return 0;
+
+	sl_core_hw_reset_link(core_link);
+
+	return 0;
+}
+
+int sl_core_link_state_get(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			   enum sl_core_link_state *link_state)
+{
+	int                  rtn;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	rtn = sl_core_data_link_state_get(core_link, link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "state get - failed to get link state [%d]", rtn);
+		return rtn;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "state get (link_state = %u %s)",
+			*link_state, sl_core_link_state_str(*link_state));
+
+	return 0;
+}
+
+u64 sl_core_link_info_map_get(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	u64                  info_map;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return 0;
+
+	info_map = sl_core_data_link_info_map_get(core_link);
+
+	sl_core_log_dbg(core_link, LOG_NAME, "info map get (map = 0x%llX)", info_map);
+
+	return info_map;
+}
+
+int sl_core_info_map_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u64 *info_map)
+{
+	int                  rtn = 0;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_core_mac  *core_mac;
+	struct sl_core_llr  *core_llr;
+	u64                  llr_info_map;
+
+	BUILD_BUG_ON(SL_CORE_INFO_MAP_NUM_BITS >= 64);
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+	core_mac  = sl_core_mac_get(ldev_num, lgrp_num, link_num);
+
+	*info_map = sl_core_data_link_info_map_get(core_link);
+	if (core_mac)
+		*info_map |= sl_core_data_mac_info_map_get(core_mac);
+
+	core_llr  = sl_core_llr_get(ldev_num, lgrp_num, link_num);
+	if (!core_llr)
+		goto out;
+
+	rtn = sl_core_data_llr_info_map_get(core_llr, &llr_info_map);
+	if (rtn) {
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"info map get - llr info map get failed (rtn = %d)", rtn);
+		goto out;
+	}
+
+	*info_map |= llr_info_map;
+
+out:
+	sl_core_log_dbg(core_link, LOG_NAME, "info map get (map = 0x%llX)", *info_map);
+
+	return rtn;
+}
+
+int sl_core_link_config_set(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			    struct sl_core_link_config *link_config)
+{
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	enum sl_core_link_state link_state;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "config set");
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UNCONFIGURED:
+	case SL_CORE_LINK_STATE_CONFIGURED:
+	case SL_CORE_LINK_STATE_DOWN:
+		core_link->link.state = SL_CORE_LINK_STATE_CONFIGURING;
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_data_link_config_set(core_link, link_config);
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"config set invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return -EBADRQC;
+	}
+}
+
+bool sl_core_link_config_is_enable_ald_set(struct sl_core_link *core_link)
+{
+	bool is_config_set;
+
+	spin_lock(&core_link->serdes.data_lock);
+	is_config_set = is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_ALD_ENABLE);
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return is_config_set;
+}
+
+bool sl_core_link_is_degrade_state_active(struct sl_core_link *core_link)
+{
+	u32 degrade_state;
+
+	spin_lock(&core_link->data_lock);
+	degrade_state = core_link->degrade_state;
+	spin_unlock(&core_link->data_lock);
+
+	return degrade_state == SL_LINK_DEGRADE_STATE_ACTIVE;
+}
+
+bool sl_core_link_config_is_enable_pml_recovery_set(struct sl_core_link *core_link)
+{
+	bool is_config_set;
+
+	spin_lock(&core_link->serdes.data_lock);
+	is_config_set = is_flag_set(core_link->config.flags, SL_LINK_CONFIG_OPT_PML_REC_ENABLE);
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return is_config_set;
+}
+
+bool sl_core_link_is_pml_recovery_running(struct sl_core_link *core_link)
+{
+	if (atomic_read(&core_link->pml_rec.pml_rec_running) == 1) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "pml recovery already running");
+		return true;
+	}
+
+	return false;
+}
+
+const char *sl_core_link_pml_rec_down_cause_str(u8 down_cause)
+{
+	switch (down_cause) {
+	case PML_REC_DOWN_CAUSE_INVALID:
+		return "invalid";
+	case PML_REC_DOWN_CAUSE_LINK_DOWN:
+		return "link-down";
+	case PML_REC_DOWN_CAUSE_LOCAL_FAULT:
+		return "local-fault";
+	case PML_REC_DOWN_CAUSE_REMOTE_FAULT:
+		return "remote-fault";
+	default:
+		return "unknown";
+	}
+}
+
+int sl_core_link_policy_set(u8 ldev_num, u8 lgrp_num, u8 link_num, struct sl_core_link_policy *link_policy)
+{
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "policy set");
+
+	spin_lock(&core_link->link.data_lock);
+	core_link->policy = *link_policy;
+	spin_unlock(&core_link->link.data_lock);
+
+	return 0;
+}
+
+int sl_core_link_caps_get(u8 ldev_num, u8 lgrp_num, u8 link_num, struct sl_link_caps *link_caps)
+{
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "caps get");
+
+	*link_caps = core_link->core_lgrp->link_caps[core_link->num];
+
+	return 0;
+}
+
+int sl_core_link_is_canceled_or_timed_out(struct sl_core_link *core_link, bool *is_canceled_or_timed_out)
+{
+	int  rtn;
+	u32  state;
+
+	rtn = sl_core_data_link_state_get(core_link, &state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "is canceled or timed out - failed to get link state [%d]", rtn);
+		return rtn;
+	}
+
+	sl_core_log_dbg(core_link, LOG_NAME, "is_canceled_or_timed_out (state %u %s)",
+			state, sl_core_link_state_str(state));
+
+	*is_canceled_or_timed_out = ((state == SL_CORE_LINK_STATE_CANCELING) || (state == SL_CORE_LINK_STATE_TIMEOUT));
+
+	sl_core_log_dbg(core_link, LOG_NAME, "get (is_canceled_or_timed_out = %s)",
+			*is_canceled_or_timed_out ? "true" : "false");
+
+	return 0;
+}
+
+int sl_core_link_speed_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u32 *link_speed)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_data_link_speed_get(held_link_1, link_speed);
+}
+
+int sl_core_link_clocking_get(struct sl_core_link *core_link, u16 *clocking)
+{
+	*clocking = sl_core_data_link_clocking_get(core_link);
+
+	return 0;
+}
+
+int sl_core_link_last_down_cause_map_info_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u8 entry_num,
+					      u64 *down_cause_map, time64_t *down_time)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_data_link_last_down_cause_map_info_get(held_link_1,
+							      entry_num, down_cause_map, down_time);
+}
+
+void sl_core_link_last_up_fail_cause_map_set(u8 ldev_num, u8 lgrp_num, u8 link_num, u64 up_fail_cause_map)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return;
+	sl_core_data_link_last_up_fail_cause_map_set(held_link_1,
+						     up_fail_cause_map);
+}
+
+int  sl_core_link_last_up_fail_cause_map_info_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u8 entry_num,
+						  u64 *up_fail_cause_map, time64_t *up_fail_time)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_data_link_last_up_fail_cause_map_info_get(held_link_1,
+						 entry_num, up_fail_cause_map, up_fail_time);
+}
+
+int sl_core_link_ucw_warn_limit_crossed_get(u8 ldev_num, u8 lgrp_num, u8 link_num, bool *is_limit_crossed,
+					    time64_t *limit_crossed_time)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_data_link_ucw_warn_limit_crossed_get(held_link_1,
+							    is_limit_crossed, limit_crossed_time);
+}
+
+void sl_core_link_ucw_warn_limit_crossed_set(u8 ldev_num, u8 lgrp_num, u8 link_num, bool is_limit_crossed)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return;
+	sl_core_data_link_ucw_warn_limit_crossed_set(held_link_1, is_limit_crossed);
+}
+
+int sl_core_link_ccw_warn_limit_crossed_get(u8 ldev_num, u8 lgrp_num, u8 link_num, bool *is_limit_crossed,
+					    time64_t *limit_crossed_time)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_data_link_ccw_warn_limit_crossed_get(held_link_1,
+							    is_limit_crossed, limit_crossed_time);
+}
+
+void sl_core_link_ccw_warn_limit_crossed_set(u8 ldev_num, u8 lgrp_num, u8 link_num, bool is_limit_crossed)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return;
+	sl_core_data_link_ccw_warn_limit_crossed_set(held_link_1, is_limit_crossed);
+}
+
+bool sl_core_link_policy_is_keep_serdes_up_set(struct sl_core_link *core_link)
+{
+	bool is_policy_set;
+
+	spin_lock(&core_link->serdes.data_lock);
+	is_policy_set = (core_link->policy.options & SL_LINK_POLICY_OPT_KEEP_SERDES_UP) != 0;
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return is_policy_set;
+}
+
+bool sl_core_link_policy_is_use_unsupported_cable_set(struct sl_core_link *core_link)
+{
+	bool is_policy_set;
+
+	spin_lock(&core_link->serdes.data_lock);
+	is_policy_set = is_flag_set(core_link->policy.options, SL_LINK_POLICY_OPT_USE_UNSUPPORTED_CABLE);
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return is_policy_set;
+}
+
+bool sl_core_link_policy_is_use_supported_ss200_cable_set(struct sl_core_link *core_link)
+{
+	bool is_policy_set;
+
+	spin_lock(&core_link->serdes.data_lock);
+	is_policy_set = is_flag_set(core_link->policy.options, SL_LINK_POLICY_OPT_USE_SUPPORTED_SS200_CABLE);
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return is_policy_set;
+}
+
+bool sl_core_link_policy_is_ignore_media_errors_set(struct sl_core_link *core_link)
+{
+	bool is_policy_set;
+
+	spin_lock(&core_link->serdes.data_lock);
+	is_policy_set = is_flag_set(core_link->policy.options, SL_LINK_POLICY_OPT_IGNORE_MEDIA_ERROR);
+	spin_unlock(&core_link->serdes.data_lock);
+
+	return is_policy_set;
+}
+
+struct sl_core_link_up_info *sl_core_link_up_info_get(struct sl_core_link *core_link,
+						      struct sl_core_link_up_info *link_up_info)
+{
+	spin_lock(&core_link->link.data_lock);
+	link_up_info->state     = core_link->link.state;
+	link_up_info->info_map  = core_link->info_map;
+	link_up_info->speed     = core_link->pcs.settings.speed;
+	link_up_info->fec_mode  = core_link->fec.settings.mode;
+	link_up_info->fec_type  = core_link->fec.settings.type;
+	spin_unlock(&core_link->link.data_lock);
+	link_up_info->cause_map = sl_core_data_link_last_up_fail_cause_map_get(core_link);
+
+	return link_up_info;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_link_an.c b/drivers/net/ethernet/hpe/sl/core/sl_core_link_an.c
new file mode 100644
index 000000000000..eb69fd41d10a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_link_an.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+#include "data/sl_core_data_link.h"
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "base/sl_core_log.h"
+#include "data/sl_core_data_link.h"
+#include "hw/sl_core_hw_an_lp.h"
+#include "hw/sl_core_hw_an.h"
+
+#define LOG_NAME SL_CORE_LINK_AN_LOG_NAME
+
+int sl_core_link_an_lp_caps_get(u8 ldev_num, u8 lgrp_num, u8 link_num,
+				sl_core_link_an_callback_t callback, void *tag, struct sl_link_caps *caps,
+	u32 timeout_ms, u32 flags)
+{
+	enum sl_core_link_state link_state;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps get");
+
+	spin_lock(&core_link->link.data_lock);
+	link_state = core_link->link.state;
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UNCONFIGURED:
+	case SL_CORE_LINK_STATE_CONFIGURED:
+	case SL_CORE_LINK_STATE_DOWN:
+		core_link->link.state = SL_CORE_LINK_STATE_AN;
+		spin_unlock(&core_link->link.data_lock);
+		sl_core_hw_an_lp_caps_get_cmd(core_link, link_state, callback, tag, caps, timeout_ms, flags);
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"lp caps get - invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		spin_unlock(&core_link->link.data_lock);
+		return -EBADRQC;
+	}
+}
+
+u32 sl_core_link_an_lp_caps_state_get(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return 0;
+	return sl_core_data_link_an_lp_caps_state_get(held_link_1);
+}
+
+int sl_core_link_an_lp_caps_stop(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                  rtn;
+	enum sl_core_link_state link_state;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "lp caps stop");
+
+	rtn = sl_core_data_link_state_get(core_link, &link_state);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "lp caps stop - failed to get link state [%d]", rtn);
+		return rtn;
+	}
+
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UNCONFIGURED:
+	case SL_CORE_LINK_STATE_CONFIGURED:
+	case SL_CORE_LINK_STATE_DOWN:
+		return 0;
+	case SL_CORE_LINK_STATE_AN:
+		sl_core_hw_an_lp_caps_stop_cmd(core_link);
+		return 0;
+	case SL_CORE_LINK_STATE_UP:
+		sl_core_log_dbg(core_link, LOG_NAME, "lp caps stop - link is up");
+		return 0;
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		sl_core_log_dbg(core_link, LOG_NAME, "lp caps stop - in transition");
+		return 0;
+	default:
+		sl_core_log_err(core_link, LOG_NAME,
+				"lp caps stop - invalid (link_state = %u %s)",
+			link_state, sl_core_link_state_str(link_state));
+		return -EBADRQC;
+	}
+}
+
+int sl_core_link_an_fail_cause_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u32 *fail_cause, time64_t *fail_time)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_data_link_an_fail_cause_get(held_link_1, fail_cause, fail_time);
+}
+
+u32 sl_core_link_an_retry_count_get(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return 0;
+	return sl_core_data_link_an_retry_count_get(held_link_1);
+}
+
+const char *sl_core_link_an_fail_cause_str(u32 fail_cause)
+{
+	switch (fail_cause) {
+	case SL_CORE_HW_AN_FAIL_CAUSE_LP_CAPS_SERDES_LINK_UP_FAIL:
+		return "lp-caps-serdes-link-up-fail";
+	case SL_CORE_HW_AN_FAIL_CAUSE_LP_CAPS_NOT_COMPLETE:
+		return "lp-caps-not-complete";
+	case SL_CORE_HW_AN_FAIL_CAUSE_NOT_COMPLETE:
+		return "not-complete";
+	case SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_FAIL:
+		return "pages-decode-fail";
+	case SL_CORE_HW_AN_FAIL_CAUSE_TEST_CAPS_NOMATCH:
+		return "test-caps-nomatch";
+	case SL_CORE_HW_AN_FAIL_CAUSE_SERDES_LINK_UP_FAIL:
+		return "serdes-link-up-fail";
+	case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_STATE_BAD:
+		return "bp-store-state-bad";
+	case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_LP_ABILITY_NOT_SET:
+		return "bp-store-lp-ability-not-set";
+	case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_STATE_ERROR:
+		return "bp-store-state-error";
+	case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_BP_NOT_SET:
+		return "bp-store-bp-not-set";
+	case SL_CORE_HW_AN_FAIL_CAUSE_BP_SEND_INTR_ENABLE_FAIL:
+		return "bp-send-intr-enable-fail";
+	case SL_CORE_HW_AN_FAIL_CAUSE_NP_STORE_STATE_BAD:
+		return "np-store-state-bad";
+	case SL_CORE_HW_AN_FAIL_CAUSE_NP_STORE_BP_SET:
+		return "np-store-bp-set";
+	case SL_CORE_HW_AN_FAIL_CAUSE_NP_CHECK_STATE_BAD:
+		return "np-check-state-bad";
+	case SL_CORE_HW_AN_FAIL_CAUSE_INTR_STATE_INVALID:
+		return "intr-state-invalid";
+	case SL_CORE_HW_AN_FAIL_CAUSE_INTR_AN_RETRY_NP_SEND_FAIL:
+		return "intr-an-retry-np-send-fail";
+	case SL_CORE_HW_AN_FAIL_CAUSE_INTR_OUT_OF_PAGES:
+		return "intr-out-of-pages";
+	case SL_CORE_HW_AN_FAIL_CAUSE_INTR_NP_SEND_FAIL:
+		return "intr-np-send-fail";
+	case SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_NO_BP:
+		return "pages-decode-no-bp";
+	case SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_OUI_INVALID:
+		return "pages-decode-oui-invalid";
+	default:
+		return "unknown";
+	}
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_link_fec.c b/drivers/net/ethernet/hpe/sl/core/sl_core_link_fec.c
new file mode 100644
index 000000000000..ed238cf830d0
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_link_fec.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include "sl_core_link.h"
+#include "sl_core_str.h"
+#include "base/sl_core_log.h"
+#include "hw/sl_core_hw_fec.h"
+
+#define LOG_NAME SL_CORE_LINK_FEC_LOG_NAME
+
+static int sl_core_link_fec_cw_cntrs_get(struct sl_core_link *core_link,
+					 struct sl_core_link_fec_cw_cntrs *cw_cntrs)
+{
+	int rtn;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_cw_cntrs_get");
+
+	spin_lock(&core_link->data_lock);
+	link_state = core_link->link.state;
+	spin_unlock(&core_link->data_lock);
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UP:
+		rtn = sl_core_hw_fec_cw_cntrs_get(core_link, cw_cntrs);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fec_cw_cntrs_get failed (link_state = %u %s) [%d]",
+					      link_state, sl_core_link_state_str(link_state), rtn);
+			return rtn;
+		}
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"fec_cw_cntrs_get (ccw = %llu, ucw = %llu, gcw = %llu)",
+				cw_cntrs->ccw, cw_cntrs->ucw, cw_cntrs->gcw);
+		return 0;
+	default:
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "fec_cw_cntrs_get incorrect state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return -ENOLINK;
+	}
+}
+
+static int sl_core_link_fec_lane_cntrs_get(struct sl_core_link *core_link,
+					   struct sl_core_link_fec_lane_cntrs *lane_cntrs)
+{
+	int rtn;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_lane_cntrs_get");
+
+	spin_lock(&core_link->data_lock);
+	link_state = core_link->link.state;
+	spin_unlock(&core_link->data_lock);
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UP:
+		rtn = sl_core_hw_fec_lane_cntrs_get(core_link, lane_cntrs);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fec_lane_cntrs_get failed (link_state = %u %s) [%d]",
+					      link_state, sl_core_link_state_str(link_state), rtn);
+			return rtn;
+		}
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"fec_lane_cntrs_get (lane0 = %llu, lane1 = %llu, lane2 = %llu, lane3 = %llu)",
+				lane_cntrs->lanes[0], lane_cntrs->lanes[1],
+				lane_cntrs->lanes[2], lane_cntrs->lanes[3]);
+		return 0;
+	default:
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "fec_lane_cntrs_get incorrect state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return -ENOLINK;
+	}
+}
+
+static int sl_core_link_fec_tail_cntrs_get(struct sl_core_link *core_link,
+					   struct sl_core_link_fec_tail_cntrs *tail_cntrs)
+{
+	int rtn;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_tail_cntrs_get");
+
+	spin_lock(&core_link->data_lock);
+	link_state = core_link->link.state;
+	spin_unlock(&core_link->data_lock);
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UP:
+		rtn = sl_core_hw_fec_tail_cntrs_get(core_link, tail_cntrs);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fec_tail_cntrs_get failed (link_state = %u %s) [%d]",
+					      link_state, sl_core_link_state_str(link_state), rtn);
+			return rtn;
+		}
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"fec_tail_cntrs_get (ccw_bin0 = %llu, ccw_bin1 = %llu, ccw_bin2 = %llu, ccw_bin3 = %llu)",
+				tail_cntrs->ccw_bins[0], tail_cntrs->ccw_bins[1],
+				tail_cntrs->ccw_bins[2], tail_cntrs->ccw_bins[3]);
+		sl_core_log_dbg(core_link, LOG_NAME,
+				"fec_tail_cntrs_get (ccw_bin4 = %llu, ccw_bin5 = %llu, ccw_bin6 = %llu, ccw_bin7 = %llu)",
+				tail_cntrs->ccw_bins[4], tail_cntrs->ccw_bins[5],
+				tail_cntrs->ccw_bins[6], tail_cntrs->ccw_bins[7]);
+		return 0;
+	default:
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "fec_tail_cntrs_get incorrect state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return -ENOLINK;
+	}
+}
+
+int sl_core_link_fec_ccw_get(struct sl_core_link *core_link, u64 *ccw)
+{
+	int                              rtn;
+	struct sl_core_link_fec_cw_cntrs cw_cntrs;
+
+	rtn = sl_core_link_fec_cw_cntrs_get(core_link, &cw_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "fec_ccw_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*ccw = cw_cntrs.ccw;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_ccw_get (ccw = %llu)", *ccw);
+
+	return 0;
+}
+
+int sl_core_link_fec_ucw_get(struct sl_core_link *core_link, u64 *ucw)
+{
+	int                              rtn;
+	struct sl_core_link_fec_cw_cntrs cw_cntrs;
+
+	rtn = sl_core_link_fec_cw_cntrs_get(core_link, &cw_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "fec_ucw_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*ucw = cw_cntrs.ucw;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_ucw_get (ucw = %llu)", *ucw);
+
+	return 0;
+}
+
+int sl_core_link_fec_gcw_get(struct sl_core_link *core_link, u64 *gcw)
+{
+	int                              rtn;
+	struct sl_core_link_fec_cw_cntrs cw_cntrs;
+
+	rtn = sl_core_link_fec_cw_cntrs_get(core_link, &cw_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "fec_gcw_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*gcw = cw_cntrs.gcw;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_gcw_get (gcw = %llu)", *gcw);
+
+	return 0;
+}
+
+int sl_core_link_fec_lane_cntr_get(struct sl_core_link *core_link, u8 lane_num, u64 *lane_cntr)
+{
+	int                                rtn;
+	struct sl_core_link_fec_lane_cntrs lane_cntrs;
+
+	rtn = sl_core_link_fec_lane_cntrs_get(core_link, &lane_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "fec_lane_cntr_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*lane_cntr = lane_cntrs.lanes[lane_num];
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_lane_cntr_get (lane %u = %llu)", lane_num, *lane_cntr);
+
+	return 0;
+}
+
+int sl_core_link_fec_tail_cntr_get(struct sl_core_link *core_link, u8 tail_cntr_num, u64 *tail_cntr)
+{
+	int                               rtn;
+	struct sl_core_link_fec_tail_cntrs tail_cntrs;
+
+	rtn = sl_core_link_fec_tail_cntrs_get(core_link, &tail_cntrs);
+	if (rtn) {
+		sl_core_log_err_trace(core_link, LOG_NAME, "fec_tail_cntr_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	*tail_cntr = tail_cntrs.ccw_bins[tail_cntr_num];
+
+	sl_core_log_dbg(core_link, LOG_NAME,
+			"fec_tail_cntr_get (tail_cntr %u = %llu)", tail_cntr_num, *tail_cntr);
+
+	return 0;
+}
+
+int sl_core_link_fec_data_get(struct sl_core_link *core_link,
+			      struct sl_core_link_fec_cw_cntrs *cw_cntrs,
+			      struct sl_core_link_fec_lane_cntrs *lane_cntrs,
+			      struct sl_core_link_fec_tail_cntrs *tail_cntr)
+{
+	int rtn;
+	enum sl_core_link_state link_state;
+
+	sl_core_log_dbg(core_link, LOG_NAME, "fec_data_get");
+
+	spin_lock(&core_link->data_lock);
+	link_state = core_link->link.state;
+	spin_unlock(&core_link->data_lock);
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UP:
+		rtn = sl_core_hw_fec_data_get(core_link, cw_cntrs, lane_cntrs, tail_cntr);
+		if (rtn) {
+			sl_core_log_err_trace(core_link, LOG_NAME,
+					      "fec_data_get failed (link_state = %u %s) [%d]",
+					      link_state, sl_core_link_state_str(link_state), rtn);
+			return rtn;
+		}
+		return 0;
+	default:
+		sl_core_log_err_trace(core_link, LOG_NAME,
+				      "fec_data_get incorrect state (link_state = %u %s)",
+				      link_state, sl_core_link_state_str(link_state));
+		return -ENOLINK;
+	}
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_llr.c b/drivers/net/ethernet/hpe/sl/core/sl_core_llr.c
new file mode 100644
index 000000000000..a099770cb8e6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_llr.c
@@ -0,0 +1,350 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025,2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_llr.h"
+#include "sl_core_str.h"
+#include "data/sl_core_data_llr.h"
+#include "hw/sl_core_hw_llr.h"
+
+#define LOG_NAME SL_CORE_LLR_LOG_NAME
+
+int sl_core_llr_new(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	return sl_core_data_llr_new(ldev_num, lgrp_num, llr_num);
+}
+
+void sl_core_llr_del(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	sl_core_data_llr_del(ldev_num, lgrp_num, llr_num);
+}
+
+struct sl_core_llr *sl_core_llr_get(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	return sl_core_data_llr_get(ldev_num, lgrp_num, llr_num);
+}
+
+int sl_core_llr_config_set(u8 ldev_num, u8 lgrp_num, u8 llr_num, struct sl_llr_config *llr_config)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+	enum sl_core_llr_state llr_state;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "config set");
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_NEW:
+	case SL_CORE_LLR_STATE_CONFIGURED:
+		rtn = sl_core_data_llr_config_set(core_llr, llr_config);
+		if (rtn) {
+			sl_core_log_err_trace(core_llr, LOG_NAME, "config set - llr_config_set failed [%d]", rtn);
+			spin_unlock(&core_llr->data_lock);
+			return rtn;
+		}
+		core_llr->state = SL_CORE_LLR_STATE_CONFIGURED;
+		spin_unlock(&core_llr->data_lock);
+		return 0;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME, "config set - invalid (llr_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_llr_policy_set(u8 ldev_num, u8 lgrp_num, u8 llr_num, struct sl_llr_policy *llr_policy)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "policy set");
+
+	rtn = sl_core_data_llr_policy_set(core_llr, llr_policy);
+	if (rtn) {
+		sl_core_log_err_trace(core_llr, LOG_NAME, "policy set - llr_policy_set failed [%d]", rtn);
+		return rtn;
+	}
+	return 0;
+}
+
+int sl_core_llr_policy_get(u8 ldev_num, u8 lgrp_num, u8 llr_num, struct sl_llr_policy *llr_policy)
+{
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "policy get");
+
+	return sl_core_data_llr_policy_get(core_llr, llr_policy);
+}
+
+int sl_core_llr_setup(u8 ldev_num, u8 lgrp_num, u8 llr_num,
+		      sl_core_llr_setup_callback_t callback, void *tag, u32 flags)
+{
+	int                 rtn;
+	enum sl_core_llr_state llr_state;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "setup");
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETUP:
+		sl_core_log_dbg(core_llr, LOG_NAME, "setup - already setup");
+		spin_unlock(&core_llr->data_lock);
+		return -EALREADY;
+	case SL_CORE_LLR_STATE_CONFIGURED:
+		sl_core_log_dbg(core_llr, LOG_NAME, "setup - in configured");
+		core_llr->state = SL_CORE_LLR_STATE_SETTING_UP;
+		spin_unlock(&core_llr->data_lock);
+		rtn = sl_core_data_llr_settings(core_llr);
+		if (rtn) {
+			sl_core_log_err_trace(core_llr, LOG_NAME,
+					      "setup - llr_settings failed [%d]", rtn);
+			return -EBADRQC;
+		}
+		sl_core_hw_llr_setup_cmd(core_llr, callback, tag, flags);
+		return 0;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME,
+				"setup - invalid (llr_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_llr_start(u8 ldev_num, u8 lgrp_num, u8 llr_num,
+		      sl_core_llr_start_callback_t callback, void *tag, u32 flags)
+{
+	enum sl_core_llr_state llr_state;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "start");
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_RUNNING:
+		sl_core_log_dbg(core_llr, LOG_NAME, "start - already started");
+		spin_unlock(&core_llr->data_lock);
+		return -EALREADY;
+	case SL_CORE_LLR_STATE_SETUP:
+		sl_core_log_dbg(core_llr, LOG_NAME, "start - in setup");
+		core_llr->state = SL_CORE_LLR_STATE_STARTING;
+		spin_unlock(&core_llr->data_lock);
+		sl_core_hw_llr_start_cmd(core_llr, callback, tag, flags);
+		return 0;
+	default:
+		sl_core_log_err(core_llr, LOG_NAME,
+				"start - invalid (llr_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_llr_stop(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	enum sl_core_llr_state llr_state;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!core_llr)
+		return 0;
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	sl_core_log_dbg(core_llr, LOG_NAME, "stop (state = %u)", core_llr->state);
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_NEW:
+	case SL_CORE_LLR_STATE_CONFIGURED:
+		sl_core_log_dbg(core_llr, LOG_NAME, "stop - already off");
+		spin_unlock(&core_llr->data_lock);
+		return 0;
+	case SL_CORE_LLR_STATE_SETTING_UP:
+		sl_core_log_dbg(core_llr, LOG_NAME, "stop - cancel setting up");
+		core_llr->state = SL_CORE_LLR_STATE_SETUP_CANCELING;
+		spin_unlock(&core_llr->data_lock);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_CANCELED);
+		sl_core_hw_llr_settingup_cancel_cmd(core_llr);
+		return 0;
+	case SL_CORE_LLR_STATE_SETUP:
+		sl_core_log_dbg(core_llr, LOG_NAME, "stop - in setup");
+		core_llr->state = SL_CORE_LLR_STATE_SETUP_STOPPING;
+		spin_unlock(&core_llr->data_lock);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_COMMAND);
+		sl_core_hw_llr_setup_stop_cmd(core_llr);
+		return 0;
+	case SL_CORE_LLR_STATE_STARTING:
+		sl_core_log_dbg(core_llr, LOG_NAME, "stop - cancel starting");
+		core_llr->state = SL_CORE_LLR_STATE_START_CANCELING;
+		spin_unlock(&core_llr->data_lock);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_CANCELED);
+		sl_core_hw_llr_starting_cancel_cmd(core_llr);
+		return 0;
+	case SL_CORE_LLR_STATE_RUNNING:
+		sl_core_log_dbg(core_llr, LOG_NAME, "stop - in running");
+		core_llr->state = SL_CORE_LLR_STATE_STOPPING;
+		spin_unlock(&core_llr->data_lock);
+		sl_core_data_llr_last_fail_cause_set(core_llr, SL_LLR_FAIL_CAUSE_COMMAND);
+		sl_core_hw_llr_running_stop_cmd(core_llr);
+		return 0;
+	case SL_CORE_LLR_STATE_SETUP_CANCELING:
+	case SL_CORE_LLR_STATE_SETUP_STOPPING:
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+	case SL_CORE_LLR_STATE_START_CANCELING:
+	case SL_CORE_LLR_STATE_STOPPING:
+	case SL_CORE_LLR_STATE_START_TIMEOUT:
+		sl_core_log_dbg(core_llr, LOG_NAME, "stop - waiting (llr_state = %u %s)",
+				llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return sl_core_hw_llr_stop_wait(core_llr);
+	default:
+		sl_core_log_err(core_llr, LOG_NAME,
+				"stop - invalid (llr_state = %u %s)",
+			llr_state, sl_core_llr_state_str(llr_state));
+		spin_unlock(&core_llr->data_lock);
+		return -EBADRQC;
+	}
+}
+
+int sl_core_llr_state_get(u8 ldev_num, u8 lgrp_num, u8 llr_num,
+			  enum sl_core_llr_state *llr_state)
+{
+	int                 rtn;
+	struct sl_core_llr *core_llr;
+
+	core_llr = sl_core_llr_get(ldev_num, lgrp_num, llr_num);
+
+	rtn = sl_core_data_llr_state_get(core_llr, llr_state);
+	if (rtn) {
+		sl_core_log_err(core_llr, LOG_NAME,
+				"state get - llr_state_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_core_log_dbg(core_llr, LOG_NAME, "state get (llr_state = %u %s)",
+			*llr_state, sl_core_llr_state_str(*llr_state));
+
+	return 0;
+}
+
+bool sl_core_llr_start_should_stop(struct sl_core_llr *core_llr)
+{
+	enum sl_core_llr_state llr_state;
+	bool start_should_stop;
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETUP_CANCELING:
+	case SL_CORE_LLR_STATE_START_CANCELING:
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+	case SL_CORE_LLR_STATE_START_TIMEOUT:
+	case SL_CORE_LLR_STATE_SETUP_STOPPING:
+	case SL_CORE_LLR_STATE_STOPPING:
+		start_should_stop = true;
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"start_should_stop = %s", start_should_stop ? "true" : "false");
+		spin_unlock(&core_llr->data_lock);
+		return start_should_stop;
+	default:
+		start_should_stop = false;
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"start_should_stop = %s", start_should_stop ? "true" : "false");
+		spin_unlock(&core_llr->data_lock);
+		return start_should_stop;
+	}
+}
+
+bool sl_core_llr_setup_should_stop(struct sl_core_llr *core_llr)
+{
+	enum sl_core_llr_state llr_state;
+	bool setup_should_stop;
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETUP_CANCELING:
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+	case SL_CORE_LLR_STATE_SETUP_STOPPING:
+		setup_should_stop = true;
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"setup_should_stop = %s", setup_should_stop ? "true" : "false");
+		spin_unlock(&core_llr->data_lock);
+		return setup_should_stop;
+	default:
+		setup_should_stop = false;
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"setup_should_stop = %s", setup_should_stop ? "true" : "false");
+		spin_unlock(&core_llr->data_lock);
+		return setup_should_stop;
+	}
+}
+
+bool sl_core_llr_should_stop(struct sl_core_llr *core_llr)
+{
+	enum sl_core_llr_state llr_state;
+	bool should_stop;
+
+	spin_lock(&core_llr->data_lock);
+	llr_state = core_llr->state;
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_SETUP_CANCELING:
+	case SL_CORE_LLR_STATE_START_CANCELING:
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+	case SL_CORE_LLR_STATE_START_TIMEOUT:
+	case SL_CORE_LLR_STATE_SETUP_STOPPING:
+	case SL_CORE_LLR_STATE_STOPPING:
+		should_stop = true;
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"should_stop = %s", should_stop ? "true" : "false");
+		spin_unlock(&core_llr->data_lock);
+		return should_stop;
+	default:
+		should_stop = false;
+		sl_core_log_dbg(core_llr, LOG_NAME,
+				"should_stop = %s", should_stop ? "true" : "false");
+		spin_unlock(&core_llr->data_lock);
+		return should_stop;
+	}
+}
+
+void sl_core_llr_last_fail_cause_set(u8 ldev_num, u8 lgrp_num, u8 llr_num, u32 llr_fail_cause)
+{
+	sl_core_data_llr_last_fail_cause_set(sl_core_llr_get(ldev_num, lgrp_num, llr_num), llr_fail_cause);
+}
+
+const char *sl_core_llr_fail_cause_str(u32 llr_fail_cause)
+{
+	switch (llr_fail_cause) {
+	case SL_LLR_FAIL_CAUSE_SETUP_CONFIG:
+		return "setup-config";
+	case SL_LLR_FAIL_CAUSE_SETUP_INTR_ENABLE:
+		return "setup-intr-enable";
+	case SL_LLR_FAIL_CAUSE_SETUP_TIMEOUT:
+		return "setup-timeout";
+	case SL_LLR_FAIL_CAUSE_START_INTR_ENABLE:
+		return "start-intr-enable";
+	case SL_LLR_FAIL_CAUSE_START_TIMEOUT:
+		return "start-timeout";
+	default:
+		return "unknown";
+	}
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_mac.c b/drivers/net/ethernet/hpe/sl/core/sl_core_mac.c
new file mode 100644
index 000000000000..cfa11304e4cb
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_mac.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "base/sl_core_log.h"
+#include "sl_core_mac.h"
+#include "sl_core_str.h"
+#include "data/sl_core_data_mac.h"
+#include "hw/sl_core_hw_mac.h"
+
+#define LOG_NAME SL_CORE_MAC_LOG_NAME
+
+int sl_core_mac_new(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	return sl_core_data_mac_new(ldev_num, lgrp_num, mac_num);
+}
+
+void sl_core_mac_del(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	sl_core_data_mac_del(ldev_num, lgrp_num, mac_num);
+}
+
+struct sl_core_mac *sl_core_mac_get(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	return sl_core_data_mac_get(ldev_num, lgrp_num, mac_num);
+}
+
+int sl_core_mac_tx_start(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                 rtn;
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx start");
+
+	rtn = sl_core_data_mac_tx_settings(core_mac);
+	if (rtn) {
+		sl_core_log_err_trace(core_mac, LOG_NAME, "tx start - mac_tx_settings failed [%d]", rtn);
+		rtn = -EBADRQC;
+		goto out;
+	}
+	sl_core_hw_mac_tx_config(core_mac);
+	sl_core_hw_mac_tx_start(core_mac);
+
+out:
+	spin_lock(&core_mac->data_lock);
+	core_mac->tx_last_start_result = rtn;
+	spin_unlock(&core_mac->data_lock);
+
+	return rtn;
+}
+
+int sl_core_mac_tx_stop(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!core_mac)
+		return 0;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "tx stop");
+
+	sl_core_hw_mac_tx_stop(core_mac);
+
+	return 0;
+}
+
+int sl_core_mac_tx_state_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, u32 *mac_state)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	*mac_state = sl_core_data_mac_tx_state_get(core_mac);
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"state get (tx_state = %u %s)", *mac_state, sl_core_mac_state_str(*mac_state));
+
+	return 0;
+}
+
+int sl_core_mac_tx_last_start_result_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, int *last_start_result)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	spin_lock(&core_mac->data_lock);
+	*last_start_result = core_mac->tx_last_start_result;
+	spin_unlock(&core_mac->data_lock);
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"tx last start result get (last_start_result = %d)", *last_start_result);
+
+	return 0;
+}
+
+int sl_core_mac_rx_start(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                 rtn;
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx start");
+
+	rtn = sl_core_data_mac_rx_settings(core_mac);
+	if (rtn) {
+		sl_core_log_err_trace(core_mac, LOG_NAME, "rx start - mac_rx_settings failed [%d]", rtn);
+		rtn = -EBADRQC;
+		goto out;
+	}
+	sl_core_hw_mac_rx_config(core_mac);
+	sl_core_hw_mac_rx_start(core_mac);
+
+out:
+	spin_lock(&core_mac->data_lock);
+	core_mac->rx_last_start_result = rtn;
+	spin_unlock(&core_mac->data_lock);
+
+	return rtn;
+}
+
+int sl_core_mac_rx_stop(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!core_mac)
+		return 0;
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "rx stop");
+
+	sl_core_hw_mac_rx_stop(core_mac);
+
+	return 0;
+}
+
+int sl_core_mac_rx_state_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, u32 *mac_state)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	*mac_state = sl_core_data_mac_rx_state_get(core_mac);
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"state get (rx_state = %u %s)", *mac_state, sl_core_mac_state_str(*mac_state));
+
+	return 0;
+}
+
+int sl_core_mac_rx_last_start_result_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, int *last_start_result)
+{
+	struct sl_core_mac *core_mac;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	spin_lock(&core_mac->data_lock);
+	*last_start_result = core_mac->rx_last_start_result;
+	spin_unlock(&core_mac->data_lock);
+
+	sl_core_log_dbg(core_mac, LOG_NAME,
+			"rx last start result get (last_start_result = %d)", *last_start_result);
+
+	return 0;
+}
+
+u64 sl_core_mac_info_map_get(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_core_mac *core_mac;
+	u64                 info_map;
+
+	core_mac = sl_core_mac_get(ldev_num, lgrp_num, mac_num);
+
+	info_map = sl_core_data_mac_info_map_get(core_mac);
+
+	sl_core_log_dbg(core_mac, LOG_NAME, "info map get (map = 0x%llX)", info_map);
+
+	return info_map;
+}
diff --git a/drivers/net/ethernet/hpe/sl/core/sl_core_str.c b/drivers/net/ethernet/hpe/sl/core/sl_core_str.c
new file mode 100644
index 000000000000..4f5975eeeeb5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/core/sl_core_str.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/bitops.h>
+
+#include "sl_core_link.h"
+#include "hw/sl_core_hw_serdes_lane.h"
+#include "sl_core_str.h"
+
+#define SL_CORE_INFO_MAP_DESC_SIZE 20
+struct sl_core_info_map_str_item {
+	char desc[SL_CORE_INFO_MAP_DESC_SIZE];
+};
+
+static struct sl_core_info_map_str_item sl_core_info_map_str_list[] = {
+	[SL_CORE_INFO_MAP_MEDIA_CHECK]        = { .desc = "media-check"        },
+	[SL_CORE_INFO_MAP_MEDIA_OK]           = { .desc = "media-ok"           },
+
+	[SL_CORE_INFO_MAP_SERDES_START]       = { .desc = "serdes-start"       },
+	[SL_CORE_INFO_MAP_SERDES_CHECK]       = { .desc = "serdes-check"       },
+	[SL_CORE_INFO_MAP_SERDES_OK]          = { .desc = "serdes-ok"          },
+	[SL_CORE_INFO_MAP_SERDES_LOOPBACK_ON] = { .desc = "serdes-loopback-on" },
+
+	[SL_CORE_INFO_MAP_PCS_LOCAL_FAULT]    = { .desc = "pcs-local-fault"    },
+	[SL_CORE_INFO_MAP_PCS_REMOTE_FAULT]   = { .desc = "pcs-remote-fault"   },
+	[SL_CORE_INFO_MAP_PCS_LINK_DOWN]      = { .desc = "pcs-link-down"      },
+	[SL_CORE_INFO_MAP_PCS_CHECK]          = { .desc = "pcs-check"          },
+	[SL_CORE_INFO_MAP_PCS_OK]             = { .desc = "pcs-ok"             },
+
+	[SL_CORE_INFO_MAP_FEC_CHECK]          = { .desc = "fec-check"          },
+	[SL_CORE_INFO_MAP_FEC_OK]             = { .desc = "fec-ok"             },
+	[SL_CORE_INFO_MAP_LINK_DEGRADED]      = { .desc = "link-degraded"      },
+
+	[SL_CORE_INFO_MAP_LINK_DOWN]          = { .desc = "link-down"          },
+	[SL_CORE_INFO_MAP_LINK_UP_CANCEL]     = { .desc = "link-up-cancel"     },
+	[SL_CORE_INFO_MAP_LINK_UP_TIMEOUT]    = { .desc = "link-up-timeout"    },
+	[SL_CORE_INFO_MAP_LINK_UP_FAIL]       = { .desc = "link-up-fail"       },
+	[SL_CORE_INFO_MAP_LINK_UP]            = { .desc = "link-up"            },
+
+	[SL_CORE_INFO_MAP_MAC_RX_CONFIG]      = { .desc = "mac-rx-config"      },
+	[SL_CORE_INFO_MAP_MAC_TX_CONFIG]      = { .desc = "mac-tx-config"      },
+	[SL_CORE_INFO_MAP_MAC_RX]             = { .desc = "mac-rx"             },
+	[SL_CORE_INFO_MAP_MAC_TX]             = { .desc = "mac-tx"             },
+
+	[SL_CORE_INFO_MAP_AN_BASE_PAGE]       = { .desc = "an-base-page"       },
+	[SL_CORE_INFO_MAP_AN_NEXT_PAGE]       = { .desc = "an-next-page"       },
+	[SL_CORE_INFO_MAP_AN_ERROR]           = { .desc = "an-error"           },
+	[SL_CORE_INFO_MAP_AN_DONE]            = { .desc = "an-done"            },
+
+	[SL_CORE_INFO_MAP_LLR_CONFIG]         = { .desc = "llr-config"         },
+	[SL_CORE_INFO_MAP_LLR_SETTING_UP]     = { .desc = "llr-setting-up"     },
+	[SL_CORE_INFO_MAP_LLR_SETUP]          = { .desc = "llr-setup"          },
+	[SL_CORE_INFO_MAP_LLR_SETUP_TIMEOUT]  = { .desc = "llr-setup-timeout"  },
+	[SL_CORE_INFO_MAP_LLR_STARTING]       = { .desc = "llr-starting"       },
+	[SL_CORE_INFO_MAP_LLR_RUNNING]        = { .desc = "llr-running"        },
+	[SL_CORE_INFO_MAP_LLR_START_TIMEOUT]  = { .desc = "llr-start-timeout"  },
+	[SL_CORE_INFO_MAP_LLR_MAX_STARVATION] = { .desc = "llr-max-starvation" },
+	[SL_CORE_INFO_MAP_LLR_STARVED]        = { .desc = "llr-starved"        },
+	[SL_CORE_INFO_MAP_LLR_REPLAY_MAX]     = { .desc = "llr-replay-max"     },
+
+	[SL_CORE_INFO_MAP_HIGH_SER]           = { .desc = "high-ser"           },
+};
+
+#define SL_CORE_INFO_MAP_STR_MIN 10
+int sl_core_info_map_str(u64 info_map, char *info_map_str, unsigned int info_map_str_size)
+{
+	int          rtn;
+	unsigned int x;
+	unsigned int str_pos;
+
+	if (!info_map_str)
+		return -EINVAL;
+
+	if (info_map_str_size < SL_CORE_INFO_MAP_STR_MIN)
+		return -EINVAL;
+
+	str_pos = 0;
+
+	for (x = 0; x < SL_CORE_INFO_MAP_NUM_BITS; ++x) {
+		if (!test_bit(x, (unsigned long *)&(info_map)))
+			continue;
+		rtn = snprintf(info_map_str + str_pos,
+			       info_map_str_size - str_pos, "%s ",
+			sl_core_info_map_str_list[x].desc);
+		if (rtn < 0) {
+			str_pos = snprintf(info_map_str, info_map_str_size, "error ");
+			break;
+		}
+		if (str_pos + rtn >= info_map_str_size) {
+			info_map_str[str_pos - 2] = '.';
+			info_map_str[str_pos - 3] = '.';
+			info_map_str[str_pos - 4] = '.';
+			break;
+		}
+		str_pos += rtn;
+	}
+
+	if (str_pos == 0)
+		str_pos = snprintf(info_map_str, info_map_str_size, "none ");
+
+	info_map_str[str_pos - 1] = '\0';
+
+	return 0;
+}
+
+const char *sl_core_link_state_str(enum sl_core_link_state link_state)
+{
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UNCONFIGURED:
+		return "unconfigured";
+	case SL_CORE_LINK_STATE_CONFIGURING:
+		return "configuring";
+	case SL_CORE_LINK_STATE_CONFIGURED:
+		return "configured";
+	case SL_CORE_LINK_STATE_DOWN:
+		return "down";
+	case SL_CORE_LINK_STATE_AN:
+		return "an";
+	case SL_CORE_LINK_STATE_GOING_UP:
+		return "going-up";
+	case SL_CORE_LINK_STATE_UP:
+		return "up";
+	case SL_CORE_LINK_STATE_CANCELING:
+		return "canceling";
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+		return "going-down";
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		return "timeout";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_mac_state_str(enum sl_core_mac_state mac_state)
+{
+	switch (mac_state) {
+	case SL_CORE_MAC_STATE_INVALID:
+		return "invalid";
+	case SL_CORE_MAC_STATE_OFF:
+		return "off";
+	case SL_CORE_MAC_STATE_ON:
+		return "on";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_llr_state_str(enum sl_core_llr_state llr_state)
+{
+	switch (llr_state) {
+	case SL_CORE_LLR_STATE_INVALID:
+		return "invalid";
+	case SL_CORE_LLR_STATE_NEW:
+		return "new";
+	case SL_CORE_LLR_STATE_CONFIGURED:
+		return "configured";
+	case SL_CORE_LLR_STATE_SETTING_UP:
+		return "setting-up";
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+		return "setup-timeout";
+	case SL_CORE_LLR_STATE_SETUP_CANCELING:
+		return "setup-canceling";
+	case SL_CORE_LLR_STATE_SETUP_STOPPING:
+		return "setup-stopping";
+	case SL_CORE_LLR_STATE_SETUP:
+		return "setup";
+	case SL_CORE_LLR_STATE_STARTING:
+		return "starting";
+	case SL_CORE_LLR_STATE_START_TIMEOUT:
+		return "start-timeout";
+	case SL_CORE_LLR_STATE_START_CANCELING:
+		return "start-canceling";
+	case SL_CORE_LLR_STATE_RUNNING:
+		return "running";
+	case SL_CORE_LLR_STATE_STOPPING:
+		return "stopping";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_llr_flag_str(unsigned int llr_flag)
+{
+	switch (llr_flag) {
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_serdes_lane_state_str(u8 lane_state)
+{
+	switch (lane_state) {
+	case SL_CORE_HW_SERDES_LANE_STATE_DOWN:
+		return "down";
+	case SL_CORE_HW_SERDES_LANE_STATE_SETUP:
+		return "setup";
+	case SL_CORE_HW_SERDES_LANE_STATE_CONFIG:
+		return "config";
+	case SL_CORE_HW_SERDES_LANE_STATE_START:
+		return "start";
+	case SL_CORE_HW_SERDES_LANE_STATE_CHECK:
+		return "check";
+	case SL_CORE_HW_SERDES_LANE_STATE_STOP:
+		return "stop";
+	case SL_CORE_HW_SERDES_LANE_STATE_UP:
+		return "up";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_serdes_lane_encoding_str(u16 encoding)
+{
+	switch (encoding) {
+	case SL_CORE_HW_SERDES_ENCODING_NRZ:
+		return "NRZ";
+	case SL_CORE_HW_SERDES_ENCODING_PAM4_NR:
+		return "PAM4_normal";
+	case SL_CORE_HW_SERDES_ENCODING_PAM4_ER:
+		return "PAM4_extended";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_serdes_lane_clocking_str(u16 clocking)
+{
+	switch (clocking) {
+	case SL_CORE_HW_SERDES_CLOCKING_82P5:
+		return "82.5/165";
+	case SL_CORE_HW_SERDES_CLOCKING_85:
+		return "85/170";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_serdes_lane_osr_str(u16 osr)
+{
+	switch (osr) {
+	case SL_CORE_HW_SERDES_OSR_OSX1:
+		return "OSX1";
+	case SL_CORE_HW_SERDES_OSR_OSX2:
+		return "OSX2";
+	case SL_CORE_HW_SERDES_OSR_OSX4:
+		return "OSX4";
+	case SL_CORE_HW_SERDES_OSR_OSX42P5:
+		return "OSX42P5";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_serdes_lane_width_str(u16 width)
+{
+	switch (width) {
+	case SL_CORE_HW_SERDES_WIDTH_40:
+		return "40";
+	case SL_CORE_HW_SERDES_WIDTH_80:
+		return "80";
+	case SL_CORE_HW_SERDES_WIDTH_160:
+		return "160";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_core_lgrp_dt_jack_part_str(u32 jack_type)
+{
+	switch (jack_type) {
+	case SL_DT_JACK_TYPE_LEGACY:
+		return "legacy";
+	case SL_DT_JACK_TYPE_DD:
+		return "double-density";
+	case SL_DT_JACK_TYPE_EXAMAX_LEFT:
+		return "examax-left";
+	case SL_DT_JACK_TYPE_EXAMAX_RIGHT:
+		return "examax-right";
+	default:
+		return "unknown";
+	}
+}

-- 
2.56.0

