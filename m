Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793591195;
	b=5MEaSi9VLKH9N/QYx+q3NDzX4MAiJwHlbj3X15qe4uynviCyDi5E+T7ZkR7cHVjW+Q0U
	 60rt2pOWFYLOce1Mmx4Z3TUVDW8Wrk+1LqtyqqUHFyLieOse5ynvV/9e4/zzS+eanjJ0x
	 VlrTjXG15foZdmTIQsQ0q5CQo27m/aKT1YInwDwSNugfrau0z1Q4cM0PSyGRXMr75B14m
	 ZplxvHDm2hlMu3axgADnR66bMP3o/q7SsGLPJaDT5MAnr56SUMzl9WwbrNTU0VSZquMHV
	 24EHq5oRPIB7XZxjb1UQXmzzjDhiUs7QLHSLXFwZ6WWdZr7AUyjub67XfWwxcOtdDpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591195;
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
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-HPE-SCL:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ck/qit+bcG6Tu7Vy7BGh4BNipAZ5j/s78IRMztOiIM8=;
	b=00dVVndstYpvCoaFT7TJCXsvQjPt+sKdp9je60YfMq8YtZRo8t4Py03dmrK/IfBspiDQ
	 +TdxdjCEn63XvitGH9zdAtz1yB9/cOXygoGMTeTyb/i7xRMwxILM6ykSPOtBS+cwx4nHc
	 JhIwFZBVyiW3lfrjw0zl8l75+AcODW7w2bKEkMmohlcWLbC0aCijpIwMzZXGE1gEbue/W
	 rLH5Pa3WotFLVu1ERZDJRjtOcBhaMCaBvEiHw+UoKxnaNXqz5sQtEXS98SRTQX6/VXg6W
	 sa/BmNXuDmPAAXCgNTK2EWMoDylx/mjTwV2zKoN/gJsnfMkxsuEQ+GvBUjjPr1s06qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=kw3GVYZU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D8606A326;
	Mon,  2 Nov 2026 03:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=kw3GVYZU
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20M50g542193;
	Mon, 2 Nov 2026 03:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=Ck/qit+bcG6Tu7Vy7BGh4BNipA
	Z5j/s78IRMztOiIM8=; b=kw3GVYZURQu9r+f3S/bXeeEnlL9vmOqhfqPEM2IoVm
	2thGaWDSOhIOtTHJRoCWoJQ8tsio455w3vfoFEIVCURrRyhfzm4Fn8OjLwKi+NUF
	KrT2uYhsXfK5krJP25cJF48xZLakBBqjRgiE++pWbWTlx675Sn9P9ZFBi+30HL5J
	PPUOBkk/jyH9WMcBcJitkc8HIyuRgoAV1QGf+OeLdPybwojr5b9vl3UHKiERdqw1
	hb6yRHvjpQc/sAKxTU57BQ+7po9K+m8XTL3X1oCSJmb1OWXuq+ywYOed+ZP9OsHZ
	pob9EKrKaK9i3NX8dsqBsanrEVtnOeiX0WRXcOW85Jbg==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4hpbcnb37w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 03:45:59 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 1833B8047AC;
	Mon,  2 Nov 2026 03:45:59 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 1 Nov 2026 15:45:39 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 1 Nov 2026 15:45:39 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 1 Nov 2026 15:45:39 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Sun, 1 Nov
 2026 15:45:30 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvpfGQsLnpIwZ7zA+44JE1XkKt/fWKbuGVvWPg2X4LEJgOPf1shA32DIJBDvu4Pf6gXtErLX97I+hO9X6KwCyo8dapF65uHIVWWpg4WMlYGgZIQY0reLy4bJCdWSNZxXMdyQOyhT3BwQyM/fJOoTQtxYBAZUc4E0Fw0GfkM8rcbphVy0b1JAWgV+DoidvGS710VXXJB3qzdZlRLSQIWyFcJanRnMHloshbPLHHMGmfqo1MDLi9P/8NXp5bYggrssA1TgPOIUwLE57hM80wjKQwS4Y1fQSNhDoclr1e9P8MBzTjUxQANRgD+9PNhYFm9TOgOpNK9P4BYnEaQVaE74Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck/qit+bcG6Tu7Vy7BGh4BNipAZ5j/s78IRMztOiIM8=;
 b=n6BWEucslqFOTjfTw5wlYfR1NT6gqXzu4Adu2Z+e0s9aLS6UYWnoydCrna1tm6vKzriz06niC1nIxkmZkn1URUBe/L37rEAWQbnGcJJfSsWvFdxeYOXSqJl3yUwBVWDj4SVhlDtFYln6lS2BcK5HbQsjPDWvPoxEoAUJ/2Az8FbrAg90zR3uisBleYX6j7Bqv+CaNp5bL3ojYx2cO7/9swE/era8fcPQpuwoRzyE/SjIs6+DmKByFZK3HPnK/i8cpCniu/JdDBljECBXK7gk3ZvOUXCAQZ72pFjZlXRHxyJ37n4MRdidY00SZBdHiUEY9f67pBOlmOXVf0HV45wbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by CYXPR84MB3685.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 03:45:29 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 03:45:29 +0000
