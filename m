Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394100;
	b=OGDqZWhQ4OvMm3goQtKfHa76XC0RypJuYrlWIhImoagK6Ny2Cd+nvbubh5bGBgzAUPu4
	 HvlwfkOWM0CI5uHVmfs8unJwedoY9kr9OiLoBUbRRXj5DddcIEDuquW+Vh8EsEQZ5noHz
	 Yu+ZCWTSxCyOAV12hHLci9zMT87YiUYpODJiceKphaHX4xw/Lic76H0ryyt9ZdNZwy5oL
	 mJ0KVNYoWGDFcgXW8RRaWaAL0yjEYFTDdedApoPXAW2REH6D/Df7DkFQvlfj4PgZXyh6B
	 cLkQekdk3Xk+IM9FP1ACMQaFq+nEMBAtmeE/sLl7SFCNQf0q3PHBiNZ911z6qbsSEYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394100;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w3ZfBVlJdQ/B1C7ukg6RSIvLapSXHd74ooltlIoBbL0=;
	b=hZ4PCgCuWxfPmGFgefDUkoWSuP8pOE/BRdAmMQeUNXeK6cMdbbfA4EccsmKfm1107X9X
	 AipQIkOiv4XyWoJ2QKLX20TF4OszjmhJadiZbaiu9zz6WWAk5ZfwxagFUTrriHqNQX8Xv
	 WEiXyLi2jwRf0Ab1tOQxWRPdnPu9iInQr8F7ORjFGcjOgFp41ldh0AMw1o1yJ91zNv3k3
	 MaqKgEUJl7I0NgZfm0F77drnN0h5d7bcyzJxBALuo6kBoWbCY1oM+/yjSiWwbyBnXlKzV
	 sEvZ427EZHHPDGv5jW2watVNH0CltNEpCMsl9kEoqkrFlP3htvkVlCSUJ4pr30U41ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=RsshJuAL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2D606A331;
	Fri, 30 Oct 2026 21:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A2D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=RsshJuAL
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHxf6l1536594;
	Fri, 30 Oct 2026 21:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=w3
	ZfBVlJdQ/B1C7ukg6RSIvLapSXHd74ooltlIoBbL0=; b=RsshJuALY7MPswGH4u
	GvVb6rG1YNdQ3LbnoDlamz5DJv5NWANyjP1iM8eQfiLJatWle0X3jeNvxCe84fbb
	znbsY6uaSX1oNwNdSFuq6FoLqgekFBA51Yvw5ablgyln2uj3SKxWcsd7a01oJ6is
	zW0835PQgN6Xq1mQSZtCjTbaI6Ntb7GikpDXQtEN5nZFrhiyNBTeOLHLtrMsrCUA
	eFo7hpmWb7q3u8+f3creEgg0sdkoT+1pGutOT5ofFM1XV6456rb0a/prMYzkqNfi
	IHJKWCCAI0RMVy7lbgD0NH1IAEVojtyqogGDbTMluS+9q7sS9qUSmx+oqQNv2O/f
	puCQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmwj9v583-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:10 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 7274ED26C;
	Fri, 30 Oct 2026 21:01:09 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:08 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:08 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:07 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nORwUG4bddg8fTOgWaxwHGyxLHiP5cKHq8GxlWpLA483lwnF/gkwcoG4yG8ixYgmwIr6ClkyYGk+eNnTFvhsx2Jw/VxsE+p2+Ncmv17neeqOHat5ZXn0SdXZmcITYpirjU6O5jjwa8VWuZHNw0gAxD36VH64oFEIa7Z0ERyx6/+R1vpXls6TYPNaSCm1jDFoghh6LC2p1SYnzXKtHK1QDXG0RBbDtJYCWaskr5mYN+SAxs/1oQicyxpc7Bn36l9P5gRP2gGP7dwjeYGpAenNkoJLbN43kdMEphrLGR0vpoKsEwICvF9tDP8Hn8OnCZ1STkm8Z8vNQSvE5YnDH5HX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3ZfBVlJdQ/B1C7ukg6RSIvLapSXHd74ooltlIoBbL0=;
 b=BZd20t6Pbzj7lgm3euP1URCSVSSErJBCrbDL62J/nysmFFVeZK9cTgFHfEP3+KOWvGtDZrQOnAxTKlFmwNarF3h4sbTlBSnJUZj2y+/e2DLQF3e3a/ZmXY8itK9Qcv4i8Vsxuyt7/zdwb1yntvnyYrYC59+6X0YjVZAW76L1k0nD8b79Pcy5HWDURKvW4YBkLw8JVlAhrxWKAtdlSNTRJjkTKe+SnvkdFaKUuAFYvLxY4JSalcqjno2WKEg/qXrBD+iL6l/qAG13slqs79ERVlUn0yC9GRziiMu17gHeEwAVhRtzfxKukkbXxDrJkvMW4U6+GvMA1HIdJwHy2lJ8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:01:05 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:01:05 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:15 -0700
