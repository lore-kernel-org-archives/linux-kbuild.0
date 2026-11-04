Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808242;
	b=VVS3pQfwMxMJrZJeKDoTdwwS+Jm9VHgO8Qgsq7HkC65U9KCUC06lwodo6JK/DYCDcLgD
	 2Xu95YGvaBFK7AU85BAHfvPL5+ae/RU+0Di3takwa7fBVcww+JtDWNZMu+kVcUTGeH0cD
	 8DaDZGuDkPdbrZHzwWK1JhLiUBTTd9xlEIMfGu450J5oACjnWyBBmoDI4KGF0ktJS70QO
	 tqyT8TaWtzHUzkTSqjhbMWAeljQtxqBf+zZ63/1hx2y24CQ+xITuQfqgr10TafboUgOYJ
	 unX83PpUI5bDv9761ter4LigjFs5i3r53z7k32qS6caELUTWDwfqLLLOK7fAmKx8RNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:CC:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-HPE-SCL:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fy3LRc6E9lYHtY2aS3bJmEkqDu7mKrcbDcUqA5Um9Z8=;
	b=M/kMN3gdcPbbM3C6a2afOdAeUgX0xsGzJroUd2OoGc3R+IdvTohKMJJIwe1Mj/ca9APO
	 7kkkR3wHBOz84X54b4CQgiZsYYAuS409bhiRNm1FrOodWMM6fiEkd2d4WLM8SXLuRjuFb
	 8MVbFYf1vpk1+pTio3lLmjHwDV2/kbReI/e0U3yCmK6bNywkvxCuEL9GORmwvjd9bFgis
	 f3rFF2p7omcFRcPH7bT8DMBbwuFK8oWJmO7d//v1I2t3mf+9UtCLGuy/QCfzcKTWiQnZ9
	 IGwobSSAkogNjzGq6VidAH1xq7aWELghETyj6tKx9wRS9Fv51YTCrknUAGAZ+8NNT8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b="hcC/4q2k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DA606A31B;
	Wed,  4 Nov 2026 16:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 497DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=hcC/4q2k
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjvWI1875262;
	Wed, 4 Nov 2026 16:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=fy3LRc6E9lYHtY2aS3bJmEkqDu
	7mKrcbDcUqA5Um9Z8=; b=hcC/4q2kba6Qtwtzuq/L2vOb2FpT4U010IJCePUv4f
	vYjrDqY84GJRq8RdubiASdbNywNG/k8XLKsWmY77XnBGUTE3AbgiY00GOzDU5i8W
	MzvRVQor6OJw/o6434oSkpxGnhEfXDNL6zw7GNOW26ZkJZWfZdBu7t508Mofyvw3
	WClvnnfF7bvSoX23qqSobKTN9zj7AHJ+7gYWoWlrhBj01SdV+Bpmn0Fq97GjbicY
	iBEt+7FxVDKOw+N9x/yHcTYrzFdccJQx976HwvSlxFakAseXdV40kSPqLxyzygao
	TjwXHIARDZHI5XqSzetFcG7QiBy0xcexO6xI0lqWnCiQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4hr381477m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:03:32 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 15974800EFF;
	Wed,  4 Nov 2026 16:03:32 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 4 Nov 2026 04:03:31 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 4 Nov 2026 04:03:26 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 4 Nov 2026 04:03:26 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 4 Nov
 2026 16:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtnADEnZnlrdqS86jTKarirpyylQUzw4X9XyYQ2UGgIorZ3bZIohseoq2snfev5D73M3o1I8v1IhU/ApIPa5xavpetLFk+xLnGaRJIpwK3dY9MYTcZey67rqbCAU/vZ+PQ+Lw15KCq/PWbt9lyriwdPpFowsxUJJnwUO6RcTR5zsPo3Qog/UJlIFTz6om1boDK7NtAblRGWrmam6wvq4w80HpNcKk659S9rnsg0qBCCJVeg3h838PVENd87BRWKWrt49tlvNd6IyT8SJfhLPKL9+6XMhpRPXYzXLuiPPlnPhgGj4heHsHJZEjnMhM2C4hs1/scv+aggR2rs6VWOdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy3LRc6E9lYHtY2aS3bJmEkqDu7mKrcbDcUqA5Um9Z8=;
 b=MPGZxmGlubeLTOp2MI/kppiBxcsqjEupPE5xJr9jSDtyTUGsF+rdoYPgc2vjmL5Vg1XFoLCIQDeJ2N3zCy0ngb13aLcOF8b8Nqmgpx90bMF3tfrSb11k65wEkIggYhlVN2CSX1BMS+755k6rySgSxRxHtkE9Pf0d0e/b0SYgb0KiCAzq2DZDwT1Nm3OKSm1diwSSAvn9asOnQHuOZpJVU3ZASRJeChOK607xdOQ/eb9IUuYkzCXtUjll1alqjf7Kb/QrUxZS3LlKfdHgIFRynoiTF87mkHNyrsnDBNWryB8zTG+9YLo8pyiQ5jRZFBT+yX6KRi++wwRU7ntMqcEx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by DS0PR84MB3418.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 16:03:24 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 16:03:24 +0000
