Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793638916;
	b=A3c8DKS8d0lmNS0Eo4oyOQ45zJx4yws0qlELC9A7AF9g70c06iQg+cBqlsDMZAacCD7Y
	 tlGbfT8UbOsg0vppBWGQ4K6JPY2GbersfY3KXZ3sPVeOUYX6ze7OqwA6/5VvTDIgzH7Gv
	 rSXaGp8s1F4EQ/A8M3rCcewbeWlyJUX4A+n/VSGzRAYgwR+j5H/f188X1hZ89DOS7dDM5
	 G2Eldz20YuGBDjajhTnCGvdm0QacRLxEPoUaVVLBfkAVmq9J3DEF9gMYQ+antqKwMBcdy
	 ioMSOCdQcFr26B9XjhiI7sQmPb8D47Tisty/zoOD7J8fZMp3fALwTsOii6Evb77i8cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638916;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g2X4JK0y+t0oaCggzfFGDjBrJGWPymV27DPW04Phl6w=;
	b=stsLZtulG3SefeKTmtem2SYEkph1RqopIOKC3ScT4K6qvAoy/ATi+auc7laxAQ137nSx
	 LjJGn8CZBJvEGa0dgE+TcVlOjnAn6Z2Re1MP3fclSvs52P2gW6xQSKGzkZl4532NFkh0C
	 wTYfR8jDbdDTaQtK5XHDxm30cO8+RC/98ptBC0tISWCre5CEBfMx+JlB/+GOFlq0UVS8N
	 73vId+MpUkYBzJE9Wj4M0Nv3jbgr6J6XP3J3j8MWMo84uj4rQC7QmokfocXptKQ6Dj4fE
	 w005r+chhUAKYFLxKlm8o4TPVntSnsc8RfbS7cvDxB7tf1kB1L4T87rIGRL/EhlatWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=dl3uU7mk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B1A606F229;
	Mon,  2 Nov 2026 17:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B1A606F229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=dl3uU7mk
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GtqfU3094240;
	Mon, 2 Nov 2026 17:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=g2X4JK0y+t0oaCggzfFGDjBrJG
	WPymV27DPW04Phl6w=; b=dl3uU7mkoS8WlUgKde/bbPoPHysvbCnbKfTlzGov+2
	Kcx49nax+PYNlQat6C2CRBsaKxiiW+R0xYxkOmrt7AL0+oSDeif3VyGat6IASxQC
	GqpnLSP7xWFKHNWfYnL8UIj9t4VyjqebMLjIMrZp+zFbLVdFjL2e8VOLXl7rYDqs
	MD6QVjFxVh9Zs3F3VVm+L0ncGEXii6C3/lXWbhfsPCDdjfU9o/uitnsZI86goXkN
	7Ee4Hihc33VX4q7A/lbFVwKDAi/a9v/ZqrQ+bunh7Mg7x/vGlieFLbpKN6/WZQVK
	MGngrtbEZ1ZVBZJLCCy9Yx9a2aLqojLDhSQ6AJtfsOZA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4hpxfhg37g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 17:01:28 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 331A9D2C4;
	Mon,  2 Nov 2026 17:01:27 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 2 Nov 2026 05:01:26 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 2 Nov 2026 05:01:26 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 2 Nov
 2026 17:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtlA+PItbKUKbWuLhVJQyJEqKnTsS4emTDmcbGR6c4vIpY6YoNoNJ7QAAXN+zGQGTGy58LDElUH/rhaB0Ino8G8neVqw2UDyN2Ars+/VtpGz0cyedEWvaHekhLyEvo/4XdKJLh/8XGfLIaxOqYILnCtwYY/Uw4zK6XdcWCFR93/XuZLOgXRwmrFUrTegT5NOh1VG/YzZlbnAyvRPkik2GuEJkvlBCTRR3DZW8al/XwN4q277J7OPIrUVivDPjFgcU8Fat4BX2HvbO6gGycAXzalnkKVY1f67wAkVZwowEq47+u9+hIwJMbf57Cbn7ZdFataVx/Ui7s0WjZ0LofFhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2X4JK0y+t0oaCggzfFGDjBrJGWPymV27DPW04Phl6w=;
 b=JXfr8ORWSU1S0QOgeh9mDLBD5NOTw2vfT7+cbq8s6M1I3D2Cp5WyWldM/MuKWbcVHDLTxS70mzwl9cAfLyo/5KHLHIDN+jvajnOQl+SxVUPZz3dFjueR7yc3x7AF3fOypjN5ZVoTV3JPLdCBOov6OgMxJwwhJS0cw2Xpa9BdJv3sy0c08RGdMdFG9d6L8VzInhU08W/7z+AuVbIqpnfV0SsxNmU3FoHS/dmse8GTxKQhWUEppGI8X4gj4SO8GzCZc26GPhc/CiJlON5w+i4hYoG8aZNngnkqejpW6lS7nNqqDYIENYI7l0YkzOo7UdhuA6Xj877iHCzH5pfv0ejs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by DM4PR84MB1592.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Mon, 2 Nov
 2026 17:01:20 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:01:20 +0000
