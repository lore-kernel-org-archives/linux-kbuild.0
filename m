Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793766120;
	b=u3/0iO8cNniYsL3wDKey+i/sgzaKGSgundZisFER4ZDZVk9pukxy7WhlUZSK78xnUQFQ
	 vaGFa6Y4zwQJtq0eKPwwYMkc7o12JQzWoPg3CIL6VGBltl4n6UTJxFpiw9WCMJdvfVswc
	 Fd3uBSTxqNxYpNMMadVkRrvWGz0V/tHKFssbxAV60l6pp3xEz39JZr9TjnhHSz6X5vrHW
	 ASkKUVsrP6K0k/Jbg86QFUNVUqksC2wiZHXTb+K9QEkgA1zeMEYFYj+SoR9Bk0NFbbEq5
	 y/A2IrKBgiFifAxKZlUGXUnq03An6WV2v1hCGoicjsr4NwIgCzTqhSYSXYuWdTBMM2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:Organization:
	 In-Reply-To:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ut8oeHue9HZsyYS8X/wMV6DYaNAWhKusQTpxvVCoFzs=;
	b=EO4YtxsQZemczuywD11AyNhIsnQYLN4oZG5LuPgYYuULebXTTSotasjks0PMp7gbSIw5
	 82pYNBVLyT5C7iKhJzm4YMx1InmzM2pshp3M4RIDsTPVumsaFg+iqxDC7mET7hbOljPdX
	 yACdleB1kurnvK8dybzbYixz6h8U7ZgjnWGSM3PaJEgY9/EZ/45TalYRofXtKEmkR4PAz
	 3YxsXRn2XW+XB+lORJbiwjH9rcSk7WhAwkKKWM+nEsBhtkkx8WtIHGGWCqoNHaQG2xd3j
	 Ra3d6cg7GElqeUmwpAt1z97P/grF9TltQ+gJIfuFXNqgkTFOen1tMZPwH27x1mfdvqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=YX9nFUZN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848B606A31B;
	Wed,  4 Nov 2026 04:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9848B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=YX9nFUZN
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40e5vZ2697961;
	Wed, 4 Nov 2026 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=Ut8oeHue9HZsyYS8X/wMV6DYaN
	AWhKusQTpxvVCoFzs=; b=YX9nFUZNwvpNCYDlNgYMaNrPvKGUa/Uag0A1u6BNJ5
	tz2QDeucE36OMEYxYGyoFCbh8Xr5Dr0k5Hbv02j8PULqnGzQTZFUrjSide+uHlc5
	ecE+SJz1OHAgt4zj2rbvZn83Su8yUHQnlRj0IKZnjVSMXQl6NoiftSxf+55DXMXE
	cFcNsaiNZIt/wXy9H1hzuH2Qd7BAoke2gOj+31T/njKgnkYtqjNnTYMnDrhAfpl7
	iLpNkgHIluQNw6jvP6mEZlauILGw9kavkr+MI+PMcMFx++e2+lfVt+SQpsMa89TZ
	cnoovbifSmgcj2o5Ok854ujPSnSv9KIzoDgxyM6sgURQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hqtc825y5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 04:21:34 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id EEB9683FB0C;
	Wed,  4 Nov 2026 04:21:32 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 3 Nov 2026 16:21:17 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 3 Nov 2026 16:21:17 -1200
Received: from PH0PR07CU006.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 3 Nov
 2026 16:21:13 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7FvEaqhDUBQMsllQlM/hg/ROD/4Ibzpg6LDs432LS/2GprKHxYrYOGbs6QcLBdV1Z+1SUnKFrx15yMmoj1Btqzx/8NUrQesU7apyqJ4WdByMvx75mPGOYGdOv3qwNYzZjxcD6K3gCIdPKyS+cCiiX8zUzFf04yFrmLjViLfMTDKscHfIKBmDImYIO6m7Y+tUv0gJl+TFw3N7yhqPltofOkxcB/4frzFFCgxkODvPakTHXwNx8sfNOchJ+oBU/8AGXSh0VX0SkLytkZX3OcCEZM4kVs8XGmHljbTExzCXpkAh4W/mcfiMrerKEr8WGvwWTNJgWArnjE5mWhxEI59rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut8oeHue9HZsyYS8X/wMV6DYaNAWhKusQTpxvVCoFzs=;
 b=Zbz76kB6Z00HFNA8ctbrYYpW17pAA6oO8bsjcQ409rUu36/RqqzvepK3YHlc/yunM489isdlH3aQESqXw9ofxqe1uqVtTmdAJ7s/LofHdGQYD+wweAQ1/iB+c2eiSbsStN1Yis8aVSDAsJndovm8RPG28MKU5gdPHr64NGbbZLnOkWtTkXCDUzLc/LTWmOAyAgLAtDoXlvxmtPSR02GaIMpsCdBeftmw56p8lPj/lpg2TDdIrmZIge+7VvmeuITE4z52mMqQXpipi1CrU6Wl7LTav8j/q/x2UOrzHPpPoPKvewwBaHwQLijL/NlXxaZXNCHE6sxGE39Wepd1ulCjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by SJ0PR84MB1965.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:433::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 04:21:11 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 04:21:10 +0000
