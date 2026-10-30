Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394104;
	b=Xetj1PFCpF6UP05ylhYqi9h8+EXFlA+txinJJwoHfSb4tuQtbN5n7ItdG2mi/D6R6Kuz
	 pyT519mHs/cCmkyzqMtRkby7XGWl3Nv3q+xfnDRXwNLWJKW5vZBKCzjss14WRF+m38BEk
	 t3jn+KZIMDsAU0dPIRx4JkKrjUpkNe6nfVlrPzKeiw9UeOGlSWIeWqgeaU5APRQnCKJ95
	 DAY6kQ7Sf/sSGOOXE9LNIAC+KfTpzdD1lguRUXBkSgng7Eq0hcJl6HgBezn4393sIipxp
	 MrWREgsWEWLKl3l1+wsuCN4DR9Kzbt0o3fFyM12FNBl9u92DL276NWrjMEpTB1rE8yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394104;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-HPE-SCL:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a5yIMuO/gDFeL5i0hBrfl3nyk05cMLKgRTWsHouADYk=;
	b=y/Qz4qCTySE7U89NE/F1lUwBQMZNHmac6IgdGKlagzQv2aCEYViILms3rh0G0OQzml3n
	 5BdBp9VSkVAzv+2tN4wo4bm0JmmMsKR/hWl0R6m3bbp+mVU/XdKVyIbeir7O2U05Mrsmi
	 tQqNZbo1JS3i0dO19SKr4zRdRsl1w1C7ju17KTcn0dZs9H2R3F0slkhi7OV1/SHluI2h/
	 Y85Vi5HJ9osBo2qtQzUrPWTezm90KpE3jdKtG5GRgG3QgdjsNuMtq4q7Ve79iq/Wp9HNc
	 gSTTvyW+Ip3zDPbIXQUSfqcm0FzKjKPGqbJIXbnMdZA+BGas6eL+QHEL3pRH40QFHag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=cgrV19j1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770160A2624;
	Fri, 30 Oct 2026 21:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A770160A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=cgrV19j1
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHxjal1754062;
	Fri, 30 Oct 2026 21:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=a5
	yIMuO/gDFeL5i0hBrfl3nyk05cMLKgRTWsHouADYk=; b=cgrV19j1sExakPeR+b
	kv6mG1bcYe301UODHkDvealQTHZMas6uR10+4ZbVwX42oqCdf8K9vz7ioParvR9B
	ku5gFz3+MYQ4vDdRumdjfsQUYh/w3eZHptZZapUSQE8z4BGoS5i/IYIoJTK5bEyK
	TbWlHcS8UGjLdk1SGLvbCdd7r3AzZ7kRbz6P9PSQV94/c2TPW5aArncdLp0i+7eY
	FVzm1rqMpWjO1dRaIwQv3V9qqR60SNIHTV86/VebvRUxlAXT+bdwCElo2/i8yHYZ
	mMdgSes87TII5Uudy8K2XAjNuiiW8yMX6p0avrEQaooPROW/T9mXHgA15dglN4xS
	nsmQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4hmwcxc8vh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:06 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 6F97CD2BE;
	Fri, 30 Oct 2026 21:01:06 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:06 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:06 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:05 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKhJXypxMFUSnnizLM8zc0H5tLoa/p1NUEXxgc5OvtKRSw0WVVcvl7GF/50JCBKmNbikmIf83M6rkllgjRDaz5iBdVfab1H53AuJ7mUaW7eMv/O0DdnwgZUBedtZeTy+nsrj06q1gzqPL4hWOWahoF3hVaCdmxbFakQpZwFsGqDGGtFMXGZ/jJwNM4OUc9Np2sGMdlRLx4pttdSvI/rp4QNY+TYtrfRvbvuX87r5supDyetiog7PzxPbhHOHiAGwzDr3AlpNLTM9c89dn/oUWPhRGu4+P9oxMaNn3AHXoDW9TqEk6h+1AdrT7+a3XCJ0SbPqHHFRt3J4g/hCUMGWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5yIMuO/gDFeL5i0hBrfl3nyk05cMLKgRTWsHouADYk=;
 b=q9t7xfEo3dLoYG4lmwCgL++/cDPeMqzY9FCBbw6Y8FGNEioX7vUt6N80qNZ8zfvCKqhGT3+RXsWzo8Nbi+yGN2U2hmmYttcoO1WKDPL2/594DTC3Rc5Ir4Tzn0ssF+iufgMEDiDunxwGrsl92TXDwKxTtHBvWmvxE92ldd/V5Z7lGqwNvb4D7At9EvW7rcVMZzlgIlFSnZVQ0rIoEPoYeZmBJpmgchBG6Chp08feBa1yJySD+hlgvAI/tEaOBDaOX4DnNvWiTsc0Jv/rmfvLpxHa0Nq1E/Wx3Tfcoo4D/xRL6iWwKZFJnzwlGjrNw8/fQgIl23je3stym2j6Z4SKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:01:02 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:01:02 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:14 -0700
Subject: [PATCH 18/23] net: hpe: ss1: add the link layer glue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-18-8c2c391cc283@hpe.com>
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
 Bhoot" <sandeep.bhoot@hpe.com>,
        Mamila Santosh <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SA0PR11CA0142.namprd11.prod.outlook.com
 (2603:10b6:806:131::27) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 3ff41207-f69a-4983-d759-08df36c8e743
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: XJRrLQIEAZxZi7WXFWU30tyW3clw6MXm/A+1nWdSJG4UzwLlpYtclh57xUwzHOVW+C8C97KLt8kL703zOYjoPfdBdV5WmbvhRSyY6cU2IFAWPhW8+0IbwAps266mXSEZp0l+ZUT9vYdSIIASJQfcSMHuLjUxq4vFO506gQax5/+QOwSJ2FBSt3fwjrpo5qQB8EBEDHcAMR4V/mLd9KBY5AWDBAOtsxq0W55+P/3+BRMzBYvJ26fghZ9684PUGNTB3IvsBMmqp01sI6vHGE+tdUXmvX3TZg/b42d4oso5ElqJ77TeF9cqiLLP4tyWFMGG5/gVq25UlBoDn3fMy0RNTpKJsK7+Mi1jfZ72ybk/CT9CFH2RIW8ug4VZ1/MxQOr7wbMtJLA+fuJdNlv+ogPSPS1li+Ghuj4lZdTRmKV57b7GDNHV1ZerVhMX3l7ih30hmDpVOhc+NjKr2lJ9yM9qdXKZl5b8GseoQ758uo6DqKVljBm6OENhZIDC9hyyr7dluXZXU4cnD2qcwSVttf0fnUGFKwujzG+hooCLsa3krWxLsxucBujPqN4oMu7V9L9h7Vg2Z3vtzLiNaWDtPykXnEL4Qi+k1cSQZ0OLx2T20LSmRZvfcRye5FwYi14PgHIEL9LQosVxz7HAmPuzfjhvVsE+VtopNXDTvbsXgluCzUBU4+LmzXJj9ZjpHA1I8tIH1nNJWatndTSqyApl8LCqbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzg0ZUEyTmI0WVYwaUhpb1U3UTRzQThXdDNlelBTYjQyTHdXNGNMYjhXYXcv?=
 =?utf-8?B?Q1JwK05JaWY5NFZDUGpOOXNIRlBJV1lsaVFRMGJLMGVwUzYrbEhSVzFxQVlB?=
 =?utf-8?B?UzNFV0hwbERtbHZ0dEhKRUFsd1lUZ1g0QzhtU2xUTkd6TGJxUktvVFZhOVhC?=
 =?utf-8?B?WEhaNGJnSkJvRi9STTB2Y1JhNFhIcnUwazVZamJ2UnRKbWN0OHRLVzhHVVFy?=
 =?utf-8?B?R3FLNUJ0U1FKM3N5Z2FOR0xreldSSzNtVFk1bk8wZk9QejNNMGNwL1dyZXBa?=
 =?utf-8?B?Nkd5Q1JxMExaTnp5Q09CMWtvN3V0Rm9XbktQeGh6eUN5ZFM5dWFqVkVrZTZ0?=
 =?utf-8?B?L012K016L29mZzlxdWdSNXFlU2VmTGlZOXo0TEhod1orYU1nWlJrQ3N5eVdJ?=
 =?utf-8?B?ejBoSjdXNDRFNU1TU0hnOFhadDRtdlo0SEFMUFJTNGJzU05xSmhudlQ4cW12?=
 =?utf-8?B?UCt3K0FPUms0Z0syMFNsMURlYndzTW44VHkzdmFQbG9idmFsVmpIWHBETFZB?=
 =?utf-8?B?bHcrcXRxc2RVVHd3OVFlR2RuN0ZVdlk5L21Zc3ZzYkMwSlhPZzVQL0h1YXRj?=
 =?utf-8?B?U2gxM3BiL0ZTZzBPMFdLTFJCT1NYZkp4bzJ2RTQ3R1B6M0tvRFF3TTBXUlBs?=
 =?utf-8?B?K0NtVk51bGJCeVphQmU4UVBWdEpGMndlWUg2KzdmZTNGT0RjRXQ4V1lCYjVm?=
 =?utf-8?B?Z3RFL2dScTc0SVZ2RG9FTVZPaHNpQURVZkQ3RXMwbnZMNk5nYmZ6UnU1eHVm?=
 =?utf-8?B?V015b0FSUGl3dHB1eW1tcG91UjAyaG9SSEVpRFlXTi85MmpreHRmcjZZdHZz?=
 =?utf-8?B?L0hPd3I5SVI5ODBYYjRxNktuMWI3dUJXTlU5cXAyV2cyOEFGNndCU1lBQkpL?=
 =?utf-8?B?bGdnYzVIbGw4MjJnN0RaSEp2NXFUREdkekU1eFJzNER4OSs0R0NsUWI5R2pS?=
 =?utf-8?B?THZPbFVaVVRZSTJmY0I3b2wvRTd1NGhqeVZYbGZqNlB2cE4wQ0lZSHFhNUx2?=
 =?utf-8?B?SkxhN3JiVWdOUTE2Rnpyd0RjZE5vTWU2NGlZK0FDSHNwd3R2UTViU21GRFZD?=
 =?utf-8?B?dXJRcllNbVl0SkhIZDZjZWN0TW9pVlREZHo4UUFPcDlTMXd0NGwraER4Vy9n?=
 =?utf-8?B?NXZJLzMxZkFtMGd2cUZZM3pLcS9PMndTc2t4ME1yRmM3V29ORkdGZ2ljeWhm?=
 =?utf-8?B?Y2NxT2Y0SWluY3RYeUJnUElYbnZpTm9KV09hUmpuR0M2eHU4S3hUOUFUdStU?=
 =?utf-8?B?a2o5bUVRaS9KVVorNkt6eDR4ZDVOUVJiTy94cGFKNmhyTFJNbUVEaFBVSTl5?=
 =?utf-8?B?SldWWkthSE4vUXRrUzhoVUpMUXhXNUxFQTZkVytUVlZxTlBBTkJ2N1UyUUxD?=
 =?utf-8?B?M1ZndnovVUZsd2Vlc2ViTDEzME5FeXNJSkRiT212QzFDS1dRVit2SlBjVU05?=
 =?utf-8?B?MUdEeFJuVTBhb0hVTHFyMnVvK3NhdUlEZG5TR3Z2K1lDZmFpWk9WL2dBa3hE?=
 =?utf-8?B?TmxIYXBoN2E5U2hkR090dkl6TXRScCs4OHZUTGg2NWhlUUx5TFdCQU1VaDVQ?=
 =?utf-8?B?S1lRQ043UWRNNlRYdG5SaGxLZTg5VTNGVVhRQWFhQ201RDZaOVpDd2NQeXlp?=
 =?utf-8?B?WnFpMEVuS2Vwcyttdm9pUFdwMzNRWWpxK0xDSkJYQWFRK0IwbDFLSDlLOTB4?=
 =?utf-8?B?b2ZJcTlueXR1V3hSWVp1elVJRkhTRlN2c3RheU9WSHdiYVdPTldnY0U4cW55?=
 =?utf-8?B?L00rZkdzUld3NlQ4Y3BJQ3VVOW80NGh5ZlBrOGxOcXpXc29IZkhoMXl4R1po?=
 =?utf-8?B?dGpGUzhGdUxHT2hCS1JBMHMrS0ZrUmhod21sYjFyQ3RXQ3Z3N3AwZWgyU3d6?=
 =?utf-8?B?alFtNGVaam5WYkZodVFCdUNFVEhMVHFvN3ZFTy9YbTJQOEc5bnBudllIM210?=
 =?utf-8?B?VVg5dUFoNlFBbXEvUHQ2T1VKYmUrWVRVK29GbDVoYzNPcEdQQWE4OUd2TzBD?=
 =?utf-8?B?YThDZ0ppV3lCQ0hKV05YZW1xQW1QVHp6REVOV2FUUEt3VXlkVlZxWnJjOVdD?=
 =?utf-8?B?VEpUMld6Y0N4TFJLb3lqVURxUzJqSzlxRktuRTZuUE5sOFFOOHgzZU1GWFIv?=
 =?utf-8?B?eHRJMTA1L0JuVThFaFl3M1FXTXRBTGNNTmJzVC9DNVkyUUdWbDVVcS9iMHdQ?=
 =?utf-8?B?TlY3bm40bXZjYm1TS01TVGJ2dmZYNVN6M0xKbDhJRklQWmZ0THJqN2Rpd2JN?=
 =?utf-8?B?TXdYOC9JYk9FYUJ1ZERSV0gzaG9Nc3I4V0FoZEs4TU5CTXFqNGRnWUV4VzI5?=
 =?utf-8?B?THVMRWx1QnQ4VTAzb0RJNTNRck11dzdhQ1JySW1lS1NVd09rYytidz09?=
X-Exchange-RoutingPolicyChecked: Yyaejm8zRaJLeCpr+M3MryXijJDf6OgD3TvccYHJMp/s9vx4pm5Vx3WIjpavJ6aBQ+moQKu/yixAweQtedbH8+dM8PLGxTkZubxvuMgLpYZ8BXV2dZ0qk3rpPodS/OE3HyMXeB8GxvGw+U93KyHQ4yPsMOg3IzsOhNQ5P2jshiD/uJWohhyxxMum7hr1Bs9d54yMCwkTlAxWLvhJkd4amar8OpTszFt1/WbCalfd/VuzIQ691UI6Bx0Ep7BEnXMMR9x3DipjfyhvwYCfl5CWYcTfr+Px1uJLGD5m6GiFmpzZ+0wVukR7umZWdBpqz3/ccN/oIH3EqTxQGtupBOI+HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff41207-f69a-4983-d759-08df36c8e743
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:01:01.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nP0zelrB7FPECTQE3KUPss8/AmtI5mjnaumYSt3/b2DvGc9PGTinGgevFWV6+/wbfujO4WM2fQwQ4SA+rUofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=N5K8hG9B c=1 sm=1 tr=0 ts=6ae50593 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=_ZmgHqWwjZUDpi_pur5s:22 a=MvuuwTCpAAAA:8 a=a-kgvqkP_Nuw5hEgfy0A:9
 a=pUKlrEzGkUvYV7Sx:21 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: srJJ-vtu7Rj0cgzGnqU2kM7DZr2iF9UQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4CI8q2a0aik/
 PYqzdAExtmyi7OZgsk8pVjbI7iN2Zm60cqAY7CtsujaZXlRGcH9huBpY+rc4YGapAhDHtjOWXBn
 4Yei+WUeOydLK2OAHn32O4rAQEsbQ2syHgr3GrM1FBuhP4zKzbLUh3c5a9djvQwSBfyK4+pHYTw
 Bmf8v4FPNLI3WilVnQDVarHjTSCzSBCO1ZQ2mjCsNgN/z0bHPYOJRkTzA3+6RwQxu3WWglkE4XE
 8/kO4TdxiQ+vf29cNZggOaA1+yLvzAoLKGlOykqrSLEfdyLK8BvckeooqKX8HWBiGZDfFWtod5y
 TL7v+ZUbhLjAfe6jCXu6e2XOgUir3sxedImbtEaiPdrTDw+9nAt7xmt/mZ55kIosdwUsw42EGuc
 PBTPgOh60dv50mJpfjNMGhcKqxPK5+WiT5w2wGVjbambY5M8hCTnHea23VnyFO/FIbEFprB04jZ
 KDcMXuyRvGLCepzNY7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX7VzQKRzK+kYV
 VgVwgTYAsqrzcTIvnKITeOvoXfc6j+MLo5aXN7ofruSLPPk3AGwDlUGyouWH5sfWZ2GGkS+XP0K
 DP4LnOxbtaBdIvaqDbJP2qFTWOf9TnA=
X-Proofpoint-GUID: srJJ-vtu7Rj0cgzGnqU2kM7DZr2iF9UQ
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300083

Add the glue between the core driver and the SBL and SL link layers,
the PHY and port helpers.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (8), CONST_STRUCT (3), ALLOC_WITH_SIZEOF (2),
  BLOCK_COMMENT_STYLE (2)
- CHECK: UNNECESSARY_PARENTHESES (65), PARENTHESIS_ALIGNMENT (9),
  ALLOC_SIZEOF_STRUCT (1), BRACES (1)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cass_phy.c       |  224 ++++
 drivers/net/ethernet/hpe/ss1/cass_port_misc.c |   68 +
 drivers/net/ethernet/hpe/ss1/cass_sbl.c       | 1706 +++++++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_sl.c        | 1524 ++++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_sl_io.c     |  368 ++++++
 5 files changed, 3890 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cass_phy.c b/drivers/net/ethernet/hpe/ss1/cass_phy.c