Subject: [PATCH 19/23] net: hpe: ss1: add SR-IOV support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-19-8c2c391cc283@hpe.com>
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
        <linux-kbuild@vger.kernel.org>, Doug Ledford <doug.ledford@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SN7PR18CA0018.namprd18.prod.outlook.com
 (2603:10b6:806:f3::10) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 34478e9e-19e4-4894-4b1e-08df36c8e9ae
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|921020|56012099006|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022115727099003|261022075727099003|261022113327099003|261022105027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 7hN93eXDMeN1AduewZC7sxlN/WfREQzUsqD88Crq7PiE/nq2ggPIW4EZrmPTNZT/RNC/YAHwhqAuuFQ+RsRViUFF446E4y45XlWeJ8oIH0W5094mNkTuh2dF7aT6rkQTSGhtBEmRE28FQMJtOXQhZN0qz3CyTnbaxhfqEjZ1CWBO1hjhpa2qeAMEFlo3rY+XifcEcLJnS6fVY+tgtC2L8l4rEzpVQNniUwTRtVJaRh6sxKLJ4J/dd8aDHu7fRVJtpjCuKt4rPvFSHUb+ka34X/37j7HrSj/knwsbuxZfHzOg9FtJPOsATs9C2TqW5RxiTdg+ec9ZxRFLZoShYrE6x1zd+NcgYAIlcNRGnEdz2JWklUdolXdiWCyknZS2QxMC9ORotN4vN7aEhxjlK6V7Muz/fitIUCjnLp/11Mp9tv/VL3xaQ7xuMFZR6HtNHcUUAxkACBFE9Bx/Yo0T+6ObJlNvNOPoF8wbohEfFMM2OAltGR0WKcK76bwNwPT0RB7xZHomrqyuHaGX+4s9Rd5ivvLvi0fuE9TtXUY3PzBzKL5j4iHgKAYRfgHw5hCcKhznkSgP+wkm5XPuH4oaVepe5gNCEKFhWu3IwUOnTs2lZ8KpkVcB37M4+pS8yzBVI9sFTMntwtn3H0AD1GsZQi0oFz5DUVFllzjL/+rH7OM79eKAVgtbPP2rMzeJIeLTmfO09YThaBX1nq+vEEik7WJuiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBoVms0T3VkaEMwZlZucmZESzZTVWdNaEhHVWlUZ2Z5SDZZZjd2UWFQTU81?=
 =?utf-8?B?S2FRc3RqdXdXbklSSzdwaTR3b0VlcHNydzVQWEdlTm9qYmpvdkkwVDI5VjBS?=
 =?utf-8?B?R3ZjMmw5MlZLZytnMEZnMGlGalJmcXMySVdzZ3FMQUdJSzBoY1pqQVZVUkpV?=
 =?utf-8?B?UHVUaXdjVnp1ZUxhbFp2b2FaTDhKYnFKbHVBSmozcXdLak95ZWYwWlh2RVBj?=
 =?utf-8?B?eitEcGsyTll2VHAwR0IyTDczU2tvbUV1NnhFSXlFVEk0WHArY282Ym9kUWJV?=
 =?utf-8?B?U0FyUEc3eFU3dXlmQ1d2TFpUcnJBVENoeHlSUHB1NFZzSHpqS0JscHhDY2Y1?=
 =?utf-8?B?WVBraWJtMmpKZm1ZRTZSTm5ReDFob2tqVUpFbGNxWEJUMTJveXlhdlNJMEZy?=
 =?utf-8?B?b0RqTVM2R1NSSHJwTlZoNjEwY1BCem5qK2hOL3RxT0RyTjN0WmpyRzg2M3Uy?=
 =?utf-8?B?Z3ZNaHI2dDZVdFkwVU1HK01CUDhJd3ozRHpMdHU4a3ZWTE9NZXZqejVybFNK?=
 =?utf-8?B?UlQ4ckgzTnJSS2JOUGxSZzhLQlhFUUFkQlBHa05KZUdlZHpBU0wwdWxSQ3BF?=
 =?utf-8?B?ZWlPRHVJRXQyVHF4cVhOMldYWDFaRFdGdFYrbnpDVnJhdFJhV2NORzdhSkc5?=
 =?utf-8?B?dzFUSTdNamgvRmcrc3I3VFhLamdudjBocXd3SW5XNlBISThJU1NrOS8xaEJI?=
 =?utf-8?B?MVQ4OVBVcWN1ZlM4M1lEakxmbmRMOENVOTlRT2lFbzBydDc0OU94bnRacDdW?=
 =?utf-8?B?TkM0K1BLZ3NFcUd2Y1A0YmxrSWl5Y0hMNWtmeXF6MHkyTUM1eWZYdEJJOWFO?=
 =?utf-8?B?QnBRVGlrS0hPUXhXcTFIVXpqbUU4Rk9vTkxDdVlFc2JlT3FoZTJ1ZUlZWGhN?=
 =?utf-8?B?YXZRNXprMlkyczBMM05MUGw1RERsUnRUMGhJSzc3eCtaSWxPclp4aXpkQUd0?=
 =?utf-8?B?RE9Ba1dCM2QrL1UzSTliV24vN1dHUlROemxKS05hY2w4U0JXM1VoYzh4RDNt?=
 =?utf-8?B?cDJ5SzVuaGdPb1Ywbzcvb1k3SzlFSXZSOXpjQ0Z1RTBXREVsMEhNdXIyRW9M?=
 =?utf-8?B?ZWpLL2N2dVNnQzRtbEcxT0tGY2hrc04zU3JzY1FDak9ERjB2MjM4S3N6aGdm?=
 =?utf-8?B?cjJkWlZSR2dzdFRmbmc1YUdiZWI3djZTNFpOOGZhcEVYS0ZxcnYvRnlTcElO?=
 =?utf-8?B?eEZaRkJLUzFaN2x1alRRY3o1b2lxdmlGcXVSMUtCV1ZpajVXdkF1RlZSekxV?=
 =?utf-8?B?Y2lUVDR2VlIzWWRYWThPclNjM3RtODFCd2lCbWxOTytkamlGWWxpd1pLVmRO?=
 =?utf-8?B?ZXRNQ1p0QnI4UUd0bE1qNDVxWGlRZFRmczFTYzZQUHovS2Y5MmU1YTFBN2FR?=
 =?utf-8?B?aGFIRUkxMytSZ3VxZ0ZueXBCSi9xKzQ4cXg4Qk55aDhRSjk5Z0Q2cG55TGN3?=
 =?utf-8?B?bnd0NnQvS3NuV29MeDA2WElaa2VXbklsbmhxQ3FtdjE5TXJQUkFUZG1iZk1I?=
 =?utf-8?B?ZDVaVjJ1S0lZYXdkQ2pmNHRsYjN6RE8rU1JuOHVKdHlLRlAycVdoaHFoMVg4?=
 =?utf-8?B?SUVxaEN1eGtOb2x2YkhRVUwvTGl1WmlBRTJMWjRTYm93M1Mwb3V3SS9wbzU1?=
 =?utf-8?B?N1cvTGd2RkhaVlBIazRGMmt1RC90K3JGRVdQODdBaVYwSmdySDF5cnJhVldt?=
 =?utf-8?B?Z0taSTBlWHFJYXNJQWU0OWorTUhySDB5WWp0Z09YTEJJbUJXdHhybVVaVTJW?=
 =?utf-8?B?eU94VCtKRDcxaWpyU21OMDlhTUtCOUNjc1BQZ2ZiOERDTWtBODJrL2hMaUxk?=
 =?utf-8?B?RXNPdE5WQ0lSNlBLWEFVb05qcGtXcnpscXVaYTV2K2VHTE9FUkprc3lKRlF6?=
 =?utf-8?B?TmVhekV4amZkUlhEYmpoSDhTZUpGaWx1ejhyOFcvNXdYc1lkRzZzRUY3bCtM?=
 =?utf-8?B?aWdwRUxNa2VkQlBkYzRnbUFZTWVuaXB1TFJYYy9XSExlUXpFb0NETkFpVWNY?=
 =?utf-8?B?UWJsOVdWTzdzc3FrM0Z0ZnJlQ25LTVpHMUxQSEhweVJ2OC93VkNzVVRyY1VG?=
 =?utf-8?B?NFl5WnhwTlYrTzM3TWp0UjlYdEorSE9rRTZpem96YlR0TzFXNFhsYmNHV0lB?=
 =?utf-8?B?RVYzOHZDZjhoOC95NUtHMkZGaEV3bUh0dnpXQmRQOG82ZjhjZ0NramdsLzNh?=
 =?utf-8?B?Uk4wSmVMUDBNcjVEMysvOFhyeTQxUHdzb1VsYnZMNm05bytMeXJYLy9vNGxG?=
 =?utf-8?B?RjUvWEQxWHlsNFVVZldWbkFJZktXZVJlZ3hrLzhoUjdQci9Mc2dMOHRjR0Mr?=
 =?utf-8?B?VGE2Q0Nuc0FHbUJXQi9UbTN2SG8yd0tiMVZhUmwvVlFiQXZMbVUrUT09?=
X-Exchange-RoutingPolicyChecked: NzPdVQneuqpc1iY7zpmeQ4/tfERlGMBiD5Cm+mj7pI8P8M2kXNYxCCAZqO4MkpHmGrgDRPiJLgA+Ad1+XKW7+FzhRHsf2oCGnNlOcwvosNJ7tBiUzPKFKGKIgfVQQcqWFp6ixqvNIQNSDbwwpyVgLvnFkhHMCcplDa+SpAd/oPqyRXbu0r0gs7ZAWq5fD4DFs+Gd1YHffAwynDHAaodNG7pjYkyr5dKtnZqtPlUDz4rYMXkjD0Rlh0rBkTgtXwQGsjBYHWmPNOfRvd9VS2Dsk3K/JAvYqzFoBMxY9GEWeVpSkTahssI1LQJ1OByq28FLU5QktAMyMER6nlF670Kdnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34478e9e-19e4-4894-4b1e-08df36c8e9ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:01:05.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrQImzMkpLpBgVoiQHzgXnkGhKdtCwavpDyaTirbmyNTlXp3kCoJBzOPonQyjrbjT30d7rehnSElvcFzs6lR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: 3-wbA0eMFpn_jTgDP08a3oxx-SVFrA63
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX9vDoPCNlfKFN
 jU3vZ7Y0fodfrHgymW5FRjY880elbdT5BE+Hmi/v7nySGnZUJ3o03LugkbMrkdevASFLw9R16Ie
 PLQAvSA9Ml1nCyAzNE6TqVQnlQOOg2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXw301DYNpKCRp
 LOQy/DSV7exCAF5jlRDyxC8nVjvKRXnWQvqZRLxUaL/knn6PEVy0uMAr72T9z4PriGfV6xyshfJ
 yhrRpYxKzYyCCEG9IDDS+u9Bw9GFhUpEzkHJ62x73y1nuSy37y+rAIAO8mtlcJgNzty9owqjWQ3
 udoi9GFca0vcZkGqlqB9uaMtye7iMwzgoik3Dz94rypnBGJSPpDQDpriyrciu8QGqOvXl1s8IK1
 h/bDDEC0Xw5wfD/62BrdG8Cdhmgz9aHnJJB2dzKOLcxaeUJybD2iTbR+JfuoCkUE54c/2wCXKTy
 mXcBLDs7LTF10zZnerDPLnVosLBfAUNz4bI1LusXmGuZPqVvQ0aK9Ktu4eR30R5B+tBqoi+LY+v
 bl6bzCh8OsLqxiTy06EP1VD2xNNULjzMgXqFfTi9v3r/ixH/YvjyvEZc3jn2exoQUhQkPzrk9Xj
 gWwgkaXWdPR7Z/9XfpA==
X-Authority-Analysis: v=2.4 cv=bKGDs/+Z c=1 sm=1 tr=0 ts=6ae50596 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ay80y3fxfMS_JZZz1qJy:22 a=MvuuwTCpAAAA:8 a=-jJeQZqnBTtR3HrvRT8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3-wbA0eMFpn_jTgDP08a3oxx-SVFrA63
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add SR-IOV support: VF creation, the PF/VF mailbox and its
notifications.

