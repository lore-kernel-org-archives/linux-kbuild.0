Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808850;
	b=XtAL3CrwUTiuFmZQC60Tdi8bxoD+ggfOrXnO0nrQu/g87wV8Gu/klNLctbP444ImB570
	 aLQTLTh9Qs8yhnjjlN+WwlLVR9g7JhwaPGiqjx2TOgz9DN1ixwZH+sxU3EaqQ4Dcreqcw
	 RIoeGa2zDJ6MgkZfL/Leuh5ohvAge45KWC6am9CZhfI5SgWAtLnLFFLMkYQjHbVf9gX1c
	 nw/lzPyAD6tZ37LqcP21SUUW1NsymcJw52uDs26VZqOr1333J62C4ZKAASjYpNHiiAGHs
	 j7FJmuN42LsVSR7FFJb/YuEK/ru+IO6tTtcEWXi8ZQLFDkMOY9IivM/RqKzN8dqjfHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808850;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=46CgSXvbPZgFGzTyRN0yMDml58spQ6BDtC9K0WW0qOY=;
	b=dHg+OXqLEmia18J1kL8q4ZIyoaIlu92EVTpfUoq6Y4zLMKonc1qFwU+d4Ou0beouw19J
	 mS9wMhVll5qdzVBj3+UWCEv46hutrmTPmYJ9Gzj7etbUCKymaKPnJk9QK2vwMpRRJTbNq
	 MgVElrjUt6nTRQ+gUExjgIMZ66NxTRzeDlpCbA7fW6cFHLCmKbV++Jijd60l/FXtRA4MT
	 ivOmgD+ca061edtiQBCXHppWuDl7K15AK3a3Um3xn+A1RAQrFTaUGXBzoDcu/lOgqsal5
	 f2HACFUoP0CPh4QeJiYlwNa2xplkCZa12s2fhn/3lPG42uiLRHrNhCPOn0tZc0sC9sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=f0GoOIQF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF4606A330;
	Wed,  4 Nov 2026 16:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EF4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=f0GoOIQF
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FhXtS1041248;
	Wed, 4 Nov 2026 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=46CgSXvbPZgFGzTyRN0yMDml58
	spQ6BDtC9K0WW0qOY=; b=f0GoOIQFKCtcDXhKyXgfaSJD9HTL8hlYTSA5QtY+sA
	OpRjUljAoGGr4LTJWLWm387x8lPeqt14zHch9Pa86PBZuFXg/UBvwxJXuiifUfPu
	u9ohwOFEI0+Km/A5+XhqC8ttWXCaObOcsReWse6YUeuHFq3F39UgDSZpkic1UoGV
	Y7IxJOPDEXVDQlFXLtZJQJcNHO1Hg/wVAmaD9X93VxpseycQGVlArIIDmtZIOXkv
	jIrc1P4gnQlrCtg13WKbnQJJ42XIhD/MbvgXAAm3zGq272vQA+eKErmNVB+tDLgb
	DeKPwjaXK222NOHq65Ekyk89cSns9elHacFNF0gaHtxQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hr4w032pe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:13:48 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 7FC54808045;
	Wed,  4 Nov 2026 16:13:47 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 4 Nov 2026 04:13:28 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 4 Nov 2026 04:13:28 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 4 Nov 2026 04:13:28 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 4 Nov
 2026 04:13:28 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH8gPiTeQzwEMKp8l5G7ceBhmLdxoO2U5InfnrbAZVj8FQpbpLX/NSqURk3hxIilJ+CF3SJYfUvD2j5ewyLoWGGT4XZZhuDLyKymzEvTEAFiV814lM51RymYvenRnTeY7NZMHMFws4feBdKvKbIQA3IwwcdwqvPn++2IOvVGBmhGVH1g8W291KyrYg/uWeSLOeraV3Yv37WcoxVYV8mJpa4Xxxlz13Qjetk9AGODjHwtmQYqM4eHIFtEEO15jKSLQw/RlZbhp85q3bTOwAgPoR/Q9kl+WGrJ9ocPzV8hhhei8rCqLWo2HU+FX9GVlkArFPHBhfMhgqXi3ccV6oQyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46CgSXvbPZgFGzTyRN0yMDml58spQ6BDtC9K0WW0qOY=;
 b=PS8eQGRwyFPiA63T43c8jYoHf3+hLO1nKFSXyuoWBjBcmavgzeHH1PzHbIyrjFWGiL5R53uRuSmgtfB2debYRRWEeA8a2Z48IkmKJ8Q5Aw/oAkdzKmLh6cONLuRcy9XzWD0hT4qKW5t8fkp+CkvKjsdiG3MqwzDzktOdNzkYdMMkT3GWOc2Y4+RwEKDyCT6AQBe0hrcOlsnAax/kiUUoj8GCpSbkhFtG6uAqmDj8RsrUnq0VprdO/3cU12VkkaAKo/3WHhkOdLI9zBDFBAoPha+v/pud7WUyS3mMW10GgaN/R4cvBKKzCKMHdkwq/O4aay9JJjBKXSrATIEUDm69vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by PH8PR84MB3234.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:1c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 16:13:25 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 16:13:25 +0000