Message-ID: <e9f446e4-665e-4eb3-9507-a60e9b3bb9cd@hpe.com>
Date: Wed, 4 Nov 2026 08:03:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        "Slingshot
 Open Source Team" <slingshot-os-team@groups.ext.hpe.com>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Guenter Roeck
	<linux@roeck-us.net>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        Sandeep Bhoot
	<sandeep.bhoot@hpe.com>,
        Iraimani P <iraimani.pavadai@hpe.com>,
        "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>,
        Leon Romanovsky <leon@kernel.org>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
 <20261104133938.GP3889730@ziepe.ca>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <20261104133938.GP3889730@ziepe.ca>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VPCoK90z8uWTh9FHeou7PNpk"
X-ClientProxiedBy: CY8PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:930:4a::17) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|DS0PR84MB3418:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca32e39-dca7-4936-e43b-08df3a8d279f
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|4143699003|5023799004|56012099006|261021121427099003|261021135927099003|261009223027099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261022075727099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: irBNvs3qZAnt40ceU7Iv9+Bei8rC/YNoS7PcFX21i46mFQyolxnUOgQQYAebf+Fit2SQrGX6aW0DhVGWnpbkEYf0/Yj/SR9t0U2dbOLuk34ZSj76VJD0Euvg7ClBvi+OTNDj4oPAlsTYobkIDuhzlR1F3CK71Ssz2rwq1TyGNLqtA7caLIS0g+jQ6FJvzirysB0DtuO74PEBoTJFq8RhTG40B0P5a/fS4dZ8hCN3anw6Uy9Q00+TwpgpiMWUwPodY/NzCl7DRWrCPWuLcL5T4NfWLYN66mGrHQ9VwdFWtidWBlQHLj7kob+31n9KSosrAPipSs7T9UmLpvyCDa5dSQusnM/cikP2fo6xE0F01h1nh4xQ+jmiDhSymXqLM3Z0v08m6ZzI7q41rsyvvw7yfTrncCLnPYAubGHlCpdu2n+tXXbl38j6BjXsbNvVnJcXcpIijC3S0bQlPxPIYCArXImecAAgYAsS/gqmDbq8ThadFVE1N440QGk6gAVnq/QwPwHZtArxhBK/GYCMIttCpH7naETGmPP7kpesRDcXELAGeBYZ7WR0PO47ascLq5/0wHuW44cBEDOpoeqZnYjii3rmSOpJbWiZnhWJzDXOoo4D9EhOPSBMJkY1+sm9iKvfbkJSlXAy3ZEzoiPmgnkbOP3MmEQDY1gpX1UgVa0OwHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(4143699003)(5023799004)(56012099006)(261021121427099003)(261021135927099003)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261022075727099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRkSGhTMTgzODNTWUs3WnRIalhRM2N5OHp0cGxSb0I4NUd5d0ZJQVBOMFJI?=
 =?utf-8?B?RkRWOE9xcU5tYWc2NUdwdnh2QklSbFk3R3hoc2I5aVdYd1RnR0VOYy80QWVy?=
 =?utf-8?B?SWlvd21JMDM3dmxYejlCSG8vTlFjc1VMZjU1MzZ0MW0ycHBCckRrRWZRbmhZ?=
 =?utf-8?B?eFFkaHgzSUZRd1dQbTdrMG5nMnFJZTYwQXlBVlRKOXJubElyU1hkMUxqbWNC?=
 =?utf-8?B?RlVrMDEyMlBUcmFGOE9jeU1iTkFXdlZ3RnR4S1hLS0VabFdzM2JUTnd4OEZQ?=
 =?utf-8?B?VERWanQ3VUpvOHZuUHpTS040azJORVpzQ04rZ0wxSTVPRVFaSGdlZUZKUGdu?=
 =?utf-8?B?bGYya1dVQkoyZ1hmK2FZY1JpUVlUenpMVmZLdUJmYVdrV1hvbmRvWVNFeXg4?=
 =?utf-8?B?eG9GZStyeWFraUNLOEd6d2FFSXVZMkdyNzVJOGxkbWJuRWRneUpzZ0tJMlZv?=
 =?utf-8?B?ZVhvTlh0THhWOEZWS3lTR29xSDhqNHc5QzM3SUNtUEVIUGFHbHRhV3grMktY?=
 =?utf-8?B?aE5zcVNSQnZFTDlWMzlTeEt3Q0hoalBLN1RGZE5oaENEelJLMUE1UzNzS0Vq?=
 =?utf-8?B?Tks4TWk0SndjOGt6RWRrVXJsNm9RUTBNUFZZTDJRSVp0Mk5kQ1VBOTByVE92?=
 =?utf-8?B?NHZMZGp5Wlpiek8xQytGMjNuZEhpVkdWZkp4bVNTT3VwZUFoY25CQmVyK2ds?=
 =?utf-8?B?UTZGdTVTdXVKeVdmSU9XdTErRnZ6OUZLNWdoY3pKZVRoTGYzWkZNdFJoWVNT?=
 =?utf-8?B?TXVEZ0wrM2ljT2pidFl1aWR5QW9Layt5b01MNDUrcjdoc2dPZHprYXpmUjlY?=
 =?utf-8?B?QTAyTitxekw2L1dFd0hJWXdBSVZHNXdkLzNaZ0ZsNldsdEVjUzVXR2tCZktt?=
 =?utf-8?B?Y3Q2OVZBYndKRXltc1hNZlEvUW84RjY4MnFMUEljQkROWEw5TjBxL1o2YkNh?=
 =?utf-8?B?WldjWGF2SkZEdVRrcUV6VExFallMWWl5RTJsUlJRbGpIZG5ETWJBRjN4cmxU?=
 =?utf-8?B?YllGZWtySWUyUHgzZTB4cjNBL0UwNmZsQUx2K1YraWFWNWY2RVpkd3NmWmsz?=
 =?utf-8?B?K1BZS0M0RWFwUVVGWXBRV0xhcVFhTUZYU0ZyZnV3RG1CL1RPUzdQVkhBcE5G?=
 =?utf-8?B?ZSt3Wkp4OWRXVmtscHRWaUF5R0VoNjNEK29wOXV0M0pKaEVLL3VmRUVoVHJ0?=
 =?utf-8?B?b09mS0E2dnlyOVhiU0JqaEc3SnExVlRpN1RXcmUvOVVKM2JENjhEMzN6VnFp?=
 =?utf-8?B?Wkp0S1hMYks0TjArUkJBZGsxYTExTDRQMlFuVjdQaWdlL3RoYksvQVo1eUV5?=
 =?utf-8?B?NklrNDBHdml2MjdGSGNJRnVOdURDTXpUNm1Bb0NVanJIaXFwTTdwTHg0NlRT?=
 =?utf-8?B?Q2VQNUJ6cnBxS0lVb2xpZDEvekJJSWNqV25JUjg4UTV2WTFKc0Faa3lUS0xP?=
 =?utf-8?B?M0M4RDJad01VY3RESjJSNHllbU9qcFJ1UFBQMk1FUUdYT002Y1dIbUpjUEpE?=
 =?utf-8?B?Vk8zS0V4ODI1K3VYbnQ3aXlIVG5SencwNytmck9IVERnODMwSGpyMmVleGVO?=
 =?utf-8?B?RDlEQjdpaS9PVGc0a1ZzdnBVckxQL0JMQXlUMGVBV3ZQVU8zZ0oyRkg0azVt?=
 =?utf-8?B?eDBvYmd2MTVYWVhmYmY1L2ZMMGlZZTJkU0ZUa2h0RUFoeVdPZ29aTFRoSXJS?=
 =?utf-8?B?SzVNdEIxRXFneFVIblp5VTltdnBGbkFPcUNsem5hTFlLTC9YWWpPcVpGRWJp?=
 =?utf-8?B?VFJkWTY1SnhYcU1NdWcvOWpVRjB3MjhkUkJ6RzF3bWRsWk5HYXp6ZjhkMk9R?=
 =?utf-8?B?SndSN3hCYzJyY3FENkpvVDcrVXQ2bnh5MnRvQ2dJVHVSblNTaHBTQmt3QWJX?=
 =?utf-8?B?WDdJWWZ4cTNFWGxNRlFkUk5kcllOdkhpUkcwRlJhdkJTeUpFK1lQU0VCbEpa?=
 =?utf-8?B?RnM0N2k5MGhQM0xDZm1UQTdYSmJyTnAxY0YrZGovM2liU0dWMEdtNVdxUHls?=
 =?utf-8?B?dENmclNjUVI0TWFBZnY1ODd0SEFIT1FPTnJpWXdEZUlRdTZCd1Z4dDM1NEl6?=
 =?utf-8?B?YlBIZTgwQWdqQmt5Q3FJazlmVHJvZy90dmF2RWlaOXAvUzdzTFFwR2xva0JO?=
 =?utf-8?B?enVhRjArUE9RWmI1dGZSek5UekQ0Q2V5SFBGOU0weXZBSW9ycWg4MHZCTTE1?=
 =?utf-8?B?UTFPRFBuMzZDRk1haUdrMHZ1cGhwbi9GSE1YeC9sN1E3NHg0WmhpL21PdlZL?=
 =?utf-8?B?NmNNMjFJaVZ0d29ha0hYOFJXWllkOEpkN2FoV05IdVlsZ0x4Z05Bd3hiSFl2?=
 =?utf-8?B?TkRhMzkyb1U0QU52RWc3QzhzZVhiWEduS1cyY1JtSHB2aXVlcWZwUT09?=