new file mode 100644
index 000000000000..beb5e2edf433
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_phy.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2021,2025 Hewlett Packard Enterprise Development LP */
+/* Cassini pseudo PHY interface
+ * Copy the interface from drivers/net/phy/phy.c
+ */
+
+#include <linux/debugfs.h>
+#include <linux/iopoll.h>
+#include <linux/hpe/cxi/cxi.h>
+
+#include "cass_core.h"
+#include "cass_sbl.h"
+#include <linux/hpe/sbl/sbl.h>
+
+/**
+ * cass_phy_is_started() - Convenience function to check whether PHY is started
+ *
+ * @hw: Cassini device.
+ */
+static bool cass_phy_is_started(struct cass_dev *hw)
+{
+	lockdep_assert_held(&hw->phy.lock);
+	return hw->phy.state >= CASS_PHY_UP;
+}
+
+bool cass_phy_is_headshell_removed(struct cass_dev *hw)
+{
+	return hw->phy.state == CASS_PHY_HEADSHELL_REMOVED;
+}
+
+void cass_phy_set_state(enum cass_phy_state state, struct cass_dev *hw)
+{
+	spin_lock(&hw->phy.lock);
+	hw->phy.state = state;
+	hw->phy.generation++;
+	spin_unlock(&hw->phy.lock);
+}
+
+static void cass_phy_set_up_unless_removed(struct cass_dev *hw)
+{
+	lockdep_assert_held(&hw->phy.lock);
+	if (hw->phy.state != CASS_PHY_HEADSHELL_REMOVED)
+		hw->phy.state = CASS_PHY_UP;
+}
+
+static void cass_phy_queue_locked(struct cass_dev *hw, unsigned long delay)
+{
+	if (hw->phy.stopped || !cass_phy_is_started(hw))
+		return;
+
+	if (!(work_busy(&hw->phy.state_queue.work) & WORK_BUSY_PENDING))
+		mod_delayed_work(system_power_efficient_wq, &hw->phy.state_queue, delay);
+}
+
+static void cass_phy_queue_state_machine(struct cass_dev *hw,
+					 unsigned long delay)
+{
+	spin_lock(&hw->phy.lock);
+	cass_phy_queue_locked(hw, delay);
+	spin_unlock(&hw->phy.lock);
+}
+
+void cass_phy_trigger_machine(struct cass_dev *hw)
+{
+	cass_phy_queue_state_machine(hw, 0);
+}
+
+void cass_phy_link_up(struct cass_dev *hw)
+{
+	cxidev_warn(&hw->cdev, "CXI_EVENT_LINK_UP");
+	update_hni_link_up(hw);
+	update_oxe_link_up(hw);
+	cass_set_outstanding_limit(hw);
+	cxi_send_async_event(&hw->cdev, CXI_EVENT_LINK_UP);
+}
+
+void cass_phy_link_down(struct cass_dev *hw)
+{
+	cxidev_warn(&hw->cdev, "CXI_EVENT_LINK_DOWN");
+	cxi_send_async_event(&hw->cdev, CXI_EVENT_LINK_DOWN);
+}
+
+static void cass_phy_check_link_status(struct cass_dev *hw,
+				       unsigned int generation)
+{
+	bool up = cass_link_get_state(hw) == CASS_LINK_STATUS_UP;
+	enum cass_phy_state target = up ? CASS_PHY_RUNNING : CASS_PHY_NOLINK;
+	bool changed = false;
+
+	/* TODO - phy.state and lstate duplicate one another */
+	spin_lock(&hw->phy.lock);
+	/* A stop, start or cable transition since the sample supersedes it */
+	if (!hw->phy.stopped && hw->phy.generation == generation &&
+	    hw->phy.state != target) {
+		hw->phy.state = target;
+		changed = true;
+	}
+	spin_unlock(&hw->phy.lock);
+
+	if (!changed)
+		return;
+
+	if (up)
+		cass_phy_link_up(hw);
+	else
+		cass_phy_link_down(hw);
+}
+
+/* cass_phy_start_aneg - start auto-negotiation for the device */
+static void cass_phy_start_aneg(struct cass_dev *hw, unsigned int generation)
+{
+	cass_lmon_request_up(hw);
+	cass_phy_check_link_status(hw, generation);
+}
+
+static void cass_phy_state_machine(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct cass_dev *hw =
+		container_of(dwork, struct cass_dev, phy.state_queue);
+	enum cass_phy_state old_state;
+	enum cass_phy_state new_state;
+	unsigned int generation;
+	bool needs_aneg = false;
+
+	spin_lock(&hw->phy.lock);
+	if (hw->phy.stopped) {
+		spin_unlock(&hw->phy.lock);
+		return;
+	}
+	old_state = hw->phy.state;
+	generation = hw->phy.generation;
+	spin_unlock(&hw->phy.lock);
+
+	switch (old_state) {
+	case CASS_PHY_DOWN:
+	case CASS_PHY_READY:
+	case CASS_PHY_HEADSHELL_REMOVED:
+		break;
+
+	case CASS_PHY_UP:
+		needs_aneg = true;
+		break;
+
+	case CASS_PHY_NOLINK:
+	case CASS_PHY_RUNNING:
+		cass_lmon_request_up(hw);
+		cass_phy_check_link_status(hw, generation);
+		break;
+	case CASS_PHY_HALTED:
+		if (cass_link_get_state(hw) == CASS_LINK_STATUS_UP)
+			cass_phy_link_down(hw);
+		break;
+	}
+
+	if (needs_aneg)
+		cass_phy_start_aneg(hw, generation);
+
+	spin_lock(&hw->phy.lock);
+	new_state = hw->phy.state;
+	if (new_state != CASS_PHY_RUNNING)
+		cass_phy_queue_locked(hw, HZ);
+	spin_unlock(&hw->phy.lock);
+
+	if (old_state != new_state)
+		cxidev_dbg(&hw->cdev, "PHY state change %d -> %d\n",
+			   old_state, new_state);
+}
+
+void cass_phy_init(struct cass_dev *hw)
+{
+	spin_lock_init(&hw->phy.lock);
+	INIT_DELAYED_WORK(&hw->phy.state_queue, cass_phy_state_machine);
+}
+
+void cass_phy_bounce(struct cass_dev *hw)
+{
+	cass_phy_stop(hw, true);
+	cass_phy_start(hw, false);
+}
+
+void cass_phy_start(struct cass_dev *hw, bool force_reconfig)
+{
+	if (hw->link_config_dirty || force_reconfig)
+		cass_sbl_configure(hw);
+
+	/* Start the PHY directly in UP mode */
+	spin_lock(&hw->phy.lock);
+	hw->phy.stopped = false;
+	hw->phy.generation++;
+	cass_phy_set_up_unless_removed(hw);
+	cass_phy_queue_locked(hw, 0);
+	spin_unlock(&hw->phy.lock);
+}
+
+void cass_phy_stop(struct cass_dev *hw, bool block)
+{
+	int err;
+
+	spin_lock(&hw->phy.lock);
+	hw->phy.stopped = true;
+	hw->phy.generation++;
+	spin_unlock(&hw->phy.lock);
+
+	cancel_delayed_work_sync(&hw->phy.state_queue);
+
+	spin_lock(&hw->phy.lock);
+	if (cass_phy_is_started(hw))
+		cass_phy_set_up_unless_removed(hw);
+	spin_unlock(&hw->phy.lock);
+
+	if (!block)
+		err = cass_lmon_request_down(hw);
+	else
+		err = cass_link_async_down_wait(hw, CASS_DOWN_ORIGIN_CONFIG);
+
+	if (err || (cass_link_get_state(hw) == CASS_LINK_STATUS_ERROR)) {
+		cass_link_async_reset_wait(hw, CASS_DOWN_ORIGIN_CONFIG);
+		cass_sbl_configure(hw);
+		spin_lock(&hw->phy.lock);
+		cass_phy_set_up_unless_removed(hw);
+		spin_unlock(&hw->phy.lock);
+	}
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_port_misc.c b/drivers/net/ethernet/hpe/ss1/cass_port_misc.c
new file mode 100644
index 000000000000..0d01985d1741
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_port_misc.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/hpe/sbl/sbl.h>
+
+#include "cass_core.h"
+
+/*
+ * create and initialise the port array
+ */
+int cass_port_new_port_db(struct cass_dev *hw)
+{
+	hw->port = kzalloc(sizeof(struct cass_port), GFP_KERNEL);
+	if (!hw->port)
+		return -ENOMEM;
+
+	spin_lock_init(&hw->port->lock);
+	hw->port->lstate = CASS_LINK_STATUS_UNCONFIGURED;
+	init_waitqueue_head(&hw->port->lmon_wq);
+	spin_lock_init(&hw->port->pause_lock);
+	hw->port->pause_type = CASS_PAUSE_TYPE_NONE;
+	hw->port->tx_pause = false;
+	hw->port->rx_pause = false;
+	hw->port->lmon_counters = NULL;
+	hw->port->start_time = 0;
+	cass_lmon_counters_init(hw);
+
+	return 0;
+}
+
+void cass_port_del_port_db(struct cass_dev *hw)
+{
+	if (hw->port) {
+		cass_lmon_kill_all(hw);
+		cass_lmon_counters_term(hw);
+		kfree(hw->port);
+		hw->port = NULL;
+	}
+}
+
+/*
+ * text output helpers
+ */
+const char *cass_port_subtype_str(enum cass_port_subtype subtype)
+{
+	switch (subtype) {
+	case CASS_PORT_SUBTYPE_IEEE:    return "ieee";
+	case CASS_PORT_SUBTYPE_CASSINI: return "cassini";
+	case CASS_PORT_SUBTYPE_LOCAL:   return "local";
+	case CASS_PORT_SUBTYPE_GLOBAL:  return "global";
+	default:                        return "unknown";
+	}
+}
+
+const char *cass_pause_type_str(enum cass_pause_type type)
+{
+	switch (type) {
+	case CASS_PAUSE_TYPE_INVALID: return "invalid";
+	case CASS_PAUSE_TYPE_NONE:    return "none";
+	case CASS_PAUSE_TYPE_GLOBAL:  return "global/802.3x";
+	case CASS_PAUSE_TYPE_PFC:     return "pfc/802.1qbb";
+	default:                      return "unrecognised";
+	}
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sbl.c b/drivers/net/ethernet/hpe/ss1/cass_sbl.c
new file mode 100644
index 000000000000..3b39e917fd5a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sbl.c
@@ -0,0 +1,1706 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cassini device handler
+ * Copyright 2020-2024 Hewlett Packard Enterprise Development LP
+ */
+
+#include <linux/iopoll.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/hpe/sbl/sbl_mb.h>
+#include <linux/hpe/sbl/sbl.h>
+#include <uapi/ethernet/sbl-abi.h>
+#include <uapi/ethernet/sbl_cassini.h>
+
+#include "cass_core.h"
+#include "cass_cable.h"
+#include "cxi_ethtool.h"
+#include "cass_ss1_debugfs.h"
+
+#define SYSFS_BUFSIZE        1000
+
+static unsigned int pml_rec_timeout = SBL_DFLT_PML_REC_TIMEOUT;
+module_param(pml_rec_timeout, uint, 0644);
+MODULE_PARM_DESC(pml_rec_timeout, "PML recovery timeout in ms");
+
+static unsigned int pml_rec_rl_max_dur = SBL_DFLT_PML_REC_RL_MAX_DURATION;
+module_param(pml_rec_rl_max_dur, uint, 0644);
+MODULE_PARM_DESC(pml_rec_rl_max_dur, "PML recovery max time in ms per window");
+
+static unsigned int pml_rec_rl_win_size = SBL_DFLT_PML_REC_RL_WINDOW_SIZE;
+module_param(pml_rec_rl_win_size, uint, 0644);
+MODULE_PARM_DESC(pml_rec_rl_win_size, "PML recovery rate limiter window in ms");
+
+/**
+ * cass_sbl_link_attr_cmp() - Check if input attr matches device attr
+ *
+ *  Checks each member of input cass_link_attr against value stored in
+ *  device. If any values differ, return -1, else return 0.
+ *
+ * @hw: the device
+ * @tgt_val: comparison values
+ *
+ * Return: 0 on if the structs are the same, else -1
+ */
+static int cass_sbl_link_attr_cmp(const struct cass_dev *hw,
+				  const struct cass_link_attr *tgt_val)
+{
+	const struct cass_port *port = hw->port;
+
+	if ((tgt_val->options != port->lattr.options) ||
+	    (tgt_val->bl.options != port->lattr.bl.options) ||
+	    (tgt_val->bl.magic != port->lattr.bl.magic) ||
+	    (tgt_val->bl.start_timeout != port->lattr.bl.start_timeout) ||
+	    (tgt_val->bl.config_target != port->lattr.bl.config_target) ||
+	    (tgt_val->bl.pec.an_mode != port->lattr.bl.pec.an_mode) ||
+	    (tgt_val->bl.pec.an_retry_timeout != port->lattr.bl.pec.an_retry_timeout) ||
+	    (tgt_val->bl.pec.an_max_retry != port->lattr.bl.pec.an_max_retry) ||
+	    (tgt_val->bl.lpd_timeout != port->lattr.bl.lpd_timeout) ||
+	    (tgt_val->bl.lpd_poll_interval != port->lattr.bl.lpd_poll_interval) ||
+	    (tgt_val->bl.link_mode != port->lattr.bl.link_mode) ||
+	    (tgt_val->bl.loopback_mode != port->lattr.bl.loopback_mode) ||
+	    (tgt_val->bl.link_partner != port->lattr.bl.link_partner) ||
+	    (tgt_val->bl.tuning_pattern != port->lattr.bl.tuning_pattern) ||
+	    (tgt_val->bl.precoding != port->lattr.bl.precoding) ||
+	    (tgt_val->bl.dfe_pre_delay != port->lattr.bl.dfe_pre_delay) ||
+	    (tgt_val->bl.dfe_timeout != port->lattr.bl.dfe_timeout) ||
+	    (tgt_val->bl.dfe_poll_interval != port->lattr.bl.dfe_poll_interval) ||
+	    (tgt_val->bl.pcal_eyecheck_holdoff != port->lattr.bl.pcal_eyecheck_holdoff) ||
+	    (tgt_val->bl.nrz_min_eye_height != port->lattr.bl.nrz_min_eye_height) ||
+	    (tgt_val->bl.nrz_max_eye_height != port->lattr.bl.nrz_max_eye_height) ||
+	    (tgt_val->bl.pam4_min_eye_height != port->lattr.bl.pam4_min_eye_height) ||
+	    (tgt_val->bl.pam4_max_eye_height != port->lattr.bl.pam4_max_eye_height) ||
+	    (tgt_val->bl.fec_mode != port->lattr.bl.fec_mode) ||
+	    (tgt_val->bl.enable_autodegrade != port->lattr.bl.enable_autodegrade) ||
+	    (tgt_val->bl.llr_mode != port->lattr.bl.llr_mode) ||
+	    (tgt_val->bl.ifg_config != port->lattr.bl.ifg_config) ||
+	    (tgt_val->bl.pml_recovery.timeout != port->lattr.bl.pml_recovery.timeout) ||
+	    (tgt_val->bl.pml_recovery.rl_max_duration !=
+		port->lattr.bl.pml_recovery.rl_max_duration) ||
+	    (tgt_val->bl.pml_recovery.rl_window_size !=
+		port->lattr.bl.pml_recovery.rl_window_size))
+		return -1;
+
+	return 0;
+}
+
+/* Initializes the sbl module. */
+int cass_sbl_link_start(struct cass_dev *hw)
+{
+	int ret;
+	int fini_rtn;
+
+	cxidev_dbg(&hw->cdev, "initializing SBL...\n");
+
+	ret = cass_port_new_port_db(hw);
+	if (ret) {
+		cxidev_err(&hw->cdev, "cass_port_new_port_db failed [%d]\n", ret);
+		goto out;
+	}
+
+	ret = hw->link_ops->init(hw);
+	if (ret != 0) {
+		cxidev_err(&hw->cdev, "init failed [%d]\n", ret);
+		goto out_ports;
+	}
+
+	hw->port->hstate = CASS_HEADSHELL_STATUS_NOT_PRESENT;
+
+	ret = cass_lmon_start_all(hw);
+	if (ret) {
+		cxidev_err(&hw->cdev, "cass_lmon_start_all failed [%d]\n", ret);
+		goto out_sbl;
+	}
+
+	ret = cass_cable_scan(hw);
+	if (ret) {
+		cxidev_err(&hw->cdev, "cass_cable_scan failed [%d]\n", ret);
+		goto out_lmon;
+	}
+
+	cass_sbl_set_defaults(hw);
+	ret = cass_sbl_configure(hw);
+	if (ret != 0) {
+		cxidev_err(&hw->cdev, "cass_sbl_configure failed [%d]\n", ret);
+		goto out_lmon;
+	}
+	cxidev_dbg(&hw->cdev, "SBL initialized\n");
+
+	return 0;
+
+out_lmon:
+	cass_lmon_kill_all(hw);
+out_sbl:
+	fini_rtn = hw->link_ops->link_fini(hw);
+	if (fini_rtn) {
+		WARN(1, "SBL link teardown failed during startup unwind: %d\n", fini_rtn);
+		return fini_rtn;
+	}
+out_ports:
+	cass_port_del_port_db(hw);
+out:
+	return ret;
+}
+
+int cass_sbl_link_fini(struct cass_dev *hw)
+{
+	int err;
+
+	if (hw->port_kobj.state_in_sysfs)
+		kobject_del(&hw->port_kobj);
+	cass_lmon_kill_all(hw);
+	err = cass_sbl_exit(hw);
+	if (err)
+		return err;
+	cass_port_del_port_db(hw);
+	return 0;
+}
+
+/* getters/setters follow */
+
+/**
+ * cass_sbl_mode_set() - Setter for various link configuration options
+ *
+ * Updates the cass_dev cass_link_attr with the target value.
+ * If there are any differences between the requested config and the
+ * running config, the link will be torn down and brought back up with
+ * the new config.
+ *
+ * @hw: the device
+ * @link_info: CXI ethtool private flags
+ */
+void cass_sbl_mode_set(struct cass_dev *hw, const struct cxi_link_info *link_info)
+{
+	struct cass_link_attr attrs = hw->port->lattr;
+
+	switch (link_info->flags & LOOPBACK_MODE) {
+	case 0:
+		attrs.bl.loopback_mode = SBL_LOOPBACK_MODE_OFF;
+		break;
+	case CXI_ETH_PF_INTERNAL_LOOPBACK:
+		attrs.bl.loopback_mode = SBL_LOOPBACK_MODE_LOCAL;
+		break;
+	case CXI_ETH_PF_EXTERNAL_LOOPBACK:
+		attrs.bl.loopback_mode = SBL_LOOPBACK_MODE_REMOTE;
+		break;
+	default:
+		/* Invalid configuration, no change */
+		break;
+	}
+
+	if (link_info->flags & CXI_ETH_PF_LLR)
+		attrs.bl.llr_mode = SBL_LLR_MODE_ON;
+	else
+		attrs.bl.llr_mode = SBL_LLR_MODE_OFF;
+
+	if (link_info->flags & CXI_ETH_PF_PRECODING)
+		attrs.bl.precoding = SBL_PRECODING_ON;
+	else
+		attrs.bl.precoding = SBL_PRECODING_OFF;
+
+	if (link_info->flags & CXI_ETH_PF_IFG_HPC)
+		attrs.bl.ifg_config = SBL_IFG_CONFIG_HPC;
+	else
+		attrs.bl.ifg_config = SBL_IFG_CONFIG_IEEE_200G;
+
+	if (link_info->flags & CXI_ETH_PF_PML_REC)
+		attrs.bl.options |= SBL_DISABLE_PML_RECOVERY;
+	else
+		attrs.bl.options &= ~SBL_DISABLE_PML_RECOVERY;
+
+	if (attrs.mattr.media != SBL_LINK_MEDIA_OPTICAL) {
+		if (link_info->autoneg == AUTONEG_DISABLE)
+			attrs.bl.pec.an_mode = SBL_AN_MODE_OFF;
+		else
+			attrs.bl.pec.an_mode = SBL_AN_MODE_ON;
+	}
+
+	if (!cass_sbl_link_attr_cmp(hw, &attrs))
+		hw->link_config_dirty = false;
+	else
+		hw->link_config_dirty = true;
+
+	if (hw->link_config_dirty) {
+		hw->port->lattr = attrs;
+		/* Bounce the link to apply the new config */
+		cass_phy_bounce(hw);
+	}
+}
+
+void cass_sbl_pml_recovery_set(struct cass_dev *hw, bool set)
+{
+	sbl_disable_pml_recovery(hw->sbl, 0, set);
+}
+
+/**
+ * cass_sbl_mode_get() - Getter for various link configuration options
+ *
+ * Updates the input tgt_val with the cass_dev cass_link_attr contents.
+ *
+ * @hw: the device
+ * @link_info: location to write cass_link_attr struct
+ */
+void cass_sbl_mode_get(struct cass_dev *hw, struct cxi_link_info *link_info)
+{
+	const struct cass_link_attr *attrs = &hw->port->lattr;
+	int sstate;
+	int blstate;
+	int link_mode;
+
+	memset(link_info, 0, sizeof(*link_info));
+
+	sbl_base_link_get_status(hw->sbl, 0, &blstate,
+				 NULL, &sstate, NULL, NULL, &link_mode);
+
+	switch (blstate) {
+	case SBL_BASE_LINK_STATUS_UNKNOWN:
+	case SBL_BASE_LINK_STATUS_UNCONFIGURED:
+	case SBL_BASE_LINK_STATUS_RESETTING:
+	case SBL_BASE_LINK_STATUS_ERROR:
+		link_info->speed = SPEED_UNKNOWN;
+		break;
+	default:
+		switch (sstate) {
+		case SBL_SERDES_STATUS_UNKNOWN:
+		case SBL_SERDES_STATUS_RESETTING:
+		case SBL_SERDES_STATUS_ERROR:
+			link_info->speed = SPEED_UNKNOWN;
+			break;
+		default:
+			cass_sbl_link_mode_to_speed(link_mode, &link_info->speed);
+		}
+	}
+
+	if (attrs->bl.loopback_mode == SBL_LOOPBACK_MODE_LOCAL)
+		link_info->flags |= CXI_ETH_PF_INTERNAL_LOOPBACK;
+	else if (attrs->bl.loopback_mode == SBL_LOOPBACK_MODE_REMOTE)
+		link_info->flags |= CXI_ETH_PF_EXTERNAL_LOOPBACK;
+
+	if (attrs->bl.llr_mode == SBL_LLR_MODE_ON)
+		link_info->flags |= CXI_ETH_PF_LLR;
+
+	if (attrs->bl.precoding == SBL_PRECODING_ON)
+		link_info->flags |= CXI_ETH_PF_PRECODING;
+
+	if (attrs->bl.ifg_config == SBL_IFG_CONFIG_HPC)
+		link_info->flags |= CXI_ETH_PF_IFG_HPC;
+
+	if (attrs->bl.options & SBL_DISABLE_PML_RECOVERY)
+		link_info->flags |= CXI_ETH_PF_PML_REC;
+
+	if (attrs->mattr.media != SBL_LINK_MEDIA_OPTICAL) {
+		if (attrs->bl.pec.an_mode == SBL_AN_MODE_OFF)
+			link_info->autoneg = AUTONEG_DISABLE;
+		else
+			link_info->autoneg = AUTONEG_ENABLE;
+	}
+
+	switch (attrs->mattr.media) {
+	case SBL_LINK_MEDIA_ELECTRICAL:
+		link_info->port_type = PORT_DA;
+		break;
+	case SBL_LINK_MEDIA_OPTICAL:
+		link_info->port_type = PORT_FIBRE;
+		break;
+	default:
+		link_info->port_type = PORT_OTHER;
+		break;
+	}
+}
+
+/**
+ * cass_sbl_get_debug_flags() - Getter for debug flags
+ *
+ * Updates the input flags with the current debug flags.
+ *
+ * @hw: the device
+ * @debug_flags: storage for private CXI flags (CXI_ETH_PF_xxx)
+ */
+void cass_sbl_get_debug_flags(struct cass_dev *hw, u32 *debug_flags)
+{
+	u32 flags;
+
+	sbl_debug_get_config(hw->sbl, 0, &flags);
+
+	*debug_flags = 0;
+
+	if (flags & SBL_DEBUG_IGNORE_ALIGN)
+		*debug_flags |= CXI_ETH_PF_IGNORE_ALIGN;
+
+	if (flags & SBL_DEBUG_REMOTE_FAULT_RECOVERY)
+		*debug_flags |= CXI_ETH_PF_REMOTE_FAULT_RECOVERY;
+}
+
+/**
+ * cass_sbl_set_debug_flags() - Setter for debug flags
+ *
+ * Updates the debug flags.
+ *
+ * @hw: the device
+ * @clr_flags: desired clear flags
+ * @set_flags: desired set flags
+ */
+void cass_sbl_set_debug_flags(struct cass_dev *hw, u32 clr_flags, u32 set_flags)
+{
+	u32 clr_flags_sbl = 0;
+	u32 set_flags_sbl = 0;
+
+	if (clr_flags & CXI_ETH_PF_IGNORE_ALIGN)
+		clr_flags_sbl |= SBL_DEBUG_IGNORE_ALIGN;
+
+	if (set_flags & CXI_ETH_PF_IGNORE_ALIGN)
+		set_flags_sbl |= SBL_DEBUG_IGNORE_ALIGN;
+
+	if (clr_flags & CXI_ETH_PF_REMOTE_FAULT_RECOVERY)
+		clr_flags_sbl |= SBL_DEBUG_REMOTE_FAULT_RECOVERY;
+
+	if (set_flags & CXI_ETH_PF_REMOTE_FAULT_RECOVERY)
+		set_flags_sbl |= SBL_DEBUG_REMOTE_FAULT_RECOVERY;
+
+	sbl_debug_update_config(hw->sbl, 0, clr_flags_sbl, set_flags_sbl);
+}
+
+/* Return whether the link is up or down. */
+bool cass_sbl_is_link_up(struct cass_dev *hw)
+{
+	enum cass_link_status state = cass_link_get_state(hw);
+
+	return state == CASS_LINK_STATUS_UP;
+}
+
+/* sbl_ops follow */
+/**
+ * cass_read64() - wrapper around Cassini read function
+ *
+ * Read a CSR on BAR0.
+ *
+ * @pci_accessor: the SBL device
+ * @offset: offset of the CSR in the region
+ *
+ * Return: u64 containing the read result
+ */
+static u64 cass_read64(void *pci_accessor, long offset)
+{
+	struct cass_dev *hw = (struct cass_dev *)pci_accessor;
+	size_t len = sizeof(u64);
+	u64 data_out;
+
+	cass_read(hw, (u64)offset, &data_out, len);
+
+	return data_out;
+}
+
+/**
+ * cass_write64() - wrapper around Cassini write function
+ *
+ * Modify a control status register (CSR) on BAR0.
+ *
+ * @pci_accessor: the SBL device
+ * @offset: offset of the CSR in the region
+ * @val: data to write
+ */
+static void cass_write64(void *pci_accessor, long offset, u64 val)
+{
+	struct cass_dev *hw = (struct cass_dev *)pci_accessor;
+	size_t len = sizeof(u64);
+
+	cass_write(hw, (u64)offset, &val, len);
+}
+
+/**
+ * cass_read32() - wrapper around Cassini 64-bit read function
+ *
+ * Read a CSR on BAR0.
+ *
+ * @pci_accessor: the SBL device
+ * @offset: offset of the CSR in the region
+ *
+ * Return: u32 containing the read result
+ */
+static u32 cass_read32(void *pci_accessor, long offset)
+{
+	struct cass_dev *hw = (struct cass_dev *)pci_accessor;
+	size_t len = sizeof(u64);
+	u64 data_out;
+
+	cass_read(hw, (u64)offset, &data_out, len);
+
+	/* Explicit loss of precision here - Cassini doe not have 32-bit CSRs.
+	 *  CSRs which are described as 32 bits can be read/written
+	 *  Using the 64-bit access functions.
+	 */
+	return (u32)data_out;
+}
+
+/**
+ * cass_write32() - wrapper around Cassini 64-bit write function
+ *
+ * Modify a control status register (CSR) on BAR0.
+ *
+ * @pci_accessor: the SBL device
+ * @offset: offset of the CSR in the region
+ * @val: data to write
+ */
+static void cass_write32(void *pci_accessor, long offset, u32 val)
+{
+	struct cass_dev *hw = (struct cass_dev *)pci_accessor;
+	size_t len = sizeof(u64);
+	u64 wval = 0;
+
+	/* Explicit loss of precision here - Cassini doe not have 32-bit CSRs.
+	 *  CSRs which are described as 32 bits can be read/written
+	 *  Using the 64-bit access functions.
+	 */
+	wval |= val;
+	cass_write(hw, (u64)offset, &wval, len);
+}
+
+static bool cass_sbl_is_fabric_link(void *accessor, int port_num)
+{
+	return false;
+}
+
+/**
+ * cass_sbl_get_max_frame_size() - Get MTU
+ *
+ * Return the MTU value from the cxi_dev
+ *
+ * @accessor: the SBL device
+ * @port_num: unused
+ *
+ * Return: int containing the MTU
+ */
+static int cass_sbl_get_max_frame_size(void *accessor, int port_num)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+	u32 size = C_MAX_HPC_MTU;
+
+	/* SBL uses MTU to set LLR buffer size. Use the largest of the fixed
+	 * HPC frame size and configurable Ethernet (standard or optimized)
+	 * frame size(s).
+	 */
+	if (hw->max_eth_rxsize > size)
+		size = hw->max_eth_rxsize;
+
+	cxidev_dbg(&hw->cdev, "sbl get_max_frame_size returning %u\n", size);
+
+	return size;
+}
+
+/**
+ * cass_sbl_pml_hdlr() - The PML block intr handler
+ *
+ * This just calls into the sbl block handler, which determines the irq itself
+ *
+ * @hw: the device
+ * @irq: unused
+ * @is_ext: unused
+ * @bitn: unused
+ */
+static void cass_sbl_pml_hdlr(struct cass_dev *hw, unsigned int irq,
+			      bool is_ext, unsigned int bitn)
+{
+	int err;
+
+	err = sbl_pml_hdlr(hw->sbl, 0, NULL);
+	if (err)
+		cxidev_err(&hw->cdev, "(sbl): call to sbl_pml_hdl failed [%d]\n",
+			   err);
+}
+
+/**
+ * cass_sbl_pml_install_intr_handler() - Installs the PML block intr handler
+ *
+ * Wrapper around the Cassini IRQ registration function
+ *
+ * @accessor: the SBL device
+ * @port_num: unused
+ * @err_flags: bitmask of interrupts to enable
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_pml_install_intr_handler(void *accessor, int port_num,
+					     u64 err_flags)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+
+	cxidev_dbg(&hw->cdev, "(sbl): installing intr handlers\n");
+
+	hw->pml_err.irq = C_HNI_PML_IRQA_MSIX_INT;
+	hw->pml_err.is_ext = false;
+	hw->pml_err.err_flags.c1_hni_pml.qw = err_flags;
+	hw->pml_err.cb = cass_sbl_pml_hdlr;
+	cxi_register_hw_errors(hw, &hw->pml_err);
+
+	return 0;
+}
+
+/**
+ * cass_sbl_pml_enable_intr_handler() - Enable bits in PML block intr handler
+ *
+ * Wrapper around the Cassini IRQ enable function
+ *
+ * @accessor: the SBL device
+ * @port_num: unused
+ * @err_flags: bitmask of interrupts to enable
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_pml_enable_intr_handler(void *accessor, int port_num,
+					    u64 err_flags)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+	unsigned int irq = C_HNI_PML_IRQA_MSIX_INT;
+	bool is_ext = false;
+
+	cxidev_dbg(&hw->cdev, "(sbl): enabling intr handler\n");
+	cxi_enable_hw_errors(hw, irq, is_ext, (unsigned long *)&err_flags);
+
+	return 0;
+}
+
+/**
+ * cass_sbl_pml_remove_intr_handler() - Remove PML block intr handler
+ *
+ * Wrapper around the Cassini IRQ unregister function
+ *
+ * @accessor: the SBL device
+ * @port_num: unused
+ * @err_flags: unused
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_pml_remove_intr_handler(void *accessor, int port_num,
+					    u64 err_flags)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+
+	cxidev_dbg(&hw->cdev, "(sbl): removing intr handlers\n");
+	cxi_unregister_hw_errors(hw, &hw->pml_err);
+
+	return 0;
+}
+
+/**
+ * cass_sbl_pml_disable_intr_handler() - Disable bits in PML block intr handler
+ *
+ * Wrapper around the Cassini IRQ disable function
+ *
+ * @accessor: the SBL device
+ * @port_num: unused
+ * @err_flags: bitmask of interrupts to disable
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_pml_disable_intr_handler(void *accessor, int port_num,
+					     u64 err_flags)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+	unsigned int irq = C_HNI_PML_IRQA_MSIX_INT;
+	bool is_ext = false;
+
+	cxidev_dbg(&hw->cdev, "(sbl): disabling intr handler\n");
+	cxi_disable_hw_errors(hw, irq, is_ext, (unsigned long *)&err_flags);
+
+	return 0;
+}
+
+/**
+ * cass_sbl_link_down_async_handler() - link down handler
+ *
+ * Handler function called by the SBL async alert if the alert type is
+ * a link down event
+ *
+ * @hw: Cassini device
+ * @port_num: unused
+ * @down_origin: one of enum sbl_link_down_origin
+ */
+static void cass_sbl_link_down_async_handler(struct cass_dev *hw, int port_num,
+					     int down_origin)
+{
+	int down_reason;
+
+	cxidev_dbg(&hw->cdev, "(sbl): async link down\n");
+
+	switch (down_origin) {
+	case SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT:
+		down_reason = CASS_DOWN_ORIGIN_BL_LFAULT;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT:
+		down_reason = CASS_DOWN_ORIGIN_BL_RFAULT;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_ALIGN:
+		down_reason = CASS_DOWN_ORIGIN_BL_ALIGN;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_LINK_DOWN:
+		down_reason = CASS_DOWN_ORIGIN_BL_DOWN;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_HISER:
+		down_reason = CASS_DOWN_ORIGIN_BL_HISER;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_LLR_MAX:
+		down_reason = CASS_DOWN_ORIGIN_BL_LLR;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_UCW:
+		down_reason = CASS_DOWN_ORIGIN_LMON_UCW;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_CCW:
+		down_reason = CASS_DOWN_ORIGIN_LMON_CCW;
+		break;
+	case SBL_LINK_DOWN_ORIGIN_LLR_TX_REPLAY:
+		down_reason = CASS_DOWN_ORIGIN_LLR_TX_REPLAY;
+		break;
+	default:
+		down_reason = CASS_DOWN_ORIGIN_BL_UNKNOWN;
+		break;
+	}
+
+	cass_link_async_down(hw, down_reason);
+}
+
+/**
+ * cass_sbl_async_alert() - async alert
+ *
+ * Notification function asynchronously called by the base link when it sends
+ * an alert
+ *
+ * @accessor: the SBL device
+ * @port_num: port number
+ * @alert_type: one of enum sbl_async_alert_type
+ * @alert_data: opaque pointer to alert data
+ * @size: size of the data
+ */
+static void cass_sbl_async_alert(void *accessor, int port_num, int alert_type,
+				 void *alert_data, int size)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+	int down_origin;
+
+	cxidev_dbg(&hw->cdev, "(sbl): %s alert", sbl_async_alert_str(alert_type));
+
+	switch (alert_type) {
+	case SBL_ASYNC_ALERT_LINK_DOWN:
+		cxidev_warn(&hw->cdev, "(sbl): %d: link down alert\n",
+			    port_num);
+		down_origin = (int)(uintptr_t)alert_data;
+		cass_sbl_link_down_async_handler(hw, port_num, down_origin);
+		break;
+	case SBL_ASYNC_ALERT_SERDES_FW_CORRUPTION:
+		cxidev_crit(&hw->cdev, "(sbl): %d: serdes fw corruption alert\n",
+			    port_num);
+		break;
+	case SBL_ASYNC_ALERT_TX_DEGRADE:
+		cxidev_warn(&hw->cdev, "(sbl): %d: tx degrade alert\n",
+			    port_num);
+		break;
+	case SBL_ASYNC_ALERT_RX_DEGRADE:
+		cxidev_warn(&hw->cdev, "(sbl): %d: rx degrade alert\n",
+			    port_num);
+		break;
+	case SBL_ASYNC_ALERT_TX_DEGRADE_FAILURE:
+		cxidev_warn(&hw->cdev, "(sbl): %d: tx degrade failure alert\n",
+			    port_num);
+		break;
+	case SBL_ASYNC_ALERT_RX_DEGRADE_FAILURE:
+		cxidev_warn(&hw->cdev, "(sbl): %d: rx degrade failure alert\n",
+			    port_num);
+		break;
+	default:
+		cxidev_warn(&hw->cdev, "(sbl): %d: unknown alert reported: %d\n",
+			    port_num, alert_type);
+		break;
+	}
+}
+
+/**
+ * cass_sbl_sbus_op() - Perform an sbus operation
+ *
+ * Performs target sbus operation on this NIC's Cassini Sbus ring
+ *
+ * @accessor: the SBL device
+ * @ring: unused
+ * @req_data: Data for request
+ * @data_addr: Data address within the SBus Receiver
+ * @rx_addr: Address of destination SBus Receiver
+ * @command: Command for request
+ * @rsp_data: pointer to store response data
+ * @result_code: pointer to store result code from SBus request
+ * @overrun: pointer to store request overrun condition
+ * @timeout: timeout in ms
+ * @flags: specified polling delay and interval from cass_timing_flag
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_sbus_op(void *accessor, int ring, u32 req_data,
+			    u8 data_addr, u8 rx_addr, u8 command,
+			    u32 *rsp_data, u8 *result_code, u8 *overrun,
+			    int timeout, unsigned int flags)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+	struct cxi_sbus_op_params params = {
+		.req_data = req_data,
+		.data_addr = data_addr,
+		.rx_addr = rx_addr,
+		.command = command,
+		.timeout = timeout,
+	};
+
+	if (flags & SBL_FLAG_DELAY_3US)
+		params.delay = 3;
+	else if (flags & SBL_FLAG_DELAY_4US)
+		params.delay = 4;
+	else if (flags & SBL_FLAG_DELAY_5US)
+		params.delay = 5;
+	else if (flags & SBL_FLAG_DELAY_10US)
+		params.delay = 10;
+	else if (flags & SBL_FLAG_DELAY_20US)
+		params.delay = 20;
+	else if (flags & SBL_FLAG_DELAY_50US)
+		params.delay = 50;
+	else if (flags & SBL_FLAG_DELAY_100US)
+		params.delay = 100;
+	else
+		return -EINVAL;
+
+	if (flags & SBL_FLAG_INTERVAL_1MS)
+		params.poll_interval = 1;
+	else if (flags & SBL_FLAG_INTERVAL_10MS)
+		params.poll_interval = 10;
+	else if (flags & SBL_FLAG_INTERVAL_100MS)
+		params.poll_interval = 100;
+	else if (flags & SBL_FLAG_INTERVAL_1S)
+		params.poll_interval = 1000;
+	else
+		return -EINVAL;
+
+	return cxi_sbus_op(&hw->cdev, &params, rsp_data, result_code, overrun);
+}
+
+/**
+ * cass_sbl_sbus_op_reset() - Perform an sbus op reset
+ *
+ * Note this doesn't reset the sbus - all it does is clear the MB accessor
+ * registers
+ *
+ * @accessor: the SBL device
+ * @ring: unused
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_sbus_op_reset(void *accessor, int ring)
+{
+	struct cass_dev *hw = (struct cass_dev *)accessor;
+
+	return cxi_sbus_op_reset(&hw->cdev);
+}
+
+/* End sbl_ops */
+
+/* phy_ops follow */
+/**
+ * cass_sbl_init() - Create a base link device
+ *
+ * Implements phy_ops' .init function
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_sbl_init(struct cass_dev *hw)
+{
+	struct sbl_inst *sbl;
+	struct sbl_ops ops;
+	struct sbl_instance_attr sbl_attr = SBL_INSTANCE_ATTR_INITIALIZER;
+	struct sbl_init_attr sbl_iattr;
+	int err = 0;
+
+	ops.sbl_read32			 = cass_read32;
+	ops.sbl_write32			 = cass_write32;
+	ops.sbl_read64			 = cass_read64;
+	ops.sbl_write64			 = cass_write64;
+	ops.sbl_sbus_op			 = cass_sbl_sbus_op;
+	ops.sbl_sbus_op_reset		 = cass_sbl_sbus_op_reset;
+	ops.sbl_is_fabric_link		 = cass_sbl_is_fabric_link;
+	ops.sbl_get_max_frame_size	 = cass_sbl_get_max_frame_size;
+	ops.sbl_pml_install_intr_handler = cass_sbl_pml_install_intr_handler;
+	ops.sbl_pml_enable_intr_handler	 = cass_sbl_pml_enable_intr_handler;
+	ops.sbl_pml_remove_intr_handler	 = cass_sbl_pml_remove_intr_handler;
+	ops.sbl_pml_disable_intr_handler = cass_sbl_pml_disable_intr_handler;
+	ops.sbl_async_alert              = cass_sbl_async_alert;
+
+	sbl_iattr.magic = SBL_INIT_ATTR_MAGIC;
+	sbl_iattr.uc_nic = hw->uc_nic;
+
+	switch (hw->uc_platform) {
+	case CUC_BOARD_TYPE_SAWTOOTH:
+		sbl_iattr.uc_platform = SBL_UC_PLATFORM_SAWTOOTH;
+		break;
+	case CUC_BOARD_TYPE_BRAZOS:
+		sbl_iattr.uc_platform = SBL_UC_PLATFORM_BRAZOS;
+		break;
+	default:
+		sbl_iattr.uc_platform = SBL_UC_PLATFORM_UNKNOWN;
+	}
+
+	sbl = sbl_new_instance(hw, hw, &ops, &sbl_iattr);
+
+	if (IS_ERR(sbl)) {
+		cxidev_err(&hw->cdev, "new sbl instance failed [%ld]\n",
+			   PTR_ERR(sbl));
+		err = PTR_ERR(sbl);
+		goto out_bad_sbl;
+	}
+	hw->sbl = sbl;
+
+	/* initialise the base link instance */
+	strscpy(sbl_attr.inst_name, hw->cdev.name,
+		sizeof(sbl_attr.inst_name));
+	err = sbl_initialise_instance(hw->sbl, &sbl_attr);
+	if (err) {
+		cxidev_err(&hw->cdev, "sbl init failed [%d]\n", err);
+		sbl_delete_instance(hw->sbl);
+		goto out_bad_sbl;
+	}
+
+	hw->sbl_counters = NULL;
+	err = cass_sbl_counters_init(hw);
+	if (err)
+		sbl_delete_instance(hw->sbl);
+
+ out_bad_sbl:
+	if (err)
+		hw->sbl = NULL;
+
+	return err;
+}
+
+/**
+ * cass_sbl_exit() - Delete a base link device
+ *
+ * Implements phy_ops' .exit function
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_sbl_exit(struct cass_dev *hw)
+{
+	int err;
+
+	if (!hw->sbl)
+		return 0;
+
+	err = sbl_delete_instance(hw->sbl);
+	if (err) {
+		cxidev_err(&hw->cdev, "delete sbl instance failed [%d]\n", err);
+		return err;
+	}
+	cass_sbl_counters_term(hw);
+	hw->sbl = NULL;
+	return 0;
+}
+
+void cass_sbl_exit_legacy(struct cass_dev *hw)
+{
+	WARN_ON(cass_sbl_exit(hw));
+}
+
+/**
+ * cass_sbl_power_on() - Bring a link up
+ *
+ * Implements phy_ops' .power_on function
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_sbl_power_on(struct cass_dev *hw)
+{
+	bool auto_restart;
+	int blstate;
+	int err = 0;
+	bool auto_neg_timedout = false;
+
+	cxidev_dbg(&hw->cdev, "link: up starting\n");
+	atomic_inc(&hw->sbl_counters[link_up_tries]);
+
+	hw->port->config_state |= CASS_PORT_CONFIGURED;
+
+	if (cass_link_get_state(hw) == CASS_LINK_STATUS_UP)
+		goto out;
+	else
+		cass_link_set_state(hw, CASS_LINK_STATUS_STARTING, 0);
+
+	cass_link_set_down_origin(hw, CASS_DOWN_ORIGIN_NONE);
+	auto_restart = hw->port->lattr.options & CASS_LINK_OPT_UP_AUTO_RESTART;
+
+	if (hw->port->subtype != CASS_PORT_SUBTYPE_IEEE)
+		sbl_enable_opt_lane_degrade(hw->sbl, 0, true);
+	/*
+	 * bring up the base link (serdes,pcs,mac,[llr])
+	 */
+	err = sbl_base_link_start(hw->sbl, 0);
+	if (err) {
+		if (err == -ETIME)
+			auto_neg_timedout = true;
+
+		if (auto_restart || (err == -ECANCELED)) {
+			/*
+			 * link did not come up
+			 * try to cleanup base link for another restart attempt
+			 */
+			cxidev_dbg(&hw->cdev, "link: base link start failed [%d]\n",
+				   err);
+			sbl_base_link_try_start_fail_cleanup(hw->sbl, 0);
+			sbl_base_link_get_status(hw->sbl, 0, &blstate,
+						 NULL, NULL, NULL, NULL, NULL);
+			cxidev_dbg(&hw->cdev, "link: base link status = %d\n",
+				   blstate);
+			if (blstate == SBL_BASE_LINK_STATUS_DOWN)
+				goto out_non_fatal;
+			else if (blstate == SBL_BASE_LINK_STATUS_UNCONFIGURED)
+				goto out_non_fatal;
+			else
+				goto out_fatal;
+		} else {
+			cxidev_err(&hw->cdev, "link: base link start failed [%d]\n",
+				   err);
+			err = -ENOLINK;
+			goto out_fatal;
+		}
+	}
+
+	atomic_inc(&hw->sbl_counters[link_up]);
+
+	/* report success */
+out:
+	cass_link_set_state(hw, CASS_LINK_STATUS_UP, 0);
+	cass_phy_link_up(hw);
+
+	hw->port->start_time = ktime_get_seconds();
+
+	return 0;
+
+out_non_fatal:
+	if (!auto_neg_timedout) {
+		cass_link_set_state(hw, CASS_LINK_STATUS_DOWN, 0);
+		cass_phy_link_down(hw);
+	}
+
+	return err;
+
+	/*
+	 * fatal errors result in the error state and require a reset to clear
+	 */
+out_fatal:
+	cass_link_set_state(hw, CASS_LINK_STATUS_ERROR, err);
+
+	return err;
+}
+
+/**
+ * cass_sbl_power_off() - Bring a link down
+ *
+ * Implements phy_ops' .power_off function
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_sbl_power_off(struct cass_dev *hw)
+{
+	int err = 0;
+
+	cxidev_dbg(&hw->cdev, "link: down starting (from %s)\n",
+		   cass_link_state_str(cass_link_get_state(hw)));
+
+	atomic_inc(&hw->sbl_counters[link_down_tries]);
+
+	if (cass_link_get_state(hw) == CASS_LINK_STATUS_DOWN)
+		goto out;
+	else
+		cass_link_set_state(hw, CASS_LINK_STATUS_STOPPING, 0);
+
+	/*
+	 * ethernet links need to make sure all flows are empty
+	 */
+	sbl_pml_mac_stop(hw->sbl, 0);
+
+	/*
+	 * stop base link
+	 */
+	if (hw->port->link_down_origin == CASS_DOWN_ORIGIN_BL_HISER ||
+	    hw->port->link_down_origin == CASS_DOWN_ORIGIN_LMON_UCW ||
+	    hw->port->link_down_origin == CASS_DOWN_ORIGIN_BL_DOWN)
+		sbl_serdes_invalidate_tuning_params(hw->sbl, 0);
+
+	err = sbl_base_link_stop(hw->sbl, 0);
+	if (err) {
+		cxidev_err(&hw->cdev,
+			   "link: fabric stop, sbl_link_down failed [%d]\n",
+			   err);
+		goto out_fatal;
+	}
+
+	atomic_inc(&hw->sbl_counters[link_down]);
+
+	/* report success */
+out:
+	cass_link_set_state(hw, CASS_LINK_STATUS_DOWN, 0);
+	hw->port->config_state &= ~CASS_PORT_CONFIGURED;
+	cass_phy_link_down(hw);
+
+	return 0;
+
+out_fatal:
+	cass_link_set_state(hw, CASS_LINK_STATUS_ERROR, err);
+
+	return err;
+}
+
+/**
+ * cass_sbl_serdes_config_defaults() - Writes a Cassini-specific config to SBL
+ *
+ * Updates SBL config to include an additional SerDes config value set.
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_sbl_serdes_config_defaults(struct cass_dev *hw)
+{
+	struct sbl_sc_values vals = { 0 };
+	int rc, err;
+
+	/* CONFIG 1: 200G and 100G PEC to switch */
+	u64 port_mask = 0x1;
+	u8  serdes_mask = 0xf;
+	u64 tp_state_mask0 = sbl_create_tp_hash0((u8)CASS_SBL_SC_MASKED_IN,
+						 (u8)CASS_SBL_SC_MASKED_IN,
+						 (u8)CASS_SBL_SC_MASKED_OUT,
+						 (u8)CASS_SBL_SC_MASKED_OUT,
+						 (u8)CASS_SBL_SC_MASKED_IN,
+						 (u16)CASS_SBL_SC_MASKED_OUT);
+	u64 tp_state_mask1 = sbl_create_tp_hash1(CASS_SBL_SC_MASKED_IN);
+	u64 tp_state_match0 = sbl_create_tp_hash0(CASS_SBL_SC_LP_SWITCH,
+						 CASS_SBL_SC_LBM_ANY,
+						 CASS_SBL_SC_NA,
+						 CASS_SBL_SC_NA,
+						 CASS_SBL_SC_MT_ELEC,
+						 CASS_SBL_SC_NA);
+	u64 tp_state_match1 = sbl_create_tp_hash1(CASS_SBL_SC_NA);
+
+	vals.magic    = SBL_SERDES_CONFIG_MAGIC;
+	vals.atten    = SBL_DFLT_PORT_CONFIG_ATTEN;
+	vals.pre      = CASS_SBL_PORT_CONFIG1_PRE;
+	vals.post     = SBL_DFLT_PORT_CONFIG_POST;
+	vals.pre2     = SBL_DFLT_PORT_CONFIG_PRE2;
+	vals.pre3     = SBL_DFLT_PORT_CONFIG_PRE3;
+	vals.gs1      = SBL_DFLT_PORT_CONFIG_GS1_OPTICAL;
+	vals.gs2      = SBL_DFLT_PORT_CONFIG_GS2_OPTICAL;
+	vals.num_intr = SBL_DFLT_PORT_CONFIG_NUM_INTR;
+
+	err = sbl_serdes_add_config(hw->sbl, tp_state_mask0, tp_state_mask1,
+				    tp_state_match0, tp_state_match1, port_mask,
+				   serdes_mask, &vals, false);
+	/* If we failed trying to add a duplicate config - we still got what
+	 * we wanted. Return 0.
+	 */
+	if ((err == 0) || (err == -EEXIST))
+		rc = 0;
+	else
+		rc = err;
+
+	// CONFIG 2: 100G AOC to switch
+	// All the same mask/match params, save for the following:
+	tp_state_match0 = sbl_create_tp_hash0((u8)CASS_SBL_SC_LP_SWITCH,
+					      (u8)CASS_SBL_SC_LBM_ANY,
+					      (u8)CASS_SBL_SC_NA,
+					      (u8)CASS_SBL_SC_LM_100,
+					      (u8)CASS_SBL_SC_MT_OPT_ANY,
+					      (u16)CASS_SBL_SC_NA);
+	vals.atten    = CASS_SBL_PORT_CONFIG2_ATTEN;
+	vals.pre      = SBL_DFLT_PORT_CONFIG_PRE;
+	vals.post     = SBL_DFLT_PORT_CONFIG_POST;
+	vals.pre2     = SBL_DFLT_PORT_CONFIG_PRE2;
+	vals.pre3     = SBL_DFLT_PORT_CONFIG_PRE3;
+	vals.gs1      = CASS_SBL_PORT_CONFIG2_GS1;
+	vals.gs2      = SBL_DFLT_PORT_CONFIG_GS2_OPTICAL;
+	vals.num_intr = CASS_SBL_PORT_CONFIG2_NUM_INTR;
+	vals.intr_val[0] = CASS_SBL_PORT_CONFIG2_INTR0;
+	vals.data_val[0] = CASS_SBL_PORT_CONFIG2_DATA0;
+	vals.intr_val[1] = CASS_SBL_PORT_CONFIG2_INTR1;
+	vals.data_val[1] = CASS_SBL_PORT_CONFIG2_DATA1;
+	vals.intr_val[2] = CASS_SBL_PORT_CONFIG2_INTR2;
+	vals.data_val[2] = CASS_SBL_PORT_CONFIG2_DATA2;
+	vals.intr_val[3] = CASS_SBL_PORT_CONFIG2_INTR3;
+	vals.data_val[3] = CASS_SBL_PORT_CONFIG2_DATA3;
+
+	err = sbl_serdes_add_config(hw->sbl, tp_state_mask0, tp_state_mask1,
+				    tp_state_match0, tp_state_match1, port_mask,
+				   serdes_mask, &vals, false);
+	if ((err == 0) || (err == -EEXIST))
+		rc += 0;
+	else
+		rc += err;
+
+	// CONFIG 3: 200G AOC to switch
+	// All the same mask/match params, save for the following:
+	tp_state_match0 = sbl_create_tp_hash0((u8)CASS_SBL_SC_LP_SWITCH,
+					      (u8)CASS_SBL_SC_LBM_ANY,
+					      (u8)CASS_SBL_SC_NA,
+					      (u8)CASS_SBL_SC_LM_200,
+					      (u8)CASS_SBL_SC_MT_OPT_ANY,
+					      (u16)CASS_SBL_SC_NA);
+	vals.atten    = CASS_SBL_PORT_CONFIG3_ATTEN;
+	vals.pre      = CASS_SBL_PORT_CONFIG3_PRE;
+	vals.post     = SBL_DFLT_PORT_CONFIG_POST;
+	vals.pre2     = SBL_DFLT_PORT_CONFIG_PRE2;
+	vals.pre3     = SBL_DFLT_PORT_CONFIG_PRE3;
+	vals.gs1      = CASS_SBL_PORT_CONFIG3_GS1;
+	vals.gs2      = SBL_DFLT_PORT_CONFIG_GS2_OPTICAL;
+	vals.num_intr = SBL_DFLT_PORT_CONFIG_NUM_INTR;
+
+	err = sbl_serdes_add_config(hw->sbl, tp_state_mask0, tp_state_mask1,
+				    tp_state_match0, tp_state_match1, port_mask,
+				   serdes_mask, &vals, false);
+	if ((err == 0) || (err == -EEXIST))
+		rc += 0;
+	else
+		rc += err;
+
+	if (rc)
+		cxidev_err(&hw->cdev, "Failed to update SBL config [%d]\n", rc);
+	return rc;
+}
+
+/**
+ * cass_sbl_set_defaults() - Set link defaults
+ *
+ * Sets reasonable defaults for 200G Electrical link
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+void cass_sbl_set_defaults(struct cass_dev *hw)
+{
+	struct sbl_media_attr mattr;
+
+	/* The media attribute can be configured during cable scan, which has
+	 * already happened. Don't blow away this information.
+	 */
+	mattr = hw->port->lattr.mattr;
+	memset(&hw->port->lattr, 0, sizeof(struct cass_link_attr));
+	hw->port->lattr.mattr = mattr;
+
+	/* base link config */
+	hw->port->lattr.bl.magic = SBL_LINK_ATTR_MAGIC;
+	hw->port->lattr.bl.options = SBL_OPT_ENABLE_PCAL | SBL_DISABLE_PML_RECOVERY;
+	hw->port->lattr.options = CASS_LINK_ATTR_DEFAULT_OPT_FLAGS
+		| CASS_LINK_OPT_UP_AUTO_RESTART;
+
+	switch (hw->port->lattr.mattr.media) {
+	case SBL_LINK_MEDIA_ELECTRICAL:
+	default:
+		hw->port->lattr.bl.options |= SBL_OPT_AUTONEG_TIMEOUT_SSHOT |
+			SBL_OPT_AUTONEG_100CR4_FIXUP;
+		hw->port->lattr.bl.start_timeout =
+			SBL_LINK_START_TIMEOUT_PEC;
+		hw->port->lattr.bl.config_target =
+			SBL_BASE_LINK_CONFIG_PEC;
+		hw->port->lattr.bl.pec.an_mode =
+			SBL_AN_MODE_ON;
+		hw->port->lattr.bl.pec.an_retry_timeout =
+			SBL_LINK_DFLT_AN_RETRY_TIMEOUT;
+		hw->port->lattr.bl.pec.an_max_retry =
+			SBL_LINK_DFLT_AN_MAX_RETRY;
+		hw->port->lattr.bl.lpd_timeout = 0;
+		hw->port->lattr.bl.lpd_poll_interval = 0;
+		hw->port->lattr.bl.dfe_pre_delay =
+			SBL_DFLT_DFE_PRE_DELAY_PEC;
+		hw->port->lattr.bl.dfe_timeout =
+			SBL_DFLT_DFE_TIMEOUT_PEC;
+		hw->port->lattr.bl.dfe_poll_interval =
+			SBL_DFLT_DFE_POLL_INTERVAL;
+		hw->port->lattr.bl.pcal_eyecheck_holdoff =
+			SBL_DFLT_PCAL_EYECHECK_HOLDOFF_PEC;
+		hw->port->lattr.bl.nrz_min_eye_height =
+			SBL_DFLT_NRZ_PEC_MIN_EYE_HEIGHT;
+		hw->port->lattr.bl.nrz_max_eye_height =
+			SBL_DFLT_NRZ_PEC_MAX_EYE_HEIGHT;
+		hw->port->lattr.bl.pam4_min_eye_height =
+			SBL_DFLT_PAM4_PEC_MIN_EYE_HEIGHT;
+		hw->port->lattr.bl.pam4_max_eye_height =
+			SBL_DFLT_PAM4_PEC_MAX_EYE_HEIGHT;
+		break;
+	case SBL_LINK_MEDIA_OPTICAL:
+		hw->port->lattr.bl.start_timeout =
+			SBL_LINK_START_TIMEOUT_AOC;
+		hw->port->lattr.bl.config_target =
+			SBL_BASE_LINK_CONFIG_AOC;
+		hw->port->lattr.bl.aoc.reserved = 0;
+		hw->port->lattr.bl.aoc.optical_lock_delay =
+			SBL_DFLT_OPTICAL_LOCK_DELAY;
+		hw->port->lattr.bl.aoc.optical_lock_interval =
+			SBL_DFLT_OPTICAL_LOCK_INTERVAL;
+		/* hw->port->lattr.bl.options |= */
+		/*	SBL_OPT_SERDES_LPD; */
+		hw->port->lattr.bl.lpd_timeout =
+			SBL_DFLT_LPD_TIMEOUT;
+		hw->port->lattr.bl.lpd_poll_interval =
+			SBL_DFLT_LPD_POLL_INTERVAL;
+		hw->port->lattr.bl.dfe_pre_delay =
+			SBL_DFLT_DFE_PRE_DELAY_AOC;
+		hw->port->lattr.bl.dfe_timeout =
+			SBL_DFLT_DFE_TIMEOUT_AOC;
+		hw->port->lattr.bl.dfe_poll_interval =
+			SBL_DFLT_DFE_POLL_INTERVAL;
+		hw->port->lattr.bl.pcal_eyecheck_holdoff =
+			SBL_DFLT_PCAL_EYECHECK_HOLDOFF_AOC;
+		hw->port->lattr.bl.nrz_min_eye_height =
+			SBL_DFLT_NRZ_AOC_MIN_EYE_HEIGHT;
+		hw->port->lattr.bl.nrz_max_eye_height =
+			SBL_DFLT_NRZ_AOC_MAX_EYE_HEIGHT;
+		hw->port->lattr.bl.pam4_min_eye_height =
+			SBL_DFLT_PAM4_AOC_MIN_EYE_HEIGHT;
+		hw->port->lattr.bl.pam4_max_eye_height =
+			SBL_DFLT_PAM4_AOC_MAX_EYE_HEIGHT;
+		break;
+	}
+
+	if ((HW_PLATFORM_Z1(hw)) &&
+	    (hw->port->lattr.mattr.media == SBL_LINK_MEDIA_ELECTRICAL)) {
+		hw->port->lattr.bl.pec.an_mode = SBL_AN_MODE_FIXED;
+	}
+
+	hw->port->lattr.bl.link_mode          = SBL_LINK_MODE_BS_200G;
+	hw->port->lattr.bl.loopback_mode      = SBL_LOOPBACK_MODE_OFF;
+	hw->port->lattr.bl.link_partner       = SBL_LINK_PARTNER_SWITCH;
+	hw->port->lattr.bl.tuning_pattern     = SBL_TUNING_PATTERN_CORE;
+	hw->port->lattr.bl.fec_mode           = SBL_RS_MODE_ON;
+	hw->port->lattr.bl.enable_autodegrade = 0;
+	if (HW_PLATFORM_ASIC(hw))
+		hw->port->lattr.bl.llr_mode   = SBL_LLR_MODE_ON;
+	else
+		hw->port->lattr.bl.llr_mode   = SBL_LLR_MODE_OFF;
+	hw->port->lattr.bl.ifg_config         = SBL_IFG_CONFIG_IEEE_200G;
+	hw->port->lattr.bl.precoding          = SBL_PRECODING_OFF;
+
+	hw->port->lattr.bl.pml_recovery.timeout         = pml_rec_timeout;
+	hw->port->lattr.bl.pml_recovery.rl_max_duration = pml_rec_rl_max_dur;
+	hw->port->lattr.bl.pml_recovery.rl_window_size  = pml_rec_rl_win_size;
+}
+
+/**
+ * cass_sbl_configure() - Send configuration to SBL
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_sbl_configure(struct cass_dev *hw)
+{
+	int err;
+
+	cxidev_dbg(&hw->cdev, "Configuring SBL\n");
+
+	if ((hw->port->lattr.bl.llr_mode == SBL_LLR_MODE_ON) ||
+	    (hw->port->lattr.bl.ifg_config == SBL_IFG_CONFIG_HPC))
+		hw->port->subtype = CASS_PORT_SUBTYPE_CASSINI;
+	else
+		hw->port->subtype = CASS_PORT_SUBTYPE_IEEE;
+
+	err = hw->link_ops->link_config(hw);
+	if (err) {
+		cxidev_err(&hw->cdev, "configure failed [%d]\n", err);
+		return err;
+	}
+
+	cass_link_set_state(hw, CASS_LINK_STATUS_DOWN, 0);
+	hw->link_config_dirty = false;
+	hw->port->config_state |= CASS_TYPE_CONFIGURED | CASS_LINK_CONFIGURED;
+
+	return err;
+}
+
+/**
+ * cass_sbl_reset() - Reset a link
+ *
+ * Implements phy_ops' .reset function
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_sbl_reset(struct cass_dev *hw)
+{
+	int bl_state;
+	int err;
+
+	cxidev_dbg(&hw->cdev, "link: reset (from %s)\n",
+		   cass_link_state_str(cass_link_get_state(hw)));
+
+	atomic_inc(&hw->sbl_counters[link_reset_tries]);
+
+	cass_link_set_state(hw, CASS_LINK_STATUS_RESETTING, 0);
+
+	/* reset the base link */
+	sbl_base_link_get_status(hw->sbl, 0, &bl_state, NULL, NULL, NULL,
+				 NULL, NULL);
+
+	if (bl_state != SBL_BASE_LINK_STATUS_UNCONFIGURED) {
+		err = sbl_base_link_reset(hw->sbl, 0);
+		if (err)
+			cxidev_err(&hw->cdev,
+				   "link: reset, base link reset failed [%d]\n",
+				   err);
+	}
+
+	spin_lock(&hw->sbl_state_lock);
+	hw->port->prev_lstate = hw->port->lstate;
+	hw->port->lstate = CASS_LINK_STATUS_UNCONFIGURED;
+	hw->port->lerr = 0;
+	hw->port->config_state &= ~CASS_LINK_CONFIGURED;
+	spin_unlock(&hw->sbl_state_lock);
+
+	atomic_inc(&hw->sbl_counters[link_reset]);
+
+	return 0;
+}
+
+/* end phy_ops */
+
+/* sysfs */
+static ssize_t link_show(struct kobject *kobj,
+			 struct kobj_attribute *kattr, char *buf)
+{
+	int rc;
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, port_kobj);
+
+	if (!cass_version(hw, CASSINI_1))
+		return snprintf(buf, SYSFS_BUFSIZE, "NOT IMPLEMENTED!!\n");
+
+	rc = cass_link_sysfs_sprint(hw, buf, PAGE_SIZE);
+
+	return rc;
+}
+
+static ssize_t link_layer_retry_show(struct kobject *kobj,
+				     struct kobj_attribute *kattr, char *buf)
+{
+	int rc;
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, port_kobj);
+
+	if (!cass_version(hw, CASSINI_1))
+		return snprintf(buf, SYSFS_BUFSIZE, "NOT IMPLEMENTED!!\n");
+
+	rc = sbl_base_link_llr_sysfs_sprint(hw->sbl, 0, buf, PAGE_SIZE);
+
+	return rc;
+}
+
+static ssize_t loopback_show(struct kobject *kobj,
+			     struct kobj_attribute *kattr, char *buf)
+{
+	int rc;
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, port_kobj);
+
+	if (!cass_version(hw, CASSINI_1))
+		return snprintf(buf, SYSFS_BUFSIZE, "NOT IMPLEMENTED!!\n");
+
+	rc = sbl_base_link_loopback_sysfs_sprint(hw->sbl, 0, buf, PAGE_SIZE);
+
+	return rc;
+}
+
+static ssize_t media_show(struct kobject *kobj,
+			  struct kobj_attribute *kattr, char *buf)
+{
+	int rc;
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, port_kobj);
+
+	if (!cass_version(hw, CASSINI_1))
+		return snprintf(buf, SYSFS_BUFSIZE, "NOT IMPLEMENTED!!\n");
+
+	rc = sbl_media_type_sysfs_sprint(hw->sbl, 0, buf, PAGE_SIZE);
+
+	return rc;
+}
+
+static ssize_t pause_show(struct kobject *kobj,
+			  struct kobj_attribute *kattr, char *buf)
+{
+	int rc;
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, port_kobj);
+
+	if (!cass_version(hw, CASSINI_1))
+		return snprintf(buf, SYSFS_BUFSIZE, "NOT IMPLEMENTED!!\n");
+
+	rc = cass_pause_sysfs_sprint(hw, buf, PAGE_SIZE);
+
+	return rc;
+}
+
+static ssize_t speed_show(struct kobject *kobj,
+			  struct kobj_attribute *kattr, char *buf)
+{
+	int rc;
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, port_kobj);
+
+	if (!cass_version(hw, CASSINI_1))
+		return snprintf(buf, SYSFS_BUFSIZE, "NOT IMPLEMENTED!!\n");
+
+	rc = sbl_pml_pcs_speed_sysfs_sprint(hw->sbl, 0, buf, PAGE_SIZE);
+
+	return rc;
+}
+
+static struct kobj_attribute dev_attr_link = __ATTR_RO(link);
+static struct kobj_attribute dev_attr_link_layer_retry =
+	__ATTR_RO(link_layer_retry);
+static struct kobj_attribute dev_attr_loopback = __ATTR_RO(loopback);
+static struct kobj_attribute dev_attr_media = __ATTR_RO(media);
+static struct kobj_attribute dev_attr_pause = __ATTR_RO(pause);
+static struct kobj_attribute dev_attr_speed = __ATTR_RO(speed);
+
+static struct attribute *port_attrs[] = {
+	&dev_attr_link.attr,
+	&dev_attr_link_layer_retry.attr,
+	&dev_attr_loopback.attr,
+	&dev_attr_media.attr,
+	&dev_attr_pause.attr,
+	&dev_attr_speed.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(port);
+
+static struct kobj_type port_sysfs_entries = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = port_groups,
+};
+
+int cass_register_port(struct cass_dev *hw)
+{
+	int rc;
+
+	/* Create the port sysfs entries */
+	rc = kobject_init_and_add(&hw->port_kobj, &port_sysfs_entries,
+				  &hw->cdev.pdev->dev.kobj,
+				  "port");
+	if (rc)
+		kobject_put(&hw->port_kobj);
+
+	return rc;
+}
+
+void cass_unregister_port(struct cass_dev *hw)
+{
+	kobject_put(&hw->port_kobj);
+}
+
+void cass_sbl_link_mode_to_speed(u32 link_mode, int *speed)
+{
+	switch (link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		*speed = SPEED_200000;
+		return;
+	case SBL_LINK_MODE_BJ_100G:
+	case SBL_LINK_MODE_CD_100G:
+		*speed = SPEED_100000;
+		return;
+	case SBL_LINK_MODE_CD_50G:
+		*speed = SPEED_50000;
+		return;
+	default:
+		*speed = SPEED_UNKNOWN;
+		return;
+	}
+}
+
+void cass_sbl_link_speed_to_mode(int speed, u32 *link_mode)
+{
+	switch (speed) {
+	case SPEED_200000:
+	case SPEED_UNKNOWN:
+		*link_mode = SBL_LINK_MODE_BS_200G;
+		return;
+	case SPEED_100000:
+		*link_mode = SBL_LINK_MODE_BJ_100G;
+		return;
+	case SPEED_50000:
+		*link_mode = SBL_LINK_MODE_CD_50G;
+		return;
+	default:
+		*link_mode = SBL_LINK_MODE_INVALID;
+		return;
+	}
+}
+
+int cass_sbl_media_config(struct cass_dev *hw, void *attr)
+{
+	int err;
+
+	cxidev_dbg(&hw->cdev, "sbl media config\n");
+
+	err = sbl_media_config(hw->sbl, 0, attr);
+	if (err) {
+		cxidev_err(&hw->cdev, "sbl media config failed [%d]\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+int cass_sbl_media_unconfig(struct cass_dev *hw)
+{
+	int err;
+
+	cxidev_dbg(&hw->cdev, "sbl media unconfig\n");
+
+	err = sbl_media_unconfig(hw->sbl, 0);
+	if (err) {
+		cxidev_err(&hw->cdev, "sbl media unconfig failed [%d]\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+int cass_sbl_link_config(struct cass_dev *hw)
+{
+	int err;
+
+	cxidev_dbg(&hw->cdev, "sbl link config\n");
+
+	err = sbl_base_link_config(hw->sbl, 0, &hw->port->lattr.bl);
+	if (err) {
+		cxidev_err(&hw->cdev, "Failed to set SBL config defaults\n");
+		return err;
+	}
+
+	err = cass_sbl_serdes_config_defaults(hw);
+	if (err) {
+		cxidev_err(&hw->cdev, "Failed to set SerDes config defaults\n");
+		return err;
+	}
+
+	return 0;
+}
+
+bool cass_sbl_pml_pcs_aligned(struct cass_dev *hw)
+{
+	return sbl_pml_pcs_aligned(hw->sbl, 0);
+}
+
+/*
+ * Create and initialise the port's counter array
+ */
+int cass_sbl_counters_init(struct cass_dev *hw)
+{
+	int i;
+
+	hw->sbl_counters = kzalloc(sizeof(atomic_t) * CASS_SBL_NUM_COUNTERS, GFP_KERNEL);
+	if (!hw->sbl_counters)
+		return -ENOMEM;
+
+	for (i = 0; i < CASS_SBL_NUM_COUNTERS; ++i)
+		atomic_set(&hw->sbl_counters[i], 0);
+
+	return 0;
+}
+
+/*
+ * Destroy the port's counter array
+ */
+void cass_sbl_counters_term(struct cass_dev *hw)
+{
+	kfree(hw->sbl_counters);
+	hw->sbl_counters = NULL;
+}
+
+/*
+ * Update down origin counters
+ */
+void cass_sbl_counters_down_origin_inc(struct cass_dev *hw, int down_origin)
+{
+	switch (down_origin) {
+	case CASS_DOWN_ORIGIN_CONFIG:
+		atomic_inc(&hw->sbl_counters[link_down_origin_config]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_LFAULT:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_lfault]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_RFAULT:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_rfault]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_ALIGN:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_align]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_DOWN:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_down]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_HISER:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_hiser]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_LLR:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_llr]);
+		break;
+	case CASS_DOWN_ORIGIN_BL_UNKNOWN:
+		atomic_inc(&hw->sbl_counters[link_down_origin_bl_unknown]);
+		break;
+	case CASS_DOWN_ORIGIN_LMON_UCW:
+		atomic_inc(&hw->sbl_counters[link_down_origin_lmon_ucw]);
+		break;
+	case CASS_DOWN_ORIGIN_LMON_CCW:
+		atomic_inc(&hw->sbl_counters[link_down_origin_lmon_ccw]);
+		break;
+	case CASS_DOWN_ORIGIN_LLR_TX_REPLAY:
+		atomic_inc(&hw->sbl_counters[link_down_origin_lmon_llr_tx_replay]);
+		break;
+	case CASS_DOWN_ORIGIN_HEADSHELL_REMOVED:
+		atomic_inc(&hw->sbl_counters[link_down_origin_headshell_removed]);
+		break;
+	case CASS_DOWN_ORIGIN_HEADSHELL_ERROR:
+		atomic_inc(&hw->sbl_counters[link_down_origin_headshell_error]);
+		break;
+	case CASS_DOWN_ORIGIN_MEDIA_REMOVED:
+		atomic_inc(&hw->sbl_counters[link_down_origin_media_removed]);
+		break;
+	case CASS_DOWN_ORIGIN_CMD:
+		atomic_inc(&hw->sbl_counters[link_down_origin_cmd]);
+		break;
+	default:
+		cxidev_err(&hw->cdev, "down origin (%d) with no counter", down_origin);
+		break;
+	}
+}
+
+/*
+ * Update sbl counters
+ */
+void cass_sbl_counters_update(struct cass_dev *hw)
+{
+	int sbl_counters[SBL_NUM_COUNTERS];
+	int i;
+	int err;
+
+	err = sbl_link_counters_get(hw->sbl, 0, sbl_counters, 0, SBL_NUM_COUNTERS);
+	if (err)
+		return;
+
+	for (i = 0; i < SBL_NUM_COUNTERS; ++i)
+		atomic_set(&hw->sbl_counters[SBL_COUNTERS_FIRST + i], sbl_counters[i]);
+}
+
+int cass_sbl_set_eth_name(struct cass_dev *hw, const char *name)
+{
+	sbl_set_eth_name(hw->sbl, name);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sl.c b/drivers/net/ethernet/hpe/ss1/cass_sl.c
new file mode 100644
index 000000000000..72c8724a3327
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sl.c
@@ -0,0 +1,1524 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025,2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+
+#include "cass_core.h"
+#include "cass_sl.h"
+#include "cass_sl_io.h"
+#include "cass_cable.h"
+#include "cxi_ethtool.h"
+
+#define CASS_SL_LGRP_NUM            0
+#define CASS_SL_LINK_NUM            0
+#define CASS_SL_LLR_NUM             0
+#define CASS_SL_MAC_NUM             0
+
+#define CASS_SL_INFO_MAP_STR_SIZE   80
+
+#define CASS_SL_SERDES_RATE_25  25781250000ULL
+#define CASS_SL_SERDES_RATE_50  53125000000ULL
+#define CASS_SL_SERDES_RATE_100 106250000000ULL
+
+#define CASS_SL_LINK_DOWN_TIMEOUT_MS  5000
+
+/* Default BER goals for FEC
+ * The maximum rate LLR can incur UCWs (1e-10). Typically a burst error
+ */
+#define CASS_SL_DEFAULT_BER_MANT_UCW 1
+#define CASS_SL_DEFAULT_BER_EXP_UCW  -10
+
+#define CASS_SL_DEFAULT_BER_MANT_CCW 2
+#define CASS_SL_DEFAULT_BER_EXP_CCW  -5
+
+#define SL_DFLT_PML_REC_TIMEOUT_MS                 60
+#define SL_DFLT_PML_REC_RATE_LIMIT_MAX_TIME_MS     60
+#define SL_DFLT_PML_REC_RATE_LIMIT_WINDOW_SIZE_MS  1000
+
+static unsigned int cass_sl_pml_rec_timeout_ms = SL_DFLT_PML_REC_TIMEOUT_MS;
+module_param(cass_sl_pml_rec_timeout_ms, uint, 0644);
+MODULE_PARM_DESC(cass_sl_pml_rec_timeout_ms, "PML recovery timeout in ms");
+
+static unsigned int cass_sl_pml_rec_rate_limit_max_time_ms = SL_DFLT_PML_REC_RATE_LIMIT_MAX_TIME_MS;
+module_param(cass_sl_pml_rec_rate_limit_max_time_ms, uint, 0644);
+MODULE_PARM_DESC(cass_sl_pml_rec_rate_limit_max_time_ms, "PML recovery max time in ms per window");
+
+static unsigned int cass_sl_pml_rec_rate_limit_win_size_ms = SL_DFLT_PML_REC_RATE_LIMIT_WINDOW_SIZE_MS;
+module_param(cass_sl_pml_rec_rate_limit_win_size_ms, uint, 0644);
+MODULE_PARM_DESC(cass_sl_pml_rec_rate_limit_win_size_ms, "PML recovery rate limiter window in ms");
+
+static struct kobj_type cass_sl_port_sysfs = {
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static struct kobj_type cass_sl_port_num_sysfs = {
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+bool cass_sl_is_pcs_aligned(struct cass_dev *cass_dev)
+{
+	union ss2_port_pml_sts_rx_pcs_subport sts;
+
+	cass_read(cass_dev, SS2_PORT_PML_STS_RX_PCS_SUBPORT(CASS_SL_LINK_NUM),
+		  &sts, sizeof(sts));
+
+	return !!sts.align_status;
+}
+
+static int cass_sl_speed_get(u32 tech)
+{
+	switch (tech) {
+	case SL_LGRP_CONFIG_TECH_BJ_100G:
+		return SPEED_100000;
+	case SL_LGRP_CONFIG_TECH_BS_200G:
+		return SPEED_200000;
+	case SL_LGRP_CONFIG_TECH_CK_400G:
+		return SPEED_400000;
+	default:
+		return 0;
+	}
+}
+
+static u32 cass_sl_tech_get(int speed)
+{
+	switch (speed) {
+	case SPEED_100000:
+		return SL_LGRP_CONFIG_TECH_BJ_100G;
+	case SPEED_200000:
+		return SL_LGRP_CONFIG_TECH_BS_200G;
+	case SPEED_400000:
+		return SL_LGRP_CONFIG_TECH_CK_400G;
+	default:
+		return 0;
+	}
+}
+
+void cass_sl_mode_get(struct cass_dev *cass_dev, struct cxi_link_info *link_info)
+{
+	cxidev_dbg(&cass_dev->cdev, "sl mode get\n");
+
+	memset(link_info, 0, sizeof(*link_info));
+
+	/* auto neg */
+	if (cass_dev->sl.link_config.options & SL_LINK_CONFIG_OPT_AUTONEG_ENABLE) {
+		cxidev_dbg(&cass_dev->cdev, "sl mode get autoneg enabled\n");
+		link_info->autoneg = AUTONEG_ENABLE;
+		link_info->speed   = cass_sl_speed_get(cass_dev->sl.link_up_mode);
+	} else {
+		cxidev_dbg(&cass_dev->cdev,
+			   "sl mode get autoneg disabled (tech_map = 0x%X)\n",
+			   cass_dev->sl.static_tech_map);
+		link_info->autoneg = AUTONEG_DISABLE;
+		link_info->speed   = cass_sl_speed_get(cass_dev->sl.static_tech_map);
+	}
+
+	/* llr */
+	if (cass_dev->sl.enable_llr)
+		link_info->flags |= CXI_ETH_PF_LLR;
+
+	/* loopback */
+	if (cass_dev->sl.lgrp_config.options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)
+		link_info->flags |= CXI_ETH_PF_INTERNAL_LOOPBACK;
+	else if (cass_dev->sl.link_config.options & SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE)
+		link_info->flags |= CXI_ETH_PF_EXTERNAL_LOOPBACK;
+
+	/* link training */
+	if (cass_dev->sl.link_config.hpe_map & SL_LINK_CONFIG_HPE_LINKTRAIN)
+		link_info->flags |= CXI_ETH_PF_LINKTRAIN;
+	else
+		link_info->flags &= ~CXI_ETH_PF_LINKTRAIN;
+
+	/* FEC Monitor */
+	if (cass_dev->sl.link_policy.fec_mon_period_ms != 0)
+		link_info->flags |= CXI_ETH_PF_FEC_MONITOR;
+
+	if (cass_dev->sl.link_config.options & SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE)
+		link_info->flags |= CXI_ETH_PF_LOS_LOL_HIDE;
+
+	/* R1 link partner */
+	if (cass_dev->sl.lgrp_config.options & SL_LGRP_CONFIG_OPT_R1)
+		link_info->flags |= CXI_ETH_PF_R1_LINK_PARTNER;
+	else
+		link_info->flags &= ~CXI_ETH_PF_R1_LINK_PARTNER;
+
+	/* type */
+	if (cass_dev->sl.media_attr.type & SL_MEDIA_TYPE_BACKPLANE)
+		link_info->port_type = PORT_DA;
+	else if (cass_dev->sl.media_attr.type & SL_MEDIA_TYPE_OPTICAL)
+		link_info->port_type = PORT_FIBRE;
+	else if (cass_dev->sl.media_attr.type & SL_MEDIA_TYPE_ELECTRICAL)
+		link_info->port_type = PORT_TP;
+	else
+		link_info->port_type = PORT_OTHER;
+
+	/* fec type */
+	if (cass_dev->sl.link_up_fec_type == SL_LGRP_CONFIG_FEC_RS)
+		link_info->fec_type = ETHTOOL_FEC_RS;
+	else if (cass_dev->sl.link_up_fec_type == SL_LGRP_CONFIG_FEC_RS_LL)
+		link_info->fec_type = ETHTOOL_FEC_LLRS;
+	else
+		link_info->fec_type = ETHTOOL_FEC_OFF;
+
+	cxidev_dbg(&cass_dev->cdev,
+		   "sl mode get (type = %u, AN = %u, speed = %u, llr = %lu, fec = %u, LB = %lu, R1 = %u)\n",
+		   link_info->port_type, link_info->autoneg, link_info->speed,
+		   link_info->flags & CXI_ETH_PF_LLR, !!(link_info->flags & CXI_ETH_PF_FEC_MONITOR),
+		   link_info->flags & LOOPBACK_MODE, !!(link_info->flags & CXI_ETH_PF_R1_LINK_PARTNER));
+}
+
+static void cass_sl_mode_set_autoneg_enable(struct cass_dev *cass_dev)
+{
+	cass_dev->sl.link_config.options |= SL_LINK_CONFIG_OPT_AUTONEG_ENABLE;
+	cass_dev->sl.lgrp_config.tech_map = cass_dev->sl.autoneg_tech_map;
+}
+
+static void cass_sl_mode_set_autoneg_disable(struct cass_dev *cass_dev)
+{
+	cass_dev->sl.link_config.options &= ~SL_LINK_CONFIG_OPT_AUTONEG_ENABLE;
+	cass_dev->sl.lgrp_config.tech_map = cass_dev->sl.static_tech_map;
+}
+
+void cass_sl_mode_set(struct cass_dev *cass_dev, const struct cxi_link_info *link_info)
+{
+	struct sl_link_config *link_config;
+	struct sl_link_policy *link_policy;
+	struct sl_lgrp_config *lgrp_config;
+	u32                    autoneg_mode;
+	u32                    tech_mode;
+	bool                   is_mode_changed;
+
+	cxidev_dbg(&cass_dev->cdev, "sl mode set\n");
+
+	link_config = &cass_dev->sl.link_config;
+	link_policy = &cass_dev->sl.link_policy;
+	lgrp_config = &cass_dev->sl.lgrp_config;
+	is_mode_changed = false;
+
+	/* speed */
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (speed = %d)\n", link_info->speed);
+	tech_mode = cass_sl_tech_get(link_info->speed);
+	if (tech_mode && cass_dev->sl.static_tech_map != tech_mode) {
+		cxidev_dbg(&cass_dev->cdev, "sl mode set tech_mode to 0x%X\n", tech_mode);
+		cass_dev->sl.static_tech_map = tech_mode;
+		if (!(cass_dev->sl.link_config.options & SL_LINK_CONFIG_OPT_AUTONEG_ENABLE))
+			cass_dev->sl.lgrp_config.tech_map = cass_dev->sl.static_tech_map;
+		is_mode_changed = true;
+	}
+
+	/* auto neg */
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (autoneg = %d)\n", link_info->autoneg);
+	autoneg_mode = link_config->options & SL_LINK_CONFIG_OPT_AUTONEG_ENABLE;
+	switch (link_info->autoneg) {
+	case AUTONEG_DISABLE:
+		if (autoneg_mode == 0)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set autoneg to off\n");
+		cass_sl_mode_set_autoneg_disable(cass_dev);
+		is_mode_changed = true;
+		break;
+	case AUTONEG_ENABLE:
+		if (autoneg_mode != 0)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set autoneg to on\n");
+		cass_sl_mode_set_autoneg_enable(cass_dev);
+		is_mode_changed = true;
+		break;
+	}
+
+	/* llr */
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (llr = %d)\n",
+		   !!(link_info->flags & CXI_ETH_PF_LLR));
+	switch (link_info->flags & CXI_ETH_PF_LLR) {
+	case 0:
+		if (!cass_dev->sl.enable_llr)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set LLR to off\n");
+		cass_dev->sl.enable_llr = false;
+		cass_dev->sl.link_config.hpe_map &= ~SL_LINK_CONFIG_HPE_LLR;
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_LLR:
+		if (cass_dev->sl.enable_llr)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set LLR to on\n");
+		cass_dev->sl.enable_llr = true;
+		cass_dev->sl.link_config.hpe_map |= SL_LINK_CONFIG_HPE_LLR;
+		is_mode_changed = true;
+		break;
+	}
+
+	/* link training */
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (linktrain = 0x%lX)\n",
+		   link_info->flags & CXI_ETH_PF_LINKTRAIN);
+	switch (link_info->flags & CXI_ETH_PF_LINKTRAIN) {
+	case 0:
+		if (!(link_config->hpe_map & SL_LINK_CONFIG_HPE_LINKTRAIN))
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set linktrain to off\n");
+		link_config->hpe_map &= ~SL_LINK_CONFIG_HPE_LINKTRAIN;
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_LINKTRAIN:
+		if (link_config->hpe_map & SL_LINK_CONFIG_HPE_LINKTRAIN)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set linktrain to on\n");
+		link_config->hpe_map |= SL_LINK_CONFIG_HPE_LINKTRAIN;
+		is_mode_changed = true;
+		break;
+	}
+
+	/* loopback */
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (loopback_mode = %lu)\n",
+		   link_info->flags & LOOPBACK_MODE);
+	switch (link_info->flags & LOOPBACK_MODE) {
+	case 0:
+		if (!(lgrp_config->options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE) &&
+		    !(link_config->options & SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE))
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set loopback to off\n");
+		lgrp_config->options &= ~SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE;
+		link_config->options &= ~SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE;
+		if (cass_dev->sl.old_an_mode == AUTONEG_ENABLE)
+			cass_sl_mode_set_autoneg_enable(cass_dev);
+		else
+			cass_sl_mode_set_autoneg_disable(cass_dev);
+		if (cass_dev->sl.old_lt_mode)
+			link_config->hpe_map |= SL_LINK_CONFIG_HPE_LINKTRAIN;
+		else
+			link_config->hpe_map &= ~SL_LINK_CONFIG_HPE_LINKTRAIN;
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_INTERNAL_LOOPBACK:
+		if (lgrp_config->options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set serdes loopback to on\n");
+		lgrp_config->options |= SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE;
+		cass_sl_mode_set_autoneg_disable(cass_dev);
+		link_config->options &= ~SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE;
+		cass_dev->sl.old_an_mode = link_info->autoneg;
+		cass_dev->sl.old_lt_mode = (link_config->hpe_map & SL_LINK_CONFIG_HPE_LINKTRAIN);
+		link_config->hpe_map &= ~SL_LINK_CONFIG_HPE_LINKTRAIN;
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_EXTERNAL_LOOPBACK:
+		if (link_config->options & SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set remote loopback to on\n");
+		link_config->options |= SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE;
+		cass_sl_mode_set_autoneg_disable(cass_dev);
+		lgrp_config->options &= ~SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE;
+		cass_dev->sl.old_an_mode = link_info->autoneg;
+		cass_dev->sl.old_lt_mode = (link_config->hpe_map & SL_LINK_CONFIG_HPE_LINKTRAIN);
+		link_config->hpe_map &= ~SL_LINK_CONFIG_HPE_LINKTRAIN;
+		is_mode_changed = true;
+		break;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (fec_monitor = %u)\n",
+		   !!(link_info->flags & CXI_ETH_PF_FEC_MONITOR));
+	switch (link_info->flags & CXI_ETH_PF_FEC_MONITOR) {
+	case 0:
+		if (link_policy->fec_mon_period_ms == 0)
+			break;
+		link_policy->fec_mon_period_ms = 0;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set fec_monitor to off\n");
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_FEC_MONITOR:
+		if (link_policy->fec_mon_period_ms != 0)
+			break;
+		link_policy->fec_mon_period_ms = -1;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set fec_monitor to on\n");
+		is_mode_changed = true;
+		break;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (los_lol_hide = %u)\n",
+		   !!(link_info->flags & CXI_ETH_PF_LOS_LOL_HIDE));
+	switch (link_info->flags & CXI_ETH_PF_LOS_LOL_HIDE) {
+	case 0:
+		if (!(link_config->options & SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE))
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set los_lol_hide to off\n");
+		link_config->options &= ~SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE;
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_LOS_LOL_HIDE:
+		if (link_config->options & SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set los_lol_hide to on\n");
+		link_config->options |= SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE;
+		is_mode_changed = true;
+		break;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (r1_link_partner = %u)\n",
+		   !!(link_info->flags & CXI_ETH_PF_R1_LINK_PARTNER));
+	switch (link_info->flags & CXI_ETH_PF_R1_LINK_PARTNER) {
+	case 0:
+		if (!(lgrp_config->options & SL_LGRP_CONFIG_OPT_R1))
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set r1_link_partner to no\n");
+		lgrp_config->options &= ~SL_LGRP_CONFIG_OPT_R1;
+		is_mode_changed = true;
+		break;
+	case CXI_ETH_PF_R1_LINK_PARTNER:
+		if (lgrp_config->options & SL_LGRP_CONFIG_OPT_R1)
+			break;
+		cxidev_dbg(&cass_dev->cdev, "sl mode set r1_link_partner to yes\n");
+		lgrp_config->options |= SL_LGRP_CONFIG_OPT_R1;
+		is_mode_changed = true;
+		break;
+	}
+
+	/* if anything changed bounce the link */
+	cxidev_dbg(&cass_dev->cdev, "sl mode set (is_mode_changed = %d)\n", is_mode_changed);
+	if (is_mode_changed)
+		cass_phy_bounce(cass_dev);
+}
+
+/* SL has no ignore-align or remote-fault-recovery control; see flags_supported */
+void cass_sl_flags_get(struct cass_dev *cass_dev, u32 *flags)
+{
+	*flags = 0;
+}
+
+void cass_sl_flags_set(struct cass_dev *cass_dev, u32 clr_flags, u32 set_flags)
+{
+}
+
+void cass_sl_pml_recovery_set(struct cass_dev *cass_dev, bool set)
+{
+	cxidev_dbg(&cass_dev->cdev, "pml recovery set\n");
+
+	if (set)
+		cass_dev->sl.link_config.options |= SL_LINK_CONFIG_OPT_PML_REC_ENABLE;
+	else
+		cass_dev->sl.link_config.options &= ~SL_LINK_CONFIG_OPT_PML_REC_ENABLE;
+}
+
+struct cass_sl_intr_entry {
+	struct list_head        list;
+	sl_intr_handler_t       hdlr;
+	struct cxi_reg_err_flg  reg;
+	void                   *data;
+};
+
+static void cass_sl_intr_hdlr(struct cass_dev *cass_dev,
+			      unsigned int irq, bool is_ext, unsigned int bitn)
+{
+	struct cass_sl_intr_entry *intr;
+	DECLARE_BITMAP(ss2_port_pml_err_flgs, MAX_ERR_FLAG_BITLEN);
+
+	cxidev_dbg(&cass_dev->cdev, "sl intr handler (bit = %d)\n", bitn);
+
+	lockdep_assert_held(&cass_dev->err_flg_mutex);
+
+	list_for_each_entry(intr, &cass_dev->sl.intr_list, list) {
+		if (test_bit(bitn, intr->reg.err_flags.mask)) {
+			cxidev_dbg(&cass_dev->cdev, "call handler\n");
+			bitmap_zero(ss2_port_pml_err_flgs, MAX_ERR_FLAG_BITLEN);
+			set_bit(bitn, ss2_port_pml_err_flgs);
+			intr->hdlr((u64 *)ss2_port_pml_err_flgs, 4, intr->data);
+			break;
+		}
+	}
+}
+
+#define CASS_SL_SBUS_CMD_RESET 0x20
+static int cass_sl_sbus_op(void *sbus_accessor, u8 op, u8 ring, u8 dev_addr, u8 reg,
+			   u32 *rd_data, u32 wr_data)
+{
+	u32 rsp_data;
+	u8  result;
+	u8  overrun;
+	u8  error;
+
+	switch (op) {
+	case SL_SBUS_OP_RST:
+		return cass_sl_sbus_cmd(sbus_accessor, 0, 0, 0, dev_addr,
+					CASS_SL_SBUS_CMD_RESET, &rsp_data, &result,
+					&overrun, &error, 10, 0);
+	case SL_SBUS_OP_RD:
+		return cass_sl_sbus_rd(sbus_accessor, dev_addr, reg, rd_data);
+	case SL_SBUS_OP_WR:
+		return cass_sl_sbus_wr(sbus_accessor, dev_addr, reg, wr_data);
+	}
+
+	return -EBADRQC;
+}
+
+static int cass_sl_pmi_op(void *pmi_accessor, u8 lgrp_num, u8 op, u32 addr,
+			  u16 *rd_data, u16 wr_data, u16 wr_data_mask)
+{
+	switch (op) {
+	case SL_PMI_OP_RST:
+		// FIXME: need to implement
+		return 0;
+	case SL_PMI_OP_RD:
+		return cass_sl_pmi_rd(pmi_accessor, lgrp_num, addr, rd_data);
+	case SL_PMI_OP_WR:
+		return cass_sl_pmi_wr(pmi_accessor, lgrp_num, addr, wr_data, wr_data_mask);
+	}
+
+	return -EBADRQC;
+}
+
+static int cass_sl_intr_register(void *intr_accessor, u32 port_grp_num, char *tag,
+				 u64 *err_flgs, sl_intr_handler_t handler, void *data)
+{
+	struct cass_dev           *cass_dev = intr_accessor;
+	struct cass_sl_intr_entry *intr;
+
+	cxidev_dbg(&cass_dev->cdev, "sl intr register (0x%llX 0x%llX 0x%llX 0x%llX)\n",
+		*(err_flgs), *(err_flgs + 1), *(err_flgs + 2), *(err_flgs + 3));
+
+	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
+	if (!intr)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&intr->list);
+	intr->hdlr       = handler;
+	intr->reg.irq    = C_HNI_PML_IRQA_MSIX_INT;
+	intr->reg.is_ext = false;
+	intr->reg.cb     = cass_sl_intr_hdlr;
+	memcpy(&(intr->reg.err_flags.ss2_port_pml.qw[0]), err_flgs,
+	       sizeof(intr->reg.err_flags.ss2_port_pml.qw));
+	intr->data       = data;
+
+	mutex_lock(&cass_dev->sl.intr_lock);
+	mutex_lock(&cass_dev->err_flg_mutex);
+	list_add(&intr->list, &cass_dev->sl.intr_list);
+	mutex_unlock(&cass_dev->err_flg_mutex);
+
+	cxi_register_hw_errors(cass_dev, &(intr->reg));
+	mutex_unlock(&cass_dev->sl.intr_lock);
+
+	return 0;
+}
+
+static int cass_sl_intr_unregister(void *intr_accessor, u32 port_grp_num,
+				   u64 *err_flgs, sl_intr_handler_t handler)
+{
+	struct cass_dev           *cass_dev = intr_accessor;
+	struct cass_sl_intr_entry *intr;
+
+	cxidev_dbg(&cass_dev->cdev, "sl intr unregister (0x%llX 0x%llX 0x%llX 0x%llX)\n",
+		*(err_flgs), *(err_flgs + 1), *(err_flgs + 2), *(err_flgs + 3));
+
+	mutex_lock(&cass_dev->sl.intr_lock);
+	list_for_each_entry(intr, &cass_dev->sl.intr_list, list) {
+		if (memcmp(&(intr->reg.err_flags.ss2_port_pml.qw[0]), err_flgs,
+			   sizeof(intr->reg.err_flags.ss2_port_pml.qw)) == 0) {
+			cxidev_dbg(&cass_dev->cdev, "match\n");
+			cxi_unregister_hw_errors(cass_dev, &(intr->reg));
+			mutex_lock(&cass_dev->err_flg_mutex);
+			list_del(&(intr->list));
+			mutex_unlock(&cass_dev->err_flg_mutex);
+			kfree(intr);
+			mutex_unlock(&cass_dev->sl.intr_lock);
+			return 0;
+		}
+	}
+	mutex_unlock(&cass_dev->sl.intr_lock);
+
+	return -EBADRQC;
+}
+
+static int cass_sl_intr_enable(void *intr_accessor, u32 port_grp_num,
+			       u64 *err_flgs, sl_intr_handler_t handler)
+{
+	struct cass_dev *cass_dev = intr_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl intr enable (0x%llX 0x%llX 0x%llX 0x%llX)\n",
+		*(err_flgs), *(err_flgs + 1), *(err_flgs + 2), *(err_flgs + 3));
+
+	cxi_enable_hw_errors(cass_dev, C_HNI_PML_IRQA_MSIX_INT,
+			     false, (unsigned long *)err_flgs);
+
+	return 0;
+}
+
+static int cass_sl_intr_disable(void *intr_accessor, u32 port_grp_num,
+				u64 *err_flgs, sl_intr_handler_t handler)
+{
+	struct cass_dev *cass_dev = intr_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl intr disable (0x%llX 0x%llX 0x%llX 0x%llX)\n",
+		*(err_flgs), *(err_flgs + 1), *(err_flgs + 2), *(err_flgs + 3));
+
+	cxi_disable_hw_errors(cass_dev, C_HNI_PML_IRQA_MSIX_INT,
+			      false, (unsigned long *)err_flgs);
+
+	return 0;
+}
+
+static int cass_sl_dt_info_get(void *dt_accessor, u8 ldev_num, u8 lgrp_num,
+			       struct sl_dt_lgrp_info *info)
+{
+	struct cass_dev *cass_dev = dt_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl dt info get\n");
+
+	info->sbus_ring = 0;
+	info->dev_id    = 1;
+	info->dev_addr  = 0x5;
+
+	switch (cass_dev->uc_platform) {
+	case CUC_BOARD_TYPE_WASHINGTON:
+		switch (cass_dev->uc_nic) {
+		case 0:
+			/* TX: [3, 2, 1, 0] = {3, 2, 1, 0inv} */
+			info->lane_info[3].tx_source = 3;
+			info->lane_info[3].tx_invert = 0;
+			info->lane_info[2].tx_source = 2;
+			info->lane_info[2].tx_invert = 0;
+			info->lane_info[1].tx_source = 1;
+			info->lane_info[1].tx_invert = 0;
+			info->lane_info[0].tx_source = 0;
+			info->lane_info[0].tx_invert = 1;
+			/* RX: [3, 2, 1, 0] = {3, 2, 1, 0} */
+			info->lane_info[3].rx_source = 3;
+			info->lane_info[3].rx_invert = 0;
+			info->lane_info[2].rx_source = 2;
+			info->lane_info[2].rx_invert = 0;
+			info->lane_info[1].rx_source = 1;
+			info->lane_info[1].rx_invert = 0;
+			info->lane_info[0].rx_source = 0;
+			info->lane_info[0].rx_invert = 0;
+			break;
+		case 1:
+			/* TX: [3, 2, 1, 0] = {3, 2, 1inv, 0} */
+			info->lane_info[3].tx_source = 3;
+			info->lane_info[3].tx_invert = 0;
+			info->lane_info[2].tx_source = 2;
+			info->lane_info[2].tx_invert = 0;
+			info->lane_info[1].tx_source = 1;
+			info->lane_info[1].tx_invert = 1;
+			info->lane_info[0].tx_source = 0;
+			info->lane_info[0].tx_invert = 0;
+			/* RX: [3, 2, 1, 0] = {3, 2inv, 1inv, 0inv} */
+			info->lane_info[3].rx_source = 3;
+			info->lane_info[3].rx_invert = 0;
+			info->lane_info[2].rx_source = 2;
+			info->lane_info[2].rx_invert = 1;
+			info->lane_info[1].rx_source = 1;
+			info->lane_info[1].rx_invert = 1;
+			info->lane_info[0].rx_source = 0;
+			info->lane_info[0].rx_invert = 1;
+			break;
+		}
+		break;
+	case CUC_BOARD_TYPE_KENNEBEC:
+		/* TX: [3, 2, 1, 0] = {1inv, 0, 2inv, 3} */
+		/* CSR:      serdes = logical            */
+		info->lane_info[3].tx_source = 1;
+		info->lane_info[3].tx_invert = 1;
+		info->lane_info[2].tx_source = 0;
+		info->lane_info[2].tx_invert = 0;
+		info->lane_info[1].tx_source = 2;
+		info->lane_info[1].tx_invert = 1;
+		info->lane_info[0].tx_source = 3;
+		info->lane_info[0].tx_invert = 0;
+		/* RX: [3, 2, 1, 0] = {2inv, 3, 1inv, 0} */
+		/* CSR:     logical = serdes             */
+		info->lane_info[3].rx_source = 2;
+		info->lane_info[3].rx_invert = 1;
+		info->lane_info[2].rx_source = 3;
+		info->lane_info[2].rx_invert = 0;
+		info->lane_info[1].rx_source = 1;
+		info->lane_info[1].rx_invert = 1;
+		info->lane_info[0].rx_source = 0;
+		info->lane_info[0].rx_invert = 0;
+		break;
+	case CUC_BOARD_TYPE_SOUHEGAN:
+		cxidev_dbg(&cass_dev->cdev,
+			   "sl dt info get SOUHEGAN (nic = %d)\n", cass_dev->uc_nic);
+		/* Lane         3210              3210
+		   ---------------------------------------------
+		   -tx-lane-map 2310 -rx-lane-map 1023 -a :5.*
+		   -tx-lane-map 0132 -rx-lane-map 2013 -a 1:5.*  */
+		switch (cass_dev->uc_nic) {
+		case 0:
+			/* TX: [3, 2, 1, 0] = {2, 3, 1, 0} */
+			/* CSR:      serdes = logical      */
+			info->lane_info[3].tx_source = 2;
+			info->lane_info[3].tx_invert = 0;
+			info->lane_info[2].tx_source = 3;
+			info->lane_info[2].tx_invert = 0;
+			info->lane_info[1].tx_source = 1;
+			info->lane_info[1].tx_invert = 0;
+			info->lane_info[0].tx_source = 0;
+			info->lane_info[0].tx_invert = 0;
+			/* RX: [3, 2, 1, 0] = {1, 0, 2, 3} */
+			/* CSR:     logical = serdes       */
+			info->lane_info[3].rx_source = 1;
+			info->lane_info[3].rx_invert = 0;
+			info->lane_info[2].rx_source = 0;
+			info->lane_info[2].rx_invert = 0;
+			info->lane_info[1].rx_source = 2;
+			info->lane_info[1].rx_invert = 0;
+			info->lane_info[0].rx_source = 3;
+			info->lane_info[0].rx_invert = 0;
+			break;
+		case 1:
+			/* TX: [3, 2, 1, 0] = {0, 1, 3, 2} */
+			/* CSR:      serdes = logical      */
+			info->lane_info[3].tx_source = 0;
+			info->lane_info[3].tx_invert = 0;
+			info->lane_info[2].tx_source = 1;
+			info->lane_info[2].tx_invert = 0;
+			info->lane_info[1].tx_source = 3;
+			info->lane_info[1].tx_invert = 0;
+			info->lane_info[0].tx_source = 2;
+			info->lane_info[0].tx_invert = 0;
+			/* RX: [3, 2, 1, 0] = {2, 0, 1, 3} */
+			/* CSR:     logical = serdes       */
+			info->lane_info[3].rx_source = 2;
+			info->lane_info[3].rx_invert = 0;
+			info->lane_info[2].rx_source = 0;
+			info->lane_info[2].rx_invert = 0;
+			info->lane_info[1].rx_source = 1;
+			info->lane_info[1].rx_invert = 0;
+			info->lane_info[0].rx_source = 3;
+			info->lane_info[0].rx_invert = 0;
+			break;
+		}
+		break;
+	default:  /* straight */
+		info->lane_info[3].tx_source = 3;
+		info->lane_info[3].tx_invert = 0;
+		info->lane_info[2].tx_source = 2;
+		info->lane_info[2].tx_invert = 0;
+		info->lane_info[1].tx_source = 1;
+		info->lane_info[1].tx_invert = 0;
+		info->lane_info[0].tx_source = 0;
+		info->lane_info[0].tx_invert = 0;
+		break;
+	}
+
+	return 0;
+}
+
+static int cass_sl_mb_info_get(void *mb_accessor, u8 *platform, u16 *revision, u16 *proto)
+{
+	struct cass_dev *cass_dev = mb_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl mb info get\n");
+
+	if (platform)
+		*platform = HW_PLATFORM(cass_dev);
+	if (revision)
+		*revision = 0;
+	if (proto)
+		*proto = 0;
+
+	return 0;
+}
+
+static int cass_sl_dmac_alloc(void *dmac_accessor, u32 offset, size_t size)
+{
+	int              rtn;
+	struct cass_dev *cass_dev = dmac_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl dmac alloc\n");
+
+	rtn = cxi_dmac_desc_set_alloc(&cass_dev->cdev, 1, "fec_id");
+	if (rtn < 0) {
+		cxidev_err(&cass_dev->cdev,
+			   "cxi_dmac_desc_set_alloc failed [%d]\n", rtn);
+		return rtn;
+	}
+	cass_dev->sl.fec.dma_id = rtn;
+	cxidev_dbg(&cass_dev->cdev, "dma_id = %d\n", cass_dev->sl.fec.dma_id);
+
+	cass_dev->sl.fec.cntrs = dma_alloc_coherent(&cass_dev->cdev.pdev->dev, size,
+						    &cass_dev->sl.fec.dma_addr, GFP_KERNEL);
+	if (!cass_dev->sl.fec.cntrs) {
+		rtn = -ENOMEM;
+		goto out_dmac_fini;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "cntrs = %p\n", cass_dev->sl.fec.cntrs);
+	cass_dev->sl.fec.cntrs_size = size;
+
+	rtn = cxi_dmac_desc_set_add(&cass_dev->cdev, cass_dev->sl.fec.dma_id,
+				    cass_dev->sl.fec.dma_addr, offset, size);
+	if (rtn) {
+		cxidev_err(&cass_dev->cdev,
+			   "cxi_dmac_desc_set_add failed [%d]\n", rtn);
+		goto out_dma_free;
+	}
+
+	return 0;
+
+out_dma_free:
+	dma_free_coherent(&cass_dev->cdev.pdev->dev, size, cass_dev->sl.fec.cntrs, cass_dev->sl.fec.dma_addr);
+out_dmac_fini:
+	cxi_dmac_desc_set_free(&cass_dev->cdev, cass_dev->sl.fec.dma_id);
+
+	return rtn;
+}
+
+static void cass_sl_dmac_free(void *dmac_accessor)
+{
+	struct cass_dev *cass_dev = dmac_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl dmac free\n");
+
+	cxi_dmac_desc_set_free(&cass_dev->cdev, cass_dev->sl.fec.dma_id);
+	dma_free_coherent(&cass_dev->cdev.pdev->dev, cass_dev->sl.fec.cntrs_size, cass_dev->sl.fec.cntrs,
+			  cass_dev->sl.fec.dma_addr);
+}
+
+static int cass_sl_dmac_xfer(void *dmac_accessor, void *data)
+{
+	int              rtn;
+	struct cass_dev *cass_dev = dmac_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl dmac xfer\n");
+
+	rtn = cxi_dmac_xfer(&cass_dev->cdev, cass_dev->sl.fec.dma_id);
+	if (rtn) {
+		cxidev_err(&cass_dev->cdev, "Unable to get fec cntrs [%d]\n", rtn);
+		return rtn;
+	}
+
+	memcpy(data, cass_dev->sl.fec.cntrs, cass_dev->sl.fec.cntrs_size);
+
+	return 0;
+}
+
+static void cass_sl_ops_init(struct cass_dev *cass_dev)
+{
+	cass_dev->sl.ops.read64              = cass_sl_read64;
+	cass_dev->sl.ops.write64             = cass_sl_write64;
+
+	cass_dev->sl.ops.sbus_op             = cass_sl_sbus_op;
+	cass_dev->sl.ops.pmi_op              = cass_sl_pmi_op;
+
+	cass_dev->sl.ops.pml_intr_register   = cass_sl_intr_register;
+	cass_dev->sl.ops.pml_intr_unregister = cass_sl_intr_unregister;
+	cass_dev->sl.ops.pml_intr_enable     = cass_sl_intr_enable;
+	cass_dev->sl.ops.pml_intr_disable    = cass_sl_intr_disable;
+
+	cass_dev->sl.ops.dt_info_get         = cass_sl_dt_info_get;
+	cass_dev->sl.ops.mb_info_get         = cass_sl_mb_info_get;
+	cass_dev->sl.ops.dmac_alloc          = cass_sl_dmac_alloc;
+	cass_dev->sl.ops.dmac_xfer           = cass_sl_dmac_xfer;
+	cass_dev->sl.ops.dmac_free           = cass_sl_dmac_free;
+
+	cass_dev->sl.accessors.pci           = cass_dev;
+	cass_dev->sl.accessors.sbus          = cass_dev;
+	cass_dev->sl.accessors.pmi           = cass_dev;
+	cass_dev->sl.accessors.intr          = cass_dev;
+	cass_dev->sl.accessors.dt            = cass_dev;
+	cass_dev->sl.accessors.mb            = cass_dev;
+	cass_dev->sl.accessors.dmac          = cass_dev;
+
+	cass_dev->sl.enable_llr              = true;
+	cass_dev->sl.is_canceled             = false;
+}
+
+#define CASS_SL_CALLBACKS (SL_LGRP_NOTIF_MEDIA_PRESENT     | \
+			   SL_LGRP_NOTIF_MEDIA_NOT_PRESENT | \
+			   SL_LGRP_NOTIF_LANE_DEGRADE      | \
+			   SL_LGRP_NOTIF_LINK_UP           | \
+			   SL_LGRP_NOTIF_LINK_UP_FAIL      | \
+			   SL_LGRP_NOTIF_LINK_ASYNC_DOWN   | \
+			   SL_LGRP_NOTIF_LINK_DOWN         | \
+			   SL_LGRP_NOTIF_LINK_ERROR        | \
+			   SL_LGRP_NOTIF_LLR_SETUP         | \
+			   SL_LGRP_NOTIF_LLR_SETUP_TIMEOUT | \
+			   SL_LGRP_NOTIF_LLR_RUNNING       | \
+			   SL_LGRP_NOTIF_LLR_START_TIMEOUT | \
+			   SL_LGRP_NOTIF_LLR_ERROR)
+
+static void cass_sl_uc_led_set(void *uc_accessor, u8 led_state)
+{
+	struct cass_dev *hw = uc_accessor;
+
+	cxidev_dbg(&hw->cdev, "sl uc led set (state = %u)\n", led_state);
+
+	uc_cmd_set_link_leds(hw, (enum casuc_led_states)led_state);
+}
+
+static void cass_sl_uc_ops_init(struct cass_dev *cass_dev)
+{
+	cass_dev->sl.uc_ops.uc_read    = cass_sl_uc_read;
+	cass_dev->sl.uc_ops.uc_write8  = cass_sl_uc_write8;
+	cass_dev->sl.uc_ops.uc_led_set = cass_sl_uc_led_set;
+
+	cass_dev->sl.uc_accessor.uc = cass_dev;
+}
+
+static void cass_sl_callback(void *tag, struct sl_lgrp_notif_msg *msg)
+{
+	struct cass_dev *cass_dev = tag;
+
+	cxidev_dbg(&cass_dev->cdev, "callback (type = 0x%X)\n", msg->type);
+
+	switch (msg->type) {
+	case SL_LGRP_NOTIF_MEDIA_PRESENT:
+		cass_dev->sl.media_attr = msg->info.media_attr;
+		if (msg->info.media_attr.type & SL_MEDIA_TYPE_ACTIVE) {
+			cass_dev->sl.link_config.hpe_map &= ~SL_LINK_CONFIG_HPE_LINKTRAIN;
+			cass_sl_mode_set_autoneg_disable(cass_dev);
+		} else {
+			cass_dev->sl.link_config.hpe_map |= SL_LINK_CONFIG_HPE_LINKTRAIN;
+			cass_sl_mode_set_autoneg_enable(cass_dev);
+		}
+		cass_dev->sl.has_cable = true;
+		break;
+	case SL_LGRP_NOTIF_MEDIA_NOT_PRESENT:
+		memset(&cass_dev->sl.media_attr, 0, sizeof(cass_dev->sl.media_attr));
+		cass_dev->sl.has_cable = false;
+		break;
+	case SL_LGRP_NOTIF_LANE_DEGRADE:
+		cxidev_info(&cass_dev->cdev, "lane degrade occurred (rx_degrade_map = 0x%X, tx_degrade_map = 0x%X)\n",
+			    msg->info.degrade_info.rx_degrade_map,
+			    msg->info.degrade_info.tx_degrade_map);
+		break;
+	case SL_LGRP_NOTIF_LINK_UP:
+		cass_dev->sl.link_state = SL_LINK_STATE_UP;
+		cass_dev->sl.link_up_mode = msg->info.link_up.mode;
+		cass_dev->sl.link_up_fec_type = msg->info.link_up.fec_type;
+		complete(&(cass_dev->sl.step_complete));
+		break;
+	case SL_LGRP_NOTIF_LINK_UP_FAIL:
+	case SL_LGRP_NOTIF_LINK_ASYNC_DOWN:
+	case SL_LGRP_NOTIF_LINK_ERROR:
+		cass_dev->sl.link_state = SL_LINK_STATE_DOWN;
+		complete(&(cass_dev->sl.step_complete));
+		cass_link_async_down(cass_dev, CASS_DOWN_ORIGIN_BL_DOWN);
+		break;
+	case SL_LGRP_NOTIF_LLR_START_TIMEOUT:
+	case SL_LGRP_NOTIF_LLR_SETUP_TIMEOUT:
+	case SL_LGRP_NOTIF_LLR_ERROR:
+		cass_dev->sl.llr_state = SL_LLR_STATE_OFF;
+		complete(&(cass_dev->sl.step_complete));
+		cass_link_async_down(cass_dev, CASS_DOWN_ORIGIN_BL_DOWN);
+		break;
+	case SL_LGRP_NOTIF_LLR_SETUP:
+		cass_dev->sl.llr_state = SL_LLR_STATE_SETUP;
+		cass_dev->sl.llr_data = msg->info.llr_data;
+		complete(&(cass_dev->sl.step_complete));
+		break;
+	case SL_LGRP_NOTIF_LLR_RUNNING:
+		cass_dev->sl.llr_state = SL_LLR_STATE_RUNNING;
+		complete(&(cass_dev->sl.step_complete));
+		break;
+	case SL_LGRP_NOTIF_LINK_DOWN:
+		cass_dev->sl.link_state = SL_LINK_STATE_DOWN;
+		complete(&(cass_dev->sl.step_complete));
+		break;
+	default:
+		cxidev_err(&cass_dev->cdev, "callback error (type = 0x%X)\n", msg->type);
+		break;
+	}
+}
+
+#define CASS_SL_LINK_UP_TIMEOUT_MS    35000
+#define CASS_SL_LLR_SETUP_TIMEOUT_MS  4000
+#define CASS_SL_LLR_START_TIMEOUT_MS  3000
+static void cass_sl_config_init(struct cass_dev *cass_dev)
+{
+	cxidev_dbg(&cass_dev->cdev,
+		   "sl config init (platform = %d, cxi = %u, nic = %d)\n",
+		   HW_PLATFORM(cass_dev), cass_dev->cdev.cxi_num, cass_dev->uc_nic);
+
+	cass_dev->sl.hw_attr.magic   = SL_HW_ATTR_MAGIC;
+	cass_dev->sl.hw_attr.ver     = SL_HW_ATTR_VER;
+	cass_dev->sl.hw_attr.nic_num = cass_dev->uc_nic;
+	cass_dev->sl.hw_attr.cxi_num = cass_dev->cdev.cxi_num;
+
+	cass_dev->sl.ldev_config.magic     = SL_LDEV_ATTR_MAGIC;
+	cass_dev->sl.ldev_config.ver       = SL_LDEV_ATTR_VER;
+	cass_dev->sl.ldev_config.accessors = &(cass_dev->sl.accessors);
+	cass_dev->sl.ldev_config.ops       = &(cass_dev->sl.ops);
+
+	cass_dev->sl.lgrp_config.magic     = SL_LGRP_CONFIG_MAGIC;
+	cass_dev->sl.lgrp_config.ver       = SL_LGRP_CONFIG_VER;
+	cass_dev->sl.lgrp_config.mfs       = 9216;
+	cass_dev->sl.lgrp_config.furcation = SL_MEDIA_FURCATION_X1;
+	cass_dev->sl.lgrp_config.fec_mode  = SL_LGRP_FEC_MODE_OFF;
+	cass_dev->sl.lgrp_config.fec_map   = SL_LGRP_CONFIG_FEC_RS;
+	cass_dev->sl.lgrp_config.options   = 0;
+	cass_dev->sl.static_tech_map       = SL_LGRP_CONFIG_TECH_CK_400G;
+	cass_dev->sl.autoneg_tech_map      = SL_LGRP_CONFIG_TECH_CK_400G |
+					     SL_LGRP_CONFIG_TECH_BS_200G |
+					     SL_LGRP_CONFIG_TECH_BJ_100G;
+	cass_dev->sl.link_up_mode          = 0;
+	cass_dev->sl.link_up_fec_type      = 0;
+	cass_sl_mode_set_autoneg_enable(cass_dev);
+
+	cass_dev->sl.link_config.magic                             = SL_LINK_CONFIG_MAGIC;
+	cass_dev->sl.link_config.ver                               = SL_LINK_CONFIG_VER;
+	cass_dev->sl.link_config.link_up_timeout_ms                = CASS_SL_LINK_UP_TIMEOUT_MS;
+	cass_dev->sl.link_config.link_up_tries_max                 = 1;
+	cass_dev->sl.link_config.fec_up_settle_wait_ms             = -1;
+	cass_dev->sl.link_config.fec_up_check_wait_ms              = -1;
+	cass_dev->sl.link_config.fec_up_ucw_limit                  = -1;
+	cass_dev->sl.link_config.fec_up_ccw_limit                  = -1;
+	cass_dev->sl.link_config.pml_rec_timeout_ms                = cass_sl_pml_rec_timeout_ms;
+	cass_dev->sl.link_config.pml_rec_rate_limit_max_time_ms    = cass_sl_pml_rec_rate_limit_max_time_ms;
+	cass_dev->sl.link_config.pml_rec_rate_limit_window_size_ms = cass_sl_pml_rec_rate_limit_win_size_ms;
+	cass_dev->sl.link_config.pause_map                         = 0;
+	cass_dev->sl.link_config.options                           = SL_LINK_CONFIG_OPT_PML_REC_ENABLE |
+								     SL_LINK_CONFIG_OPT_ALD_ENABLE;
+	cass_dev->sl.link_config.hpe_map                           = SL_LINK_CONFIG_HPE_C2;
+	cass_dev->sl.link_config.hpe_map                          |= SL_LINK_CONFIG_HPE_LINKTRAIN;
+	if (cass_dev->sl.enable_llr)
+		cass_dev->sl.link_config.hpe_map                  |= SL_LINK_CONFIG_HPE_LLR;
+
+	cass_dev->sl.link_policy.magic                   = SL_LINK_POLICY_MAGIC;
+	cass_dev->sl.link_policy.ver                     = SL_LINK_POLICY_VER;
+	cass_dev->sl.link_policy.fec_mon_ucw_down_limit  = -1;
+	cass_dev->sl.link_policy.fec_mon_ucw_warn_limit  = 0;
+	cass_dev->sl.link_policy.fec_mon_ccw_down_limit  = 0;
+	cass_dev->sl.link_policy.fec_mon_ccw_warn_limit  = 0;
+	cass_dev->sl.link_policy.fec_mon_period_ms       = -1;
+
+	cass_dev->sl.llr_config.magic            = SL_LLR_CONFIG_MAGIC;
+	cass_dev->sl.llr_config.ver              = SL_LLR_CONFIG_VER;
+	cass_dev->sl.llr_config.setup_timeout_ms = CASS_SL_LLR_SETUP_TIMEOUT_MS;
+	cass_dev->sl.llr_config.start_timeout_ms = CASS_SL_LLR_START_TIMEOUT_MS;
+}
+
+static int cass_sl_uc_ops_set(struct cass_dev *cass_dev)
+{
+	cxidev_dbg(&cass_dev->cdev, "sl_uc_ops_set\n");
+
+	return sl_ldev_uc_ops_set(cass_dev->sl.ldev, &(cass_dev->sl.uc_ops),
+				&(cass_dev->sl.uc_accessor));
+}
+
+int cass_sl_init(struct cass_dev *cass_dev)
+{
+	int  rtn;
+	char connect_id[12];
+
+	cxidev_dbg(&cass_dev->cdev, "sl init (cxi_num = %u)\n", cass_dev->cdev.cxi_num);
+
+	if (cass_dev->sl.is_initialized) {
+		cxidev_dbg(&cass_dev->cdev, "sl already initialized\n");
+		return -EBADRQC;
+	}
+
+	memset(&(cass_dev->sl), 0, sizeof(cass_dev->sl));
+
+	cass_sl_ops_init(cass_dev);
+	cass_sl_uc_ops_init(cass_dev);
+	cass_sl_config_init(cass_dev);
+
+	INIT_LIST_HEAD(&cass_dev->sl.intr_list);
+	mutex_init(&cass_dev->sl.intr_lock);
+
+	mutex_init(&cass_dev->sl.pmi_lock);
+	mutex_init(&cass_dev->sl.sbus_lock);
+
+	init_completion(&(cass_dev->sl.step_complete));
+
+	rtn = kobject_init_and_add(&cass_dev->port_kobj, &cass_sl_port_sysfs,
+				   &cass_dev->cdev.pdev->dev.kobj, "port");
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev,
+			   "kobject_init_and_add port failed [%d]\n", rtn);
+		goto out_kobject_put_port;
+	}
+	rtn = kobject_init_and_add(&cass_dev->port_num_kobj, &cass_sl_port_num_sysfs,
+				   &cass_dev->port_kobj, "0");
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev,
+			   "kobject_init_and_add port_num failed [%d]\n", rtn);
+		goto out_kobject_put_port_num;
+	}
+
+	cass_dev->sl.ldev = sl_ldev_new(cass_dev->cdev.cxi_num,
+					NULL, &(cass_dev->sl.ldev_config));
+	if (IS_ERR(cass_dev->sl.ldev)) {
+		rtn = PTR_ERR(cass_dev->sl.ldev);
+		cxidev_err(&cass_dev->cdev, "sl_ldev_new failed [%d]\n", rtn);
+		goto out_kobject_put_port_num;
+	}
+
+	rtn = sl_ldev_sysfs_parent_set(cass_dev->sl.ldev, &(cass_dev->port_num_kobj));
+	if (rtn) {
+		cxidev_err(&cass_dev->cdev, "sl_ldev_sysfs_parent_set failed [%d]\n", rtn);
+		goto out_ldev_del;
+	}
+
+	rtn = cass_sl_uc_ops_set(cass_dev);
+	if (rtn) {
+		cxidev_err(&cass_dev->cdev, "sl_uc_ops_set failed [%d]\n", rtn);
+		goto out_ldev_del;
+	}
+
+	cass_dev->sl.lgrp = sl_lgrp_new(cass_dev->sl.ldev,
+					CASS_SL_LGRP_NUM, &cass_dev->port_num_kobj);
+	if (IS_ERR(cass_dev->sl.lgrp)) {
+		rtn = PTR_ERR(cass_dev->sl.lgrp);
+		cxidev_err(&cass_dev->cdev, "sl_lgrp_new failed [%d]\n", rtn);
+		goto out_ldev_del;
+	}
+
+	cass_dev->sl.link = sl_link_new(cass_dev->sl.lgrp,
+					CASS_SL_LINK_NUM, &cass_dev->port_num_kobj);
+	if (IS_ERR(cass_dev->sl.link)) {
+		rtn = PTR_ERR(cass_dev->sl.link);
+		cxidev_err(&cass_dev->cdev, "sl_link_new failed [%d]\n", rtn);
+		goto out_lgrp_del;
+	}
+
+	cass_dev->sl.mac = sl_mac_new(cass_dev->sl.lgrp,
+				      CASS_SL_MAC_NUM, &cass_dev->port_num_kobj);
+	if (IS_ERR(cass_dev->sl.mac)) {
+		rtn = PTR_ERR(cass_dev->sl.mac);
+		cxidev_err(&cass_dev->cdev, "sl_mac_new failed [%d]\n", rtn);
+		goto out_link_del;
+	}
+
+	cass_dev->sl.llr = sl_llr_new(cass_dev->sl.lgrp,
+				      CASS_SL_LLR_NUM, &cass_dev->port_num_kobj);
+	if (IS_ERR(cass_dev->sl.llr)) {
+		rtn = PTR_ERR(cass_dev->sl.llr);
+		cxidev_err(&cass_dev->cdev, "sl_llr_new failed [%d]\n", rtn);
+		goto out_mac_del;
+	}
+
+	snprintf(connect_id, sizeof(connect_id), "cas[%d]", cass_dev->cdev.cxi_num);
+	rtn = sl_lgrp_connect_id_set(cass_dev->sl.lgrp, connect_id);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_lgrp_connect_id_set failed [%d]\n", rtn);
+		goto out_llr_del;
+	}
+
+	rtn = sl_lgrp_hw_attr_set(cass_dev->sl.lgrp, &cass_dev->sl.hw_attr);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_lgrp_hw_attr_set failed [%d]\n", rtn);
+		goto out_llr_del;
+	}
+
+	rtn = sl_lgrp_notif_callback_reg(cass_dev->sl.lgrp, cass_sl_callback, CASS_SL_CALLBACKS, cass_dev);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_lgrp_notif_callback_reg failed [%d]\n", rtn);
+		goto out_llr_del;
+	}
+
+	cass_dev->sl.is_initialized = true;
+
+	return 0;
+
+out_llr_del:
+	sl_llr_del(cass_dev->sl.llr);
+out_mac_del:
+	sl_mac_del(cass_dev->sl.mac);
+out_link_del:
+	sl_link_del(cass_dev->sl.link);
+out_lgrp_del:
+	sl_lgrp_del(cass_dev->sl.lgrp);
+out_ldev_del:
+	sl_ldev_del(cass_dev->sl.ldev);
+out_kobject_put_port_num:
+	kobject_put(&cass_dev->port_num_kobj);
+out_kobject_put_port:
+	kobject_put(&cass_dev->port_kobj);
+
+	return rtn;
+}
+
+int cass_sl_connect_id_set(struct cass_dev *cass_dev, const char *connect_id)
+{
+	int rtn;
+
+	cxidev_dbg(&cass_dev->cdev, "sl connect id set\n");
+
+	rtn = sl_lgrp_connect_id_set(cass_dev->sl.lgrp, connect_id);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_lgrp_connect_id failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+int cass_sl_media_config(struct cass_dev *cass_dev, void *unused)
+{
+	u32 flags = 0;
+
+	cxidev_dbg(&cass_dev->cdev, "media config\n");
+
+	if (cass_dev->uc_platform == CUC_BOARD_TYPE_WASHINGTON)
+		flags |= SL_MEDIA_TYPE_BACKPLANE;
+
+	return sl_media_cable_insert(cass_dev->sl.lgrp, cass_dev->qsfp_eeprom_page0,
+				     cass_dev->qsfp_eeprom_page1, flags);
+}
+
+int cass_sl_media_unconfig(struct cass_dev *cass_dev)
+{
+	cxidev_dbg(&cass_dev->cdev, "media unconfig\n");
+
+	return sl_media_cable_remove(cass_dev->sl.lgrp);
+}
+
+static void cass_sl_port_group_cfg_set(struct cass_dev *cass_dev)
+{
+	union ss2_port_pml_cfg_port_group config;
+
+	cxidev_dbg(&cass_dev->cdev, "sl port group cfg set\n");
+
+	cass_read(cass_dev, SS2_PORT_PML_CFG_PORT_GROUP, &config, sizeof(config));
+
+	/* EDGE1 */
+	config.pg_cfg = 0;
+
+	if (cass_dev->sl.lgrp_config.options & SL_LGRP_CONFIG_OPT_R1)
+		config.link_function = C2_LF_C2_R1;
+	else
+		config.link_function = C2_LF_C2_R2;
+
+	cass_write(cass_dev, SS2_PORT_PML_CFG_PORT_GROUP, &config, sizeof(config));
+}
+
+int cass_sl_link_config(struct cass_dev *cass_dev)
+{
+	/* NO-OP: configuration set happens during link up */
+	return 0;
+}
+
+bool cass_sl_is_link_up(struct cass_dev *cass_dev)
+{
+	return cass_dev->sl.link_state == SL_LINK_STATE_UP;
+}
+
+int cass_sl_link_up(struct cass_dev *cass_dev)
+{
+	int          rtn;
+	unsigned int timeleft;
+
+	cxidev_dbg(&cass_dev->cdev, "sl link up\n");
+
+	if (!cass_dev->sl.has_cable)
+		return 0;
+
+	if (cass_dev->sl.is_canceled)
+		return 0;
+
+	/* initial delay between attempts */
+	msleep(1000);
+
+	cass_dev->sl.link_state       = SL_LINK_STATE_DOWN;
+	cass_dev->sl.llr_state        = SL_LLR_STATE_OFF;
+	cass_dev->sl.link_up_mode     = 0;
+	cass_dev->sl.link_up_fec_type = 0;
+
+	if (!cass_dev->sl.is_fw_loaded) {
+		rtn = sl_ldev_serdes_init(cass_dev->sl.ldev);
+		if (rtn) {
+			cxidev_err(&cass_dev->cdev,
+				   "sl_ldev_serdes_init failed [%d]\n", rtn);
+			return rtn;
+		}
+		cass_dev->sl.is_fw_loaded = true;
+	}
+
+	/* config */
+	rtn = sl_lgrp_config_set(cass_dev->sl.lgrp, &cass_dev->sl.lgrp_config);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_lgrp_config_set failed [%d]\n", rtn);
+		return rtn;
+	}
+	rtn = sl_link_config_set(cass_dev->sl.link, &cass_dev->sl.link_config);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_link_config_set failed [%d]\n", rtn);
+		return rtn;
+	}
+	rtn = sl_link_policy_set(cass_dev->sl.link, &cass_dev->sl.link_policy);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_link_policy_set failed [%d]\n", rtn);
+		return rtn;
+	}
+	cass_sl_port_group_cfg_set(cass_dev);
+
+	if (cass_dev->sl.is_canceled)
+		return 0;
+
+	/* link up */
+	reinit_completion(&(cass_dev->sl.step_complete));
+	rtn = sl_link_up(cass_dev->sl.link);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_link_up failed [%d]\n", rtn);
+		goto out_no_link;
+	}
+	timeleft = wait_for_completion_timeout(&(cass_dev->sl.step_complete),
+		msecs_to_jiffies(2 * CASS_SL_LINK_UP_TIMEOUT_MS));
+	if (timeleft == 0) {
+		cxidev_dbg(&cass_dev->cdev, "sl_link_up timeout\n");
+		goto out_link_down;
+	}
+	if (cass_dev->sl.link_state != SL_LINK_STATE_UP) {
+		cxidev_dbg(&cass_dev->cdev, "sl_link_up not up\n");
+		goto out_link_down;
+	}
+
+	if (cass_dev->sl.is_canceled)
+		goto out_link_down;
+
+	/* enable MAC */
+	rtn = sl_mac_tx_start(cass_dev->sl.mac);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_mac_tx_start failed [%d]\n", rtn);
+		goto out_link_down;
+	}
+	rtn = sl_mac_rx_start(cass_dev->sl.mac);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl_mac_rx_start failed [%d]\n", rtn);
+		goto out_mac_tx_stop;
+	}
+
+	if (cass_dev->sl.is_canceled)
+		goto out_mac_rx_stop;
+
+	/* LLR */
+	if (cass_dev->sl.enable_llr) {
+
+		/* config */
+		rtn = sl_llr_config_set(cass_dev->sl.llr, &cass_dev->sl.llr_config);
+		if (rtn != 0) {
+			cxidev_err(&cass_dev->cdev, "sl_llr_config_set failed [%d]\n", rtn);
+			goto out_mac_rx_stop;
+		}
+
+		/* setup */
+		reinit_completion(&(cass_dev->sl.step_complete));
+		rtn = sl_llr_setup(cass_dev->sl.llr);
+		if (rtn) {
+			cxidev_err(&cass_dev->cdev, "sl_llr_setup failed [%d]\n", rtn);
+			goto out_llr_stop;
+		}
+		timeleft = wait_for_completion_timeout(&(cass_dev->sl.step_complete),
+			msecs_to_jiffies(2 * CASS_SL_LLR_SETUP_TIMEOUT_MS));
+		if (timeleft == 0) {
+			cxidev_dbg(&cass_dev->cdev, "sl_llr_setup timeout\n");
+			goto out_llr_stop;
+		}
+		if (cass_dev->sl.llr_state != SL_LLR_STATE_SETUP) {
+			cxidev_dbg(&cass_dev->cdev, "sl_llr_setup not setup\n");
+			goto out_llr_stop;
+		}
+
+		/* start */
+		reinit_completion(&(cass_dev->sl.step_complete));
+		rtn = sl_llr_start(cass_dev->sl.llr);
+		if (rtn) {
+			cxidev_err(&cass_dev->cdev, "sl_llr_start failed [%d]\n", rtn);
+			goto out_llr_stop;
+		}
+		timeleft = wait_for_completion_timeout(&(cass_dev->sl.step_complete),
+			msecs_to_jiffies(2 * CASS_SL_LLR_START_TIMEOUT_MS));
+		if (timeleft == 0) {
+			cxidev_dbg(&cass_dev->cdev, "sl_llr_start timeout\n");
+			goto out_llr_stop;
+		}
+		if (cass_dev->sl.llr_state != SL_LLR_STATE_RUNNING) {
+			cxidev_dbg(&cass_dev->cdev, "sl_llr_start not running\n");
+			goto out_llr_stop;
+		}
+	}
+
+	if (cass_dev->sl.is_canceled)
+		goto out_llr_stop;
+
+	cass_link_set_state(cass_dev, CASS_LINK_STATUS_UP, 0);
+
+	return 0;
+
+out_llr_stop:
+	sl_llr_stop(cass_dev->sl.llr);
+	/* need to stop twice to make sure both setup and start are stopped */
+	sl_llr_stop(cass_dev->sl.llr);
+
+out_mac_rx_stop:
+	sl_mac_rx_stop(cass_dev->sl.mac);
+
+out_mac_tx_stop:
+	sl_mac_tx_stop(cass_dev->sl.mac);
+
+out_link_down:
+	reinit_completion(&(cass_dev->sl.step_complete));
+	rtn = sl_link_down(cass_dev->sl.link);
+	switch (rtn) {
+	case -EALREADY:
+		break;
+	case -EINPROGRESS:
+		msleep(500);
+		break;
+	case 0:
+		timeleft = wait_for_completion_timeout(&(cass_dev->sl.step_complete),
+			msecs_to_jiffies(2 * CASS_SL_LINK_DOWN_TIMEOUT_MS));
+		if (timeleft == 0)
+			cxidev_dbg(&cass_dev->cdev, "sl_link_down (link_up) timeout\n");
+		break;
+	default:
+		cxidev_warn(&cass_dev->cdev, "sl_link_down (link_up) failed [%d]\n", rtn);
+		break;
+	}
+
+out_no_link:
+
+	return -ENOLINK;
+}
+
+int cass_sl_link_down(struct cass_dev *cass_dev)
+{
+	int          rtn;
+	int          err = 0;
+	unsigned int timeleft;
+
+	cxidev_dbg(&cass_dev->cdev, "sl link down\n");
+
+	/* stop llr */
+	rtn = sl_llr_stop(cass_dev->sl.llr);
+	if (rtn) {
+		cxidev_warn(&cass_dev->cdev, "sl_llr_stop failed [%d]\n", rtn);
+		err = rtn;
+	}
+	/* need to stop twice to make sure both setup and start are stopped */
+	rtn = sl_llr_stop(cass_dev->sl.llr);
+	if (rtn && !err) {
+		cxidev_warn(&cass_dev->cdev, "sl_llr_stop retry failed [%d]\n", rtn);
+		err = rtn;
+	}
+
+	/* stop MAC */
+	rtn = sl_mac_tx_stop(cass_dev->sl.mac);
+	if (rtn) {
+		cxidev_warn(&cass_dev->cdev, "sl_mac_tx_stop failed [%d]\n", rtn);
+		if (!err)
+			err = rtn;
+	}
+	rtn = sl_mac_rx_stop(cass_dev->sl.mac);
+	if (rtn) {
+		cxidev_warn(&cass_dev->cdev, "sl_mac_rx_stop failed [%d]\n", rtn);
+		if (!err)
+			err = rtn;
+	}
+
+	/* down link */
+	if (cass_dev->sl.link_state != SL_LINK_STATE_DOWN) {
+		reinit_completion(&(cass_dev->sl.step_complete));
+		rtn = sl_link_down(cass_dev->sl.link);
+		switch (rtn) {
+		case -EALREADY:
+			break;
+		case -EINPROGRESS:
+		case 0:
+			timeleft = wait_for_completion_timeout(&(cass_dev->sl.step_complete),
+				msecs_to_jiffies(2 * CASS_SL_LINK_DOWN_TIMEOUT_MS));
+			if (timeleft == 0) {
+				cxidev_err(&cass_dev->cdev,
+					   "sl_link_down (link_down) timed out\n");
+				return -ETIMEDOUT;
+			}
+			break;
+		default:
+			cxidev_warn(&cass_dev->cdev, "sl_link_down (link_down) failed [%d]\n", rtn);
+			return rtn;
+		}
+		if (cass_dev->sl.link_state != SL_LINK_STATE_DOWN)
+			return -EBUSY;
+	}
+
+	if (err)
+		return err;
+
+	cass_link_set_state(cass_dev, CASS_LINK_STATUS_DOWN, 0);
+
+	return 0;
+}
+
+int cass_sl_exit(struct cass_dev *cass_dev)
+{
+	int rtn;
+
+	cxidev_dbg(&cass_dev->cdev, "sl exit\n");
+	if (!cass_dev->sl.is_initialized)
+		return 0;
+
+	rtn = sl_lgrp_notif_callback_unreg(cass_dev->sl.lgrp, cass_sl_callback, CASS_SL_CALLBACKS);
+	if (rtn != 0) {
+		cxidev_warn(&cass_dev->cdev, "sl_lgrp_notif_callback_unreg failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	rtn = sl_llr_del(cass_dev->sl.llr);
+	if (rtn != 0) {
+		cxidev_warn(&cass_dev->cdev, "sl_llr_del failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	rtn = sl_mac_del(cass_dev->sl.mac);
+	if (rtn != 0) {
+		cxidev_warn(&cass_dev->cdev, "sl_mac_del failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	rtn = sl_link_del(cass_dev->sl.link);
+	if (rtn != 0) {
+		cxidev_warn(&cass_dev->cdev, "sl_link_del failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	rtn = sl_lgrp_del(cass_dev->sl.lgrp);
+	if (rtn != 0) {
+		cxidev_warn(&cass_dev->cdev, "sl_lgrp_del failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	rtn = sl_ldev_del(cass_dev->sl.ldev);
+	if (rtn != 0) {
+		cxidev_warn(&cass_dev->cdev, "sl_ldev_del failed [%d]\n", rtn);
+		return rtn;
+	}
+
+	if (cass_dev->sl.is_initialized) {
+		kobject_put(&cass_dev->port_num_kobj);
+		kobject_put(&cass_dev->port_kobj);
+		cass_dev->sl.is_initialized = false;
+	}
+
+	return 0;
+}
+
+int cass_sl_link_fini(struct cass_dev *cass_dev)
+{
+	int rtn;
+
+	cxidev_dbg(&cass_dev->cdev, "sl fini\n");
+	if (!cass_dev->sl.is_initialized)
+		return 0;
+
+	cass_lmon_kill_all(cass_dev);
+	rtn = cass_sl_link_down(cass_dev);
+	if (rtn) {
+		cxidev_err(&cass_dev->cdev,
+			   "link quiesce failed; aborting SL teardown [%d]\n", rtn);
+		return rtn;
+	}
+
+	rtn = cass_sl_media_unconfig(cass_dev);
+	if (rtn) {
+		cxidev_warn(&cass_dev->cdev, "media unconfig failed [%d]\n", rtn);
+		return rtn;
+	}
+	cass_dev->port->config_state &= ~CASS_MEDIA_CONFIGURED;
+	rtn = cass_sl_exit(cass_dev);
+	if (rtn)
+		return rtn;
+
+	cass_port_del_port_db(cass_dev);
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sl_io.c b/drivers/net/ethernet/hpe/ss1/cass_sl_io.c
new file mode 100644
index 000000000000..5eca53cb0969
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sl_io.c
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include "cass_core.h"
+#include "cass_sl_io.h"
+
+int cass_sl_uc_write8(void *uc_accessor, u8 page, u8 addr, u8 data)
+{
+	struct cass_dev *cass_dev = uc_accessor;
+	int              rtn;
+
+	rtn = uc_cmd_qsfp_write(cass_dev, page, addr, &data, sizeof(data));
+
+	cxidev_dbg(&cass_dev->cdev, "sl_uc_write8 0x%x <- 0x%x\n", addr, data);
+
+	return rtn;
+}
+
+int cass_sl_uc_read(void *uc_accessor, u32 offset, u32 page, u8 *data, u32 len)
+{
+	struct cass_dev *cass_dev = uc_accessor;
+
+	cxidev_dbg(&cass_dev->cdev, "sl uc read (offset = 0x%X, page = %u, len = %u)\n",
+		   offset, page, len);
+
+	return cxi_get_qsfp_data(&cass_dev->cdev, offset, len, page, data);
+}
+
+u64 cass_sl_read64(void *pci_accessor, long addr)
+{
+	struct cass_dev *cass_dev = pci_accessor;
+	u64              data64;
+
+	cass_read(cass_dev, addr, &data64, sizeof(u64));
+
+	cxidev_dbg(&cass_dev->cdev, "sl read64 0x%lX = 0x%llX\n", addr, data64);
+
+	return data64;
+}
+
+void cass_sl_write64(void *pci_accessor, long addr, u64 data64)
+{
+	struct cass_dev *cass_dev = pci_accessor;
+
+	cass_write(cass_dev, addr, &data64, sizeof(u64));
+
+	cxidev_dbg(&cass_dev->cdev, "sl write64 0x%lX <- 0x%llX\n", addr, data64);
+}
+
+#define CASS_SL_SBUS_RD_CMD           0x22
+#define CASS_SL_SBUS_RD_DELAY_US      50
+#define CASS_SL_SBUS_RD_TIMOUT_MS     500
+#define CASS_SL_SBUS_RD_POLL_INTVL_MS 10
+int cass_sl_sbus_rd(void *sbus_accessor, u32 sbus_addr, u8 reg_addr, u32 *rd_data)
+{
+	int                        rtn;
+	struct cass_dev           *cass_dev = sbus_accessor;
+	struct cxi_sbus_op_params  params;
+	u8                         result_code;
+	u8                         overrun;
+
+	params.req_data      = 0;
+	params.data_addr     = reg_addr;
+	params.rx_addr       = (sbus_addr & 0xFF);
+	params.command       = CASS_SL_SBUS_RD_CMD;
+	params.delay         = CASS_SL_SBUS_RD_DELAY_US;
+	params.timeout       = CASS_SL_SBUS_RD_TIMOUT_MS;
+	params.poll_interval = CASS_SL_SBUS_RD_POLL_INTVL_MS;
+
+	mutex_lock(&cass_dev->sl.sbus_lock);
+
+	rtn = cxi_sbus_op(&cass_dev->cdev, &params, rd_data, &result_code, &overrun);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl sbus rd - cxi_sbus_op failed [%d]\n", rtn);
+		goto out;
+	}
+	if (result_code != 4) {
+		cxidev_err(&cass_dev->cdev, "sl sbus rd - cxi_sbus_op (rc = %d)\n", result_code);
+		rtn = -EBADRQC;
+		goto out;
+	}
+	if (overrun != 0) {
+		cxidev_err(&cass_dev->cdev, "sl sbus rd - cxi_sbus_op (overrun = %d)\n", overrun);
+		rtn = -EIO;
+		goto out;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "sl sbus rd (sbus_addr = 0x%08X, reg = 0x%02X, data = 0x%08X)\n",
+		   sbus_addr, reg_addr, *rd_data);
+
+	rtn = 0;
+
+out:
+	mutex_unlock(&cass_dev->sl.sbus_lock);
+
+	return rtn;
+}
+
+#define CASS_SL_SBUS_WR_CMD           0x21
+#define CASS_SL_SBUS_WR_DELAY_US      50
+#define CASS_SL_SBUS_WR_TIMOUT_MS     500
+#define CASS_SL_SBUS_WR_POLL_INTVL_MS 10
+int cass_sl_sbus_wr(void *sbus_accessor, u32 sbus_addr, u8 reg_addr, u32 req_data)
+{
+	int                        rtn;
+	struct cass_dev           *cass_dev = sbus_accessor;
+	struct cxi_sbus_op_params  params;
+	u32                        rsp_data;
+	u8                         result_code;
+	u8                         overrun;
+
+	params.req_data      = req_data;
+	params.data_addr     = reg_addr;
+	params.rx_addr       = (sbus_addr & 0xFF);
+	params.command       = CASS_SL_SBUS_WR_CMD;
+	params.delay         = CASS_SL_SBUS_WR_DELAY_US;
+	params.timeout       = CASS_SL_SBUS_WR_TIMOUT_MS;
+	params.poll_interval = CASS_SL_SBUS_WR_POLL_INTVL_MS;
+
+	mutex_lock(&cass_dev->sl.sbus_lock);
+
+	rtn = cxi_sbus_op(&cass_dev->cdev, &params, &rsp_data, &result_code, &overrun);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl sbus wr - cxi_sbus_op failed [%d]\n", rtn);
+		goto out;
+	}
+	if (result_code != 1) {
+		cxidev_err(&cass_dev->cdev, "sl sbus wr - cxi_sbus_op (rc = %d)\n", result_code);
+		rtn = -EBADRQC;
+		goto out;
+	}
+	if (overrun != 0) {
+		cxidev_err(&cass_dev->cdev, "sl sbus wr - cxi_sbus_op (overrun = %d)\n", overrun);
+		rtn = -EIO;
+		goto out;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "sl sbus wr (sbus = 0x%08X, reg = 0x%02X, data = 0x%08X)\n",
+		   sbus_addr, reg_addr, req_data);
+
+	rtn = 0;
+
+out:
+	mutex_unlock(&cass_dev->sl.sbus_lock);
+
+	return rtn;
+}
+
+#define CASS_SL_SBUS_OP_DELAY_US      50
+#define CASS_SL_SBUS_OP_TIMOUT_MS     500
+#define CASS_SL_SBUS_OP_POLL_INTVL_MS 10
+int cass_sl_sbus_cmd(void *sbus_accessor, int ring, u32 req_data,
+		     u8 reg_addr, u8 dev_addr, u8 op,
+			    u32 *rsp_data, u8 *result_code, u8 *overrun,
+			    u8 *error, int timeout_ms, u32 flags)
+{
+	int                        rtn;
+	struct cass_dev           *cass_dev = sbus_accessor;
+	struct cxi_sbus_op_params  params;
+
+	params.req_data      = req_data;
+	params.data_addr     = reg_addr;
+	params.rx_addr       = dev_addr;
+	params.command       = op;
+	params.delay         = CASS_SL_SBUS_OP_DELAY_US;
+	params.timeout       = CASS_SL_SBUS_OP_TIMOUT_MS;
+	params.poll_interval = CASS_SL_SBUS_OP_POLL_INTVL_MS;
+
+	cxidev_dbg(&cass_dev->cdev, "sl sbus cmd\n");
+
+	mutex_lock(&cass_dev->sl.sbus_lock);
+
+	rtn = cxi_sbus_op(&cass_dev->cdev, &params, rsp_data, result_code, overrun);
+	if (rtn != 0) {
+		cxidev_err(&cass_dev->cdev, "sl sbus cmd - cxi_sbus_op failed [%d]\n", rtn);
+		goto out;
+	}
+
+	cxidev_dbg(&cass_dev->cdev,
+		   "sl sbus cmd (op - 0x%X, dev = 0x%02X, reg = 0x%02X, data = 0x%08X, result = %u)\n",
+		op, dev_addr, reg_addr, req_data, *result_code);
+
+	// FIXME: for now just checking reset
+	if (((op & 0xF) == 0) && (*result_code != 0)) {
+		cxidev_err(&cass_dev->cdev, "sl sbus cmd - cxi_sbus_op (result = %u)\n",
+			   *result_code);
+		rtn = -EBADRQC;
+		goto out;
+	}
+	if (*overrun != 0) {
+		cxidev_err(&cass_dev->cdev, "sl sbus cmd - cxi_sbus_op (overrun = %u)\n", *overrun);
+		rtn = -EIO;
+		goto out;
+	}
+
+	rtn = 0;
+
+out:
+	mutex_unlock(&cass_dev->sl.sbus_lock);
+
+	return rtn;
+}
+
+#define CASS_SL_PMI_RD_READY_MAX_COUNT 2
+#define CASS_SL_PMI_RD_READY_DELAY_MS  1000
+#define CASS_SL_PMI_RD_MAX_COUNT 10
+#define CASS_SL_PMI_RD_DELAY_MS  100
+int cass_sl_pmi_rd(void *pmi_accessor, u8 lgrp_num, u32 addr, u16 *data)
+{
+	int                           rtn;
+	struct cass_dev              *cass_dev = pmi_accessor;
+	int                           x;
+	union c2_hni_serdes_pmi_ctl   pmi_ctl;
+	union c2_hni_serdes_pmi_data  pmi_data;
+
+	mutex_lock(&cass_dev->sl.pmi_lock);
+
+	/* check ready */
+	for (x = 0; x < CASS_SL_PMI_RD_READY_MAX_COUNT; ++x) {
+		cass_read(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+		if (!pmi_ctl.pmi_lp_ack)
+			break;
+		msleep(CASS_SL_PMI_RD_READY_DELAY_MS);
+	}
+	if (x >= CASS_SL_PMI_RD_READY_MAX_COUNT) {
+		cxidev_err(&cass_dev->cdev,
+			   "sl pmi rd - ready timeout (ctl = 0x%016llX)\n", pmi_ctl.qw);
+		rtn = -1;
+		goto out;
+	}
+
+	/* start */
+	pmi_ctl.qw          = 0ULL;
+	pmi_ctl.pmi_lp_addr = addr;
+	pmi_ctl.pmi_lp_en   = 1;
+	cxidev_dbg(&cass_dev->cdev, "sl pmi rd - ctrl 0x%016llX -> 0x%08X\n",
+		   pmi_ctl.qw, C2_HNI_SERDES_PMI_CTL);
+	cass_write(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+
+	/* poll for done */
+	for (x = 0; x < CASS_SL_PMI_RD_MAX_COUNT; ++x) {
+		cass_read(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+		cxidev_dbg(&cass_dev->cdev, "sl pmi rd - check #%d 0x%08X = 0x%016llX\n",
+			   x, C2_HNI_SERDES_PMI_CTL, pmi_ctl.qw);
+		if (pmi_ctl.pmi_lp_error) {
+			cxidev_err(&cass_dev->cdev, "sl pml rd - error\n");
+			rtn = -1;
+			goto out;
+		}
+		if (pmi_ctl.pmi_lp_ack)
+			break;
+		msleep(CASS_SL_PMI_RD_DELAY_MS);
+	}
+	if (x >= CASS_SL_PMI_RD_MAX_COUNT) {
+		cxidev_err(&cass_dev->cdev, "sl pmi rd - timeout\n");
+		rtn = -ETIMEDOUT;
+		goto out;
+	}
+
+	/* check valid */
+	if (!pmi_ctl.pmi_lp_read_vld) {
+		cxidev_err(&cass_dev->cdev, "sl pmi rd - data not valid\n");
+		rtn = -1;
+		goto out;
+	}
+
+	/* get data */
+	cass_read(cass_dev, C2_HNI_SERDES_PMI_DATA, &pmi_data, sizeof(pmi_data));
+
+	cxidev_dbg(&cass_dev->cdev, "sl pmi rd - read 0x%08X = 0x%016llX\n",
+		   C2_HNI_SERDES_PMI_DATA, pmi_data.qw);
+
+	*data = pmi_data.pmi_lp_rddata;
+
+	cxidev_dbg(&cass_dev->cdev, "sl pmi rd (addr = 0x%08X, data = 0x%04X)\n", addr, *data);
+
+	rtn = 0;
+
+out:
+	/* finish transaction */
+	pmi_ctl.qw = 0ULL;
+	cass_write(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+
+	mutex_unlock(&cass_dev->sl.pmi_lock);
+
+	return rtn;
+}
+
+#define CASS_SL_PMI_WR_READY_MAX_COUNT 2
+#define CASS_SL_PMI_WR_READY_DELAY_MS  1000
+#define CASS_SL_PMI_WR_MAX_COUNT 10
+#define CASS_SL_PMI_WR_DELAY_MS  100
+int cass_sl_pmi_wr(void *pmi_accessor, u8 lgrp_num, u32 addr, u16 data, u16 mask)
+{
+	int                           rtn;
+	struct cass_dev              *cass_dev = pmi_accessor;
+	int                           x;
+	union c2_hni_serdes_pmi_ctl   pmi_ctl;
+	union c2_hni_serdes_pmi_data  pmi_data;
+
+	mutex_lock(&cass_dev->sl.pmi_lock);
+
+	/* check ready */
+	for (x = 0; x < CASS_SL_PMI_WR_READY_MAX_COUNT; ++x) {
+		cass_read(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+		if (!pmi_ctl.pmi_lp_ack)
+			break;
+		msleep(CASS_SL_PMI_WR_READY_DELAY_MS);
+	}
+	if (x >= CASS_SL_PMI_WR_READY_MAX_COUNT) {
+		cxidev_err(&cass_dev->cdev,
+			   "sl pmi wr - ready timeout (ctl = 0x%016llX)\n", pmi_ctl.qw);
+		rtn = -1;
+		goto out;
+	}
+
+	/* load data */
+	pmi_data.qw              = 0ULL;
+	pmi_data.pmi_lp_wrdata   = data;
+	pmi_data.pmi_lp_maskdata = ~mask;
+	cxidev_dbg(&cass_dev->cdev, "sl pmi wr - data 0x%016llX -> 0x%08X\n",
+		   pmi_data.qw, C2_HNI_SERDES_PMI_DATA);
+	cass_write(cass_dev, C2_HNI_SERDES_PMI_DATA, &pmi_data, sizeof(pmi_data));
+
+	/* start */
+	pmi_ctl.qw           = 0ULL;
+	pmi_ctl.pmi_lp_addr  = addr;
+	pmi_ctl.pmi_lp_en    = 1;
+	pmi_ctl.pmi_lp_write = 1;
+	cxidev_dbg(&cass_dev->cdev, "sl pmi wr - ctrl 0x%016llX -> 0x%08X\n",
+		   pmi_ctl.qw, C2_HNI_SERDES_PMI_CTL);
+	cass_write(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+
+	/* poll for done */
+	for (x = 0; x < CASS_SL_PMI_WR_MAX_COUNT; ++x) {
+		cass_read(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+		cxidev_dbg(&cass_dev->cdev, "sl pmi wr - check #%d 0x%08X = 0x%016llX\n",
+			   x, C2_HNI_SERDES_PMI_CTL, pmi_ctl.qw);
+		if (pmi_ctl.pmi_lp_error) {
+			cxidev_err(&cass_dev->cdev, "sl pmi wr - error\n");
+			rtn = -1;
+			goto out;
+		}
+		if (pmi_ctl.pmi_lp_ack)
+			break;
+		msleep(CASS_SL_PMI_WR_DELAY_MS);
+	}
+	if (x >= CASS_SL_PMI_WR_MAX_COUNT) {
+		cxidev_err(&cass_dev->cdev, "sl pmi wr - timeout\n");
+		rtn = -ETIMEDOUT;
+		goto out;
+	}
+
+	cxidev_dbg(&cass_dev->cdev, "sl pmi wr (addr = 0x%08X, data = 0x%04X, mask = 0x%04X)\n",
+		   addr, data, mask);
+
+	rtn = 0;
+
+out:
+	/* finish transaction */
+	pmi_ctl.qw = 0ULL;
+	cass_write(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
+
+	mutex_unlock(&cass_dev->sl.pmi_lock);
+
+	return rtn;
+}
+

-- 
2.56.0