Message-ID: <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
Date: Tue, 3 Nov 2026 20:21:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Andrew Lunn <andrew@lunn.ch>
CC: Jakub Kicinski <kuba@kernel.org>,
        Slingshot Open Source Team
	<slingshot-os-team@groups.ext.hpe.com>,
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
        Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Jo301Xk5YQus1aTCyJg0DH5l"
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|SJ0PR84MB1965:EE_
X-MS-Office365-Filtering-Correlation-Id: 098aea64-ca68-4bef-6b6e-08df3a2b0e48
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|4143699003|5023799004|261021135927099003|56012099006|261028144727099003|261009223027099003|261026121527099003|261021121427099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18002099003|261102123227099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: M9kOUYihO2lOiTxrpw9XwmF1YaaK30uYS5YvFZ1x1gB+UYr7RkLkk7eiD02Zl6NB/3AAYvDDty32LWX2apy51251w/HIJ54y1ULJ4KK/m6vOKAMEwqzEx8Qws/xUGw6TlvFSp2D7XajgIuQTpME+ZSLzFPfaPkgkKzBTU/LhUmwKtNaXdfB2BnziWdFMgmiqCv4W8gsHFLNOnyr1aAawCOYE/MnbNEbfzmzfYGED/Z1V7cFnm8Z74eYUGOJC0QTgAeWMFRSiO3G93xnaQLdoRrCX5CIdinDgYmgrSQjYdMKNxMZelQYfInVcC3grRvkUec3zjWwI1iA6XxYnCOXEJgfjSCB2bHNI0zfBxLHvwnTuA4Wcnwz2IylPkSdlitSTbRCEVOBB+G4aEjbtwl7WQbUQ+IpCXQhNsgzdBXuPZg9OxUQ2pXx7jzSdyuuRjKLBsgP3Wr31Mu7goBa1krsR++Ur//LGc4kllG4UNAodifiT1ZLpFk1dv74BRJ9Ny8GRhKQ6mc2TVceCkUPb+2rtCjjJqMoVyTYw+Wmx+mT6PflHyoMGUWPRDp3tfXaAU1omkmoIovgxubQRVYCZ3Jf3U6CZUcQuPjpaYGyVKdSp6uUncoelWaCebeFJvK/7qDes2Ma1rMpGzmKrPIF596mTGlsJUQNmsFdkECDdAB89bg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(4143699003)(5023799004)(261021135927099003)(56012099006)(261028144727099003)(261009223027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(261102123227099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzUxYWRWTGlJSThPYTNnYjRpajhlNXF0V00zbGZ4RTk1eFlHdHRnN1JmYzBs?=
 =?utf-8?B?YkFkQlVWSGtTbUpyR01BT21HeFFlOG40NmROSm1BS2xvUkZxV1RuempNV3Zt?=
 =?utf-8?B?UVU0T05VbVVnVWt4KzJTTjBibTBXTEdscHJHT2pEZFcrQ084Z3Q2Sk9DTXNa?=
 =?utf-8?B?QW1MTWV2bkExSmduRjBxNmx2RkEvaGs4bHNtNHBOdVVBblIxNnVXaklhY0xk?=
 =?utf-8?B?NTZiV1NrMXdJSmZkaWlRTUYvVWdIUGR5WE5jSEdkVVgrV29LdEhYN3c0akVH?=
 =?utf-8?B?Y0dKbGpxU25JUTl0Y2cvenZjRkt4b3lCaXVCL2VPelpNRXdaWDdDc043ZUUw?=
 =?utf-8?B?RVBxdmJKL1hGVWNnWjlDMEt2SnhpeldOYmtwa1VUU0xncHZOYTE0Z2h0aGpm?=
 =?utf-8?B?dlFtUGpmcjB1T2UrMGFyTUliWmFhQTlEZUtZa1VOOTUrcjRkLzE0T2JaVTla?=
 =?utf-8?B?Mks5WEdMNnA3Q2c4bGpKUXNnUWpHZHlYWXJYRnFoRllFbHBXY1NLbnptblJi?=
 =?utf-8?B?TWVoS3ljNG1tV2d6NHVGa09wVTZrSzVpSGdsVi9rSnRuVmE5R2ZKQUFGcGJS?=
 =?utf-8?B?REhpZGRlRDB2TU1uclJHcmtoRTcrS3dCSUlUdjJydG45cUdIQ0M1TzkwTE5u?=
 =?utf-8?B?dityQjhCNGErNEtnWEJzcUVRR1FiM1pjRVhtRXB6eXFTZmdBUGM3MHgzVXNK?=
 =?utf-8?B?VXpDQ3NpWHpWcWR2NHNTMUYwZjdFZVVZcEpGS3RZdkxQRFpRWGRjNHJtUDc1?=
 =?utf-8?B?dmxRMmQwL2pueXdiN3liWm5IaFFTaVZNMldMYWcrOTRlWEs4NUY0aHVPM0x3?=
 =?utf-8?B?ZC9yZVN4QktmeWhKS09YNVdmTU1yNDNwQzZrdThVaENwQ2RzZEc3dVRvZ0wy?=
 =?utf-8?B?QUNUSlk4eFZEUUFacHFsUGZFSnkvUW1rVzRXZHowaURmL1VBdFVkeDJTL2xD?=
 =?utf-8?B?eDdPbDNtUkVqL3VmNmtqeFlSQjlLMFFsRkhkS2RPa3k3a0VKa3lwNFhWd0lk?=
 =?utf-8?B?Q3FpTGhaM2xMWmpRUWU4eEc0amlHckpxK0RmMjY3emNONHBtcGlQWmtONUZL?=
 =?utf-8?B?bVpIQ3d0TTR1ZkFtNERPaHYyZ1ZmMGQrd0lFRjNKdTMwbFRpTG9SWmRJZ3hz?=
 =?utf-8?B?N09Ubml4R2VvdHNNZHhHa2EwQ3dNRW8xNW50d2JRS2FNSWVwYkxDRjVyU3ht?=
 =?utf-8?B?cTVaVC9DT3FJUTNWQUZ1aDVKWHhIRkZWZy9jSzFtc0VaQmdkeldtVk1teHJK?=
 =?utf-8?B?aUlESDRaL09RY095ZXFUdXkrOExLQ1A3dkp1QzFmNk5iUG51RWR3RURvR0Fm?=
 =?utf-8?B?eHB2cm12dUs5MGtsTVoyWXVNSXZyaGlmVzBUNkdLOGdCRG5tdng2S2pMMFJ1?=
 =?utf-8?B?N2phV3MzVWFZT3lUcTV5Wjhzc1dwL0tFajY5MkFWSzZwcVhZZVhWek1aR0di?=
 =?utf-8?B?aVgxL0txVElaUlJUODc4RFBvSThYVUxhRHBzcWswRnBKTzBFYTBwVENPRExC?=
 =?utf-8?B?VE4xWmZWNTNiVzN4N3NWZnZSZVI0ZTVES3pHMERZMVBQSFYwZ0Y4Q0NBU3M4?=
 =?utf-8?B?U01JQWZQNTdqSzhHa0VoSWZ5SDVsSTRoL0ZVQXZwSGRqYTBaMGdrbkN1YUZ2?=
 =?utf-8?B?cnU1LzIxUHZnbGNDUXpIS3VXdlhtSnZCeXJKd1RhalpFck1KcE9lVGtOVDRm?=
 =?utf-8?B?ajRqZWVya3lSVUdQUTViRWRFRmRrbXM5N0Q3VkNYQVZqZnVpNDIzcTljTTlx?=
 =?utf-8?B?RE9iLzVQaG1EV3VtOEdCakFDOFU4eUFRaGp2Ylo1SnNra2xqMW9ETFRWak1l?=
 =?utf-8?B?Y283Yk5MVkRqUHBXdnc2ZHF6eTM5bnBBUHFOcmtzZCtsTTh6RHYxQVB1NnE0?=
 =?utf-8?B?QktZdWQwNWlqeVovaVFEcURtaWcyczl1L2JPdm8wWGNCZ2JRMEdLeURDam9H?=
 =?utf-8?B?R2VMeUVzTnUxaGNEMVVZdFIzNlg2RzR0aFM0QW5yUFQ3UHpLbnQyZWhoclho?=
 =?utf-8?B?a0JlaWxDUndkenJzUENjRjZHYnhJQjhmVElQb21IaGdXREdEREFSazBqcVJW?=
 =?utf-8?B?aUdEQ3ZjMEZ1bmR0WlpZbGhyNnk2UGx1RmdxSklTZ2JWY21ySnRBYm9FWjFH?=
 =?utf-8?B?SytGSVVoNEp4d2RYR2huNVRmL25HaWxHc3psNDhoNVdNalV6MUhDSGtzdTZt?=
 =?utf-8?B?QnA3UlhvVDFrbCtVTU05bm53R1haTkw5M0E5alhsTUwvQW84dEFseWFsNmlV?=
 =?utf-8?B?alVTTXBrSkllMC9QNUxWQ05lSHo5d0RPWjBoWUZRQmdiZ0UxOWltK3pCbG9U?=
 =?utf-8?B?ZEd4cHJPcUYxL2EwVGYxMTRrVFpDaWxBTjIzMGovbVlwNVV1MmRUQT09?=
