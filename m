Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793643183;
	b=J4INGXjVbDJputDwUD0BOws37sEby1yi33MSbr9Mw0+vl/QvLG5GZaNWnamp5xe8CZz8
	 7FV5F/EyxtjAJgalyBzJFrlgXf119c2axj+f2NsyACfLeMfmxvdJDcEpMIjm616wuUPuF
	 Fz/DbZ6+2a2fuCDRtZ4XDu1wkB+JPHYsvRgLCi1HZT06VFGNAlMMSJ8Ct4ksTSVdaYuyF
	 1C236msSWG/pzonaLEwtCu07k/Xs05Ge6/c2CsTiU0BKgl9CwyVzm4fgqBQmHXOGDlyj2
	 gxzlp0iCYJHdJ/TKMJstEDEakMEo523DjVuziNruxUdc2FmcFAnRkUjoDPxbJ48hhtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643183;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PRoPlXjl3t4LAVF6RXMSPDUUBiPcgH/DgHx2PwnIygo=;
	b=k9jaahpUyOFp6KM8FmVx/WZ8zqK/hlxl1Gfx0DJN+8dol3w02skRbBjWSnhwZPcnErmG
	 2Ua9fn27KH4rvdx4krvo+5mYKrbTd0E1qNfxlXXOWVTUexXmU5/D717ga3jQaZSIBiI/h
	 eJ9/aa3d+rw1M4u5HG+pO+K7+2NKSNlGj1UI3OzVDGN7hOEa8LuMUhbrrqvaK5+f5PeEN
	 JR4PqwXN+skNI7bmkBUUMNdxi7a5rb0QpnnKZvU9vxJdsjH0KtH5/iRCd+E+0i19cz6Zf
	 BMKzeRWTNnogLNnIwIhI5trEdomXQm14VavCj7DcixxVF/tec16mGB5no77XuiJegvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Cu7q8tEz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE520606A335;
	Mon,  2 Nov 2026 18:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE520606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Cu7q8tEz
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HRPgT1184913;
	Mon, 2 Nov 2026 18:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=PRoPlXjl3t4LAVF6RXMSPDUUBi
	PcgH/DgHx2PwnIygo=; b=Cu7q8tEzv0HjyHO9mkJ0m0kg0O3z3P48orqjWjPvhT
	yj1dQYf6+Af+V6S5SwAJbm78CnPyD4CSZ7FkaBJOUk8gyGdPXjGuV4hATdpgy2G1
	+85lAITeM5WVZqO/q3NAtFum8umZZUIU2GPzbv0DB7z07Q9Ix+OstDpwwY+C9sEJ
	sgNeS6ZRd2HDSvAnXQGW5TSjBbtU7sQ0mUVhh7YeajA/ISewuSCE9k8frab/r5oP
	foBf8K7mUZtv2to2PF3rKeq1kU5VpovtQM8oFL1piZ4WXF3PiiAauwZOfeEv5mqP
	RTJfCgKaA1R8y7wtJq1/IDY/RHEXT9W2C4piN/CjKRbA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hptacw0hs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 18:12:38 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 3E81112EB1;
	Mon,  2 Nov 2026 18:12:37 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 2 Nov 2026 06:12:37 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 2 Nov 2026 06:12:37 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 2 Nov
 2026 06:12:36 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6lbe8Vw/c5qLe7y6kxMYu67XlgzwM5ESW6zvcVeaf9TUgDCtv4BG8QF+kGwr8MjrMR6TQ3EPHuftXHzRLFQwQWkQiHpPs7D/Rut7lxel1RubxEDeQlju3efhWiYifpOGzJ+6mzpaCo5isv2ixtejcy/zOnP9kwqpr2MZjYucerfP4qiAQwCX0zMc8rtlhApHN0WIph6HdiY1aWXTNXg429dNlWD45zmZTKewEUnJzzUHwCE3C2OEYkPrq724GEQfKXguER8XqALaf3yOxm7/BgWoYDrP1nKjgOKhQsEdZbmvKAlZhwOE1p37ZyaBg4nFTx87OJ92o3U/TWZ15ib1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRoPlXjl3t4LAVF6RXMSPDUUBiPcgH/DgHx2PwnIygo=;
 b=mExof2r3WBkjgpY9mleho3zHiV6JhvU6VprIGlFNG2JSDyIUAafkr50FUiK3Q5dw7SFTlSNN6OUN1GlATwfhLNe1J3vInPlshJE8qAc71Ch591CnNvc3ugjO/VzwqxCfpoMfW3N84Dn6kLdr/egi1WMZ0IwktNfSD7eUPq1dYyZzzk0CwdFRQtykj8BhmieStg6n3z36byddQwOrawLQSXdwP2sLJrLXA8QhY2z91a7OrR6DB5fVWIZsr8OB+fyBnIsPtMuEz+ctEl80xdmIqO7X3wrHGQytAzVWyU0WWdscslbAybAr9pamKxo+3lUmkQKVaAnqSrX0PHXDJjuV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by DS3PR84MB154389.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:613::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:12:35 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:12:35 +0000