Message-ID: <f235dd80-477a-44ea-955e-93252ae4e7dc@hpe.com>
Date: Mon, 2 Nov 2026 09:01:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Guenter Roeck <linux@roeck-us.net>, Andrew Lunn <andrew@lunn.ch>,
        "Jakub
 Kicinski" <kuba@kernel.org>
CC: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>, Sandeep Bhoot <sandeep.bhoot@hpe.com>,
        Iraimani P <iraimani.pavadai@hpe.com>,
        Mamila Santosh
	<santosh-kumar.mamila@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <71e3083f-c845-4953-80b7-38682a4cd84a@roeck-us.net>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <71e3083f-c845-4953-80b7-38682a4cd84a@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PJ3KrVQMJX0mQFvSVKLi0x0T"
X-ClientProxiedBy: PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::28) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|DM4PR84MB1592:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d555fc2-9720-4118-f9c6-08df3902eaad
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|6133799003|22082099003|18002099003|261102123227099003|56012099006|261021121427099003|4143699003|261021123027099003|261022075727099003|261026121527099003|261022105027099003|261021135927099003|10067099003|261028144727099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VP3a0EO9+NME30qB6kpRT+nFPyH4TgJlBO6Tm5HG679CE2UcJwmEjmi1GPkAsMNlTdwh2/RawoP0UfqBLGu1Z/ndTzQLwhNliN7mkxbNscNcLcmY6IEHlEYMOIslwKn0r+gTijvYhqCow9dVcE+4SFn81IzCOLEAcCHzpNiTQO+VJE+CA4W3/eGqP8RqInBClEhfbUlxsFCeGgMLe0N7BLMnNhTMCZSJ+JzWhS/nsyhQnmqSts4G9ud27dT51u2mF73FbFZVpDS6UmijiJmvZ7G5p3GVBiCnCEpf33kuhs2nTVS7rabTsnDuSsERG9HZBlHi5ZtqTdzcKq3d3/Jx/IunjtC3JtLR//wpf2zdPSBhbJ42mgTTrSb5ty0mD2PScaFPIPWa+17h+9wsQpropAwtCENKKaZg5nkw9TMA2pL19IXKqbMBufMfzY7TZwi2m5OdtRPye3eODb39uXDsN1V8cesU7H2blLfgOaK4y6DUaNv8PPk5r0PiXIP/805ma8eySGlMqfFPrwWA99npTQjWlDXr3CG0BdonN5TNJUzbtclh3mo57jr63vS2jFpI3HsBhbiUwLaLjJfo3g0Yy2qPjiKnc3OxbYoAXc3519VJc8iJZOO7MxchE2JHlkN+kHjxjQKY4Dai5B5oQbCmt+HrfAHmp7rS06THpMJNFiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(261102123227099003)(56012099006)(261021121427099003)(4143699003)(261021123027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261021135927099003)(10067099003)(261028144727099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck5KNnRYcjZqbmNhZGs3MHU0NzNsNmZ1NHZoZkdaV095alFORFJzdTYxaUtD?=
 =?utf-8?B?bm9Kc1JWTmFIRGFFM2x4UVh2MnRpckQ5ajE0cnJjSkR4QjcwM3AzNzE3TDFp?=
 =?utf-8?B?T3BCckhvbmg4K3laWUhKNUVXSWI3WjU4QklyT0w5aFZ3S0NpeitNNDJzdk1T?=
 =?utf-8?B?cXoxS3BHNE9wOVZCcTNiNnBpN2I0V2ZlT3BjeDVCNnFuNU9scWxaeENmV1RY?=
 =?utf-8?B?ZjZvQTE5dXhMZUIvWkFMeWl3Mm5FNXcvNXNqdHJreDRhdC9JWGpYK1JZaTd5?=
 =?utf-8?B?TTVtQVVCZmVJSjVtNXZqOVRWYjVYRCtxc0xxUmwzVTJMM0VKNFQxR0c0ZWdx?=
 =?utf-8?B?MFJ3WHp5Qm9BUVBrRzgxa1AySjh4SXFmVDhCVXpCb015a2dMQUlScGFYRWJE?=
 =?utf-8?B?dTJEVE1ORFlyUkRLdG5ZN0g0dHVMYzlobHoyR0NWT09aL0d6TkZZd3hSajhN?=
 =?utf-8?B?aTR0elcrQWg2U3hSeU9JMlg3QVA1YjRrM1BuenZKRkdGekNhMzByTmVFTzNq?=
 =?utf-8?B?bDJHYWx0MlZUT3FVK3ZnSU1GR1hQbWhNQjZYRG5RTW9remNsYk5WQUR6VXlw?=
 =?utf-8?B?T1c0UkRqeE45eCtxanhpYllicXRHa0hmQnVDZ0pNdjFRaGVhMkd6OTNwOE1D?=
 =?utf-8?B?WWlVWHJvY2R1b1Y5ZHhmL2ppWDZqRkdvY01yQ0ZkWGJuTzdkakJyN01rb0ZU?=
 =?utf-8?B?RTNxZi84MXdzZmVOOHpST0xCdm55aTZ6cSs1bHNwWEdVYWkwMGN3QVl0SzBH?=
 =?utf-8?B?c2ZyT3BWekUrM2ppSjhFQndlOHpGaCtKRmJWSU9jbCs5NzUwOVdabG1RRG1S?=
 =?utf-8?B?cXp2RDA2VlpGRnlKUjVZeDV3MXNNVHNjR3NoYVE4bzl2eEJPeXJaZExCdnVU?=
 =?utf-8?B?YkpxZkM1alJaNWJ6cmM0bTJiNHczV2RtMG1tcVFoMERZRGJwM2NuRWVtUWxU?=
 =?utf-8?B?NThyNHRwZnB4YmZkVjRNNTRHL0hnajROT3JFRmdqaW00cUZoam1kQWxkS3V2?=
 =?utf-8?B?dk5HVURZaUdhZFpoeHQvZitCcHV3eTZFMDZndE1JR3VaQWZJdVRKZk1rSXhh?=
 =?utf-8?B?WVhDUG9qdy9xcmkrTGRiKzBabVNRQmlJQURxcC9uM2tHRnp1TmJEL3B6ME9p?=
 =?utf-8?B?aTMrNDh5R3ArMVp4cXdJMWVTUUU3ZlJwS2FjYzYxbkdCMlNZVHBBSDNTa1ZF?=
 =?utf-8?B?S1hiQmVpL3V6c2g4bU9NWVV5RytISTFqQUtRbVlzME4yY28wWjVOUkNLbnNR?=
 =?utf-8?B?ZVFNczhZYWhNbjJReHo0a3ZLRmIzb1h0aVVWZURXcGVnTVNHMU5LVUNLRkNU?=
 =?utf-8?B?NXd0Q3pvU1FLQ2dHYStiWk8vMUNaZ0JwRzV0YWhMcGllckJaNHYxUmxyT05T?=
 =?utf-8?B?S1NrQU5Ua3QyTHE3S2ZZTWdBcy9xWjdkWnByZ01UcWhpVWxuTUhZYUZIZkRn?=
 =?utf-8?B?NURnUW1UZVBld2x1d0FiLytpUGVZYndUclFaazRDWDFicTBVUGJoSlB6SWls?=
 =?utf-8?B?RWF0K1JpMmVpeUxYUGdIM3NzbFBGMEQxQXc2YWdWbmZEdTdRM2w5K0hGSi9a?=
 =?utf-8?B?QjFTNnp2SU9lVVVDOTdvcmphRU9WemlXbGFwb2RIeUlzSTY3MEcxRXhuMGV5?=
 =?utf-8?B?OENrc1NhN0dlemNQV1ZhL0QxZXAzMEJZWmJzZ2JwMmtmZmlxY0Y1V2RRMUgz?=
 =?utf-8?B?b09FOVZyemc3czBVSXEzOEI2cUVCd3kvSHI5U1oyRC95OVM4amtpeXM1WkFs?=
 =?utf-8?B?L1llTXhlR05oYmJudEJDVzl4QlFRai9uMllTUXNTeVJRNFNYdG4wRVFRU2FN?=
 =?utf-8?B?RkM5dXVQR0o4aHhqeUw3Z3BYTnBFd09sMnh4dWloa3piOUNmWDVsM3pyUXNk?=
 =?utf-8?B?Rmh5cm5CMFNlaXNNSHUySWFGL2VjdGZ3M0ZvbDBDbzhXMEtienVzZWxINzUz?=
 =?utf-8?B?UTl6UFlZaGJWYW1SVU5kYzlyUVUxYTVhdFI4QzROTFkzbHlLK0FmSDdRSzFV?=
 =?utf-8?B?RFJPbUJaZC9xTjh6RFZjTlJuQXRYZ0JQUFJyL3N0bnhIZjgxdjJFYlQzRzJ2?=
 =?utf-8?B?N3ZZQjZCaEpVWk4zc2ErUWxnSnJSTVhMTzhHdERWSndTMTlkUWpuK1BwblAw?=
 =?utf-8?B?dVVvQ1VydlZWamx4M1pFa1NxdTVIcnB5VExGNjdqRHhtR0dsdnpvdmdacE5T?=
 =?utf-8?B?OWVIK3pMSG5uTk40bzh2aTVyNHZTWmRna1dFRDdVbU9Mb0hPV0lGdUttQURn?=
 =?utf-8?B?c3BFQ1A5TysxT3dhcnF4emVVcW1ySkpOVy9QcU1qWkJoSldFdVNWTEx2ZU5h?=
 =?utf-8?B?MS80UkNUN1MvSkVLMW5ld3Y2eXRpcE1Pd25KbGFSd3dyUDRIK1NWZz09?=