X-Exchange-RoutingPolicyChecked: qD8Va46HkAH9F46zEugtPTXoqdpobQzD+jC7uA719sXwf7+aL9iJ5hPYcEN7/fctjP5dhjPrMDmYDyZTlYzSw+tIowovZgHsCobPdnFvkP0yDqey1QcS7uDhPlVSiQFf+B1G5V4hYnSU23qIvO5cKI5Nesc8/FmG57NHboGQV+4bh/Oox7l9RfOlmobrm3ocRi8TYyjZ1WpBcTYVOy5apZjaih+PNVRF59uJv6m3th7vloZDsGyfuPWtrNxRfIsA/xHsRvC2ZUfTsYpGByH98T2RD9yJ2ZD9BRYFjYXzLpDxhk/yfRpCRX71SBFdVNgFKmcTsoY5UGBk6muuZCS7mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 098aea64-ca68-4bef-6b6e-08df3a2b0e48
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 04:21:10.8651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ht/Wz1xWhLUnbveqMf8cnP4rWaBQ1mrtWuPI4hBYYWDgiC4cDjMqMUi3qo+B6Qgwu8+KgJ0raKp8H4zmX+tEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1965
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxNiBTYWx0ZWRfX2L7wqMZme9Bb
 6Kd3ZJchClTjHWL3e0B5cbX3615tw+I8tYgAm8NRPCIikYScIgp89E26ovMG4TL4cCi6BCQJEH8
 grKdRjwIbks6SezwV0WdsjR14YRNu5M=