Message-ID: <e84ee7d8-ce4c-4e46-9ab4-0ac4c395171e@hpe.com>
Date: Mon, 2 Nov 2026 10:12:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Andrew Lunn <andrew@lunn.ch>
CC: Guenter Roeck <linux@roeck-us.net>, Jakub Kicinski <kuba@kernel.org>,
        Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
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
 <f235dd80-477a-44ea-955e-93252ae4e7dc@hpe.com>
 <a5ed91f4-7d53-41fb-9661-ecb4507089b7@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <a5ed91f4-7d53-41fb-9661-ecb4507089b7@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sKuCN7WBtPTAqAjPnYMJLvU7"
X-ClientProxiedBy: MW4PR04CA0301.namprd04.prod.outlook.com
 (2603:10b6:303:82::6) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|DS3PR84MB154389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0543e8-7537-45b8-8c8a-08df390cdefb
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|10067099003|18002099003|261102123227099003|22082099003|56012099006|4143699003|5023799004|261022105027099003|261026121527099003|261026135527099003|261022115727099003|261021133027099003|261022075727099003|261009223027099003|261026130827099003|261026140227099003|261022113327099003|261028144727099003|261021121427099003|261021123027099003|261021130227099003|261021135927099003;
X-Microsoft-Antispam-Message-Info: uzXqYrhrhaY2nnq6jjdoiPg+dY7L3nsL9OgRWaZuwo0Z0io2Im7bFkRnseh/dtcOBYF8Ya3PJe72ku3IApQmABrO4cPC7XoxrRhcc7BEYiv/RiK30A8vmUZE0diIaZx+uv9RUlWgS7KpFfX25XhW7wKmMaJ2gPgG6Vz0hNXQcrDX5XlcjM2NGJkDV5ouwbRrH0+XSqa7p/SsF50p0H5BPN+jvdyWUWk/7cks+oFqNGhmVKSkJuiVIP0M0OzPy3TadeGkbg6PK88OHvTyoGhJdTUm6lPRv6l+zYmavUC+aBj/wcic7Kc3MuGg75hd6Ps9b1mtfup2e4nerCPZA4pqWzxWg0uT7evneMXIVz2P/kipXTI3s8640FL0Ibi2CP9MvjdROd0nRg5PS9x9WIDCWCYk32tOJp0qxfki+Etwf5JFiGeypA4b2ItLvgSAF0sZ2+MX870FsNP/Oy/mCYvtBVyicmr4OibqapO2zx5+u8u+eLul1tCRA8hewDsgy/3Vw+mosyk0G3BF+kmXYZ3MeNalzWr1CbdrLAZZ5+ydgcdR3Q2j/43xqp/znxENNEXtH4pWGpVj0K5LBZEGpHm9+3E7jJYP3XiVJj9scezeNjwpDHVfHkgoWddd2bGlelZF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(4143699003)(5023799004)(261022105027099003)(261026121527099003)(261026135527099003)(261022115727099003)(261021133027099003)(261022075727099003)(261009223027099003)(261026130827099003)(261026140227099003)(261022113327099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGtKQ1BnS0VaN0lTU2N2aWRNM1hkS2wyK1ZVT2wwdXhOcEt4dWYvNXQvdDI0?=
 =?utf-8?B?L01TYTFaL09wVkNhNFE2YUwzeUtJQ1RSQU5KZDNMV3JmbWpKUkZpMTZySXZz?=
 =?utf-8?B?UXM2TnRYZGZPWTJnTHpHZ3o0akhsSy9ZMmNJMktsNElqTDQyM0xBek5Gd29M?=
 =?utf-8?B?QWpXVkJsYzh2TkxZNzc3YThER2VRQldUTWo1cWVtRjZCaHdGUHQxWDFBOGNH?=
 =?utf-8?B?ZDRzaktZMnAzM3FNVHlrNEtUT1RITGNsTy9hRTMrTmltTUI4Mit6b2gxMmVV?=
 =?utf-8?B?TjVFSWNLYVBFYzd5NGcwS0wrN2luWGhSdVdLOTVwK2FTTUR4cVJLalpXODJ3?=
 =?utf-8?B?VlV2a2R3VmlKMW1NbkQzSkVsZFVtLzNQbTlYbHV1RXhhU3hOU0JQaWV6YXpT?=
 =?utf-8?B?UUtGc1pwWm1pei8rc0RsY09lQzRIbHVKTDJQNXJweWkwV1lkZGdZUzI0MVpU?=
 =?utf-8?B?U3dPQ0FRa3Z0YzZQUHdDYXpDNWdSTGVYY0dpUzYxdUFxOFJydEhFMDNtTEd6?=
 =?utf-8?B?a1NHbjBQYmtVU1U0RlhYb1BWL2RXK1N2dENVTU9PeDdXRGlKVHd0Z1dnMkJJ?=
 =?utf-8?B?eDNYYllianFRYzIyeThZQWR4RS9SbkpzSGZGQnJ1NXJ0WTZsMzIxbGxNNzI1?=
 =?utf-8?B?Y1N5WFVYRmdjYjhCM3d2V1k5WmU3eVdJZU51M2k2dlVOejFCOElUaGxCSFVo?=
 =?utf-8?B?K3hPV0NjUHE1TlBTc0Y2L0tpUzhFc2gyOWMra0dtVVdRczZ4TjM4Yy82UU1t?=
 =?utf-8?B?RWhMK0RMd01KR21jaE1GQWxYQWRJSXIvM002Mmo2QjF0TnZzNU9ET2dybjZV?=
 =?utf-8?B?dHpKRkhLdzZDVlFJK2NpYWZqQVc5bXpJRWJBYldlemlaZ1dBRTBhSDA3Wmky?=
 =?utf-8?B?L0tBdUhLVldGQ1FoRHgxQzhjSmQvTExVOGNYTjYvUXMveHZqQkxFY0VseFZp?=
 =?utf-8?B?L1NkRTgwQ0NLK3p4SmFkaVA5b043Q0RXZWFUSC9XRk9aNnVCazM3cWlhVVRM?=
 =?utf-8?B?UGpFb3NBQTFZMXE5d3JVME8zd0I5RUdtaUdGeVkwb3kxUWdYT2pIa2lCN1Vi?=
 =?utf-8?B?L0RQOGdodmd0UjRIYmNBQWFGam9VWkxxSk1Hcm5TclFzOG1LRWE3bkpzMjNq?=
 =?utf-8?B?NitFZ051aURxcFg1dW45czAyY3BtalZjN1A5TTh1bTlRN0VXdHA5SUpGQngr?=
 =?utf-8?B?a0tDdFFOSHp4WnhRQ3NpYk1PTkJiNVpUdE40UXpUcjNRSDg1Yittczd6UkZo?=
 =?utf-8?B?YWJGc3dBd1J4WHdkMURCcWdSc3B4cS9BaVJHck90WnIrMEhxbGFzU0c2ZkZ5?=
 =?utf-8?B?Zm1na2dJVFluZUQ1V1NsUzdPWXlGT3Y3bGJPVDhhVzloMGlyRkErLzk1M08x?=
 =?utf-8?B?UjJWZ2pTZTZjYzRNWnEvNDVkclYyR20reldDZTZMZitVdGtRbTkrSWppWXph?=
 =?utf-8?B?dStVUjdEZFlJUDd4akU0Mm9EQi9uRWFlRS9RRXRCbnVUWGc0YTUvZE1kYWRX?=
 =?utf-8?B?ZUJndm5NeUZwblB6c0hld1hUdjdoeHEwbVd5RjM4czdrNVc3ZmYvR3hHcS9a?=
 =?utf-8?B?NVhPSSsxS0pDMjdYVjJOa0NhaDROQUVaL244ZENMdWNUTmpmWlI1UkZ3NU5l?=
 =?utf-8?B?REhQU2R4NnMrdTV0eE15ejFYWG5vd2VhZjd0U1VEOUNIZmNka2ZYRlgrbEVu?=
 =?utf-8?B?WjB0TmFBNXJiS241UXA3UkVlVGtkTmhPbzJUc1JqWkpvdnhnbWxFSnhUMFd1?=
 =?utf-8?B?WGM4Q3Y4MnphQmsxTjhJUU5YYklleXdCZHJYQWdQamJrZjBSdWJwMlg0WFBs?=
 =?utf-8?B?ZjI0NU9kUlBoampFTXNsZi9qVEV0S0IwdkhnUmdxQ2VDRGRlZGN6TG1EWVky?=
 =?utf-8?B?K1VWVEsrc094SE9LejltRGFIbnBwM1BxeXRRS2NRa0t3RVFTYm1tSmRMSEVp?=
 =?utf-8?B?WTEyNVY0TjdjR2VpUG1Wa0E0UmtuRmx3QzA0Z2ZJZTRuNkNzeUFQcHJVOXVj?=
 =?utf-8?B?c1QrYkhYL2V3NGNSTHREenBmNDZzM1ZsdTBqZlBjRldFOG5EbE16ZDYrbERZ?=
 =?utf-8?B?ZEZSV2xPcUxMZXZZME1MQ3c0T0hyQ28waUUyd3kwUGt1S0p0SnFqVHNacnIw?=
 =?utf-8?B?K0VER0dKRWNaY3NXekxIdzVCR1g5R0o5SmdpbmNaR000RExCMUhVYm4yWTBZ?=
 =?utf-8?B?elhaNzl0L0hJY080aDNPVk1HOVJTQmRnZ3NmZGRvL1FNWDg3T3JPcHBOVFI4?=
 =?utf-8?B?UUFWcWt0aEsxSlRkbkxTb3RaNXRydFhkb3lwOXRSQUliVVZScUw2Y1VJRUpH?=
 =?utf-8?B?RS9GdFlnWCt0cEhXT1JFRHd0ZmkyMDdGOXRXem9WanptcE40SHpLQT09?=
X-Exchange-RoutingPolicyChecked: e1cvjWjUhLTKJkhTCNoqNTIORqLB2ujhMnszgFge9Yc7efuvqmS2OjHMPFWJM7n9EjP47VZXWE4BIhA0jAjs9G0g7Uz/rNlfPHL2Z6e9JKRr8zuc0QHMbi7HRpi5f1tXDaeqBIx3wqz0XPncHENL6Ej/7UfKMzyMAFf1vvXH0c1xi8qZflVvH1jzxNjxMWKHacvMtE4a+MB/cIp9pP4vsvQO6PsXsXy6/H1wasv10iFMwaBiZdceBHBFCjGmVpHD262TJC+i0NKykWlFELANI3esMLGF5ms6ZjaeBmpH4XjkkaWAuXJdJAcN/Ll18YAzB96c/Z2ztAbPa1heXZ99Fw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0543e8-7537-45b8-8c8a-08df390cdefb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:12:35.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3w/pzG9YTLfmlGprJaRYSevBAohLI8ja51B+KKzoDQAUI4+8SQWmnGkiBKY2lBKsMMeGznVIZIp00mudEpU6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR84MB154389
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: JEsezfmS7e51aG4xKdR8m1XbZIlSP5Rn
X-Authority-Analysis: v=2.4 cv=BOsmP1QG c=1 sm=1 tr=0 ts=6ae8d296 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=NEAV23lmAAAA:8 a=MvuuwTCpAAAA:8 a=bj8I2y7isGOOjO9gwugA:9 a=QEXdDO2ut3YA:10
 a=srla9YCtZrMl2oTaeqAA:9 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: JEsezfmS7e51aG4xKdR8m1XbZIlSP5Rn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3MiBTYWx0ZWRfX2pmIxexaDx9E
 77Tk5XFRH+x2K60cnHs6rD93m4MNRitNpTxOScyjOXEw8IHsvwtEAZHh4AYaqOm0bYrLFOFJk4K
 mToulK0+tUC9xG/m5DAzsOLo1L8DJCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3MiBTYWx0ZWRfX3uTpUu6Asyn9
 YzEhevonRR/T7YY0ZOFD2PEsUDyZ6jeW681jIRcSyuEvlXRaRNVe4rXOt9oLdGD6ZI86FcihF3a
 WD+kHXw5MseWwDQMgGVgN71NeMW+Q4EhIjwEASS08nMOmeakcsXgmYonmC5taG/EFYREBwE/jWl
 V+NP4z0ZhJji3Jh/yJ6SQ3MGIk3+3dn7A5mo8AwqHd/U1DDcsv0fWQVM418hXU4ayS2v6y1I3yA
 ex8TxfUi7Jzp4wfyOmZnRw56lnkowC+wNfoYLD+U2IYDNWQhvDXGytI5dqaPu842ZX+rzNJHUYF
 hXMBx8yFiYtyjjk+3y5d9V5OMNTAdlWBmV4fxeK5FUvaZJX1n9Je+d3W/3pWWJfvI6DiMvmf461
 IRpG1P40H45PvvnscOzxTzo2zbDM1TCjjHCXD9SCFjoiZfmTitu/tbllF1IE5f8hDphc9nag2xk
 QNMMkudU9FGy/XBohiA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020072

--------------sKuCN7WBtPTAqAjPnYMJLvU7
Content-Type: multipart/mixed; boundary="------------qMmNhENaJuRLMxIUTBOJu0Hq";
 protected-headers="v1"; hp="clear"
Message-ID: <e84ee7d8-ce4c-4e46-9ab4-0ac4c395171e@hpe.com>
Date: Mon, 2 Nov 2026 10:12:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, Jakub Kicinski <kuba@kernel.org>,
 Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
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
 <f235dd80-477a-44ea-955e-93252ae4e7dc@hpe.com>
 <a5ed91f4-7d53-41fb-9661-ecb4507089b7@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <a5ed91f4-7d53-41fb-9661-ecb4507089b7@lunn.ch>

--------------qMmNhENaJuRLMxIUTBOJu0Hq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/2/26 9:39 AM, Andrew Lunn wrote:
>> Our only allowed AI inside HPE is Github CoPilot.
>=20
> Now think about that you are posting the driver to a public mailing
> list, to be archive forever. All your customers have the driver, there
> is nothing secret in the driver. It is GPL licensed code.
>=20
> Does this policy make any sense, in this case?

And it's already published publicly at github.com/hpe/ in various repos
(there are 5 internal repos mirrored there that compose the entirety of
the driver).  But, it's not about that.  It's about which companies we
currently have a contract in place with, that's all.  Well, that and the
fact that we aren't allowed to mix business and personal assets at all
for fear of data exfiltration, so even though I personally have a paid
Claude subscription for my own use, I'm not allowed to use it on company
projects, even when those projects are already fully published
externally already anyway.

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------qMmNhENaJuRLMxIUTBOJu0Hq--

--------------sKuCN7WBtPTAqAjPnYMJLvU7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmro0o8FAwAAAAAACgkQuCajMw5XL91K
JRAAn+BDbIu43elBZS9xJ2C3eL3Es7gNb8fwTCANZFFur7zuf8B9FuOsmFJuEBVk5XoD1Fm8ZavT
ANvpl/CzfbFdGbZaSg+83ib4GB/NUvjzr0bg0oYqgMadoyc752zZJ+JhDcFdc/k482M7ETwG1+8B
Zq23s2570+lFqIKUvCChTfggrR8lDGAovH18KtkjtX8bEx4qz+8WNu1GzqJqjl1D0bVhYhnFYEN3
a4t1PQewuSYqhIeazaUe0iqz7TopGVz6JzIlNSDTdYydOAME31uhKI9/+NJITfe1YvvXgncshCET
VIwdWbQQNhTw5A5BsKItP8odKjM/hlolV2YexA/pUq0sRc4yKTvc0fsHFi5JB/F97KO2tXSD6xZM
OYwMjwByiL78g3GJtnEKLsis/AO189Fiwrhi/vnm6rt68PLAdxwD8LeTfxzO6zSUpx2Y9RfAnuJ+
TA9g2TdxURP2MfLns0RPgu6/xUmibrY3p+dNJokr+ZFNDhAgMLlD9NLsYadge5cP4Inpo2qGV6a9
dqAEBR+Ui87d6FYhtP6vS/TU6pZ26LFki/GEIwDXap+oMmiIBCkVef7tWMx1tKEZ7v+NkD/37aH3
7l3E0DitkTXgWrq7xzJB9aLU3epZR34B2nqvyFIQh7OkbbwIX6N+OermRR2EtCVWkU7WkZBlZ3tw
0x0=
=HLJc
-----END PGP SIGNATURE-----

--------------sKuCN7WBtPTAqAjPnYMJLvU7--