X-Exchange-RoutingPolicyChecked: M8L4P+XiDqnJCNFwT/LEMGnOuoqcQ/RK0ANYiPbBVJYD1vMEhZMql+pWTFQoiSL+pWxkxkGKzWSJhjQh3M1us+x4daTJxIZx+E2JNE9kp72P3D4/OGiEq0CDinb6JfU3UyK6nyhw5Xd6WSizew4VS+jowGIjjFhxh9kItjPjIPLBL9IAunaL5HtCmQ6zl3eR/kdcIl2A7uEFyMeIQK+2e41asiO8rRjIimhlGs1iIh+bGISclYcWa1fxqo773rCDAVf7xw5IiHoXbGIYKPH8Ey14RlfAY65DIlystDM/L3gFHrJrnSwJRyzzR19f0daebQzY0ugz5s/M7QPQDQd3mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d555fc2-9720-4118-f9c6-08df3902eaad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:01:20.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rzTjcwAyXfes1BPvaD716elw3Fu3zmTRPXA8Nl6qYFzX0HX2/t1Bvxio5m+h3JUqYLzIQ7nt9WICivnm//PIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1592
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: PF1sCCY3S6TJyFlh1CB9pe77n-Zm4hnS
X-Authority-Analysis: v=2.4 cv=GciCDgXL c=1 sm=1 tr=0 ts=6ae8c1e8 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=MvuuwTCpAAAA:8 a=3HpvYt5yDTcuTcN5bBwA:9 a=QEXdDO2ut3YA:10
 a=NDs_viFCBz2Oby9BSF8A:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NyBTYWx0ZWRfX53B/Lvht50xj
 yB3ybEPyW6hs2yY4x94WM1C+Dqu3mZXeZwRz7gfMrxgk5LVaoplWaTRoERG4YSNDmfqj+ZcI9/4
 KKuSpprzx7WhRG/Qz41sGuitBSx5Lbo=
