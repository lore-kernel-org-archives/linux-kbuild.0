Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394047;
	b=A4ZjGgDiU+9webJEhnw8feBZXGB9kIyQaLXTe+GANBaEsGpiqGusLbTQlPZ8jM1oiimc
	 W4mZcKdBjOxqM/0FInBb+xGCkHk98a1Nqg9sqF5MntbLz6cqfesjGeeuKdlGuS11Du919
	 XALnFPTVGMwtGpiKGCNGMrpr8QEWXSmIfsRuAWgtUkk3veHskLn6u/yH1/kKbxKKR8BeP
	 lfzHHvAIeynQaG5dXksklakXshI1WSPcXdqI9vnOK5TxlPKsxCvzu0AOhyRdrh1RrpQTx
	 HoG6PN6uJ65JLv17NaY0DL1zQ+6zn68SKqVRzvDhCjnzcG3Dfn9yEA4AEcy1UtQXB4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394047;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vs3zT8cbuZYsRCZmjm9TYiMd+YVvt/5k8kpy18NplMo=;
	b=5TplV1y1Jd+oh/45VTttOu76AaHqMjgmhy5ZuREwW0U/Iiekx7lRBXy2L12oKRFaukOB
	 g2rr6Fc+RrOyDnRi1iM7zwTWzlhJRUljn4v9mjsZN7hiCOinvL4K2jofQII4l0D/XXTNF
	 pkpHVHuT2LoiqLHfL1RhFPsm8tEef5caBuIGc73yQetoC8zcF6smHEKXo9Fwwm1nP4Mr1
	 FzadYwZmLOzsJ+8nFHod2DLkZY3QbueDTIs6W3XGClbigTCE0dHgU1pcNBQDjOWSOWEoy
	 UcsTlxoAHet97FmlhZ1OC0/N1aMklor8cIxn5of0JdZVQkQEjAk6zK7czpBzyGlZlZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b="WigcH/OE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908F606A31A;
	Fri, 30 Oct 2026 21:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C908F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=WigcH/OE
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UKOfoY954301;
	Fri, 30 Oct 2026 21:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=vs
	3zT8cbuZYsRCZmjm9TYiMd+YVvt/5k8kpy18NplMo=; b=WigcH/OEVfpVBseWSi
	4HwqqKsf8Xbmqqy14LtTZWB8dOXf6G9AvJ1CimXTo2iP+qM10eZC5pnNQpOHLIeJ
	1TUCrMV3d8t7hKD7OIB0SdMPksxdV4Y2eHbHKvqcgs5AGFnbrMGC4FLX5GQ/kfAE
	XIYCO2TaMCLx61MJM14F4DcXrvwisdTjloKq/YPR70txv0ZcaX5PUqRNwcjq++03
	NX7VgH8Om2Df7ISCf2XhtHZU+pMjISNTh9KbtWEDpYhI+zUOli/xopZRuxgvYP6f
	pnOvDVlXgejUg4KJHYoUx1d0HgazjDFPgpKvBI1IqQZ1wgy2yo3+J3Xcz6ecplzw
	kJgg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hn28b09k8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:02 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 330E8800EE0;
	Fri, 30 Oct 2026 21:00:01 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:00 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:00 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:00:00 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axIPziQECDvlqI1ffA1rfssUwb1LM0dx0l+AiuHSe7ug8LAwWEb3sVTvaRoGFoo5j92aLtXTovFclSNzXopS1o1wX2YAvOnjj5aNIqCwnjE8GbCxqdKxW+ITU8P+984InXprujc4rvXUpqwNv5koBPFek/l9xAPp5jDxYpaW/Gy6GYYJs6wcA81mdLbw2+GWsADXjxZm5gm9Lobv6mK1JeI7ySoR990vDsd7BW/G5wdhgqa36cMH+THAvqCOr4WRqQtP6v2ot9txJFzkfcF/ocwZK64WKiuNeJ54bW6BKOXdFiirNIva3MqEEjNjliy7531nPqpPR522QAYN1FuOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs3zT8cbuZYsRCZmjm9TYiMd+YVvt/5k8kpy18NplMo=;
 b=LNv/Lr58rKl24FbnXmLdACHGa1Z/UAWFFdrFfyj904ZpC71lS6TD2RLSlYq5/bhmqr9jrtK2fYclNDqaO1+5qKRJTv6CmLR28uFrvqA0fJuTErPAUKEQn99WlmOT8fCf6V3gDWyelX43x2WOtcPzYCSJDmTlD9Xc74pJcxUJHNzNu4jhY3C1C0z50bqcnawaWwmR90SlTaUOpd1Q1o/viNhIwne3o6zlIH5X6yMMTacRtVLq9HXQqB43yyEJxUVFdqAVSn2+bJ3l2rwPBsBuZfKTtNjPDm+jHJnMG7IuHrVP3gQ/ZVB8tBgi2TplWA+pLIkeaTNOnlkZEAuKW2EDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by LV3PR84MB3767.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 20:59:57 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 20:59:57 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:58:59 -0700