X-Proofpoint-ORIG-GUID: KWZPh8lwd1srpk5KMkex2LaW677UNP90
X-Proofpoint-GUID: KWZPh8lwd1srpk5KMkex2LaW677UNP90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxNiBTYWx0ZWRfXyfq286xEQq+G
 /p1nYyE40YVglZdlocQcu+CUF0WxJyBQi33wFleSjxaP3aR1SPNLfMB/sGcx6MBRhR5o7mUmYOU
 Nva/xO3mgjKiKY/eeQP5xN1F1ZLszC9Hr4bVbKh0//ZmwGuWRyw/CbVgxB+zJI34xO9Drz3KPrU
 4lNNBND7IntCWe2hbt7fAevgglZ1eSvM33GbMJ4tKb33J042lIAzaJ4tisTpwiImnzxHu4bahBI
 cI4IP+kqe0HIl4XwYQsPXkusNO8Q6g2m/x9sx1m5R9yYHNxq8+fCW9tiyPWkMcZknFjSOl+HysU
 PB4XPkyh6hfi9fdMdO3BfgYvCdBOsV5eJ0hsvJuMKnZ6RD7ojhAdHwvAO5Y3GyJJfMeXB1sMPyF
 eXvPVCqHGuivWmkfzysB/I/lHFH8bqtJ1dOLtnmfwVC1J95EGvhljhGfpd3/3eP95mGj2mP9MNi
 Zx052xBNU6KXdca2DXA==
