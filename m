Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793581372;
	b=yJCH/qW4OTX4PDR7EgUwMSrCnSRc+rVOLeS4x+upiXWvON9LcSQJon2n8bOQnL3vsFW0
	 xkQE7gDZ5wgjfH6X96DUrhDCDm4KYoFEr/GBQpLyEiCIcREgq3Oxf+UtATUSHPtMNOaeG
	 u4p7NM0XtV4Cc2OjbLlA2iM+vooFH419GI55qi115cUMfKRSl8iRmiMQviubv/+Wv6P2X
	 JIaLxBGljqwrH1VwN4rlE1vkuzSbDe4d3HGYYNc963jJdSg2aWUHxWoYohDnO/l+J3Pmr
	 qHDY5qLi667IAFNM4XAa2hDOvHlarKLK9Vifl8FX5Pz3DdBVQwngWB43mZ3PNEtIBaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793581372;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=05EPFdaIMREWRw1aYVPJy3pq3ktgnRgypeHjMG6xaTM=;
	b=5nN2rx07/YSud25WMOktLjOkVN9yjju7EBSdXrpwB0I5bP/g/dhujBDZmY+WgEM4ZUs7
	 efORjXUQJRO5suHBQQ6Pv4KzqlwyefQX2inJqsEFEMbLF5FxVddW997SryIJPE9JCkYO6
	 htFM3xUK7sDCT+ZbKnauIP6U5H6CUompu6HFwmottBb7IfH9zXuPUkRqjDt7YBiCZQt0R
	 ryqbzFkwjyWGBQWo5I2Y7ooCOeUefcdzgQgNETI7406AKgCM7JFHKjsOWj9kf98DCywgG
	 vJ0mUVLdoUVQEgaiDlaRXkrgaykr0ub/xq/WIVcwcZRu9jXMoIs4Z4ymAGOYgLu5Dxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=dgFLBPoA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E41606A324;
	Mon,  2 Nov 2026 01:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=dgFLBPoA
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20Jb1K3353146;
	Mon, 2 Nov 2026 01:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=05EPFdaIMREWRw1aYVPJy3pq3k
	tgnRgypeHjMG6xaTM=; b=dgFLBPoA6kFTNTvUYhEj3u8577ZCrRE6WQAqwuy2KB
	31sW7EVMy9bKKzvkNT/T5em/eLk6RDddE+G4hUC3HIJItRSnlo1sZixWuHk74ICb
	1tq6vnQu2O2DzbZn+a1W3i/UX7yktX6RCLV1qyIEs5DS5LRRT/tRluG8HWOI/w4q
	PBjgUj1fpfCvwsv2xpZ6L/GS7uNun0PcjftVFP/Ob3/81SbGS9k+kehH5Es3pdK7
	6WSjGhwKGXrd0FR3m/WZzAosyt04Bs9cecPoulynq2whRcGilgJj58HnFATo7G7S
	gKjUbq8wr4vwKa65yVsEu9G+cORBiu1auSFfDycUQHUA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hpfb0gncy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 01:02:13 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 34BB2D2C4;
	Mon,  2 Nov 2026 01:02:12 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 1 Nov 2026 13:02:11 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 1 Nov 2026 13:02:11 -1200
Received: from CO1PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Sun, 1 Nov
 2026 13:02:10 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6l2Emvdlo2IHkWor2Huy9FX13T8ixwyCbi4BcFgthMD4o2QcvYSuVWphnmvMG/RPWC58xxat/5FYzOFIpJPLZK6Jga8r0FoyFju1WALhubJI5yK5ilkFXMww1S5TGlrmhGGQXp5Bv0H4NjIBrq7RvsFv2EoJL/N50C/tp0o+oJNWmo7JlNwmW5JdLzLNFw/ToWgROeTSdM15QjOG7ucNhmIqctb0F6ibI9EcSrYLoF/JHrB4EIi6ICnsDqM1fHee47xXwxnRbsSmIDa3IYAtKlL8OeK17lY1ZA2SD8NU/9nNbeajqtd5CG/Pp5pXoQmOBZqQLlljcXQPMmS2MINnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05EPFdaIMREWRw1aYVPJy3pq3ktgnRgypeHjMG6xaTM=;
 b=bAUvQYFq4gkFTyWhxFaafNSMdSaGFX4imX9onZa7J8Hm6NAXcYdDdDc/l4ZbgrTuck8kqzgqNxbubtWss7GSExxcHk5TgNrVTodPrNDJ9h81XkpNmll16UbHQ2CON796+NFz7GR9dSA5HsobcDJALACMTy/7mp0v/SO/SlrlZuHkJ+bj5zh0y61NdzQAi05W8sKGTApoIijWL7FoMGguW8ycmupz4lIOACwgij9OP2lst5iasz7oOd79fQCa6iq1jEXAV7Gbiq2dGWeKl30AovlvIBmtGxaJKVzYgCq4wCvOazqpMtxLEAA8Qxd0prkgEhBgejnAd29gGJimA+TPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by SJ0PR84MB1530.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:430::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Mon, 2 Nov
 2026 01:02:07 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 01:02:07 +0000