X-Proofpoint-GUID: PF1sCCY3S6TJyFlh1CB9pe77n-Zm4hnS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NyBTYWx0ZWRfX/CjXz8w5VJGx
 5wmpt24pzLQ3b4IL4SRS5sn/EmXDavXDsrQRnRPQO4aOzMfq6QXZnypwg2YUhqC3xJMqbMvBOBz
 sTSQVAKVsxyzBnYLTCb+0y6sRlQtHYynQwiOKpjNuE7ZiHoTYP5HcHO0euS28MdJhh29LUKzS46
 uwAeyWLowB34a6SsGvp4P8RHNIecdn797oY02d/YT8SRCa4DSPyHCcxKPErFZAHCXxwo5QMMjdl
 iAtPTN/+Jsntm5FPmBviERLvPoINZ+rw6vA0zxWRQsr1FFncF8iV9Kv/WeXoATqhFuxAhpJAtFR
 KWVRSDMGh9bFJDneq0rp1TJhwGhS5j5rUqSqLrrDMq1MLD0yAFS/vWxFQeAnSwYfx+RuRLZ91oM
 awVLX5UXWdiw+WWIs6iZJ7NtP3SG4Cseyk6/5KZFfXYvw9zM9k4SAAYNm8SYT1IEEmQYQlWk+Li
 l/UrHITwGnktZNDCF9Q==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020067