X-Authority-Analysis: v=2.4 cv=EMqTQFZC c=1 sm=1 tr=0 ts=6aeab2ce cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=nIcgJiyBAAAA:8 a=trkvp0G5AAAA:8 a=MvuuwTCpAAAA:8 a=KfvObT0CnbMleNJW4JcA:9
 a=QEXdDO2ut3YA:10 a=SRfNDrrOety6us1uMmgA:9 a=FfaGCDsud1wA:10
 a=O3In4uazDjIihQemf2cV:22 a=3ZEWxWoznDpdnfSLIxx6:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040016

--------------Jo301Xk5YQus1aTCyJg0DH5l
Content-Type: multipart/mixed; boundary="------------pJWk01bsQZqI0avR5i4cZncb";
 protected-headers="v1"; hp="clear"
Message-ID: <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
Date: Tue, 3 Nov 2026 20:21:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>,
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
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>

--------------pJWk01bsQZqI0avR5i4cZncb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Top-posting an executive summary: HPE's ask is whether we should submit
this driver through the netdev community or the rdma community. HPE
prefers netdev, with RDMA as an aux driver, but needs the maintainers=E2=80=
=99
call. A minimal Ethernet driver is about 48k lines plus 36k lines of
mostly machine-generated headers (details below).

On 11/2/26 6:26 AM, Andrew Lunn wrote:
> On Sun, Nov 01, 2026 at 07:45:24PM -0800, Doug Ledford wrote:
>> On 11/1/26 5:35 PM, Andrew Lunn wrote:
>>> Can you add a single portal entry which matches everything? Or matche=
s
>>> a single MAC address? KISS.

In order to get the hardware engine to process Ethernet frames, either
sending or receiving, you must create a portal table entry (PtlTE,
basically a receive filter with its own queues, but it also defines what
wire format this entry uses) with .ethernet =3D 1.  You can do things wit=
h
a single PtlTE.  We have a specific PtlTE for promisc, so that can be
used.  We also define a PtlTE for any unicast, multicast, all-multicast,
etc. addresses.  But, yes, you can start with just a single one.

I think it's worth noting here though that this does not imply small,
concise code.  Portals 4.0 API is an RDMA API (link to the API at the
end of this email).  The hardware itself is RDMA capable. It directly
supports sending Ethernet traffic via hardware like other Ethernet
devices, but the similarities pretty much stop there.

The Ethernet layer is implemented using special PtlTEs that set up the
hardware for processing Ethernet wire frames, both on send and receive.

That means in order to just get to the point of being able to send an
Ethernet frame on the wire, we must first set up the "Portals machinery"
let's call it.  There are command queues, event queues, two forms of
address mapping, traffic classes, communication profiles, a special
system service id reserved for Ethernet that must be allocated, accessor
functions that know how to build the commands necessary to write to the
command queues in order to get the hardware to send packets, accessors
for the event queues, and even more stuff that has to happen.  I get
what you are asking for, I'm just trying to make it clear that even KISS
in this case is going to be more than you are used to by a wide margin.

Once done, the device will be up and running with send and receive
Ethernet wire formats working.  I have stripped the ss1 driver (the
Slingshot Cassini core driver, everything else hangs off of it as an aux
device) down to the minimum to send frames over the wire.  I hadn't
stripped it to only do one address type.  To additionally strip it down
to just one PtlTE would only result in negligible savings.

So far, I've been discussing the core ss1 driver.  That is the machinery
that handles the Portals API of the card and implements the Ethernet
support.  It has two aux drivers that hang off of its main device.  They
are the sbl driver (Cassini1 link layer driver) and sl driver (Cassini2
and upcoming Cassini3 link layer driver).  In an earlier email, you made
this statement "all your PCS driver needs to do is poll for link. A
typical PCS driver is around 2K lines of code, and that actually does
more" encouraging me to strip it down further.  I think the difference
here is that Slingshot defines its own wire format, and its own high
performance link layer elements, and there was no off the shelf PHY we
could use.  So we don't have a PCS driver, nor could we use anything in
the phy subsystem as none of them support our link layer.  The sbl and
sl drivers implement the management of the PCS, PMA, PMD, FEC, and five
Slingshot specific wire features (32-byte minimum frames, no
inter-packet gap, link-level retransmission (LLR), lane degrade,
low-latency FEC) all in software because there is no firmware existing
to do so. That makes them a protocol implementation, so just getting to
link up requires significant code.