X-Exchange-RoutingPolicyChecked: Hq53iObyRNVt3uHYyjDuYmi8wQ2lTV0xOq3Xz97vo8Y01qfwpoR3hRaHncLRrvz/5MQz8q2FYXkCBkl7m+/EUNimF7Hnw9vFT8qlIHtX9BjyKpV8cg1rbqWEUpCZxZacrcHqMY2xJl8WK/SGW2kcsS/RY9lSUMHVYQynJ9lVPDjOE9ORenCJ6vwEzta4M/w1qCw88f1y8cfxBt/JEZeVyRGJ7H3GmP8laaeFYUX5nFDVUuQuNAMBZUMOvEgqNQPcdmmVg3/be1OohvP0fy9ZJ7+cM6qjMM28p45168DdfoPBKGwx8Q0QI35lJKGUByils0UvJS1xnZ9PXoqJwapkQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca32e39-dca7-4936-e43b-08df3a8d279f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:03:24.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ7n+Ho17IDUdZ1/BMc3lIX/zMq/BiWqn3AfiIOgJIUQETrYpZhvOaagypI8UC3ZoCz3zKaKemhHhEo30E1nFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3418
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=Vexir1p9 c=1 sm=1 tr=0 ts=6aeb5754 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=MvuuwTCpAAAA:8 a=jVuFBR1eL88z1vzVjrAA:9 a=QEXdDO2ut3YA:10
 a=8Vrha7d0SC6zxrckoCoA:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX4wbdfmED02xK
 t/WJOrWz+6DkEyNGpKlJCG8C8d8M8IlHAPicj/5pLIc5gE/7VX25RvASVuql2Cmwcbu3n2XtKkG
 2a0yJCkR/tSXIXucSaw8AH3ChcqdDSI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX1ibce/QKAn5K
 w0NJiloAnhdGK7qHkwzZLgdClb+IICbmLCy3bQ+FP2+HFD2euvf+M5Ze93acY948JrXHBgUVCTl
 SBdKh1Bc3DofQ6A0wPc8ltD8M9j1BkWrdaWWKsOh6PONCQ9+0xo2pHRcfhEFnc3TYws//97oqX0
 0SRsYC5znmYWBVuRW8b0LHGwpR3vVrzDtrq8Q47PpmnJ80ifs9ZweUzNCSsje9LvPWdZIzYogyo
 YeaxxAW1L5Z7UNhN2+tyXThD/rnPqULFInMrMxy6+IERjnfqKA3s6y6fkcOhobEssgHo3gzbxZJ
 oiLn2aVFgshUmB58mKpJzG0QGHkwPDftiswlu8IR8dIhvEXJhVp8B4DDUfYjZvloes6gPrPHGB+
 zZfix1b4stiW/XC1R2Vkk3cTUkpX9DOZQn/BVmFCSK4EoPqNBEGtC7nfLnkBROzGzDdbMv3g8sZ
 QK4Q2p24R5nJ7UYlH6Q==