Message-ID: <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
Date: Sun, 1 Nov 2026 19:45:24 -0800
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
 Santosh" <santosh-kumar.mamila@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LxDGitb0mAZHQ9omlyXQp31y"
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|CYXPR84MB3685:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c31259f-5afa-41b6-78c4-08df3893bcd0
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261021121427099003|261021135927099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|4143699003|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: EyWPyUJRwG/JPPhEyQlY7zchK0NMJxnZhfMmDtGr433Iq6uwNNeLWbFyigOxwsSyo6zGQEubNrscYkTtyq0GdUE7iWdf+NmGyoksVnoby6cAFQO1MxpGIyGAlJrPCFRerr6IJtYtobph+7sLkTzEIe8nd1Pap0ig16JTJQIf1buFtCwoxejtRuegLiuGyxJh2SExplXjp+hHuGNNzclQrz6IrlV2F9J8DX3S4O2w3oE2hSSTFsHlPvI5LlrNKl5FH+Ahg7K4tyIQG4TXW7ca8pHIasRM4J/ki2wZvNfkY+cPvGgFqLQODs4SR1pfWz9edJp2tMYjn4BESxJle5awzVduqLNmmWl6yFrRv9oK/Nl+0FyIKnLfPaI6/SVo4HPa79JgI2IvXtw8fMgIhbM/NySaIqaHZn7v/TGoCW2LrInZ4OZc1WZ3JViAaFHJM58ks7PNe29Mu4SmDFmAsifmmCv4AxjWm+kcBfj27UPmZMowSbmubAp5xx3G0ZISBsbaPb+6FytbmFbE9Td1yR31tgmm+7QLdzEmq6PZE9klUCt5aUxqjoxSOqvFHxBtOAZ4YW4Psw8iauHaxxjG2KYYEykZdSDnZ8iEI8JGlwR7PYCZbjRQUcCbPuhO0cSQtwAoD2UHFyqNj9qTyzqLRL/7hyX4kpsBlgS3onSvJCDi6m0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261021121427099003)(261021135927099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHNoY0Fid0lCRWc2eWRSL3FhbE9TZTFORytSdGZIMERKR1RvWmFkQXNES1Yy?=
 =?utf-8?B?aEIxbzdybzFmS2Q0M3RxWTQ4S3g2dEJaZmFjdHNDUzlFSUc3R2g2Ukd2ajlq?=
 =?utf-8?B?U0JxRE9Xb243SHhoNjdUN2pqa2VXUUJZYWRFbmF2akZ5YXdJdG01R3dvd3Ju?=
 =?utf-8?B?WGNHS21YcWx1MFhYa0dURXJCQ1FEL3RxeW4xNzRrTU54SEd2bWhVd0NzN1pr?=
 =?utf-8?B?YkpsVVZjdTM5M1R4MDVqM0xWN2ZiWHVjUHM1VDU3QnRFaHIvSUREZ3MyNHJD?=
 =?utf-8?B?TW9zeFl3R3MrNmtwaFFxUkZXZC9jOU9hK0RUQUpRS2o3UUxEc1FBUDBaS1Q3?=
 =?utf-8?B?VjBDeElSa05iTlVVclBuSVMzYm5jMTF5TmM0RWhtbXBMOWxxRzdyZEJBbjk1?=
 =?utf-8?B?OEdwREdnajJoNFM2RG45WmxWY2h2aHdJL3VHODd4d3Q4ejNGUFFDYis2bGo4?=
 =?utf-8?B?RXQwUnhRSWFOakVlejVudDhPY2VZK0hSZUkrb3E1NXJYSUFMWUJGT1ZwTWlm?=
 =?utf-8?B?SS9TUG04bGhyUFk3QURkUGN0T3l4VUJybjlYVTlWQk5jWmtFaDBoSTNVZGlR?=
 =?utf-8?B?Y0ZJcjNQMkpKY2tYc2R6Q0pPNVcrU2hlT2dBWG4yRlRHRU5rbzVDT0cwbVB5?=
 =?utf-8?B?UXdoeG1LeUI4RlVnUjJTb0FkUWJpWStsS0lnOFFCSVlBa3RLb29wcTU3NCtl?=
 =?utf-8?B?R3VsTzhGcXJMQmhzbnJIQTBmZllSQjVQeFVySENXK0l6SGxaK3M4cFV4b1BM?=
 =?utf-8?B?YlpoTlk0c2hIOXg1Y3VPcnBiTXQwOWo5RkZUdkdDeFNYaVdreCtWaXZ3dWt6?=
 =?utf-8?B?VGJORlR0WURiazYzQmFPOU9Md1gxd08yb1ltUXFRZzBiYnArZ3ZUL2hrbHJK?=
 =?utf-8?B?T1JIMmw0bTFwRWI5Q2hyWlhuaFJMWnBaSkJjSjR4UmxiQkE4ZC9uWUpTNlZz?=
 =?utf-8?B?UTg1OWJYMkdNSGhDcm1jbmVPakROUi9LNllRMmlnRlQ2RHllMndydFFSdm1I?=
 =?utf-8?B?K0hGRGc2cTI1R054SnFYOWV5eUVGSFBmM29ma1Bkai81UmlxYjNQckFOUzhw?=
 =?utf-8?B?SXR0OUlGb2lUVEJLQmNzMTc2amE3b0Z3R2Qzclh3SVNqVUthUmpXRGpldGlL?=
 =?utf-8?B?VGlVbFlUR3Z0S1NSdGd6M3kwZm5sUVJyU2pMbzdSUVpLS3BxTjM3YzZ0cGNJ?=
 =?utf-8?B?Unp2Vm1jTlA3amlmcEpmQndGOVdvSTZkQ2NSbWVkL0k2cUtFRWZibzc2V0lU?=
 =?utf-8?B?cXhlSWhCOTBoSjF2N0pBdThaU1UwN1F5NE5HRE1pZlJqcmxGcUg3S0dRY0p0?=
 =?utf-8?B?Y2xGazVpS0NoazQ5LzM5TDhQdktnZWpFektQUUx1Y3lvckVsc1d2RWp0U2NR?=
 =?utf-8?B?bG04QWRKZWhVQXlWaEdmczhFYnlvUUN4cTZkZTVqbVpzZjAwT1dEV0tNNEZB?=
 =?utf-8?B?OEl3V01NU08vSjJjVHQyc2U4SnprZlVOb3BlS3RCR2VET0NLYThxTkt4enBT?=
 =?utf-8?B?clRPNTZMZFZXU1pFamVQWGIxQ2JqYUJZNUtiUCt0N2ZvVUdKMk4wVW9SZkpW?=
 =?utf-8?B?ZS9JUzhTa0ZBVW9Ccjd6WTBrNXNvRm13U0E5bjZTc2M0aVZ5VXc3MklHOGJI?=
 =?utf-8?B?YlpSa014SlFrUzBtRUNKZHViTmwyRHhEam9qeGRhZlBBZ0pqUU5DbkdCWjNy?=
 =?utf-8?B?Z2tjbWtNNGlMVUpLM0Q4WG1sQXZITW9xVytyMkxva3lSZmhrUEJqUUx4Zlpp?=
 =?utf-8?B?MU0waS80YmpnWi8zUHo2NHRwdUZDR1JLZGw2My9ENk8xS1EyRWliNlgrUE1W?=
 =?utf-8?B?SlJSRnBia2pSWVY3Q2srWjdWNUNWdlpnNWVyMFNCT25GdVdkYW4wYnk3M0xH?=
 =?utf-8?B?MWVVOXZUMXZmMVhQc1kwRnVxQkUwSmtJTnhuend4bjhQQmNzWW9jM2R3Qk9S?=
 =?utf-8?B?bHQ3aHZqNzdKaDZpVFBnS042cmZaeUs1VmJtaEd3U2pHUk5BK2NnWGNwY01y?=
 =?utf-8?B?RVdFOWxJNnFJdVBOU2l0RXFjZ0wzcEZtY1BYMHcrMEM1RCt3bjhMMmhYdlpq?=
 =?utf-8?B?cjVhTEJPVkhVTUFoTW1iMjg4ZDZmUmtPSGZ4aDlmdVkxUEFTcFVPNGFCa1JV?=
 =?utf-8?B?RXpzenhTRytaZGM5OC9WdWxRQzNuRkNuVjNYYjN6UFVrL1RmZkFMOUNOQmlF?=
 =?utf-8?B?eWVwRDBOK05kcG1nVHl6ZjJ0U1V1LzJ0NmZ3RWJETEU5aWJ3SWFHZi9sL29G?=
 =?utf-8?B?dkZ6RG9FTjNCbEJGTG5wMEMxV3lLMUNHa1BZU1cveGJtbFc2R0IycnJxemFY?=
 =?utf-8?B?VU1hWVNSTVBZZnh5cGIrd21rMDV5aHVaM3JjMEdUS1c5bVhQbU1pQT09?=
X-Exchange-RoutingPolicyChecked: 1JKWp8ojDLACKYiheY1oTsY5kcQv5RnM1C3jofNH/Au6e7pOAt1X9PkwKHy9Zl4PPH/IcDdMiFatdjpjSi9veEkUkRfgRo6hDh2F+tWJ6WUpoCWwa8H8rf/hroGExyhsOMHhy1Kq1wvwNnbIefmCEnIGAyD8YWcgNVZPd8ZK85AKVaRPbp/iBDhSReJLhXtOP7rJc/XVv4xmQ2tKWhwrdeDC84bVrwPlIf7BF9g+zJ5PS36uI7wje/+XxAMPRRGjjtGrchrOiESJ9V4pW6AIVCx+Qwx78aLpFhU888vKGUk5yBQehq0Z8Z+BYpbU/unT8VMvWvCpb8+Ut9UZtQLJxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c31259f-5afa-41b6-78c4-08df3893bcd0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:45:28.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQbdjKIa1HwOFdPj7nhWBxOQwZEKJiMv9l0cVt3QYx1zOupXLbEKtOCi8mmUPW3GxsjkwMBJ9rwbJFkoTWcK4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3685
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: vGYVUnEIwzhuux_K4OcPIbyY2M2Pksr7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNCBTYWx0ZWRfX1Mz7E5iMBJ2N
 0TXFEamJoB/bE1cINxVMXemXvlMDmwHidRwzDhsGKk/kV3XIMKRIMm2B0YKoBRQlETBLY4X9RVY
 tSoF9/qTX9ril5mrEaSfTGvTaF3KWhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNCBTYWx0ZWRfX0fV7v5jlwFde
 f0ogEiYwI5U8RPmfdvEf6UUK/A4CHwCujFNaJ2mv4y3JVL0brbIDZf75hzB/hAAQfNs4VTeadw5
 bOP4vRx2bmnQz+xmIkJn2LrnQUCskPyvKKIyi2y5mocCBDOj78gCN5PDKtDsywqU8FKYwu9Q+wE
 DQ1g0fz74F15fNH1ii9U1DzaLcNyqVGgMNKFIeFjA8TiK/nmWeRre2qT42CnU/5uJTTHcJBodlm
 bA4PoqLcCSCfKfUa9iKxJ2IkUttv/SHLA6EtVvrobVMnSkTb4/2AONwv6Wl44rsUrN6cGY1k25u
 st8t+fSHwMag9EFsOkCkOWKwrKtk9hx72hC6O4XuBYea1WQMleHtrokLwIENJXuYvkGRZfbc0Nu
 feJii3OOz4OolzWVAVv0Efloz+3EG91ta/nEvyaZBZyKOvqxQ2EHPElXFIfHr8T8kaw4banCliy
 A29mYPP2XRgJepHy0EQ==
X-Proofpoint-ORIG-GUID: vGYVUnEIwzhuux_K4OcPIbyY2M2Pksr7
X-Authority-Analysis: v=2.4 cv=X5XHu2Te c=1 sm=1 tr=0 ts=6ae80777 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=MvuuwTCpAAAA:8 a=KEewAtMq1Rh8BHwz3xUA:9 a=QEXdDO2ut3YA:10
 a=hCFme0j97iLdl2euH7cA:9 a=FfaGCDsud1wA:10
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020014

--------------LxDGitb0mAZHQ9omlyXQp31y
Content-Type: multipart/mixed; boundary="------------0GTSvmTJHZKsCT0mQtAOqLk0";
 protected-headers="v1"; hp="clear"
Message-ID: <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
Date: Sun, 1 Nov 2026 19:45:24 -0800
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
 <iraimani.pavadai@hpe.com>, Mamila Santosh <santosh-kumar.mamila@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>

--------------0GTSvmTJHZKsCT0mQtAOqLk0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/1/26 5:35 PM, Andrew Lunn wrote:
>> I'll see how fast I can get that done.  But "the bare minimum" is goin=
g
>> to be more than you are accustomed to.  This hardware does not receive=

>> Ethernet packets using MAC address like normal Ethernet hardware.  It
>> uses a special portal table entry that filters in the Ethernet packets=
=2E
>> It has the ability to have different filters that receive different
>> Ethernet packets and so sorts them before the driver ever sees them.
>=20
> Can you add a single portal entry which matches everything? Or matches
> a single MAC address? KISS.

That's a complex question, and one which I need to go talk to one of the
hardware engineers about.  It also varies based upon your meaning of
"everything".  If, by everything you means essentially promiscuous mode,
then that's not a good idea.  On the fabric there is Ethernet traffic,
but there is also Slingshot traffic.  They use totally different frame
types.  If you truly go for "everything", you'll get Slingshot traffic
along with Ethernet traffic and you'll be throwing away tons of garbage
and generally wondering what's going on.  If by "everything" you just
mean "all Ethernet traffic on a single portal entry", that's when I have
to go talk to the hardware engineers.  They have different lists they
use for Ethernet and I can't say for certain that the hardware will
allow not using those lists.  For instance, one of the lists might be
specifically for packets that have been fragmented and if you don't use
that list for those packets it may not receive them at all.  That's when
I have to go verify things with the hardware engineers.

> You can then add on the complexity of adding MAC addresses to the
> table in later patchsets.

The card has a burned in MAC address.  I wasn't trying to say it
doesn't.  I was pointing out that how the hardware determines what to
receive is not by just putting recv buffers on a queue and turning on
receive mode and letting your MAC address pull them in.  It's more
complex due to the portals table entries.

I did have the AI do a full analysis of what you requested.  A bare
minimal driver.  It passed this back (just giving the summary, not the
full report):

Estimated total for a C2-only, PF-only Ethernet series:

ss1 about 19=E2=80=9320k
SL about 15=E2=80=9320k
headers about 15=E2=80=9320k
That gives roughly 50=E2=80=9360k lines, or about 65k if C1 support stays=
=2E

The AI did mention that some of these are estimates and not real
measurements, so take it with a grain of salt.  If you'd like to see the
full report I can provide it.

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------0GTSvmTJHZKsCT0mQtAOqLk0--

--------------LxDGitb0mAZHQ9omlyXQp31y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmroB1UFAwAAAAAACgkQuCajMw5XL91d
iBAAt9onEbZ66QgMIt2R8c2EqhNqWTnrn1a/f3ust9QjFlteL1USnx88ZDII3onrR/Dt9weywW39
tiGjNSSA4ecJAl2DyeOrFO99jazD0uUTiLv8jsImMfTb1VH/ywc48YEBJaX0egYkxf97Z2TppHho
m0LusMCHVmJAq2LIy6GcNLY4D8YGDn+8LfnGSjoj4tauRSP+/6WTQlwHD0vgqjMHHaGCy8r5Wrgi
JYNPVqcItJgdFY/25N8ua484/fKuzaEDbOjOh0p+mlwzJVkLGi5A8sPQXz4rEW53If9DUUYWdC75
LflN6NXD+TWbyExow0WbvUOzVetsjzZvp4pAsb+FBSc/I8phlAqsrOBKfdnFOqX/El1/hUGSC2nB
YS/euzRffrwPSM74jpJajINUalf9ulE62kBaCd/E6dXozRyO0CKk6Wd9CfdZdxk0Pthdrow85kL9
WMk8H4rPW8L2n65bOHBhCrfJnsEH1wLNmXn/sXtD+KHG846Gtr2Gwmn1Re98KLYOxO22SJk66LcR
e3dLboY3XT1TOCH5RGSPtRHvARp6TFk9Me6cQy+77y8CCTEYvlzGk4yUgCoeJ50Wr6PlVEeDO+KL
6lwMzQ3N5FQVQnIZ12r1+8RMUsz3qSwXIfj1/XgmHELEhfGNxr9Vl9RA9Fx0fZ8j1wOiL1mCdIhy
uPA=
=B27F
-----END PGP SIGNATURE-----

--------------LxDGitb0mAZHQ9omlyXQp31y--