Known open issues, deferred to the V2 SR-IOV update:

- Sashiko H58: the PF/VF mailbox path is not wired up in-tree.
- Sashiko H59: pf_vf_handshake() can abort VF initialization when it
  probes the wrong half of the endpoint pair.

Known limitation, deferred to V2: this patch carries SR-IOV
virtual-function code (VF-to-PF mailbox requests, mailbox opcodes or VF
resource handling) from an older, incomplete version of the Cassini
SR-IOV support. V2 of this series will include the updated SR-IOV
implementation, so issues in the VF paths should be ignored for now.

Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cass_sriov.c    | 1274 ++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_vf.c       |   58 ++
 drivers/net/ethernet/hpe/ss1/cass_vf_notif.c |   51 ++
 3 files changed, 1383 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cass_sriov.c b/drivers/net/ethernet/hpe/ss1/cass_sriov.c
new file mode 100644
index 000000000000..5c947372ab9c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sriov.c
@@ -0,0 +1,1274 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Cassini SRIOV and VFs handler
+ *
+ * AF_VSOCK sockets are used to pass messages and responses from the VF to the
+ * PF, both when the VF is attached to a guest (using the appropriate hypervisor
+ * vsock transport), and when the VF is attached to the host (using the
+ * vsock_loopback module).
+ *
+ * The VF index of an incoming vsock connection is identified by probing the
+ * PF-to-VF interrupt of each unaccounted-for VF and waiting for a response.
+ * After this initial handshake, communication is always initiated by the VF,
+ * and an acknowledgment from the PF is always expected. Messages are prefixed
+ * with an integer result code (only used by the response from the PF) and
+ * message length.
+ */
+
+#include <linux/pci.h>
+#include <linux/types.h>
+#include <linux/kmod.h>
+#include <linux/kthread.h>
+#include <linux/kvm_host.h>
+#include <linux/net.h>
+#include <linux/vfio.h>
+#include <linux/vm_sockets.h>
+#include <net/sock.h>
+
+#include "cass_core.h"
+#include "cass_vf_notif.h"
+#include "cxi_core.h"
+
+MODULE_SOFTDEP("pre: vsock vsock_loopback");
+
+#if defined(CXI_DISABLE_SRIOV)
+#warning "SR-IOV support is disabled."
+
+int cass_sriov_configure(struct pci_dev *pdev, int num_vfs)
+{
+	return -EOPNOTSUPP;
+}
+
+int cass_vf_init(struct cass_dev *hw)
+{
+	return -EOPNOTSUPP;
+}
+
+void cass_vf_fini(struct cass_dev *hw)
+{
+}
+
+int cxi_send_msg_to_pf(struct cxi_dev *cdev, const void *req,
+		       size_t req_len, void *rsp, size_t *rsp_len)
+{
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL(cxi_send_msg_to_pf);
+
+int cxi_send_msg_to_vf(struct cxi_dev *cdev, int vf_num, const void *req,
+		       size_t req_len, void *rsp, size_t *rsp_len)
+{
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL(cxi_send_msg_to_vf);
+
+int cxi_register_msg_relay(struct cxi_dev *cdev, cxi_msg_relay_t msg_relay,
+			   void *msg_relay_data)
+{
+	return 0;
+}
+EXPORT_SYMBOL(cxi_register_msg_relay);
+
+int cxi_unregister_msg_relay(struct cxi_dev *cdev)
+{
+	return 0;
+}
+EXPORT_SYMBOL(cxi_unregister_msg_relay);
+
+int cass_vf_get_token(struct cxi_dev *hw, int vf_idx, unsigned int *token)
+{
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL(cass_vf_get_token);
+
+#else /* CXI_DISABLE_SRIOV */
+
+/* TODO: make port configurable? (0x17db is arbitrary, taken from C1 PCI vendor ID) */
+#define CXI_SRIOV_VSOCK_PORT 0x17db
+#define CXI_SRIOV_VSOCK_NOTIF_PORT (CXI_SRIOV_VSOCK_PORT + 1)
+
+/* Magic numbers used in VF-PF handshake */
+#define CXI_SRIOV_MAGIC1 0x17db0000
+#define CXI_SRIOV_MAGIC2 0x12345678
+
+/* PF-side timeout for vsock. Kept short so that listener-thread loop still runs. */
+#define CXI_SRIOV_PF_TIMEOUT (HZ / 4)
+
+/* VF-side timeout - longer than PF timeout, to allow time for PF to respond to requests */
+#define CXI_SRIOV_VF_TIMEOUT (HZ * 10)
+
+static int vsock_send_all(struct socket *sock, const void *buffer, size_t length)
+{
+	const u8 *data = buffer;
+	int rc;
+
+	while (length) {
+		struct msghdr msghdr = { .msg_flags = MSG_NOSIGNAL };
+		struct kvec vec = {
+			.iov_base = (void *)data,
+			.iov_len = length,
+		};
+
+		rc = kernel_sendmsg(sock, &msghdr, &vec, 1, length);
+		if (rc <= 0) {
+			kernel_sock_shutdown(sock, SHUT_RDWR);
+			return rc ? rc : -EPIPE;
+		}
+		data += rc;
+		length -= rc;
+	}
+	return 0;
+}
+
+static int write_message_to_vsock(struct socket *sock, const void *msg,
+				  size_t msg_len, int msg_rc, int seq)
+{
+	struct vf_pf_msg_hdr hdr = {
+		.len = msg_len,
+		.rc = msg_rc,
+		.uid = __kuid_val(current_euid()),
+		.gid = __kgid_val(current_egid()),
+		.seq = seq,
+	};
+	int rc;
+
+	if (msg_len > MAX_VFMSG_SIZE || (msg_len && !msg))
+		return -EINVAL;
+	rc = vsock_send_all(sock, &hdr, sizeof(hdr));
+	if (rc)
+		return rc;
+	rc = vsock_send_all(sock, msg, msg_len);
+	if (rc)
+		return rc;
+	return sizeof(hdr) + msg_len;
+}
+
+static int vsock_recv_all(struct socket *sock, void *buffer, size_t length)
+{
+	u8 *data = buffer;
+	size_t received = 0;
+	int rc;
+
+	while (received < length) {
+		struct msghdr msghdr = {};
+		struct kvec vec = {
+			.iov_base = data + received,
+			.iov_len = length - received,
+		};
+
+		rc = kernel_recvmsg(sock, &msghdr, &vec, 1, vec.iov_len, 0);
+		if (rc <= 0) {
+			if (received || !rc)
+				kernel_sock_shutdown(sock, SHUT_RDWR);
+			if (received && (rc == -EAGAIN || rc == -EINTR))
+				return -EPROTO;
+			return rc ? rc : -ECONNRESET;
+		}
+		received += rc;
+	}
+	return 0;
+}
+
+static int read_message_from_vsock(struct socket *sock, void *msg,
+				   size_t *msg_len, int *msg_rc,
+				   uid_t *uid, gid_t *gid, int *seq)
+{
+	struct vf_pf_msg_hdr hdr;
+	u8 discard[64];
+	size_t remaining;
+	int rc;
+
+	rc = vsock_recv_all(sock, &hdr, sizeof(hdr));
+	if (rc)
+		return rc;
+
+	if (hdr.len > MAX_VFMSG_SIZE) {
+		pr_err("Bad message size (%u > %zu)", hdr.len, MAX_VFMSG_SIZE);
+		rc = -EINVAL;
+		goto fail_frame;
+	}
+
+	if (msg && hdr.len && (!msg_len || *msg_len < hdr.len)) {
+		pr_err("Message buffer too small (%u > %zu)", hdr.len, msg_len ? *msg_len : 0);
+		rc = -EMSGSIZE;
+		goto fail_frame;
+	}
+
+	remaining = hdr.len;
+	while (remaining) {
+		size_t chunk = msg ? remaining :
+			min_t(size_t, remaining, sizeof(discard));
+
+		rc = vsock_recv_all(sock, msg ? msg : discard, chunk);
+		if (rc) {
+			if (rc == -EAGAIN || rc == -EINTR)
+				rc = -EPROTO;
+			goto fail_frame;
+		}
+		remaining -= chunk;
+	}
+
+	if (msg_len)
+		*msg_len = hdr.len;
+	if (msg_rc)
+		*msg_rc = hdr.rc;
+	if (uid)
+		*uid = hdr.uid;
+	if (gid)
+		*gid = hdr.gid;
+	if (seq)
+		*seq = hdr.seq;
+
+	return hdr.len ? hdr.len : sizeof(hdr);
+fail_frame:
+	kernel_sock_shutdown(sock, SHUT_RDWR);
+	return rc;
+}
+
+/* Given a PF's pci_dev struct, find the pci_dev of one of its VFs */
+static struct pci_dev *get_vf_pdev(struct pci_dev *pdev, int vf_idx)
+{
+	int devfn = pci_iov_virtfn_devfn(pdev, vf_idx);
+
+	if (devfn < 0)
+		return ERR_PTR(devfn);
+	return pci_get_slot(pdev->bus, devfn);
+}
+
+/* Identify the KVM task associated with a VF that is bound to a guest VM. */
+static struct task_struct *pf_get_kvm_task(struct cass_vf *vf)
+{
+	struct cass_dev *hw = vf->hw;
+	struct pci_dev *vf_pdev = NULL;
+	struct vfio_device *vfio_dev = NULL;
+	struct task_struct *task = NULL;
+	struct pid *pid;
+
+	vf_pdev = get_vf_pdev(hw->cdev.pdev, vf->vf_idx);
+	if (IS_ERR(vf_pdev)) {
+		cxidev_err(&hw->cdev, "vf %d: could not get device", vf->vf_idx);
+		return ERR_PTR(PTR_ERR(vf_pdev));
+	}
+
+	cxidev_dbg(&hw->cdev, "vf %d: device at %s", vf->vf_idx, pci_name(vf_pdev));
+
+	if (!vf_pdev->driver) {
+		task = ERR_PTR(-ENODEV);
+	} else if (!strncmp(vf_pdev->driver->name, "vfio-pci", strlen("vfio-pci"))) {
+		/* VF is under control of VFIO driver, look for KVM task. */
+		vfio_dev = pci_get_drvdata(vf_pdev);
+		if (vfio_dev->kvm) {
+			pid = find_get_pid(vfio_dev->kvm->userspace_pid);
+			task = get_pid_task(pid, PIDTYPE_PID);
+			put_pid(pid);
+		} else {
+			task = ERR_PTR(-ESRCH);
+		}
+	} else if (!strncmp(vf_pdev->driver->name, KBUILD_MODNAME,
+			    strlen(KBUILD_MODNAME))) {
+		/* VF is under control of our driver, KVM task is not applicable */
+		task = NULL;
+	} else {
+		task = ERR_PTR(-EPERM);
+	}
+	pci_dev_put(vf_pdev);
+	return task;
+}
+
+/* Handler thread for incoming messages from the VF driver to the PF. 1 instance
+ * per active VF.
+ */
+static int pf_vf_msghandler(void *data)
+{
+	struct cass_vf *vf = (struct cass_vf *)data;
+	struct cass_dev *hw = vf->hw;
+	struct task_struct *kvm_task;
+	int rc, msg_rc;
+	size_t request_len, reply_len;
+	uid_t uid;
+	gid_t gid;
+	int seq;
+
+	vf->req_sock->sk->sk_rcvtimeo = CXI_SRIOV_PF_TIMEOUT;
+
+	cxidev_dbg(&hw->cdev, "vf %d: started message handler", vf->vf_idx);
+
+	kvm_task = pf_get_kvm_task(vf);
+	if (IS_ERR(kvm_task)) {
+		rc = PTR_ERR(kvm_task);
+		goto err;
+	}
+	vf->kvm_task = kvm_task;
+
+	while (!kthread_should_stop()) {
+		request_len = MAX_VFMSG_SIZE;
+		rc = read_message_from_vsock(vf->req_sock, vf->request,
+					     &request_len, NULL, &uid, &gid, &seq);
+		if (rc == -EAGAIN) {
+			continue;
+		} else if (rc == -EINTR) {
+			/* Expected when thread is asked to terminate */
+			continue;
+		} else if (rc < 0) {
+			cxidev_err(&hw->cdev, "vf %d: error reading request: %d",
+				   vf->vf_idx, rc);
+			break;
+		} else if (rc == 0) {
+			cxidev_err(&hw->cdev, "vf %d: connection closed by VF",
+				   vf->vf_idx);
+			break;
+		}
+
+		cxidev_dbg(&hw->cdev, "vf %d: got %ld byte message", vf->vf_idx,
+			   request_len);
+
+		if (vf->kvm_task) {
+			/* VFs associated with a guest virtual machine must use the
+			 * credentials of the VM's process on the host, rather than the
+			 * guest's user creds that come over the vsock.
+			 */
+			const struct cred *cred;
+
+			rcu_read_lock();
+			cred = rcu_dereference(vf->kvm_task->cred);
+			uid = __kuid_val(cred->uid);
+			gid = __kgid_val(cred->gid);
+			rcu_read_unlock();
+		}
+
+		mutex_lock(&hw->msg_relay_lock);
+		if (hw->msg_relay) {
+			reply_len = MAX_VFMSG_SIZE;
+			msg_rc = hw->msg_relay(hw->msg_relay_data, vf->vf_idx,
+					       vf->request, request_len, uid, gid,
+					       vf->reply, &reply_len);
+		} else {
+			reply_len = 0;
+			msg_rc = -ENODEV;
+		}
+		mutex_unlock(&hw->msg_relay_lock);
+
+		if (reply_len > MAX_VFMSG_SIZE) {
+			reply_len = 0;
+			msg_rc = -E2BIG;
+		}
+
+		cxidev_dbg(&hw->cdev, "vf %d: responding with %ld bytes, rc=%d",
+			   vf->vf_idx, reply_len, msg_rc);
+		rc = write_message_to_vsock(vf->req_sock, vf->reply, reply_len,
+					    msg_rc, seq);
+		if (rc < 0) {
+			cxidev_err(&hw->cdev, "vf %d: error sending response: %d",
+				   vf->vf_idx, rc);
+			break;
+		}
+	}
+
+	/* Send a NULL request message to indicate that this VF disconnected */
+	mutex_lock(&hw->msg_relay_lock);
+	if (hw->msg_relay)
+		hw->msg_relay(hw->msg_relay_data, vf->vf_idx, NULL, 0, 0, 0, NULL,
+			      &reply_len);
+	mutex_unlock(&hw->msg_relay_lock);
+
+	if (rc > 0)
+		rc = 0;
+
+err:
+	cxidev_dbg(&hw->cdev, "vf %d: handler exiting, rc=%d", vf->vf_idx, rc);
+
+	if (vf->kvm_task)
+		put_task_struct(vf->kvm_task);
+	kernel_sock_shutdown(vf->req_sock, SHUT_RDWR);
+	sock_release(vf->req_sock);
+	vf->req_sock = NULL;
+	mutex_lock(&vf->notif_lock);
+	if (vf->notif_sock) {
+		kernel_sock_shutdown(vf->notif_sock, SHUT_RDWR);
+		sock_release(vf->notif_sock);
+		vf->notif_sock = NULL;
+	}
+	mutex_unlock(&vf->notif_lock);
+
+	vf->kvm_task = NULL;
+
+	cass_ac_phys_free(hw, vf->phys_ac);
+	vf->phys_ac = 0;
+
+	return rc;
+}
+
+/* Probe inactive VFs from range_min to range_max inclusive */
+static int pf_probe_vfs(struct cass_dev *hw, struct socket *sock,
+			int range_min, int range_max)
+{
+	int i, rc;
+	int magic;
+	size_t msg_len = sizeof(magic);
+	union c_pi_ipd_cfg_pf_vf_irq irqs = {
+		.irq = 0,
+	};
+
+	for (i = range_min; i <= range_max; i++)
+		if (!hw->vfs[i].req_sock) /* Only probe VFs that aren't already active */
+			irqs.irq |= 1ULL << i;
+	if (!irqs.irq)
+		return 0;
+
+	magic = CXI_SRIOV_MAGIC1;
+	rc = write_message_to_vsock(sock, &magic, sizeof(magic), 0, 0);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "could not send magic to incoming VF: %d", rc);
+		return rc;
+	}
+
+	cass_write(hw, C_PI_IPD_CFG_PF_VF_IRQ, &irqs,
+		   sizeof(union c_pi_ipd_cfg_pf_vf_irq));
+
+	msg_len = sizeof(magic);
+	do {
+		rc = read_message_from_vsock(sock, &magic, &msg_len, NULL, NULL, NULL, NULL);
+		if (rc == -EINTR)
+			schedule();
+	} while (rc == -EINTR);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "could not read magic from incoming VF: %d", rc);
+		return rc;
+	}
+
+	return magic;
+}
+
+/* Identify which VF an incoming connection belongs to, by probing the PF-to-VF
+ * interrupt of VFs that do not have an active connection.
+ */
+static int pf_vf_handshake(struct cass_dev *hw, struct socket *sock)
+{
+	int range_min = 0;
+	int range_max = hw->num_vfs - 1;
+	int range_mid, rc, seq, vf_idx;
+	int magic;
+
+	seq = 0; /* Handshake sequence number */
+	do {
+		magic = CXI_SRIOV_MAGIC1 + seq;
+		range_mid = range_min + (range_max - range_min) / 2;
+		if (pf_probe_vfs(hw, sock, range_min, range_mid) == magic) {
+			seq += 1;
+			range_max = range_mid;
+		} else if (pf_probe_vfs(hw, sock, range_mid + 1, range_max) == magic) {
+			seq += 1;
+			range_min = range_mid + 1;
+		} else {
+			break;
+		}
+	} while (range_max != range_min);
+
+	if (range_max != range_min) {
+		cxidev_err(&hw->cdev, "vf search failed");
+		return -ENOENT;
+	}
+	vf_idx = range_min;
+
+	magic = CXI_SRIOV_MAGIC2;
+	rc = write_message_to_vsock(sock, &magic, sizeof(magic), 0, 0);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "could not send magic to incoming VF: %d", rc);
+		return rc;
+	}
+
+	return vf_idx;
+}
+
+/* Handle an incoming request connection from a VF */
+static void handle_vf_req_conn(struct cass_dev *hw,
+			       struct socket *incoming)
+{
+	struct sockaddr_vm peeraddr;
+	struct cass_vf *vf;
+	int rc, vf_idx;
+
+	rc = kernel_getpeername(incoming, (struct sockaddr *)&peeraddr);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "could not get peer addr for vf: %d", rc);
+		goto close_sock;
+	}
+
+	vf_idx = pf_vf_handshake(hw, incoming);
+	if (vf_idx < 0) {
+		cxidev_err(&hw->cdev, "vf handshake from cid %d failed: %d",
+			   peeraddr.svm_cid, vf_idx);
+		goto close_sock;
+	}
+
+	cxidev_dbg(&hw->cdev, "pf got request connection from cid %d, vf %d",
+		   peeraddr.svm_cid, vf_idx);
+
+	vf = &hw->vfs[vf_idx];
+	if (vf->req_sock) {
+		cxidev_err(&hw->cdev, "vf %d already in use", vf_idx);
+		goto close_sock;
+	}
+
+	vf->vf_idx = vf_idx;
+	vf->hw = hw;
+	vf->req_sock = incoming;
+	get_random_bytes(&vf->token, sizeof(vf->token));
+
+	rc = cass_ac_phys_alloc(hw, true, vf_idx);
+	if (rc <= 0) {
+		cxidev_err(&hw->cdev, "could not allocate ac for vf %d: %d",
+			   vf_idx, rc);
+		vf->req_sock = NULL;
+		goto close_sock;
+	}
+	vf->phys_ac = rc;
+	cxidev_dbg(&hw->cdev, "allocated acid %d for vf %d", vf->phys_ac, vf_idx);
+
+	vf->task = kthread_run(pf_vf_msghandler, vf, "cxi_vf_%d", vf_idx);
+	if (IS_ERR(vf->task)) {
+		cxidev_err(&hw->cdev, "failed to start handler for vf %d", vf_idx);
+		cass_ac_phys_free(hw, vf->phys_ac);
+		vf->phys_ac = 0;
+		vf->req_sock = NULL;
+		vf->task = NULL;
+		goto close_sock;
+	}
+	return;
+
+close_sock:
+	kernel_sock_shutdown(incoming, SHUT_RDWR);
+	sock_release(incoming);
+}
+
+/* Handle an incoming notification connection from a VF */
+static void handle_vf_notif_conn(struct cass_dev *hw,
+				 struct socket *incoming)
+{
+	struct sockaddr_vm peeraddr;
+	struct cass_vf *vf;
+	int rc, vf_idx, i;
+	unsigned int token;
+	struct cass_vf_notif_ping ping = {
+		.op = CASS_VF_NOTIF_OP_PING,
+	};
+	size_t msg_len;
+
+	rc = kernel_getpeername(incoming, (struct sockaddr *)&peeraddr);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev,
+			   "could not get peer addr for notification connection: %d", rc);
+		goto close_sock;
+	}
+
+	/* Read token to identify which VF this is */
+	msg_len = sizeof(token);
+	do {
+		rc = read_message_from_vsock(incoming, &token, &msg_len, NULL, NULL, NULL, NULL);
+		if (rc == -EINTR)
+			schedule();
+	} while (rc == -EINTR);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev,
+			   "could not read token from notification connection: %d", rc);
+		goto close_sock;
+	}
+
+	if (msg_len != sizeof(token)) {
+		cxidev_err(&hw->cdev, "invalid token size: %zu", msg_len);
+		goto close_sock;
+	}
+
+	/* Find VF by matching token */
+	vf_idx = -1;
+	for (i = 0; i < hw->num_vfs; i++) {
+		if (hw->vfs[i].req_sock && hw->vfs[i].token == token) {
+			vf_idx = i;
+			break;
+		}
+	}
+
+	if (vf_idx < 0) {
+		cxidev_err(&hw->cdev, "notification connection with unknown token %u",
+			   token);
+		goto close_sock;
+	}
+
+	cxidev_dbg(&hw->cdev, "pf got notification connection from cid %d, vf %d",
+		   peeraddr.svm_cid, vf_idx);
+
+	vf = &hw->vfs[vf_idx];
+	mutex_lock(&vf->notif_lock);
+	if (vf->notif_sock) {
+		cxidev_err(&hw->cdev, "vf %d notification socket already in use", vf_idx);
+		mutex_unlock(&vf->notif_lock);
+		goto close_sock;
+	}
+
+	vf->notif_seq = 0;
+	vf->notif_sock = incoming;
+	mutex_unlock(&vf->notif_lock);
+	cxidev_dbg(&hw->cdev, "vf %d: notification socket connected", vf_idx);
+
+	/* Send test notification */
+	msg_len = sizeof(ping);
+	rc = cxi_send_msg_to_vf(&hw->cdev, vf_idx, &ping, msg_len,
+				NULL, NULL);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "vf %d: could not send test notification: %d",
+			   vf_idx, rc);
+		mutex_lock(&vf->notif_lock);
+		if (vf->notif_sock != incoming) {
+			mutex_unlock(&vf->notif_lock);
+			return;
+		}
+		vf->notif_sock = NULL;
+		mutex_unlock(&vf->notif_lock);
+		goto close_sock;
+	}
+
+	return;
+
+close_sock:
+	kernel_sock_shutdown(incoming, SHUT_RDWR);
+	sock_release(incoming);
+}
+
+static int vsock_create_listen(struct socket **sock, unsigned int port,
+			       int timeout, int backlog)
+{
+	int rc;
+	struct sockaddr_vm addr = {
+		.svm_family = AF_VSOCK,
+		.svm_port = port,
+		.svm_cid = VMADDR_CID_ANY
+	};
+
+	rc = sock_create_kern(&init_net, PF_VSOCK, SOCK_STREAM, 0, sock);
+	if (rc < 0)
+		return rc;
+
+	rc = kernel_bind(*sock, (struct sockaddr_unsized *)&addr, sizeof(addr));
+	if (rc < 0)
+		goto release_sock;
+
+	(*sock)->sk->sk_rcvtimeo = timeout;
+	rc = kernel_listen(*sock, backlog);
+	if (rc < 0)
+		goto release_sock;
+
+	return 0;
+release_sock:
+	sock_release(*sock);
+	*sock = NULL;
+	return rc;
+}
+
+/* Combined listener thread for incoming connections from VFs to the PF.
+ * Handles both request and notification sockets. 1 instance only.
+ */
+static int pf_vf_listener(void *data)
+{
+	int rc, vf_idx;
+	struct cass_dev *hw = (struct cass_dev *)data;
+
+	cxidev_dbg(&hw->cdev, "started vf listener");
+
+	rc = vsock_create_listen(&hw->vf_req_sock, CXI_SRIOV_VSOCK_PORT,
+				 CXI_SRIOV_PF_TIMEOUT, hw->num_vfs);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "could not create vf request listener socket: %d", rc);
+		return rc;
+	}
+
+	rc = vsock_create_listen(&hw->vf_notif_sock, CXI_SRIOV_VSOCK_NOTIF_PORT,
+				 CXI_SRIOV_PF_TIMEOUT, hw->num_vfs);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "could not create vf notification listener socket: %d", rc);
+		goto shutdown_req;
+	}
+
+	while (!kthread_should_stop()) {
+		struct socket *incoming;
+
+		rc = kernel_accept(hw->vf_req_sock, &incoming, 0);
+		if (rc == 0) {
+			handle_vf_req_conn(hw, incoming);
+			continue;
+		} else if (rc != -EAGAIN && rc != -EINTR) {
+			cxidev_err(&hw->cdev, "vf request listener socket accept error: %d", rc);
+			break;
+		}
+
+		rc = kernel_accept(hw->vf_notif_sock, &incoming, 0);
+		if (rc == 0) {
+			handle_vf_notif_conn(hw, incoming);
+			continue;
+		} else if (rc != -EAGAIN && rc != -EINTR) {
+			cxidev_err(&hw->cdev, "vf notification listener socket accept error: %d",
+				   rc);
+			break;
+		}
+	}
+
+	cxidev_dbg(&hw->cdev, "vf listener exiting");
+
+	for (vf_idx = 0; vf_idx < hw->num_vfs; vf_idx++) {
+		if (hw->vfs[vf_idx].req_sock) {
+			kthread_stop(hw->vfs[vf_idx].task);
+			hw->vfs[vf_idx].task = NULL;
+		}
+		mutex_lock(&hw->vfs[vf_idx].notif_lock);
+		if (hw->vfs[vf_idx].notif_sock) {
+			kernel_sock_shutdown(hw->vfs[vf_idx].notif_sock, SHUT_RDWR);
+			sock_release(hw->vfs[vf_idx].notif_sock);
+			hw->vfs[vf_idx].notif_sock = NULL;
+		}
+		mutex_unlock(&hw->vfs[vf_idx].notif_lock);
+	}
+
+	kernel_sock_shutdown(hw->vf_notif_sock, SHUT_RDWR);
+	sock_release(hw->vf_notif_sock);
+	hw->vf_notif_sock = NULL;
+
+shutdown_req:
+	kernel_sock_shutdown(hw->vf_req_sock, SHUT_RDWR);
+	sock_release(hw->vf_req_sock);
+	hw->vf_req_sock = NULL;
+
+	return rc;
+}
+
+static void disable_sriov(struct pci_dev *pdev)
+{
+	struct cass_dev *hw = pci_get_drvdata(pdev);
+
+	pci_disable_sriov(pdev);
+
+	if (hw->vf_listener) {
+		kthread_stop(hw->vf_listener);
+		hw->vf_listener = NULL;
+	}
+
+	hw->num_vfs = 0;
+}
+
+static int enable_sriov(struct pci_dev *pdev, int num_vfs)
+{
+	int rc;
+	int sriov;
+	u16 offset;
+	u16 stride;
+	union c_pi_cfg_pri_sriov pri_sriov = {};
+	struct cass_dev *hw = pci_get_drvdata(pdev);
+
+	rc = request_module("vsock");
+	if (rc) {
+		cxidev_err(&hw->cdev, "could not load vsock module");
+		goto err_novf;
+	}
+
+	rc = request_module("vsock_loopback");
+	if (rc) {
+		cxidev_err(&hw->cdev, "could not load vsock_loopback module");
+		goto err_novf;
+	}
+
+	hw->num_vfs = num_vfs;
+
+	if (!hw->vf_listener)
+		hw->vf_listener = kthread_run(pf_vf_listener, hw, "cxi_vf_listener");
+	if (IS_ERR(hw->vf_listener)) {
+		cxidev_err(&hw->cdev, "could not start vf listener thread");
+		rc = PTR_ERR(hw->vf_listener);
+		hw->vf_listener = NULL;
+		goto err_novf;
+	}
+
+	/* The VF Offset and Stride need to match the SR-IOV configuration. */
+	sriov = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
+	if (!sriov) {
+		cxidev_err(&hw->cdev, "No extended capabilities found\n");
+		rc = -ENODEV;
+		goto err_kill_listener;
+	}
+
+	pci_read_config_word(pdev, sriov + PCI_SRIOV_VF_OFFSET, &offset);
+	pci_read_config_word(pdev, sriov + PCI_SRIOV_VF_STRIDE, &stride);
+
+	pri_sriov.vf_offset = offset;
+	pri_sriov.vf_stride = stride;
+
+	cass_write(hw, C_PI_CFG_PRI_SRIOV, &pri_sriov,
+		   sizeof(union c_pi_cfg_pri_sriov));
+
+	rc = pci_enable_sriov(pdev, num_vfs);
+	if (rc) {
+		cxidev_err(&hw->cdev, "SRIOV enable failed %d\n", rc);
+		goto err_kill_listener;
+	}
+
+	return num_vfs;
+
+err_kill_listener:
+	kthread_stop(hw->vf_listener);
+	hw->vf_listener = NULL;
+err_novf:
+	hw->num_vfs = 0;
+	return rc;
+}
+
+int cass_sriov_configure(struct pci_dev *pdev, int num_vfs)
+{
+	if (num_vfs < 0)
+		return -EINVAL;
+
+	if (num_vfs == 0) {
+		disable_sriov(pdev);
+		return 0;
+	}
+
+	return enable_sriov(pdev, num_vfs);
+}
+
+static irqreturn_t pf_to_vf_int_cb(int irq, void *context)
+{
+	struct cass_dev *hw = context;
+
+	complete(&hw->pf_to_vf_comp);
+	return IRQ_HANDLED;
+}
+
+/* VF-side handler thread for receiving notifications from PF */
+static int vf_notif_handler(void *data)
+{
+	struct cass_dev *hw = (struct cass_dev *)data;
+	int rc;
+	size_t msg_len, rsp_len;
+
+	cxidev_dbg(&hw->cdev, "started notification handler");
+
+	while (!kthread_should_stop()) {
+		msg_len = MAX_VFMSG_SIZE;
+		rc = read_message_from_vsock(hw->vf_notif_sock, hw->vf_notif_buf,
+					     &msg_len, NULL, NULL, NULL, NULL);
+		if (rc == -EAGAIN) {
+			continue;
+		} else if (rc == -EINTR) {
+			/* Expected when thread is asked to terminate */
+			continue;
+		} else if (rc < 0) {
+			cxidev_err(&hw->cdev, "error reading notification from PF: %d", rc);
+			break;
+		} else if (rc == 0) {
+			cxidev_dbg(&hw->cdev, "notification connection closed by PF");
+			break;
+		}
+
+		cxidev_dbg(&hw->cdev, "received %ld byte notification from PF", msg_len);
+
+		rsp_len = 0;
+		rc = dispatch_vf_notif(hw, hw->vf_notif_buf, msg_len,
+				       hw->vf_notif_rsp_buf, &rsp_len);
+		rc = write_message_to_vsock(hw->vf_notif_sock, hw->vf_notif_rsp_buf,
+					    rsp_len, rc, 0);
+		if (rc < 0) {
+			cxidev_err(&hw->cdev, "failed to send notification response: %d", rc);
+			break;
+		}
+	}
+
+	cxidev_dbg(&hw->cdev, "notification handler exiting");
+
+	return 0;
+}
+
+int cass_vf_init(struct cass_dev *hw)
+{
+	int rc, seq;
+	unsigned int magic;
+	size_t msg_len = sizeof(magic);
+	bool init_done = false;
+	const struct cxi_vf_get_token_cmd token_cmd = {
+		.op = CXI_OP_VF_GET_TOKEN,
+	};
+	struct cxi_vf_get_token_resp token_resp;
+	size_t resp_len = sizeof(token_resp);
+	struct sockaddr_vm addr = {
+		.svm_family = AF_VSOCK,
+		.svm_port = CXI_SRIOV_VSOCK_PORT,
+		.svm_cid = VMADDR_CID_HOST,
+	};
+
+	if (!hw->with_vf_support)
+		return 0;
+
+	init_completion(&hw->pf_to_vf_comp);
+
+	mutex_init(&hw->vf_cmd_lock);
+
+	scnprintf(hw->pf_vf_int_name, sizeof(hw->pf_vf_int_name),
+		  "%s_from_pf", hw->cdev.name);
+	hw->pf_vf_vec = pci_irq_vector(hw->cdev.pdev, 0);
+	rc = request_irq(hw->pf_vf_vec, pf_to_vf_int_cb, 0, hw->pf_vf_int_name, hw);
+	if (rc)
+		return rc;
+
+	rc = request_module("vsock");
+	if (rc) {
+		cxidev_err(&hw->cdev, "could not load vsock module");
+		goto free_irq;
+	}
+
+	rc = sock_create_kern(&init_net, PF_VSOCK, SOCK_STREAM, 0, &hw->vf_req_sock);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "vf socket create failed: %d", rc);
+		goto free_irq;
+	}
+
+	hw->vf_req_sock->sk->sk_rcvtimeo = CXI_SRIOV_VF_TIMEOUT;
+	hw->vf_cmd_seq = 0;
+
+	rc = kernel_connect(hw->vf_req_sock, (struct sockaddr_unsized *)&addr,
+			    sizeof(addr), 0);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "vf socket connect failed: %d", rc);
+		goto release_vf_sock;
+	}
+
+	/* Handshake with PF driver starts here. */
+	seq = 0;
+	while (!init_done) {
+		msg_len = sizeof(magic);
+		do {
+			rc = read_message_from_vsock(hw->vf_req_sock, &magic, &msg_len,
+						     NULL, NULL, NULL, NULL);
+			if (rc == -EINTR)
+				schedule();
+		} while (rc == -EINTR);
+		if (rc < 0) {
+			cxidev_err(&hw->cdev, "error receiving magic from PF: %d", rc);
+			init_done = true;
+			break;
+		} else if (rc == 0) {
+			cxidev_err(&hw->cdev, "PF closed connection during handshake");
+			rc = -ENOTCONN;
+			init_done = true;
+			break;
+		}
+		switch (magic) {
+		case CXI_SRIOV_MAGIC1:
+			rc = wait_for_completion_timeout(&hw->pf_to_vf_comp,
+							 CXI_SRIOV_VF_TIMEOUT);
+			if (rc == 0) {
+				cxidev_err(&hw->cdev, "timed out waiting for irq from pf");
+				rc = -ETIMEDOUT;
+				init_done = true;
+				break;
+			}
+			magic = CXI_SRIOV_MAGIC1 + seq;
+			msg_len = sizeof(magic);
+			rc = write_message_to_vsock(hw->vf_req_sock, &magic,
+						    msg_len, 0, 0);
+			if (rc < 0) {
+				cxidev_err(&hw->cdev, "error sending magic to PF: %d", rc);
+				init_done = true;
+				break;
+			}
+			seq += 1;
+			break;
+		case CXI_SRIOV_MAGIC2:
+			init_done = true;
+			break;
+		default:
+			cxidev_err(&hw->cdev, "got unexpected magic from PF: %x", magic);
+			rc = -EINVAL;
+			init_done = true;
+			break;
+		}
+	}
+
+	if (rc < 0)
+		goto shutdown_vf_sock;
+
+	/* Handshake successful, now retrieve token and connect notification socket */
+	rc = cxi_send_msg_to_pf(&hw->cdev, &token_cmd, sizeof(token_cmd),
+				&token_resp, &resp_len);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "failed to get token from PF: %d", rc);
+		goto shutdown_vf_sock;
+	}
+
+	rc = sock_create_kern(&init_net, PF_VSOCK, SOCK_STREAM, 0,
+			      &hw->vf_notif_sock);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "vf notif socket create failed: %d", rc);
+		goto shutdown_vf_sock;
+	}
+
+	hw->vf_notif_sock->sk->sk_rcvtimeo = CXI_SRIOV_VF_TIMEOUT;
+
+	addr.svm_port = CXI_SRIOV_VSOCK_NOTIF_PORT;
+	rc = kernel_connect(hw->vf_notif_sock, (struct sockaddr_unsized *)&addr,
+			    sizeof(addr), 0);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "vf notif socket connect failed: %d", rc);
+		goto release_notif_sock;
+	}
+
+	/* Send token to identify this VF */
+	rc = write_message_to_vsock(hw->vf_notif_sock, &token_resp.token,
+				    sizeof(token_resp.token), 0, 0);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "failed to send token to PF: %d", rc);
+		goto shutdown_notif_sock;
+	}
+
+	/* Start notification handler thread */
+	hw->vf_notif_handler = kthread_run(vf_notif_handler, hw, "cxi_vf_notif");
+	if (IS_ERR(hw->vf_notif_handler)) {
+		cxidev_err(&hw->cdev, "failed to start notification handler");
+		rc = PTR_ERR(hw->vf_notif_handler);
+		hw->vf_notif_handler = NULL;
+		goto shutdown_notif_sock;
+	}
+
+	return 0;
+
+shutdown_notif_sock:
+	kernel_sock_shutdown(hw->vf_notif_sock, SHUT_RDWR);
+release_notif_sock:
+	sock_release(hw->vf_notif_sock);
+	hw->vf_notif_sock = NULL;
+shutdown_vf_sock:
+	kernel_sock_shutdown(hw->vf_req_sock, SHUT_RDWR);
+release_vf_sock:
+	sock_release(hw->vf_req_sock);
+	hw->vf_req_sock = NULL;
+free_irq:
+	free_irq(hw->pf_vf_vec, hw);
+	return rc;
+}
+
+void cass_vf_fini(struct cass_dev *hw)
+{
+	if (!hw->with_vf_support)
+		return;
+
+	free_irq(hw->pf_vf_vec, hw);
+
+	if (hw->vf_notif_handler) {
+		kthread_stop(hw->vf_notif_handler);
+		hw->vf_notif_handler = NULL;
+	}
+
+	mutex_lock(&hw->vf_cmd_lock);
+	if (hw->vf_req_sock) {
+		kernel_sock_shutdown(hw->vf_req_sock, SHUT_RDWR);
+		sock_release(hw->vf_req_sock);
+		hw->vf_req_sock = NULL;
+	}
+	mutex_unlock(&hw->vf_cmd_lock);
+
+	if (hw->vf_notif_sock) {
+		kernel_sock_shutdown(hw->vf_notif_sock, SHUT_RDWR);
+		sock_release(hw->vf_notif_sock);
+		hw->vf_notif_sock = NULL;
+	}
+}
+
+/**
+ * cxi_vsock_send() - Send a vsock message using a provided socket
+ *
+ * @cdev: the device
+ * @sock: connected vsock socket
+ * @req: message data
+ * @req_len: length of message
+ * @rsp: buffer for response
+ * @rsp_len: length of response buffer (updated to reflect response length)
+ * @seq: sequence number to include in message header and expect in response
+ */
+
+static int cxi_vsock_send(struct cxi_dev *cdev, struct socket *sock, const void *req,
+			  size_t req_len, void *rsp, size_t *rsp_len, int seq)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int rc;
+	int msg_rc;
+	int rsp_seq;
+
+	if (req_len > MAX_VFMSG_SIZE)
+		return -EINVAL;
+
+	if (!sock)
+		return -ENOTCONN;
+
+	rc = write_message_to_vsock(sock, req, req_len, 0, seq);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "error sending vsock message: %d", rc);
+		return -EPROTO;
+	}
+	rc = read_message_from_vsock(sock, rsp, rsp_len, &msg_rc,
+				     NULL, NULL, &rsp_seq);
+	if (rc == -EAGAIN) {
+		kernel_sock_shutdown(sock, SHUT_RDWR);
+		cxidev_err(&hw->cdev, "vsock response timed out\n");
+		return -ETIMEDOUT;
+	} else if (rc <= 0) {
+		kernel_sock_shutdown(sock, SHUT_RDWR);
+		cxidev_err(&hw->cdev, "error reading vsock response: %d", rc);
+		return -EPROTO;
+	}
+
+	if (rsp_seq != seq) {
+		kernel_sock_shutdown(sock, SHUT_RDWR);
+		cxidev_err(&hw->cdev, "expected response seq %d but got %d",
+			   seq, rsp_seq);
+		return -EPROTO;
+	}
+
+	return msg_rc;
+}
+
+/**
+ * cxi_send_msg_to_pf() - Send a message from VF to PF
+ *
+ * @cdev: the device
+ * @req: message data
+ * @req_len: length of message
+ * @rsp: buffer for response from PF
+ * @rsp_len: length of response buffer (updated to reflect response length)
+ */
+int cxi_send_msg_to_pf(struct cxi_dev *cdev, const void *req,
+		       size_t req_len, void *rsp, size_t *rsp_len)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int rc;
+
+	if (cdev->is_physfn)
+		return -EINVAL;
+
+	cxidev_dbg(&hw->cdev, "Sending %ld bytes to PF", req_len);
+
+	mutex_lock(&hw->vf_cmd_lock);
+	rc = cxi_vsock_send(cdev, hw->vf_req_sock, req, req_len, rsp, rsp_len,
+			    hw->vf_cmd_seq++);
+	mutex_unlock(&hw->vf_cmd_lock);
+
+	cxidev_dbg(&hw->cdev, "Got %ld byte reply from PF, rc=%d",
+		   rsp_len ? *rsp_len : 0, rc);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_send_msg_to_pf);
+
+/**
+ * cxi_send_msg_to_vf() - Send a message from PF to a specific VF
+ *
+ * @cdev: the device
+ * @vf_num: VF index to send the message to
+ * @req: message data
+ * @req_len: length of message
+ * @rsp: buffer for response from VF
+ * @rsp_len: length of response buffer (updated to reflect response length)
+ */
+int cxi_send_msg_to_vf(struct cxi_dev *cdev, int vf_num, const void *req,
+		       size_t req_len, void *rsp, size_t *rsp_len)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int rc;
+
+	if (!cdev->is_physfn)
+		return -EINVAL;
+
+	if (vf_num < 0 || vf_num >= hw->num_vfs)
+		return -EINVAL;
+
+	cxidev_dbg(&hw->cdev, "Sending %ld bytes to VF %d", req_len, vf_num);
+
+	mutex_lock(&hw->vfs[vf_num].notif_lock);
+	rc = cxi_vsock_send(cdev, hw->vfs[vf_num].notif_sock,
+			    req, req_len, rsp, rsp_len,
+			    hw->vfs[vf_num].notif_seq++);
+	mutex_unlock(&hw->vfs[vf_num].notif_lock);
+
+	cxidev_dbg(&hw->cdev, "Got %ld byte reply from VF %d, rc=%d",
+		   rsp_len ? *rsp_len : 0, vf_num, rc);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_send_msg_to_vf);
+
+/**
+ * cxi_register_msg_relay() - Register a VF to PF message handler
+ *
+ * The user driver, when inserting a new PF device, is registering a
+ * callback to receive messages from VFs.
+ *
+ * @cdev: the device
+ * @msg_relay: the message handler
+ * @msg_relay_data: opaque pointer to give when caller the handler
+ */
+int cxi_register_msg_relay(struct cxi_dev *cdev, cxi_msg_relay_t msg_relay,
+			   void *msg_relay_data)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int rc;
+
+	if (!cdev->is_physfn)
+		return -EINVAL;
+
+	mutex_lock(&hw->msg_relay_lock);
+
+	if (hw->msg_relay) {
+		rc = -EINVAL;
+	} else {
+		hw->msg_relay = msg_relay;
+		hw->msg_relay_data = msg_relay_data;
+		rc = 0;
+	}
+
+	mutex_unlock(&hw->msg_relay_lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_register_msg_relay);
+
+int cxi_unregister_msg_relay(struct cxi_dev *cdev)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int rc;
+
+	mutex_lock(&hw->msg_relay_lock);
+
+	if (!hw->msg_relay) {
+		rc = -EINVAL;
+	} else {
+		hw->msg_relay = NULL;
+		hw->msg_relay_data = NULL;
+		rc = 0;
+	}
+
+	mutex_unlock(&hw->msg_relay_lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_unregister_msg_relay);
+
+int cass_vf_get_token(struct cxi_dev *cdev, int vf_idx, unsigned int *token)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return -EOPNOTSUPP;
+
+	if (vf_idx < 0 || vf_idx >= hw->num_vfs)
+		return -EINVAL;
+
+	*token = hw->vfs[vf_idx].token;
+	return 0;
+}
+EXPORT_SYMBOL(cass_vf_get_token);
+
+#endif /* CXI_DISABLE_SRIOV */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_vf.c b/drivers/net/ethernet/hpe/ss1/cass_vf.c
new file mode 100644
index 000000000000..fde40d1b491a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_vf.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/dma-mapping.h>
+#include "cass_core.h"
+#include "cass_vf.h"
+
+/* Compile-time assertions to ensure VF structures can be safely cast to their
+ * corresponding PF structures and vice versa.
+ * These verify that the common fields are at the same offsets in both structures.
+ */
+static inline void __cxi_vf_structure_offset_checks(void)
+{
+	/* Ensure cxi_lni_priv_vf can be cast to cxi_lni_priv */
+	BUILD_BUG_ON(offsetof(struct cxi_lni_priv_vf, dev) !=
+		     offsetof(struct cxi_lni_priv, dev));
+	BUILD_BUG_ON(offsetof(struct cxi_lni_priv_vf, lni) !=
+		     offsetof(struct cxi_lni_priv, lni));
+
+	/* Ensure cxi_domain_priv_vf can be cast to cxi_domain_priv */
+	BUILD_BUG_ON(offsetof(struct cxi_domain_priv_vf, domain) !=
+		     offsetof(struct cxi_domain_priv, domain));
+	BUILD_BUG_ON(offsetof(struct cxi_domain_priv_vf, lni_priv) !=
+		     offsetof(struct cxi_domain_priv, lni_priv));
+
+	/* Ensure cxi_cp_priv_vf can be cast to cxi_cp_priv */
+	BUILD_BUG_ON(offsetof(struct cxi_cp_priv_vf, dev) !=
+		     offsetof(struct cxi_cp_priv, dev));
+	BUILD_BUG_ON(offsetof(struct cxi_cp_priv_vf, cp) !=
+		     offsetof(struct cxi_cp_priv, cp));
+
+	/* Ensure cxi_cq_priv_vf can be cast to cxi_cq_priv */
+	BUILD_BUG_ON(offsetof(struct cxi_cq_priv_vf, lni_priv) !=
+		     offsetof(struct cxi_cq_priv, lni_priv));
+	BUILD_BUG_ON(offsetof(struct cxi_cq_priv_vf, cass_cq) !=
+		     offsetof(struct cxi_cq_priv, cass_cq));
+	BUILD_BUG_ON(offsetof(struct cxi_cq_priv_vf, pages) !=
+		     offsetof(struct cxi_cq_priv, pages));
+	BUILD_BUG_ON(offsetof(struct cxi_cq_priv_vf, cq_mmio) !=
+		     offsetof(struct cxi_cq_priv, cq_mmio));
+	BUILD_BUG_ON(offsetof(struct cxi_cq_priv_vf, flags) !=
+		     offsetof(struct cxi_cq_priv, flags));
+
+	/* Ensure cxi_md_priv_vf can be cast to cxi_md_priv */
+	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, lni_priv) !=
+		     offsetof(struct cxi_md_priv, lni_priv));
+	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, device) !=
+		     offsetof(struct cxi_md_priv, device));
+	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, md) !=
+		     offsetof(struct cxi_md_priv, md));
+	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, sgt) !=
+		     offsetof(struct cxi_md_priv, sgt));
+	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, pages) !=
+		     offsetof(struct cxi_md_priv, pages));
+	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, flags) !=
+		     offsetof(struct cxi_md_priv, flags));
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_vf_notif.c b/drivers/net/ethernet/hpe/ss1/cass_vf_notif.c
new file mode 100644
index 000000000000..c46e19869873
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_vf_notif.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+
+#include "cass_core.h"
+#include "cxi_core.h"
+#include "cass_vf_notif.h"
+
+#if !defined(CXI_DISABLE_SRIOV)
+
+static int cass_vf_notif_ping_handler(struct cass_dev *hw,
+				      const void *cmd_in, void *resp,
+				      size_t *resp_len)
+{
+	return 0;
+}
+
+static const struct cass_vf_notif_info vf_notif_info[] = {
+	[CASS_VF_NOTIF_OP_PING] = {
+		.req_size   = sizeof(struct cass_vf_notif_ping),
+		.name       = "PING",
+		.handler    = cass_vf_notif_ping_handler, },
+};
+
+int dispatch_vf_notif(struct cass_dev *hw, const void *req, size_t req_len,
+		      void *rsp, size_t *rsp_len)
+{
+	const struct cass_vf_notif_common *common_req = req;
+	enum cass_vf_notif_ops op;
+	const struct cass_vf_notif_info *info;
+
+	op = common_req->op;
+	if (op <= CASS_VF_NOTIF_OP_INVALID || op >= CASS_VF_NOTIF_OP_MAX)
+		return -EINVAL;
+
+	info = &vf_notif_info[op];
+	if (!info->handler)
+		return -EOPNOTSUPP;
+
+	if (req_len != info->req_size)
+		return -EINVAL;
+
+	cxidev_dbg(&hw->cdev, "VF notification received: %s\n", info->name);
+
+	return info->handler(hw, req, rsp, rsp_len);
+}
+
+#endif /* CXI_DISABLE_SRIOV */

-- 
2.56.0