We have stripped the two link drivers of all optional items, but we left
what's necessary to actually drive the link layer as removing any of it
would make the links non-functional.  The minimal driver removes
management, reporting, virtualization and offload surfaces (sysfs,
debugfs, ethtool, netlink, configfs, SR-IOV, telemetry, PTP, GPU memory
paths) while retaining the complete link-layer implementation =E2=80=94 L=
LR,
lane degrade, FEC admission/monitoring policy, HPC framing, and full
SerDes/PCS/MAC/AN bring-up.

That they are an implementation of our proprietary protocol is also why
I left them in the hpe directory and did not attempt to move them into
the phy subsystem or use phylink.  Should the netdev community decide it
is the right home for the driver, we can re-evaluate at that time.  The
existing phylink contract does not include the items our hardware needs,
for example the MAC interface only handles (speed/duplex/pause) and we
would need it to also support our Link Layer Retry, per-direction lane
degrade, and FEC policy.  For our 802.3 mode, we do support mapping our
items to the standard ethtool elements.  That makes these drivers
considerably larger than what I think you had envisioned they should be.
 These two drivers have been stripped to their minimum, so that ethtool
mapping will be gone.  To make the submission process easier, we can
limit the first round of driver submissions to just one of these two
drivers, but in order for the core ss1 driver not to effectively be dead
code, one of these two also must be submitted.

>=20
> The point is you want a very simple driver which it is possible to
> review.

I want to back things up a step.  I think my cover letter was worded
poorly and I wasn't clear on what I was asking the netdev community for.

My first request was an answer to the question: Should this driver go
through the netdev community or should it go through the rdma community?
 I should have thrown RFC in the subject line.  So please think about
the responses I've made in this thread with that in mind. I've been
trying to bring out details that I thought the community would need in
order to answer that ask.

HPE would prefer to have it go through the netdev community.  We would
prefer this for two basic reasons: 1) It is capable of being used as a
plain Ethernet device, sending bare wire format Ethernet packets
compatible with any Ethernet switch and other vendor's hardware.  But it
does implement it via Portals technology and not the normal RX/TX
descriptor rings the netdev community is used to; 2) If it goes through
the rdma community then our Ethernet support would be as a thin shim
layer just implementing a virtual netdev on top of the Portals
infrastructure that would reside in the rdma stack, that would mean our
netdev would always require the rdma driver to be up and running before
it can be brought up.  This would invert the normal relationship between
any truly Ethernet capable device (like mlx5, cxgb4, etc.) and the rdma
device.  To my knowledge, the only devices that have this inverted
relationship today are ones that do not have true hardware Ethernet
support like InfiniBand, OPA, etc. and they all have to encapsulate
their Ethernet packets in some way to send them over the wire, whereas
we have actual Ethernet wire format support.

I submitted the driver in whole to be transparent about what this driver
in its final form might look like.  What our hardware is, how it works,
and how it differs from ordinary Ethernet NICs.  We will gladly break
the submission down into parts that are easier to consume, but this way
the community knows where we are headed eventually.  No doubt a final
version of the driver would not look the same, but the submission in
whole provides an idea.

The second request, assuming the netdev community decided that this
driver could/should go through here, was guidance on the sysfs usage.  I
had already removed the 1,925 telemetry items from sysfs, but there were
several hundred still in place.  I was just looking for any sort of
standard about what acceptable use is.  In the meantime, I've stripped
the remaining sysfs items too.  But I would still like guidance on when
sysfs is usable and not.

Those were my two asks with the initial submission, and they both still
remain.  So, just to be perfectly explicit, I'm asking the netdev
community to say: netdev or rdma community.  There are valid arguments
for both options.