X-Proofpoint-GUID: yGbtP0hHL2FSRJNXf_JyxPUTCrnE6oZR
X-Proofpoint-ORIG-GUID: yGbtP0hHL2FSRJNXf_JyxPUTCrnE6oZR
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040063

--------------VPCoK90z8uWTh9FHeou7PNpk
Content-Type: multipart/mixed; boundary="------------erFmylyvWfgRzMGG5rbeTH0Z";
 protected-headers="v1"; hp="clear"
Message-ID: <e9f446e4-665e-4eb3-9507-a60e9b3bb9cd@hpe.com>
Date: Wed, 4 Nov 2026 08:03:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Sandeep Bhoot <sandeep.bhoot@hpe.com>, Iraimani P
 <iraimani.pavadai@hpe.com>, Mamila Santosh <santosh-kumar.mamila@hpe.com>,
 Leon Romanovsky <leon@kernel.org>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
 <20261104133938.GP3889730@ziepe.ca>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <20261104133938.GP3889730@ziepe.ca>

--------------erFmylyvWfgRzMGG5rbeTH0Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/4/26 5:39 AM, Jason Gunthorpe wrote:
> On Tue, Nov 03, 2026 at 08:21:05PM -0800, Doug Ledford wrote:
>> Top-posting an executive summary: HPE's ask is whether we should submi=
t
>> this driver through the netdev community or the rdma community. HPE
>> prefers netdev, with RDMA as an aux driver, but needs the maintainers=E2=
=80=99
>> call. A minimal Ethernet driver is about 48k lines plus 36k lines of
>> mostly machine-generated headers (details below).
>=20
> It depends on a simple question: can you create a functional ultra
> ethernet device without a netdev and without an IP or routing table?
> Like IB?
>=20
> If yes then maybe you could do RDMA first.
>=20
> If no, then you must get a netdev first.
>=20
> Jason