Subject: [PATCH 03/23] net: hpe: sbl: add the core instance and
 configuration layer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-3-8c2c391cc283@hpe.com>
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
        "Iraimani P" <iraimani.pavadai@hpe.com>,
        Mamila Santosh
	<santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: DSSP221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:3d5::18) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|LV3PR84MB3767:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd7591a-cfdb-4f79-da47-08df36c8c0f6
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261022075727099003|261026135527099003|261022113327099003|261022115727099003|261022105027099003|261021133027099003|261028144727099003|261021123027099003|261021135927099003|261021130227099003|261021121427099003|261009223027099003|261026121527099003|261026130827099003|261026140227099003|10067099003|56012099006|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: 3iYlButRaT7p+0MkARpcTeZeJYQ5EeyhmxZsmoZSCMO0TF8MCHs/26HwZ7MWZHtu3z2QqjBtOaTtej8Lg1L6G4HVGgkcfO52DOAF6WbWK2vXhYBXMqy8CswjGMuRAI4vfNcdxnkajICmbTjQzJbhq0zRxAwt5Q6Hh+mkPZ2yGnqhKvSRcxWGcTP/YdiE8Yapu9etQ4+QRICQvWBxoFlCJzNz1L2sOYMAfEVr36OqZjiYdYIuHaFWA2HbLhnVU07o+KPtSUJxQ9sQcX2r7dsP/WNZEfz7HHfwqY+CA6Fa6isPX0K121Ulpp+BdVBLTHVIjlMwFI8ZrP/IHB9xR2SlqIYDIGDHWwbDJkimY76jeJafTcKGdjWIPSP/r5qEq5X0bE1RhzBqAirYw/G+/mOTiuUQuoa6LSEzjRbPdRsJzGCFcTM5WnRIbxnYhATpvoeLMpvCqkReJJtEptdCgTKmn1ulzM25DN970NOu2xYbjgNOdigVQ/MKjQXTVbZw2gTZqfLQNm8B4Dma6ywwbnaILZUjXs7QtmiXmjbaGHJaptOWQHigsrfwDQ3AXu/0MthMXyLftVTXy5iIYp6TWYsBrmfWDKSlna3YTJ7W1bTTW5NRzu6181t4GbH0HZKL4YleCZhcqcT2kC2VCHqMOSPujTH8KjB1HFNDzRd4M4Qj70sz5oqA2ZPi93fPm0F5hOQ/4FVBcKcdIfzFxvzdhqRZQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261022075727099003)(261026135527099003)(261022113327099003)(261022115727099003)(261022105027099003)(261021133027099003)(261028144727099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026130827099003)(261026140227099003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3lhTldQd0JBUUlhdnVLQldMN2Mya1ZEbVpvS3g4MnRWY1RpOC9hY3UrZGFm?=
 =?utf-8?B?eGdsNEdDRXkxSzZrTkkrOUZ3b0c0dnM2YjZHT216OHlZTjZjVExIR2wrdmtz?=
 =?utf-8?B?TW5GL0ZZRFRCYXRyTmRxTytsTHpnOW5CQThhNXJmT24xblBSQmE0TUsrdlVW?=
 =?utf-8?B?N1J0SDZVN0JMNTA5d3pRME81R0R0M1JUT1U3cklZQkxOSDdKaE9wOE1XcDB0?=
 =?utf-8?B?QVhLdVZGZTR2Vk52R0kyLzB3M1VVbnpXZTd0enkyT3JwR0V0VVpQbTVVQVlk?=
 =?utf-8?B?bU5ubytDcWRya29CbEp3MTUxWE5Sb0pyZ0tZeWZ4TDQrNnFwZGRLZW5qUEF3?=
 =?utf-8?B?Nm42UmNZSXJFLzlHczUxYTdnaXVONFBaRXE1VlUwVVdLcUFsZnZOdmdod1F1?=
 =?utf-8?B?UE4zSnYrTnFTUFpZejd0Sldrczd2b0JHL3VpMEdpVndodTVmQ2xsVDRYVC9a?=
 =?utf-8?B?dzNxSTR5Tm1VOXNaSnM5aXBDMVprc3pZLzRwcVZlazVOUjlqaDVDVnJmTkRj?=
 =?utf-8?B?alZRRXFEdmpPYjBubGI2NTY5dTlSVGVaUVdRRDl0NFB3clhaWHJMTWIrM0tE?=
 =?utf-8?B?dy8vQS9EZ2ZvKzhlMG5PZG1wcVJmMmczeFFOTVdOc1J2QmdWSE1ucHFIanEz?=
 =?utf-8?B?L0pxMG12cndjM1RFRmV5ZlJXbVRXM25GTGlzRS9TbHg3N3poQmNQcHduS1c4?=
 =?utf-8?B?RVF2NkQvQTVlSkZGbCt1dExrRnQ5VEgyTlNxVENaQ0F4TFk2SmROK0dVdGZn?=
 =?utf-8?B?eDBQRFdZdmtSUXdySVJvZHkrR2RNMmFiV2pFTm9ZbkROUHBqK2NJMkZpM0JZ?=
 =?utf-8?B?enMzRTNuYzlhK0ZpbzlucjVVcVJ4VlV1YXp4dnNRekZxbm5HeXh3dnUzdit3?=
 =?utf-8?B?aEFCTXhGa3VSL2wzV2s4RENPWEtRR1BESW9TWFdCcWVkMWdFMUE2ZDJWN2xQ?=
 =?utf-8?B?dmpvSjlyUmFMWjk5UmhvSWVZS1RXLzIyT0xHS0NZK1QwMkZkUVhXUEVtcU1T?=
 =?utf-8?B?OWI1N3BIRXBqcnZzY1EwRjV1cUtVWnErVnRidXBlNk1pNlNnMmZPN1luNEdD?=
 =?utf-8?B?ZVlaQy9zUmhPM2haYWlmL1d3S0grTmhRSXR6ZnFNQzlqYTZhM0UyM3pQTTRr?=
 =?utf-8?B?cFJXK096Tmd1Qk95bWVGdGNzZWl5YlloT1hGd3psbkpmK1M1Y2luTFJrOWtL?=
 =?utf-8?B?WW1LME5XL0RBbHcyTktxNVNpancvN3FlSWIxOXgxMHByRVRFMmJISGRRb0Zn?=
 =?utf-8?B?b1hUQTNReGphVUxiT1IrN3pORU5WeG1VbjU2NXlrVVhrN2ZYR0kvMG55eEhT?=
 =?utf-8?B?WDNRUGtDb205a2xXYU5iTXNObkFQOFRxd0tuVytGQXdJQ2VuV2p5TE05ajNo?=
 =?utf-8?B?VnM1MlRaN2RacUVhUjhKMm5NOThLTUV1WEJTM0kyU0pxSHRkSG9OcFBYenRi?=
 =?utf-8?B?azErUmNENnpiNnFZWW0xclVtb0t5cjFqNHB1ZW01dGxVVGtYSlk5bU82bFQ3?=
 =?utf-8?B?dmVtMDJ2bUN2OHdNZnBOUm9QbVNvcWp6S1RIanRLY2V6d3h4c0dud3pacmsy?=
 =?utf-8?B?QjI3N2hQZWlNVkxXWVdOV1dlamVVdEZxR25hNW16WkRQVytoV3hGYWVrdGVt?=
 =?utf-8?B?TzhjNlVkTkkvdndacWdqRm9ENlhBZ1lNMmZIdlJEVHBrelo0bm5SK0svcnZs?=
 =?utf-8?B?cU1sdGVxUVRFNGNROWhhK3B2MmExNUthZXZqd1l0Z0JUMERlSlhzUGpvb2tS?=
 =?utf-8?B?dHcyT0hUTVRXcWJnNEUvZzBSTWFlbUVwaU9BTkYrRGdLV2pTbkNwa2NxSENq?=
 =?utf-8?B?SzFJa1J5anM5aEtjMjVoTkVMdmFTWjlmVk40Z25xK2ZhREZLc0k2bzdsTWFv?=
 =?utf-8?B?T0hJd0R4dldPN0hPeXVVUzh4bUcyeGdrS1pwZFFWMEd1U1hPUkpXNXJoMVZE?=
 =?utf-8?B?RzZWcGs1Q2VZaUp2L2FKSmZPeGYxSThVL3g3ekV5M1RVemlGOXBlK2psVnBl?=
 =?utf-8?B?TUJlaGViOExDREpOenZnbkM3Z1BlZHAyOUJDaTJFalNYeitRTjZhMGNsd0Jw?=
 =?utf-8?B?M0JXQjhwWFQyN3RmOUYzVGlBVUlnalQyTW9HRk9zU0hkSkl2Y1JqRHVoanZ5?=
 =?utf-8?B?M3lMR1ByQjM3M3VNbyt1MkdWRmdyQkVYcThCdHlUeWpoUEdoSVNQc0RJWGtx?=
 =?utf-8?B?Ujg0eVVBKy93WTE4YVl3eHErK1VTMjl1QmVwQzhEbTdyMjkzYm1zMVFqWmVJ?=
 =?utf-8?B?MldVeVNXUW9BVnNzWEkrK3pBc1o0Qnp0bHRMa1VwcllPajRXbEFibi81V2Ro?=
 =?utf-8?B?ZGdSUzNabjY1OFNOYXlUYmEwdzNLWDNZZUtRMGMxQml0QU92TkJsZz09?=
X-Exchange-RoutingPolicyChecked: OPYwx83Z4HLW5wSsTL4hdNICZj2c6krDWyYMeQe10Ghwsh8vQNVgzUwJlj9ilpHOCwMs/AoO0jQxUKjpNTrcduv87OKY+ofrBd+4nwPf5Ew03Ci/PImJWUiwjkFHYKZV12Q3JTDGTV+xcrPOiNB4tNXofdR6kpaDEjlIWDKTwGQgcwLsjU6MWLhEjI+ErE1qco/moBxf9GOWEahmiUMbMel2huf206fRFluUq1moQcjzHWq0aHnZvUOi+6JLhPtede6uAWAmva0vyY4t6toc4Xn81+b1vsLiOxNj0z6Srfp6FgJcX1+0YAeHX19ldqeA66moMXuBL3ug8jQYyK8EPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd7591a-cfdb-4f79-da47-08df36c8c0f6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 20:59:57.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XszE5DuNUE5BU6+KhPh0YlY6T9vxGbBEriijKi8KN6NmqtAM2ggns6bAHMZ46W3nngRDvQ/SvnaWl7w8hozK1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3767
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4Zo2AMaxQkop
 XEv8yc3nEF2pJpIVfI2Vv2iaZ5gzb0SAEp0Ks1RxC4K4FQIj49CPP53rGai1dWinme8vPMSjjuG
 UCfOkddoWg6J6AwBWQJqCeG98JgOkU89304/MsLH1O9b2/hU85o6I4wt66mqaOfD08A8P87rNZg
 M5oc9EKQCuO/CIK+JKw2Fl9O0ogjsqUmD2SDpNJNGyW11P9uFti5UFsNRBlgUwvlO2JHpKHUyOL
 DBa6Nwv7IYJvETtBTqXHSp8AsaIELJ3I9gpPmea71TH8w6JNrcL2Yj/0fFy0QgCPPrGVuhUEH+V
 DPLPL6LrwSbgrJc3OJLWeSWqGTpPPcWqrbeS8aFb2gueATzek1PhZj+ir7mHlJf4KWzYhWEYB0P
 BFF3Q9wxzbpXd56HPiPDvLi5ABMtoS6S316Y99fkxgmjpwX9BCf+oS+r3GkxHCWXYVMtpY4NOfr
 OiIafR+lWOxEiicexgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX38OfeVv11PMQ
 7jXYIFO2bd5djah1G0fBnW5HPIp90t8sLemOpfET4RZLmYCYEmY52AqmlCogqZJPgvl0FPAUG5x
 WPm9ozJDBCpiyvKkekWi/NZ44F6T93E=
X-Proofpoint-ORIG-GUID: i90mHVu-VieMPksvTILP-TXt0u2gUkD_
X-Authority-Analysis: v=2.4 cv=P8+vFSAu c=1 sm=1 tr=0 ts=6ae50552 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=AuhI5sKPRh1T5T5etWcA:9
 a=Gw5EAkAHCgAyotTO:21 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: i90mHVu-VieMPksvTILP-TXt0u2gUkD_
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the SBL instance management: allocation and teardown of an SBL
instance for a NIC, the configuration list, timers, debug helpers,
and the NIC specific module glue.  Everything else in SBL hangs off
the instance created here.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (8), ALLOC_WITH_SIZEOF (3), TYPO_SPELLING (1)
- CHECK: ALLOC_SIZEOF_STRUCT (4), BRACES (2), PARENTHESIS_ALIGNMENT (2),
  MACRO_ARG_PRECEDENCE (1), MACRO_ARG_REUSE (1), OPEN_ENDED_LINE (1)

Co-developed-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Iraimani P <iraimani.pavadai@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_debug.c      | 167 ++++++++
 drivers/net/ethernet/hpe/sbl/sbl_inst.c       | 529 ++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_inst_nic.c   |  70 ++++
 drivers/net/ethernet/hpe/sbl/sbl_internal.c   |  23 ++
 drivers/net/ethernet/hpe/sbl/sbl_misc.c       | 505 ++++++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_module_nic.c | 132 +++++++
 drivers/net/ethernet/hpe/sbl/sbl_test.c       | 406 ++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_timers.c     | 228 +++++++++++
 8 files changed, 2060 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_debug.c b/drivers/net/ethernet/hpe/sbl/sbl_debug.c
new file mode 100644
index 000000000000..2ddc07e6ab03
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_debug.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2022 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include "sbl_internal.h"
+
+/**
+ * sbl_debug_clear_config() - Clear debug config
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Set debug_config to 0
+ */
+void sbl_debug_clear_config(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	atomic_set(&link->debug_config, 0);
+}
+EXPORT_SYMBOL(sbl_debug_clear_config);
+
+/**
+ * sbl_debug_update_config() - Update debug config
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @clear_flags: Flag which is used to clear a config
+ * @set_flags: Flag which is used to set a config
+ *
+ * A 'new' value is picked based on flags provided.
+ * debug_config will have 'new' value if debug_old
+ * and 'old' are the same.
+ */
+void sbl_debug_update_config(struct sbl_inst *sbl, int port_num, u32 clear_flags, u32 set_flags)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 old;
+	u32 new;
+
+	do {
+		old = atomic_read(&link->debug_config);
+		new = (old & ~clear_flags) | set_flags;
+	} while (atomic_cmpxchg(&link->debug_config, old, new) != old);
+}
+EXPORT_SYMBOL(sbl_debug_update_config);
+
+/**
+ * sbl_debug_get_config() - Get value of debug config
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @config: param used to get the value of the config
+ *
+ * 'config' will have debug_config value
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_debug_get_config(struct sbl_inst *sbl, int port_num, u32 *config)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (!config)
+		return -EINVAL;
+
+	*config = atomic_read(&link->debug_config);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_debug_get_config);
+
+bool sbl_debug_option(struct sbl_inst *sbl, int port_num, u32 flags)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	bool flag_set;
+
+	flag_set = atomic_read(&link->debug_config) & flags;
+
+	return flag_set;
+}
+
+#ifdef CONFIG_SYSFS
+int sbl_debug_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 debug_config = atomic_read(&link->debug_config);
+	int s = 0;
+
+	if (!debug_config)
+		return 0;
+
+	s += scnprintf(buf + s, size - s, "base link debug: ");
+	if (debug_config & SBL_DEBUG_TRACE_LINK_DOWN)
+		s += scnprintf(buf + s, size - s, "async-down ");
+	if (debug_config & SBL_DEBUG_IGNORE_HISER)
+		s += scnprintf(buf + s, size - s, "ignore-hiser ");
+	if (debug_config & SBL_DEBUG_INHIBIT_CLEANUP)
+		s += scnprintf(buf + s, size - s, "inhibit-cleanup ");
+	if (debug_config & SBL_DEBUG_INHIBIT_SPLL_RESET)
+		s += scnprintf(buf + s, size - s, "inhibit-spll-reset ");
+
+	if (debug_config & SBL_DEBUG_BAD_PARAM_1)
+		s += scnprintf(buf + s, size - s, "bad-param-1 ");
+	if (debug_config & SBL_DEBUG_BAD_PARAM_2)
+		s += scnprintf(buf + s, size - s, "bad-param-2 ");
+	if (debug_config & SBL_DEBUG_INHIBIT_RELOAD_FW)
+		s += scnprintf(buf + s, size - s, "inhibit-reload-fw ");
+	if (debug_config & SBL_DEBUG_FORCE_RELOAD_FW)
+		s += scnprintf(buf + s, size - s, "force-reload-fw ");
+
+	if (debug_config & SBL_DEBUG_FORCE_MAX_EFFORT)
+		s += scnprintf(buf + s, size - s, "max-effort ");
+	if (debug_config & SBL_DEBUG_FORCE_MED_EFFORT)
+		s += scnprintf(buf + s, size - s, "med-effort ");
+	if (debug_config & SBL_DEBUG_FORCE_MIN_EFFORT)
+		s += scnprintf(buf + s, size - s, "min-effort ");
+	if (debug_config & SBL_DEBUG_INHIBIT_USE_SAVED_TP)
+		s += scnprintf(buf + s, size - s, "inhibit-use-saved-tp ");
+
+	if (debug_config & SBL_DEBUG_FORCE_PRECODING_ON)
+		s += scnprintf(buf + s, size - s, "precoding-on ");
+	if (debug_config & SBL_DEBUG_FORCE_PRECODING_OFF)
+		s += scnprintf(buf + s, size - s, "precoding-off ");
+	if (debug_config & SBL_DEBUG_ALLOW_MEDIA_BAD_MODE)
+		s += scnprintf(buf + s, size - s, "allow-media-bad-mode ");
+	if (debug_config & SBL_DEBUG_ALLOW_MEDIA_BAD_LEN)
+		s += scnprintf(buf + s, size - s, "allow-media-bad-len ");
+
+	if (debug_config & SBL_DEBUG_INHIBIT_PCAL)
+		s += scnprintf(buf + s, size - s, "inhibit-pcal ");
+	if (debug_config & SBL_DEBUG_INHIBIT_RELOAD_SBM_FW)
+		s += scnprintf(buf + s, size - s, "inhibit-reload-sbm-fw ");
+	if (debug_config & SBL_DEBUG_FORCE_RELOAD_SBM_FW)
+		s += scnprintf(buf + s, size - s, "force-reload-sbm-fw ");
+	if (debug_config & SBL_DEBUG_DISABLE_AN_NEXT_PAGES)
+		s += scnprintf(buf + s, size - s, "disable-an-next-pages ");
+
+	if (debug_config & SBL_DEBUG_KEEP_SERDES_UP)
+		s += scnprintf(buf + s, size - s, "keep-serdes-up ");
+	if (debug_config & SBL_DEBUG_SERDES_MAP_DELAY)
+		s += scnprintf(buf + s, size - s, "serdes-map-delay ");
+	if (debug_config & SBL_DEBUG_FORCE_RELOAD_SERDES_FW)
+		s += scnprintf(buf + s, size - s, "force-reload-serdes-fw ");
+	if (debug_config & SBL_DEBUG_ALLOW_LOOP_TIME_FAIL)
+		s += scnprintf(buf + s, size - s, "allow-loop-time-fail ");
+	if (debug_config & SBL_DEBUG_IGNORE_ALIGN)
+		s += scnprintf(buf + s, size - s, "ignore-align ");
+	if (debug_config & SBL_DEBUG_TRACE_PML_INT)
+		s += scnprintf(buf + s, size - s, "pml-interrupt ");
+	if (debug_config & SBL_DEBUG_REMOTE_FAULT_RECOVERY)
+		s += scnprintf(buf + s, size - s, "remote-fault-recovery ");
+
+	if (debug_config & SBL_DEBUG_DEV0)
+		s += scnprintf(buf + s, size - s, "dev0 ");
+	if (debug_config & SBL_DEBUG_TEST)
+		s += scnprintf(buf + s, size - s, "test ");
+
+	s += scnprintf(buf + s, size - s, "\n");
+
+	return s;
+}
+#endif
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_inst.c b/drivers/net/ethernet/hpe/sbl/sbl_inst.c
new file mode 100644
index 000000000000..af55ac619031
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_inst.c
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_fec.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <uapi/ethernet/sbl_sbm_constants.h>
+
+#include "sbl_constants.h"
+#include "sbl_serdes.h"
+#include "sbl_config_list.h"
+#include "sbl_serdes_map.h"
+#include "sbl_pml_fn.h"
+#include "sbl_internal.h"
+
+static atomic_t sbl_inst_id = ATOMIC_INIT(-1);
+
+static struct sbl_link *sbl_create_link_db(struct sbl_switch_info *switch_info)
+{
+	int i;
+	int j;
+	int err;
+	struct sbl_link *link;
+
+	link = kcalloc(switch_info->num_ports, sizeof(struct sbl_link), GFP_KERNEL);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < switch_info->num_ports; ++i) {
+		err = sbl_link_counters_init(link + i);
+		if (err)
+			goto out_free_sbl_link_counters;
+
+		link[i].num = i;
+		link[i].mconfigured = false;
+		link[i].blconfigured = false;
+		atomic_set(&link[i].debug_config, 0);
+		/* Initialize blattr with default values; these are applied on first config */
+		link[i].blattr.pec.an_mode   = SBL_AN_MODE_OFF;
+		link[i].blattr.link_mode     = SBL_LINK_MODE_BS_200G;
+		link[i].blattr.loopback_mode = SBL_LOOPBACK_MODE_OFF;
+		link[i].blattr.llr_mode      = SBL_LLR_MODE_OFF;
+		link[i].blattr.ifg_config    = SBL_IFG_CONFIG_HPC;
+		link[i].sstate = SBL_SERDES_STATUS_DOWN;
+		link[i].serr = 0;
+		link[i].blstate = SBL_BASE_LINK_STATUS_UNCONFIGURED;
+		link[i].blerr = 0;
+		link[i].link_info = 0;
+		link[i].link_mode     = SBL_LINK_MODE_INVALID;
+		link[i].ifg_config    = SBL_IFG_CONFIG_INVALID;
+		link[i].loopback_mode = SBL_LOOPBACK_MODE_INVALID;
+		link[i].llr_mode      = SBL_LLR_MODE_INVALID;
+		link[i].llr_loop_time = 0;
+		link[i].pcs_config = false;
+		link[i].intr_err_flgs = 0ULL;
+		link[i].an_rx_count = 0;
+		link[i].an_tx_count = 0;
+		link[i].an_timeout_active = false;
+		init_completion(&link[i].an_hw_change);
+		link[i].lp_subtype = SBL_LP_SUBTYPE_INVALID;
+		link[i].tuning_params.tp_state_hash0 = 0;
+		link[i].tuning_params.tp_state_hash1 = 0;
+		link[i].last_start_jiffy = jiffies;
+		link[i].start_cancelled = false;
+		link[i].dfe_tune_count = 0;
+		link[i].optical_delay_active = false;
+		link[i].dfe_predelay_active = false;
+		link[i].pcal_running = false;
+		link[i].tune_param_oob_count = 0;
+		link[i].reload_serdes_fw = false;
+		link[i].pcs_recovery_flag = false;
+		link[i].pml_recovery.started = false;
+		link[i].pml_recovery.rl_window_start = 0;
+		sbl_pml_recovery_init(&link[i].pml_recovery);
+		link[i].fec_discard_time = 0;
+		link[i].fec_discard_type = SBL_FEC_DISCARD_TYPE_INVALID;
+
+		spin_lock_init(&link[i].lock);
+		spin_lock_init(&link[i].timeout_lock);
+		spin_lock_init(&link[i].pcs_recovery_lock);
+		spin_lock_init(&link[i].is_degraded_lock);
+		spin_lock_init(&link[i].fec_discard_lock);
+		mutex_init(&link[i].busy_mtx);
+		mutex_init(&link[i].serdes_mtx);
+		mutex_init(&link[i].tuning_params_mtx);
+	}
+
+	return link;
+
+out_free_sbl_link_counters:
+	for (j = 0; j < i; ++j)
+		sbl_link_counters_term(link + j);
+	kfree(link);
+	return ERR_PTR(-ENOMEM);
+}
+
+/* All operations must be supplied or SBL cannot function */
+#define SBL_SETUP_OP_TBL_ENTRY(e)  \
+	if (ops->e) \
+		sbl->ops.e = ops->e; \
+	else { \
+		sbl_dev_err(sbl->dev, "missing ops tbl entry " #e); \
+		error = true; \
+	}
+
+static int sbl_setup_ops(struct sbl_inst *sbl, const struct sbl_ops *ops)
+{
+	bool error = false;
+
+	if (!ops) {
+		sbl_dev_err(sbl->dev, "missing ops table\n");
+		return -EINVAL;
+	}
+
+	SBL_SETUP_OP_TBL_ENTRY(sbl_read32);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_read64);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_write32);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_write64);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_sbus_op);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_sbus_op_reset);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_is_fabric_link);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_get_max_frame_size);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_pml_install_intr_handler);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_pml_enable_intr_handler);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_pml_disable_intr_handler);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_pml_remove_intr_handler);
+	SBL_SETUP_OP_TBL_ENTRY(sbl_async_alert);
+
+	if (error)
+		return -ENOENT;
+	else
+		return 0;
+}
+
+static int sbl_setup_serdes_configs(struct sbl_inst *sbl)
+{
+	struct sbl_serdes_config default_config;
+
+	spin_lock_init(&sbl->serdes_config_lock);
+	INIT_LIST_HEAD(&sbl->serdes_config_list);
+
+	default_config = (struct sbl_serdes_config)SBL_SERDES_CONFIG_INITIALIZER;
+
+	return sbl_serdes_add_config(sbl, default_config.tp_state_mask0,
+					default_config.tp_state_mask1,
+					default_config.tp_state_match0,
+					default_config.tp_state_match1,
+					default_config.port_mask,
+					default_config.serdes_mask,
+					&default_config.vals, true);
+}
+
+static int sbl_fec_init(struct sbl_inst *sbl)
+{
+	int i, j;
+	struct sbl_link *link;
+
+	for (i = 0; i < SBL_NUM_PORTS; ++i) {
+		link = sbl->link + i;
+
+		link->fec_data = kzalloc(sizeof(struct fec_data), GFP_KERNEL);
+
+		if (!link->fec_data)
+			goto out_free_fec_data;
+
+		link->fec_data->fec_prmts = kzalloc(sizeof(struct sbl_fec), GFP_KERNEL);
+
+		if (!link->fec_data->fec_prmts)
+			goto out_free_fec_data;
+
+		link->fec_data->fec_prmts->fec_curr_cnts = &link->fec_data->fec_prmts->fec_cntrs[0];
+		link->fec_data->fec_prmts->fec_prev_cnts = &link->fec_data->fec_prmts->fec_cntrs[1];
+		link->fec_data->fec_prmts->fec_rates = kzalloc(sizeof(struct sbl_pcs_fec_cntrs), GFP_KERNEL);
+		if (!link->fec_data->fec_prmts->fec_rates)
+			goto out_free_fec_data;
+
+		spin_lock_init(&link->fec_data->fec_prmts->fec_cnt_lock);
+
+		link->fec_data->fec_prmts->fec_ucw_thresh = 0;
+		link->fec_data->fec_prmts->fec_ucw_up_thresh_adj = 100;
+		link->fec_data->fec_prmts->fec_ucw_down_thresh_adj = 100;
+		link->fec_data->fec_prmts->fec_ucw_hwm = 0;
+		link->fec_data->fec_prmts->fec_ccw_thresh = 0;
+		link->fec_data->fec_prmts->fec_ccw_up_thresh_adj = 100;
+		link->fec_data->fec_prmts->fec_ccw_down_thresh_adj = 100;
+		link->fec_data->fec_prmts->fec_stp_ccw_thresh = 0;
+		link->fec_data->fec_prmts->fec_stp_ccw_up_thresh_adj = 100;
+		link->fec_data->fec_prmts->fec_ccw_hwm = 0;
+		link->fec_data->fec_prmts->fecl_warn = 0;
+
+		spin_lock_init(&link->fec_data->fec_prmts->fec_cw_lock);
+		timer_setup(&link->fec_data->fec_timer, sbl_fec_timer, 0);
+		link->fec_data->sbl		= sbl;
+		link->fec_data->port_num = i;
+
+		INIT_WORK(&link->fec_data->fec_timer_work, sbl_fec_timer_work);
+	}
+
+	return 0;
+
+out_free_fec_data:
+	for (j = 0; j <= i; ++j) {
+		link = sbl->link + j;
+		if (link->fec_data) {
+			if (link->fec_data->fec_prmts) {
+				kfree(link->fec_data->fec_prmts->fec_rates);
+				kfree(link->fec_data->fec_prmts);
+			}
+			kfree(link->fec_data);
+			link->fec_data = NULL;
+		}
+	}
+	return -ENOMEM;
+}
+
+/**
+ * sbl_get_version() - Get SBL Version
+ * @major: Major version number
+ * @minor: Minor version number
+ * @inc: Incremented version
+ */
+void sbl_get_version(int *major, int *minor, int *inc)
+{
+	if (major)
+		*major = SBL_VERSION_MAJOR;
+	if (minor)
+		*minor = SBL_VERSION_MINOR;
+	if (inc)
+		*inc = SBL_VERSION_INC;
+}
+EXPORT_SYMBOL(sbl_get_version);
+
+/**
+ * sbl_get_num_sbus_rings() - Get the number of sbus rings
+ * @sbl: A slingshot base link device instance
+ *
+ * Return: number of sbus rings
+ */
+int sbl_get_num_sbus_rings(struct sbl_inst *sbl)
+{
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	return sbl->switch_info->num_sbus_rings;
+}
+EXPORT_SYMBOL(sbl_get_num_sbus_rings);
+
+/**
+ * sbl_new_instance() - Create new sbl instance
+ * @accessor: Determined by the client driver, Which acts
+ *            as abstraction to perform low-level operation
+ * @pci_accessor: Points to bus/vendor specific PCI access
+ * @ops: callback function operations
+ * @init_attr: Pointer to struct sbl_init_attr
+ *
+ * This function initializes multiple members which
+ * helps to create new sbl instance
+ *
+ * Return: sbl instance on success, negative error code on failure
+ */
+struct sbl_inst *sbl_new_instance(void *accessor, void *pci_accessor,
+				  const struct sbl_ops *ops,
+				  struct sbl_init_attr *init_attr)
+{
+	struct sbl_inst *sbl;
+	struct device *dev = sbl_get_device();
+	int err;
+	int i;
+
+	if (!accessor || !pci_accessor || !ops || !init_attr) {
+		err = -EINVAL;
+		goto out;
+	}
+	if (init_attr->magic != SBL_INIT_ATTR_MAGIC) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	sbl = kzalloc(sizeof(struct sbl_inst), GFP_KERNEL);
+	if (!sbl) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	sbl->magic = SBL_MAGIC;
+	spin_lock_init(&sbl->name_lock);
+	sbl->id = atomic_inc_return(&sbl_inst_id);
+	sbl->dev = dev;
+	sbl->accessor = accessor;
+	sbl->pci_accessor = pci_accessor;
+	sbl->sbus_op_flags = SBL_DFLT_SBUS_OP_FLAGS_SLOW;
+
+	sbl->workq = alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_UNBOUND, 0, "sbl-fec");
+	if (!sbl->workq) {
+		err = -ENOMEM;
+		goto out_free_sbl;
+	}
+
+	/* Initialize the hardware-specific map */
+	err = sbl_switch_info_get(sbl, init_attr);
+
+	if (err)
+		goto out_free;
+
+	sbl_dev_info(dev, "new instance (%d): %d ports x %d serdes\n", sbl->id,
+		     sbl->switch_info->num_ports, sbl->switch_info->num_serdes);
+
+	sbl->sbus_ring_mtx =
+		kcalloc(sbl->switch_info->num_sbus_rings, sizeof(struct mutex), GFP_KERNEL);
+	if (!sbl->sbus_ring_mtx) {
+		err = -ENOMEM;
+		goto out_free;
+	}
+
+	sbl->sbm_fw_mtx =
+		kzalloc(sbl->switch_info->num_sbus_rings * sizeof(struct mutex), GFP_KERNEL);
+	if (!sbl->sbm_fw_mtx) {
+		err = -ENOMEM;
+		goto out_free_sbus_mtx;
+	}
+
+	sbl->reload_sbm_fw =
+		kzalloc(sbl->switch_info->num_sbus_rings * sizeof(bool), GFP_KERNEL);
+	if (!sbl->reload_sbm_fw) {
+		err = -ENOMEM;
+		goto out_free_sbm_fw_mtx;
+	}
+
+	sbl->sbm_fw_reload_count =
+		kzalloc(sbl->switch_info->num_sbus_rings * sizeof(atomic_t), GFP_KERNEL);
+	if (!sbl->sbm_fw_reload_count) {
+		err = -ENOMEM;
+		goto out_free_reload_sbm;
+	}
+
+	for (i = 0; i < sbl->switch_info->num_sbus_rings; ++i) {
+		mutex_init(&sbl->sbus_ring_mtx[i]);
+		mutex_init(&sbl->sbm_fw_mtx[i]);
+		sbl->reload_sbm_fw[i] = false;
+		atomic_set(&sbl->sbm_fw_reload_count[i], 0);
+	}
+
+	/* setup the op table */
+	err = sbl_setup_ops(sbl, ops);
+	if (err) {
+		sbl_dev_err(sbl->dev, "op table setup failed [%d]\n", err);
+		goto out_free_sbm_fw_reload_count;
+	}
+
+	/* setup serdes lock, configuration list and add default */
+	err = sbl_setup_serdes_configs(sbl);
+	if (err) {
+		sbl_dev_err(sbl->dev, "serdes setup failed [%d]\n", err);
+		goto out_free_sbm_fw_reload_count;
+	}
+
+	/* create link database */
+	sbl->link = sbl_create_link_db(sbl->switch_info);
+	if (IS_ERR(sbl->link)) {
+		err = PTR_ERR(sbl->link);
+		sbl_dev_err(sbl->dev, "link db creation failed [%d]\n", err);
+		goto out_free_configs;
+	}
+
+	err = sbl_fec_init(sbl);
+	if (err) {
+		sbl_dev_err(sbl->dev, "fec init failed [%d]\n", err);
+		goto out_free_link;
+	}
+
+	for (i = 0; i < sbl->switch_info->num_ports; ++i) {
+		/* ensure no valid saved tuning params */
+		sbl_serdes_invalidate_tuning_params(sbl, i);
+
+		/* set default values for PML */
+		sbl_pml_set_defaults(sbl, i);
+	}
+
+	return sbl;
+
+out_free_link:
+	for (i = 0; i < sbl->switch_info->num_ports; ++i)
+		sbl_link_counters_term(sbl->link + i);
+	kfree(sbl->link);
+out_free_configs:
+	sbl_serdes_clear_all_configs(sbl, true /* clear default */);
+out_free_sbm_fw_reload_count:
+	kfree(sbl->sbm_fw_reload_count);
+out_free_reload_sbm:
+	kfree(sbl->reload_sbm_fw);
+out_free_sbm_fw_mtx:
+	kfree(sbl->sbm_fw_mtx);
+out_free_sbus_mtx:
+	kfree(sbl->sbus_ring_mtx);
+out_free:
+	destroy_workqueue(sbl->workq);
+out_free_sbl:
+	kfree(sbl);
+out:
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL(sbl_new_instance);
+
+/**
+ * sbl_delete_instance() - Delete sbl instance
+ * @sbl: A slingshot base link device instance
+ *
+ * This function clears the config and frees all
+ * memory associated with an SBL.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_delete_instance(struct sbl_inst *sbl)
+{
+	struct sbl_link *link;
+	int err;
+	int i;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	for (i = 0; i < sbl->switch_info->num_ports; ++i) {
+		link = sbl->link + i;
+		if (!link->intr_err_flgs)
+			continue;
+		err = sbl_pml_disable_intr_handler(sbl, i, link->intr_err_flgs);
+		if (err)
+			return err;
+		err = sbl_pml_remove_intr_handler(sbl, i);
+		if (err)
+			return err;
+	}
+
+	for (i = 0; i < sbl->switch_info->num_ports; ++i)
+		sbl_pml_recovery_cancel(sbl, i);
+	for (i = 0; i < SBL_NUM_PORTS; ++i) {
+		link = sbl->link + i;
+
+		timer_shutdown_sync(&link->fec_data->fec_timer);
+		cancel_work_sync(&link->fec_data->fec_timer_work);
+		kfree(link->fec_data->fec_prmts->fec_rates);
+		link->fec_data->fec_prmts->fec_rates = NULL;
+		kfree(link->fec_data->fec_prmts);
+		link->fec_data->fec_prmts = NULL;
+		kfree(link->fec_data);
+		link->fec_data = NULL;
+	}
+
+	for (i = 0; i < sbl->switch_info->num_ports; ++i)
+		sbl_link_counters_term(sbl->link + i);
+
+	kfree(sbl->link);
+	sbl_serdes_clear_all_configs(sbl, true /* clear default */);
+	kfree(sbl->sbm_fw_reload_count);
+	kfree(sbl->reload_sbm_fw);
+	kfree(sbl->sbm_fw_mtx);
+	kfree(sbl->sbus_ring_mtx);
+	flush_workqueue(sbl->workq);
+	destroy_workqueue(sbl->workq);
+	sbl->magic = 0;   /* paranoia */
+	kfree(sbl);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_delete_instance);
+
+/**
+ * sbl_initialise_instance() - Initialize the instance
+ * @sbl: A slingshot base link device instance
+ * @attr: Pointer to struct sbl_instance_attr
+ *
+ * This function loads required firmware to SBM/Serdes as part of
+ * Initialising the base link instance
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_initialise_instance(struct sbl_inst *sbl, struct sbl_instance_attr *attr)
+{
+	unsigned long flags;
+	int err;
+
+	if (!attr)
+		return -EINVAL;
+
+	if (attr->magic != SBL_INSTANCE_ATTR_MAGIC)
+		return -EINVAL;
+
+	spin_lock_irqsave(&sbl->name_lock, flags);
+	memcpy(&sbl->iattr, attr, sizeof(struct sbl_instance_attr));
+	spin_unlock_irqrestore(&sbl->name_lock, flags);
+
+	/* load the required firmware
+	 * force load all ports if serdes firmware validation fails
+	 */
+	err = sbl_serdes_load(sbl, SBL_ALL_PORTS, false);
+	if (err) {
+		sbl_dev_err(sbl->dev, "initial serdes fw load failed [%d]", err);
+		return err;
+	}
+	sbl_dev_err(sbl->dev, "serdes fw loaded");
+
+	return 0;
+
+}
+EXPORT_SYMBOL(sbl_initialise_instance);
+
+/**
+ * sbl_restore_instance() - Restoring instance
+ * @sbl: A slingshot base link device instance
+ *
+ * Return: negative error code on failure
+ */
+int sbl_restore_instance(struct sbl_inst *sbl)
+{
+	sbl_dev_err(sbl->dev, "Restoring an instance not supported (yet)\n");
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL(sbl_restore_instance);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_inst_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_inst_nic.c
new file mode 100644
index 000000000000..cc3d3b570fc9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_inst_nic.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_fec.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <uapi/ethernet/sbl_cassini.h>
+
+#include "sbl_serdes_map.h"
+#include "sbl_internal.h"
+
+static struct sbl_switch_info cas_brazos_switch_info = SBL_CASSINI_BRAZOS_SW_INFO_INITIALIZER;
+static struct sbl_switch_info cas_nic0_switch_info = SBL_CASSINI_NIC0_SW_INFO_INITIALIZER;
+static struct sbl_switch_info cas_nic1_switch_info = SBL_CASSINI_NIC1_SW_INFO_INITIALIZER;
+
+/**
+ * sbl_set_eth_name() - Set ethernet interface name
+ * @sbl: A slingshot base link device instance
+ * @name: String used to set as interface name
+ */
+void sbl_set_eth_name(struct sbl_inst *sbl, const char *name)
+{
+	unsigned long flags;
+
+	if (!sbl || !name)
+		return;
+
+	spin_lock_irqsave(&sbl->name_lock, flags);
+	strscpy(sbl->iattr.eth_if_name, name, sizeof(sbl->iattr.eth_if_name));
+	spin_unlock_irqrestore(&sbl->name_lock, flags);
+
+	sbl_dev_info(sbl->dev, "eth if name changed to %s", name);
+}
+EXPORT_SYMBOL(sbl_set_eth_name);
+
+int sbl_switch_info_get(struct sbl_inst *sbl, struct sbl_init_attr *init_attr)
+{
+	sbl->is_hw = init_attr->is_hw;
+	switch (init_attr->uc_platform) {
+	case SBL_UC_PLATFORM_SAWTOOTH:
+		if (init_attr->uc_nic == 0) {
+			sbl->switch_info = &cas_nic0_switch_info;
+		} else if (init_attr->uc_nic == 1) {
+			sbl->switch_info = &cas_nic1_switch_info;
+		} else {
+			sbl_dev_err(sbl->dev, "Bad NIC index (%d)!\n",
+				    init_attr->uc_nic);
+			return -EINVAL;
+		}
+		break;
+	case SBL_UC_PLATFORM_BRAZOS:
+		sbl->switch_info = &cas_brazos_switch_info;
+		break;
+	case SBL_UC_PLATFORM_UNDEFINED:
+		sbl_dev_err(sbl->dev, "Undefined uC platform!\n");
+		return -EINVAL;
+	default:
+		sbl_dev_err(sbl->dev, "Unknown uC platform (%d)!\n", init_attr->uc_platform);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_internal.c b/drivers/net/ethernet/hpe/sbl/sbl_internal.c
new file mode 100644
index 000000000000..aeac466f3c47
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_internal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019-2020,2022-2024 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <uapi/ethernet/sbl-abi.h>
+
+#include "sbl_constants.h"
+#include "sbl_internal.h"
+#include "sbl_serdes_map.h"
+
+/* validate a port (link) number */
+int sbl_validate_port_num(struct sbl_inst *sbl, int port_num)
+{
+	if (port_num < 0 || port_num >= sbl->switch_info->num_ports)
+		return -EINVAL;
+	return 0;
+}
+
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_misc.c b/drivers/net/ethernet/hpe/sbl/sbl_misc.c
new file mode 100644
index 000000000000..2ed99dea9511
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_misc.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2024 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include <uapi/ethernet/sbl-abi.h>
+
+#include "sbl_constants.h"
+#include "sbl_internal.h"
+
+/**
+ * sbl_link_state_str() - Get link status as string
+ * @state: This Value used to find status
+ *
+ * Get link status as string based on value 'state'
+ * provided from caller.
+ *
+ * Return: link status as string
+ */
+const char *sbl_link_state_str(enum sbl_base_link_status state)
+{
+	switch (state) {
+	case SBL_BASE_LINK_STATUS_UNKNOWN:      return "unknown";
+	case SBL_BASE_LINK_STATUS_RESETTING:    return "resetting";
+	case SBL_BASE_LINK_STATUS_UNCONFIGURED: return "unconfigured";
+	case SBL_BASE_LINK_STATUS_STARTING:     return "starting";
+	case SBL_BASE_LINK_STATUS_UP:           return "up";
+	case SBL_BASE_LINK_STATUS_STOPPING:     return "stopping";
+	case SBL_BASE_LINK_STATUS_DOWN:         return "down";
+	case SBL_BASE_LINK_STATUS_ERROR:        return "error";
+	default:                                return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_link_state_str);
+
+/**
+ * sbl_link_len_str() - Get cable length as string
+ * @len: Value used to find link length
+ *
+ * Get Cable length as string based on the 'len' provided
+ * from the caller.
+ *
+ * Return: Link length as string
+ */
+const char *sbl_link_len_str(enum sbl_link_len len)
+{
+	switch (len) {
+	case SBL_LINK_LEN_INVALID:   return "invalid";
+	case SBL_LINK_LEN_BACKPLANE: return "backplane";
+	case SBL_LINK_LEN_000_300:   return "0.30m";
+	case SBL_LINK_LEN_000_400:   return "0.40m";
+	case SBL_LINK_LEN_000_750:   return "0.75m";
+	case SBL_LINK_LEN_000_800:   return "0.80m";
+	case SBL_LINK_LEN_001_000:   return "1.00m";
+	case SBL_LINK_LEN_001_100:   return "1.10m";
+	case SBL_LINK_LEN_001_150:   return "1.15m";
+	case SBL_LINK_LEN_001_200:   return "1.20m";
+	case SBL_LINK_LEN_001_400:   return "1.40m";
+	case SBL_LINK_LEN_001_420:   return "1.42m";
+	case SBL_LINK_LEN_001_500:   return "1.50m";
+	case SBL_LINK_LEN_001_600:   return "1.60m";
+	case SBL_LINK_LEN_001_640:   return "1.64m";
+	case SBL_LINK_LEN_001_700:   return "1.70m";
+	case SBL_LINK_LEN_001_800:   return "1.80m";
+	case SBL_LINK_LEN_001_900:   return "1.90m";
+	case SBL_LINK_LEN_001_910:   return "1.91m";
+	case SBL_LINK_LEN_002_000:   return "2.00m";
+	case SBL_LINK_LEN_002_100:   return "2.10m";
+	case SBL_LINK_LEN_002_130:   return "2.13m";
+	case SBL_LINK_LEN_002_200:   return "2.20m";
+	case SBL_LINK_LEN_002_300:   return "2.30m";
+	case SBL_LINK_LEN_002_390:   return "2.39m";
+	case SBL_LINK_LEN_002_400:   return "2.40m";
+	case SBL_LINK_LEN_002_500:   return "2.50m";
+	case SBL_LINK_LEN_002_600:   return "2.60m";
+	case SBL_LINK_LEN_002_620:   return "2.62m";
+	case SBL_LINK_LEN_002_700:   return "2.70m";
+	case SBL_LINK_LEN_002_800:   return "2.80m";
+	case SBL_LINK_LEN_002_900:   return "2.90m";
+	case SBL_LINK_LEN_002_990:   return "2.99m";
+	case SBL_LINK_LEN_003_000:   return "3.00m";
+	case SBL_LINK_LEN_004_000:   return "4.00m";
+	case SBL_LINK_LEN_005_000:   return "5.00m";
+	case SBL_LINK_LEN_006_000:   return "6.00m";
+	case SBL_LINK_LEN_007_000:   return "7.00m";
+	case SBL_LINK_LEN_008_000:   return "8.00m";
+	case SBL_LINK_LEN_010_000:   return "10.00m";
+	case SBL_LINK_LEN_014_000:   return "14.00m";
+	case SBL_LINK_LEN_015_000:   return "15.00m";
+	case SBL_LINK_LEN_019_000:   return "19.00m";
+	case SBL_LINK_LEN_025_000:   return "25.00m";
+	case SBL_LINK_LEN_030_000:   return "30.00m";
+	case SBL_LINK_LEN_035_000:   return "35.00m";
+	case SBL_LINK_LEN_050_000:   return "50.00m";
+	case SBL_LINK_LEN_075_000:   return "75.00m";
+	case SBL_LINK_LEN_100_000:   return "100.00m";
+	default:                     return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_link_len_str);
+
+/**
+ * sbl_link_vendor_str() - Get cable vendor as string
+ * @vendor: Value to find vendor
+ *
+ * Get cable vendor information as string
+ * based on 'vendor' value
+ *
+ * Return: Vendor name as string
+ */
+const char *sbl_link_vendor_str(enum sbl_link_vendor vendor)
+{
+	switch (vendor) {
+	case SBL_LINK_VENDOR_INVALID:        return "invalid";
+	case SBL_LINK_VENDOR_TE:             return "TE Connectivity";
+	case SBL_LINK_VENDOR_LEONI:          return "Leoni";
+	case SBL_LINK_VENDOR_MOLEX:          return "Molex";
+	case SBL_LINK_VENDOR_HISENSE:        return "Hisense";
+	case SBL_LINK_VENDOR_DUST_PHOTONICS: return "Dust Photonics";
+	case SBL_LINK_VENDOR_FINISAR:        return "Finisar";
+	case SBL_LINK_VENDOR_LUXSHARE:       return "Luxshare";
+	case SBL_LINK_VENDOR_FIT:            return "FIT";
+	case SBL_LINK_VENDOR_FT:             return "FT";
+	case SBL_LINK_VENDOR_MELLANOX:       return "Mellanox";
+	case SBL_LINK_VENDOR_HITACHI:        return "Hitachi";
+	case SBL_LINK_VENDOR_HPE:            return "HPE";
+	case SBL_LINK_VENDOR_CLOUD_LIGHT:    return "Cloud Light";
+	case SBL_LINK_VENDOR_AMPHENOL:       return "Amphenol";
+	default:                             return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_link_vendor_str);
+
+/**
+ * sbl_link_media_str() - Get type of the link media as string
+ * @media: Value used to find media used
+ *
+ * Get physical type of the link media as string
+ *  based on 'media' value provided from caller.
+ *
+ * Return: Media used as string
+ */
+const char *sbl_link_media_str(enum sbl_link_media media)
+{
+	switch (media) {
+	case SBL_LINK_MEDIA_INVALID:         return "invalid";
+	case SBL_LINK_MEDIA_UNKNOWN:         return "unknown";
+	case SBL_LINK_MEDIA_ELECTRICAL:      return "electrical";
+	case SBL_LINK_MEDIA_OPTICAL:         return "optical";
+	default:                             return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_link_media_str);
+
+/**
+ * sbl_an_mode_str() - Get AN modes for a link as a string
+ * @mode: Value used to find the auto negotiation mode
+ *
+ * Get auto negotiation mode as string based on value 'mode'
+ *
+ * Return: Auto negotiation status as string
+ */
+const char *sbl_an_mode_str(enum sbl_an_mode mode)
+{
+	switch (mode) {
+	case SBL_AN_MODE_INVALID: return "invalid";
+	case SBL_AN_MODE_UNKNOWN: return "unknown";
+	case SBL_AN_MODE_OFF:     return "off";
+	case SBL_AN_MODE_ON:      return "on";
+	case SBL_AN_MODE_FIXED:   return "fixed";
+	default:                  return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_an_mode_str);
+
+/**
+ * sbl_link_mode_str() - Get IEEE mode for a link as string
+ * @mode: Value used to find the link mode
+ *
+ * Get Link mode as string based on value 'mode'
+ *
+ * Return: Link mode as string
+ */
+const char *sbl_link_mode_str(enum sbl_link_mode mode)
+{
+	switch (mode) {
+	case SBL_LINK_MODE_INVALID: return "invalid";
+	case SBL_LINK_MODE_BS_200G: return "BS_200G";
+	case SBL_LINK_MODE_BJ_100G: return "BJ_100G";
+	case SBL_LINK_MODE_CD_100G: return "CD_100G";
+	case SBL_LINK_MODE_CD_50G:  return "CD_50G";
+	default:                    return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_link_mode_str);
+
+/**
+ * sbl_rs_mode_str() - Get FEC (Reed-Solomon) mode
+ * @mode: Contains RS MODE selection value
+ *
+ * Return: RS MODE as string
+ */
+const char *sbl_rs_mode_str(enum sbl_rs_mode mode)
+{
+	switch (mode) {
+	case SBL_RS_MODE_INVALID:        return "invalid";
+	case SBL_RS_MODE_UNKNOWN:        return "unknown";
+	case SBL_RS_MODE_OFF:            return "error correction OFF error checking OFF syndrome checking OFF marking OFF";
+	case SBL_RS_MODE_OFF_SYN:        return "error correction OFF error checking OFF syndrome checking  ON marking OFF";
+	case SBL_RS_MODE_OFF_CHK:        return "error correction OFF error checking  ON syndrome checking OFF marking OFF";
+	case SBL_RS_MODE_ON:             return "error correction  ON error checking  ON syndrome checking OFF marking OFF";
+	case SBL_RS_MODE_ON_SYN_MRK:     return "error correction  ON error checking OFF syndrome checking  ON marking  ON";
+	case SBL_RS_MODE_ON_CHK_SYN_MRK: return "error correction  ON error checking  ON syndrome checking  ON marking  ON";
+	default:                         return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_rs_mode_str);
+
+/**
+ * sbl_ifg_mode_str() - Get Inter-frame gap mode as string
+ * @mode: Value
+ *
+ * Return: IFG mode as string
+ */
+const char *sbl_ifg_mode_str(enum sbl_ifg_mode mode)
+{
+	switch (mode) {
+	case SBL_IFG_MODE_INVALID:  return "invalid";
+	case SBL_IFG_MODE_UNKNOWN:  return "unknown";
+	case SBL_IFG_MODE_HPC:      return "hpc";
+	case SBL_IFG_MODE_IEEE:     return "ieee";
+	default:                    return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_ifg_mode_str);
+
+/**
+ * sbl_ifg_config_str() - Get IFG config as string
+ * @config: Value
+ *
+ * Get IFG config as string based on 'config' value.
+ *
+ * Return: IFG Config as string
+ */
+const char *sbl_ifg_config_str(enum sbl_ifg_config config)
+{
+	switch (config) {
+	case SBL_IFG_CONFIG_INVALID:   return "invalid";
+	case SBL_IFG_CONFIG_UNKNOWN:   return "unknown";
+	case SBL_IFG_CONFIG_HPC:       return "hpc";
+	case SBL_IFG_CONFIG_IEEE_200G: return "ieee 200G";
+	case SBL_IFG_CONFIG_IEEE_100G: return "ieee 100G";
+	case SBL_IFG_CONFIG_IEEE_50G:  return "ieee 50G";
+	default:                       return "unrecognized";
+}
+
+}
+EXPORT_SYMBOL(sbl_ifg_config_str);
+
+/**
+ * sbl_llr_mode_str() - Get link-level retry (LLR) mode as string
+ * @mode: Value
+ *
+ * Get llr mode as string based on value 'mode'
+ *
+ * Return: LLR mode as string
+ */
+const char *sbl_llr_mode_str(enum sbl_llr_mode mode)
+{
+	switch (mode) {
+	case SBL_LLR_MODE_INVALID:  return "invalid";
+	case SBL_LLR_MODE_UNKNOWN:  return "unknown";
+	case SBL_LLR_MODE_OFF:      return "off";
+	case SBL_LLR_MODE_MONITOR:  return "monitor";
+	case SBL_LLR_MODE_ON:       return "on";
+	case SBL_LLR_MODE_AUTO:     return "auto";
+	default:                    return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_llr_mode_str);
+
+/**
+ * sbl_llr_down_behaviour_str() - Get LLR link down behaviour
+ * @behaviour: Value used to find the link down behaviour
+ *
+ * Get LLR link down behaviour as string based on 'behaviour'
+ * value provided.
+ *
+ * Return: LLR Link down behaviour as string
+ */
+const char *sbl_llr_down_behaviour_str(
+		enum sbl_llr_down_behaviour behaviour)
+{
+	switch (behaviour) {
+	case SBL_LLR_LINK_DOWN_INVALID:      return "invalid";
+	case SBL_LLR_LINK_DOWN_UNKNOWN:      return "unknown";
+	case SBL_LLR_LINK_DOWN_DISCARD:      return "discard";
+	case SBL_LLR_LINK_DOWN_BLOCK:        return "block";
+	case SBL_LLR_LINK_DOWN_BEST_EFFORT:  return "best-effort";
+	default:                             return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_llr_down_behaviour_str);
+
+/**
+ * sbl_loopback_mode_str() - Get loopback mode status
+ * @state: Value used to find loopback mode
+ *
+ * Get loopback mode as string based on 'state' provided.
+ *
+ * Return: Loopback mode as string
+ */
+const char *sbl_loopback_mode_str(enum sbl_loopback_mode state)
+{
+	switch (state) {
+	case SBL_LOOPBACK_MODE_INVALID:  return "invalid";
+	case SBL_LOOPBACK_MODE_LOCAL:    return "local";
+	case SBL_LOOPBACK_MODE_REMOTE:   return "remote";
+	case SBL_LOOPBACK_MODE_OFF:      return "off";
+	default:                         return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_loopback_mode_str);
+
+const char *sbl_serdes_effort_str(u32 effort)
+{
+	switch (effort) {
+	case SPICO_INT_DATA_ICAL_EFFORT_1:   return "max";
+	case SPICO_INT_DATA_ICAL_EFFORT_10:  return "med";
+	case SPICO_INT_DATA_ICAL_EFFORT_0:   return "min";
+	default:                             return "unrecognized";
+	}
+}
+
+/**
+ * sbl_serdes_state_str() - Get serdes state as string
+ * @state: Value used to find status
+ *
+ * Get serdes state as string based on 'state' value.
+ *
+ * Return: Serdes state as string
+ */
+const char *sbl_serdes_state_str(enum sbl_serdes_status state)
+{
+	switch (state) {
+	case SBL_SERDES_STATUS_UNKNOWN:             return "unknown";
+	case SBL_SERDES_STATUS_AUTONEG:             return "autoneg-mode";
+	case SBL_SERDES_STATUS_LPD_MT:              return "lpd-mt";
+	case SBL_SERDES_STATUS_DOWN:                return "down";
+	case SBL_SERDES_STATUS_TUNING:              return "tuning";
+	case SBL_SERDES_STATUS_RUNNING:             return "running";
+	case SBL_SERDES_STATUS_ERROR:               return "error";
+	case SBL_SERDES_STATUS_RESETTING:           return "resetting";
+	default:                                    return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_serdes_state_str);
+
+const char *sbl_an_state_str(int state)
+{
+	switch (state) {
+	case SBL_PML_AUTONEG_STATE_AUTONEG_OFF:    return "off";
+	case SBL_PML_AUTONEG_STATE_AUTONEG_ENABLE: return "enable";
+	case SBL_PML_AUTONEG_STATE_TX_DISABLE:     return "tx_disable";
+	case SBL_PML_AUTONEG_STATE_ABILITY_DETECT: return "ability_detect";
+	case SBL_PML_AUTONEG_STATE_ACK_DETECT:     return "ack_detect";
+	case SBL_PML_AUTONEG_STATE_COMPLETE_ACK:   return "complete_ack";
+	case SBL_PML_AUTONEG_STATE_NEXT_PAGE_WAIT: return "next_page_wait";
+	case SBL_PML_AUTONEG_STATE_AN_GOOD_CHECK:  return "good_check";
+	case SBL_PML_AUTONEG_STATE_AN_GOOD:        return "good";
+	default:                                   return "unrecognized";
+	}
+}
+
+/**
+ * sbl_async_alert_str() - Get Async alert type as string
+ * @alert_type: Value
+ *
+ * Get Async alert type as string based on 'alert_type' provided.
+ *
+ * Return: ASYNC ALERT as string
+ */
+const char *sbl_async_alert_str(enum sbl_async_alert_type alert_type)
+{
+	switch (alert_type) {
+	case SBL_ASYNC_ALERT_INVALID:              return "invalid";
+	case SBL_ASYNC_ALERT_LINK_DOWN:            return "link down";
+	case SBL_ASYNC_ALERT_SERDES_FW_CORRUPTION: return "serdes fw corruption";
+	case SBL_ASYNC_ALERT_TX_DEGRADE:           return "tx degrade";
+	case SBL_ASYNC_ALERT_RX_DEGRADE:           return "rx degrade";
+	case SBL_ASYNC_ALERT_TX_DEGRADE_FAILURE:   return "tx degrade failure";
+	case SBL_ASYNC_ALERT_RX_DEGRADE_FAILURE:   return "rx degrade failure";
+	case SBL_ASYNC_ALERT_SBM_FW_LOAD_FAILURE:  return "sbus master fw load failure";
+	default:                                   return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_async_alert_str);
+
+/**
+ * sbl_fec_discard_str() - Get discard fec type as string
+ * @discard_type: Value used to find discard type
+ *
+ * Get discard fec type as string based on 'discard_type' provided.
+ *
+ * Return: Discard type as string
+ */
+const char *sbl_fec_discard_str(enum sbl_fec_discard_type discard_type)
+{
+	switch (discard_type) {
+	case SBL_FEC_DISCARD_TYPE_INVALID:         return "invalid";
+	case SBL_FEC_DISCARD_TYPE_RX_DEGRADE:      return "rx lane degraded";
+	case SBL_FEC_DISCARD_TYPE_PML_REC_START:   return "pml recovery started";
+	case SBL_FEC_DISCARD_TYPE_PML_REC_END:     return "pml recovery ended";
+	default:                                   return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_fec_discard_str);
+
+/**
+ * sbl_down_origin_str() - Get link down reason as string
+ * @down_origin: Value used to find link down origin
+ *
+ * Get the reason for taking link down asynchronously as string
+ * based on 'down_origin' provided.
+ *
+ * Return: Link down origin as string
+ */
+const char *sbl_down_origin_str(enum sbl_link_down_origin down_origin)
+{
+	switch (down_origin) {
+	case SBL_LINK_DOWN_ORIGIN_UNKNOWN:         return "unknown";
+	case SBL_LINK_DOWN_ORIGIN_LINK_DOWN:       return "link down";
+	case SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT:     return "local fault";
+	case SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT:    return "remote fault";
+	case SBL_LINK_DOWN_ORIGIN_ALIGN:           return "align";
+	case SBL_LINK_DOWN_ORIGIN_HISER:           return "hiser";
+	case SBL_LINK_DOWN_ORIGIN_LLR_MAX:         return "max llr replay";
+	case SBL_LINK_DOWN_ORIGIN_DEGRADE_FAILURE: return "degrade failure";
+	case SBL_LINK_DOWN_ORIGIN_UCW:             return "uncorrected fec";
+	case SBL_LINK_DOWN_ORIGIN_CCW:             return "corrected fec";
+	case SBL_LINK_DOWN_ORIGIN_LLR_TX_REPLAY:   return "llr tx replay";
+	default:                                   return "unrecognized";
+	}
+}
+EXPORT_SYMBOL(sbl_down_origin_str);
+
+/**
+ * sbl_flags_get_poll_interval_from_flags() - Get interval for sbus operations
+ * @flags: Value
+ *
+ * This function get Interval value which is needed time to wait
+ * between sbus operations
+ *
+ * Return: Interval value on success, 0 if no flag is found
+ */
+int sbl_flags_get_poll_interval_from_flags(unsigned int flags)
+{
+	if (flags & SBL_FLAG_INTERVAL_1MS)
+		return 1;
+	else if (flags & SBL_FLAG_INTERVAL_10MS)
+		return 10;
+	else if (flags & SBL_FLAG_INTERVAL_100MS)
+		return 100;
+	else if (flags & SBL_FLAG_INTERVAL_1S)
+		return 1000;
+	else
+		return 0;
+}
+EXPORT_SYMBOL(sbl_flags_get_poll_interval_from_flags);
+
+/**
+ * sbl_flags_get_delay_from_flags() - Get delay for sbus operations
+ * @flags: Value
+ *
+ * This function get sbus delay. Delays are the time to pause
+ * before issuing first operation of sbus
+ *
+ * Return: Delay value on success, 0 if no flag is found
+ */
+int sbl_flags_get_delay_from_flags(unsigned int flags)
+{
+	if (flags & SBL_FLAG_DELAY_3US)
+		return 3;
+	else if (flags & SBL_FLAG_DELAY_4US)
+		return 4;
+	else if (flags & SBL_FLAG_DELAY_5US)
+		return 5;
+	else if (flags & SBL_FLAG_DELAY_10US)
+		return 10;
+	else if (flags & SBL_FLAG_DELAY_20US)
+		return 20;
+	else if (flags & SBL_FLAG_DELAY_50US)
+		return 50;
+	else if (flags & SBL_FLAG_DELAY_100US)
+		return 100;
+	else
+		return 0;
+}
+EXPORT_SYMBOL(sbl_flags_get_delay_from_flags);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_module_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_module_nic.c
new file mode 100644
index 000000000000..a26eb357adb6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_module_nic.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/version.h>
+#include <linux/of.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include "sbl_internal.h"
+#include "sbl_serdes_map.h"
+
+#define DEVICE_NAME         "sbl"
+
+static struct class  *sbl_cls;
+static struct device *sbl_dev;
+static dev_t          sbl_devt;
+
+#define tostr(x) #x
+#define version_str(a, b, c) tostr(a.b.c)
+#define SBL_VERSION_STR version_str(SBL_VERSION_MAJOR,	\
+				    SBL_VERSION_MINOR,	\
+				    SBL_VERSION_INC)
+
+/*   module init function
+ *
+ *   The char device is only used for fw loading and printing to the console
+ *   For now multiple instances all share the same device
+ */
+static int __init sbl_init(void)
+{
+	int err;
+
+	pr_info("%s : v%s loading (%s build)\n", module_name(THIS_MODULE),
+		SBL_VERSION_STR, SBL_BUILD_NAME);
+
+	/* create a device */
+	err = alloc_chrdev_region(&sbl_devt, 0, 1, DEVICE_NAME);
+	if (err) {
+		pr_err("%s : failed to get dev region [%d]\n",
+		       module_name(THIS_MODULE), err);
+		goto out;
+	}
+
+		sbl_cls = class_create(DEVICE_NAME);
+	if (IS_ERR(sbl_cls)) {
+		pr_err("%s : class create failed [%ld]\n",
+		       module_name(THIS_MODULE), PTR_ERR(sbl_cls));
+		err = PTR_ERR(sbl_cls);
+		goto out_region;
+	}
+
+	sbl_dev = device_create(sbl_cls, NULL, sbl_devt, NULL,
+				module_name(THIS_MODULE));
+	if (IS_ERR(sbl_dev)) {
+		err = PTR_ERR(sbl_dev);
+		pr_err("%s : failed to add dev [%d]\n",
+		       module_name(THIS_MODULE), err);
+		goto out_class;
+	}
+
+	return 0;
+
+out_class:
+	class_destroy(sbl_cls);
+out_region:
+	unregister_chrdev_region(sbl_devt, 1);
+out:
+	return err;
+}
+module_init(sbl_init);
+
+struct device *sbl_get_device(void)
+{
+	return sbl_dev;
+}
+
+/* module exit function */
+static void __exit sbl_exit(void)
+{
+	pr_info("%s : module unloading\n", module_name(THIS_MODULE));
+
+	device_destroy(sbl_cls, sbl_devt);
+	class_destroy(sbl_cls);
+	unregister_chrdev_region(sbl_devt, 1);
+}
+module_exit(sbl_exit);
+
+static int llr_cap_set(const char *val, const struct kernel_param *kp)
+{
+	int           err;
+	unsigned long data;
+
+	err = kstrtoul(val, 0, &data);
+	if (err || data > 0x800)
+		return -EINVAL;
+
+	return param_set_ulong(val, kp);
+}
+
+static const struct kernel_param_ops llr_cap_ops = {
+	.set = llr_cap_set,
+	.get = param_get_ulong,
+};
+
+static unsigned long llr_edge_cap_data_max = 0x320;
+module_param_cb(llr_edge_cap_data_max, &llr_cap_ops, &llr_edge_cap_data_max, 0664);
+MODULE_PARM_DESC(llr_edge_cap_data_max, "LLR data capacity max for edge link");
+u64 sbl_llr_edge_cap_data_max_get(void)
+{
+	return llr_edge_cap_data_max;
+}
+
+static unsigned long llr_edge_cap_seq_max = 0x160;
+module_param_cb(llr_edge_cap_seq_max, &llr_cap_ops, &llr_edge_cap_seq_max, 0664);
+MODULE_PARM_DESC(llr_edge_cap_seq_max, "LLR sequence num capacity max for edge link");
+u64 sbl_llr_edge_cap_seq_max_get(void)
+{
+	return llr_edge_cap_seq_max;
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("HPE Slingshot <support@hpe.com>");
+MODULE_DESCRIPTION("Slingshot Base Link module");
+MODULE_VERSION(SBL_VERSION_STR);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_test.c b/drivers/net/ethernet/hpe/sbl/sbl_test.c
new file mode 100644
index 000000000000..56f9f19ae5c4
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_test.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2021 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+#include <linux/hpe/sbl/sbl_test.h>
+
+#include <uapi/ethernet/sbl_serdes_defaults.h>
+
+#include "sbl_serdes.h"
+#include "sbl_serdes_fn.h"
+#include "sbl_pml_fn.h"
+#include "sbl_internal.h"
+#include "sbl_constants.h"
+
+static bool sbl_test_crc_failure;
+
+/**
+ * sbl_test_core_intr() - test core interrupt access to the serdes
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function is used to test the serdes operations
+ * and check its results
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_core_intr(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+	u16 result = 0;
+	unsigned int flags = SBL_FLAG_DELAY_5US | SBL_FLAG_INTERVAL_1MS;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_pml_serdes_op(sbl,
+				port_num, /* port num */
+				0,        /* serdes_sel */
+				0,        /* op */
+				0,        /* data */
+				&result,
+				100,      /* timeout ms */
+				flags);   /* flags */
+	if (err)
+		dev_info(sbl->dev, "op 0, err %d\n", err);
+	else
+		dev_info(sbl->dev, "op 0, result 0x%x\n", result);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_core_intr);
+
+static void sbl_blattr_init(struct sbl_base_link_attr *blattr,
+			    int loopback_mode)
+{
+	/* simple PEC, fabric link config */
+	memset(blattr, 0, sizeof(struct sbl_base_link_attr));
+
+	blattr->magic                = SBL_LINK_ATTR_MAGIC;
+
+	blattr->options              = SBL_OPT_FABRIC_LINK |
+				       SBL_OPT_DFE_SAVE_PARAMS |
+				       SBL_OPT_USE_SAVED_PARAMS |
+				       SBL_OPT_ENABLE_PCAL;
+
+	blattr->start_timeout        = SBL_LINK_START_TIMEOUT_PEC;
+
+	blattr->config_target        = SBL_BASE_LINK_CONFIG_PEC;
+	blattr->pec.an_mode          = SBL_AN_MODE_OFF;
+	blattr->pec.an_retry_timeout = SBL_LINK_DFLT_AN_RETRY_TIMEOUT;
+	blattr->pec.an_max_retry     = SBL_LINK_DFLT_AN_MAX_RETRY;
+
+	blattr->lpd_timeout          = SBL_DFLT_LPD_TIMEOUT;        /* not enabled in options */
+	blattr->lpd_poll_interval    = SBL_DFLT_LPD_POLL_INTERVAL;  /* not enabled in options */
+
+	blattr->link_mode            = SBL_LINK_MODE_BS_200G;
+	blattr->loopback_mode        = loopback_mode;
+	blattr->link_partner         = SBL_LINK_PARTNER_SWITCH;
+	blattr->tuning_pattern       = SBL_TUNING_PATTERN_CORE;
+
+	blattr->dfe_pre_delay        = SBL_DFLT_DFE_PRE_DELAY_PEC;
+	blattr->dfe_timeout          = SBL_DFLT_DFE_TIMEOUT_PEC;
+	blattr->dfe_poll_interval    = SBL_DFLT_DFE_POLL_INTERVAL;
+
+	blattr->nrz_min_eye_height   = SBL_DFLT_NRZ_PEC_MIN_EYE_HEIGHT;
+	blattr->nrz_max_eye_height   = SBL_DFLT_NRZ_PEC_MAX_EYE_HEIGHT;
+	blattr->pam4_min_eye_height  = SBL_DFLT_PAM4_PEC_MIN_EYE_HEIGHT;
+	blattr->pam4_max_eye_height  = SBL_DFLT_PAM4_PEC_MAX_EYE_HEIGHT;
+
+	blattr->fec_mode             = SBL_RS_MODE_ON;
+	blattr->enable_autodegrade   = 0;
+	blattr->llr_mode             = SBL_LLR_MODE_ON;
+	blattr->ifg_config           = SBL_IFG_CONFIG_HPC;
+}
+
+/**
+ * sbl_test_link_up() - test link up
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @loopback_mode: selected enum value of loopback mode
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_link_up(struct sbl_inst *sbl, int port_num, int loopback_mode)
+{
+	struct sbl_media_attr mattr;
+	struct sbl_base_link_attr blattr;
+	int blstate;
+	int blerr;
+	int sstate;
+	int serr;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	/* configure media */
+	mattr.magic = SBL_MEDIA_ATTR_MAGIC;
+	mattr.media = SBL_LINK_MEDIA_ELECTRICAL;
+	mattr.len   = 2;
+
+	err = sbl_media_config(sbl, port_num, &mattr);
+	if (err) {
+		dev_err(sbl->dev, "%d: media config failed [%d]\n", port_num, err);
+		goto out;
+	}
+
+	/* configure base-link */
+	sbl_blattr_init(&blattr, loopback_mode);
+
+	err = sbl_base_link_config(sbl, port_num, &blattr);
+	if (err) {
+		dev_err(sbl->dev, "%d: base link config failed [%d]\n", port_num, err);
+		goto out;
+	}
+
+	/* start the base link */
+	err = sbl_base_link_start(sbl, port_num);
+	if (err)
+		dev_err(sbl->dev, "%d: base link start failed [%d]\n", port_num, err);
+
+out:
+	sbl_base_link_get_status(sbl, port_num, &blstate, &blerr, &sstate, &serr, NULL, NULL);
+	dev_info(sbl->dev, "%d: base link %s (%d), serdes %s (%d)\n", port_num,
+		 sbl_link_state_str(blstate), blerr,
+		 sbl_serdes_state_str(sstate), serr);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_link_up);
+
+/**
+ * sbl_test_link_reup() - Test to link reup
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @loopback_mode: selected enum value of loopback mode
+ *
+ * This function is used to test base link
+ * operation of start/stop.
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_link_reup(struct sbl_inst *sbl, int port_num, int loopback_mode)
+{
+	struct sbl_base_link_attr blattr;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_blattr_init(&blattr, loopback_mode);
+
+	err = sbl_base_link_config(sbl, port_num, &blattr);
+	if (err)
+		dev_err(sbl->dev, "%d: base link config failed [%d]\n", port_num, err);
+
+	err = sbl_base_link_start(sbl, port_num);
+	if (err)
+		dev_err(sbl->dev, "%d: base link start failed [%d]\n", port_num, err);
+
+	err = sbl_base_link_stop(sbl, port_num);
+	if (err)
+		dev_err(sbl->dev, "%d: base link stop failed [%d]\n", port_num, err);
+
+	err = sbl_base_link_start(sbl, port_num);
+	if (err)
+		dev_err(sbl->dev, "%d: base link start failed [%d]\n", port_num, err);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_link_reup);
+
+/**
+ * sbl_test_link_down() - Test to link down
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_link_down(struct sbl_inst *sbl, int port_num)
+{
+	int blstate;
+	int blerr;
+	int sstate;
+	int serr;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	err = sbl_base_link_stop(sbl, port_num);
+	if (err)
+		dev_err(sbl->dev, "%d: base link stop failed [%d]\n", port_num, err);
+
+	sbl_base_link_get_status(sbl, port_num, &blstate, &blerr, &sstate, &serr, NULL, NULL);
+	dev_info(sbl->dev, "%d: base link %s (%d), serdes %s (%d)\n", port_num,
+		 sbl_link_state_str(blstate), blerr,
+		 sbl_serdes_state_str(sstate), serr);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_link_down);
+
+/**
+ * sbl_test_link_reset() - Test to reset link
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_link_reset(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	err = sbl_base_link_reset(sbl, port_num);
+	if (err)
+		dev_err(sbl->dev, "%d: base link reset failed [%d]\n", port_num, err);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_link_reset);
+
+/**
+ * sbl_test_serdes_stop() - Test to stop serdes
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Stopping the serdes provides a way to test link error pathways
+ * can be used to simulate link failure
+ *
+ * Context: Process context. May sleep. The caller must keep @sbl alive and
+ * must not hold this port's busy_mtx.
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_serdes_stop(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	link = sbl->link + port_num;
+	err = mutex_lock_interruptible(&link->busy_mtx);
+	if (err)
+		return -ERESTARTSYS;
+
+	err = sbl_spico_reset(sbl, port_num);
+	mutex_unlock(&link->busy_mtx);
+	if (err)
+		dev_err(sbl->dev, "%d: sbl serdes stop failed [%d]\n", port_num, err);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_serdes_stop);
+
+/**
+ * sbl_test_pcs_tx_rf() - set pcs to transmit remote fault
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: 0 on success, error on failure
+ */
+int sbl_test_pcs_tx_rf(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s starting\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_pml_pcs_set_tx_rf(sbl, port_num);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_test_pcs_tx_rf);
+
+/**
+ * sbl_test_scratch() - Test to reload serdes firmware
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: 0 on success,  error on failure
+ */
+int sbl_test_scratch(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err = 0;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	dev_dbg(sbl->dev, "%s toggling reload serdes fw option\n", __func__);
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	link = sbl->link + port_num;
+
+	if (link->blattr.options & SBL_OPT_RELOAD_FW_ON_TIMEOUT)
+		link->blattr.options &= ~SBL_OPT_RELOAD_FW_ON_TIMEOUT;
+	else
+		link->blattr.options |= SBL_OPT_RELOAD_FW_ON_TIMEOUT;
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_test_scratch);
+
+/* Updates return value of SerDes FW CRC check.
+ * If sbl_test_crc_failure set by sbl_test_inject_serdes_fw_crc_failure is 1,
+ * CRC returns failure.
+ */
+void sbl_test_manipulate_serdes_fw_crc_result(u16 *crc_result)
+{
+	if (sbl_test_crc_failure)
+		*crc_result = SPICO_RESULT_SERDES_CRC_FAIL;
+}
+
+/**
+ * sbl_test_inject_serdes_fw_crc_failure() - Test to inject crc failure for serdes fw
+ * @set: if set then inject crc
+ */
+void sbl_test_inject_serdes_fw_crc_failure(bool set)
+{
+	sbl_test_crc_failure = set;
+}
+EXPORT_SYMBOL(sbl_test_inject_serdes_fw_crc_failure);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_timers.c b/drivers/net/ethernet/hpe/sbl/sbl_timers.c
new file mode 100644
index 000000000000..9af676193667
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_timers.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/ktime.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_internal.h"
+
+/* start timeout is the limit for sbl_base_link_start() to bring the link up
+ * this includes all stages of link bringup
+ */
+void sbl_link_init_start_timeout(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->start_timeout = link->blattr.start_timeout;
+	link->an_timeout_active = false;
+	link->last_start_jiffy = jiffies +
+		min_t(u64, (u64)link->start_timeout * HZ, MAX_JIFFY_OFFSET);
+	link->start_time_begin = ktime_get();
+	link->total_tune_time.tv_sec = 0;
+	link->total_tune_time.tv_nsec = 0;
+	spin_unlock(&link->timeout_lock);
+}
+
+/* change the start timeout */
+void sbl_link_update_start_timeout(struct sbl_inst *sbl, int port_num, unsigned int timeout_ms)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->start_timeout = DIV_ROUND_UP(timeout_ms, 1000);
+	link->last_start_jiffy = jiffies + msecs_to_jiffies(timeout_ms);
+	spin_unlock(&link->timeout_lock);
+
+	sbl_dev_dbg(sbl->dev, "%d: update start timeout to %d s, %d ms\n",
+		    port_num, link->start_timeout, timeout_ms);
+}
+
+/* test if we have timed out - returns true if we have */
+bool sbl_start_timeout(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long last_start_jiffy;
+	bool timed_out;
+
+	spin_lock(&link->timeout_lock);
+	last_start_jiffy = link->last_start_jiffy;
+	timed_out = time_is_before_jiffies(last_start_jiffy);
+	spin_unlock(&link->timeout_lock);
+
+	if (timed_out)
+		sbl_dev_dbg(sbl->dev, "%d: %s timed out\n", port_num, __func__);
+
+	return timed_out;
+}
+
+u32 sbl_get_start_timeout(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 start_timeout;
+
+	spin_lock(&link->timeout_lock);
+	start_timeout = link->start_timeout;
+	spin_unlock(&link->timeout_lock);
+
+	return start_timeout;
+}
+
+/* update start timeout to ensure there is a minimum  amout of time remaining */
+void sbl_start_timeout_ensure_remaining(struct sbl_inst *sbl, int port_num, unsigned int remaining_s)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long now;
+	unsigned long left;
+	unsigned long required = min_t(u64, (u64)remaining_s * HZ,
+				       MAX_JIFFY_OFFSET);
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+
+	/* Don't mess with timeouts setup by autoneg */
+	if (link->an_timeout_active) {
+		spin_unlock(&link->timeout_lock);
+		return;
+	}
+
+	now = jiffies;
+	if (time_before(now, link->last_start_jiffy)) {
+		left = link->last_start_jiffy - now;
+		if (left < required) {
+			sbl_dev_info(sbl->dev, "%d: extending timeout by %ld\n", port_num,
+					(required - left) / HZ);
+			link->start_timeout += DIV_ROUND_UP(required - left, HZ);
+			link->last_start_jiffy = now + required;
+		} else {
+			sbl_dev_dbg(sbl->dev, "%d: timeout OK - now %ld, last %ld, left %ld, req %ld\n",
+				    port_num, now, link->last_start_jiffy, left, required);
+		}
+	} else {
+		/* we should timeout but extend instead */
+		sbl_dev_info(sbl->dev, "%d: extending timeout by %ld\n", port_num,
+				required / HZ);
+		link->start_timeout += DIV_ROUND_UP(now - link->last_start_jiffy +
+						 required, HZ);
+		link->last_start_jiffy = now + required;
+	}
+
+	spin_unlock(&link->timeout_lock);
+}
+
+int sbl_link_start_elapsed(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct timespec64 elapsed;
+
+	spin_lock(&link->timeout_lock);
+	elapsed = ktime_to_timespec64(ktime_sub(ktime_get(), link->start_time_begin));
+	spin_unlock(&link->timeout_lock);
+
+	return elapsed.tv_sec;
+}
+
+void sbl_link_start_record_timespec(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->start_time = ktime_to_timespec64(ktime_sub(ktime_get(), link->start_time_begin));
+	spin_unlock(&link->timeout_lock);
+}
+
+/* up time is the time to tune serdes and bring-up pml */
+void sbl_link_up_begin(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->up_time_begin = ktime_get();
+	spin_unlock(&link->timeout_lock);
+}
+
+void sbl_link_up_record_timespec(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->up_time = ktime_to_timespec64(ktime_sub(ktime_get(), link->up_time_begin));
+	spin_unlock(&link->timeout_lock);
+}
+
+/* tune time is the time serdes spent actually tuning */
+void sbl_link_tune_begin(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->tune_time_begin = ktime_get();
+	spin_unlock(&link->timeout_lock);
+}
+
+int sbl_link_tune_elapsed(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct timespec64 elapsed;
+
+	spin_lock(&link->timeout_lock);
+	elapsed = ktime_to_timespec64(ktime_sub(ktime_get(), link->tune_time_begin));
+	spin_unlock(&link->timeout_lock);
+
+	return elapsed.tv_sec;
+}
+
+void sbl_link_tune_zero_total_timespec(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->total_tune_time.tv_sec = 0;
+	link->total_tune_time.tv_nsec = 0;
+	spin_unlock(&link->timeout_lock);
+}
+
+void sbl_link_tune_update_total_timespec(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u64 ns;
+
+	sbl_dev_dbg(sbl->dev, "%d: %s\n", port_num, __func__);
+
+	spin_lock(&link->timeout_lock);
+	link->tune_time = ktime_to_timespec64(ktime_sub(ktime_get(), link->tune_time_begin));
+
+	link->total_tune_time.tv_sec += link->tune_time.tv_sec;
+	ns = link->total_tune_time.tv_nsec + link->tune_time.tv_nsec;
+	if (ns >= NSEC_PER_SEC) {
+		link->total_tune_time.tv_sec += 1;
+		ns -= NSEC_PER_SEC;
+	}
+	link->total_tune_time.tv_nsec = ns;
+	spin_unlock(&link->timeout_lock);
+}

-- 
2.56.0