Message-ID: <904a4afd-9090-4e0a-a158-b0d8e8379b50@hpe.com>
Date: Wed, 4 Nov 2026 08:13:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Lunn <andrew@lunn.ch>
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
        Leon Romanovsky <leon@kernel.org>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
 <52b6596b-385e-4ed2-a6c8-d0774b4be127@lunn.ch>
 <20261104150435.GQ3889730@ziepe.ca>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <20261104150435.GQ3889730@ziepe.ca>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------faZlha0xLctKpZXD63AboSAx"
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|PH8PR84MB3234:EE_
X-MS-Office365-Filtering-Correlation-Id: c6759db3-3f1c-43ed-0451-08df3a8e8de0
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|10067099003|22082099003|18002099003|8126099003|5023799004|4143699003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261021121427099003|261021135927099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: i9+Y6PPPBzGLNvV1wuub85rUeZx7aR4xovO87hpy/SC9qoirgfdc5txM2sPK49nLP6AWf2xIqF3saFwzlPn03yYu9PS2YVGsh25tn6WLdtqXTAcvNqrxY5Lal5aeso3XoZpfSz78J/UO43cbEW8fpREOYpfQfL1M7OZTuakE5y6IfokvPWZGyHiBmKOjsK4ihxJ5TUPyHIOdxcd6PTshHk7MKGIVy3CkqeMWk1VJDC95s42Pm9ozaTZsEnSIABQNplBoAq+7CegHBWQvGHnv/rubM+tDunSnSNHWSRsikwIB2GPX9Jur0BQxPXDKKgD9nMjS+W+meZp3+BXU87RcGpVmrmShYRUzU0rmX/OP2PInZF2HY+13idDxUcF+Qhd6Ofi4zTtU973QhBhZSRIlzrvpQEIqDb1KbsISzLw8WtF23l2aCumo2w/tXG/WFE8rA6azh5YMoye1jS8kF2hamn8BnjUIWi/uTchR3UuFgx6DFZHlkvPG3SLJ1e23IegNh8bZcjX4nUTBUuHVSrsxB19FktZhFIVRa4KHByTCCMEQa3dYUxciITmM5RzISSACrn9N2fn3lbDrcFxWLE8qEIZtqjCcT0arImGoI7rVwuGdFlu5InkQSjTjAIMdY2lRoVlHa32Sfvg7ZUqlzM9/fSGAuO+lMpRq8i9FRE4+TnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(8126099003)(5023799004)(4143699003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261021121427099003)(261021135927099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTgvYjFlR1lZS0V0WVIwOVZETGl1SnRRU3dkTjl4TkZRQ0JYaE5IVWpaOUVm?=
 =?utf-8?B?SzhWVnIrb3RzSGdEMmx4dlZiQkFhMzJpR25WN1l5M0dJUWU5ZmVuTnAvakt5?=
 =?utf-8?B?QmFGLzljdnFFdmtVd25SRW1lbUc1enFQNnVOTlRmYVZ4MTgvemRiZ2k1cVhi?=
 =?utf-8?B?V0RNUk5OZmJzWlNCWC96VGswYUkxaFNZSmVtVTJhbnNDcTd0cGxmbmtNWEZM?=
 =?utf-8?B?dml1cloxaStzemRjWmlaRTExOW1wS2NSUW1CY21VK0Z4bE45V3VTdzlmYzRO?=
 =?utf-8?B?NnFSMDlEczArRWNKSVI5Q1lGSittR2J3LzBPSmMzYUlsdGJxejdvYXZ2MklE?=
 =?utf-8?B?aWpkOW43NUY4U3dCVE14RzRZZk1GcFg4UWpEL2MySy91TDFrdy8vRTU5K1Jh?=
 =?utf-8?B?VUg2OU5kR2tMUWJKaisrSlhjS01LbVV4TVVEYXBhanUwdFJ6ZHJDSkFxTGM3?=
 =?utf-8?B?UGNRTlRsMGdUd0VoWXp6c1lFM3hPOTJuTnQrYXdzNEYzMmNqelh0UWNnZTdQ?=
 =?utf-8?B?SGZISjVMcDJQcXBzZ1VKOEpQdXY0MEhGZU4xVWhMVURNQUljZVZ4YUg0ODUv?=
 =?utf-8?B?b2wzZnpwd081SWtrMDM5Mk45SjhObGhjYnQ0Rk41T0xsNDNvZmJJUzMyQ09t?=
 =?utf-8?B?RWxXa21JZDFtT0ZKSkIzWVhPcmlJQk8wMSsxbTR0Y3k3WG5xalBOMTRFMGYz?=
 =?utf-8?B?dEQ0dzV6TEZubDQyenMyMHVjQkFDMG1pelRWVDNlcnNPSkVTd21nL0lCSEl6?=
 =?utf-8?B?Y1MxRUV3NGtvaE9lZmlld0JQSjJkYlh5WjBiN0R5YWZsYjJzMER1MTIzdkFN?=
 =?utf-8?B?WTRyeFgwYzVkaE52S1lvek5YL21YZmZqVmxNdlNiUTNYZnpkT05pb2VlcG4w?=
 =?utf-8?B?ckxzbm1OR1FaL0FVOE1CUlV6QXRMcnlRSFZ1OHdXOW01WStpN1ZKakdxYnQ2?=
 =?utf-8?B?SzA1RDllQnloU0pWZi8wNTIwTjRBM2dpbHpZaWxTbHl4VUExNlNEUmNGVjIw?=
 =?utf-8?B?RHB0dmRPdkZSV2xkbGJnd1NTYWF5K2wzNDRFRWhBNm5TMkM4UUxTbkNTU3Zt?=
 =?utf-8?B?Q0JZR3grNUkvcGRWd3huRDY5ajRERUg0RzJmZ0NUQXJGZ2tDNXdNSWhpcEtF?=
 =?utf-8?B?MGphUnBiL1orTGJUZjJxQzFxbHh6cWprdmdHRkFaaWpxbUZLSUlmQ2FwWkEz?=
 =?utf-8?B?TUU0R2lGckFrWUh4UlZCajJXWEUzbjloRzBwdTJKdExuRWxMWDFkb05vb0Vs?=
 =?utf-8?B?bUdndmhNVFRRM0tLK1JtbzZ6S3RKblRpeFovSUZVMGUvRXBiNUZRbWJjV3hN?=
 =?utf-8?B?T3hScnMydVVlMUhpZk5xdTltN2FENWF0SWdGK2Y5b0dPUjFRZ0RLU3B2czBV?=
 =?utf-8?B?UmJyRVVVL1BkKzJEVnh5aXZCZTYvMWpTb3Iwc3A1UVFiWWJxTlhDZ01QTFdo?=
 =?utf-8?B?Z3ZDZllBcFp3WDFZU1pUbGJUQjIwOUdOTGtDQkgycVQ4OWdHZkJ3amJuSFdU?=
 =?utf-8?B?R0c0QWVFWENEL2ZFaWtxdmVMcWJBdTZsNlpjM2J5N1U0Y2dRZmZNbm54QzVT?=
 =?utf-8?B?ZzJFZ3Mya3MzV0FUeDM2cWRhZ1BUZG5zY1dHQXI5T2NOWW1ZTWZGNllLd29o?=
 =?utf-8?B?MmUwMlliN2RqT2dGKzdsYWkzWGMzOHloaVBqRmNJVUFYZkM1QlNqakxoQ085?=
 =?utf-8?B?UGo4UTZIZVQyRzBpYmw4TVBKSDdsdSt5QUY2US9XVzBncHc3WUdra3dKWFp6?=
 =?utf-8?B?bWF4NGNFb1JsZVdkZmRnVlVnVFlsQ1dPZTA0NDF3akpZN3AvRkdjTUM4eDBq?=
 =?utf-8?B?UnNIUzl2UEk2dU1LeDFWMWQraTBkWjBPdFF6cFRZQmxGVGdtRGFlaEQ2UWk4?=
 =?utf-8?B?VHRZNTcweWZBS0N3TUlMY2VBQ1RqRDhrVGNyRE9nVGtEbUt0NEFzTi9IVFVz?=
 =?utf-8?B?NlNXL3JsanQvVTR5TS9Ja2QzV1lWRS91OEpYTW5Wb09aRHcvZkFnbWlFM0NZ?=
 =?utf-8?B?RHdjaERJdUN5eGlxcjhPL3FidzFFcGFMK09ucDlHL0lHaXhkbUtXeENFUEZH?=
 =?utf-8?B?RXZ5bktUV205YS9sM3Z4Zjlic3doaEdPcjRWM3pGUGFMRFhablNMaWVqSCtY?=
 =?utf-8?B?WXM2dVZjb1M5Y2hFZFU1NnVDQlh4TkdkWlFiVEp5bVhsVGtPQ3ZxamJWdXd6?=
 =?utf-8?B?ZFQ5SkJ6NFFOM0VjWUxuRW1UTUVGR1ZMVTRhTFZ1aExzakhiRTF5anMvcGxx?=
 =?utf-8?B?d3Y0c1ZzMFRJeFNTaHNoZmh0eXQzaGJLdXJLeVUxbTVKZ2cxcUlUTE1IYnNY?=
 =?utf-8?B?VnJxT251WWdDb202dnU0QlRuN2VnUWFzZk5wZWUvZzM2QzVZZWZtUT09?=
X-Exchange-RoutingPolicyChecked: yAz4WcX26wl59762iGCAO9G3Icy1Q13rdZnakn+Vp90rCh5bKwb0iO8dJxM5CggDurcQ9UurFrjSXwMe9YsXcZUWKp86PcuNAJZ+3LLSp1NKbojnLMBYE8dnjrSdq4RZivJSNMAeNRBDq0nCQV89ckhLDvRYyDRPSZNjLEW1aUOjxzlds4gVYrniphJ9n3OrRh3eLJLW7wCSCgO6HI6+tEndV0V+HfHTIgkJimF8c/fwgqu9tUFekSEerrC4mJlwBF2f8pfasvPeWSL8TtxaGipP8BFr3BpaTAlOM+lofwAOT30zb82UOx7TSVRypXG2IKzhx8nncCaRp5aMcCvyOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6759db3-3f1c-43ed-0451-08df3a8e8de0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:13:25.0767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvHA3fTB5SsQuBjojeE7FCZjMPgQV2i0D7KUmIiqzGdHFPSlvb+LhCkzynquDHSXQv90sQp1Sovm4oZOPo4U/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR84MB3234
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfXzqoM72TSoOMy
 OdgxWznzeOSfprKEhC/m+wpSROMHTBuf8TWOFmViWik6bPB9eFuq22OIivI39i1B3hnU7t5ajbH
 vijolqHSQeGWcvlbUutLiz1XiCq+P2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX1JNfRPkAaI3t
 fsKGQYzQbufc5mjXQ/WQjgVRG7DwKPLdcrw014f/TkBP0+Bdu/66kz4ZrjEIJwM4uHE0W8zZKXc
 u4OE5RkPx1MburX1znqbidmb4zQFFIkbBL3/YVMGWAv62X0OVhfteiUK+BmxGn4gNkKarL+gGh/
 n4kndGruIKsTdm4CNkKOw84ocy7WLdAr7yl229aUl9HBrk778+9z1SKoQljPBUPjXfY87otRCsf
 4QbhUoiBVfNtGVavhJT5bRO7ZXGW4mbjdpJH88FlNdQZEqSg/iuAjajI6NdVZQBnO3xSHtAZQ8x
 m/NbNyP4WkQeJ8+Bo3bCLUPHlmiNjqNrSTvA1xIWfQ69M6fHsVPc0t1YNOugkFjQVKCNGP9Q29Y
 6tTTiMa1+VQiNubjvOs0Ajah6UTPGBGRqM6KZc7AQda1cWi8iVAMXqj4CHKVxFpsIXkyF8s0f2G
 O8pVJX1jAMPQUaekUUg==
X-Proofpoint-GUID: JqdhBEobdrcT-21GdFe1Y6omQGx59BzH
X-Authority-Analysis: v=2.4 cv=O6GsLx9W c=1 sm=1 tr=0 ts=6aeb59bc cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=MvuuwTCpAAAA:8 a=1HfDXqj56o8Xc-ynThQA:9 a=QEXdDO2ut3YA:10
 a=UQEh7bPfCiVckKZdv5AA:9 a=FfaGCDsud1wA:10
X-Proofpoint-ORIG-GUID: JqdhBEobdrcT-21GdFe1Y6omQGx59BzH
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040064

--------------faZlha0xLctKpZXD63AboSAx
Content-Type: multipart/mixed; boundary="------------ajiC8U4ZG7aDHbD9uli8jFui";
 protected-headers="v1"; hp="clear"
Message-ID: <904a4afd-9090-4e0a-a158-b0d8e8379b50@hpe.com>
Date: Wed, 4 Nov 2026 08:13:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
To: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Lunn <andrew@lunn.ch>
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
 Leon Romanovsky <leon@kernel.org>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
 <52b6596b-385e-4ed2-a6c8-d0774b4be127@lunn.ch>
 <20261104150435.GQ3889730@ziepe.ca>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <20261104150435.GQ3889730@ziepe.ca>

--------------ajiC8U4ZG7aDHbD9uli8jFui
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/4/26 7:04 AM, Jason Gunthorpe wrote:
> On Wed, Nov 04, 2026 at 03:48:58PM +0100, Andrew Lunn wrote:
>=20
>> A bit of an aside. Do you have the complete history of the driver?
>> What did the first 10 patches do? When bringing up new hardware, you
>> start small and get a little piece working.=20
>=20
> If you are implementing a driver from a datasheet, sure.
>=20
> However a device like this was almost certainly co-designed in a chip
> simulator along side the HW and by the time the HW was done they had a
> mostly complete driver ready to go. The actual baked chip probably
> never ran a driver like you are imagining.

Jason is correct here.  Something as complex as a Portals 4.0 API device
does not have 10 small patches to print "Hello world".  It can't.
They're too complex and there is too much setup just to get to "Hello
world".  And yes, we have both a chip simulator and a qemu simulator
where the testing happened.  Using those we already have Cassini3
software ready to go, but untested until our first hardware arrives.
That was obviously excluded from this submission.

>> I'm assuming you did something similar, small bits of code you could
>> somehow test. Those small bits of code, step by step development, are
>> generally easy to review.
>=20
> When you are co-designing with a chip simulator things work
> differently, you'd focus on the more risky parts of the IP and do
> partial driver flows and so on to vet things out. Lots of carefully
> orchestrated shortcuts. Then you take that and assemble a complete
> driver to run more complete sim passes. As this progresses the HW is
> changing underneath and the SW is following along.
>=20
> So it is completely understandable they ended up with a completed
> driver at the end of the process rather than a bunch of logical small
> steps.
>=20
>> Generally, none. We just want a plain, boring netdev, which looks the
>> same as every other plain boring netdev in the kernel. OS 101, the OS
>> is there to abstract over the hardware so all hardware looks the same.=

>=20
> Yeah, this is a reasonable place to start. I also discourage any uAPI
> introduction into any new drivers. Start with the basics then we can
> talk about why it needs new uAPI point by point.

Yeah, I'd forgotten (in my 6-7 year break) that sysfs is uAPI.  I've got
it now, thanks for the reminder.

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------ajiC8U4ZG7aDHbD9uli8jFui--

--------------faZlha0xLctKpZXD63AboSAx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmrrWaEFAwAAAAAACgkQuCajMw5XL93g
Yg//cBQhzwFZcHmD+p37KvvRKw36NP72qlgXrXlPBFf/gxMsHX5Uxcfd09mhpm/5LDYVrfuAsOIs
GDfcVZGgRQnRXepYvd99mnIaMmp9aX+mpwEzQ820dZpqX/tds3hRSEucSj0tnJYsVTWvzGsNxVlQ
gCpKJvqT5H2zxhykt5FMOEQAiT4sZ1B5e5Rzw8UmgPaNp6IcEoASGXYB5umqxa0JCYXWuIjkPhCO
JVR9mJWmtaeJ9+ce05g2dqrV5mKXr93wUO/sReB4RfWC2/VMxOrH2Qg9Hq2Ic8auP1LOKcOpOHwb
SuEZG7mqy88LuiyhMCB0JSUBbuwn2bdR3+3zE/uAwgu7voCuS+Ws5iPDR6LTbkXyg1V0cxzBC/CZ
4FDyCpvNUPEJ3Gxf4p07uZrdqU0Q8n3e8hnuFJQgutA3sO6zsqYjek8KXjbizzTs4Y/ZhmXrVv3e
dY8JS15nBttXLljdv/Cfka2Se7jUsePu75LYb8tyQwiBGgNq2uisfQWsC1K73riEw3cvRmG5lpV7
yHR9+3+oSEUkWt7uMlnluAjOmWg5ghTxbsWUbGOgvebJ4AgnescMlCcP/byiXLPp6vJsLo1lBfkz
cj6cPksRtVxM2ccS2AkGU6EXQHwUR3eAJuS7PnmHY4eokhTMPjdP+XXkTyM/9WY3bqWRmm6eX5dj
He0=
=TdyB
-----END PGP SIGNATURE-----

--------------faZlha0xLctKpZXD63AboSAx--