Message-ID: <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
Date: Sun, 1 Nov 2026 17:02:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
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
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0xhsujyiF7lgREXLpj25B3ml"
X-ClientProxiedBy: SN7PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:806:120::26) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|SJ0PR84MB1530:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ccbb99-eb37-45e8-5abe-08df387cea69
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|261021121427099003|4143699003|56012099006|261009223027099003|261026121527099003|261028144727099003|10067099003|261022105027099003|261022075727099003|261026140227099003|261021135927099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: R+/b2liWifSR3JpCo+edySrpVHShe9GCvfOua34yX9Hm1Trbl93DZHknFEZXIH3rEZXOqtTVTzZdxX0II8uTpnzOYCBXCnBBOUzRr6gPhyqa8W4Drp0PvyOrbADbpT10valiK5yOmVcNboTRUC6B+9zzR5mGFBCT+DuxDat8+Mq71baq7er2Irek0v6VhG/qvxwJtaZeHdEQ4jCADmkeziVV5ENqL38FkN3BdyUvEFBmzeMbxYTPMjw7SiBAtI3eDkVE0pmswsV88kWwTA6X6iFmzWyUdgq2mwMMnjDJyUmkW8slZvPnhWlFeYxHUtak3Jk8cvf4grCFMO52zPMoTLlR/BEYgBLLtHvy2pqFWJY2C989N+qeT8MYml3jxpoKuR3RLd1Rx0mCfjpU/T/BwWizZ8Eae3g7Bn5Jxct0FeabU+4HHKqETaPzqRvoICC554gz8KZ2ihYUj78ijx/Nzayht/bRsBnIYupqaG1NPOysQ/KdWoAdMNFIyjlUehDGRpEh7QSjv5Ix7tyOwOgbBiCd4oMGPYBGRoYGDPlPeedjAjw7ck6fn+h/5KDZBTHicZkzrKbp98Iz+ZRoge6hxuqPdVAbq+yqOkuzn7DJ/hh8j04vkyK8RViERUU5oyWetmRJDagtraWJ69fd/PcWNRrRN92+ua/VScfcv/Rxc/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(261021121427099003)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(10067099003)(261022105027099003)(261022075727099003)(261026140227099003)(261021135927099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2RWSGtMQm9ob0pTcEhja24vR1MxQ3Z3a3NqeHlXYW5rWktHd0xHTWV3LzRk?=
 =?utf-8?B?cXZma284a2ZnU3o4V1YxMzlqMnpDcldzNERXajBlZmhhRFA5c1lRUWhVRXFZ?=
 =?utf-8?B?cmpDNmdYbUVmOEd6Q2NzODFUNitadUZlOHdXcGhiMUdxSDhEcWVRd09DcjBx?=
 =?utf-8?B?NU9YTUR2bGVVYitHU1YzTzJqTWNuVm1DMXhaK1pCa0xkOVVXR2pLKzRybUY5?=
 =?utf-8?B?ZitOb1ZoY1NmeWZNZGNnUHV3Zkh6UnhsUDI4UHNxOEVYZ0ZYTmRUS0UvcDZi?=
 =?utf-8?B?WmdMem01bjhkOEVxRFJHQ0s4dE1PSWkxYlAyc01XMXN4R3V6Z0toMTQ4OWJ4?=
 =?utf-8?B?ODJGc0IrN2lwUklrMG96Z0d2eTZia3pxU2xDblZxNjRCZ2d4dHN5SnQ4d2VU?=
 =?utf-8?B?eHdGSk1jNWg1YTZ4MFR4UGFhaTJmS3RSMllYeHgyU0hnOXhvbWhYbjZ0eVJs?=
 =?utf-8?B?TjNrZzB0bDhsWC9PSnNoclQ2cFRxeGdaODF5WnV4cE1jSFR6U0VIZXJOZVN3?=
 =?utf-8?B?QmcxYnVtZFh5ZldJcWVkS1RvZS9ieVJZN0F6dkljT25IKzNHdG5oMUw4REhq?=
 =?utf-8?B?SnJScHQ3YWM1UDlmRXVnOWo2NUJYeDlhSGF4VldjL2xFRDlzYTR3UjNoNEZG?=
 =?utf-8?B?YjVyaUF0bmVobHNzUkJOVVBwTTlwZFpzT1lOMVNaK2hRVkVRSU1Gc29TNzVZ?=
 =?utf-8?B?QTZlbGZzYTEvRkpKOFUrK2hnK1RONEtHenVtTkttN0szZENnaDY2QVVqNS9C?=
 =?utf-8?B?RGMzaktqWW1tNndWSGVWMmRPV0lkZmM1K3QwTTFvckFVMEdkVWc2VmFraWtJ?=
 =?utf-8?B?SmNwTll0bFVZaGd5RlNjd2tyV05CR0tlbytLYU1OWUN2VVlNVlUxdUNnZHJS?=
 =?utf-8?B?elhHNkdKNzBxTGlHcjRnakc3aVlxdUE1TjFQZHpGcWJkaHBnYVI2NTZyY0Jv?=
 =?utf-8?B?b1lsNDVycys4bmd5WmxWWVk1R2daRS9SUkJ4NEI3WjNnMnh3TktEaUsweWpy?=
 =?utf-8?B?c2JEYUZPY0NtUVR0WFdDYU1nZUpJdHIycm9Sa1l1Vlk1QUVySEZwaG0yREZp?=
 =?utf-8?B?QjFGai85VWNydlJHOXBHdWVlbGVQWUUrcTFtbnBxRlgxNnBaU2lUOGtBdnc3?=
 =?utf-8?B?Ulc4c2NhbkU5K0hwbGpDWmU2VHZzR1VwZGhUaXhGdWQzMnhLNjhJVjRrVURB?=
 =?utf-8?B?LzdBMCtKTUwvRm02dmFUU2d5Z3VlNm9VdUtRMVNTRENaQTRvbkxQcVM4ZEJv?=
 =?utf-8?B?ZlRjbDNOS1ZVWGhlQkRIVVY3M0tHUzVpSlFFN01oN0QvVGdETnA3NWl3allH?=
 =?utf-8?B?T0VWZGFRYVRsbEFaL3ovRjA3TzlPUXYrZDArUWVtdGs5ZlJya1o3eSt3bWdI?=
 =?utf-8?B?M0R5SlhnN1dsZjdMT2JoUlpJbjNXRmVKL2RRWC9RYWMzQ1lWRXBzY2EwWTh1?=
 =?utf-8?B?SEdNdStmWEtHVGI2TlV0QlBUakZWVjNOcEtPaTF0b2xrMzVQNkFuNXNOajg3?=
 =?utf-8?B?bFVnQUdTd1hMMkdSbktiZjNhbDI0dW9XditlQWd0cWRzSTN3WTZ2RjA1RmQr?=
 =?utf-8?B?QjhkRjJuV3RjVGkxaEdCMTdkblNOc2pWSU1kS0ozaGUyRDl2UU04WCtLY3Rq?=
 =?utf-8?B?d3FqOTlpY2dUYXpMQXdxNE4wRGVhVGVKOWhOQTNycUhUc1pTYzBneEpnWjBC?=
 =?utf-8?B?bTlNUGE0YmN1WkpJVG91MDZpNEFwM3FPUlV2bFR6K1ZlOVQvdmFkUDhMWDRn?=
 =?utf-8?B?dkdwcUp2QUR6ZTZpOTVVNmhDdjNwNitRS0kycmxCN25tWUtaeTNndnhtQVRV?=
 =?utf-8?B?enNYZ1VrZ09pWWxqMWhxSXBEZk9DelZVSHczUlRFdWJDYmVFeUk3aTlQalJO?=
 =?utf-8?B?RWk3c2gybnpRSWVNN2N5OFhaOGVTdjJUZ2lHM2JYeWk4YVBGQWNsRTgwL0dF?=
 =?utf-8?B?TW1GWCs4K0xEaHlFNjh2YjVEU1pqNEVEVFNGY0cyRVk4ZU02b005ek9XdWVF?=
 =?utf-8?B?MitDak96elI2c1hXb1lCU1RNSExTbXJBQVdsNDRET1J1MU9Wd2FicFJybmJF?=
 =?utf-8?B?bFkza1dGYldvbm5ETE9mcUgzZkkyUzhDb1huY01tVXJ2ZDRjVnFHY2FsY2tO?=
 =?utf-8?B?UTZzdFcrY0I1Z082V1dPQWlhRjgxcVpiaUxBNVhOM2dCSEZ1bzNqZGtMNURC?=
 =?utf-8?B?NC9EU1F0M0hleGlOdE5vS01EaUJjM0RmTFRreGtzaVIzb2RCSW1jckhXOWRV?=
 =?utf-8?B?YWJneXh4azBKWE1sR1lhU1cvajlGUDdOUy9majRwRlYzM3YxUElWQXN3RTZF?=
 =?utf-8?B?Ui9TZzh2K0ZTd0UrSXQwdmN2bHMyN0pjM25NL2xFRTV1REVxQmpmUT09?=
X-Exchange-RoutingPolicyChecked: aU/GA8rOg32pHJmHfQCykTuZ31tntZ0ZWG+ELI+a7WOSyOzZlfCZyVkeo5fmravdpRiG31oNMIxmYlyWqer+uyQiktUGODtdVgcdGgP+gu2Nm6OcpxPVSZfs8jieWcUKGMbaxYjHQ5jdLw7vUKrg+QS+al8MdcNb/gktAAxMQ6QBPVQTdCVuP378KuVL4fAju6mvcHPfGuB2sYrOR2Oy1S/yEQIjbvIVXqDyKi8y126WzT91xhp0lfr6/ZvmAzLfd73asmRCCxIZdZXSOFdZku15cgUNDRd9bsr/we1D8C2LVOr9T/v9uM256vM2kxErSCXsjcd2jrC3De2Y/TMgtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ccbb99-eb37-45e8-5abe-08df387cea69
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 01:02:07.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fDS6B6jTWv1rmwljWNRQvSogWzs89Y4tJZkn+IPTG4ueV7S1gFbw31IbdphO/QIRr/C2/fk6zqxvq+KOt5DMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1530
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwMyBTYWx0ZWRfX07dgBTvkEZtF
 bulgYZRRXVqx3EAHtKmUDjNiQzZ8w5MQYS6vXyj3s8lebJGj/ql7qjDdogr/HRoCD7PsajHIal1
 AYQzgEf2pK68erh79ZgUdeVhJa3MLDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwMyBTYWx0ZWRfX/wbK27kQLBTa
 ZmZBHlvLMmJ9QI9H9sw5s34WtWso2fVwl3txIOeZ3UupSKY9dOPIsoucGdV8u8rSizWABDkQWmg
 GAVnsIu8zdGtUNtBdS6Tn7UsqOIPf4z1ocwMojsInuyemRSi+NCrk5H/H8tA7EaMu62mzwLVUa+
 I01B5Lmcr248ncNOvr14Z7PyPXNnYGhf5v0mPK29k0k8GsPXQZHwA07Da23Ss201JL35MJonl78
 dfpKo9CNSwlEoitBer5BYHgWCe0t+wLKA4JCrtRuCE0tigXoPgIalHtKrgJTLmM0VwQdUXiMXy2
 n2qPS62pz9QmZx39fJsODznGMHPlVBSuvnsEQBs23nlF990voV7ks1zneDVqdRGa0/qftnL0g7d
 qJFU9krr8DJsKF/+mPauZTO+gDDamTFdCUQpesbv0z55jiJEvX+TsH3qfEVaE+L8cNnAz74Zfhz
 Cl8b4ukT27qZFYdOsvg==
X-Proofpoint-ORIG-GUID: wUQ_rhs2w-ttABsNC0cxzZvjC_FU9XVy
X-Proofpoint-GUID: wUQ_rhs2w-ttABsNC0cxzZvjC_FU9XVy
X-Authority-Analysis: v=2.4 cv=IKqXmQvG c=1 sm=1 tr=0 ts=6ae7e115 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22
 a=MvuuwTCpAAAA:8 a=vNKZyahQXqDDk6uMEVIA:9 a=QEXdDO2ut3YA:10
 a=uI2ddhFrDJ2o12NlXlMA:9 a=FfaGCDsud1wA:10
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020003

--------------0xhsujyiF7lgREXLpj25B3ml
Content-Type: multipart/mixed; boundary="------------fErkd770Edv88cvfEMsD18Bp";
 protected-headers="v1"; hp="clear"
Message-ID: <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
Date: Sun, 1 Nov 2026 17:02:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
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
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>

--------------fErkd770Edv88cvfEMsD18Bp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/31/26 1:17 PM, Andrew Lunn wrote:
> On Fri, Oct 30, 2026 at 03:11:21PM -0700, Jakub Kicinski wrote:
>> On Fri, 30 Oct 2026 13:58:56 -0700 Doug Ledford wrote:
>>>  416 files changed, 185137 insertions(+)
>>
>> =F0=9F=A4=A3=EF=B8=8F
>=20
> Yes, this patchset is going nowhere.
>=20
> Please throw out everything except the absolute bare minimum.
> Ethtool, is not needed in the first patchset. All the UAPI stuff is
> not needed. All the sysfs stuff is gone. One PF, no VF. All the custom
> debug macros can go, etc.

I'll see how fast I can get that done.  But "the bare minimum" is going
to be more than you are accustomed to.  This hardware does not receive
Ethernet packets using MAC address like normal Ethernet hardware.  It
uses a special portal table entry that filters in the Ethernet packets.
It has the ability to have different filters that receive different
Ethernet packets and so sorts them before the driver ever sees them.
And all the infrastructure to handle the portal table entries is
required just to receive any Ethernet packets.

> If you manage to get that absolute minimum base driver merged, you can
> then start adding patchsets to flesh out the driver. Eventually you
> can get to the controversial stuff, like sysfs, uapi, etc, and you can
> argue your case why your driver is special and needs this.
>=20
> And as a bit of an aside, how much has an LLM been chewing on the code
> and spitting out issues?=20

We ran sashiko, but I think our prompts might have been the RDMA
communities prompts (two different people on the team ran it and we
merged reports, but I wasn't either one so I don't want to make any
claims about things I don't know for sure).

Regardless of that though, the AI engine that you guys are using is
clearly superior to the only one we have access to inside HPE.

> The prompts used by netdev are available, you
> can run it yourself. So you might want to address as many as you can
> before posting code to the list. That will avoid you reaching v42 of
> the absolute bare minimum patchset.

We did.  We fixed right around 200 sashiko findings already.  But, your
prompts would help here.  I know that HPE is looking at adding Claude to
the allowed AI engines, and if I can get early access to that for
running sashiko it would help greatly.  I'll lobby for that internally.


--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------fErkd770Edv88cvfEMsD18Bp--

--------------0xhsujyiF7lgREXLpj25B3ml
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmrn4QoFAwAAAAAACgkQuCajMw5XL90d
Rw/9Gh+bbXGsg1rOtUJP3cwsz80fQWYbUwolB2loV9FNmNM/aKs9jEgl/TB6y3UdXJqETm80bBOp
VOXaOv6vI2LocSYC3L2at9PUswIKtWyoZLpqGfhTEH9sSMzf3897u1xonwu/LPRRBBTDONHqGKWj
c3736+4WFFqsnq9FstpzYiJvHbCptxlnlyFKub3QqrStjoPAyLsV9/fCV7g6KC5sCRz4u6TV5GvA
88WYYGz3lxCrBgX2djVqQWzS9DPfCHT73+SRkzvdwLgJ3vJMekq5rNM0E/+1KPq6CM078ljM4PQk
55QdMxUa+NhMVuidf2fCg8JYPDpT5OmFvDad0GEDKjHXU50RtDYE/ZCXRtDj0QMy0bLZQZS2Kz6w
m61q1cDFD9fk9mnxjEMWUAB/0TXhMtife6X2EKb3FwB8NgYQhYDu8bQiSr2RNZhNobD1hW+bCTYM
4XuCt9rH/F9QMs/pj8ftTj8e2PW/2GL2nXgL0mpJYwiHaZzc3hhBxQAf6iGuraTAtFjJA01yZjPr
MHFAmtQDS3n6MnSfW4/M5rTAO/1uJrmM/3w6DT0t2nrrqDpYUQ80mCotvjYGewORCAKMTIPLyL7H
N8mmfp1lf0AZ/Ln7f8DcEL0mz2huNKZ6erGVXsy+n8Ud/V0qTz3pKgXZPxK5ckOjLLoYytAyo0ID
hC0=
=0nZC
-----END PGP SIGNATURE-----

--------------0xhsujyiF7lgREXLpj25B3ml--