That's tricky to answer.  Can you create portals table entries for
Slingshot and ignore IP, yes.  But, you also normally connect to a
fabric manager over an IP socket in order to get your NID (similar to
IB's LID) and that's what you then use for RDMA traffic.  But the NID
can also be derived from the MAC address.  So, it can go either way.

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------erFmylyvWfgRzMGG5rbeTH0Z--

--------------VPCoK90z8uWTh9FHeou7PNpk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmrrV0gFAwAAAAAACgkQuCajMw5XL915
LA/8Drat0FkxPCgXJNIpNUTOlZQIG2QTwhaBnWU0ue6JKvDHVgnEmH08qyYmNdIAELPJY+KjySNo
JR9/1DxCinn5rGkDxyzOiX7AvSY9bcp0cHHE0bbzeGbF86yps3JXnrAkzC+5NrxzYOIGsZfc4Muf
jUBQNLTFasEHNfakPutKqeTZO1u+He6L37vL7J4vzNgRMSUqB3yBzagsGZEEz3Rd2Q3kMm0tJpgj
eWpKxpEiYl+OJ8RUpIe10zS+TY3oVVwcej2KyNa8qQxxXgwuZUy9ksm55885zyhErZTrzX6iOjJA
aWK6dDMPAOpsuxdII9hvZY/4hxnnc1zpiQQeUrXdYhw9A4P0npmbs5CiVe2QpoWn899kOdGBbdze
ydYNQjYtHQ1Od9h45DrJ7mH3ukBXerDUcDcPAbu4hlk1TaTL8NX1g/raZzgyLItPNuzAHs241XN/
+JNVKerbSS0h+kd1RfgLIyYB98WtXF9FyuG6DICjQgF45x9vyGyDx0W79/Al5uOPk+NtT8xKYe8Z
lETJoyJN837JKrQEH2QHc0ghVsiQahyNEWcjjHx7DWO5or2csAYpgdDC2KKlHI54lNOA/AjyXYYi
qNMPjmrjRX5hCoitJdUJpjq+W2WX+HupHBs1PPRoBkJQryaZG6qrEasF/MpkgoZeB91HzYqLtBnO
VG4=
=9Ev2
-----END PGP SIGNATURE-----

--------------VPCoK90z8uWTh9FHeou7PNpk--