--------------PJ3KrVQMJX0mQFvSVKLi0x0T
Content-Type: multipart/mixed; boundary="------------LMW2WfLcgOAS0tB4YQ1xlCYX";
 protected-headers="v1"; hp="clear"
Message-ID: <f235dd80-477a-44ea-955e-93252ae4e7dc@hpe.com>
Date: Mon, 2 Nov 2026 09:01:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Guenter Roeck <linux@roeck-us.net>, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Sandeep Bhoot <sandeep.bhoot@hpe.com>,
 Iraimani P <iraimani.pavadai@hpe.com>,
 Mamila Santosh <santosh-kumar.mamila@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <71e3083f-c845-4953-80b7-38682a4cd84a@roeck-us.net>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <71e3083f-c845-4953-80b7-38682a4cd84a@roeck-us.net>

--------------LMW2WfLcgOAS0tB4YQ1xlCYX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/1/26 7:01 PM, Guenter Roeck wrote:
> On 11/1/26 17:02, Doug Ledford wrote:
> ...
>> We ran sashiko, but I think our prompts might have been the RDMA
>> communities prompts (two different people on the team ran it and we
>> merged reports, but I wasn't either one so I don't want to make any
>> claims about things I don't know for sure).
>>
>=20
> I briefly looked into Sashiko's public responses to this patch series.
> It did report lots of issues. Am I missing something ?

Our only allowed AI inside HPE is Github CoPilot.  You can select
different models, but those model selections are just runs using that
models' SDK.  Selecting Claude Fable 5.1 is not the same as going to
Claude itself and using its service.

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------LMW2WfLcgOAS0tB4YQ1xlCYX--

--------------PJ3KrVQMJX0mQFvSVKLi0x0T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmrowdYFAwAAAAAACgkQuCajMw5XL925
2Q//WSLs+FfCAn2D4WYKlnwk/liXqWFvevCo+GvDzfYMEx5vHSbbZGI67E03w+FKUWPKuVATOJbE
wekIYKQOQkkXEvcd008UwPJjYjPzttyJiG+WOwoe1nzbVvoImPHqgWFi+RIPTbNjneBoL/H1fsGM
wYc9A8vzdxgSGDZNHOAacw9YJlstjhnhf6vK2mXJF4wjeNvUA+Y2RYDo7aPDXrUi2esXQgyfQ+C/
MHBWtmAFTsGFcdCGEVR3owpPqa5sj4URbl6F3o4EtETtQzBOmntKGd4syrzxmI0SSodpmrqduQPQ
dhoR21AchKOvq29EhBpsX7KSsd1uJumM1ujL8RP1t1P8pNP9PX1FgxsgPD7Zsu35E0w6p/eb4T/d
MXCJmgal/DCCvOR4WEdMCu4ynwEpIw5i4+fP4Jh5233fgcjnJ4VVuk+el3OwLG5hJOdRJUKCop0C
dHELOng5PkejROnrhATl5DiZyuhgq8dNjpleOI4xQzF4h6VAizOOmaQ3RXNdGv9+oH0L63n+FtP/
ChAeerARXohbhQsHq4fBJ1UsEbZW4sGHKrgWwyKQnjMPpmMespD7dDsdqFDaRvvqT10cG3dZJhp8
EF/fxuHt/UodK1rIs54ztlDu8yNvHwdpM9aMFb3MftV9m+SZKjdOexKACqglFX/x+RajVP6RLA0z
bFI=
=m2JC
-----END PGP SIGNATURE-----

--------------PJ3KrVQMJX0mQFvSVKLi0x0T--