If the netdev community wants this to come through them, then we can
start the process of breaking things down, etc.  I can start with SerDes
driver(s), then the Portals machinery, then the Ethernet support as a
series of chained submissions to be merged as one once approved.  From
there we can add the RDMA aux driver plumbing, link up the RDMA portion
of the driver, and then we can start adding the remaining components
such as ethtool, sysfs (potentially, subject to review), debugfs,
netlink, GPU RDMA support, etc.

If you need to see that minimal driver to answer my ask, I have a first
cut on hand now.  It has been built, but not run tested.  I would run
test it and then file a new submission to the list for review.

The recommended tree for submission at a minimal level:

Component    Submitted    Minimal      First  Why
             lines/files  lines/files  round
-----------  -----------  -----------  -----  --------------------------
ss1 core     57,378/95    32,824/64    yes    Portals machinery and the
                                              Ethernet support; the
                                              other drivers hang off it.
sbl (C1)     17,911/39    15,005/34    yes    Cassini1 link driver, the
                                              smallest, with the same
                                              structure as sl. One link
                                              driver is needed so ss1 is
                                              not dead code.
sl (C2/C3)   71,906/238   32,580/166   no     Cassini2/3 link driver,
                          19,015/1*           much larger. Same
                                              structure as sbl, so it
                                              can follow once the
                                              pattern has been reviewed.
headers      37,640/34    36,283/32    yes    Shared by ss1 and the link
                                              drivers; mostly
                                              machine-generated hardware
                                              definitions.
-----------  -----------  -----------  -----  --------------------------

Original submission:        184,835 lines / 406 files
First round (ss1 + sbl +
  headers):                  84,112 lines / 130 files
  of which code:             47,829 lines
  of which headers:          36,283 lines
Everything minimal (adds sl): 135,707 lines / 297 files
                             (116,692 without the ucode header)

Note: The sbl driver is Slingshot link version 1, sl is link version 2.
The sl driver is larger because not all features of the second
generation link are present in the first.

* - there also is a 19,015 line header comprised of generated ucode in
the sl driver.  That will get dropped when the binary it produces lands
in linux-firmware.

References:

This is the Portals 4.0 API, which is what our hardware is based on.
https://www.sandia.gov/research/publications/details/the-portals-4-0-netw=
ork-programming-interface-2012-11-01/

The current version is 4.3 and can be found on OSTI.
https://www.osti.gov/biblio/1875218

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------pJWk01bsQZqI0avR5i4cZncb--

--------------Jo301Xk5YQus1aTCyJg0DH5l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmrqsrIFAwAAAAAACgkQuCajMw5XL93W
1g//ZisBxlkp3hDRwzlkjOp/udcATde5zQLUCQd/Dgrhn8nnbGFS1sBf7S2mWIAKxMTJIzzLDOLP
5t6EAzIha3csB5FBCbJDeiqfdmizlzlIEvM9dPV4K4givnnj3gkLxq/0u/6crtmxRzrJr2Ki/v1e
5C8+UgGQmzLWRrOpTXVFwmACgLM+mzyyBcAyLSrWoTngDy+r8+D1X7CV0MZ7O2efSNe8HbBlIOTm
nVj9G1auGe0tpG4jVpVM+jMzdCgLSGo5jDawl0mYKmEssCQcDRRZ6ugRzUWh04Zfyp4TIYE/i+5E
BBdSwZwE/9ELF+daJa3tN3qi6sx/HQNU5Lo3Z3oYxFeLHULRpZ3EyAt3kEnnwy9fcCAS85Dd1LVr
It7N9SdvRKkGo+aTpnAG81IbL/zbyYCL2AuNZAHAYRCyefz/80RPrg1q/atU9eAuz8OE0RLuWZJn
VqMZlNCKz6wAvbrgVZZYq4oID+nIgUS0iF0+nuX/SSUPQWfGehI17CsZ3CxoZIY+kbnNGUY4qpqt
dJIN88Fsfgt6IkBti0FdluPb0YT1GjaTFs/+Fhh8WvuMO14dfH4SHrPLYjrtl0+YvKd4eyfFcFVJ
GQKrNSecMkL9fFYqevCMNLbh2QIhiseuXzD1iPPDLrxYSKSEAbQVBK1cXxGdvQIDnMsbqvRF7opb
OKk=
=HzIF
-----END PGP SIGNATURE-----

--------------Jo301Xk5YQus1aTCyJg0DH5l--
