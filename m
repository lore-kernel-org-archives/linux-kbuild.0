Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394095;
	b=TAK5P6tKlfDKFNKCB5KhHU+RqHT4C7jEbSFtVh5/oevYZ/cs9iWnMyR7YcPASn1JoV8z
	 3Mn6crZFDJ95ZjD5wA8gboaxyHJ82rX8HI41bTCEo5LdcoxmxHsroDw0bBmRNq5ElSnZ/
	 w97AeZfEy1zbTSq+ftBjcNZE5nw7K50pImNP6x15gQjhatchKTRgR6NLZ10Z2yCq78nwi
	 MGU0/3SEjDOxp7E3qSAQexv9dhonTUK0tQzzt1fHSrWfEExS5u6LkwGU8QvO0RcQCqdCl
	 Hy5pOg7/ilZbRjuFKpMhe0gPu9wg6CnsAkHd/1nodDIFSrI8S4w3CB8aC6fvjQhJDCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394095;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g+oGN8i2nFP9hXZSb2IoPLTLh8dr+AksxnYdKj0TeSU=;
	b=WKZcdBVN7UXmuEtU9A55ssryYaUqKvXXlVECsnHao0KjdnCNIfVd+Wq+jIToLij0MmS0
	 8G3xM9CLH0lglwuiMl1i4GKthYjg4phfvvVZCz3j5vrkqC/rhAXj06iXNXX/yG7QgLWsU
	 TPW47Rz5AEIJb3F4C8oYtvkv4lLetLw7FPRi8cE/gHr3gxx04SkLByXwH2a6tC7kVpUcB
	 R1JgC6XwNpHeogLqJtZv9PNJ5WaW4hPBKtpeCCxoEyKfpYygRpSjNa6ncMEtn/CS0D9Ea
	 AEkpQeUdNIAqkFDF+K6BSHUAvg+15WXA3KnkkIKZ/j3bbC/cX9ppPDCx7RiO3MXL3mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=MyFlVBZg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A742660A262D;
	Fri, 30 Oct 2026 21:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A742660A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=MyFlVBZg
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIVxrv3318822;
	Fri, 30 Oct 2026 21:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=g+
	oGN8i2nFP9hXZSb2IoPLTLh8dr+AksxnYdKj0TeSU=; b=MyFlVBZgolnwsDCj6q
	+5A5Q1zyFwIJzq61utOA6gC7RM/us5gFSScJpv7HUZMsePCd6bYcZWu3KO/t3lsQ
	YiPv0cKYGrz4VeO4cSHqXayl0Vcgfakqo1OwQiofwO4g6/PMNbFKQIPV/1tv71BC
	ne6wC+U/00lQmaq90Am8relXlP/AeglJ3GzNzDH9UudwARw+2GqO2BSO2CXazEhU
	iYpt9X7zGVqUoTQ+iQb64gWUH6bScJNPqvvjc/4nngbqjXIiEATmp2j7hM+OSPt1
	uVKZ/KgrXiAWEZ//lARqzw+ibrapY8+/fsD/526BzzWTS0joUiZOV/TT94IFPpO2
	levQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmw2jvkw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:03 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 3ACDD8047B4;
	Fri, 30 Oct 2026 21:01:03 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:02 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:02 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:02 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOzEDcCP0vJPO1o5lJVmL9uBUwr+QIIoxePcL6h90WL0z9DWQhPCDbhHVIlf26h+2sFktyUX84BE0wq8LJRgU/dn0Nb93kJzZMJr1RQ/TXm0I+f4IwWc/d/FLPJ7qZog7hr4YlSxUUBQ8PrJDgkp0ZsKQvuwuKLYFNQBfWxZo6WtXw6N+CLcGWGkOdkB18Xa8vWKviDeMCtjg413vTW8a1s6By0m6DrIhgNVi/t9TcTaOA5FfaB5FF6RjgbFgYj7zP7lMbur0VIioEniKNHIdb7s6UJl1rBuNKnznLg9cYmJMNRGBYOfdl2QD3LFF9vR0s21uS40MNBQr1cV6YEkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+oGN8i2nFP9hXZSb2IoPLTLh8dr+AksxnYdKj0TeSU=;
 b=a0cHMFvbFQEAAcCzK0RA/86ffMZByqf8ANoValwtuAOoz5djyzFJauASx9m/YuS6yM7l4Wka/QdzX4eaWA2yNrnJyt1StVo5ejYaOum4URPuka0ZkBzwzyS2B/PT5mb43Sr9eJOTJx9uO4xSr+ze2O6hYTGmpmCaEPxau4zvDS6mfKeBsCAMFi2JpYRRmKYH/BUvUxSeTkayDiVEqXfN9tnWnovzyovm1S2cF3E1pmvpUzIKumzDG9L73t3jgOUBpuew05Vl90JofYID4JZl1WUMjliiaEcEJZ5b26SVkQRgqkxHK9Yh35FSvd8Uifd0m2GtqPMfk89BXsmrbe43yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:58 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:58 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:13 -0700
Subject: [PATCH 17/23] net: hpe: ss1: add the datapath and memory
 translation layers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-cxi-netdev-submission-v1-17-8c2c391cc283@hpe.com>
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
        Sandeep Bhoot
	<sandeep.bhoot@hpe.com>,
        "Mamila Santosh" <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: DS7PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:8:54::16) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 94582599-9494-4bf0-800b-08df36c8e4db
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: /R2S1pJkVZZp5IyTZoafoB1+5V6BHglGmkCwwJeJ7AkUTP5bGwdq5tyGqlNqvlXEkqXHptGQsT6FR6I8NUZMJPZFyQZ3ewnzbLA66MtiRQ3UBNwiukuf4kmokFUr/gQDXzmQ0Drc74oPhCQBVN4YwOCqGkMXvC65C/CI71D/aiWacsD5MpvIuppyGigHIAFKrMbihWMecvU/U8CGXNw1840RojxEW43ESJxRNhEiufh9WHZM6FzBpRIhiSIVdm71TWC//gEiya7BASquav/xRerz2NXUf+536KO6Och22wxrczhJRqlLWPRVzJSNv1LsWIMQv+G1oMdLge2DU98Mbv7tsgweeyi0ilEMq+XXPfDg5IVRQk8zOeuoGRRwi3JD/S2cs7k7KHgxJh4JFCAtzbidaU59jSv+f/ghGLmxXZbj6j+SAejc7xX8MPtkyB9xXVGi70Cc2yCzvPjUDCtppyT8shTlB6ncGdzQdK2BMA39Ho2aUtq/D7nekV2uXaL5uXTT3zHSvchbYcwfCRaq8Bf9zdxmj0W8jdm90I9NxWMEV18dleBWarIkpVWtwtdWdhP2H2BDpOiJrmBXNGgLHuTxvA02oMX2rNw7tFtAOQK9QGsrYLXgrKOcd61xlCkhIJqobPeF4b2JrXvpXKGuKoEq45KfLLri3AzO85XxhG+M9mVzRRnbK5X5EdZKl+SDTzzIRzc8AzG/9u60hssYmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0NZMmllZ0dyQUhPb04ya0dsUCszK2tMWUYxc2d5WEdBUTViajBtOWlKRFE0?=
 =?utf-8?B?RTNzWWdwV05TVjFnMXR5bUZXNk4xU2hTcWk1WDdxZ0xLeW56UlpDVnRyVkhq?=
 =?utf-8?B?OGVFN1lMNkNVS3RKWm1vbzVsMVZwL1hvYVIxT214WGxEeCtxMzI0WmRpbWk4?=
 =?utf-8?B?WDZNMjZ2Q0QwWkU4aCsvY2tMNVljSVFyTnhuRDB5dElaRkhJdjBxQnBaMnor?=
 =?utf-8?B?WGE5R1NGK0d2bzdkMzFqWEFKejFEUEl6Y2lsUzRCYVZ3aWpEY2d5Y1BwTjNi?=
 =?utf-8?B?a2xvRm5WYy9OaDdvUmNqaXc3Y3N4Z1JFQ1BjUkJncXJtOStqSFJvdm1zTnRm?=
 =?utf-8?B?M3FrY1FVRlRHemtUK0IvRGhvcGtGdEtHWUFaMXEyTnVZWW5LMkI2djRhVTFo?=
 =?utf-8?B?M3dnRWRQMjBMTnk1RGM4ZnJPL2pNWkN1Z09tZXRGQkQybDBKOElGOTAzc2lz?=
 =?utf-8?B?cFJuLzU0Zm1Bb2FyRWNDVmJDS29ES1pMcUE3SWJxYmMydG4rWTcvbkRHejYy?=
 =?utf-8?B?NkZidElHTU1FWXdnN2JoVU0vdmhrT3lic0twL3l4bjU0OUx2QjRjdVlwWnBN?=
 =?utf-8?B?TlhzUWpTNjFuSWRIZHdjWUJ6L0lQUTI4NjlBUlVsYnVPT2s3WmpTMUMwQXhU?=
 =?utf-8?B?b1ZqMll0TTBzM09VaWsvQnkxaEFJNzlrL3lxN0FLMjd6eHlrZHRBSDJEUk1o?=
 =?utf-8?B?Qy9yUXBXMDdQMkVlRGIwRmZ0Mm14ZmhXUnlJNkltQ09maXFYUjVIRVpxQnB5?=
 =?utf-8?B?REFseXNOcis5RkdReHgxeTJzaitZY0MxcjFpSm96VGxpek55OVhOSldHM3JR?=
 =?utf-8?B?dkRBVDFQaTV5OGdRamhnKzlFR0M0b3F4dHRxRkUrWSs0ckJSZTNpYzBMTnVm?=
 =?utf-8?B?T04wVGhBeDVkS3NKREJDMkRTaTRJcHZ5YmY2dU5UbjNRN2pJczBpL0FYOG5L?=
 =?utf-8?B?Q1ROYm9PODg1eU1TVU4rRG1ua2RSNU10NjlEdUxjeDg0ZEZoRHVqUlNWaWNm?=
 =?utf-8?B?YytQWVUvMWlMSXlwV0JlcGdINXM2SG9SbEpremhqak50WVJ6STJtamoyNGU1?=
 =?utf-8?B?bm1kRUpnaTV6TnhjN0ZEOG12TUJsQWUyTjd2WndSOU5pQnBMSjM1WXg5bmZ5?=
 =?utf-8?B?cm0xOXh3eEdadWhlMzdBSElBS1IrNWsvMUx5NEtuKzN5RHdPRStWMWtOT0po?=
 =?utf-8?B?YmlSVWR0NGE3QUlCaVgrS2hHa1FWTWhZNkRBZzBpbnorbmVWSGF2NGdMTndK?=
 =?utf-8?B?UlVlUUxYa3JkSTBPeGY2SnMvTUp3MUFNWStJMVRpd3B4dnZKVjJNeitmWXhw?=
 =?utf-8?B?cVIxSlVUdWRMQlJYOFRJVjZFaHZBMzc1K2laN0lIN3hWZWh1WXB6MzRGUWJl?=
 =?utf-8?B?RWxpdm56dlhzZkJRTCtDclFLdlY4OUh6cTd2c2NpaGRMMmxBTWVtOTh1c2Fq?=
 =?utf-8?B?L2ZkSFRYenVQTG1wM3pvMWt2M3c1TGUyM3B0ZUtXVWxWbzVyNlRkMUtNN1VN?=
 =?utf-8?B?WDBMVXJPTDdmb2o0aGFaNHZMRkFldm5OOE1qbmtOVkZDbEx5cW5mMkJiRHd0?=
 =?utf-8?B?QXl1bjF5Z3ZOL1IwSnFFWHorMXVaZzh2ajVKMmlYNC8rTXJVWUxadHphTGRq?=
 =?utf-8?B?amJBaE41SFFvMmhYU2NYclFNdW5ob2N1VzU0Q1VzSEd6MXplV1QvTGVzamly?=
 =?utf-8?B?SXFMSlhBUmFjS2h2Q3paRTBPU3VsWjdjeE5va3RyUlVEc1ZFY2lpTEU0bUxH?=
 =?utf-8?B?L01ja2M3MjhrMHhWcG5WRXNUYmpJTzR5ZlROdnQyZ01xWlNMVFFMTTJld0lq?=
 =?utf-8?B?RHhYZWl1Ly9mV1pacmNTTVdKT2ZVbUpTcUxrdWJ2YUNZM3F6bUhpd0szY1RY?=
 =?utf-8?B?K1BrbGRFUXlpMjR3S2JLbHdOUm1UZnZCUjFPa0Y3WW9lWmR1dnFnYlNnZ24x?=
 =?utf-8?B?Z2JoVnhLc3JHdWlBcnJac3Y4bGJ0NmhsbGt4VGVWeXREekVXaS8yZFl6WWdr?=
 =?utf-8?B?YW80RjVFK2pNaVdxelkxMVJhZlpVaVBGVHJ6OUhOMXNIcjk4RWZRRTd3NnFF?=
 =?utf-8?B?QkxtNGFmL2xuRzNCckYzWDJyQ0JGMTNQblVJdVJhNGk5VmZKR09KMkppaEpO?=
 =?utf-8?B?OGZkWXdPL0hvWGh5NXg0cFJiRkVnazdGcGEvZVQzcUliV3VKZmRJSFVQcGVs?=
 =?utf-8?B?WEovWFQ0MVJEcVQrSkhZek5SeHNoUEZ6QUYzZGk5aHZUKzZMak5TQXJLeEl6?=
 =?utf-8?B?S1UybjBnb1ZST3ZoQzFLYU5mY1VFRFBqL3J3L050ZUx5SlJhRHMwVFhLVldI?=
 =?utf-8?B?NXdIUXJYbnZtREt1cVJIL1FnU0NjekVKK3FieUpZcHdwRUU3b1FjUT09?=
X-Exchange-RoutingPolicyChecked: WGfBB3bpe2iHPtyIM1IhgDrpioX1xpx+JG88Y92JUCSfyNQgZZIDvGoyQtYXib8YPGjssYLBjcN3Qt9qy0WC0sZyt+TnGSBl9+l/kIHzu+MtT0cPYeGE3JVm1Cx3PRmWWBllu3q9uVPe0EExUBtk/iROKCYvGrljPknipdGDXkrzqULS+h4FW++8iPGnOJyFPPD6IvO9ecCYWwJBPMZaQwqSHwEGfcrSOwRwS22cP/ow26q3uC+hUMFyiS7evVTEDhw1+Ll/8BLmB+1JmlFJzInavGBwxAymzIyJJpSdczOiPWCITOcvsvhO8qFhhE1ZEmGqP6DBmNYT0XIGo5BSAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94582599-9494-4bf0-800b-08df36c8e4db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:58.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44t+G1OvLAVwJdOqjzqjLo1projxinGvPTwOX31Q0dapxBNsW7F+Qq3VzfDXXKFjLbYUnfOYDlu+0gibf56aEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX7G1w7R0gIpKa
 W+Au4MqkcBfB72S43yWueZ8Nltw+/HeFryq0Hh9xbfqWWCArQEKUrA74zCJ9pN6dS9150i6daId
 ICF9YFSsvPz+/VtMZwRVCYjzh5J6/kQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX/o3IZqh4mQRS
 KaaFVM9rqILiAnAcL1xYguXTVCm/HvgP5h2ddAETgZ/8I12Yc2qDtjJdxcyMKVyoccCMFxNAjrI
 mB86HeY/6lTLuzB5a5vyvpB73U6ABE0+BulENiZuk6wEwMHzhhUGQlYRxyIT3rIV+rQQlO1XQI+
 MEPpeCWCDwOGHmBRp7Pzl8jOBFgQqKCN+OhhqCCDYI/gi3GsI+8rUmGsod+ol70eOF4BpBpaqUi
 rfKo65/3x3p0LA209VPKUHBNyl5RM8V+ge6mboO5+mh0xv5pSJvXPdfoysAmAgoU4CnXQntuLnp
 WkdlvAdH/xZHnuFnWPoopfDnpYvLWifW4IHjhsJhQEAi6patFaieo5ScpbzT6DemknIynxd0xhb
 500phJQMdKyfgqIxwK++G4qCHFi62X0mDeWFU+g9H31/KZVCfqRls1yoVi1558rDBAp8Hnc/dqg
 L3UsQo2LiQzvMKOOJTQ==
X-Authority-Analysis: v=2.4 cv=QOn91QLL c=1 sm=1 tr=0 ts=6ae5058f cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=iWPi7X4b-5o4dWzyFGIA:9
 a=1b92cO--98ic-2wa:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EA_2B-AkCJqr9akdMOcG-PEV5AG6CgG7
X-Proofpoint-ORIG-GUID: EA_2B-AkCJqr9akdMOcG-PEV5AG6CgG7
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the datapath: event and command queues, counting events, the ATU
and ATS (address translation) layers, the RMU, the NTA and P2P/DMA
mapping.

When pinning user memory for buffers the device keeps mapped
(event queues, counting event write-back), pages are now pinned with
FOLL_LONGTERM, and event queue pages the device wrote are dirtied
before they are unpinned so data written by the device is not lost on
reclaim.  The counting event write-back path drops its page pin when
the DMA mapping fails, so the PF and VF error paths do not leak it.

cass_p2p.c refuses device memory when no GPU backend is registered;
previously a missing backend left a NULL callback that was then
called.  When EQ interrupts are re-attached all callback and data
pointers are replaced, including with NULL, so a stale callback cannot
be reused with a NULL interrupt object.

The inbound-wait hardware failure latch lives in the per-adapter ATU
state under the adapter's own mutex, so a failure on one NIC does not
block waits on another.

Known open issues in VF paths, deferred to the V2 SR-IOV update:

- Sashiko H51: the VF CT and EQ free paths can leak their private
  allocations when the PF does not reply.
- Sashiko M48: cxi_cq_ack_counter_vf() returns a negative errno from the
  PF mailbox through an unsigned counter API.
- Sashiko M50: VF CQ free returns early on a PF RPC error while the
  queue backing may still be DMA-active.

Open hardware question (Sashiko H50, finding fixed): the DMAC wait is
bounded, and the engine is disabled and its interrupt drained before the
completion descriptor is read. Whether clearing C_PI_CFG_DMAC ENABLE
guarantees that no further host writes occur is being confirmed with the
hardware engineers. Current callers keep their DMA buffers for the
lifetime of the device.

Known limitation, deferred to V2: this patch carries SR-IOV
virtual-function code (VF-to-PF mailbox requests, mailbox opcodes or VF
resource handling) from an older, incomplete version of the Cassini
SR-IOV support. V2 of this series will include the updated SR-IOV
implementation, so issues in the VF paths should be ignored for now.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: ALLOC_WITH_SIZEOF (19), BLOCK_COMMENT_STYLE (2),
  SUSPECT_CODE_INDENT (2), AVOID_BUG (1), AVOID_EXTERNS (1),
  DEPRECATED_API (1), LONG_LINE (1), VOLATILE (1)
- CHECK: UNNECESSARY_PARENTHESES (13), COMPARISON_TO_NULL (12), BRACES
  (4), BIT_MACRO (3), ALLOC_SIZEOF_STRUCT (2), MACRO_ARG_REUSE (2),
  ASSIGNMENT_CONTINUATIONS (1), CAMELCASE (1), MACRO_ARG_PRECEDENCE (1),
  OPEN_ENDED_LINE (1)

Co-developed-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Iraimani P <iraimani.pavadai@hpe.com>
Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cass_ats.c           |  299 +++
 drivers/net/ethernet/hpe/ss1/cass_ats_inval.c     |   79 +
 drivers/net/ethernet/hpe/ss1/cass_atu.c           | 2072 +++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_cq.c            | 1243 ++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_ct.c            |  639 +++++++
 drivers/net/ethernet/hpe/ss1/cass_dmac.c          |  597 ++++++
 drivers/net/ethernet/hpe/ss1/cass_eq.c            | 1518 +++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_nta.c           | 1996 ++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_p2p.c           |  321 ++++
 drivers/net/ethernet/hpe/ss1/cass_rmu.c           |  376 ++++
 drivers/net/ethernet/hpe/ss1/cass_rmu_eth.c       | 1017 ++++++++++
 drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.c |  104 ++
 12 files changed, 10261 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cass_ats.c b/drivers/net/ethernet/hpe/ss1/cass_ats.c
new file mode 100644
index 000000000000..f1642317abb6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ats.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/*
+ * Address Translation Unit (ATU) management
+ * ATS functionality
+ */
+
+#include <linux/pci.h>
+#include <linux/types.h>
+#include <linux/iommu.h>
+
+#include "cass_core.h"
+
+/* PCIe IP PF0_PORT_LOGIC register */
+#define SYMBOL_TIMER_FILTER_1_OFF 0x71c
+#define CX_FLT_MASK_CPL_LEN_MATCH (1 << 26)
+#define FILTER_MASK_2_OFF 0x720
+#define CX_FLT_UNMASK_ATS_SPECIFIC_RULES (1 << 10)
+
+#define ATU_NUM_PASIDS ATU_PHYS_AC
+#define MAX_PAGE_REQS 512
+
+#ifdef CONFIG_IOMMU_SVA
+
+static bool enable_ats = true;
+module_param(enable_ats, bool, 0644);
+MODULE_PARM_DESC(enable_ats, "Enable Address Translation Services (PCIe ATS)");
+
+static bool odp_mode_nic_pri;
+module_param(odp_mode_nic_pri, bool, 0644);
+MODULE_PARM_DESC(odp_mode_nic_pri,
+		 "ODP mode used for ATS. ATS_PRS:0, NIC_PRI:1");
+
+static int cass_bind_sva(struct pci_dev *pdev, struct cass_ac *cac)
+{
+	u32 pasid;
+	struct iommu_sva *sva;
+
+	sva = iommu_sva_bind_device(&pdev->dev, current->mm);
+	if (IS_ERR(sva)) {
+		pr_err("iommu_sva_bind_device failed ret:%ld\n", PTR_ERR(sva));
+		return PTR_ERR(sva);
+	}
+
+	pasid = iommu_sva_get_pasid(sva);
+	if (pasid == IOMMU_PASID_INVALID) {
+		pr_err("pasid invalid\n");
+		iommu_sva_unbind_device(sva);
+		return -ENODEV;
+	}
+
+	cac->sva = sva;
+	cac->pasid = pasid;
+
+	return 0;
+}
+
+static void cass_unbind_sva(const struct cass_ac *cac)
+{
+	iommu_sva_unbind_device(cac->sva);
+}
+
+/**
+ * cass_bind_ac() - Bind an address context to the current task.
+ *
+ * @hw:  Cassini device
+ * @cac: Cassini AC struct
+ *
+ * @return: 0 on success
+ */
+static int cass_bind_ac(struct cass_dev *hw, struct cass_ac *cac)
+{
+	struct pci_dev *pdev = hw->cdev.pdev;
+
+	if (!pdev->ats_enabled) {
+		cxidev_dbg(&hw->cdev, "ATS not enabled\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (!pdev->pasid_enabled) {
+		cxidev_dbg(&hw->cdev, "PASID not enabled\n");
+		return -EOPNOTSUPP;
+	}
+
+	return cass_bind_sva(pdev, cac);
+}
+
+/**
+ * cass_unbind_ac() - Unbind an address context. Called during AC cleanup.
+ *
+ * @hw:  Cassini device
+ * @cac: Cassini AC struct
+ */
+void cass_unbind_ac(struct cass_dev *hw, const struct cass_ac *cac)
+{
+	if (!enable_ats)
+		return;
+
+	if (cac->sva)
+		cass_unbind_sva(cac);
+}
+
+void cass_iommu_fini(struct cass_dev *hw)
+{
+}
+
+/**
+ * cass_iommu_init() - Initialize the AMD/Intel IOMMU for the physical device
+ *
+ * If the IOMMU is not enabled or available, ATS mode is not supported.
+ *
+ * @hw: Cassini device
+ */
+void cass_iommu_init(struct cass_dev *hw)
+{
+	int pos;
+	u32 filter_mask;
+	u32 max_requests;
+	struct pci_dev *pdev = hw->cdev.pdev;
+
+	/*
+	 * Mask length match for completions.
+	 * The PCI interface checks if the completion length matches
+	 * the requested length. Unfortunately, this is not the case for
+	 * ATS transactions as only pages that are present are returned
+	 * so enable Mask length match for Cassini 1.
+	 */
+	if (cass_version(hw, CASSINI_1)) {
+		pci_read_config_dword(pdev, SYMBOL_TIMER_FILTER_1_OFF,
+				      &filter_mask);
+		filter_mask |= CX_FLT_MASK_CPL_LEN_MATCH;
+		pci_write_config_dword(pdev, SYMBOL_TIMER_FILTER_1_OFF,
+				       filter_mask);
+	}
+
+	/*
+	 * Enable CX_FLT_UNMASK_ATS_SPECIFIC_RULES for C2.
+	 *
+	 * Cassini 2 has a new capability which uses
+	 * CX_FLT_UNMASK_ATS_SPECIFIC_RULES. The PCI controller used by
+	 * C2 has a reference section which states the following:
+	 * Lower Address is not checked for Cpls related to ATS Requests.
+	 * An ATS-related Cpl completes the request if it has a Byte Count
+	 * that is equal to four times the Length field.
+	 */
+	if (cass_version(hw, CASSINI_2)) {
+		pci_read_config_dword(pdev, FILTER_MASK_2_OFF, &filter_mask);
+		filter_mask |= CX_FLT_UNMASK_ATS_SPECIFIC_RULES;
+		pci_write_config_dword(pdev, FILTER_MASK_2_OFF, filter_mask);
+	}
+
+	/*
+	 * The AMD IOMMU is currently hardcoding max requests to 32.
+	 * Set to MAX_PAGE_REQS.
+	 */
+	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_PRI);
+	if (!pos) {
+		dev_warn(&pdev->dev, "Error: PRI extended capability in PCI config not present\n");
+		return;
+	}
+
+	pci_read_config_dword(pdev, pos + PCI_PRI_MAX_REQ, &max_requests);
+	max_requests = min_t(u32, max_requests, (u32)MAX_PAGE_REQS);
+	pdev->pri_reqs_alloc = max_requests;
+	pci_write_config_dword(pdev, pos + PCI_PRI_ALLOC_REQ, max_requests);
+}
+
+/**
+ * cass_ats_init() - Initialize an AC using either ATS or ATS passthrough
+ *                   and bind the AC to the current task
+ *
+ * @lni_priv: Private LNI struct
+ * @m_opts: User map options
+ * @cac:    Cassini AC struct
+ *
+ * @return: 0 on success, negative value on failure
+ */
+int cass_ats_init(struct cxi_lni_priv *lni_priv,
+		  struct ac_map_opts *m_opts,
+		  struct cass_ac *cac)
+{
+	int ret;
+	bool privileged = !(m_opts->flags & CXI_MAP_USER_ADDR);
+	union c_atu_cfg_ac_table *ac = &cac->cfg_ac;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	bool have_pri = hw->cdev.pdev->pri_enabled;
+
+	if (!enable_ats)
+		return -EOPNOTSUPP;
+
+	ret = cass_bind_ac(hw, cac);
+	if (ret)
+		return ret;
+
+	if (m_opts->flags & CXI_MAP_ATS_PT)
+		ac->ta_mode = C_ATU_PASSTHROUGH_MODE;
+	else if (m_opts->flags & CXI_MAP_ATS_DYN)
+		ac->ta_mode = C_ATU_ATS_DYNAMIC_MODE;
+	else
+		ac->ta_mode = C_ATU_ATS_MODE;
+
+	m_opts->iova = m_opts->va_start;
+	cac->iova_base = 0;
+	cac->iova_len = m_opts->flags & CXI_MAP_USER_ADDR ?
+				TASK_SIZE : ULONG_MAX;
+	cac->iova_end = cac->iova_base + cac->iova_len - 1;
+
+	ac->cntr_pool_id = 1;
+	ac->ats_vf_en = lni_priv->is_vf;
+	ac->ats_vf_num = lni_priv->is_vf ? lni_priv->vf_num : 0;
+	ac->ats_no_write = 0;
+	ac->ats_pasid = cac->pasid;
+	ac->ats_pasid_en = 1;
+	ac->ats_pasid_er = 0;
+	ac->ats_pasid_pmr = !!privileged;
+	ac->mem_base = cac->iova_base >> ATU_CFG_AC_TABLE_MB_SHIFT;
+	ac->mem_size = cac->iova_len >> C_ADDR_SHIFT;
+	ac->odp_mode = have_pri && !odp_mode_nic_pri ?
+			C_ATU_ODP_MODE_ATS_PRS : C_ATU_ODP_MODE_NIC_PRI;
+
+	return 0;
+}
+
+/**
+ * cass_ats_md_init() - Pin ATS pages or set up notifier
+ *
+ * When using ODP with NIC_PRI mode, the mmu notifier will be initialized
+ * for this descriptor. If pinning, just pin the pages.
+ *
+ * @md_priv: Private memory descriptor
+ * @m_opts:  User options containing the IOVA range
+ *
+ * @return: Success or -ENOMEM
+ */
+int cass_ats_md_init(struct cxi_md_priv *md_priv,
+		     const struct ac_map_opts *m_opts)
+{
+	int ret;
+	int write = m_opts->flags & CXI_MAP_WRITE;
+	int npages = md_priv->md.len >> md_priv->md.page_shift;
+	struct page **pages;
+	size_t size = npages * sizeof(*pages);
+	struct cass_dev *hw = container_of(md_priv->lni_priv->dev,
+					   struct cass_dev, cdev);
+
+	if (!enable_ats)
+		return -EOPNOTSUPP;
+
+	if (!(m_opts->flags & CXI_MAP_PIN)) {
+		if (odp_mode_nic_pri || !hw->cdev.pdev->pri_enabled)
+			return cass_mmu_notifier_insert(md_priv, m_opts);
+
+		return 0;
+	}
+
+	pages = kvmalloc(size, GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	ret = cass_pin(md_priv->cac, pages, npages, md_priv->md.va, write);
+
+	if (ret) {
+		kvfree(pages);
+		return ret;
+	}
+
+	md_priv->pages = pages;
+
+	return ret;
+}
+
+#else /* CONFIG_IOMMU_SVA */
+void cass_unbind_ac(struct cass_dev *hw, const struct cass_ac *cac)
+{
+}
+
+void cass_iommu_fini(struct cass_dev *hw)
+{
+}
+
+void cass_iommu_init(struct cass_dev *hw)
+{
+}
+
+int cass_ats_init(struct cxi_lni_priv *lni_priv,
+		  struct ac_map_opts *m_opts,
+		  struct cass_ac *cac)
+{
+	return -ENODEV;
+}
+
+int cass_ats_md_init(struct cxi_md_priv *md_priv,
+		     const struct ac_map_opts *m_opts)
+{
+	return -ENODEV;
+}
+#endif /* !CONFIG_IOMMU_SVA */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_ats_inval.c b/drivers/net/ethernet/hpe/ss1/cass_ats_inval.c
new file mode 100644
index 000000000000..39a1a683d85e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ats_inval.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022 Hewlett Packard Enterprise Development LP */
+
+#ifdef CONFIG_AMD_IOMMU
+
+#include <linux/module.h>
+#include <linux/amd-iommu.h>
+
+#include "cass_core.h"
+
+/*
+ * ATS invalidate interface for Cassini 1.1
+ */
+
+typedef void (*amd_iommu_invalidate_range)(struct pci_dev *pdev,
+					   int pasid, unsigned long start,
+					   unsigned long end);
+int amd_iommu_set_invalidate_range_cb(struct pci_dev *pdev,
+				      amd_iommu_invalidate_range cb);
+
+/**
+ * cass_ats_invalidate_range_cb() - Callback from the AMD IOMMU to invalidate
+ *				    and address range.
+ *
+ * @pdev: PCI device
+ * @pasid: The process address space ID.
+ * @start: Start of address range
+ * @end: End of address range
+ */
+static void cass_ats_invalidate_range_cb(struct pci_dev *pdev, int pasid,
+					 unsigned long start, unsigned long end)
+{
+
+	struct cass_dev *hw = pci_get_drvdata(pdev);
+	struct cass_ac *cac;
+
+	cac = cass_cac_get(hw, pasid);
+	if (!cac)
+		return;
+
+	pr_debug("pasid:%d start:%lx end:%lx\n", pasid, start, end);
+
+	cass_invalidate_range(cac, start, end - start);
+	atomic_inc(&hw->dcpl_ats_mn_inval);
+	cass_cac_put(cac);
+}
+
+/**
+ * cass_amd_iommu_inval_cb_init() - Initialize the invalidation callback.
+ *
+ * @pdev: PCI device
+ */
+void cass_amd_iommu_inval_cb_init(struct pci_dev *pdev)
+{
+	int (*set_inval_range_cb)(struct pci_dev *pdev,
+				  amd_iommu_invalidate_range cb);
+	struct cass_dev *hw = pci_get_drvdata(pdev);
+	int ret;
+
+	/* Only set up invalidation callback for Cassini 1 */
+	if (!cass_version(hw, CASSINI_1))
+		return;
+
+	set_inval_range_cb = symbol_get(amd_iommu_set_invalidate_range_cb);
+	if (set_inval_range_cb) {
+		ret = set_inval_range_cb(pdev, cass_ats_invalidate_range_cb);
+		if (ret) {
+			dev_WARN(&pdev->dev,
+				 "Error setting invalidation callback (%d)\n",
+				 ret);
+		} else {
+			hw->ats_c1_odp_enable = true;
+		}
+
+		symbol_put(amd_iommu_set_invalidate_range_cb);
+	}
+}
+
+#endif /* CONFIG_AMD_IOMMU */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_atu.c b/drivers/net/ethernet/hpe/ss1/cass_atu.c
new file mode 100644
index 000000000000..6e80024dbc37
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_atu.c
@@ -0,0 +1,2072 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Address Translation Unit (ATU) management */
+
+#include <linux/interrupt.h>
+#include <linux/types.h>
+#include <linux/hugetlb.h>
+#include <linux/iova.h>
+#include <linux/bvec.h>
+#include <linux/iopoll.h>
+#include <linux/workqueue.h>
+#include <linux/random.h>
+
+#include "cass_core.h"
+#include "cass_ss1_debugfs.h"
+
+int more_debug;
+module_param(more_debug, int, 0644);
+MODULE_PARM_DESC(more_debug, "More debug");
+
+static int default_ptg_mode = C_ATU_PTG_MODE_DBL_C;
+module_param(default_ptg_mode, int, 0644);
+MODULE_PARM_DESC(default_ptg_mode, "Default PTG Mode");
+
+/* Invalidation interval is 2^(inval_process_interval+1) - 10 is ~2 uS */
+static int inval_process_interval = 10;
+module_param(inval_process_interval, int, 0644);
+MODULE_PARM_DESC(inval_process_interval, "ATS invalidate processing interval");
+
+/* Relaxed ordering bits test */
+static bool acxt_mem_rd_ro;
+module_param(acxt_mem_rd_ro, bool, 0644);
+MODULE_PARM_DESC(acxt_mem_rd_ro, "Memory Read Relaxed Ordering");
+static bool acxt_flush_req_ro;
+module_param(acxt_flush_req_ro, bool, 0644);
+MODULE_PARM_DESC(acxt_flush_req_ro, "Flush Request Relaxed Ordering");
+static bool acxt_translation_req_ro;
+module_param(acxt_translation_req_ro, bool, 0644);
+MODULE_PARM_DESC(acxt_translation_req_ro, "Translation Request Relaxed Ordering");
+static bool acxt_fetching_amo_ro;
+module_param(acxt_fetching_amo_ro, bool, 0644);
+MODULE_PARM_DESC(acxt_fetching_amo_ro, "Fetching AMO Relaxed Ordering");
+static bool acxt_ido;
+module_param(acxt_ido, bool, 0644);
+MODULE_PARM_DESC(acxt_ido, "ID-Based Ordering");
+
+static bool ac_salt = true;
+module_param(ac_salt, bool, 0644);
+MODULE_PARM_DESC(ac_salt, "Add salt to ACs");
+
+static bool acxt_ph_en;
+module_param(acxt_ph_en, bool, 0644);
+MODULE_PARM_DESC(acxt_ph_en, "Enable use of Processing Hints and Steering Tag");
+static u8 acxt_phints;
+module_param(acxt_phints, byte, 0644);
+MODULE_PARM_DESC(acxt_phints, "TLP Processing Hints");
+static u8 acxt_steering_tag;
+module_param(acxt_steering_tag, byte, 0644);
+MODULE_PARM_DESC(acxt_steering_tag, "Steering Tag");
+
+bool ats_c1_override;
+module_param(ats_c1_override, bool, 0644);
+MODULE_PARM_DESC(ats_c1_override, "Override ODP Enable for ATS with C1");
+
+/* Use a larger base page size when huge_shift - page_shift is greater
+ * than the maximum page table size (max-threshold) allowed. This allows
+ * us to support 256, 512 and 1024 MB Cray hugepage sizes.
+ */
+static int hugepage_threshold = 1;
+module_param(hugepage_threshold, int, 0644);
+MODULE_PARM_DESC(hugepage_threshold, "Threshold to increase base page size.");
+
+void cass_atu_fini(struct cass_dev *hw)
+{
+	cxi_unregister_hw_errors(hw, &hw->atu_err);
+	iova_cache_put();
+	dma_unmap_single(&hw->cdev.pdev->dev, hw->oxe_dummy_dma_addr,
+			 PAGE_SIZE, DMA_TO_DEVICE);
+	kfree(hw->oxe_dummy_addr);
+	ida_destroy(&hw->atu_table);
+	cass_iommu_fini(hw);
+	cass_nta_pri_fini(hw);
+	cass_nta_cq_fini(hw);
+	refcount_dec(&hw->refcount);
+}
+
+/* Atomically write an Address Context */
+static void cass_write_ac(struct cass_dev *hw, union c_atu_cfg_ac_table *ac,
+			  unsigned int index, bool user, bool is_physac,
+			  bool vf_en, int vf_num)
+{
+	union c_pi_cfg_acxt pi_cfg_acxt = {
+		.ac_en = ac->context_en,
+	};
+
+	pi_cfg_acxt.vf_en = vf_en;
+	pi_cfg_acxt.vf_num = vf_num;
+
+	if (ac->ta_mode != C_ATU_NTA_MODE) {
+		pi_cfg_acxt.pasid = ac->ats_pasid;
+		pi_cfg_acxt.pasid_en = ac->ats_pasid_en;
+		pi_cfg_acxt.pasid_er = ac->ats_pasid_er;
+		pi_cfg_acxt.pasid_pmr = ac->ats_pasid_pmr;
+	}
+
+	pi_cfg_acxt.mem_rd_ro = acxt_mem_rd_ro;
+	pi_cfg_acxt.flush_req_ro = acxt_flush_req_ro;
+	pi_cfg_acxt.translation_req_ro = acxt_translation_req_ro;
+	pi_cfg_acxt.fetching_amo_ro = acxt_fetching_amo_ro;
+	pi_cfg_acxt.ido = acxt_ido;
+
+	if (acxt_ph_en && user) {
+		pi_cfg_acxt.ph_en = acxt_ph_en;
+		pi_cfg_acxt.phints = acxt_phints;
+		pi_cfg_acxt.steering_tag = acxt_steering_tag;
+	}
+
+	if (ac_salt) {
+		u32 rand = get_random_u32();
+
+		ac->ptn_salt = rand;
+		ac->idx_salt = rand >> 2;
+	}
+
+	spin_lock(&hw->atu_shadow_lock);
+	cass_config_ac(hw, index, ac);
+	spin_unlock(&hw->atu_shadow_lock);
+
+	/* WORKAROUND: Cassini ERRATA-3277
+	 * When disabling an AC, invalidate before disabling the ACXT.
+	 */
+	if (!is_physac && cass_version(hw, CASSINI_1) && !ac->context_en) {
+		struct cass_ac *cac = container_of(ac, struct cass_ac, cfg_ac);
+
+		cass_invalidate_range(cac, 0, ATUCQ_INVALIDATE_ALL);
+	}
+
+	cass_config_pi_acxt(hw, index, &pi_cfg_acxt);
+}
+
+/* Callback registered with the interrupt error handler, executed when
+ * C_ATU_ERR_FLG.PRB_EXPIRED error interrupt is detected.
+ */
+static void cass_prb_exp_cb(struct cass_dev *hw, unsigned int irq,
+			    bool is_ext, unsigned int bitn)
+{
+	queue_work(hw->prb_wq, &hw->prb_work);
+}
+
+int cass_atu_init(struct cass_dev *hw)
+{
+	int i;
+	int ret;
+	union c_atu_cfg_nta cfg_nta = {
+		.acid = ATU_NTA_DEF_PI_ACXT,
+	};
+	union c_atu_cfg_ac_table ac = {
+		.context_en = 1,
+		.ta_mode = C_ATU_PASSTHROUGH_MODE,
+	};
+	union c_oxe_cfg_dummy_addr oxe_dummy = {
+		.ac = ATU_PHYS_AC
+	};
+	union c_atu_cfg_ats cfg_ats;
+
+	ac.mem_size = ~ac.mem_size;
+
+	hw->oxe_dummy_addr = kcalloc(1, PAGE_SIZE, GFP_KERNEL);
+	if (hw->oxe_dummy_addr == NULL)
+		return -ENOMEM;
+
+	ida_init(&hw->atu_table);
+	refcount_inc(&hw->refcount);
+	spin_lock_init(&hw->cac_table_lock);
+	spin_lock_init(&hw->atu_shadow_lock);
+	mutex_init(&hw->odpq_mutex);
+	atomic_set(&hw->stats.md, 0);
+	atomic_set(&hw->atu_error_inject, 0);
+	atomic_set(&hw->atu_odp_requests, 0);
+	atomic_set(&hw->atu_odp_fails, 0);
+	atomic_set(&hw->atu_prb_expired, 0);
+	atomic_set(&hw->dcpl_md_clear_inval, 0);
+	atomic_set(&hw->dcpl_nta_mn_inval, 0);
+	atomic_set(&hw->dcpl_ats_mn_inval, 0);
+	atomic_set(&hw->dcpl_comp_wait, 0);
+	atomic_set(&hw->dcpl_entered, 0);
+	atomic_set(&hw->dcpl_ixe_cntr_0, 0);
+	atomic_set(&hw->dcpl_ixe_cntr_dec_0, 0);
+	atomic_set(&hw->dcpl_ee_cntr_dec_0, 0);
+	atomic_set(&hw->dcpl_ee_cntr_stuck, 0);
+	atomic_set(&hw->dcpl_oxe_cntr_dec_0, 0);
+	atomic_set(&hw->dcpl_oxe_cntr_stuck, 0);
+	atomic_set(&hw->dcpl_ixe_cntr_stuck, 0);
+	atomic_set(&hw->dcpl_success, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_62, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_62_count, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_64, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_64_count, 0);
+	atomic_set(&hw->dcpl_ibw_active_stuck, 0);
+	atomic_set(&hw->dcpl_ibw_idle_wait, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_is_0, 0);
+	atomic_set(&hw->dcpl_ibw_issued, 0);
+	hw->dcpl_max_time = 0;
+	for (i = 0; i < DBINS; i++)
+		hw->dcpl_time[i] = 0;
+	hw->pri_max_md_time = 0;
+	hw->pri_max_fault_time = 0;
+	for (i = 0; i < MDBINS; i++)
+		hw->pri_md_time[i] = 0;
+	for (i = 0; i < FBINS; i++)
+		hw->pri_fault_time[i] = 0;
+
+	cass_write_ac(hw, &ac, ATU_PHYS_AC, false, false,
+		      ac.ats_vf_en, ac.ats_vf_num);
+	cass_write(hw, C_ATU_CFG_NTA, &cfg_nta, sizeof(union c_atu_cfg_nta));
+
+	hw->oxe_dummy_dma_addr = dma_map_single(&hw->cdev.pdev->dev,
+						hw->oxe_dummy_addr, PAGE_SIZE,
+						DMA_TO_DEVICE);
+	if (dma_mapping_error(&hw->cdev.pdev->dev, hw->oxe_dummy_dma_addr)) {
+		ret = -ENOMEM;
+		goto free_dummy;
+	}
+	oxe_dummy.subaddr = hw->oxe_dummy_dma_addr >> C_ADDR_SHIFT;
+	cass_write(hw, C_OXE_CFG_DUMMY_ADDR, &oxe_dummy,
+		   sizeof(union c_oxe_cfg_dummy_addr));
+
+	cass_read(hw, C_ATU_CFG_ATS, &cfg_ats.qw, sizeof(cfg_ats));
+
+	/* The simulator runs much slower so we need to change the
+	 * invalidate processing interval to a lower value.
+	 * The AMD IOMMU (in Epyc processors earlier than the 7002 series)
+	 * has bug where it returns multiple translations
+	 * with the same address if the page size is larger than the
+	 * STU size. Setting truncate_gt_stu_rsp is a workaround.
+	 * Cassini ERRATA-2431
+	 */
+	if (HW_PLATFORM_Z1(hw)) {
+		cfg_ats.inval_process_interval = 5;
+		cfg_ats.truncate_gt_stu_rsp = 1;
+	}
+
+	/* The inval_process_interval default causes IOMMU timeouts. */
+	if (HW_PLATFORM_ASIC(hw))
+		cfg_ats.inval_process_interval = inval_process_interval;
+
+	if (HW_PLATFORM_Z1(hw) || HW_PLATFORM_ASIC(hw))
+		cass_write(hw, C_ATU_CFG_ATS, &cfg_ats, sizeof(cfg_ats));
+
+	if (!cass_version(hw, CASSINI_1))
+		odp_sw_decouple = false;
+
+	if (cass_version(hw, CASSINI_1)) {
+		/* Errata 3117 */
+		union c1_atu_cfg_odp_decouple odp_decouple;
+
+		cass_read(hw, C1_ATU_CFG_ODP_DECOUPLE, &odp_decouple,
+			  sizeof(odp_decouple));
+		odp_decouple.flush_req_delay = ATU_FLUSH_REQ_DELAY;
+		odp_decouple.enable = odp_sw_decouple ? 0 : 1;
+		cass_write(hw, C1_ATU_CFG_ODP_DECOUPLE, &odp_decouple,
+			   sizeof(odp_decouple));
+	}
+
+	ret = cass_nta_cq_init(hw);
+	if (ret)
+		goto cq_init_fail;
+
+	ret = cass_nta_pri_init(hw);
+	if (ret)
+		goto pri_init_fail;
+
+	iova_cache_get();
+	cass_iommu_init(hw);
+
+	/* Register callback for C_ATU_ERR_FLG.PRB_EXPIRED bit */
+	hw->atu_err.irq = C_ATU_IRQA_MSIX_INT;
+	hw->atu_err.is_ext = false;
+	hw->atu_err.err_flags.atu.prb_expired = 1;
+	hw->atu_err.cb = cass_prb_exp_cb;
+	cxi_register_hw_errors(hw, &hw->atu_err);
+
+	return 0;
+
+pri_init_fail:
+	cass_nta_cq_fini(hw);
+
+cq_init_fail:
+	refcount_dec(&hw->refcount);
+	dma_unmap_single(&hw->cdev.pdev->dev, hw->oxe_dummy_dma_addr,
+			 PAGE_SIZE, DMA_TO_DEVICE);
+free_dummy:
+	kfree(hw->oxe_dummy_addr);
+
+	return ret;
+}
+
+static void cass_md_list_free(struct cass_ac *cac)
+{
+	struct cxi_md_priv *tmp;
+	struct cxi_md_priv *le;
+
+	mutex_lock(&cac->md_mutex);
+
+	list_for_each_entry_safe(le, tmp, &cac->md_list, md_entry) {
+		list_del(&le->md_entry);
+		refcount_dec(&cac->refcount);
+		cass_md_clear(le, false, true);
+		kfree(le);
+	}
+
+	mutex_unlock(&cac->md_mutex);
+}
+
+/**
+ * cass_cac_get - Pin a published Address Context for a reader
+ *
+ * @hw:  Cassini device
+ * @acid: Address Context ID
+ */
+struct cass_ac *cass_cac_get(struct cass_dev *hw, int acid)
+{
+	struct cass_ac *cac;
+	unsigned long flags;
+
+	if (acid < 0 || acid >= ARRAY_SIZE(hw->cac_table))
+		return NULL;
+
+	spin_lock_irqsave(&hw->cac_table_lock, flags);
+	cac = hw->cac_table[acid];
+	if (cac && !refcount_inc_not_zero(&cac->reader_refs))
+		cac = NULL;
+	spin_unlock_irqrestore(&hw->cac_table_lock, flags);
+
+	return cac;
+}
+
+void cass_cac_put(struct cass_ac *cac)
+{
+	if (cac && refcount_dec_and_test(&cac->reader_refs))
+		complete(&cac->readers_done);
+}
+
+static void cass_cac_unpublish(struct cass_dev *hw, struct cass_ac *cac)
+{
+	int acid = cac->ac.acid;
+	unsigned long flags;
+
+	spin_lock_irqsave(&hw->cac_table_lock, flags);
+	hw->cac_table[acid] = NULL;
+	spin_unlock_irqrestore(&hw->cac_table_lock, flags);
+
+	cass_cac_put(cac);
+	wait_for_completion(&cac->readers_done);
+}
+
+static void cass_cac_free(struct cass_dev *hw, struct cass_ac *cac)
+{
+	int acid = cac->ac.acid;
+
+	if (!refcount_dec_and_test(&cac->refcount)) {
+		cxidev_WARN_ONCE(&hw->cdev, true,
+				 "Resource leaks - AC refcount not zero: %d\n",
+				 refcount_read(&cac->refcount));
+		return;
+	}
+
+	kfree(cac);
+	ida_free(&hw->atu_table, acid);
+}
+
+static void cass_ac_init(struct cass_ac *cac, const struct ac_map_opts *m_opts)
+{
+	union c_atu_cfg_ac_table *ac = &cac->cfg_ac;
+	struct cass_dev *hw = container_of(cac->lni_priv->dev,
+					   struct cass_dev, cdev);
+
+	ac->pg_table_size = cac->huge_shift - cac->page_shift;
+	ac->base_pg_size = cac->page_shift - C_ADDR_SHIFT;
+	ac->ptg_mode = cac->ptg_mode;
+	ac->do_not_cache = !!(cac->flags & CXI_MAP_NOCACHE);
+	ac->odp_en = !(cass_version(hw, CASSINI_1_0) ||
+		       (cac->flags & CXI_MAP_PIN));
+	ac->do_not_filter = hw->ac_filter_disabled;
+	ac->context_en = 1;
+
+	pr_debug("page_shift:%d huge_shift:%d base_pg_sz:%d pg_table_sz:%d\n",
+		 cac->page_shift, cac->huge_shift, ac->base_pg_size,
+		 ac->pg_table_size);
+}
+
+/**
+ * cass_lac_free() - Unmap an AC from the LNI's resource group.
+ *
+ * @lni_priv: the Logical Network Interface
+ * @lac: LAC to free
+ */
+static void cass_lac_free(struct cxi_lni_priv *lni_priv, int lac)
+{
+	struct cass_dev *hw = container_of(lni_priv->dev, struct cass_dev, cdev);
+
+	cass_set_acid(hw, lni_priv->lni.rgid, lac, C_AC_NONE);
+	cass_lac_put(hw, lni_priv->lni.rgid, lac);
+}
+
+/**
+ * cass_ac_phys_alloc - Allocate a physical Address Context for a VF
+ *
+ * This per-VF AC is analogous to ATU_PHYS_AC and is used in its place when
+ * configuring resources such as CQs that belong to a VF.
+ *
+ * @hw: CXI device
+ * @vf_en: true if allocating an AC for a VF
+ * @vf_num: VF number to allocate AC for (ignored if vf_en is false)
+ */
+int cass_ac_phys_alloc(struct cass_dev *hw, bool vf_en, int vf_num)
+{
+	int acid;
+	union c_atu_cfg_ac_table ac = {
+		.context_en = 1,
+		.ta_mode = C_ATU_PASSTHROUGH_MODE,
+		.mem_size = ~0,
+		.ats_vf_en = vf_en,
+		.ats_vf_num = vf_en ? vf_num : 0,
+	};
+
+	acid = ida_alloc_range(&hw->atu_table, 1, ATU_PHYS_AC - 1, GFP_KERNEL);
+	if (acid < 0)
+		return acid;
+
+	cass_write_ac(hw, &ac, acid, false, true, vf_en, vf_num);
+
+	return acid;
+}
+
+/**
+ * cass_ac_phys_free - Free a physical Address Context allocated by
+ * cass_ac_phys_alloc()
+ *
+ * @hw: CXI device
+ * @acid: ID of address context
+ */
+void cass_ac_phys_free(struct cass_dev *hw, int acid)
+{
+	union c_atu_cfg_ac_table ac = {};
+
+	cass_write_ac(hw, &ac, acid, false, true, false, 0);
+	ida_free(&hw->atu_table, acid);
+}
+
+/**
+ * cass_ac_alloc() - Allocate an Address Context
+ *
+ * Once the ACID is written to hardware, it cannot be freed until the LNI
+ * is freed.
+ *
+ * @lni_priv: the Logical Network Interface
+ * @m_opts: User map options
+ */
+static struct cass_ac *cass_ac_alloc(struct cxi_lni_priv *lni_priv,
+				     struct ac_map_opts *m_opts)
+{
+	int ret;
+	unsigned long irq_flags;
+	struct cass_ac *cac;
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	/* ac->pg_table_size is limited to 4 bits and a minimum of 8 entries */
+	if ((m_opts->huge_shift - m_opts->page_shift > MAX_PG_TABLE_SIZE) ||
+	    ((m_opts->ptg_mode != C_ATU_PTG_MODE_SGL) &&
+	     ((m_opts->huge_shift - m_opts->page_shift) < MIN_PG_TABLE_SIZE))) {
+		pr_debug("Invalid huge_shift:%d/page_shift:%d combination\n",
+			 m_opts->huge_shift, m_opts->page_shift);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* Check the associated service to see if this AC can be allocated */
+	ret = cxi_rgroup_alloc_resource(lni_priv->rgroup, CXI_RESOURCE_AC);
+	if (ret)
+		return ERR_PTR(ret);
+
+	cac = kzalloc(sizeof(*cac), GFP_KERNEL);
+	if (!cac) {
+		ret = -ENOMEM;
+		goto dec_rsrc_use;
+	}
+
+	/* AC_NONE (0) is invalid, ATU_PHYS_AC is reserved for physical
+	 * mappings
+	 */
+	ret = ida_alloc_range(&hw->atu_table, 1, ATU_PHYS_AC - 1, GFP_KERNEL);
+	if (ret < 0)
+		goto cac_free;
+
+	cac->ac.acid = ret;
+
+	ret = cass_lac_get(hw, lni_priv->lni.rgid);
+	if (ret < 0)
+		goto ac_put;
+
+	cac->ac.lac = ret;
+
+	refcount_set(&cac->refcount, 1);
+	mutex_init(&cac->ac_mutex);
+	cac->lni_priv = lni_priv;
+	cac->flags = m_opts->flags;
+	cac->ptg_mode = m_opts->ptg_mode;
+	cac->page_shift = m_opts->page_shift;
+	cac->huge_shift = m_opts->huge_shift;
+	cac->hugepage_test = m_opts->hugepage_test;
+
+	cass_ac_init(cac, m_opts);
+
+	if (m_opts->flags & CXI_MAP_ATS)
+		ret = cass_ats_init(lni_priv, m_opts, cac);
+	else
+		ret = cass_nta_init(lni_priv, m_opts, cac);
+
+	if (ret)
+		goto lac_put;
+
+	INIT_LIST_HEAD(&cac->md_list);
+	mutex_init(&cac->md_mutex);
+	refcount_set(&cac->reader_refs, 1);
+	init_completion(&cac->readers_done);
+
+	spin_lock_irqsave(&hw->cac_table_lock, irq_flags);
+	hw->cac_table[cac->ac.acid] = cac;
+	spin_unlock_irqrestore(&hw->cac_table_lock, irq_flags);
+
+	cass_write_ac(hw, &cac->cfg_ac, cac->ac.acid,
+		      m_opts->flags & CXI_MAP_USER_ADDR, false,
+		      cac->lni_priv->is_vf,
+		      cac->lni_priv->is_vf ? cac->lni_priv->vf_num : 0);
+	cass_set_acid(hw, lni_priv->lni.rgid, cac->ac.lac, cac->ac.acid);
+
+	list_add_tail(&cac->list, &lni_priv->ac_list);
+	refcount_inc(&lni_priv->refcount);
+
+	atomic_inc(&hw->stats.ac);
+
+	ac_debugfs_create(cac->ac.acid, cac, hw, lni_priv);
+
+	return cac;
+
+lac_put:
+	cass_lac_put(hw, lni_priv->lni.rgid, cac->ac.lac);
+ac_put:
+	ida_free(&hw->atu_table, cac->ac.acid);
+cac_free:
+	kfree(cac);
+dec_rsrc_use:
+	cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_AC);
+
+	pr_debug("failed rc %d\n", ret);
+	return ERR_PTR(ret);
+}
+
+static void cass_ac_free(struct cass_dev *hw, struct cass_ac *cac)
+{
+	struct cxi_lni_priv *lni_priv = cac->lni_priv;
+
+	pr_debug("freeing ac %d\n", cac->ac.acid);
+
+	cass_cac_unpublish(hw, cac);
+
+	debugfs_remove(cac->lni_dir);
+	debugfs_remove_recursive(cac->debug_dir);
+
+	atomic_dec(&hw->stats.ac);
+	cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_AC);
+
+	cass_md_list_free(cac);
+	cass_nta_iova_fini(cac);
+
+	if (cac->nta) {
+		cass_l1_tables_free(hw, cac->nta);
+		cass_invalidate_range(cac, 0, ATUCQ_INVALIDATE_ALL);
+		cass_nta_free(hw, cac->nta);
+	}
+
+	memset(&cac->cfg_ac, 0, sizeof(cac->cfg_ac));
+	cass_write_ac(hw, &cac->cfg_ac, cac->ac.acid, false, false,
+		      lni_priv->is_vf, lni_priv->is_vf ? lni_priv->vf_num : 0);
+
+	cass_unbind_ac(hw, cac);
+
+	cass_lac_free(lni_priv, cac->ac.lac);
+	cass_cac_free(hw, cac);
+	refcount_dec(&lni_priv->refcount);
+}
+
+/**
+ * cass_acs_disable() - Disable all the ACs of an LNI
+ *
+ * The LNI is getting released. This is the first part of the cleanup.
+ *
+ * @lni_priv: the Logical Network Interface
+ */
+void cass_acs_disable(struct cxi_lni_priv *lni_priv)
+{
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cass_ac *cac;
+
+	mutex_lock(&lni_priv->ac_list_mutex);
+
+	list_for_each_entry(cac, &lni_priv->ac_list, list) {
+		cac->cfg_ac.context_en = 0;
+		cass_write_ac(hw, &cac->cfg_ac, cac->ac.acid, false, false,
+			      cac->lni_priv->is_vf,
+			      cac->lni_priv->is_vf ? cac->lni_priv->vf_num : 0);
+	}
+
+	mutex_unlock(&lni_priv->ac_list_mutex);
+
+	cass_flush_pci(hw);
+}
+
+/**
+ * cass_acs_free() - Free all ACs associated with an LNI
+ *
+ * The ac_list is used by cass_pri_fault() and cass_sync_pagetables().
+ * LNI cleanup disables all the ACs associated with the LNI and then calls
+ * inbound wait so cass_pri_fault() will not be called while cleaning up.
+ * cass_hmm_fini() will remove this process from the hmm mirrors list so
+ * cass_sync_pagetables() will not be called while cleaning up.
+ *
+ * @lni_priv: the Logical Network Interface
+ */
+void cass_acs_free(struct cxi_lni_priv *lni_priv)
+{
+	struct cass_ac *cac;
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	mutex_lock(&lni_priv->ac_list_mutex);
+
+	while ((cac = list_first_entry_or_null(&lni_priv->ac_list,
+					       struct cass_ac, list))) {
+		list_del(&cac->list);
+		mutex_unlock(&lni_priv->ac_list_mutex);
+		cass_ac_free(hw, cac);
+		mutex_lock(&lni_priv->ac_list_mutex);
+	}
+
+	mutex_unlock(&lni_priv->ac_list_mutex);
+
+	if (dev->is_physfn)
+		cass_flush_pci(hw);
+}
+
+/**
+ * cass_iova_alloc() - Allocate an IO virtual address in an Address Context
+ *
+ * Find an AC with matching characteristics and allocate an IOVA.
+ *
+ * @lni_priv: the Logical Network Interface
+ * @m_opts: User map options
+ */
+static struct cass_ac *cass_iova_alloc(struct cxi_lni_priv *lni_priv,
+				       struct ac_map_opts *m_opts)
+{
+	u64 iova;
+	struct list_head *ptr;
+	u32 masked_flags = m_opts->flags & ATU_FLAGS_MASK;
+
+	list_for_each(ptr, &lni_priv->ac_list) {
+		struct cass_ac *cac = list_entry(ptr, struct cass_ac, list);
+		u32 cac_msk_flags = cac->flags & ATU_FLAGS_MASK;
+
+		if ((m_opts->page_shift == cac->page_shift) &&
+		    (m_opts->huge_shift == cac->huge_shift) &&
+				(m_opts->ptg_mode == cac->ptg_mode) &&
+				(masked_flags == cac_msk_flags) &&
+				!m_opts->hugepage_test) {
+			if (m_opts->flags & CXI_MAP_ATS) {
+				iova = m_opts->va_start;
+			} else {
+				iova = cass_nta_iova_alloc(cac, m_opts);
+				if (!iova)
+					continue;
+			}
+
+			m_opts->iova = iova;
+
+			return cac;
+		}
+	}
+
+	return ERR_PTR(-ENOSPC);
+}
+
+/* Find or allocate an AC matching the options */
+static struct cass_ac *get_matching_ac(struct cxi_lni_priv *lni_priv,
+				       struct ac_map_opts *m_opts)
+{
+	struct cass_ac *cac;
+
+	mutex_lock(&lni_priv->ac_list_mutex);
+
+	cac = cass_iova_alloc(lni_priv, m_opts);
+	if (IS_ERR(cac))
+		cac = cass_ac_alloc(lni_priv, m_opts);
+
+	mutex_unlock(&lni_priv->ac_list_mutex);
+
+	return cac;
+}
+
+static void cass_init_md(const struct ac_map_opts *m_opts,
+			 struct cxi_md_priv *md_priv)
+{
+	md_priv->md.iova = m_opts->iova;
+	md_priv->md.va = m_opts->va_start;
+	md_priv->md.len = m_opts->va_len;
+	md_priv->md.page_shift = m_opts->page_shift;
+	md_priv->md.huge_shift = m_opts->huge_shift;
+	md_priv->md.lac = md_priv->cac->ac.lac;
+	md_priv->olen = m_opts->va_len;
+	md_priv->flags = m_opts->flags & ~(CXI_MAP_FAULT | CXI_MAP_PREFETCH);
+
+	/* Since we don't mirror the page tables when CXI_MAP_ALLOC_MD
+	 * is set, the first call to cxi_update_iov needs to lock.
+	 */
+	if (m_opts->flags & CXI_MAP_ALLOC_MD)
+		md_priv->need_lock = true;
+}
+
+/* Add an MD to an LNI */
+static void cass_add_md(struct cxi_lni_priv *lni_priv,
+			const struct ac_map_opts *m_opts,
+			struct cxi_md_priv *md_priv)
+{
+	struct cass_ac *cac = md_priv->cac;
+	struct cass_dev *hw = container_of(cac->lni_priv->dev, struct cass_dev, cdev);
+
+	mutex_lock(&cac->md_mutex);
+	list_add_tail(&md_priv->md_entry, &cac->md_list);
+	refcount_inc(&cac->refcount);
+	atomic_inc(&hw->stats.md);
+	mutex_unlock(&cac->md_mutex);
+}
+
+/**
+ * cass_remove_md() - Remove an MD from its LNI, clear and invalidate
+ *                    page table entries.
+ *
+ * @md_priv: Private memory descriptor
+ */
+static void cass_remove_md(struct cxi_md_priv *md_priv)
+{
+	struct cass_ac *cac = md_priv->cac;
+	struct cass_dev *hw = container_of(cac->lni_priv->dev, struct cass_dev, cdev);
+
+	mutex_lock(&md_priv->cac->md_mutex);
+	list_del(&md_priv->md_entry);
+	refcount_dec(&cac->refcount);
+	atomic_dec(&hw->stats.md);
+	mutex_unlock(&md_priv->cac->md_mutex);
+
+	cass_md_clear(md_priv, true, true);
+}
+
+static void cass_md_iova_free(struct cxi_md_priv *md_priv)
+{
+	struct cass_ac *cac = md_priv->cac;
+
+	if (cac->iovad)
+		FREE_IOVA_FAST(cac->iovad, md_priv->md.iova, md_priv->olen);
+}
+
+static int cass_bvec(struct cass_dev *hw, const struct iov_iter *iter,
+		     size_t *len, u64 *va)
+{
+	int i;
+	int last_seg = iter->nr_segs - 1;
+	const struct bio_vec *bvec = iter->bvec;
+
+	*va = (u64)page_address(bvec->bv_page);
+
+	for (i = 0; i < iter->nr_segs; i++) {
+		if (i && (bvec->bv_offset & ~PAGE_MASK)) {
+			cxidev_err(&hw->cdev, "bvec[%d] offset not aligned %d\n", i,
+				   bvec->bv_offset);
+			return -EINVAL;
+		}
+
+		if (i < last_seg && ((bvec->bv_offset + bvec->bv_len) &
+						~PAGE_MASK)) {
+			cxidev_err(&hw->cdev, "bvec[%d] contains a hole\n", i);
+			return -EINVAL;
+		}
+		bvec++;
+	}
+
+	*len = iter->nr_segs * PAGE_SIZE;
+
+	return 0;
+}
+
+static int cass_kvec(struct cass_dev *hw, const struct iov_iter *iter,
+		     size_t *len, u64 *va)
+{
+	int i;
+	int alen;
+	int tlen = 0;
+	int last_seg = iter->nr_segs - 1;
+	const struct kvec *kvec = iter->kvec;
+
+	*va = (u64)kvec->iov_base & PAGE_MASK;
+
+	for (i = 0; i < iter->nr_segs; i++) {
+		/*
+		 * Only the first kvec may be unaligned. The first and last
+		 * kvec's lengths can be less that a page but the rest need
+		 * to be full pages. The first base + len must be aligned.
+		 */
+		if (i && ((u64)kvec->iov_base & ~PAGE_MASK)) {
+			cxidev_err(&hw->cdev, "kvec[%d] base not aligned %p\n", i,
+				   kvec->iov_base);
+			return -EINVAL;
+		}
+
+		if (i < last_seg && (((u64)kvec->iov_base + kvec->iov_len) &
+					~PAGE_MASK)) {
+			cxidev_err(&hw->cdev, "kvec[%d] contains a hole\n", i);
+			return -EINVAL;
+		}
+
+		alen = PAGE_ALIGN(kvec->iov_len);
+		tlen += alen;
+		kvec++;
+	}
+
+	*len = tlen;
+
+	return 0;
+}
+
+/* cass_sgtable_is_valid() - Check for invalid sgt
+ *
+ * Requirements for entries in sgt:
+ * one entry:
+ *     offset < PAGE_SIZE
+ * multiple entries:
+ *     first:  offset < PAGE_SIZE, (len + offset) % PAGE_SIZE
+ *     middle: offset == 0, len % PAGE_SIZE
+ *     last:   offset == 0
+ */
+static bool cass_sgtable_is_valid(struct cass_dev *hw,
+				  const struct sg_table *sgt, size_t *length)
+{
+	int i;
+	struct scatterlist *sg;
+	int last_entry = sgt->nents - 1;
+
+	*length = 0;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		size_t len = sg_dma_len(sg);
+
+		if (sg->offset > PAGE_SIZE) {
+			cxidev_err(&hw->cdev,
+				   "Entry %d offset:%x > PAGE_SIZE\n",
+				   i, sg->offset);
+
+			return false;
+		}
+
+		/* first of multiple entries */
+		if ((!i && i != last_entry && ((len + sg->offset) % PAGE_SIZE)) ||
+		    /* last entry */
+		    (i && i == last_entry && sg->offset) ||
+		    /* middle entries */
+		    (i && i < last_entry && (sg->offset ||
+					     len % PAGE_SIZE))) {
+			cxidev_err(&hw->cdev, "Hole in sg_table at entry %d offset:%x len:%lx\n",
+				   i, sg->offset, len);
+
+			return false;
+		}
+
+		*length += ALIGN(len + sg->offset, PAGE_SIZE);
+	}
+
+	return true;
+}
+
+/**
+ * cass_mirror_range() - Mirror an address range
+ *
+ * @md_priv: Private memory descriptor
+ * @m_opts:  User options
+ *
+ * @return: 0 on success or -ENOMEM
+ */
+int cass_mirror_range(struct cxi_md_priv *md_priv, struct ac_map_opts *m_opts)
+{
+	if (!(m_opts->flags & CXI_MAP_USER_ADDR))
+		return cass_nta_mirror_kern(md_priv, NULL, true);
+
+	if (m_opts->flags & CXI_MAP_ATS)
+		return cass_ats_md_init(md_priv, m_opts);
+
+	if (m_opts->flags & CXI_MAP_DEVICE)
+		return cass_mirror_device(md_priv, m_opts);
+
+	if (m_opts->hugepage_test)
+		return cass_mirror_hp(m_opts, md_priv);
+
+	if (m_opts->flags & CXI_MAP_PIN)
+		return cass_pin_mirror(md_priv, m_opts);
+
+	return cass_mmu_notifier_insert(md_priv, m_opts);
+}
+
+static void cass_unpin(struct cxi_md_priv *md_priv)
+{
+	int npages = md_priv->md.len >> PAGE_SHIFT;
+
+	if (!(md_priv->flags & CXI_MAP_PIN))
+		return;
+
+	if (!md_priv->pages)
+		return;
+
+	unpin_user_pages(md_priv->pages, npages);
+	kvfree(md_priv->pages);
+	md_priv->pages = NULL;
+}
+
+/**
+ * cass_md_clear() - Clear a memory descriptor
+ *
+ * Remove page table entries for NTA mode
+ * Unpin ATS or device pinned pages
+ *
+ * @md_priv: Private memory descriptor
+ * @inval: Invalidate this iova range
+ * @need_lock: Indicates whether the ac_mutex is required
+ */
+void cass_md_clear(struct cxi_md_priv *md_priv, bool inval, bool need_lock)
+{
+	struct cass_dev *hw = container_of(md_priv->cac->lni_priv->dev,
+					   struct cass_dev, cdev);
+
+	cass_notifier_cleanup(md_priv);
+
+	if (md_priv->flags & CXI_MAP_ATS)
+		return cass_unpin(md_priv);
+
+	/* If inval is false we have been called from cass_md_list_free()
+	 * which is only called when the AC is cleaning up so we don't
+	 * need to invalidate here as we will invalidate the whole AC range.
+	 */
+	cass_cond_lock(&md_priv->cac->ac_mutex, need_lock);
+	cass_clear_range(md_priv, md_priv->md.iova,
+			 md_priv->md.len);
+	cass_cond_unlock(&md_priv->cac->ac_mutex, need_lock);
+
+	if (inval) {
+		cass_invalidate_range(md_priv->cac, md_priv->md.iova,
+				      md_priv->md.len);
+		atomic_inc(&hw->dcpl_md_clear_inval);
+	}
+
+	if (md_priv->flags & CXI_MAP_DEVICE)
+		cass_device_put_pages(md_priv);
+	else
+		cass_unpin(md_priv);
+}
+
+static int largest_hp_size(struct vm_area_struct *vma, u64 end)
+{
+	int vma_hs;
+	int hs = INT_MAX;
+	ulong vm_end_prev;
+#ifdef VMA_ITERATOR
+	VMA_ITERATOR(vmi, vma->vm_mm, vma->vm_start);
+#endif
+
+	while (true) {
+		if (!is_vm_hugetlb_page(vma))
+			return PMD_SHIFT;
+
+		vma_hs = huge_page_shift(hstate_vma(vma));
+
+		hs = vma_hs < hs ? vma_hs : hs;
+
+		if (vma->vm_end >= end)
+			return hs;
+
+		vm_end_prev = vma->vm_end;
+#ifdef VMA_ITERATOR
+		vma = vma_next(&vmi);
+#else
+		vma = vma->vm_next;
+#endif
+		/* full range is not backed by vmas */
+		if (!vma)
+			return PMD_SHIFT;
+
+		/* found a hole */
+		if (vma->vm_start > vm_end_prev)
+			return PMD_SHIFT;
+
+		/* not in range */
+		if (vma->vm_start >= end)
+			break;
+	}
+
+	return hs;
+}
+
+static int align_and_page_shift(struct ac_map_opts *m_opts)
+{
+	/* To support hugepage sizes larger than 128MB, we need
+	 * a larger base page size.
+	 */
+	if ((m_opts->huge_shift - m_opts->page_shift) >
+			(MAX_PG_TABLE_SIZE - hugepage_threshold))
+		m_opts->page_shift = m_opts->huge_shift -
+				MAX_PG_TABLE_SIZE + hugepage_threshold;
+
+	/* A hugepage is backing this address so align
+	 * to and map the full hugepage.
+	 */
+	return m_opts->huge_shift;
+}
+
+int cass_cpu_page_size(struct cass_dev *hw, struct ac_map_opts *m_opts,
+		       struct mm_struct *mm, uintptr_t va,
+		       const struct cxi_md_hints *hints, int *align_shift)
+{
+	int ret = 0;
+	struct vm_area_struct *vma;
+
+	/* ODP hint from user for the hugepage size */
+	if (hints && !hints->page_shift && hints->huge_shift &&
+	    !(m_opts->flags & (CXI_MAP_PIN | CXI_MAP_FAULT | CXI_MAP_PREFETCH))) {
+		m_opts->huge_shift = hints->huge_shift;
+		*align_shift = align_and_page_shift(m_opts);
+
+		return 0;
+	}
+
+	mmap_read_lock(mm);
+	vma = find_vma(mm, va);
+	if (!vma) {
+		cxidev_warn(&hw->cdev, "No VMA covering 0x%016lx)\n", va);
+		ret = -EFAULT;
+		goto unlock;
+	}
+
+	/* Test arbitrary page sizes supplied by the user. The contiguous
+	 * pages will be mmapped from a 1G hugepage and combined into larger
+	 * base pages and smaller hugepages.
+	 */
+	if (hints && hints->page_shift && is_vm_hugetlb_page(vma)) {
+		m_opts->huge_shift = huge_page_shift(hstate_vma(vma));
+
+		pr_debug("Testing huge shift:%d bs:%d hs:%d\n",
+			 m_opts->huge_shift, hints->page_shift,
+			 hints->huge_shift);
+
+		if (hints->huge_shift > m_opts->huge_shift) {
+			cxidev_warn(&hw->cdev, "Hints huge_shift (%d) > vma's huge_shift (%d)\n",
+				    hints->huge_shift, m_opts->huge_shift);
+			ret = -EINVAL;
+			goto unlock;
+		}
+
+		m_opts->page_shift = hints->page_shift;
+		m_opts->huge_shift = hints->huge_shift;
+		*align_shift = hints->huge_shift;
+		m_opts->hugepage_test = true;
+		goto unlock;
+	}
+
+	if (is_vm_hugetlb_page(vma)) {
+		m_opts->huge_shift = largest_hp_size(vma, m_opts->va_end);
+		m_opts->is_huge_page = true;
+		*align_shift = align_and_page_shift(m_opts);
+	} else {
+		int vms_fs = ffsl(vma->vm_start);
+		int vml_fs = ffsl(vma->vm_end - vma->vm_start);
+
+		/* Small regions may not be aligned to the default alignment
+		 * passed in so limit alignment to the VMA.
+		 */
+		if (vms_fs < *align_shift || vml_fs < *align_shift)
+			*align_shift = min_t(int, vms_fs, vml_fs);
+	}
+
+unlock:
+	mmap_read_unlock(mm);
+
+	return ret;
+}
+
+/**
+ * cass_align_start_len() - Align the va and len to align_shift page size
+ *
+ * @m_opts: User map options
+ * @va: Virtual address
+ * @len: Length of address
+ * @align_shift: Power of two to align to
+ */
+void cass_align_start_len(struct ac_map_opts *m_opts, uintptr_t va, size_t len,
+			  int align_shift)
+{
+	size_t page_size = BIT(align_shift);
+
+	m_opts->va_start = round_down(va, page_size);
+	m_opts->va_len = round_up(va + len, page_size) - m_opts->va_start;
+	m_opts->va_end = m_opts->va_start + m_opts->va_len;
+}
+
+/**
+ * cxi_phys_lac_alloc_vf() - Allocate a physical LAC for the given LNI for a VF.
+ *
+ * @lni: the Logical Network Interface
+ * @return: LAC or negative errno
+ */
+static int cxi_phys_lac_alloc_vf(struct cxi_lni *lni)
+{
+	struct cxi_lni_priv_vf *lni_priv_vf = container_of(lni, struct cxi_lni_priv_vf, lni);
+
+	return lni_priv_vf->phys_lac;
+}
+
+/**
+ * cxi_phys_lac_alloc() - Allocate a physical LAC for the given LNI.
+ *                        Exported to allow clients to perform DMA using physical addresses.
+ *
+ * @lni: the Logical Network Interface
+ * @return: LAC or negative errno
+ */
+int cxi_phys_lac_alloc(struct cxi_lni *lni)
+{
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(lni_priv->dev, struct cass_dev, cdev);
+	int lac;
+
+	if (!cdev->is_physfn)
+		return cxi_phys_lac_alloc_vf(lni);
+
+	lac = cass_lac_get(hw, lni_priv->lni.rgid);
+	if (lac < 0)
+		return lac;
+
+	/* Program the phys_ac that was already selected at the lni allocation */
+	cass_set_acid(hw, lni_priv->lni.rgid, lac, lni_priv->phys_ac);
+
+	return lac;
+}
+EXPORT_SYMBOL(cxi_phys_lac_alloc);
+
+/**
+ * cxi_phys_lac_free() - Unmap a physical LAC
+ *
+ * @lni: the Logical Network Interface
+ * @lac: LAC to free
+ */
+void cxi_phys_lac_free(struct cxi_lni *lni, int lac)
+{
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+
+	/* VFs do not free physical LACs. They will be freed when the LNI is freed */
+	if (!cdev->is_physfn)
+		return;
+
+	cass_lac_free(lni_priv, lac);
+}
+EXPORT_SYMBOL(cxi_phys_lac_free);
+
+/**
+ * cxi_clear_md() - Zero page table entries and invalidate a memory descriptor
+ *
+ * @md: Memory Descriptor used in network operations
+ */
+int cxi_clear_md(struct cxi_md *md)
+{
+	struct cxi_md_priv *md_priv;
+
+	if (!md)
+		return -EINVAL;
+
+	md_priv = container_of(md, struct cxi_md_priv, md);
+
+	pr_debug("va:%llx iova:%llx len:%lx\n", md->va, md->iova, md->len);
+
+	cass_md_clear(md_priv, true, false);
+	cass_dma_unmap_pages(md_priv);
+	md_priv->external_sgt_owner = false;
+	md_priv->sgt = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_clear_md);
+
+/**
+ * cxi_update_iov() - Map a list of virtual address or pages in an IO
+ *                    virtual address space into an existing memory
+ *                    descriptor.
+ *
+ * @md: Memory descriptor
+ * @iter: List of virtual addresses to map - supports ITER_KVEC and ITER_BVEC
+ */
+int cxi_update_iov(struct cxi_md *md, const struct iov_iter *iter)
+{
+	u64 va;
+	int ret;
+	size_t len;
+	struct cxi_md_priv *md_priv;
+	struct cxi_lni_priv *lni_priv;
+	struct cxi_dev *dev;
+	struct cass_dev *hw;
+
+	if (!md)
+		return -EINVAL;
+
+	md_priv = container_of(md, struct cxi_md_priv, md);
+	lni_priv = md_priv->lni_priv;
+	dev = lni_priv->dev;
+	hw = container_of(dev, struct cass_dev, cdev);
+
+	if (iov_iter_is_bvec(iter))
+		ret = cass_bvec(hw, iter, &len, &va);
+	else
+		ret = cass_kvec(hw, iter, &len, &va);
+	if (ret)
+		return ret;
+
+	if (len > md_priv->olen)
+		return -EINVAL;
+
+	md->len = len;
+
+	ret = cass_nta_mirror_kern(md_priv, iter, md_priv->need_lock);
+
+	pr_debug("iovs:%ld len:0x%lx iova:%llx\n", iter->nr_segs, md->len,
+		 md->iova);
+
+	return ret;
+
+}
+EXPORT_SYMBOL(cxi_update_iov);
+
+/**
+ * cxi_map_iov() - Map a list of virtual address or pages in an IO
+ *                 virtual address space
+ *
+ * @lni: the Logical Network Interface
+ * @iter: List of virtual addresses to map - supports ITER_KVEC and ITER_BVEC
+ * @flags: various options affecting the map
+ */
+struct cxi_md *cxi_map_iov(struct cxi_lni *lni, const struct iov_iter *iter,
+			   u32 flags)
+{
+	u64 va;
+	int ret;
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_md_priv *md_priv;
+	struct cxi_md *md;
+	struct ac_map_opts m_opts = {
+		.page_shift = PAGE_SHIFT,
+		.huge_shift = PMD_SHIFT
+	};
+	struct cass_ac *cac;
+
+	/* currently unsupported flags */
+	if (flags & CXI_MAP_ATS)
+		return ERR_PTR(-EINVAL);
+
+	if (iov_iter_is_bvec(iter))
+		ret = cass_bvec(hw, iter, &m_opts.va_len, &va);
+	else
+		ret = cass_kvec(hw, iter, &m_opts.va_len, &va);
+	if (ret)
+		return ERR_PTR(ret);
+
+	m_opts.va_start = 0;
+	m_opts.flags = flags;
+	m_opts.va_end = m_opts.va_start + m_opts.va_len;
+	m_opts.ptg_mode = default_ptg_mode;
+
+	cac = get_matching_ac(lni_priv, &m_opts);
+	if (IS_ERR(cac))
+		return ERR_PTR(PTR_ERR(cac));
+
+	md_priv = kzalloc(sizeof(*md_priv), GFP_KERNEL);
+	if (md_priv == NULL)
+		return ERR_PTR(-ENOMEM);
+	refcount_set(&md_priv->refcount, 1);
+	md = &md_priv->md;
+	md_priv->device = &hw->cdev.pdev->dev;
+
+	/* Get an MD ID, above CXI_MD_NONE */
+	ret = ida_alloc_min(&hw->md_index_table, 1, GFP_KERNEL);
+	if (ret < 0) {
+		cxidev_err(cdev, "ida_alloc_min failed %d\n", ret);
+		goto md_free;
+	}
+	md->id = ret;
+
+	md_priv->cac = cac;
+	md_priv->lni_priv = lni_priv;
+
+	cass_init_md(&m_opts, md_priv);
+
+	ret = cass_nta_mirror_kern(md_priv, iter, true);
+	if (ret)
+		goto mirror_range_error;
+
+	cass_add_md(lni_priv, &m_opts, md_priv);
+
+	pr_debug("iovs:%ld len:0x%lx iova:%llx\n", iter->nr_segs, md->len,
+		 md->iova);
+
+	refcount_inc(&lni_priv->refcount);
+
+	return md;
+
+mirror_range_error:
+	cass_md_iova_free(md_priv);
+	ida_free(&hw->md_index_table, md->id);
+md_free:
+	kfree(md_priv);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(cxi_map_iov);
+
+/**
+ * cxi_map_sgtable_vf() - Map an sg table to an IO virtual address space for a VF
+ *
+ * @lni: The Logical Network Interface
+ * @sgt: The sg_table object. It is expected to be dma mapped.
+ * @flags: Various options affecting the map
+ *
+ * @return: memory descriptor or error code
+ */
+static struct cxi_md *cxi_map_sgtable_vf(struct cxi_lni *lni,
+					 struct sg_table *sgt, u32 flags)
+{
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_lni_priv_vf *lni_priv_vf = container_of(lni, struct cxi_lni_priv_vf, lni);
+	struct cxi_dev *dev = lni_priv_vf->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_md_priv_vf *md_priv_vf;
+	struct cxi_atu_map_sgt_cmd *cmd;
+	struct cxi_atu_map_sgt_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	struct scatterlist *sg;
+	int i;
+	int rc;
+	size_t sgt_len;
+
+	if (!sgt)
+		return ERR_PTR(-EINVAL);
+
+	if (!cass_sgtable_is_valid(hw, sgt, &sgt_len))
+		return ERR_PTR(-EINVAL);
+
+	sg = sgt->sgl;
+
+	md_priv_vf = kzalloc(sizeof(*md_priv_vf), GFP_KERNEL);
+	if (!md_priv_vf)
+		return ERR_PTR(-ENOMEM);
+
+	md_priv_vf->lni_priv = lni_priv;
+	md_priv_vf->device = &hw->cdev.pdev->dev;
+	md_priv_vf->md.va = 0;
+	md_priv_vf->md.len = sgt_len;
+	md_priv_vf->md.page_shift = PAGE_SHIFT;
+	md_priv_vf->md.huge_shift = PMD_SHIFT;
+	md_priv_vf->flags = flags & ~(CXI_MAP_FAULT | CXI_MAP_PREFETCH);
+	md_priv_vf->sgt = sgt;
+	md_priv_vf->pages = NULL;
+	md_priv_vf->npages = 0;
+
+	/* Send sgt to the PF to run cxi_map_sgtable there */
+	if (sgt->nents > CXI_ATU_SGT_MAX_ENTRIES) {
+		rc = -E2BIG;
+		cxidev_err(&hw->cdev, "SGT has too many entries: %u\n", sgt->nents);
+		goto free_md_priv;
+	}
+
+	pr_debug("VF map: md:%p lni:%u rgid:%u nents:%u len:0x%lx flags:0x%x\n",
+		 md_priv_vf, lni_priv_vf->lni.id, lni_priv_vf->lni.rgid, sgt->nents, sgt_len,
+		 flags);
+
+	cmd = kvzalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd) {
+		rc = -ENOMEM;
+		goto free_md_priv;
+	}
+
+	cmd->op = CXI_OP_ATU_MAP_SGT;
+	cmd->lni = lni_priv_vf->lni.id;
+	cmd->flags = flags;
+	cmd->nents = sgt->nents;
+
+	pr_debug("Sending SGT with %d entries to PF\n", sgt->nents);
+	for (i = 0; i < sgt->nents; i++) {
+		cmd->sge[i].dma_addr = sg_dma_address(sg);
+		cmd->sge[i].dma_len = sg_dma_len(sg);
+		cmd->sge[i].offset = sg->offset;
+
+		sg = sg_next(sg);
+	}
+
+	rc = cxi_send_msg_to_pf(dev, cmd, sizeof(*cmd), &resp, &resp_len);
+	kvfree(cmd);
+	if (rc)
+		goto free_md_priv;
+
+	/* Set the iova and the lac retrieved from the PF */
+	md_priv_vf->md.iova = resp.md.iova;
+	md_priv_vf->md.lac = resp.md.lac;
+	md_priv_vf->md.id = resp.md.id;
+	pr_debug("VF map resp: md:%d iova:%llx lac:%u resp_len:%zu\n",
+		 md_priv_vf->md.id, md_priv_vf->md.iova,
+		 md_priv_vf->md.lac, resp_len);
+
+	return &md_priv_vf->md;
+
+free_md_priv:
+	kfree(md_priv_vf);
+	return ERR_PTR(rc);
+}
+
+static int cxi_unmap_sgtable_vf(struct cxi_dev *dev,
+				struct cxi_md_priv_vf *md_priv_vf,
+				struct cass_dev *hw, int md_id)
+{
+	struct cxi_atu_unmap_cmd cmd = {
+		.op = CXI_OP_ATU_UNMAP,
+		.id = md_priv_vf->md.id,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		cxidev_err(&hw->cdev, "VF ATU_UNMAP failed md:%d pf_md:%d rc:%d\n",
+			   md_id, md_priv_vf->md.id, rc);
+
+	return rc;
+}
+
+/**
+ * cxi_map_sgtable() - Map an sg table to an IO virtual address space
+ *
+ * @lni: The Logical Network Interface
+ * @sgt: The sg_table object. It is expected to be dma mapped.
+ * @flags: Various options affecting the map
+ *
+ * @return: memory descriptor or error code
+ */
+struct cxi_md *cxi_map_sgtable(struct cxi_lni *lni, struct sg_table *sgt,
+			       u32 flags)
+{
+	int ret;
+	size_t len;
+	struct cxi_md *md;
+	struct cass_ac *cac;
+	struct cxi_md_priv *md_priv;
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct ac_map_opts m_opts = {
+		.page_shift = PAGE_SHIFT,
+		.huge_shift = PMD_SHIFT
+	};
+
+	/* unsupported flags */
+	if (flags & CXI_MAP_ATS)
+		return ERR_PTR(-EINVAL);
+
+	if (!cass_sgtable_is_valid(hw, sgt, &len))
+		return ERR_PTR(-EINVAL);
+
+	if (!cdev->is_physfn)
+		return cxi_map_sgtable_vf(lni, sgt, flags);
+
+	m_opts.va_start = 0;
+	m_opts.flags = flags;
+	m_opts.va_len = len;
+	m_opts.va_end = m_opts.va_len;
+	m_opts.ptg_mode = default_ptg_mode;
+
+	cac = get_matching_ac(lni_priv, &m_opts);
+	if (IS_ERR(cac))
+		return ERR_PTR(PTR_ERR(cac));
+
+	md_priv = kzalloc(sizeof(*md_priv), GFP_KERNEL);
+	if (md_priv == NULL)
+		return ERR_PTR(-ENOMEM);
+	refcount_set(&md_priv->refcount, 1);
+	md = &md_priv->md;
+	md_priv->device = &hw->cdev.pdev->dev;
+
+	/* Get an MD ID, above CXI_MD_NONE */
+	ret = ida_alloc_min(&hw->md_index_table, 1, GFP_KERNEL);
+	if (ret < 0) {
+		cxidev_err(cdev, "ida_alloc_min failed %d\n", ret);
+		goto md_free;
+	}
+	md->id = ret;
+
+	md_priv->sgt = sgt;
+	md_priv->external_sgt_owner = true;
+	md_priv->cac = cac;
+	md_priv->lni_priv = lni_priv;
+
+	cass_init_md(&m_opts, md_priv);
+
+	pr_debug("va:%llx va_len:%lx iova:%0llx iova_base:%llx md:%d ac:%d flags:%x\n",
+		 m_opts.va_start, m_opts.va_len, m_opts.iova, cac->iova_base,
+		 md->id, md_priv->cac->ac.acid, flags);
+
+	ret = cass_nta_mirror_sgt(md_priv, true);
+	if (ret)
+		goto mirror_range_error;
+
+	cass_add_md(lni_priv, &m_opts, md_priv);
+
+	pr_debug("nents:%u len:0x%lx iova:%llx\n", sgt->nents, md->len,
+		 md->iova);
+
+	refcount_inc(&lni_priv->refcount);
+
+	return md;
+
+mirror_range_error:
+	cass_md_iova_free(md_priv);
+	ida_free(&hw->md_index_table, md->id);
+md_free:
+	kfree(md_priv);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(cxi_map_sgtable);
+
+/**
+ * cxi_update_sgtable() - Update the specified address range contained in MD
+ *
+ * @md: Memory Descriptor used in network operations
+ * @sgt: The sg_table object. It is expected to be dma mapped.
+ *
+ * @return: 0 on success or negative error value
+ */
+int cxi_update_sgtable(struct cxi_md *md, struct sg_table *sgt)
+{
+	int ret;
+	size_t len;
+	struct cxi_md_priv *md_priv = container_of(md, struct cxi_md_priv, md);
+	struct cxi_dev *cdev = md_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cass_sgtable_is_valid(hw, sgt, &len))
+		return -EINVAL;
+
+	if (len > md_priv->olen) {
+		pr_debug("Address range not bounded by MD\n");
+		return -EINVAL;
+	}
+
+	md_priv->sgt = sgt;
+	md_priv->external_sgt_owner = true;
+
+	pr_debug("nents:%u len:0x%lx iova:%llx\n", sgt->nents, md->len,
+		 md->iova);
+
+	ret = cass_nta_mirror_sgt(md_priv, md_priv->need_lock);
+	if (ret)
+		return ret;
+
+	md_priv->need_lock = false;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_update_sgtable);
+
+/**
+ * cass_virt_to_pages() - Get page structures for kernel virtual addresses
+ *
+ * @hw: Cassini device for error reporting
+ * @va: Starting virtual address (will be page-aligned)
+ * @npages: Number of pages to get
+ * @pages: Array to store page pointers
+ *
+ * @return: 0 on success, negative error code on failure
+ */
+static int cass_virt_to_pages(struct cass_dev *hw, uintptr_t va, int npages,
+			      struct page **pages)
+{
+	int i;
+	uintptr_t addr = va & PAGE_MASK;
+
+	for (i = 0; i < npages; i++, addr += PAGE_SIZE) {
+		if (is_vmalloc_addr((void *)addr))
+			pages[i] = vmalloc_to_page((void *)addr);
+		else
+			pages[i] = virt_to_page(addr);
+
+		if (!pages[i]) {
+			cxidev_err(&hw->cdev, "Failed to get page for addr 0x%lx\n", addr);
+			return -EFAULT;
+		}
+	}
+
+	return 0;
+}
+
+static struct cxi_md *cxi_map_vf(struct cxi_lni *lni, uintptr_t va, size_t len,
+				 u32 flags, const struct cxi_md_hints *hints)
+{
+	struct cxi_lni_priv_vf *lni_priv_vf = container_of(lni, struct cxi_lni_priv_vf, lni);
+	struct cxi_dev *dev = lni_priv_vf->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_md *md;
+	struct cxi_md_priv_vf *md_priv_vf;
+	/* For now, we do not support hugepages. This will come later when we add the ATS
+	 * for both VF and PF: NETCASSINI-7859.
+	 * In this effort we will reuse code to align pages and to support huge pages too
+	 */
+	const int npages = (PAGE_ALIGN(va + len) - (va & PAGE_MASK)) >> PAGE_SHIFT;
+	struct page **pages;
+	struct sg_table *sgt;
+	int rc;
+
+	if (flags & CXI_MAP_USER_ADDR && !(flags & CXI_MAP_PIN)) {
+		cxidev_err(&hw->cdev, "VF does not support ODP\n");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	if (flags & CXI_MAP_DEVICE) {
+		cxidev_err(&hw->cdev, "TODO: VF does not support device memory\n");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	if (!va) {
+		cxidev_err(&hw->cdev, "NULL virtual address\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
+	if (!pages) {
+		rc = -ENOMEM;
+		return ERR_PTR(rc);
+	}
+
+	/* Get the pages and pin them if requested */
+	if (flags & CXI_MAP_PIN) {
+		rc = pin_user_pages_fast(va & PAGE_MASK, npages, FOLL_WRITE | FOLL_LONGTERM, pages);
+		if (rc != npages) {
+			cxidev_err(&hw->cdev, "pin_user_pages_fast failed: %d/%d\n", rc, npages);
+			if (rc > 0)
+				unpin_user_pages(pages, rc);
+			rc = rc < 0 ? rc : -EFAULT;
+			goto free_pages;
+		}
+	} else {
+		rc = cass_virt_to_pages(hw, va, npages, pages);
+		if (rc)
+			goto free_pages;
+	}
+
+	/* Now we DMA-map the pages using a scatter-gather table */
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
+		rc = -ENOMEM;
+		goto unpin_pages;
+	}
+
+	rc = sg_alloc_table_from_pages_segment(sgt, pages, npages,
+					       va & ~PAGE_MASK, len,
+					       UINT_MAX, GFP_KERNEL);
+	if (rc)
+		goto free_sgt;
+
+	rc = dma_map_sgtable(&hw->cdev.pdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (rc) {
+		cxidev_err(&hw->cdev, "dma_map_sgtable failed\n");
+		goto free_sgt_table;
+	}
+
+	pr_debug("va:0x%lx len:0x%lx npages:%d nents:%u page_aligned_va:0x%lx page_offset:0x%lx\n",
+		 va, len, npages, sgt->nents, va & PAGE_MASK, va & ~PAGE_MASK);
+
+	md = cxi_map_sgtable_vf(lni, sgt, flags);
+	if (IS_ERR(md)) {
+		rc = PTR_ERR(md);
+		goto unmap_sgt;
+	}
+
+	md_priv_vf = container_of(md, struct cxi_md_priv_vf, md);
+	md_priv_vf->md.va = va;
+	md_priv_vf->sgt = sgt;
+	md_priv_vf->pages = pages;
+	md_priv_vf->npages = npages;
+
+	/* Adjust IOVA to include the within-page offset.
+	 * PF returns page-aligned IOVA, but application needs the actual data address.
+	 */
+	md_priv_vf->md.iova += (va & ~PAGE_MASK);
+	md_priv_vf->md.len = len;
+
+	return md;
+
+unmap_sgt:
+	dma_unmap_sgtable(&hw->cdev.pdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+free_sgt_table:
+	sg_free_table(sgt);
+free_sgt:
+	kfree(sgt);
+unpin_pages:
+	if (flags & CXI_MAP_PIN)
+		unpin_user_pages(pages, npages);
+free_pages:
+	kvfree(pages);
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_map() - Map virtual addresses into IO  address space
+ *
+ * If CXI_MAP_ALLOC_MD is set, just allocate an IOVA and return the MD.
+ *
+ * @lni: the Logical Network Interface
+ * @va: kernel or user virtual address
+ * @len: length of address to map in bytes
+ * @flags: various options affecting the map
+ * @hints: hints used for debugging
+ *
+ * @return: memory descriptor or error code
+ */
+struct cxi_md *cxi_map(struct cxi_lni *lni, uintptr_t va, size_t len,
+		       u32 flags, const struct cxi_md_hints *hints)
+{
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int ret;
+	struct cxi_md_priv *md_priv;
+	struct cxi_md *md;
+	struct ac_map_opts m_opts = {
+		.huge_shift = PMD_SHIFT,
+		.page_shift = PAGE_SHIFT
+	};
+	struct cass_ac *cac;
+	u64 ova = va;
+	size_t olen = len;
+
+	if (!len) {
+		pr_debug("Length is 0\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (flags & CXI_MAP_PIN &&
+	    (flags & CXI_MAP_FAULT || flags & CXI_MAP_PREFETCH)) {
+		pr_debug("Invalid flags combination:0x%x\n", flags);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (hints && (hints->ptg_mode_valid)) {
+		/* Invalid combination. hugepage_test builds two
+		 * level tables.
+		 */
+		if ((hints->ptg_mode == C_ATU_PTG_MODE_SGL) &&
+		    m_opts.hugepage_test) {
+			cxidev_info(cdev, "Hugepage test cannot be used with PTG Mode Single\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		if ((hints->ptg_mode < C_ATU_PTG_MODE_SGL) ||
+		    (hints->ptg_mode > C_ATU_PTG_MODE_DBL_C)) {
+			cxidev_info(cdev, "Invalid PTG_MODE supplied:%d\n",
+				    hints->ptg_mode);
+			return ERR_PTR(-EINVAL);
+		}
+		m_opts.ptg_mode = hints->ptg_mode;
+	} else {
+		m_opts.ptg_mode = default_ptg_mode;
+	}
+
+	if (!cdev->is_physfn)
+		return cxi_map_vf(lni, va, len, flags, hints);
+
+	ret = cass_odp_supported(hw, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+	md_priv = kzalloc(sizeof(*md_priv), GFP_KERNEL);
+	if (md_priv == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	refcount_set(&md_priv->refcount, 1);
+	md = &md_priv->md;
+	md_priv->lni_priv = lni_priv;
+	md_priv->device = &hw->cdev.pdev->dev;
+	m_opts.flags = flags;
+	m_opts.md_priv = md_priv;
+
+	if (flags & CXI_MAP_ATS) {
+		cass_align_start_len(&m_opts, va, len, PAGE_SHIFT);
+	} else if (flags & CXI_MAP_DEVICE) {
+		if (hints) {
+			if (hints->dmabuf_valid) {
+				md_priv->dmabuf_fd = hints->dmabuf_fd;
+				md_priv->dmabuf_offset = hints->dmabuf_offset;
+				md_priv->dmabuf_length = olen;
+			} else {
+				md_priv->dmabuf_fd = INVALID_DMABUF_FD;
+			}
+		}
+
+		ret = cass_is_device_memory(hw, &m_opts, va, len);
+		if (ret)
+			goto md_free;
+
+		cass_align_start_len(&m_opts, va, len, m_opts.page_shift);
+
+		ret = cass_device_get_pages(&m_opts);
+		if (ret)
+			goto md_free;
+
+	} else if (flags & CXI_MAP_USER_ADDR) {
+		int align_shift = m_opts.page_shift;
+
+		m_opts.va_end = va + len;
+		ret = cass_cpu_page_size(hw, &m_opts, current->mm, va, hints,
+					 &align_shift);
+		if (ret)
+			goto md_free;
+
+		cass_align_start_len(&m_opts, va, len, align_shift);
+	} else {
+		/* VA is a kernel address which is expected to be aligned
+		 * to the PAGE_SIZE.
+		 */
+		if (va & ~PAGE_MASK) {
+			cxidev_err(cdev, "va not aligned 0x%lx\n", va);
+			ret = -EINVAL;
+			goto md_free;
+		}
+
+		cass_align_start_len(&m_opts, va, len, m_opts.page_shift);
+	}
+
+	if (m_opts.ptg_mode == C_ATU_PTG_MODE_SGL)
+		m_opts.huge_shift = m_opts.page_shift;
+
+	cac = get_matching_ac(lni_priv, &m_opts);
+	if (IS_ERR(cac)) {
+		cxidev_dbg(cdev, "Failure to get AC:%ld\n", PTR_ERR(cac));
+		ret = PTR_ERR(cac);
+		goto put_device_pages;
+	}
+
+	md_priv->cac = cac;
+
+	/* Get an MD ID, above CXI_MD_NONE */
+	ret = ida_alloc_min(&hw->md_index_table, 1, GFP_KERNEL);
+	if (ret < 0) {
+		cxidev_err(cdev, "ida_alloc_min failed %d\n", ret);
+		goto iova_free;
+	}
+
+	md->id = ret;
+
+	cass_init_md(&m_opts, md_priv);
+
+	pr_debug("ova:%llx olen:%lx va:%llx iova:%0llx iova_base:%llx md:%d ac:%d len:%lx flags:%x\n",
+		 ova, olen, m_opts.va_start, md->iova, cac->iova_base,
+		 md->id, md_priv->cac->ac.acid, md->len, flags);
+
+	if (!(flags & CXI_MAP_ALLOC_MD)) {
+		ret = cass_mirror_range(md_priv, &m_opts);
+		if (ret) {
+			pr_debug("Mirror address range failed:%d\n", ret);
+			goto mirror_range_error;
+		}
+	}
+
+	cass_add_md(lni_priv, &m_opts, md_priv);
+	refcount_inc(&lni_priv->refcount);
+
+	return md;
+
+mirror_range_error:
+	ida_free(&hw->md_index_table, md->id);
+iova_free:
+	cass_md_iova_free(md_priv);
+put_device_pages:
+	if (flags & CXI_MAP_DEVICE)
+		cass_device_put_pages(md_priv);
+md_free:
+	kfree(md_priv);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(cxi_map);
+
+static int cxi_unmap_vf(struct cxi_md *md)
+{
+	struct cxi_md_priv_vf *md_priv_vf = container_of(md, struct cxi_md_priv_vf, md);
+	struct cxi_dev *dev = md_priv_vf->lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	pr_debug("VF md:%d lac:%d va:%llx iova:%llx len:%lx\n",
+		 md->id, md->lac, md->va, md->iova, md->len);
+
+	/* Notify PF to free the MD created from the VF sglist */
+	cxi_unmap_sgtable_vf(dev, md_priv_vf, hw, md->id);
+
+	/* Unmap and free scatter-gather table if we own it */
+	if (md_priv_vf->pages && md_priv_vf->sgt) {
+		dma_unmap_sgtable(md_priv_vf->device, md_priv_vf->sgt, DMA_BIDIRECTIONAL, 0);
+		sg_free_table(md_priv_vf->sgt);
+		kfree(md_priv_vf->sgt);
+	}
+
+	/* Unpin pages if they were pinned, or just free the pages array */
+	if (md_priv_vf->pages) {
+		if (md_priv_vf->flags & CXI_MAP_PIN)
+			unpin_user_pages(md_priv_vf->pages, md_priv_vf->npages);
+		kvfree(md_priv_vf->pages);
+	}
+
+	/* Free the VF MD structure */
+	kfree(md_priv_vf);
+
+	return 0;
+}
+
+/**
+ * cxi_unmap() - Unmap a virtual address
+ *
+ * @md: Memory Descriptor used in network operations
+ */
+int cxi_unmap(struct cxi_md *md)
+{
+	struct cxi_md_priv *md_priv;
+	struct cxi_lni_priv *lni_priv;
+	struct cxi_dev *dev;
+	struct cass_dev *hw;
+
+	if (!md || md->lac >= C_NUM_LACS)
+		return -EINVAL;
+
+	dev = container_of(md, struct cxi_md_priv, md)->lni_priv->dev;
+	if (!dev->is_physfn)
+		return cxi_unmap_vf(md);
+
+	md_priv = container_of(md, struct cxi_md_priv, md);
+	lni_priv = md_priv->lni_priv;
+	dev = lni_priv->dev;
+	hw = container_of(dev, struct cass_dev, cdev);
+
+	/* One reference for CAC allocation, one reference for MD. */
+	if (refcount_read(&md_priv->cac->refcount) < 2)
+		return -EINVAL;
+
+	pr_debug("md:%d ac:%d lac:%d va:%llx iova:%llx len:%lx\n",
+		 md->id, md_priv->cac->ac.acid, md->lac, md->va, md->iova,
+		 md->len);
+
+	cass_remove_md(md_priv);
+	cass_md_iova_free(md_priv);
+	ida_free(&hw->md_index_table, md->id);
+
+	cxidev_WARN_ONCE(dev, !refcount_dec_and_test(&md_priv->refcount),
+			 "Resource leaks - MD refcount not zero: %d\n",
+			 refcount_read(&md_priv->refcount));
+
+	cass_dma_unmap_pages(md_priv);
+	kfree(md_priv);
+
+	refcount_dec(&lni_priv->refcount);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_unmap);
+
+/**
+ * cxi_update_md() - Update the specified address range contained in MD
+ *
+ * @md: Memory Descriptor used in network operations
+ * @va: User virtual address
+ * @len: Length of address to fault in bytes
+ * @flags: Currently only supports faulting pages with CXI_MAP_FAULT flag
+ *         for an ODP MD.
+ *
+ * @return: 0 on success or negative error value
+ */
+int cxi_update_md(struct cxi_md *md, uintptr_t va, size_t len, u32 flags)
+{
+	int ret;
+	struct cxi_md_priv *md_priv;
+	struct cass_dev *hw;
+	int align_shift;
+	struct ac_map_opts m_opts = {};
+
+	if (!md || md->lac >= C_NUM_LACS)
+		return -EINVAL;
+
+	if (va < md->va || len > ULONG_MAX - va ||
+	    va - md->va > md->len || len > md->len - (va - md->va)) {
+		pr_debug("Address range not bounded by MD\n");
+		return -EINVAL;
+	}
+
+	/* Just support CXI_MAP_FAULT for now */
+	if (!(flags & CXI_MAP_FAULT)) {
+		pr_debug("Only CXI_MAP_FAULT is supported\n");
+		return -EINVAL;
+	}
+
+	md_priv = container_of(md, struct cxi_md_priv, md);
+	hw = container_of(md_priv->lni_priv->dev, struct cass_dev, cdev);
+
+	if (md_priv->flags & CXI_MAP_PIN) {
+		pr_debug("Must be ODP MD\n");
+		return -EINVAL;
+	}
+
+	m_opts.va_end = va + len;
+	m_opts.md_priv = md_priv;
+	m_opts.page_shift = md->page_shift;
+	m_opts.huge_shift = md->huge_shift;
+	/* Use the permissions from the MD */
+	m_opts.flags = md_priv->flags & (CXI_MAP_READ | CXI_MAP_WRITE);
+	m_opts.flags |= flags;
+	align_shift = m_opts.page_shift;
+
+	ret = cass_cpu_page_size(hw, &m_opts, current->mm, va, NULL,
+				 &align_shift);
+	if (ret)
+		return ret;
+
+	/* We only support VMAs that match the MD's hugepage size. */
+	if (m_opts.huge_shift != md->huge_shift) {
+		pr_debug("Error: VMA huge_shift (%d) must match MD (%d)\n",
+			 m_opts.huge_shift, md->huge_shift);
+		return -EINVAL;
+	}
+
+	cass_align_start_len(&m_opts, va, len, align_shift);
+	m_opts.iova = md->iova + (m_opts.va_start - md->va);
+
+	pr_debug("md:%d ac:%d md.va:%llx va:%llx iova:%llx len:%lx flags:%x\n",
+		 md->id, md_priv->cac->ac.acid, md->va, m_opts.va_start,
+		 m_opts.iova, m_opts.va_len, m_opts.flags);
+
+	ret = cass_mirror_odp(&m_opts, md_priv->cac,
+			      m_opts.va_len >> m_opts.page_shift,
+			      m_opts.va_start);
+
+	return ret;
+}
+EXPORT_SYMBOL(cxi_update_md);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_cq.c b/drivers/net/ethernet/hpe/ss1/cass_cq.c
new file mode 100644
index 000000000000..fb8523590bc5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_cq.c
@@ -0,0 +1,1243 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Create and destroy Cassini command queues */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include "cass_core.h"
+#include "cxi_internal.h"
+#include "cass_ss1_debugfs.h"
+#include "cxi_vf_cmd.h"
+
+#ifdef CONFIG_ARM64
+/* Provide a workaround for avoiding writecombine on platforms where it is broken
+ * and for which the Linux kernel does not already provide a workaround, such as the
+ * Ampere Altra, used in the RL300.
+ */
+DEFINE_STATIC_KEY_FALSE(avoid_writecombine);
+#endif
+
+/* Lower bound for number of 64 byte commands. */
+#define MIN_CQ_COUNT (PAGE_SIZE / C_CQ_CMD_SIZE)
+
+void cass_cq_init(struct cass_dev *hw)
+{
+	static const union c_cq_cfg_cq_policy cq_policy = {
+		.policy[CXI_CQ_UPDATE_ALWAYS] = {
+			.shift = 0,
+		},
+		.policy[CXI_CQ_UPDATE_HIGH_FREQ_EMPTY] = {
+			.shift = 4,
+			.empty = 1,
+		},
+		.policy[CXI_CQ_UPDATE_LOW_FREQ_EMPTY] = {
+			.shift = 8,
+			.empty = 1,
+		},
+		.policy[CXI_CQ_UPDATE_LOW_FREQ] = {
+			.shift = 8,
+		},
+	};
+	union c_cq_cfg_tg_thresh tg_thresh = {
+		.tg[0].thresh = tg_threshold[0],
+		.tg[1].thresh = tg_threshold[1],
+		.tg[2].thresh = tg_threshold[2],
+		.tg[3].thresh = tg_threshold[3],
+	};
+
+	/* Initialize CQ policies. */
+	cass_write(hw, C_CQ_CFG_CQ_POLICY, &cq_policy, sizeof(cq_policy));
+
+	/* LPE append credits */
+	cass_write(hw, C_CQ_CFG_TG_THRESH, &tg_thresh, sizeof(tg_thresh));
+
+	/* Zero FQ allocation settings. */
+	cass_clear(hw, C_CQ_CFG_FQ_RESRV(0), C_CQ_CFG_FQ_RESRV_SIZE);
+
+#ifdef CONFIG_ARM64
+	if (pci_get_device(PCI_VENDOR_ID_AMPERE, 0xe100, NULL))
+		static_branch_enable(&avoid_writecombine);
+#endif
+}
+
+static phys_addr_t
+cq_mmio_phys_addr(const struct cass_dev *hw, int cq_id)
+{
+	return hw->regs_base + C_CQ_LAUNCH_TXQ_BASE +
+		C_CQ_LAUNCH_PAGE_SIZE * cq_id;
+}
+
+/* Write TX CQ configuration to hardware */
+static int setup_hw_tx_cq(struct cass_dev *hw, unsigned int cq_n,
+			  const struct cxi_cq_alloc_opts *opts,
+			  struct cxi_lni_priv *lni_priv,
+			  struct cxi_cq_priv *cq,
+			  struct cxi_eq_priv *eq,
+			  struct cxi_cp_priv *cp_priv)
+{
+	size_t cmds_count = cq->cmds_len / C_CQ_CMD_SIZE;
+	union c_cq_txq_tc_table tc = {
+		.mem_q_eth = !!(opts->flags & CXI_CQ_TX_ETHERNET),
+		.mem_q_trig = !!(opts->flags & CXI_CQ_TX_WITH_TRIG_CMDS),
+	};
+	union c_cq_txq_base_table txq_cfg = {
+		.mem_q_eq = eq ? eq->eq.eqn : C_EQ_NONE,
+		.mem_q_base = cq->cmds_dma_addr >> C_ADDR_SHIFT,
+		.mem_q_max_ptr = cmds_count - 1,
+		.mem_q_rgid = lni_priv->lni.rgid,
+		.mem_q_stat_cnt_pool = opts->stat_cnt_pool,
+		.mem_q_lcid = opts->lcid,
+		.mem_q_acid = lni_priv->phys_ac,
+		.mem_q_policy = opts->policy,
+	};
+	union c_cq_cfg_init_txq_hw_state txq_init;
+	union c_cq_cfg_cp_fl_table flow_cfg;
+	void __iomem *csr;
+	int rc;
+
+	/* Transmit CQ needs to be configured with the same PFQ and TC
+	 * values the corresponding communication profile is using.
+	 */
+	cass_read(hw, C_CQ_CFG_CP_FL_TABLE(cp_priv->cass_cp->id),
+		  &flow_cfg, sizeof(flow_cfg));
+
+	tc.mem_q_tc = flow_cfg.tc;
+	txq_cfg.mem_q_pfq = flow_cfg.pfq;
+
+	if (opts->flags & CXI_CQ_TX_WITH_TRIG_CMDS)
+		txq_cfg.mem_q_pfq = cxi_rgroup_tle_pool_id(lni_priv->rgroup);
+
+	spin_lock(&hw->cq_shadow_lock);
+	cass_tx_cq_init(hw, &cq->cass_cq, cq_n, &tc, &txq_cfg);
+	spin_unlock(&hw->cq_shadow_lock);
+
+	mutex_lock(&hw->cq_init_lock);
+	cass_read(hw, C_CQ_CFG_INIT_TXQ_HW_STATE, &txq_init,
+		  sizeof(txq_init));
+
+	cxidev_WARN_ONCE(&hw->cdev, txq_init.pending == 1,
+			 "TXQ init pending CSR should not be set");
+	if (txq_init.pending == 1) {
+		mutex_unlock(&hw->cq_init_lock);
+		return -EIO;
+	}
+
+	txq_init.cq_handle = cq_n;
+
+	cass_write(hw, C_CQ_CFG_INIT_TXQ_HW_STATE, &txq_init,
+		   sizeof(txq_init));
+
+	csr = cass_csr(hw, C_CQ_CFG_INIT_TXQ_HW_STATE);
+	rc = readq_poll_timeout(csr, txq_init.qw, txq_init.pending == 0,
+				1, 1000);
+
+	cxidev_WARN_ONCE(&hw->cdev, rc, "Timeout waiting for TXQ init");
+	if (rc) {
+		mutex_unlock(&hw->cq_init_lock);
+		return -EIO;
+	}
+	mutex_unlock(&hw->cq_init_lock);
+
+	cass_tx_cq_enable(hw, cq_n);
+
+	return 0;
+}
+
+/* Write TGT CQ configuration to hardware */
+#define MEM_Q_TC_REG_SIZE BIT(3)
+static int setup_hw_tgt_cq(struct cass_dev *hw, unsigned int cq_n,
+			   const struct cxi_cq_alloc_opts *opts,
+			   struct cxi_lni_priv *lni_priv,
+			   struct cxi_cq_priv *cq,
+			   struct cxi_eq_priv *eq)
+{
+	size_t cmds_count = cq->cmds_len / C_CQ_CMD_SIZE;
+	// TODO: Handle TGT TC
+	const union c_cq_tgq_table tgt_cfg = {
+		.mem_q_eq = eq ? eq->eq.eqn : C_EQ_NONE,
+		.mem_q_base = cq->cmds_dma_addr >> C_ADDR_SHIFT,
+		.mem_q_max_ptr = cmds_count - 1,
+		.mem_q_rgid = lni_priv->lni.rgid,
+		.mem_q_stat_cnt_pool = opts->stat_cnt_pool,
+		.mem_q_tc_reg = cq_n % MEM_Q_TC_REG_SIZE,
+		.mem_q_acid = lni_priv->phys_ac,
+		.mem_q_policy = opts->policy,
+	};
+	union c_cq_cfg_init_tgq_hw_state tgq_init;
+	union c_cq_cfg_thresh_map thresh_map = {
+		.thresh_id = opts->lpe_cdt_thresh_id,
+	};
+	void __iomem *csr;
+	int rc;
+
+	spin_lock(&hw->cq_shadow_lock);
+	cass_tgt_cq_init(hw, &cq->cass_cq, cq_n, &tgt_cfg);
+	spin_unlock(&hw->cq_shadow_lock);
+
+	mutex_lock(&hw->cq_init_lock);
+	cass_read(hw, C_CQ_CFG_INIT_TGQ_HW_STATE, &tgq_init,
+		  sizeof(tgq_init));
+
+	cxidev_WARN_ONCE(&hw->cdev, tgq_init.pending == 1,
+			 "TGQ init pending CSR should not be set");
+	if (tgq_init.pending == 1) {
+		mutex_unlock(&hw->cq_init_lock);
+		return -EIO;
+	}
+
+	cass_write(hw, C_CQ_CFG_THRESH_MAP(cq_n),
+		   &thresh_map, sizeof(thresh_map));
+
+	tgq_init.cq_handle = cq_n;
+	cass_write(hw, C_CQ_CFG_INIT_TGQ_HW_STATE, &tgq_init,
+		   sizeof(tgq_init));
+
+	/* TODO: Check delay and timeouts are correct for real NIC. */
+	csr = cass_csr(hw, C_CQ_CFG_INIT_TGQ_HW_STATE);
+	rc = readq_poll_timeout(csr, tgq_init.qw, tgq_init.pending == 0,
+				1, 1000);
+
+	cxidev_WARN_ONCE(&hw->cdev, rc, "Timeout waiting for TGQ init");
+	if (rc) {
+		mutex_unlock(&hw->cq_init_lock);
+		return -EIO;
+	}
+	mutex_unlock(&hw->cq_init_lock);
+
+	cass_tgt_cq_enable(hw, cq_n);
+
+	return 0;
+}
+
+/* Return an available CQ with an ID */
+static struct cxi_cq_priv *pf_get_cq_id(struct cxi_lni_priv *lni_priv,
+					const struct cxi_cq_alloc_opts *opts)
+{
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw =
+		container_of(dev, struct cass_dev, cdev);
+	struct cxi_cq_priv *cq;
+	enum cxi_resource_type rsrc_type;
+	int rc;
+
+	cq = kzalloc(sizeof(struct cxi_cq_priv), GFP_KERNEL);
+	if (cq == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	/* Check the associated service to see if this CQ can be allocated */
+	if (opts->flags & CXI_CQ_IS_TX)
+		rsrc_type = CXI_RESOURCE_TXQ;
+	else
+		rsrc_type = CXI_RESOURCE_TGQ;
+
+	rc = cxi_rgroup_alloc_resource(lni_priv->rgroup, rsrc_type);
+	if (rc) {
+		/* Attempt to cleanup all CQs on this LNI to return service
+		 * credits and then reattempt to allocate resource.
+		 */
+		finalize_cq_cleanups(lni_priv, false);
+
+		rc = cxi_rgroup_alloc_resource(lni_priv->rgroup, rsrc_type);
+		if (rc)
+			goto cq_free;
+	}
+
+	if (opts->flags & CXI_CQ_IS_TX)
+		rc = ida_alloc_range(&hw->cq_table, 0, C_NUM_TRANSMIT_CQS - 1, GFP_KERNEL);
+	else
+		rc = ida_alloc_range(&hw->cq_table, C_NUM_TRANSMIT_CQS,
+				     C_NUM_TRANSMIT_CQS + C_NUM_TARGET_CQS - 1,
+				     GFP_KERNEL);
+
+	if (rc < 0) {
+		/* Out of CQs. Accelerate possible CQ cleanup. */
+		lni_cleanups(hw, false);
+
+		if (opts->flags & CXI_CQ_IS_TX)
+			rc = ida_alloc_range(&hw->cq_table, 0,
+					     C_NUM_TRANSMIT_CQS - 1, GFP_KERNEL);
+		else
+			rc = ida_alloc_range(&hw->cq_table, C_NUM_TRANSMIT_CQS,
+					     C_NUM_TRANSMIT_CQS + C_NUM_TARGET_CQS - 1,
+					     GFP_KERNEL);
+	}
+
+	if (rc < 0)
+		goto dec_rsrc_use;
+
+	cq->cass_cq.idx = rc;
+
+	return cq;
+
+dec_rsrc_use:
+	cxi_rgroup_free_resource(lni_priv->rgroup, rsrc_type);
+
+cq_free:
+	kfree(cq);
+
+	return ERR_PTR(rc);
+}
+
+static void put_cq_id(struct cxi_cq_priv *cq)
+{
+	struct cxi_lni_priv *lni_priv = cq->lni_priv;
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	ida_free(&hw->cq_table, cq->cass_cq.idx);
+	if (cq->flags & CXI_CQ_IS_TX)
+		cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_TXQ);
+	else
+		cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_TGQ);
+	kfree(cq);
+}
+
+/**
+ * cxi_cq_free_vf() - Free the communication profile for VF
+ *
+ * @cmdq: Command queue to be freed
+ */
+static void cxi_cq_free_vf(struct cxi_cq *cmdq)
+{
+	struct cxi_cq_priv_vf *cq_priv_vf =
+		container_of(cmdq, struct cxi_cq_priv_vf, cass_cq);
+	struct cxi_dev *dev = cq_priv_vf->lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	const struct cxi_cq_free_cmd cmd = {
+		.op = CXI_OP_CQ_FREE,
+		.cq = cq_priv_vf->cass_cq.idx,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return;
+
+	if (cq_priv_vf->cq_mmio)
+		iounmap(cq_priv_vf->cq_mmio);
+
+	dma_unmap_page(&hw->cdev.pdev->dev, cq_priv_vf->cmds_dma_addr,
+		       cq_priv_vf->cmds_len, DMA_BIDIRECTIONAL);
+
+	if (cq_priv_vf->cmds_pages) {
+		__free_pages(cq_priv_vf->cmds_pages, cq_priv_vf->cmds_order);
+	} else {
+		if (cq_priv_vf->md_priv) {
+			cass_device_put_pages(cq_priv_vf->md_priv);
+			kfree(cq_priv_vf->md_priv);
+		}
+
+		if (cq_priv_vf->pages) {
+			unpin_user_pages(cq_priv_vf->pages, cq_priv_vf->cmds_len >> PAGE_SHIFT);
+			kfree(cq_priv_vf->pages);
+		}
+	}
+
+	kfree(cq_priv_vf);
+}
+
+/**
+ * get_dma_addr_if_contig() - Check for contiguous pages of user buffer,
+ *                            pin and return dma_addr.
+ *
+ * If pages are contiguous, pin the pages and return the dma_addr of the base.
+ * Otherwise, return negative errno.
+ *
+ * @hw: The cassini device
+ * @addr: address of page aligned buffer
+ * @len: page aligned length of buffer - must not be 0
+ * @dir: dma map direction
+ * @pages: ptr to list of pages returned
+ * @dma_addr: dma_addr of user buffer
+ *
+ * @return: 0 on success, negative error value
+ */
+int get_dma_addr_if_contig(struct cass_dev *hw, void *addr, size_t len,
+			   enum dma_data_direction dir, struct page ***pages,
+			   dma_addr_t *dma_addr)
+{
+	int i;
+	int rc;
+	int npinned;
+	dma_addr_t pa;
+	size_t npg = len >> PAGE_SHIFT;
+
+	*pages = kmalloc_array(npg, sizeof(struct page *), GFP_KERNEL);
+	if (!*pages)
+		return -ENOMEM;
+
+	npinned = pin_user_pages_fast((u64)addr, npg,
+				      FOLL_WRITE | FOLL_LONGTERM, *pages);
+	if (npinned < 0) {
+		rc = npinned;
+		goto free_pages;
+	}
+
+	if (npinned != npg) {
+		rc = -EFAULT;
+		goto put_pages;
+	}
+
+	/* Naively check that each page is in sequence. */
+	pa = page_to_phys((*pages)[0]);
+	for (i = 1; i < npg; i++) {
+		pa += PAGE_SIZE;
+		if (pa != page_to_phys((*pages)[i])) {
+			cxidev_dbg(&hw->cdev,
+				   "Buffer supplied is required to be contiguous\n");
+			rc = -EINVAL;
+			goto put_pages;
+		}
+	}
+
+	*dma_addr = dma_map_page(&hw->cdev.pdev->dev, (*pages)[0], 0, len, dir);
+	if (dma_mapping_error(&hw->cdev.pdev->dev, *dma_addr)) {
+		rc = -ENOMEM;
+		goto put_pages;
+	}
+
+	return 0;
+
+put_pages:
+	unpin_user_pages(*pages, npinned);
+
+free_pages:
+	kfree(*pages);
+
+	return rc;
+}
+
+static struct cxi_md_priv *get_device_addr(struct cxi_lni_priv *lni_priv,
+					   uintptr_t va, size_t len,
+					   int dmabuf_fd,
+					   unsigned long dmabuf_offset,
+					   dma_addr_t *dma_addr)
+{
+	int i;
+	int rc;
+	struct scatterlist *sg;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_md_priv *md_priv;
+	struct ac_map_opts m_opts = {
+		.huge_shift = PMD_SHIFT,
+		.page_shift = PAGE_SHIFT
+	};
+	u32 flags = CXI_MAP_DEVICE;
+	dma_addr_t next_addr = 0;
+
+	if (!len) {
+		pr_debug("Length is 0\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	md_priv = kzalloc(sizeof(*md_priv), GFP_KERNEL);
+	if (!md_priv)
+		return ERR_PTR(-ENOMEM);
+
+	refcount_set(&md_priv->refcount, 1);
+	md_priv->lni_priv = lni_priv;
+	md_priv->device = &hw->cdev.pdev->dev;
+	md_priv->dmabuf_fd = dmabuf_fd;
+	md_priv->dmabuf_offset = dmabuf_offset;
+	md_priv->dmabuf_length = len;
+	m_opts.flags = flags;
+	m_opts.md_priv = md_priv;
+
+	rc = cass_is_device_memory(hw, &m_opts, va, len);
+	if (rc)
+		goto md_free;
+
+	cass_align_start_len(&m_opts, va, len, m_opts.page_shift);
+
+	rc = cass_device_get_pages(&m_opts);
+	if (rc) {
+		cxidev_dbg(&hw->cdev,
+			   "cass_device_get_pages failed rc:%d\n", rc);
+		goto md_free;
+	}
+
+	/* AMD p2p pages are not guaranteed to be contiguous. */
+	for_each_sgtable_dma_sg(md_priv->sgt, sg, i) {
+		long len = sg_dma_len(sg);
+		dma_addr_t dma_addr = sg_dma_address(sg);
+
+		if (dma_addr != PAGE_ALIGN(dma_addr)) {
+			cxidev_dbg(&hw->cdev,
+				   "Buffer supplied is required to be page aligned\n");
+			rc = -EINVAL;
+			goto put_pages;
+		}
+
+		if (!next_addr) {
+			next_addr = dma_addr + len;
+			continue;
+		}
+
+		if (dma_addr != next_addr) {
+			cxidev_dbg(&hw->cdev,
+				   "Buffer supplied is required to be contiguous\n");
+			rc = -EINVAL;
+			goto put_pages;
+		}
+
+		next_addr = dma_addr + len;
+	}
+
+	md_priv->olen = m_opts.va_len;
+	md_priv->flags = m_opts.flags;
+	*dma_addr = sg_dma_address(md_priv->sgt->sgl);
+
+	return md_priv;
+
+put_pages:
+	cass_device_put_pages(md_priv);
+
+md_free:
+	kfree(md_priv);
+
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_cq_alloc_buf_vf() - Allocate a new command queue for VF
+ *
+ * The new CQ is attached to attached to the NI.
+ *
+ * @lni: LNI to associate with the command queue.
+ * @evtq: Event Queue to associate with the command queue, for error
+ *        reporting. May be NULL.
+ * @opts_b: Options affecting the CQ.
+ * @numa_node: NUMA node ID CQ memory should be allocated from.
+ *
+ * @return: the command queue or an error pointer
+ */
+static struct cxi_cq *cxi_cq_alloc_buf_vf(struct cxi_lni *lni, struct cxi_eq *evtq,
+					  const struct cxi_cq_alloc_opts_buf *opts_b,
+					  int numa_node)
+{
+	struct cxi_lni_priv_vf *lni_priv_vf =
+		container_of(lni, struct cxi_lni_priv_vf, lni);
+	struct cxi_dev *cdev = lni_priv_vf->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const struct cxi_cq_alloc_opts *opts = &opts_b->opts;
+	struct cxi_cq_priv_vf *cq;
+	struct cxi_cq_alloc_buf_cmd_vf cmd = {
+		.base.op = CXI_OP_CQ_ALLOC_BUF,
+		.base.lni = lni_priv_vf->lni.id,
+		.base.eq = evtq ? evtq->eqn : C_EQ_NONE,
+		.base.opts = *opts_b,
+	};
+	struct cxi_cq_alloc_resp resp;
+	size_t resp_len = sizeof(resp);
+	bool is_user = opts->flags & CXI_CQ_USER;
+	struct page *cmds_pages;
+	size_t cmds_count;
+	size_t cmds_order;
+	size_t cmds_len;
+	int rc;
+
+	/* Use provided commands count to calculate commands length. Then, use
+	 * commands length to recalculate commands count to consume entire
+	 * buffer space.
+	 */
+	cmds_count = max_t(size_t, MIN_CQ_COUNT, opts->count);
+	cmds_order = get_order(cmds_count * C_CQ_CMD_SIZE);
+	cmds_len = (1 << cmds_order) * PAGE_SIZE;
+	cmds_count = cmds_len / C_CQ_CMD_SIZE;
+
+	if (cmds_count > CXI_MAX_CQ_COUNT) {
+		cxidev_dbg(cdev, "cmds_count:%ld is > CXI_MAX_CQ_COUNT:%d\n",
+			   cmds_count, CXI_MAX_CQ_COUNT);
+		return ERR_PTR(-E2BIG);
+	}
+
+	cq = kzalloc(sizeof(*cq), GFP_KERNEL);
+	if (!cq)
+		return ERR_PTR(-ENOMEM);
+
+	if (opts_b->buf) {
+		if (!IS_ALIGNED((u64)opts_b->buf, PAGE_SIZE)) {
+			cxidev_dbg(cdev, "buffer %llx not aligned to PAGE_SIZE\n",
+				   (u64)opts_b->buf);
+			rc = -EINVAL;
+			goto free_cq;
+		}
+
+		if (opts_b->is_host_mem) {
+			rc = get_dma_addr_if_contig(hw, opts_b->buf, cmds_len,
+						    DMA_BIDIRECTIONAL,
+						    &cq->pages,
+						    &cq->cmds_dma_addr);
+			if (rc)
+				goto free_cq;
+		} else {
+			cq->md_priv = get_device_addr(container_of(lni, struct cxi_lni_priv, lni),
+						      (uintptr_t)opts_b->buf,
+						      cmds_len,
+						      opts_b->dmabuf_fd,
+						      opts_b->dmabuf_offset,
+						      &cq->cmds_dma_addr);
+			if (IS_ERR(cq->md_priv)) {
+				rc = PTR_ERR(cq->md_priv);
+				goto free_cq;
+			}
+		}
+		cq->cmds = NULL;
+	} else {
+		cmds_pages = alloc_pages_node(numa_node, GFP_KERNEL | __GFP_ZERO,
+					      cmds_order);
+		if (!cmds_pages) {
+			rc = -ENOMEM;
+			goto free_cq;
+		}
+
+		cq->cmds_order = cmds_order;
+		cq->cmds = page_address(cmds_pages);
+		cq->cmds_pages = cmds_pages;
+		cq->cmds_dma_addr = dma_map_page(&hw->cdev.pdev->dev,
+						 cmds_pages, 0, cmds_len,
+						 DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(&hw->cdev.pdev->dev, cq->cmds_dma_addr)) {
+			rc = -ENOMEM;
+			goto free_pages;
+		}
+	}
+
+	cq->cmds_len = cmds_len;
+	cmd.dma_addr = cq->cmds_dma_addr;
+	cmd.cmds_len = cmds_len;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		goto cq_release;
+
+	if (!is_user) {
+		phys_addr_t mmio_phys = cq_mmio_phys_addr(hw, resp.cq);
+#ifdef CONFIG_ARM64
+		if (static_branch_unlikely(&avoid_writecombine))
+			cq->cq_mmio = ioremap(mmio_phys, PAGE_SIZE);
+		else
+#endif
+		cq->cq_mmio = ioremap_wc(mmio_phys, PAGE_SIZE);
+		if (!cq->cq_mmio) {
+			cxidev_warn_once(cdev, "ioremap_wc failed\n");
+			rc = -EFAULT;
+			goto cq_release;
+		}
+	}
+
+	/* Initialize client interface structure */
+	cxi_cq_init(&cq->cass_cq,
+		    cq->cmds,
+		    cmds_count,
+		    (__force void *)cq->cq_mmio,
+		    resp.cq);
+
+	cq->lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	cq->flags = opts->flags;
+	cq->cass_cq.size = resp.count;
+	cq->cass_cq.idx = resp.cq;
+
+	return &cq->cass_cq;
+
+cq_release:
+	dma_unmap_page(&hw->cdev.pdev->dev, cq->cmds_dma_addr,
+		       cq->cmds_len, DMA_BIDIRECTIONAL);
+
+	if (cq->pages) {
+		unpin_user_pages(cq->pages, cq->cmds_len >> PAGE_SHIFT);
+		kfree(cq->pages);
+	}
+free_pages:
+	if (cq->cmds_pages)
+		__free_pages(cq->cmds_pages, cmds_order);
+free_cq:
+	kfree(cq);
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_cq_alloc_buf_internal() - Allocate a new command queue
+ *
+ * The new CQ is attached to the LNI.
+ * The CQ buffer may be supplied by the user. It must be physically
+ * contiguous.
+ *
+ * @lni: LNI to associate with the command queue.
+ * @evtq: Event Queue to associate with the command queue, for error
+ *        reporting. May be NULL.
+ * @opts_b: Options affecting the CQ.
+ * @numa_node: NUMA node ID CQ memory should be allocated from.
+ * @cmds_dma_addr: Pre-allocated DMA address (0 to allocate new)
+ * @cmds_len: Length of pre-allocated memory (0 to allocate new)
+ *
+ * @return: the command queue or an error pointer
+ */
+struct cxi_cq *cxi_cq_alloc_buf_internal(struct cxi_lni *lni, struct cxi_eq *evtq,
+					 const struct cxi_cq_alloc_opts_buf *opts_b,
+					 int numa_node, dma_addr_t cmds_dma_addr,
+					 size_t cmds_len)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const struct cxi_cq_alloc_opts *opts = &opts_b->opts;
+	struct cxi_eq_priv *eq;
+	struct cxi_cq_priv *cq;
+	int cq_idx;
+	int cq_n;
+	int rc;
+	size_t cmds_count;
+	size_t cmds_order;
+	struct page *cmds_pages;
+	struct cxi_cp_priv *cp_priv = NULL;
+	bool is_user = opts->flags & CXI_CQ_USER;
+
+	if (opts->policy < 0 || opts->policy > CXI_CQ_UPDATE_LOW_FREQ)
+		return ERR_PTR(-EINVAL);
+
+	if (!(opts->flags & CXI_CQ_IS_TX) && opts->lpe_cdt_thresh_id > 3)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Use provided commands count to calculate commands length. Then, use
+	 * commands length to recalculate commands count to consume entire
+	 * buffer space.
+	 */
+	cmds_count = max_t(size_t, MIN_CQ_COUNT, opts->count);
+	cmds_order = get_order(cmds_count * C_CQ_CMD_SIZE);
+	cmds_len = (1 << cmds_order) * PAGE_SIZE;
+	cmds_count = cmds_len / C_CQ_CMD_SIZE;
+
+	if (cmds_count > CXI_MAX_CQ_COUNT) {
+		cxidev_dbg(cdev, "cmds_count:%ld is > CXI_MAX_CQ_COUNT:%d\n",
+			   cmds_count, CXI_MAX_CQ_COUNT);
+		return ERR_PTR(-E2BIG);
+	}
+
+	/* At least one communication profile is needed for a transmit
+	 * CQ.
+	 */
+	if (opts->flags & CXI_CQ_IS_TX) {
+		/* For triggered CQs, only LCID zero can be used. */
+		if ((opts->flags & CXI_CQ_TX_WITH_TRIG_CMDS) && opts->lcid != 0)
+			return ERR_PTR(-EINVAL);
+
+		cp_priv = cass_cp_find(hw, lni_priv->lni.rgid, opts->lcid);
+		if (!cp_priv)
+			return ERR_PTR(-EINVAL);
+	}
+
+	/* Only privileged client can use the C_CMD_ETHERNET_TX command. */
+	if ((opts->flags & CXI_CQ_TX_ETHERNET) && !capable(CAP_NET_RAW))
+		return ERR_PTR(-EPERM);
+
+	cq = pf_get_cq_id(lni_priv, opts);
+	if (IS_ERR(cq))
+		return ERR_PTR(PTR_ERR(cq));
+
+	cq_idx = cq->cass_cq.idx;
+
+	if (evtq)
+		eq = container_of(evtq, struct cxi_eq_priv, eq);
+	else
+		eq = NULL;
+
+	cq->lni_priv = lni_priv;
+	cq->eq = eq;
+	cq->flags = opts->flags;
+	cq->cmds_len = cmds_len;
+
+	if (!lni_priv->is_vf) {
+		/* For physical function, we use user buffer if provided or we
+		 * allocate a new one
+		 */
+		if (opts_b->buf) {
+			if (!IS_ALIGNED((u64)opts_b->buf, PAGE_SIZE)) {
+				cxidev_dbg(cdev, "buffer %llx not aligned to PAGE_SIZE\n",
+					   (u64)opts_b->buf);
+				rc = -EINVAL;
+				goto put_id;
+			}
+
+			if (opts_b->is_host_mem) {
+				rc = get_dma_addr_if_contig(hw, opts_b->buf, cmds_len,
+							    DMA_BIDIRECTIONAL,
+							&cq->pages,
+							&cq->cmds_dma_addr);
+				if (rc)
+					goto put_id;
+			} else {
+				cq->md_priv = get_device_addr(lni_priv,
+							      (uintptr_t)opts_b->buf,
+							cmds_len,
+							opts_b->dmabuf_fd,
+							opts_b->dmabuf_offset,
+							&cq->cmds_dma_addr);
+				if (IS_ERR(cq->md_priv)) {
+					rc = PTR_ERR(cq->md_priv);
+					goto put_id;
+				}
+			}
+
+			cq->cmds = NULL;
+		} else {
+			/* CQ needs contiguous memory region. */
+			cmds_pages = alloc_pages_node(numa_node, GFP_KERNEL | __GFP_ZERO,
+						      cmds_order);
+			if (!cmds_pages) {
+				rc = -ENOMEM;
+				goto put_id;
+			}
+
+			cq->cmds_order = cmds_order;
+			cq->cmds = page_address(cmds_pages);
+			cq->cmds_pages = cmds_pages;
+			cq->cmds_dma_addr = dma_map_page(&hw->cdev.pdev->dev,
+							 cmds_pages, 0, cq->cmds_len,
+							 DMA_BIDIRECTIONAL);
+			if (dma_mapping_error(&hw->cdev.pdev->dev, cq->cmds_dma_addr)) {
+				rc = -ENOMEM;
+				goto free_pages;
+			}
+		}
+	} else {
+		/* For VF we use the provided dma_addr */
+		if (!cmds_dma_addr) {
+			rc = -EINVAL;
+			goto put_id;
+		}
+
+		cq->cmds_len = cmds_len;
+		cq->cmds_dma_addr = cmds_dma_addr;
+		/* PF doesn't have access to VF's virtual address space.
+		 * VF has already initialized its own cxi_cq structure.
+		 */
+		cq->cmds = NULL;
+	}
+
+	if (!is_user && !lni_priv->is_vf) {
+		phys_addr_t mmio_phys = cq_mmio_phys_addr(hw, cq_idx);
+#ifdef CONFIG_ARM64
+		if (static_branch_unlikely(&avoid_writecombine))
+			cq->cq_mmio = ioremap(mmio_phys, PAGE_SIZE);
+		else
+#endif
+		cq->cq_mmio = ioremap_wc(mmio_phys, PAGE_SIZE);
+		if (!cq->cq_mmio) {
+			cxidev_warn_once(cdev, "ioremap_wc failed\n");
+			rc = -EFAULT;
+			goto cq_release;
+		}
+	}
+
+	/* Initialize client interface structure */
+	cxi_cq_init(&cq->cass_cq, cq->cmds, cmds_count,
+		    (__force void *)cq->cq_mmio, cq_idx);
+
+	cq_n = cxi_cq_get_cqn(&cq->cass_cq);
+	if (opts->flags & CXI_CQ_IS_TX)
+		rc = setup_hw_tx_cq(hw, cq_n, opts, lni_priv, cq, eq, cp_priv);
+	else
+		rc = setup_hw_tgt_cq(hw, cq_n, opts, lni_priv, cq, eq);
+
+	if (rc)
+		goto cq_unmap;
+
+	if (cq->flags & CXI_CQ_IS_TX)
+		atomic_inc(&hw->stats.txq);
+	else
+		atomic_inc(&hw->stats.tgq);
+
+	cq_debugfs_create(cq_idx, cq, hw, lni_priv);
+
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&cq->list, &lni_priv->cq_list);
+	spin_unlock(&lni_priv->res_lock);
+
+	refcount_inc(&lni_priv->refcount);
+	if (eq)
+		refcount_inc(&eq->refcount);
+
+	/* Grant access to the resource from the VF */
+	if (lni_priv->is_vf)
+		cass_config_sriovt(hw, true, lni_priv->vf_num,
+				   (cq->flags & CXI_CQ_IS_TX) ? cq_n :
+								(1024 + cq_n));
+
+	return &cq->cass_cq;
+
+cq_unmap:
+	if (!is_user)
+		iounmap(cq->cq_mmio);
+cq_release:
+	dma_unmap_page(&hw->cdev.pdev->dev, cq->cmds_dma_addr,
+		       cq->cmds_len, DMA_BIDIRECTIONAL);
+
+	if (cq->md_priv) {
+		cass_device_put_pages(cq->md_priv);
+		kfree(cq->md_priv);
+	}
+
+	if (cq->pages) {
+		unpin_user_pages(cq->pages, cq->cmds_len >> PAGE_SHIFT);
+		kfree(cq->pages);
+	}
+
+free_pages:
+	if (cq->cmds_pages)
+		__free_pages(cq->cmds_pages, cmds_order);
+put_id:
+	put_cq_id(cq);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL(cxi_cq_alloc_buf_internal);
+
+/**
+ * cxi_cq_alloc_buf() - Allocate a new command queue
+ *
+ * The new CQ is attached to the LNI.
+ * The CQ buffer may be supplied by the user. It must be physically
+ * contiguous.
+ *
+ * @lni: LNI to associate with the command queue.
+ * @evtq: Event Queue to associate with the command queue, for error
+ *        reporting. May be NULL.
+ * @opts_b: Options affecting the CQ.
+ * @numa_node: NUMA node ID CQ memory should be allocated from.
+ *
+ * @return: the command queue or an error pointer
+ */
+struct cxi_cq *cxi_cq_alloc_buf(struct cxi_lni *lni, struct cxi_eq *evtq,
+				const struct cxi_cq_alloc_opts_buf *opts_b,
+				int numa_node)
+{
+	struct cxi_dev *cdev = container_of(lni, struct cxi_lni_priv, lni)->dev;
+
+	if (!cdev->is_physfn)
+		return cxi_cq_alloc_buf_vf(lni, evtq, opts_b, numa_node);
+
+	return cxi_cq_alloc_buf_internal(lni, evtq, opts_b, numa_node, 0, 0);
+}
+EXPORT_SYMBOL(cxi_cq_alloc_buf);
+
+/**
+ * cxi_cq_alloc() - Allocate a new command queue
+ *
+ * The new CQ is attached to attached to the NI.
+ *
+ * @lni: LNI to associate with the command queue.
+ * @evtq: Event Queue to associate with the command queue, for error
+ *        reporting. May be NULL.
+ * @opts: Options affecting the CQ.
+ * @numa_node: NUMA node ID CQ memory should be allocated from.
+ *
+ * @return: the command queue or an error pointer
+ */
+struct cxi_cq *cxi_cq_alloc(struct cxi_lni *lni, struct cxi_eq *evtq,
+			    const struct cxi_cq_alloc_opts *opts,
+			    int numa_node)
+{
+	struct cxi_cq_alloc_opts_buf opts_b = {};
+
+	opts_b.opts = *opts;
+	return cxi_cq_alloc_buf(lni, evtq, &opts_b, numa_node);
+}
+EXPORT_SYMBOL(cxi_cq_alloc);
+
+/* Test whether a transmit CQ is done working */
+static bool is_txq_done(struct cass_dev *hw, int id)
+{
+	union c_cq_txq_rdptr_table rd_ptr;
+	union c_cq_txq_preptr_table pre_ptr;
+	union c_cq_txq_ack_ctr ack_ctr;
+
+	cass_read(hw, C_CQ_TXQ_ACK_CTR(id), &ack_ctr, sizeof(ack_ctr));
+	if (ack_ctr.mem_q_ack_ctr != 0)
+		return false;
+
+	cass_read(hw, C_CQ_TXQ_RDPTR_TABLE(id), &rd_ptr, sizeof(rd_ptr));
+	cass_read(hw, C_CQ_TXQ_PREPTR_TABLE(id), &pre_ptr, sizeof(pre_ptr));
+
+	if (rd_ptr.mem_q_rd_ptr != pre_ptr.mem_q_pre_ptr)
+		return false;
+
+	return true;
+}
+
+/* Test whether a target CQ is done working */
+static bool is_tgq_done(struct cass_dev *hw, int id)
+{
+	union c_cq_tgq_rdptr_table rd_ptr;
+	union c_cq_tgq_preptr_table pre_ptr;
+	union c_cq_tgq_ack_ctr ack_ctr;
+
+	cass_read(hw, C_CQ_TGQ_ACK_CTR(id), &ack_ctr, sizeof(ack_ctr));
+	if (ack_ctr.mem_q_ack_ctr != 0)
+		return false;
+
+	cass_read(hw, C_CQ_TGQ_RDPTR_TABLE(id), &rd_ptr, sizeof(rd_ptr));
+	cass_read(hw, C_CQ_TGQ_PREPTR_TABLE(id), &pre_ptr, sizeof(pre_ptr));
+	if (rd_ptr.mem_q_rd_ptr != pre_ptr.mem_q_pre_ptr)
+		return false;
+
+	return true;
+}
+
+/**
+ * cxi_cq_free() - Destroy a command queue
+ *
+ * @cmdq: the command queue to release
+ */
+void cxi_cq_free(struct cxi_cq *cmdq)
+{
+	struct cxi_cq_priv *cq = container_of(cmdq, struct cxi_cq_priv, cass_cq);
+	struct cxi_lni_priv *lni_priv = cq->lni_priv;
+	struct cxi_eq_priv *eq = cq->eq;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	unsigned int cq_n = cxi_cq_get_cqn(cmdq);
+	unsigned int mem_q_rd_ptr;
+
+	if (!cdev->is_physfn) {
+		cxi_cq_free_vf(cmdq);
+		return;
+	}
+
+	/* Remove access to this resource from a VF */
+	if (lni_priv->is_vf)
+		cass_config_sriovt(hw, false, lni_priv->vf_num,
+				   (cq->flags & CXI_CQ_IS_TX) ? cq_n :
+								(1024 + cq_n));
+
+	/* CQ invalidation requires disabling and setting the drain bit for the
+	 * CQ. This is done in cass_tx_cq_disable() and cass_tgt_cq_disable().
+	 *
+	 * By the time the read pointer is stable, the buffer is not
+	 * accessed anymore and can be freed.
+	 */
+	if (cq->flags & CXI_CQ_IS_TX) {
+		union c_cq_txq_rdptr_table rd_ptr;
+
+		cass_tx_cq_disable(hw, cq_n);
+
+		cass_read(hw, C_CQ_TXQ_RDPTR_TABLE(cq_n),
+			  &rd_ptr, sizeof(rd_ptr));
+		mem_q_rd_ptr = rd_ptr.mem_q_rd_ptr;
+
+		while (true) {
+			cass_read(hw, C_CQ_TXQ_RDPTR_TABLE(cq_n),
+				  &rd_ptr, sizeof(rd_ptr));
+			if (mem_q_rd_ptr == rd_ptr.mem_q_rd_ptr)
+				break;
+			mem_q_rd_ptr = rd_ptr.mem_q_rd_ptr;
+			udelay(1);
+		}
+	} else {
+		union c_cq_tgq_rdptr_table rd_ptr;
+
+		cass_tgt_cq_disable(hw, cq_n);
+
+		cass_read(hw, C_CQ_TGQ_RDPTR_TABLE(cq_n),
+			  &rd_ptr, sizeof(rd_ptr));
+		mem_q_rd_ptr = rd_ptr.mem_q_rd_ptr;
+		while (true) {
+			cass_read(hw, C_CQ_TGQ_RDPTR_TABLE(cq_n),
+				  &rd_ptr, sizeof(rd_ptr));
+			if (mem_q_rd_ptr == rd_ptr.mem_q_rd_ptr)
+				break;
+			mem_q_rd_ptr = rd_ptr.mem_q_rd_ptr;
+			udelay(1);
+		}
+	}
+
+	if (!lni_priv->is_vf) {
+		if (!(cq->flags & CXI_CQ_USER))
+			iounmap(cq->cq_mmio);
+
+		dma_unmap_page(&hw->cdev.pdev->dev, cq->cmds_dma_addr,
+			       cq->cmds_len, DMA_BIDIRECTIONAL);
+
+		if (cq->cmds_pages) {
+			__free_pages(cq->cmds_pages, cq->cmds_order);
+		} else {
+			if (cq->md_priv) {
+				cass_device_put_pages(cq->md_priv);
+				kfree(cq->md_priv);
+			}
+
+			if (cq->pages) {
+				unpin_user_pages(cq->pages, cq->cmds_len >> PAGE_SHIFT);
+				kfree(cq->pages);
+			}
+		}
+	}
+
+	if (eq)
+		refcount_dec(&eq->refcount);
+
+	spin_lock(&lni_priv->res_lock);
+	list_del(&cq->list);
+	list_add_tail(&cq->list, &lni_priv->cq_cleanups_list);
+	spin_unlock(&lni_priv->res_lock);
+}
+EXPORT_SYMBOL(cxi_cq_free);
+
+/* Go through the list of CQ waiting for cleanup. If the CQ is quiet,
+ * it can be freed, otherwise it stays.
+ *
+ * If force is true, the CQ will be release unconditionally.
+ */
+void finalize_cq_cleanups(struct cxi_lni_priv *lni, bool force)
+{
+	struct cxi_dev *cdev = lni->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_cq_priv *cq;
+	struct cxi_cq_priv *tmp;
+	struct list_head free_list;
+
+	INIT_LIST_HEAD(&free_list);
+
+	spin_lock(&lni->res_lock);
+
+	list_for_each_entry_safe(cq, tmp, &lni->cq_cleanups_list, list) {
+		unsigned int cq_n = cxi_cq_get_cqn(&cq->cass_cq);
+
+		if (!force) {
+			/* Ensure that in-flight commands are done. */
+			if (cq->flags & CXI_CQ_IS_TX) {
+				if (!is_txq_done(hw, cq_n))
+					continue;
+			} else {
+				if (!is_tgq_done(hw, cq_n))
+					continue;
+			}
+		}
+
+		list_del(&cq->list);
+		list_add(&cq->list, &free_list);
+	}
+
+	spin_unlock(&lni->res_lock);
+
+	while ((cq = list_first_entry_or_null(&free_list,
+					      struct cxi_cq_priv, list))) {
+		list_del(&cq->list);
+
+		debugfs_remove(cq->lni_dir);
+		debugfs_remove_recursive(cq->debug_dir);
+
+		refcount_dec(&lni->refcount);
+
+		if (cq->flags & CXI_CQ_IS_TX)
+			atomic_dec(&hw->stats.txq);
+		else
+			atomic_dec(&hw->stats.tgq);
+
+		put_cq_id(cq);
+	}
+}
+
+/**
+ * cxi_cq_user_info() - Get the information to mmap a cq to userspace
+ *
+ * @cmdq: the command queue
+ * @cmds_size: on return, will hold the size of the queue in 64-bytes blocks
+ * @cmds_pages: on return, will hold the pages to mmap
+ * @wp_addr: on return, will hold the CSR to control the CQ
+ * @wp_addr_size: on return, size of the CSR
+ *
+ * @return: 0, or -EINVAL is the CQ isn't for userspace
+ */
+int cxi_cq_user_info(struct cxi_cq *cmdq, size_t *cmds_size,
+		     struct page **cmds_pages, phys_addr_t *wp_addr,
+		     size_t *wp_addr_size)
+{
+	struct cxi_cq_priv *cq = container_of(cmdq, struct cxi_cq_priv, cass_cq);
+	struct cxi_lni_priv *lni_priv = cq->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!(cq->flags & CXI_CQ_USER))
+		return -EINVAL;
+
+	/* userspace will need to know what pages to mmap. */
+	*cmds_size = cq->cmds_len;
+	*cmds_pages = cq->cmds_pages;
+
+	*wp_addr = cq_mmio_phys_addr(hw, cq->cass_cq.idx);
+	*wp_addr_size = PAGE_SIZE;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_cq_user_info);
+
+/**
+ * cxi_cq_ack_counter_vf() - Get the current ack counter for a CQ in VF
+ *
+ * @cmdq: CQ to get current ack counter for.
+ *
+ * Return: Current ack counter value.
+ */
+static unsigned int cxi_cq_ack_counter_vf(struct cxi_cq *cmdq)
+{
+	struct cxi_cq_priv_vf *cq_priv_vf =
+		container_of(cmdq, struct cxi_cq_priv_vf, cass_cq);
+	struct cxi_dev *dev = cq_priv_vf->lni_priv->dev;
+	const struct cxi_cq_ack_counter_cmd cmd = {
+		.op = CXI_OP_CQ_ACK_COUNTER,
+		.cq = cq_priv_vf->cass_cq.idx,
+	};
+	struct cxi_cq_ack_counter_resp resp;
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	return resp.ack_counter;
+}
+
+/**
+ * cxi_cq_ack_counter() - Get the current ack counter for a CQ.
+ *
+ * @cq: CQ to get current ack counter for.
+ *
+ * Return: Current ack counter value.
+ */
+unsigned int cxi_cq_ack_counter(struct cxi_cq *cq)
+{
+	struct cxi_cq_priv *cq_priv =
+		container_of(cq, struct cxi_cq_priv, cass_cq);
+	struct cass_dev *hw =
+		container_of(cq_priv->lni_priv->dev, struct cass_dev, cdev);
+	unsigned int cq_n = cxi_cq_get_cqn(cq);
+	union c_cq_txq_ack_ctr txq_ack_ctr;
+	union c_cq_tgq_ack_ctr tgq_ack_ctr;
+	unsigned int ack_ctr;
+
+	if (!hw->cdev.is_physfn)
+		return cxi_cq_ack_counter_vf(cq);
+
+	if (cq_priv->flags & CXI_CQ_IS_TX) {
+		cass_read(hw, C_CQ_TXQ_ACK_CTR(cq_n), &txq_ack_ctr,
+			  sizeof(txq_ack_ctr));
+		ack_ctr = txq_ack_ctr.mem_q_ack_ctr;
+	} else {
+		cass_read(hw, C_CQ_TGQ_ACK_CTR(cq_n), &tgq_ack_ctr,
+			  sizeof(tgq_ack_ctr));
+		ack_ctr = tgq_ack_ctr.mem_q_ack_ctr;
+	}
+	return ack_ctr;
+}
+EXPORT_SYMBOL(cxi_cq_ack_counter);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_ct.c b/drivers/net/ethernet/hpe/ss1/cass_ct.c
new file mode 100644
index 000000000000..f4d642884671
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ct.c
@@ -0,0 +1,639 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Create and destroy Cassini counting events.
+ * Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP
+ */
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/iopoll.h>
+
+#include "cass_core.h"
+#include "cxi_internal.h"
+#include "cass_ss1_debugfs.h"
+#include "cxi_vf_cmd.h"
+
+/* Initializes (if init is true) or cancel (if init is false) pending
+ * triggered operations on a CT.
+ */
+static int set_hw_state(struct cass_dev *hw, unsigned int ctn,
+			bool init)
+{
+	void __iomem *csr = cass_csr(hw, C_CQ_CFG_INIT_CT_HW_STATE);
+	union c_cq_cfg_init_ct_hw_state ct_hw_state;
+	int rc;
+
+	mutex_lock(&hw->ct_init_lock);
+
+	ct_hw_state.qw = 0;
+	ct_hw_state.ct_handle = ctn;
+	if (init)
+		ct_hw_state.init = 1;
+	else
+		ct_hw_state.cancel = 1;
+	cass_write(hw, C_CQ_CFG_INIT_CT_HW_STATE, &ct_hw_state.qw,
+		   sizeof(ct_hw_state));
+
+	rc = readq_poll_timeout(csr, ct_hw_state.qw,
+				ct_hw_state.pending == 0, 1, 1000000);
+	cxidev_WARN_ONCE(&hw->cdev, rc, "Timeout waiting for CT operation (%d)\n",
+			 init);
+
+	/* Need to zero cancel and init fields so that they can be reused. */
+	memset(&ct_hw_state, 0, sizeof(ct_hw_state));
+	cass_write(hw, C_CQ_CFG_INIT_CT_HW_STATE, &ct_hw_state.qw,
+		   sizeof(ct_hw_state));
+
+	mutex_unlock(&hw->ct_init_lock);
+
+	return rc;
+}
+
+/* Map the wb buffer using DMA address. Pin buffer if from user space. */
+static int ct_wb_map(struct cass_dev *hw, const struct cxi_ct_priv *ct_priv,
+		     struct ct_wb_desc *desc, struct c_ct_writeback *wb)
+{
+	static const struct c_ct_writeback wb_init = {};
+	struct device *device = &hw->cdev.pdev->dev;
+	dma_addr_t dma_addrs;
+	int rc;
+
+	desc->md_priv = NULL;
+	desc->page = NULL;
+
+	if (!ct_priv->is_user) {
+		*wb = wb_init;
+
+		if (is_vmalloc_addr(wb)) {
+			desc->wb_dma_addr = dma_map_page(device,
+							 vmalloc_to_page(wb),
+							 offset_in_page(wb),
+							 sizeof(*wb), DMA_FROM_DEVICE);
+			desc->is_map_page = 1;
+		} else {
+			desc->wb_dma_addr = dma_map_single(device, wb, sizeof(*wb),
+							   DMA_FROM_DEVICE);
+		}
+		if (dma_mapping_error(&hw->cdev.pdev->dev, desc->wb_dma_addr))
+			return -ENOMEM;
+
+		return 0;
+	}
+
+	rc = pin_user_pages_fast((unsigned long)wb, 1,
+				 FOLL_WRITE | FOLL_LONGTERM, &desc->page);
+	if (rc == 1) {
+		desc->wb_dma_addr = dma_map_single(device,
+						   page_address(desc->page) +
+						   offset_in_page(wb),
+						   sizeof(*wb), DMA_FROM_DEVICE);
+		if (dma_mapping_error(device, desc->wb_dma_addr)) {
+			unpin_user_page(desc->page);
+			desc->page = NULL;
+			return -ENOMEM;
+		}
+
+		return 0;
+	}
+
+	desc->md_priv = cass_device_md(ct_priv->lni_priv, (u64)wb, sizeof(*wb),
+				       &dma_addrs);
+	if (IS_ERR(desc->md_priv))
+		return PTR_ERR(desc->md_priv);
+
+	desc->wb_dma_addr = dma_addrs + offset_in_page(wb);
+
+	return 0;
+}
+
+static void ct_wb_unmap(struct cass_dev *hw, const struct cxi_ct_priv *ct_priv,
+			struct ct_wb_desc *desc)
+{
+	if (desc->wb_dma_addr == 0)
+		return;
+
+	/* The presence of md_priv indicates device memory which is unmapped
+	 * when the pages are released.
+	 */
+	if (desc->md_priv == NULL) {
+		if (desc->is_map_page)
+			dma_unmap_page(&hw->cdev.pdev->dev, desc->wb_dma_addr,
+				       sizeof(struct c_ct_writeback),
+				       DMA_FROM_DEVICE);
+		else
+			dma_unmap_single(&hw->cdev.pdev->dev, desc->wb_dma_addr,
+					 sizeof(struct c_ct_writeback),
+					 DMA_FROM_DEVICE);
+	}
+
+	if (!ct_priv->is_user)
+		return;
+
+	if (desc->page) {
+		unpin_user_page(desc->page);
+		desc->page = NULL;
+	} else if (desc->md_priv) {
+		p2p_ops.put_pages(desc->md_priv);
+		kfree(desc->md_priv);
+		desc->md_priv = NULL;
+	}
+}
+
+static struct cxi_ct *cxi_ct_alloc_vf(struct cxi_lni *lni,
+				      struct c_ct_writeback *wb, bool is_user)
+{
+	struct cxi_dev *dev = container_of(lni, struct cxi_lni_priv_vf, lni)->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_ct_priv *ct_priv;
+	int rc;
+	int ctn;
+	struct cxi_ct_alloc_cmd_vf cmd = {
+		.base.op = CXI_OP_CT_ALLOC,
+		.base.lni = lni->id,
+	};
+	struct cxi_ct_alloc_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	struct cxi_ct_free_cmd free_cmd = {
+		.op = CXI_OP_CT_FREE,
+	};
+
+	/* WB address must be 8-byte aligned. */
+	if (!IS_ALIGNED((u64)wb, 8))
+		return ERR_PTR(-EINVAL);
+
+	ct_priv = kzalloc(sizeof(*ct_priv), GFP_KERNEL);
+	if (!ct_priv)
+		return ERR_PTR(-ENOMEM);
+	ct_priv->lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	ct_priv->is_user = is_user;
+
+	/* A WB address context of zero means that WB is disabled for the CT. */
+	if (wb) {
+		rc = ct_wb_map(hw, ct_priv, &ct_priv->wb_desc, wb);
+		if (rc)
+			goto free_ct_priv;
+	} else {
+		ct_priv->wb_desc.wb_dma_addr = 0;
+	}
+
+	cmd.wb_dma_addr = ct_priv->wb_desc.wb_dma_addr;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		goto unmap_wb;
+
+	ctn = resp.ctn;
+	ct_priv->ct.ctn = ctn;
+
+	if (!is_user) {
+		phys_addr_t mmio_phys = hw->regs_base + C_MEMORG_CQ_TOU +
+				ctn * C_TOU_LAUNCH_PAGE_SIZE;
+		ct_priv->ct_mmio = ioremap(mmio_phys, PAGE_SIZE);
+		if (!ct_priv->ct_mmio) {
+			cxidev_warn_once(dev, "ioremap failed\n");
+			rc = -ENOMEM;
+			goto free_pf_ct;
+		}
+	}
+
+	return &ct_priv->ct;
+
+free_pf_ct:
+	free_cmd.ctn = ctn;
+	resp_len = 0;
+	cxi_send_msg_to_pf(dev, &free_cmd, sizeof(free_cmd), NULL, &resp_len);
+unmap_wb:
+	if (wb)
+		ct_wb_unmap(hw, ct_priv, &ct_priv->wb_desc);
+free_ct_priv:
+	kfree(ct_priv);
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_ct_alloc_internal() - Allocate a counting event (internal implementation
+ * to handle VF requests)
+ *
+ * @lni: LNI counting event is allocated against
+ * @wb: User defined writeback buffer, must be DMA-able.
+ * @is_user: Non-zero value if the counting event is for userspace.
+ * @wb_dma_addr: Pre-mapped DMA address for writeback buffer (for requests from VF)
+ *
+ * Writeback buffer is optional. If @wb is NULL, the wb field in the returned
+ * cxi_ct will also be NULL. @wb must be NULL in requests coming from VFs, the
+ * writeback buffer (if any) is passed using wb_dma_addr, having already been
+ * mapped by the VF.
+ *
+ * Return: Valid pointer on success. Else, negative errno pointer.
+ */
+struct cxi_ct *cxi_ct_alloc_internal(struct cxi_lni *lni,
+				     struct c_ct_writeback *wb, bool is_user,
+				     dma_addr_t wb_dma_addr)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw =
+		container_of(dev, struct cass_dev, cdev);
+	struct cxi_ct_priv *ct_priv;
+	u16 wb_ac;
+	int rc;
+	int ctn;
+
+	/* WB address must be 8-byte aligned. */
+	if (!IS_ALIGNED((u64)wb, 8))
+		return ERR_PTR(-EINVAL);
+
+	ct_priv = kzalloc(sizeof(*ct_priv), GFP_KERNEL);
+	if (!ct_priv)
+		return ERR_PTR(-ENOMEM);
+	ct_priv->lni_priv = lni_priv;
+	ct_priv->is_user = is_user;
+
+	/* Check the associated service to see if this CT can be allocated */
+	rc = cxi_rgroup_alloc_resource(lni_priv->rgroup, CXI_RESOURCE_CT);
+	if (rc)
+		goto free_ct_priv;
+
+	/*
+	 * A WB address context of zero means that WB is disabled for
+	 * the CT.
+	 */
+	if (wb) {
+		rc = ct_wb_map(hw, ct_priv, &ct_priv->wb_desc, wb);
+		if (rc)
+			goto dec_rsrc_use;
+		wb_ac = lni_priv->phys_ac;
+	} else if (wb_dma_addr) {
+		ct_priv->wb_desc.wb_dma_addr = wb_dma_addr;
+		wb_ac = lni_priv->phys_ac;
+	} else {
+		ct_priv->wb_desc.wb_dma_addr = 0;
+		wb_ac = C_AC_NONE;
+	}
+
+	/* Allocate and configure the counting event. */
+	rc = ida_alloc_range(&hw->ct_table, 1, C_NUM_CTS - 1, GFP_KERNEL);
+	if (rc < 0)
+		goto free_md_priv;
+	ctn = rc;
+
+	if (!is_user) {
+		phys_addr_t mmio_phys = hw->regs_base + C_MEMORG_CQ_TOU +
+				ctn * C_TOU_LAUNCH_PAGE_SIZE;
+		ct_priv->ct_mmio = ioremap(mmio_phys, PAGE_SIZE);
+		if (!ct_priv->ct_mmio) {
+			cxidev_warn_once(dev, "ioremap failed\n");
+			rc = -ENOMEM;
+			goto ct_release;
+		}
+	}
+
+	/* Reset the hardware CT. */
+	rc = set_hw_state(hw, ctn, true);
+	if (rc)
+		goto ct_unmap;
+
+	if (lni_priv->is_vf)
+		cass_config_sriovt(hw, true, lni_priv->vf_num, 2048 + ctn);
+
+	/* Finally the CT can be enabled */
+	cxi_ct_init(&ct_priv->ct, wb, ctn, (__force u64 *)ct_priv->ct_mmio);
+	cass_ct_enable(hw, ctn, lni_priv->lni.rgid, ct_priv->wb_desc.wb_dma_addr, wb_ac);
+
+	/* Track the counting event. */
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&ct_priv->entry, &lni_priv->ct_list);
+	refcount_inc(&lni_priv->refcount);
+	atomic_inc(&hw->stats.ct);
+	spin_unlock(&lni_priv->res_lock);
+
+	ct_debugfs_setup(ct_priv->ct.ctn, ct_priv, hw, lni_priv);
+
+	return &ct_priv->ct;
+
+ct_unmap:
+	if (!is_user)
+		iounmap(ct_priv->ct_mmio);
+ct_release:
+	ida_free(&hw->ct_table, ctn);
+free_md_priv:
+	if (wb)
+		ct_wb_unmap(hw, ct_priv, &ct_priv->wb_desc);
+dec_rsrc_use:
+	cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_CT);
+free_ct_priv:
+	kfree(ct_priv);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL(cxi_ct_alloc_internal);
+
+/**
+ * cxi_ct_alloc() - Allocate a counting event
+ *
+ * @lni: LNI counting event is allocated against
+ * @wb: User defined writeback buffer, must be DMA-able.
+ * @is_user: Non-zero value if the counting event is for userspace.
+ *
+ * Writeback buffer is optional. If @wb is NULL, the wb field in the returned
+ * cxi_ct will also be NULL.
+ *
+ * Return: Valid pointer on success. Else, negative errno pointer.
+ */
+struct cxi_ct *cxi_ct_alloc(struct cxi_lni *lni,
+			    struct c_ct_writeback *wb, bool is_user)
+{
+	struct cxi_dev *dev = container_of(lni, struct cxi_lni_priv, lni)->dev;
+
+	if (dev->is_physfn)
+		return cxi_ct_alloc_internal(lni, wb, is_user, 0);
+	else
+		return cxi_ct_alloc_vf(lni, wb, is_user);
+}
+EXPORT_SYMBOL(cxi_ct_alloc);
+
+/* Wait for credits_in_use.tou_wb_credits to drain to 0. We then know that
+ * no more writebacks are in progress.
+ */
+static int drain_wb_credits(struct cass_dev *hw)
+{
+	ktime_t timeout;
+	int timeout_us = 1000;
+	union c_cq_sts_credits_in_use in_use;
+
+	timeout = ktime_add_us(ktime_get(), timeout_us);
+
+	for (;;) {
+		cass_read(hw, C_CQ_STS_CREDITS_IN_USE, &in_use,
+			  sizeof(in_use));
+
+		if (in_use.tou_wb_credits == 0)
+			return 0;
+
+		if (ktime_compare(ktime_get(), timeout) > 0)
+			return -ETIMEDOUT;
+
+		usleep_range(5, 20);
+	}
+}
+
+static int cxi_ct_wb_update_vf(struct cxi_ct *ct, struct c_ct_writeback *wb)
+{
+	struct cxi_ct_priv *ct_priv = container_of(ct, struct cxi_ct_priv, ct);
+	struct cxi_dev *dev = ct_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_ct_wb_update_cmd_vf cmd = {
+		.base.op = CXI_OP_CT_WB_UPDATE,
+		.base.ctn = ct->ctn,
+	};
+	size_t resp_len = 0;
+	struct ct_wb_desc new_desc;
+	int rc;
+
+	if (!wb)
+		return -EINVAL;
+
+	rc = ct_wb_map(hw, ct_priv, &new_desc, wb);
+	if (rc)
+		return rc;
+
+	cmd.wb_dma_addr = new_desc.wb_dma_addr;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		goto unmap_new_desc;
+
+	/* Previous pinned pages need to be cleaned up. */
+	ct_wb_unmap(hw, ct_priv, &ct_priv->wb_desc);
+	ct_priv->wb_desc = new_desc;
+
+	/* finally, save the new wb */
+	ct->wb = wb;
+
+	return 0;
+
+unmap_new_desc:
+	ct_wb_unmap(hw, ct_priv, &new_desc);
+	return rc;
+}
+
+/**
+ * cxi_ct_wb_update_internal() - Update a counting event with a new writeback
+ * address (internal implementation to handle VF requests)
+ *
+ * Flush by setting c_cq_cfg_credit_limits.tou_wb_credits to 0. When
+ * c_cq_sts_credits_in_use.tou_wb_credits is 0, then no writebacks are
+ * in progress. Re-enable the c_cq_cfg_credit_limits.tou_wb_credits.
+ *
+ * @ct: Counting event
+ * @wb: User defined writeback buffer, must be DMA-able.
+ * @wb_dma_addr: Pre-mapped DMA address for writeback buffer (for requests from VF)
+ *
+ * As documented in cxi_ct_alloc_internal(), @wb must be NULL in requests coming
+ * from VFs, the new writeback buffer is passed using @wb_dma_addr, having
+ * already been mapped by the VF.
+ */
+int cxi_ct_wb_update_internal(struct cxi_ct *ct, struct c_ct_writeback *wb,
+			      dma_addr_t wb_dma_addr)
+{
+	struct cxi_ct_priv *ct_priv = container_of(ct, struct cxi_ct_priv, ct);
+	struct cxi_lni_priv *lni_priv = ct_priv->lni_priv;
+	struct cass_dev *hw =
+		container_of(lni_priv->dev, struct cass_dev, cdev);
+	union c_cq_cfg_credit_limits limits = {};
+	union c_cq_cfg_ct_wb_mem_addr mem = {
+		.wb_mem_context = lni_priv->phys_ac,
+	};
+	struct ct_wb_desc new_desc = {};
+	int wb_credits = 0;
+	int rc = 0;
+
+	// TODO: write pycxi test for this fn + driver test
+
+	if (!wb && !wb_dma_addr)
+		return -EINVAL;
+
+	if (!lni_priv->is_vf) {
+		rc = ct_wb_map(hw, ct_priv, &new_desc, wb);
+		if (rc)
+			return rc;
+	} else {
+		new_desc.wb_dma_addr = wb_dma_addr;
+	}
+
+	mutex_lock(&hw->ct_init_lock);
+
+	/* If wb is valid, it may be in use. */
+	if (ct_priv->wb_desc.wb_dma_addr) {
+		/* stop wb writes */
+		cass_read(hw, C_CQ_CFG_CREDIT_LIMITS, &limits, sizeof(limits));
+		wb_credits = limits.tou_wb_credits;
+		limits.tou_wb_credits = 0;
+		cass_write(hw, C_CQ_CFG_CREDIT_LIMITS, &limits, sizeof(limits));
+
+		rc = drain_wb_credits(hw);
+		if (rc)
+			goto set_limit;
+	}
+
+	mem.wb_mem_addr = new_desc.wb_dma_addr >> 3;
+	cass_write(hw, C_CQ_CFG_CT_WB_MEM_ADDR(ct->ctn), &mem, sizeof(mem));
+	cass_flush_pci(hw);
+
+	/* Previous pinned pages need to be cleaned up. */
+	if (!lni_priv->is_vf)
+		ct_wb_unmap(hw, ct_priv, &ct_priv->wb_desc);
+
+set_limit:
+	if (ct_priv->wb_desc.wb_dma_addr) {
+		limits.tou_wb_credits = wb_credits;
+		cass_write(hw, C_CQ_CFG_CREDIT_LIMITS, &limits, sizeof(limits));
+	}
+
+	/* finally, save the new wb */
+	if (!rc) {
+		ct->wb = wb;
+		ct_priv->wb_desc = new_desc;
+	}
+	mutex_unlock(&hw->ct_init_lock);
+
+	if (rc && !lni_priv->is_vf)
+		ct_wb_unmap(hw, ct_priv, &new_desc);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_ct_wb_update_internal);
+
+/**
+ * cxi_ct_wb_update() - Update a counting event with a new writeback address.
+ *
+ * Flush by setting c_cq_cfg_credit_limits.tou_wb_credits to 0. When
+ * c_cq_sts_credits_in_use.tou_wb_credits is 0, then no writebacks are
+ * in progress. Re-enable the c_cq_cfg_credit_limits.tou_wb_credits.
+ *
+ * @ct: Counting event
+ * @wb: User defined writeback buffer, must be DMA-able.
+ */
+int cxi_ct_wb_update(struct cxi_ct *ct, struct c_ct_writeback *wb)
+{
+	struct cxi_ct_priv *ct_priv = container_of(ct, struct cxi_ct_priv, ct);
+
+	if (!ct_priv->lni_priv->dev->is_physfn)
+		return cxi_ct_wb_update_vf(ct, wb);
+	else
+		return cxi_ct_wb_update_internal(ct, wb, 0);
+}
+EXPORT_SYMBOL(cxi_ct_wb_update);
+
+static void cxi_ct_free_vf(struct cxi_ct *ct)
+{
+	struct cxi_ct_priv *ct_priv = container_of(ct, struct cxi_ct_priv, ct);
+	struct cxi_dev *dev = ct_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_ct_free_cmd cmd = {
+		.op = CXI_OP_CT_FREE,
+		.ctn = ct->ctn,
+	};
+	size_t resp_len = 0;
+
+	/* Inform PF to free the CT */
+	cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), NULL, &resp_len);
+
+	if (!ct_priv->is_user)
+		iounmap(ct_priv->ct_mmio);
+
+	ct_wb_unmap(hw, ct_priv, &ct_priv->wb_desc);
+}
+
+/**
+ * cxi_ct_free() - Free a counting event.
+ * @ct: Counting event
+ */
+void cxi_ct_free(struct cxi_ct *ct)
+{
+	struct cxi_ct_priv *ct_priv = container_of(ct, struct cxi_ct_priv, ct);
+	struct cxi_lni_priv *lni_priv = ct_priv->lni_priv;
+	struct cass_dev *hw =
+		container_of(lni_priv->dev, struct cass_dev, cdev);
+
+	if (!hw->cdev.is_physfn) {
+		cxi_ct_free_vf(ct);
+		return;
+	}
+
+	/* Change ownership to the driver. */
+	cass_ct_disable(hw, ct_priv->ct.ctn);
+
+	if (lni_priv->is_vf)
+		cass_config_sriovt(hw, false, lni_priv->vf_num, 2048 + ct_priv->ct.ctn);
+
+	/* Cancel all pending operations. */
+	set_hw_state(hw, ct_priv->ct.ctn, false);
+
+	spin_lock(&lni_priv->res_lock);
+	list_del(&ct_priv->entry);
+	spin_unlock(&lni_priv->res_lock);
+
+	if (!ct_priv->is_user)
+		iounmap(ct_priv->ct_mmio);
+
+	if (!lni_priv->is_vf)
+		ct_wb_unmap(hw, ct_priv, &ct_priv->wb_desc);
+
+	/* Hang the CT on the LNI pending deletion list, to be
+	 * released later
+	 */
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&ct_priv->entry, &lni_priv->ct_cleanups_list);
+	spin_unlock(&lni_priv->res_lock);
+}
+EXPORT_SYMBOL(cxi_ct_free);
+
+/* Finish releasing all the CTs on the deletion pending list */
+void finalize_ct_cleanups(struct cxi_lni_priv *lni)
+{
+	struct cxi_dev *dev = lni->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_ct_priv *ct;
+
+	while ((ct = list_first_entry_or_null(&lni->ct_cleanups_list,
+					      struct cxi_ct_priv, entry))) {
+		list_del(&ct->entry);
+
+		debugfs_remove(ct->lni_dir);
+		debugfs_remove_recursive(ct->debug_dir);
+
+		refcount_dec(&lni->refcount);
+		atomic_dec(&hw->stats.ct);
+		cxi_rgroup_free_resource(lni->rgroup, CXI_RESOURCE_CT);
+		ida_free(&hw->ct_table, ct->ct.ctn);
+		kfree(ct);
+	}
+}
+
+/**
+ * cxi_ct_user_info() - Get userspace mmap info for counting event doorbell.
+ * @ct: Counting event
+ * @doorbell_addr: On success, will contain the address of the doorbell.
+ * @doorbell_size: On success, will contain the size of the doorbell.
+ *
+ * Return: On success, returns zero. On error, returns a negative error number.
+ */
+int cxi_ct_user_info(struct cxi_ct *ct, phys_addr_t *doorbell_addr,
+		     size_t *doorbell_size)
+{
+	struct cxi_ct_priv *ct_priv = container_of(ct, struct cxi_ct_priv, ct);
+	struct cass_dev *hw = container_of(ct_priv->lni_priv->dev,
+					   struct cass_dev, cdev);
+
+	if (!ct_priv->is_user)
+		return -EINVAL;
+
+	*doorbell_addr = hw->regs_base + C_MEMORG_CQ_TOU +
+		(ct->ctn * C_TOU_LAUNCH_PAGE_SIZE);
+	*doorbell_size = PAGE_SIZE;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_ct_user_info);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_dmac.c b/drivers/net/ethernet/hpe/ss1/cass_dmac.c
new file mode 100644
index 000000000000..5c1e4f335a6d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_dmac.c
@@ -0,0 +1,597 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2021, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/iopoll.h>
+#include <linux/bitmap.h>
+
+#include "cass_core.h"
+#include "cass_ss1_debugfs.h"
+
+#define DMAC_DESC_INDEX_UNSPECIFIED		((u16)(~0))
+
+/*
+ * A transfer copies at most a few KB of NIC CSRs and normally finishes in
+ * well under a millisecond, so this is only the limit for a stuck engine.
+ */
+#define CASS_DMAC_XFER_TIMEOUT_MS		5000
+
+/*
+ * _must_ only be called when holding mutex hw->dmac.lock
+ * TODO: add kernel 'requires_lock' annotations
+ */
+static int cass_dmac_desc_set_id_verify(struct cass_dev *hw, int set_id)
+{
+	if (set_id < 0 || set_id >= DMAC_DESC_SET_COUNT ||
+	    hw->dmac.desc_sets[set_id].count == 0)
+		return -EINVAL;
+	return 0;
+}
+
+static void dmac_desc_zero_n(struct cass_dev *hw, u16 desc_index, u16 count)
+{
+	cass_clear(hw, C_PI_CFG_DMAC_DESC(desc_index),
+		   sizeof(union c_pi_cfg_dmac_desc) * count);
+	cass_flush_pci(hw);
+}
+
+static void dmac_desc_zero_all(struct cass_dev *hw)
+{
+	dmac_desc_zero_n(hw, 0, C_PI_CFG_DMAC_DESC_NUM_AVAILABLE_ENTRIES -
+			 C_PI_CFG_DMAC_DESC_NUM_RSVD_ENTRIES);
+}
+
+static void dmac_disable(struct cass_dev *hw)
+{
+	/* Disable DMAC */
+	cass_clear(hw, C_PI_CFG_DMAC, C_PI_CFG_DMAC_SIZE);
+	cass_flush_pci(hw);
+}
+
+static void dmac_enable(struct cass_dev *hw, u16 desc_index)
+{
+	union c_pi_cfg_dmac dmac = {
+		.desc_index	  = desc_index,
+		.enable		  = 1,
+		.start		  = 1,
+		.cpl_event_enable = 1,
+		.irq_on_done	  = 1,
+		.irq_on_error	  = 1
+	};
+
+	/* Enable DMAC */
+	cass_write(hw, C_PI_CFG_DMAC, &dmac, sizeof(dmac));
+	cass_flush_pci(hw);
+}
+
+/**
+ * cxi_dmac_desc_set_reset() - reset number used to zero
+ * @cdev: the device
+ * @set_id: dmac descriptor set id
+ *
+ * reset the number of used descriptors associated with the supplied
+ * dmac descriptor set id to zero
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_dmac_desc_set_reset(struct cxi_dev *cdev, int set_id)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int retval;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	mutex_lock(&hw->dmac.lock);
+
+	retval = cass_dmac_desc_set_id_verify(hw, set_id);
+	if (retval == 0)
+		hw->dmac.desc_sets[set_id].numused = 0;
+
+	mutex_unlock(&hw->dmac.lock);
+	return retval;
+}
+EXPORT_SYMBOL(cxi_dmac_desc_set_reset);
+
+/**
+ * cxi_dmac_desc_set_add() - write the next descriptor in the set
+ * @cdev: the device
+ * @set_id: dmac descriptor set id
+ * @dst: DMA address of host buffer
+ * @src: starting nic csr offset
+ * @len: length to read, in bytes. must be a multiple of 8 (sizeof(u64))
+ *
+ * use the supplied parameters to write the appropriate values to the
+ * next descriptor in the supplied dmac descriptor set id and
+ * if this is not the first descriptor in the set written then set
+ * the continue flag of previous descriptor to true
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_dmac_desc_set_add(struct cxi_dev *cdev, int set_id, dma_addr_t dst,
+			  u32 src, size_t len)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int retval = 0;
+	u16 count;
+	u16 index;
+	u16 numused;
+	union c_pi_cfg_dmac_desc desc = {};
+	u32 src_end;
+	const u32 u64count = len / sizeof(u64);
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	/*
+	 * dst address and src offset must be 64-bit aligned
+	 *
+	 * len must be a multiple of 8 (sizeof(u64))
+	 *
+	 * u64count can not be zero and u64count - 1 must fit in 20-bits
+	 *
+	 * cxi csr offsets are within 29 bits
+	 *      the starting & ending src offsets
+	 *      must be contained in 29 bits.
+	 *
+	 * if src offset crosses 23 bit addr boundary,
+	 * then src must be 128 byte aligned
+	 */
+
+	if (!IS_ALIGNED(dst, 8)) {
+		cxidev_err(cdev,
+			   "destination address is not 64-bit aligned: 0x%016llx\n",
+			   dst);
+		return -EINVAL;
+	}
+
+	if ((len % sizeof(u64)) != 0) {
+		cxidev_err(cdev,
+			   "length is not multiple of 8 (sizeof(u64)): %ld\n",
+			   len);
+		return -EINVAL;
+	}
+	if (u64count == 0) {
+		cxidev_err(cdev, "length is zero\n");
+		return -EINVAL;
+	}
+	if (u64count > 0x00100000UL || len != u64count * sizeof(u64)) {
+		cxidev_err(cdev, "length is too large: %ld\n", len);
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(src, 8)) {
+		cxidev_err(cdev,
+			   "source offset is not 64-bit aligned: 0x%08x\n",
+			   src);
+		return -EINVAL;
+	}
+	if (src >= C_MEMORG_CSR_SIZE) {
+		cxidev_err(cdev,
+			   "starting source offset is out of range: 0x%08x\n",
+			   src);
+		return -EINVAL;
+	}
+	src_end = src + (u64count - 1) * sizeof(u64);
+	if (src_end >= C_MEMORG_CSR_SIZE) {
+		cxidev_err(cdev,
+			   "ending source offset is out of range: 0x%08x\n",
+			   src_end);
+		return -EINVAL;
+	}
+	if ((src & 0xff000000UL) != (src_end & 0xff000000UL) &&
+	    (src & 0x7fUL) != 0) {
+		cxidev_err(cdev,
+			   "source offset should be 128-byte aligned when transfer crosses bit-23: 0x%08x 0x%08x\n",
+			   src, src_end);
+		return -EINVAL;
+	}
+
+	mutex_lock(&hw->dmac.lock);
+
+	retval = cass_dmac_desc_set_id_verify(hw, set_id);
+	if (retval != 0)
+		goto __cxi_dmac_desc_set_add_0;
+
+	count = hw->dmac.desc_sets[set_id].count;
+	index = hw->dmac.desc_sets[set_id].index;
+	numused  = hw->dmac.desc_sets[set_id].numused;
+
+	if (numused == count) {
+		retval = -ENOSPC;
+		goto __cxi_dmac_desc_set_add_0;
+	}
+
+	desc.dst_addr = dst >> 3;
+	desc.src_addr = src >> 3;
+	desc.length   = u64count - 1;
+
+	/*
+	 * write the descriptor
+	 */
+	cass_write(hw, C_PI_CFG_DMAC_DESC(index + numused), &desc, sizeof(desc));
+
+	/*
+	 * if the added descriptor is not the first one (0th index) of the set,
+	 * then modify previous descriptor's cont flag to be 1 indicating to
+	 * chain to the next descriptor.
+	 */
+	if (numused != 0) {
+		cass_read(hw, C_PI_CFG_DMAC_DESC(index + numused - 1) +
+			  sizeof(desc.qw[0]), &desc.qw[1],
+			  sizeof(desc.qw[1]));
+		desc.cont = 1;
+		cass_write(hw, C_PI_CFG_DMAC_DESC(index + numused - 1) +
+			   sizeof(desc.qw[0]), &desc.qw[1],
+			   sizeof(desc.qw[1]));
+	}
+
+	++hw->dmac.desc_sets[set_id].numused;
+
+__cxi_dmac_desc_set_add_0:
+	mutex_unlock(&hw->dmac.lock);
+	return retval;
+}
+EXPORT_SYMBOL(cxi_dmac_desc_set_add);
+
+/*
+ * _must_ only be called when holding mutex hw->dmac.lock
+ */
+static void cass_dmac_desc_set_id_fill(struct cass_dev *hw, int set_id,
+				       u16 num_descs, u16 index,
+				       const char *name)
+{
+	cxidev_dbg(&hw->cdev, "set_id=%d num_descs=%u index=%u\n",
+		   set_id, num_descs, index);
+	hw->dmac.desc_sets[set_id].count = num_descs;
+	hw->dmac.desc_sets[set_id].index = index;
+	hw->dmac.desc_sets[set_id].numused  = 0;
+	hw->dmac.desc_sets[set_id].name = name;
+}
+
+/*
+ * _must_ only be called when holding mutex hw->dmac.lock
+ */
+static void cass_dmac_desc_set_id_clear(struct cass_dev *hw, int set_id)
+{
+	cass_dmac_desc_set_id_fill(hw, set_id, 0, DMAC_DESC_INDEX_UNSPECIFIED,
+				   NULL);
+}
+
+static int cass_dmac_desc_set_common_alloc(struct cass_dev *hw,
+					   u16 num_descs, u16 desc_idx,
+					   const char *name)
+{
+	int retval;
+	int i;
+	int set_id;
+	unsigned long index;
+	u16 idx = ((desc_idx == DMAC_DESC_INDEX_UNSPECIFIED) ? 0 : desc_idx);
+
+	if (num_descs == 0 || num_descs >= C_PI_CFG_DMAC_DESC_ENTRIES)
+		return -EINVAL;
+
+	mutex_lock(&hw->dmac.lock);
+
+	for (i = 0; i < DMAC_DESC_SET_COUNT; ++i)
+		if (hw->dmac.desc_sets[i].count == 0)
+			break;
+	if (i == DMAC_DESC_SET_COUNT) {
+		retval = -ENOSPC;
+		goto __cass_dmac_desc_set_common_alloc_0;
+	} else {
+		set_id = i;
+	}
+
+	index = bitmap_find_next_zero_area(hw->dmac.desc_map,
+					   C_PI_CFG_DMAC_DESC_ENTRIES,
+					   idx, num_descs, 0);
+
+	if (index >= C_PI_CFG_DMAC_DESC_ENTRIES) {
+		retval = -ENOSPC;
+		goto __cass_dmac_desc_set_common_alloc_0;
+	}
+
+	if (desc_idx != DMAC_DESC_INDEX_UNSPECIFIED && index != desc_idx) {
+		retval = -ENOSPC;
+		goto __cass_dmac_desc_set_common_alloc_0;
+	}
+
+	bitmap_set(hw->dmac.desc_map, index, num_descs);
+	cass_dmac_desc_set_id_fill(hw, set_id, num_descs, index, name);
+
+	retval = set_id;
+
+__cass_dmac_desc_set_common_alloc_0:
+	mutex_unlock(&hw->dmac.lock);
+	return retval;
+}
+
+/**
+ * cxi_dmac_desc_set_reserve() - reserve dmac descriptors
+ * @cdev: the device
+ * @num_descs: number of descriptors to reserve
+ * @desc_idx: starting NIC dmac descriptor
+ * @name: descriptive name to associate the dmac descriptor set
+ *        where the string must remain valid for the lifetime of the set
+ *
+ * reserve 'num_descs' contiguous from the NIC dmac descriptor pool
+ * starting with index 'desc_idx'
+ *
+ * Return: dmac descriptor set id on success, negative errno on failure
+ */
+int cxi_dmac_desc_set_reserve(struct cxi_dev *cdev, u16 num_descs,
+			      u16 desc_idx, const char *name)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int retval;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	cxidev_dbg(cdev, "hw=%p num_descs=%u desc_idx=%u\n", hw, num_descs,
+		   desc_idx);
+
+	if (desc_idx >= C_PI_CFG_DMAC_DESC_ENTRIES)
+		return -EINVAL;
+
+	retval = cass_dmac_desc_set_common_alloc(hw, num_descs, desc_idx,
+						 name);
+	return retval;
+}
+EXPORT_SYMBOL(cxi_dmac_desc_set_reserve);
+
+/**
+ * cxi_dmac_desc_set_alloc() - allocate dmac descriptors
+ * @cdev: the device
+ * @num_descs: number of descriptors to reserve
+ * @name: descriptive name to associate the dmac descriptor set
+ *        where the string must remain valid for the lifetime of the set
+ *
+ * allocate 'num_descs' contiguous from the NIC dmac descriptor free pool
+ *
+ * Return: dmac descriptor set id on success, negative errno on failure
+ */
+int cxi_dmac_desc_set_alloc(struct cxi_dev *cdev, u16 num_descs,
+			    const char *name)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int retval;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	cxidev_dbg(cdev, "hw=%p num_descs=%u\n", hw, num_descs);
+
+	retval = cass_dmac_desc_set_common_alloc(hw, num_descs,
+						 DMAC_DESC_INDEX_UNSPECIFIED,
+						 name);
+
+	return retval;
+}
+EXPORT_SYMBOL(cxi_dmac_desc_set_alloc);
+
+/**
+ * cxi_dmac_desc_set_free() - free dmac descriptors
+ * @cdev: the device
+ * @set_id: dmac descriptor set id
+ *
+ * free the descriptors associated with 'set_id' returning them
+ * back to the free pool
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_dmac_desc_set_free(struct cxi_dev *cdev, int set_id)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int retval = 0;
+	u16 count;
+	u16 index;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	cxidev_dbg(cdev, "hw=%p set_id=%d\n", hw, set_id);
+
+	mutex_lock(&hw->dmac.lock);
+
+	retval = cass_dmac_desc_set_id_verify(hw, set_id);
+	if (retval != 0)
+		goto __cxi_dmac_desc_set_free_0;
+
+	count = hw->dmac.desc_sets[set_id].count;
+	index = hw->dmac.desc_sets[set_id].index;
+
+	dmac_desc_zero_n(hw, index, count);
+	bitmap_clear(hw->dmac.desc_map, index, count);
+
+	cass_dmac_desc_set_id_clear(hw, set_id);
+
+__cxi_dmac_desc_set_free_0:
+	mutex_unlock(&hw->dmac.lock);
+	return retval;
+}
+EXPORT_SYMBOL(cxi_dmac_desc_set_free);
+
+/**
+ * cxi_dmac_xfer() - start dma & wait/block for completion
+ * @cdev: the device
+ * @set_id: dmac descriptor set id
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_dmac_xfer(struct cxi_dev *cdev, int set_id)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	volatile struct c_pi_dmac_cdesc *cpl_desc = hw->dmac.cpl_desc;
+	int retval;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	cxidev_dbg(&hw->cdev, "hw=%p set_id=%d\n", hw, set_id);
+
+	mutex_lock(&hw->dmac.lock);
+
+	retval = cass_dmac_desc_set_id_verify(hw, set_id);
+	if (retval != 0)
+		goto __cxi_dmac_xfer_0;
+
+	if (hw->dmac.desc_sets[set_id].numused == 0) {
+		retval = -EINVAL;
+		goto __cxi_dmac_xfer_0;
+	}
+
+	/*
+	 * A transfer that timed out can still raise its interrupt later, so
+	 * drop any completion left over from one before starting this one.
+	 */
+	reinit_completion(&hw->dmac.irupt);
+
+	dmac_enable(hw, hw->dmac.desc_sets[set_id].index);
+
+	if (!wait_for_completion_timeout(&hw->dmac.irupt,
+					 msecs_to_jiffies(CASS_DMAC_XFER_TIMEOUT_MS)))
+		cxidev_err(cdev, "ERROR: DMAC completion timed out\n");
+
+	/*
+	 * Stop the engine before reading and clearing the completion
+	 * descriptor. In the error case, including the timeout, it may still
+	 * be running, and it must not write to the descriptor or the
+	 * destination buffer once this returns and the caller can free them.
+	 * The lock is held, so descriptor set and buffer teardown, which
+	 * takes it, cannot start before this.
+	 *
+	 * The next version of this becomes interrupt driven and the
+	 * further paranoia wants to disable irupts in dmac when done
+	 * to prevent 'erroneous spurious interrupts'.
+	 */
+	dmac_disable(hw);
+
+	/* Drain a handler for this transfer's interrupt before the next starts */
+	synchronize_irq(pci_irq_vector(hw->cdev.pdev, C_PI_DMAC_MSIX_INT));
+	reinit_completion(&hw->dmac.irupt);
+
+	if (cpl_desc->done == 0) {
+		cxidev_err(cdev,
+			   "ERROR: failed to get DMAC completion\n");
+		retval = -ETIME;
+	}
+	if (cpl_desc->status != C_PI_DMAC_CDESC_STATUS_AXI_RESP_OKAY) {
+		cxidev_err(cdev,
+			   "ERROR: DMAC_CDESC_STATUS=%x is 'not OK'\n",
+			   cpl_desc->status);
+		retval = -EBADE;
+	}
+
+	cxidev_dbg(&hw->cdev, "hw->dmac.cpl_desc=%016llx\n", *((u64 *)cpl_desc));
+
+	memset((void *)cpl_desc, 0, sizeof(*cpl_desc));
+
+__cxi_dmac_xfer_0:
+	mutex_unlock(&hw->dmac.lock);
+	return retval;
+}
+EXPORT_SYMBOL(cxi_dmac_xfer);
+
+static irqreturn_t cass_dmac_irupt_handler(int irq, void *p)
+{
+	struct completion *x = (struct completion *)p;
+
+	complete(x);
+	return IRQ_HANDLED;
+}
+
+/*
+ * Initialize DMAC (DMA Controller)
+ */
+int cass_dmac_init(struct cass_dev *hw)
+{
+	struct device *dma_dev = &hw->cdev.pdev->dev;
+	union c_pi_cfg_dmac_cpl_addr dmac_cpl = {};
+	int i;
+	int retval;
+	int vec;
+
+	dmac_disable(hw);
+	/*
+	 * Configure the DMAC to write a completion event to cpl_desc
+	 */
+	hw->dmac.cpl_desc = dma_alloc_coherent(dma_dev, sizeof(*hw->dmac.cpl_desc),
+					       &hw->dmac.cpl_desc_dma_addr,
+					       GFP_KERNEL);
+	if (!hw->dmac.cpl_desc)
+		return -ENOMEM;
+	memset(hw->dmac.cpl_desc, 0, sizeof(*hw->dmac.cpl_desc));
+	dmac_cpl.address = hw->dmac.cpl_desc_dma_addr >> 3;
+	cass_write(hw, C_PI_CFG_DMAC_CPL_ADDR, &dmac_cpl, sizeof(dmac_cpl));
+
+	dmac_desc_zero_all(hw);	/* the zero will cass_flush_pci() */
+
+	mutex_init(&hw->dmac.lock);
+
+	init_completion(&hw->dmac.irupt);
+
+	hw->dmac.desc_sets = kcalloc(DMAC_DESC_SET_COUNT,
+				     sizeof(*hw->dmac.desc_sets), GFP_KERNEL);
+
+	if (hw->dmac.desc_sets == NULL) {
+		retval = -ENOMEM;
+		goto __cass_dmac_init_0;
+	}
+
+	for (i = 0; i < DMAC_DESC_SET_COUNT; ++i)
+		cass_dmac_desc_set_id_clear(hw, i);
+
+	hw->dmac.desc_map = bitmap_zalloc(C_PI_CFG_DMAC_DESC_ENTRIES,
+					  GFP_KERNEL);
+	if (hw->dmac.desc_map == NULL) {
+		retval = -ENOMEM;
+		goto __cass_dmac_init_1;
+	}
+	scnprintf(hw->dmac.irupt_name, sizeof(hw->dmac.irupt_name),
+		  "%s_irupt_dmac", hw->cdev.name);
+	vec = pci_irq_vector(hw->cdev.pdev, C_PI_DMAC_MSIX_INT);
+	retval = request_irq(vec, cass_dmac_irupt_handler, 0,
+			     hw->dmac.irupt_name, &hw->dmac.irupt);
+	if (retval != 0)
+		goto __cass_dmac_init_2;
+
+	return 0;
+
+__cass_dmac_init_2:
+	bitmap_free(hw->dmac.desc_map);
+
+__cass_dmac_init_1:
+	kfree(hw->dmac.desc_sets);
+
+__cass_dmac_init_0:
+	mutex_destroy(&hw->dmac.lock);
+	dmac_cpl.address = 0;
+	cass_write(hw, C_PI_CFG_DMAC_CPL_ADDR, &dmac_cpl, sizeof(dmac_cpl));
+	dma_free_coherent(dma_dev, sizeof(*hw->dmac.cpl_desc),
+			  hw->dmac.cpl_desc, hw->dmac.cpl_desc_dma_addr);
+	hw->dmac.cpl_desc = NULL;
+
+	return retval;
+}
+
+/*
+ * Finish/finalize DMAC (DMA Controller)
+ */
+void cass_dmac_fini(struct cass_dev *hw)
+{
+	struct device *dma_dev = &hw->cdev.pdev->dev;
+	int vec;
+
+	dmac_disable(hw);
+	vec = pci_irq_vector(hw->cdev.pdev, C_PI_DMAC_MSIX_INT);
+	free_irq(vec, &hw->dmac.irupt);
+	cass_clear(hw, C_PI_CFG_DMAC_CPL_ADDR, C_PI_CFG_DMAC_CPL_ADDR_SIZE);
+	dmac_desc_zero_all(hw);
+	dma_free_coherent(dma_dev, sizeof(*hw->dmac.cpl_desc),
+			  hw->dmac.cpl_desc, hw->dmac.cpl_desc_dma_addr);
+	hw->dmac.cpl_desc = NULL;
+	bitmap_free(hw->dmac.desc_map);
+	kfree(hw->dmac.desc_sets);
+	mutex_destroy(&hw->dmac.lock);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_eq.c b/drivers/net/ethernet/hpe/ss1/cass_eq.c
new file mode 100644
index 000000000000..2d65df985b05
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_eq.c
@@ -0,0 +1,1518 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Portals-like interface for Cassini */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/iopoll.h>
+
+#include "cass_core.h"
+#include "cxi_internal.h"
+#include "cass_ss1_debugfs.h"
+#include "cxi_vf_cmd.h"
+
+static unsigned int ee_timestamp_period_ms = 1000;
+module_param(ee_timestamp_period_ms, uint, 0644);
+MODULE_PARM_DESC(ee_timestamp_period_ms,
+		 "Period between EE timestamp events in milliseconds.");
+
+#define LT_LIMIT_MAX (BIT(9) - 1)
+#define GRAN_DEF 50
+
+static const union c_ee_cfg_latency_monitor lat_monitor_def = {
+	/* The EQ latency_tolerance configuration limit. An EQ's
+	 * latency_tolerance * EE granularity is the ECB expiration timeout.
+	 * Limit is 9 bits wide. Allow any configuration.
+	 */
+	.lt_limit = LT_LIMIT_MAX,
+
+	/* Latency step granularity. An EQ's latency_tolerance * EE granularity
+	 * is the ECB expiration timeout. Granularity is effectively the step
+	 * size of latency_tolerance in ns. 16 bits wide, ~65us max step size.
+	 *
+	 * A default of 50 allows a range of ~0-25us (50ns*511).
+	 */
+	.granularity = GRAN_DEF,
+
+	/* When a configured portion of ECBs are in use, the latency monitor
+	 * transitions to using a separate granularity/latency_tolerance
+	 * configuration which can accelerate ECB expiration.
+	 *
+	 * There are two stages, A and B. Stage transitions are defined by a
+	 * threshold and hysteresis value. When ECB usage hits the threshold,
+	 * the latency monitor enters the corresponding stage. When ECB usage
+	 * drops below the hysteresis value, the stage is exited.
+	 */
+	.thresh_a       = 128,
+	.hysteresis_a   = 100,
+	.granularity_a  = GRAN_DEF / 2, /* 2x speedup in stage A */
+	.lt_limit_a     = LT_LIMIT_MAX,
+	.lt_reduction_a = 0,
+
+	.thresh_b       = 196,
+	.hysteresis_b   = 150,
+	.granularity_b  = GRAN_DEF / 10,       /* 10x speedup in stage B */
+	.lt_limit_b     = 200 / (GRAN_DEF / 10), /* Hard limit of 200 ns */
+	.lt_reduction_b = 0,
+};
+
+#define LATENCY_TOLERANCE_DEF_NS (500)
+
+/* The max number of event entries in an event queue is calculated by:
+ * The number of 4kB pages the C_EE_CFG_EQ_DESCRIPTOR BUFFER_*_SIZE value
+ * can address which is 20-bits worth of addressing or 4GB (2^32) of space.
+ */
+#define MAX_EQ_LEN (1ull << 32)
+
+/* Convert EQ queue length, in bytes, into queue size in ECB units. */
+static size_t get_eq_queue_size(size_t queue_len)
+{
+	return queue_len / C_EE_CFG_ECB_SIZE;
+}
+
+void cass_ee_init(struct cass_dev *hw)
+{
+	union c_ee_cfg_timestamp_freq ts_freq;
+	unsigned int clk_freq_khz;
+
+	if (cass_version(hw, CASSINI_1))
+		clk_freq_khz = C1_CLK_FREQ_HZ / 1000;
+	else
+		clk_freq_khz = C2_CLK_FREQ_HZ / 1000;
+
+	ts_freq.clk_divider = ee_timestamp_period_ms * clk_freq_khz / C_NUM_EQS;
+
+	cass_write(hw, C_EE_CFG_TIMESTAMP_FREQ, &ts_freq, sizeof(ts_freq));
+
+	cass_write(hw, C_EE_CFG_LATENCY_MONITOR, &lat_monitor_def,
+		   sizeof(lat_monitor_def));
+}
+
+/* Event interrupt handler for EQs */
+static int eq_event_nb(struct notifier_block *nb, unsigned long action,
+		       void *data)
+{
+	struct cxi_eq_priv *eq = container_of(nb, struct cxi_eq_priv,
+					      event_nb);
+
+	eq->event_cb(eq->event_cb_data);
+
+	return NOTIFY_OK;
+}
+
+/* Status interrupt handler for EQs */
+static int eq_status_nb(struct notifier_block *nb, unsigned long action,
+			void *data)
+{
+	struct cxi_eq_priv *eq = container_of(nb, struct cxi_eq_priv,
+					      status_nb);
+
+	eq->status_cb(eq->status_cb_data);
+
+	return NOTIFY_OK;
+}
+
+/* Return an EQ latency_tolerance value representing the requested nanosecond
+ * delay according to the currently configured ECB latency monitor granularity.
+ * Reading the currently configured value supports the expected behavior while
+ * using OOB interfaces to configure the latency monitor.
+ */
+static unsigned int eq_compute_lt(struct cass_dev *hw, unsigned int ns)
+{
+	union c_ee_cfg_latency_monitor lat_mon;
+	unsigned int step_size;
+	unsigned int lt;
+
+	cass_read(hw, C_EE_CFG_LATENCY_MONITOR, &lat_mon, sizeof(lat_mon));
+	if (cass_version(hw, CASSINI_1))
+		step_size = lat_mon.granularity / (C1_CLK_FREQ_HZ / NSEC_PER_SEC);
+	else
+		step_size = lat_mon.granularity / (C2_CLK_FREQ_HZ / NSEC_PER_SEC);
+	lt = ns / step_size;
+
+	if (lt > LT_LIMIT_MAX)
+		lt = LT_LIMIT_MAX;
+
+	return lt;
+}
+
+/* Toggle EQ timestamp events. Use eq_shadow_lock to serialize calls. */
+static void eq_timestamp_toggle(struct cass_dev *hw, int eq_n, bool enable)
+{
+	union c_ee_cfg_periodic_tstamp_table ts_tbl;
+	int ts_tbl_idx = eq_n / 64;
+	int ts_tbl_bit = eq_n % 64;
+	u64 csr_off = C_EE_CFG_PERIODIC_TSTAMP_TABLE(ts_tbl_idx);
+
+	cass_read(hw, csr_off, &ts_tbl.qw, 8);
+	if (enable)
+		ts_tbl.n63_n0_enable_periodic_tstamp |= BIT(ts_tbl_bit);
+	else
+		ts_tbl.n63_n0_enable_periodic_tstamp &= ~BIT(ts_tbl_bit);
+	cass_write(hw, csr_off, &ts_tbl.qw, 8);
+}
+
+/* Configure an EQ descriptor's status write-back settings given a queue size.
+ * This must be done each time the EQ size is changed. eq_status_config() does
+ * not write the new settings to hardware.
+ */
+static void eq_status_config(struct cxi_eq_priv *eq, size_t queue_size)
+{
+	unsigned int base_slots;
+	unsigned int delta_slots;
+	int thld_shift;
+
+	if (eq->attr.status_thresh_count) {
+		/* Don't count EQ status slot in queue size. */
+		queue_size -= 1;
+		/* Configure status update thresholds */
+		base_slots = queue_size * (100 - eq->attr.status_thresh_base) / 100;
+		delta_slots = queue_size * eq->attr.status_thresh_delta / 100;
+
+		/* Set threshold shift to preserve the 6 MSBs of the larger of
+		 * the base and delta values.
+		 */
+		thld_shift = (base_slots > delta_slots) ?
+				fls(base_slots) : fls(delta_slots);
+		thld_shift = thld_shift > 6 ? thld_shift - 6 : 0;
+
+		eq->cfg.eq_sts_num_thld = eq->attr.status_thresh_count - 1;
+		eq->cfg.eq_sts_thld_base = base_slots >> thld_shift;
+		eq->cfg.eq_sts_thld_offst = delta_slots >> thld_shift;
+		eq->cfg.eq_sts_thld_shift = thld_shift;
+	} else {
+		/* Max shift value disables threshold updates. */
+		eq->cfg.eq_sts_thld_shift = 0x1f;
+	}
+}
+
+#define EQ_MAX_RESERVED_FC (BIT(14) - 1)
+
+static int is_valid_eq_reserved_fc(struct cxi_eq_priv *eq, int fc_value)
+{
+	int new_fc_value = (int)eq->cfg.reserved_fc + fc_value;
+	int max_fc_value = eq->queue_size - 1;
+
+	if (abs(fc_value) > EQ_MAX_RESERVED_FC ||
+	    new_fc_value > EQ_MAX_RESERVED_FC || new_fc_value < 0)
+		return -EINVAL;
+
+	if (new_fc_value > max_fc_value)
+		return -ENOSPC;
+
+	return 0;
+}
+
+/**
+ * cxi_eq_adjust_reserved_fc_vf() - Adjust EQ reserved FC value for VF.
+ * @eq: EQ
+ * @value: Amount to adjust reserved FC value by. Can be negative or positive.
+ *
+ * Return: On success, value greater than or equal to zero representing current
+ * EQ reserved FC value. Else, -EINVAL if value is invalid or -ENOSPC if a valid
+ * value is provided but could not be applied.
+ */
+static int cxi_eq_adjust_reserved_fc_vf(struct cxi_eq *eq, int value)
+{
+	struct cxi_dev *cdev = container_of(eq, struct cxi_eq_priv, eq)->lni_priv->dev;
+	struct cxi_eq_adjust_reserved_fc_resp resp;
+	size_t resp_len = sizeof(resp);
+	const struct cxi_eq_adjust_reserved_fc_cmd cmd = {
+		.op = CXI_OP_EQ_ADJUST_RESERVED_FC,
+		.eq_hndl = eq->eqn,
+		.value = value,
+		.resp = &resp,
+	};
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	return resp.reserved_fc;
+}
+
+/**
+ * cxi_eq_adjust_reserved_fc() - Adjust EQ reserved FC value.
+ * @eq: EQ
+ * @value: Amount to adjust reserved FC value by. Can be negative or positive.
+ *
+ * Return: On success, value greater than or equal to zero representing current
+ * EQ reserved FC value. Else, -EINVAL if value is invalid or -ENOSPC if a valid
+ * value is provided but could not be applied.
+ */
+int cxi_eq_adjust_reserved_fc(struct cxi_eq *eq, int value)
+{
+	struct cxi_eq_priv *eq_priv;
+	struct cxi_dev *cdev;
+	struct cass_dev *hw;
+	int rc;
+
+	if (!eq)
+		return -EINVAL;
+
+	eq_priv = container_of(eq, struct cxi_eq_priv, eq);
+	cdev = eq_priv->lni_priv->dev;
+
+	if (!cdev->is_physfn)
+		return cxi_eq_adjust_reserved_fc_vf(eq, value);
+
+	hw = container_of(cdev, struct cass_dev, cdev);
+
+	/* Use EQ shadow_lock to serialize EQ access. */
+	spin_lock(&hw->eq_shadow_lock);
+
+	rc = is_valid_eq_reserved_fc(eq_priv, value);
+	if (rc)
+		goto unlock_out;
+
+	eq_priv->cfg.reserved_fc += value;
+
+	cass_shadow_write(hw, C_EE_BASE, C_EE_CFG_EQ_DESCRIPTOR(eq->eqn),
+			  &eq_priv->cfg, sizeof(eq_priv->cfg));
+
+	rc = eq_priv->cfg.reserved_fc;
+
+unlock_out:
+	spin_unlock(&hw->eq_shadow_lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_eq_adjust_reserved_fc);
+
+/**
+ * put_pages_contig() - Un-pin a sequence of physical pages.
+ *
+ * @hw: The cassini device
+ * @desc: EQ buffer descriptor
+ */
+static void put_pages_contig(struct cass_dev *hw, struct eq_buf_desc *desc)
+{
+	size_t npg = desc->events_len >> PAGE_SHIFT;
+
+	dma_unmap_page(&hw->cdev.pdev->dev, desc->dma_addr, desc->events_len,
+		       DMA_FROM_DEVICE);
+
+	unpin_user_pages_dirty_lock(desc->pages, npg, true);
+	kfree(desc->pages);
+}
+
+static int cxi_eq_resize_vf(struct cxi_eq *evtq, void *queue, size_t queue_len,
+			    struct cxi_md *queue_md)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_dev *cdev = eq->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_eq_resize_cmd_vf cmd = {
+		.base.op = CXI_OP_EQ_RESIZE,
+		.base.eq_hndl = eq->eq.eqn,
+		.base.queue_len = queue_len,
+		.base.queue_md = queue_md ? queue_md->id : CXI_MD_NONE,
+	};
+	bool passthrough = !!(eq->attr.flags & CXI_EQ_PASSTHROUGH);
+	bool is_user = eq->attr.flags & CXI_EQ_USER;
+	int rc = 0;
+
+	if (!queue_len || queue_len > MAX_EQ_LEN || !queue)
+		return -EINVAL;
+
+	/* Queue buffer address and length must be page aligned. */
+	if (!IS_ALIGNED((uintptr_t)queue, PAGE_SIZE))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(queue_len, PAGE_SIZE))
+		return -EINVAL;
+
+	mutex_lock(&eq->resize_mutex);
+
+	eq->resize.md = queue_md;
+	eq->resize.events = queue;
+	eq->resize.events_len = queue_len;
+
+	if (passthrough) {
+		if (is_user) {
+			rc = get_dma_addr_if_contig(hw, queue, queue_len,
+						    DMA_FROM_DEVICE,
+						    &eq->resize.pages,
+						    &eq->resize.dma_addr);
+		} else {
+			eq->resize.dma_addr = dma_map_single(&hw->cdev.pdev->dev,
+							     eq->resize.events,
+							     eq->resize.events_len,
+							     DMA_FROM_DEVICE);
+			if (dma_mapping_error(&hw->cdev.pdev->dev, eq->resize.dma_addr))
+				rc = -ENOMEM;
+		}
+
+		if (rc)
+			goto unlock;
+	} else {
+		eq->resize.dma_addr = queue_md->iova;
+	}
+
+	cmd.dma_addr = eq->resize.dma_addr;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, NULL);
+	if (rc)
+		goto unmap_dma;
+
+	eq->resized = true;
+	mutex_unlock(&eq->resize_mutex);
+
+	return 0;
+unmap_dma:
+	if (passthrough) {
+		if (is_user)
+			put_pages_contig(hw, &eq->resize);
+		else
+			dma_unmap_single(&hw->cdev.pdev->dev, eq->resize.dma_addr,
+					 eq->resize.events_len, DMA_FROM_DEVICE);
+	}
+unlock:
+	mutex_unlock(&eq->resize_mutex);
+	return rc;
+}
+
+int cxi_eq_resize_internal(struct cxi_eq *evtq, void *queue,
+			   size_t queue_len, struct cxi_md *queue_md,
+			   dma_addr_t dma_addr)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_lni_priv *lni_priv = eq->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_md_priv *md_priv;
+	int rc = 0;
+	int passthrough = !!(eq->attr.flags & CXI_EQ_PASSTHROUGH);
+	bool is_vf = lni_priv->is_vf;
+
+	if (!cdev->is_physfn)
+		return -EOPNOTSUPP;
+
+	if (!queue_len || queue_len > MAX_EQ_LEN)
+		return -EINVAL;
+
+	if ((!is_vf && !queue) || (is_vf && !dma_addr))
+		return -EINVAL;
+
+	/* Queue buffer address and length must be page aligned. */
+	if ((!is_vf && !IS_ALIGNED((uintptr_t)queue, PAGE_SIZE)) ||
+	    (is_vf && !IS_ALIGNED(dma_addr, PAGE_SIZE)))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(queue_len, PAGE_SIZE))
+		return -EINVAL;
+
+	if (!is_vf && !passthrough) {
+		if (!queue_md || !CXI_MD_CONTAINS(queue_md, queue, queue_len)) {
+			cxidev_err(cdev, "MD does not contain queue buffer\n");
+			return -EINVAL;
+		}
+
+		if (eq->active.md->lac != queue_md->lac) {
+			cxidev_err(cdev, "New buffer AC does not match EQ\n");
+			return -EINVAL;
+		}
+	}
+
+	mutex_lock(&eq->resize_mutex);
+
+	if (eq->resized) {
+		rc = -EINVAL;
+		goto unlock;
+	}
+
+	eq->resize.md = queue_md;
+	eq->resize.events = queue;
+	eq->resize.events_len = queue_len;
+
+	if (!is_vf) {
+		if (passthrough) {
+			if (eq->attr.flags & CXI_EQ_USER) {
+				rc = get_dma_addr_if_contig(hw, queue, queue_len,
+							    DMA_FROM_DEVICE,
+							    &eq->resize.pages,
+							    &eq->resize.dma_addr);
+			} else {
+				eq->resize.dma_addr = dma_map_single(&hw->cdev.pdev->dev,
+								     queue, queue_len,
+								     DMA_FROM_DEVICE);
+				if (dma_mapping_error(&hw->cdev.pdev->dev, eq->resize.dma_addr))
+					rc = -ENOMEM;
+				else
+					rc = 0;
+			}
+
+			if (rc)
+				goto unlock;
+		} else {
+			eq->resize.dma_addr = CXI_VA_TO_IOVA(queue_md, queue);
+			md_priv = container_of(eq->resize.md, struct cxi_md_priv, md);
+			refcount_inc(&md_priv->refcount);
+		}
+	} else if (!passthrough) {
+		md_priv = container_of(queue_md, struct cxi_md_priv, md);
+		refcount_inc(&md_priv->refcount);
+		eq->resize.dma_addr = dma_addr;
+	}
+
+	if (eq->cfg.use_buffer_b) {
+		eq->cfg.buffer_a_size = queue_len >> C_ADDR_SHIFT;
+		eq->cfg.buffer_a_en   = 1;
+		eq->cfg.buffer_a_addr = eq->resize.dma_addr >> C_ADDR_SHIFT;
+		eq->cfg.use_buffer_b = 0;
+	} else {
+		eq->cfg.buffer_b_size = queue_len >> C_ADDR_SHIFT;
+		eq->cfg.buffer_b_en   = 1;
+		eq->cfg.buffer_b_addr = eq->resize.dma_addr >> C_ADDR_SHIFT;
+		eq->cfg.use_buffer_b = 1;
+	}
+
+	/* Reconfigure EQ status settings using new queue length. */
+	eq_status_config(eq, queue_len / C_EE_CFG_ECB_SIZE);
+
+	/* Re-write the EQ descriptor with the new buffer description. Read
+	 * back the descriptor to ensure it has been updated before returning
+	 * to the client in order to guarantee that a subsequent client write
+	 * to EQ_SW_STATE will force the resize to be processed by the device.
+	 */
+	spin_lock(&hw->eq_shadow_lock);
+	cass_shadow_write(hw, C_EE_BASE, C_EE_CFG_EQ_DESCRIPTOR(eq->eq.eqn),
+			  &eq->cfg, sizeof(eq->cfg));
+	cass_shadow_read(hw, C_EE_BASE, C_EE_CFG_EQ_DESCRIPTOR(eq->eq.eqn),
+			 &eq->cfg,
+			 sizeof(eq->cfg));
+	spin_unlock(&hw->eq_shadow_lock);
+
+	eq->resized = true;
+
+	mutex_unlock(&eq->resize_mutex);
+
+	return 0;
+
+unlock:
+	mutex_unlock(&eq->resize_mutex);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_eq_resize_internal);
+
+/* cxi_eq_resize() - Resize a CXI Event Queue buffer.
+ *
+ * Resizing an Event Queue is a multi-step process. The first step is to call
+ * cxi_eq_resize() to pass a new event buffer to the device. After this call,
+ * evtq will continue to reference the old EQ buffer. The device may write a
+ * small number of events to the old EQ buffer followed by a special
+ * C_EVENT_EQ_SWITCH event to indicate that hardware has transitioned to
+ * writing to the new EQ buffer. When this event is detected, software must
+ * call cxi_eq_resize_complete() in order to start reading events from the new
+ * EQ buffer.
+ *
+ * The new event queue buffer must use the same translation mechanism as was
+ * used to allocate the EQ. If translation is used, the Addressing Context (AC)
+ * used by the new MD must match the MD used to allocate the EQ.
+ *
+ * The new event queue buffer must be cleared before calling cxi_eq_resize().
+ *
+ * @evtq: The Event Queue to resize.
+ * @queue: The new event queue buffer. Must be page aligned.
+ * @queue_len: The new event queue buffer length in bytes. Must be page aligned.
+ * @queue_md: The new event queue memory descriptor.
+ *
+ * Return: On success, 0 is returned and a resized buffer has been
+ * submitted to the device.
+ */
+int cxi_eq_resize(struct cxi_eq *evtq, void *queue, size_t queue_len,
+		  struct cxi_md *queue_md)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_lni_priv *lni_priv = eq->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+
+	if (cdev->is_physfn)
+		return cxi_eq_resize_internal(evtq, queue, queue_len, queue_md, 0);
+	else
+		return cxi_eq_resize_vf(evtq, queue, queue_len, queue_md);
+}
+EXPORT_SYMBOL(cxi_eq_resize);
+
+static int cxi_eq_resize_complete_vf(struct cxi_eq *evtq)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_dev *cdev = eq->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const struct cxi_eq_resize_complete_cmd cmd = {
+		.op = CXI_OP_EQ_RESIZE_COMPLETE,
+		.eq_hndl = evtq->eqn,
+	};
+	int rc;
+
+	mutex_lock(&eq->resize_mutex);
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, NULL);
+	if (rc)
+		goto unlock;
+
+	if (eq->attr.flags & CXI_EQ_PASSTHROUGH) {
+		if (eq->attr.flags & CXI_EQ_USER)
+			put_pages_contig(hw, &eq->active);
+		else
+			dma_unmap_single(&hw->cdev.pdev->dev, eq->active.dma_addr,
+					 eq->active.events_len, DMA_FROM_DEVICE);
+	}
+
+	eq->active = eq->resize;
+	eq->resized = false;
+	cxi_eq_init(evtq, eq->active.events, eq->active.events_len, eq->eq.eqn,
+		    (__force u64 *)(hw->regs + C_MEMORG_EE +
+				    eq->eq.eqn * C_EE_SW_STATE_PAGE_SIZE));
+	evtq->sw_state.reading_buffer_b = !evtq->sw_state.reading_buffer_b;
+
+unlock:
+	mutex_unlock(&eq->resize_mutex);
+	return rc;
+}
+
+/**
+ * cxi_eq_resize_complete() - Complete resizing a CXI Event Queue buffer.
+ *
+ * cxi_eq_resize_complete() must be called after an EQ has been resized
+ * using cxi_eq_resize() and a C_EVENT_EQ_SWITCH event was delivered. See
+ * the documentation for cxi_eq_resize().
+ *
+ * @evtq: The Event Queue to being resized.
+ *
+ * Return: On success, 0 is returned and evtq references the new, resized
+ * buffer.
+ */
+int cxi_eq_resize_complete(struct cxi_eq *evtq)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_lni_priv *lni_priv = eq->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_md_priv *md_priv;
+	bool is_vf = lni_priv->is_vf;
+
+	if (!cdev->is_physfn)
+		return cxi_eq_resize_complete_vf(evtq);
+
+	mutex_lock(&eq->resize_mutex);
+
+	if (!eq->resized) {
+		mutex_unlock(&eq->resize_mutex);
+		return -EINVAL;
+	}
+
+	if (!is_vf) {
+		if (eq->attr.flags & CXI_EQ_PASSTHROUGH) {
+			if (eq->attr.flags & CXI_EQ_USER)
+				put_pages_contig(hw, &eq->active);
+			else
+				dma_unmap_single(&hw->cdev.pdev->dev, eq->active.dma_addr,
+						 eq->active.events_len, DMA_FROM_DEVICE);
+		} else {
+			md_priv = container_of(eq->active.md, struct cxi_md_priv, md);
+			refcount_dec(&md_priv->refcount);
+		}
+	} else if (!(eq->attr.flags & CXI_EQ_PASSTHROUGH)) {
+		md_priv = container_of(eq->active.md, struct cxi_md_priv, md);
+		refcount_dec(&md_priv->refcount);
+	}
+
+	eq->active = eq->resize;
+
+	eq->attr.queue = eq->active.events;
+	eq->attr.queue_len = eq->active.events_len;
+
+	eq->queue_size = get_eq_queue_size(eq->active.events_len);
+
+	/* Re-initialize the user evtq to reference new buffer */
+	cxi_eq_init(evtq, eq->active.events, eq->active.events_len, eq->eq.eqn,
+		    (__force u64 *)(hw->regs + C_MEMORG_EE +
+				    eq->eq.eqn * C_EE_SW_STATE_PAGE_SIZE));
+	evtq->sw_state.reading_buffer_b = !evtq->sw_state.reading_buffer_b;
+
+	eq->resized = false;
+
+	mutex_unlock(&eq->resize_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_eq_resize_complete);
+
+/* Register the PCT EQ in all 3 places */
+static void set_pct_eq(struct cass_dev *hw, unsigned int eq_n)
+{
+	union c_pct_cfg_eq_retry_q_handle rh_q = {
+		.eq_handle = eq_n,
+	};
+
+	cass_write(hw, C_PCT_CFG_EQ_RETRY_Q_HANDLE, &rh_q, sizeof(rh_q));
+	cass_write(hw, C_PCT_CFG_EQ_TGT_Q_HANDLE, &rh_q, sizeof(rh_q));
+	cass_write(hw, C_PCT_CFG_EQ_CONN_LD_Q_HANDLE, &rh_q, sizeof(rh_q));
+}
+
+/* Return an available event queue with an ID */
+static struct cxi_eq_priv *pf_get_eq_id(struct cxi_lni_priv *lni_priv)
+{
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_eq_priv *eq;
+	int rc;
+
+	/* Try to reuse an existing EQ that was put on the cleanup list */
+	spin_lock(&lni_priv->res_lock);
+
+	eq = list_first_entry_or_null(&lni_priv->eq_cleanups_list,
+				      struct cxi_eq_priv, list);
+	if (eq)
+		list_del(&eq->list);
+
+	spin_unlock(&lni_priv->res_lock);
+
+	if (eq) {
+		memset(&eq->cfg, 0, sizeof(eq->cfg));
+		eq->reused = true;
+		return eq;
+	}
+
+	/* Check the associated service to see if this EQ can be
+	 * allocated.
+	 */
+	rc = cxi_rgroup_alloc_resource(lni_priv->rgroup, CXI_RESOURCE_EQ);
+	if (rc)
+		return ERR_PTR(rc);
+
+	eq = kzalloc(sizeof(*eq), GFP_KERNEL);
+	if (eq == NULL) {
+		rc = -ENOMEM;
+		goto dec_rsrc_use;
+	}
+
+	/* Get event queue ID */
+	rc = ida_alloc_range(&hw->eq_index_table, 1, C_NUM_EQS - 1, GFP_KERNEL);
+	if (rc < 0) {
+		cxidev_err(cdev, "ida_alloc_range failed %d\n", rc);
+		goto eq_free;
+	}
+
+	eq->eq.eqn = rc;
+
+	return eq;
+
+eq_free:
+	kfree(eq);
+
+dec_rsrc_use:
+	cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_EQ);
+
+	return ERR_PTR(rc);
+}
+
+/* Free an EQ allocated with pf_get_eq_id */
+static void pf_put_eq_id(struct cxi_eq_priv *eq)
+{
+	struct cxi_lni_priv *lni_priv = eq->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (eq->reused) {
+		spin_lock(&lni_priv->res_lock);
+		list_add_tail(&eq->list, &lni_priv->eq_cleanups_list);
+		spin_unlock(&lni_priv->res_lock);
+	} else {
+		ida_free(&hw->eq_index_table, eq->eq.eqn);
+		cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_EQ);
+		kfree(eq);
+	}
+}
+
+/* Prepare and write the EQ config to the adapter */
+static int pf_write_eq_config(struct cxi_eq_priv *eq, bool is_vf,
+			      int vf_event_irq_idx, int vf_status_irq_idx)
+{
+	struct cxi_dev *cdev = eq->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_ee_cfg_init_eq_hw_state init_eq_hw_state;
+	unsigned int eq_n = eq->eq.eqn;
+	const struct cxi_eq_attr *attr = &eq->attr;
+	void __iomem *csr;
+	int rc;
+
+	if (is_vf && vf_event_irq_idx >= 0) {
+		eq->cfg.event_int_idx = vf_event_irq_idx;
+		eq->cfg.event_int_en = 1;
+	} else if (!is_vf && eq->event_cb) {
+		eq->cfg.event_int_idx = eq->event_msi_irq->idx;
+		eq->cfg.event_int_en = 1;
+	}
+
+	if (is_vf && vf_status_irq_idx >= 0) {
+		eq->cfg.eq_sts_int_idx = vf_status_irq_idx;
+		eq->cfg.eq_sts_int_en = 1;
+	} else if (!is_vf && eq->status_cb) {
+		eq->cfg.eq_sts_int_idx = eq->status_msi_irq->idx;
+		eq->cfg.eq_sts_int_en = 1;
+	}
+
+	if (eq->attr.flags & CXI_EQ_PASSTHROUGH) {
+		eq->cfg.acid = eq->lni_priv->phys_ac;
+		eq->cfg.buffer_a_addr = eq->active.dma_addr >> C_ADDR_SHIFT;
+	} else {
+		struct cxi_md_priv *md_priv =
+			container_of(eq->active.md, struct cxi_md_priv, md);
+
+		eq->cfg.acid = md_priv->cac->ac.acid;
+		eq->cfg.buffer_a_addr =
+			CXI_VA_TO_IOVA(eq->active.md, eq->active.events) >>
+			C_ADDR_SHIFT;
+	}
+
+	eq->cfg.buffer_a_size = eq->active.events_len >> C_ADDR_SHIFT;
+	eq->cfg.buffer_a_en = 1;
+	eq->cfg.eq_enable = 1;
+
+	rc = is_valid_eq_reserved_fc(eq, eq->attr.reserved_slots);
+	if (rc)
+		return rc;
+	eq->cfg.reserved_fc = eq->attr.reserved_slots;
+
+	eq_status_config(eq, eq->queue_size);
+
+	eq->cfg.eq_sts_dropped_en =
+		eq->attr.flags & CXI_EQ_DROP_STATUS_DISABLE ? 0 : 1;
+
+	if (eq->attr.flags & CXI_EQ_EC_DISABLE) {
+		/* Disable all event combining. */
+		eq->cfg.latency_tolerance = 0;
+	} else if (attr->ec_delay) {
+		/* Set custom ECB expiration delay. */
+		eq->cfg.latency_tolerance = eq_compute_lt(hw, attr->ec_delay);
+	} else {
+		/* Use default ECB expiration configuration. */
+		eq->cfg.latency_tolerance =
+			eq_compute_lt(hw, LATENCY_TOLERANCE_DEF_NS);
+	}
+
+	mutex_lock(&hw->init_eq_hw_state);
+
+	/* Wait for C_EE_CFG_INIT_EQ_HW_STATE to be ready for use */
+	csr = cass_csr(hw, C_EE_CFG_INIT_EQ_HW_STATE);
+	rc = readq_poll_timeout(csr, init_eq_hw_state.qw,
+				init_eq_hw_state.pending == 0, 1, 1000);
+	if (rc) {
+		cxidev_warn_once(cdev, "C_EE_CFG_INIT_EQ_HW_STATE was still pending.\n");
+		mutex_unlock(&hw->init_eq_hw_state);
+		return rc;
+	}
+
+	/* Ensure no other PCT EQ exist before activating it. */
+	if (attr->flags & CXI_EQ_REGISTER_PCT) {
+		if (hw->pct_eq_n != C_EQ_NONE) {
+			mutex_unlock(&hw->init_eq_hw_state);
+			return -EEXIST;
+		}
+
+		hw->pct_eq_n = eq_n;
+	}
+
+	/* Write EQ configuration to hardware */
+	spin_lock(&hw->eq_shadow_lock);
+
+	cass_eq_init(hw, eq_n, eq->lni_priv->lni.rgid, &eq->cfg,
+		     attr->flags & CXI_EQ_INIT_LONG,
+		     attr->flags & CXI_EQ_TGT_LONG);
+
+	if (attr->flags & CXI_EQ_TIMESTAMP_EVENTS)
+		eq_timestamp_toggle(hw, eq_n, true);
+
+	spin_unlock(&hw->eq_shadow_lock);
+
+	if (attr->flags & CXI_EQ_REGISTER_PCT) {
+		/* The EQ is reserved, and up and running now. The PCT
+		 * EQ can be programmed.
+		 */
+		set_pct_eq(hw, eq_n);
+	}
+
+	mutex_unlock(&hw->init_eq_hw_state);
+
+	return 0;
+}
+
+static int eq_mmio_map(struct cass_dev *hw, void __iomem **eq_mmio, int eq_idx)
+{
+	phys_addr_t mmio_phys = hw->regs_base + C_MEMORG_EE +
+		eq_idx * C_EE_SW_STATE_PAGE_SIZE;
+
+	*eq_mmio = ioremap(mmio_phys, PAGE_SIZE);
+	if (!*eq_mmio) {
+		cxidev_warn_once(&hw->cdev, "ioremap failed");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+/**
+ * cass_eq_attach_irqs() - Attach event and status interrupt handlers to an EQ.
+ *
+ * @eq: Event queue structure
+ * @hw: Cassini device
+ * @cpus: CPU mask for IRQ affinity
+ * @event_cb: Event interrupt callback
+ * @event_cb_data: Event callback data
+ * @status_cb: Status interrupt callback
+ * @status_cb_data: Status callback data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int cass_eq_attach_irqs(struct cxi_eq_priv *eq, struct cass_dev *hw,
+			       struct cpumask *cpus,
+			       void (*event_cb)(void *cb_data), void *event_cb_data,
+			       void (*status_cb)(void *cb_data), void *status_cb_data)
+{
+	struct cass_irq *irq;
+	int rc = 0;
+
+	eq->event_cb = event_cb;
+	eq->event_cb_data = event_cb_data;
+	eq->status_cb = status_cb;
+	eq->status_cb_data = status_cb_data;
+	if (event_cb) {
+		eq->event_nb.notifier_call = eq_event_nb;
+
+		irq = cass_comp_irq_attach(hw, cpus, &eq->event_nb);
+		if (IS_ERR(irq)) {
+			rc = PTR_ERR(irq);
+			goto out;
+		}
+		eq->event_msi_irq = irq;
+	} else {
+		eq->event_msi_irq = NULL;
+	}
+
+	if (status_cb) {
+		eq->status_nb.notifier_call = eq_status_nb;
+
+		irq = cass_comp_irq_attach(hw, cpus, &eq->status_nb);
+		if (IS_ERR(irq)) {
+			rc = PTR_ERR(irq);
+			goto event_irq_detach;
+		}
+		eq->status_msi_irq = irq;
+	} else {
+		eq->status_msi_irq = NULL;
+	}
+
+	return 0;
+
+event_irq_detach:
+	if (eq->event_msi_irq)
+		cass_comp_irq_detach(hw, eq->event_msi_irq, &eq->event_nb);
+out:
+	return rc;
+}
+
+static struct cxi_eq *cxi_eq_alloc_vf(struct cxi_lni *lni, const struct cxi_md *md,
+				      const struct cxi_eq_attr *attr,
+				      void (*event_cb)(void *cb_data),
+				      void *event_cb_data,
+				      void (*status_cb)(void *cb_data),
+				      void *status_cb_data)
+{
+	struct cxi_dev *dev = container_of(lni, struct cxi_lni_priv, lni)->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_eq_priv *eq;
+	bool passthrough = !!(attr->flags & CXI_EQ_PASSTHROUGH);
+	struct cxi_eq_alloc_cmd_vf cmd = {
+		.base.op = CXI_OP_EQ_ALLOC,
+		.base.lni = lni->id,
+		.base.attr = *attr,
+		/* We explicitly tell PF to do nothing with these fields */
+		.base.queue_md = (!passthrough && md) ? md->id : CXI_MD_NONE,
+		.base.event_wait = CXI_WAIT_NONE,
+		.base.status_wait = CXI_WAIT_NONE,
+	};
+	struct cxi_eq_alloc_resp resp;
+	size_t resp_len = sizeof(resp);
+	bool is_user = attr->flags & CXI_EQ_USER;
+	struct cpumask cpus = {};
+	struct cxi_eq_attr cmd_attr = *attr;
+	int rc;
+
+	if (!passthrough && !md) {
+		cxidev_err(dev, "EQ_ALLOC(VF): missing MD for non-passthrough\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* Queue buffer address and length must be page aligned. */
+	if (!IS_ALIGNED((uintptr_t)attr->queue, PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	if (!IS_ALIGNED(attr->queue_len, PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	if (!passthrough) {
+		cmd_attr.queue = (void *)(uintptr_t)
+			((uintptr_t)attr->queue - (uintptr_t)md->va);
+	}
+
+	eq = kzalloc(sizeof(*eq), GFP_KERNEL);
+	if (!eq)
+		return ERR_PTR(-ENOMEM);
+
+	eq->attr = *attr;
+	eq->lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	eq->active.md = md;
+	eq->active.events = eq->attr.queue;
+	eq->active.events_len = eq->attr.queue_len;
+	eq->queue_size = get_eq_queue_size(eq->active.events_len);
+	mutex_init(&eq->resize_mutex);
+	eq->resized = false;
+
+	if (eq->attr.cpu_affinity < nr_cpumask_bits)
+		cpumask_set_cpu(eq->attr.cpu_affinity, &cpus);
+
+	rc = cass_eq_attach_irqs(eq, hw, &cpus, event_cb, event_cb_data, status_cb, status_cb_data);
+	if (rc)
+		goto free_eq_alloc;
+
+	if (passthrough) {
+		if (is_user) {
+			rc = get_dma_addr_if_contig(hw, eq->active.events,
+						    eq->active.events_len,
+						    DMA_FROM_DEVICE,
+						    &eq->active.pages,
+						    &eq->active.dma_addr);
+		} else {
+			eq->active.dma_addr = dma_map_single(&hw->cdev.pdev->dev,
+							     eq->active.events,
+							     eq->active.events_len,
+							     DMA_FROM_DEVICE);
+			if (dma_mapping_error(&hw->cdev.pdev->dev, eq->active.dma_addr))
+				rc = -ENOMEM;
+		}
+
+		if (rc)
+			goto free_irqs;
+	} else {
+		eq->active.dma_addr = md->iova;
+	}
+
+	cmd.dma_addr = eq->active.dma_addr;
+	/* ... and instead give it the IRQ indices */
+	cmd.event_irq_idx = eq->event_msi_irq ? eq->event_msi_irq->idx : -1;
+	cmd.status_irq_idx = eq->status_msi_irq ? eq->status_msi_irq->idx : -1;
+	cmd.base.attr = cmd_attr;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		goto free_dma_map;
+
+	eq->eq.eqn = resp.eq;
+
+	if (!is_user) {
+		rc = eq_mmio_map(hw, &eq->eq_mmio, eq->eq.eqn);
+		if (rc) {
+			cxi_eq_free(&eq->eq);
+			return ERR_PTR(rc);
+		}
+	}
+
+	cxi_eq_init(&eq->eq, eq->active.events, eq->active.events_len,
+		    eq->eq.eqn, (__force u64 *)eq->eq_mmio);
+
+	return &eq->eq;
+
+free_dma_map:
+	if (passthrough) {
+		if (is_user)
+			put_pages_contig(hw, &eq->active);
+		else
+			dma_unmap_single(&hw->cdev.pdev->dev, eq->active.dma_addr,
+					 eq->active.events_len, DMA_FROM_DEVICE);
+	}
+free_irqs:
+	if (eq->event_msi_irq)
+		cass_comp_irq_detach(hw, eq->event_msi_irq, &eq->event_nb);
+	if (eq->status_msi_irq)
+		cass_comp_irq_detach(hw, eq->status_msi_irq, &eq->status_nb);
+free_eq_alloc:
+	kfree(eq);
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_eq_alloc_internal() - Allocate a new event queue resource.
+ *
+ * @lni: LNI to associate with the event queue.
+ * @md: Memory descriptor for the queue
+ * @attr: Event queue creation attributes.
+ * @event_cb: Event interrupt callback for that EQ.
+ * @event_cb_data: Opaque owner context pointer. Can be used in the event
+ *                 interrupt callback to retrieve some internal structures.
+ * @status_cb: Status interrupt callback for that EQ.
+ * @status_cb_data: Opaque owner context pointer. Can be used in the status
+ *                  interrupt callback to retrieve some internal structures.
+ * @dma_addr: DMA address of the event queue buffer. NULL if not provided.
+ * @event_irq_idx: Event IRQ index for VF EQ allocation. Use -1 for PF EQ allocation.
+ * @status_irq_idx: Status IRQ index for VF EQ allocation. Use -1 for PF EQ allocation.
+ *
+ * Return: On success, a pointer to the allocated event queue structure. On
+ * error, an error pointer containing a negative error number.
+ */
+struct cxi_eq *cxi_eq_alloc_internal(struct cxi_lni *lni, const struct cxi_md *md,
+				     const struct cxi_eq_attr *attr,
+				     void (*event_cb)(void *cb_data),
+				     void *event_cb_data,
+				     void (*status_cb)(void *cb_data),
+				     void *status_cb_data, dma_addr_t dma_addr,
+				     int event_irq_idx, int status_irq_idx)
+{
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_eq_priv *eq;
+	struct cxi_md_priv *md_priv = NULL;
+	int eq_n;
+	int rc;
+	bool passthrough = !!(attr->flags & CXI_EQ_PASSTHROUGH);
+	bool is_user = attr->flags & CXI_EQ_USER;
+	struct cpumask cpus = {};
+	bool is_vf = lni_priv->is_vf;
+	u8 vf_num = lni_priv->vf_num;
+
+	if (!attr->queue_len || attr->queue_len > MAX_EQ_LEN ||
+	    (!attr->queue && !(is_vf && !passthrough)))
+		return ERR_PTR(-EINVAL);
+
+	/* If status updates are enabled, ensure all requested updates are in
+	 * the range [0-100].
+	 */
+	if (attr->status_thresh_count &&
+	    (attr->status_thresh_count > 4 ||
+	     attr->status_thresh_base > 100 ||
+	     attr->status_thresh_delta > 100 ||
+	     ((attr->status_thresh_count - 1) * attr->status_thresh_delta +
+	      (100 - attr->status_thresh_base)) > 100))
+		return ERR_PTR(-EINVAL);
+
+	/* Queue buffer address and length must be page aligned. */
+	if (!IS_ALIGNED((uintptr_t)attr->queue, PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	if (!IS_ALIGNED(attr->queue_len, PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	/* If using EQ translation, the MD must cover the aligned buffer. */
+	if (!passthrough &&
+	    (!md ||
+	     !CXI_MD_CONTAINS(md, attr->queue, attr->queue_len)))
+		return ERR_PTR(-EINVAL);
+
+	/* Only admin can create the EQ for PCT */
+	if ((attr->flags & CXI_EQ_REGISTER_PCT) && !capable(CAP_SYS_ADMIN))
+		return ERR_PTR(-EPERM);
+
+	if ((size_t)attr->reserved_slots >
+	    (get_eq_queue_size(attr->queue_len) - 1))
+		return ERR_PTR(-EINVAL);
+
+	eq = pf_get_eq_id(lni_priv);
+	if (IS_ERR(eq))
+		return ERR_PTR(PTR_ERR(eq));
+
+	eq_n = eq->eq.eqn;
+
+	eq->attr = *attr;
+	eq->lni_priv = lni_priv;
+	eq->active.md = md;
+	eq->active.events = eq->attr.queue;
+	eq->active.events_len = eq->attr.queue_len;
+	eq->queue_size = get_eq_queue_size(eq->active.events_len);
+	mutex_init(&eq->resize_mutex);
+	eq->resized = false;
+
+	refcount_set(&eq->refcount, 1);
+
+	if (!is_user && !is_vf) {
+		phys_addr_t mmio_phys = hw->regs_base + C_MEMORG_EE +
+				eq_n * C_EE_SW_STATE_PAGE_SIZE;
+		eq->eq_mmio = ioremap(mmio_phys, PAGE_SIZE);
+		if (!eq->eq_mmio) {
+			cxidev_warn_once(cdev, "ioremap failed\n");
+			rc = -EFAULT;
+			goto id_remove;
+		}
+	}
+
+	if (!is_vf && eq->attr.cpu_affinity < nr_cpumask_bits)
+		cpumask_set_cpu(eq->attr.cpu_affinity, &cpus);
+
+	if (!is_vf) {
+		rc = cass_eq_attach_irqs(eq, hw, &cpus, event_cb, event_cb_data,
+					 status_cb, status_cb_data);
+		if (rc)
+			goto eq_unmap;
+
+		if (passthrough) {
+			if (is_user) {
+				rc = get_dma_addr_if_contig(hw, eq->active.events,
+							    eq->active.events_len,
+							    DMA_FROM_DEVICE,
+							    &eq->active.pages,
+							    &eq->active.dma_addr);
+			} else {
+				eq->active.dma_addr = dma_map_single(&hw->cdev.pdev->dev,
+								     eq->active.events,
+								     eq->active.events_len,
+								     DMA_FROM_DEVICE);
+				if (dma_mapping_error(&hw->cdev.pdev->dev, eq->active.dma_addr))
+					rc = -ENOMEM;
+				else
+					rc = 0;
+			}
+
+			if (rc)
+				goto status_irq_detach;
+		} else {
+			md_priv = container_of(eq->active.md, struct cxi_md_priv, md);
+
+			refcount_inc(&md_priv->refcount);
+		}
+	} else {
+		if (passthrough) {
+			/* VF EQ passthrough: use dma_addr from the VF */
+			eq->active.dma_addr = dma_addr;
+		} else {
+			md_priv = container_of(eq->active.md, struct cxi_md_priv, md);
+			refcount_inc(&md_priv->refcount);
+		}
+	}
+
+	cxi_eq_init(&eq->eq, eq->active.events, eq->active.events_len,
+		    eq_n, (__force u64 *)eq->eq_mmio);
+
+	if (!is_user && !is_vf)
+		memset(eq->active.events, 0, eq->active.events_len);
+
+	rc = pf_write_eq_config(eq, is_vf, event_irq_idx, status_irq_idx);
+	if (rc)
+		goto free_md;
+
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&eq->list, &lni_priv->eq_list);
+	spin_unlock(&lni_priv->res_lock);
+
+	if (!eq->reused) {
+		atomic_inc(&hw->stats.eq);
+
+		eq_debugfs_create(eq_n, eq, hw, lni_priv);
+
+		refcount_inc(&lni_priv->refcount);
+	}
+
+	/* Grant access to the resource from the VF */
+	if (is_vf)
+		cass_config_sriovt(hw, true, vf_num, 4096 + eq_n);
+
+	return &eq->eq;
+
+free_md:
+	if (passthrough) {
+		if (!is_vf) {
+			if (is_user)
+				put_pages_contig(hw, &eq->active);
+			else
+				dma_unmap_single(&hw->cdev.pdev->dev, eq->active.dma_addr,
+						 eq->attr.queue_len, DMA_FROM_DEVICE);
+		}
+	} else {
+		refcount_dec(&md_priv->refcount);
+	}
+
+status_irq_detach:
+	if (eq->status_msi_irq)
+		cass_comp_irq_detach(hw, eq->status_msi_irq, &eq->status_nb);
+	if (eq->event_msi_irq)
+		cass_comp_irq_detach(hw, eq->event_msi_irq, &eq->event_nb);
+eq_unmap:
+	if (!is_user)
+		iounmap(eq->eq_mmio);
+id_remove:
+	pf_put_eq_id(eq);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL(cxi_eq_alloc_internal);
+
+/**
+ * cxi_eq_alloc() - Allocate a new event queue resource.
+ *
+ * @lni: LNI to associate with the event queue.
+ * @md: Memory descriptor for the queue
+ * @attr: Event queue creation attributes.
+ * @event_cb: Event interrupt callback for that EQ.
+ * @event_cb_data: Opaque owner context pointer. Can be used in the event
+ *                 interrupt callback to retrieve some internal structures.
+ * @status_cb: Status interrupt callback for that EQ.
+ * @status_cb_data: Opaque owner context pointer. Can be used in the status
+ *                  interrupt callback to retrieve some internal structures.
+ *
+ * Return: On success, a pointer to the allocated event queue structure. On
+ * error, an error pointer containing a negative error number.
+ */
+struct cxi_eq *cxi_eq_alloc(struct cxi_lni *lni, const struct cxi_md *md,
+			    const struct cxi_eq_attr *attr,
+			    void (*event_cb)(void *cb_data),
+			    void *event_cb_data,
+			    void (*status_cb)(void *cb_data),
+			    void *status_cb_data)
+{
+	struct cxi_dev *dev = container_of(lni, struct cxi_lni_priv, lni)->dev;
+
+	if (!dev->is_physfn)
+		return cxi_eq_alloc_vf(lni, md, attr,
+				       event_cb, event_cb_data,
+				       status_cb, status_cb_data);
+
+	return cxi_eq_alloc_internal(lni, md, attr,
+				     event_cb, event_cb_data,
+				     status_cb, status_cb_data, 0, -1, -1);
+}
+EXPORT_SYMBOL(cxi_eq_alloc);
+
+/** cxi_eq_free_vf() - Free VF event queue resource.
+ *
+ * @evtq: A pointer to previously allocated event queue structure.
+ *
+ * Return: On success, returns zero.
+ */
+static int cxi_eq_free_vf(struct cxi_eq *evtq)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_dev *cdev = container_of(&eq->lni_priv->lni, struct cxi_lni_priv_vf, lni)->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	bool passthrough = !!(eq->attr.flags & CXI_EQ_PASSTHROUGH);
+	bool is_user = eq->attr.flags & CXI_EQ_USER;
+	size_t resp_len = 0;
+	const struct cxi_eq_free_cmd cmd = {
+		.op = CXI_OP_EQ_FREE,
+		.eq = eq->eq.eqn,
+	};
+	int rc;
+
+	/* Send EQ free command to PF */
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return rc;
+
+	/* Detach IRQs */
+	if (eq->status_msi_irq)
+		cass_comp_irq_detach(hw, eq->status_msi_irq, &eq->status_nb);
+	if (eq->event_msi_irq)
+		cass_comp_irq_detach(hw, eq->event_msi_irq, &eq->event_nb);
+
+	/* Unmap EQ MMIO if not for user */
+	if (!is_user)
+		iounmap(eq->eq_mmio);
+
+	/* Unmap EQ buffer if passthrough */
+	if (passthrough) {
+		if (is_user) {
+			put_pages_contig(hw, &eq->active);
+			if (eq->resized)
+				put_pages_contig(hw, &eq->resize);
+		} else {
+			dma_unmap_single(&hw->cdev.pdev->dev,
+					 eq->active.dma_addr, eq->attr.queue_len,
+					 DMA_FROM_DEVICE);
+			if (eq->resized)
+				dma_unmap_single(&hw->cdev.pdev->dev,
+						 eq->resize.dma_addr,
+						 eq->resize.events_len,
+						 DMA_FROM_DEVICE);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * cxi_eq_free() - Free event queue resource.
+ *
+ * @evtq: A pointer to previously allocated event queue structure.
+ *
+ * Return: On success, returns zero.
+ */
+int cxi_eq_free(struct cxi_eq *evtq)
+{
+	struct cxi_eq_priv *eq;
+	struct cxi_dev *cdev;
+	struct cass_dev *hw;
+	struct cxi_lni_priv *lni_priv;
+	struct cxi_md_priv *md_priv;
+	bool passthrough;
+	bool is_user;
+	bool is_vf;
+	union c_ee_cfg_sts_eq_hw_state hw_state;
+	unsigned int wr_ptr;
+
+	if (!evtq)
+		return -EINVAL;
+
+	eq = container_of(evtq, struct cxi_eq_priv, eq);
+	cdev = eq->lni_priv->dev;
+
+	if (!cdev->is_physfn)
+		return cxi_eq_free_vf(evtq);
+
+	hw = container_of(cdev, struct cass_dev, cdev);
+	lni_priv = eq->lni_priv;
+	is_user = eq->attr.flags & CXI_EQ_USER;
+	is_vf = lni_priv->is_vf;
+	passthrough = !!(eq->attr.flags & CXI_EQ_PASSTHROUGH);
+
+	/* Remove access to this resource from a VF */
+	if (is_vf)
+		cass_config_sriovt(hw, false, lni_priv->vf_num, 4096 + eq->eq.eqn);
+
+	cxidev_WARN_ONCE(cdev, !refcount_dec_and_test(&eq->refcount),
+			 "Resource leaks - EQ refcount not zero: %d\n",
+			 refcount_read(&eq->refcount));
+
+	spin_lock(&lni_priv->res_lock);
+	list_del(&eq->list);
+	spin_unlock(&lni_priv->res_lock);
+
+	if (eq->attr.flags & CXI_EQ_REGISTER_PCT) {
+		set_pct_eq(hw, C_EQ_NONE);
+
+		mutex_lock(&hw->init_eq_hw_state);
+		hw->pct_eq_n = C_EQ_NONE;
+		mutex_unlock(&hw->init_eq_hw_state);
+	}
+
+	if (eq->status_msi_irq)
+		cass_comp_irq_detach(hw, eq->status_msi_irq, &eq->status_nb);
+
+	if (eq->event_msi_irq)
+		cass_comp_irq_detach(hw, eq->event_msi_irq, &eq->event_nb);
+
+	spin_lock(&hw->eq_shadow_lock);
+
+	if (eq->attr.flags & CXI_EQ_TIMESTAMP_EVENTS)
+		eq_timestamp_toggle(hw, eq->eq.eqn, false);
+
+	cass_eq_clear(hw, &eq->eq);
+
+	spin_unlock(&hw->eq_shadow_lock);
+
+	/* Wait for the EQ write pointer to stabilize before freeing
+	 * the buffer
+	 */
+	cass_read(hw, C_EE_CFG_STS_EQ_HW_STATE(eq->eq.eqn),
+		  &hw_state, sizeof(hw_state));
+	wr_ptr = hw_state.wr_ptr;
+	while (true) {
+		cass_read(hw, C_EE_CFG_STS_EQ_HW_STATE(eq->eq.eqn),
+			  &hw_state, sizeof(hw_state));
+		if (wr_ptr == hw_state.wr_ptr)
+			break;
+		wr_ptr = hw_state.wr_ptr;
+		udelay(1);
+	}
+
+	if (passthrough) {
+		if (!is_vf) {
+			if (is_user) {
+				put_pages_contig(hw, &eq->active);
+
+				if (eq->resized)
+					put_pages_contig(hw, &eq->resize);
+			} else {
+				dma_unmap_single(&hw->cdev.pdev->dev,
+						 eq->active.dma_addr, eq->attr.queue_len,
+						 DMA_FROM_DEVICE);
+				if (eq->resized)
+					dma_unmap_single(&hw->cdev.pdev->dev,
+							 eq->resize.dma_addr,
+							 eq->resize.events_len,
+							 DMA_FROM_DEVICE);
+			}
+		}
+	} else {
+		md_priv = container_of(eq->active.md, struct cxi_md_priv, md);
+		refcount_dec(&md_priv->refcount);
+
+		if (eq->resized) {
+			md_priv = container_of(eq->resize.md,
+					       struct cxi_md_priv, md);
+			refcount_dec(&md_priv->refcount);
+		}
+	}
+
+	if (!is_user)
+		iounmap(eq->eq_mmio);
+
+	/* Hang the EQ on the LNI pending deletion list, to be
+	 * released later
+	 */
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&eq->list, &lni_priv->eq_cleanups_list);
+	spin_unlock(&lni_priv->res_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_eq_free);
+
+/* Finish releasing all the EQs on the deletion pending list */
+void finalize_eq_cleanups(struct cxi_lni_priv *lni)
+{
+	struct cxi_dev *dev = lni->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_eq_priv *eq;
+
+	while ((eq = list_first_entry_or_null(&lni->eq_cleanups_list,
+					      struct cxi_eq_priv, list))) {
+		list_del(&eq->list);
+
+		debugfs_remove(eq->lni_dir);
+		debugfs_remove(eq->debug_file);
+
+		refcount_dec(&lni->refcount);
+		atomic_dec(&hw->stats.eq);
+		cxi_rgroup_free_resource(lni->rgroup, CXI_RESOURCE_EQ);
+		ida_free(&hw->eq_index_table, eq->eq.eqn);
+		kfree(eq);
+	}
+}
+
+/**
+ * cxi_eq_user_info() - Get userspace mmap info for an event queue.
+ *
+ * @evtq: A pointer to previously allocated event queue structure.
+ * @csr_addr: On success, will contain the address of the event queue CSRs.
+ * @csr_size: On success, will contain the size of the event queue CSRs.
+ *
+ * Return: On success, returns zero. On error, returns a negative error number.
+ */
+int cxi_eq_user_info(struct cxi_eq *evtq,
+		     phys_addr_t *csr_addr, size_t *csr_size)
+{
+	struct cxi_eq_priv *eq = container_of(evtq, struct cxi_eq_priv, eq);
+	struct cxi_dev *cdev = eq->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	/* Userspace needs the SW State descriptor CSR address */
+	*csr_addr = hw->regs_base + C_MEMORG_EE +
+		(eq->eq.eqn * C_EE_SW_STATE_PAGE_SIZE);
+	*csr_size = PAGE_SIZE;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_eq_user_info);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_nta.c b/drivers/net/ethernet/hpe/ss1/cass_nta.c
new file mode 100644
index 000000000000..416595de9500
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_nta.c
@@ -0,0 +1,1996 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/*
+ * Address Translation Unit (ATU) management
+ * Nic Translation Agent (NTA) mode
+ */
+
+#include <linux/interrupt.h>
+#include <linux/pci.h>
+#include <linux/types.h>
+#include <linux/hugetlb.h>
+#include <linux/iova.h>
+#include <linux/bvec.h>
+#include <linux/iopoll.h>
+#include <linux/workqueue.h>
+#include <linux/mmu_notifier.h>
+
+#include "cass_core.h"
+
+/* Default size of the root page table for a two level table.
+ * The root page table size is 2 ^ (PAGE_SHIFT + ac_size_dbl) (currently
+ * 16 KB) and covers 2 ^ ac_size_dbl GB.
+ */
+static int ac_size_dbl = 5;
+module_param(ac_size_dbl, int, 0644);
+MODULE_PARM_DESC(ac_size_dbl, "Default two level AC size");
+
+/* Default size of the root page table for a single level table.
+ * The root page table size is 2 ^ (PAGE_SHIFT + ac_size_sgl) (currently
+ * 8 MB) and covers 2 ^ ((PAGE_SHIFT * 2) + ac_size_sgl) bytes.
+ */
+static int ac_size_sgl = 8;
+module_param(ac_size_sgl, int, 0644);
+MODULE_PARM_DESC(ac_size_sgl, "Default one level AC size");
+
+static ulong min_iova_offset = 1UL * 1024 * 1024 * 1024;
+module_param(min_iova_offset, ulong, 0644);
+MODULE_PARM_DESC(min_iova_offset, "IOVA offset if VA range straddles AC");
+
+static int atucq_timeout_us = 100000;
+module_param(atucq_timeout_us, int, 0644);
+MODULE_PARM_DESC(atucq_timeout_us, "ATUCQ timeout in microseconds");
+
+static int decouple_timeout_us = 150;
+module_param(decouple_timeout_us, int, 0644);
+MODULE_PARM_DESC(decouple_timeout_us,
+		 "ATUCQ timeout in microseconds when decoupling is enabled");
+
+bool odp_sw_decouple = true;
+module_param(odp_sw_decouple, bool, 0644);
+MODULE_PARM_DESC(odp_sw_decouple, "Enable software ODP decoupling");
+
+static int pri_shift_set(const char *val, const struct kernel_param *kp)
+{
+	int n;
+	int ret;
+
+	ret = kstrtoint(val, 10, &n);
+	if (ret || n < 12 || n > 30)
+		return -EINVAL;
+
+	return param_set_int(val, kp);
+}
+
+static const struct kernel_param_ops pri_shift_ops = {
+	.set = pri_shift_set,
+	.get = param_get_int,
+};
+
+static int pri_shift = 16;
+module_param_cb(pri_shift, &pri_shift_ops, &pri_shift, 0644);
+MODULE_PARM_DESC(pri_shift, "ODP default number of pages to fault");
+
+static irqreturn_t cass_pri_int_cb(int irq, void *context);
+static void cass_pri_worker(struct work_struct *work);
+static void cass_prb_worker(struct work_struct *work);
+static void cass_odpq_write(struct cass_dev *hw, int index,
+			    enum c_odp_status status);
+
+static int min_root_entries(struct cass_ac *cac)
+{
+	int default_ac_size = (cac->ptg_mode == C_ATU_PTG_MODE_SGL) ?
+			ac_size_sgl : ac_size_dbl;
+
+	return BIT(PAGE_SHIFT + default_ac_size) / ATU_PTE_ENTRY_SIZE;
+}
+
+static void cass_nta_cmdproc_write(struct cass_dev *hw, unsigned int wr_index)
+{
+	union c_atu_cfg_cmdproc atu_ptrs = {
+		.wr_ptr = wr_index
+	};
+
+	cass_write(hw, C_ATU_CFG_CMDPROC, &atu_ptrs, sizeof(atu_ptrs));
+}
+
+static void cass_nta_cq_write(struct cass_dev *hw, unsigned int index,
+			      const union c_atu_cfg_cq_table *entry)
+{
+	cass_write(hw, C_ATU_CFG_CQ_TABLE(index), entry, sizeof(*entry));
+}
+
+void cass_nta_cq_fini(struct cass_dev *hw)
+{
+	free_irq(pci_irq_vector(hw->cdev.pdev, hw->atu_cq_vec), hw);
+}
+
+static irqreturn_t cass_nta_cq_cb(int irq, void *context)
+{
+	/* Not expected to ever be called */
+	BUG();
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * cass_nta_cq_init() - NTA command queue initialization
+ *
+ * @hw: Cassini device
+ */
+int cass_nta_cq_init(struct cass_dev *hw)
+{
+	struct cass_atu_cq *cq = &hw->atu_cq;
+	static const union c_atu_cfg_wb_data wb_data = {
+		.data = WAIT_RSP_DATA
+	};
+	union c_atu_cfg_cmds cfg_cmds = {
+		.writeback_acid = ATU_NTA_DEF_PI_ACXT
+	};
+	int rc;
+
+	cq->rsp_dma_addr = dma_map_single(&hw->cdev.pdev->dev, &cq->wait_rsp_data,
+					  sizeof(cq->wait_rsp_data), DMA_FROM_DEVICE);
+	if (dma_mapping_error(&hw->cdev.pdev->dev, cq->rsp_dma_addr))
+		return -ENOMEM;
+
+	cq->cmp_wait_rsp_addr = (cq->rsp_dma_addr + offsetof(struct wait_rsp_data, cmp)) >> 3;
+	cq->ib_wait_rsp_addr = (cq->rsp_dma_addr + offsetof(struct wait_rsp_data, ib)) >> 3;
+
+	mutex_init(&cq->atu_cq_mutex);
+	mutex_init(&cq->atu_ib_mutex);
+	cass_write(hw, C_ATU_CFG_WB_DATA, &wb_data, sizeof(wb_data));
+
+	scnprintf(cq->cmpl_wait_int_name, sizeof(cq->cmpl_wait_int_name),
+		  "%s_atu_cq", hw->cdev.name);
+	rc = request_irq(pci_irq_vector(hw->cdev.pdev, hw->atu_cq_vec),
+			 cass_nta_cq_cb, 0, cq->cmpl_wait_int_name, hw);
+	if (rc) {
+		dev_err(&hw->cdev.pdev->dev, "Failed to request IRQ.\n");
+		dma_unmap_single(&hw->cdev.pdev->dev, cq->rsp_dma_addr,
+				 sizeof(cq->wait_rsp_data), DMA_FROM_DEVICE);
+		return rc;
+	}
+
+	disable_irq(pci_irq_vector(hw->cdev.pdev, hw->atu_cq_vec));
+
+	cfg_cmds.ib_wait_int_idx = hw->atu_cq_vec;
+	cfg_cmds.cmpl_wait_int_idx = hw->atu_cq_vec;
+	cass_write(hw, C_ATU_CFG_CMDS, &cfg_cmds, sizeof(cfg_cmds));
+
+	return 0;
+}
+
+void cass_nta_pri_fini(struct cass_dev *hw)
+{
+	if (cass_version(hw, CASSINI_1_0))
+		return;
+
+	cass_clear(hw, C_ATU_CFG_ODP, C_ATU_CFG_ODP_SIZE);
+	cass_clear(hw, C_ATU_CFG_PRI, C_ATU_CFG_PRI_SIZE);
+	cass_flush_pci(hw);
+	free_irq(pci_irq_vector(hw->cdev.pdev, hw->atu_pri_vec), hw);
+	destroy_workqueue(hw->prb_wq);
+	destroy_workqueue(hw->pri_wq);
+	dma_unmap_single(&hw->cdev.pdev->dev, hw->prt_dma_addr,
+			 sizeof(struct c_page_request_entry), DMA_FROM_DEVICE);
+	kfree(hw->page_request_table);
+	dma_unmap_single(&hw->cdev.pdev->dev, hw->atu_cq.rsp_dma_addr,
+			 sizeof(struct wait_rsp_data), DMA_FROM_DEVICE);
+}
+
+/**
+ * cass_nta_pri_init() - Initialize the NTA Page Request interface
+ *
+ * @hw: Cassini device
+ */
+int cass_nta_pri_init(struct cass_dev *hw)
+{
+	int rc;
+	union c_atu_cfg_pri cpa;
+	union c_atu_cfg_odp codp = {
+		.acid = ATU_PHYS_AC,
+		.int_enable = 1,
+		.odp_en = 1
+	};
+
+	if (cass_version(hw, CASSINI_1_0))
+		return 0;
+
+	hw->page_request_table = kcalloc(C_ATU_PRB_ENTRIES,
+					 sizeof(struct c_page_request_entry),
+					 GFP_KERNEL);
+	if (!hw->page_request_table)
+		return -ENOMEM;
+
+	hw->prt_dma_addr = dma_map_single(&hw->cdev.pdev->dev, hw->page_request_table,
+					  sizeof(struct c_page_request_entry),
+					  DMA_FROM_DEVICE);
+	if (dma_mapping_error(&hw->cdev.pdev->dev, hw->prt_dma_addr)) {
+		rc = -ENOMEM;
+		goto free_table;
+	}
+
+	hw->pri_rd_ptr = 0;
+
+	scnprintf(hw->odp_pri_int_name, sizeof(hw->odp_pri_int_name),
+		  "%s_odp_pri", hw->cdev.name);
+	rc = request_irq(pci_irq_vector(hw->cdev.pdev, hw->atu_pri_vec),
+			 cass_pri_int_cb, 0, hw->odp_pri_int_name, hw);
+	if (rc) {
+		pr_err("Failed to request IRQ.\n");
+		goto free_mapping;
+	}
+
+	/* limit to a single threaded worker */
+	hw->pri_wq = alloc_workqueue("pri_wq", WQ_UNBOUND, 1);
+	if (!hw->pri_wq) {
+		rc = -ENOMEM;
+		pr_err("Failed to allocate PRI workqueue\n");
+		goto alloc_wq_failed;
+	}
+
+	hw->prb_wq = alloc_workqueue("prb_wq", WQ_UNBOUND, 1);
+	if (!hw->prb_wq) {
+		rc = -ENOMEM;
+		pr_err("Failed to allocate PRB workqueue\n");
+		goto alloc_prb_wq_failed;
+	}
+
+	cpa.base_addr = hw->prt_dma_addr >> C_ADDR_SHIFT;
+	cass_write(hw, C_ATU_CFG_PRI, &cpa, sizeof(cpa));
+
+	codp.int_idx = hw->atu_pri_vec;
+	cass_write(hw, C_ATU_CFG_ODP, &codp, sizeof(codp));
+
+	INIT_WORK(&hw->pri_work, cass_pri_worker);
+	INIT_WORK(&hw->prb_work, cass_prb_worker);
+
+	return 0;
+
+alloc_prb_wq_failed:
+	destroy_workqueue(hw->pri_wq);
+alloc_wq_failed:
+	free_irq(pci_irq_vector(hw->cdev.pdev, hw->atu_pri_vec), hw);
+free_mapping:
+	dma_unmap_single(&hw->cdev.pdev->dev, hw->prt_dma_addr,
+			 sizeof(struct c_page_request_entry), DMA_FROM_DEVICE);
+free_table:
+	kfree(hw->page_request_table);
+
+	return rc;
+}
+
+int cass_sts_idle(struct sts_idle *sidle)
+{
+	union c_atu_sts_cmdproc sts;
+	struct cass_dev *hw = sidle->hw;
+
+	cass_read(hw, C_ATU_STS_CMDPROC, &sts, sizeof(sts));
+
+	return sidle->ib_wait ? sts.inbound_wait_idle : sts.atucq_idle;
+}
+
+static int cass_poll_sts_cmdproc_idle(struct cass_dev *hw, bool ib_wait)
+{
+	int ret;
+	int idle;
+	int timeout_us = ib_wait ? ATU_STS_IBW_IDLE_TIMEOUT :
+					ATU_STS_ATUCQ_IDLE_TIMEOUT;
+	struct sts_idle sidle = {
+		.hw = hw,
+		.ib_wait = ib_wait
+	};
+
+	ret = readx_poll_timeout(cass_sts_idle, &sidle, idle, (idle),
+				 10, timeout_us);
+	if (ret)
+		pr_crit("Timed out waiting for %s idle\n",
+			ib_wait ? "IB wait" : "ATUCQ");
+
+	return ret;
+}
+
+#define err_dump_csr64(name) do {		\
+	u64 val;				\
+	cass_read(hw, name, &val, sizeof(val));	\
+	cxidev_warn_ratelimited(&hw->cdev, #name " %016llx\n", val);	\
+	} while (0)
+
+static bool cass_cmdproc_debug(struct cass_dev *hw, bool inbound_wait)
+{
+	union c_mb_sts_rev rev;
+
+	/* check if HW is still alive */
+	cass_read(hw, C_MB_STS_REV, &rev, sizeof(rev));
+	if (rev.vendor_id != hw->rev.vendor_id) {
+		pr_err("HW is in a bad state\n");
+		return true;
+	}
+
+	cxidev_warn_ratelimited(&hw->cdev, "%s wait timeout\n",
+				inbound_wait ? "Inbound" : "Completion");
+	err_dump_csr64(C_ATU_STS_CMDPROC);
+	err_dump_csr64(C_ATU_STS_ODP_DECOUPLE);
+	err_dump_csr64(C_ATU_STS_AT_EPOCH);
+	err_dump_csr64(C_ATU_STS_IB_EPOCH);
+
+	return false;
+}
+
+static void cass_dcpl_debug(struct cass_dev *hw)
+{
+	u64 val1;
+	u64 val2;
+
+	cass_read(hw, C_ATU_STS_CMDPROC, &val1, sizeof(val1));
+	cass_read(hw, C_ATU_STS_AT_EPOCH, &val2, sizeof(val2));
+	cxidev_warn_ratelimited(&hw->cdev,
+				"Completion wait timeout after decouple. atu_sts_cmdproc:0x%llx atu_sts_at_epoch:0x%llx rsp_data:0x%llx\n",
+				val1, val2, hw->atu_cq.wait_rsp_data.cmp);
+}
+
+static void cass_completion_wait(struct cass_dev *hw, unsigned int wr_index)
+{
+	int rc;
+	int ret;
+	u64 cw_rsp_read_data;
+	bool hw_failure;
+	int decoupled = 0;
+	union c_atu_cfg_cq_table entry = {};
+	struct cass_atu_cq *cq = &hw->atu_cq;
+	int timeout = odp_sw_decouple ? decouple_timeout_us : atucq_timeout_us;
+
+	atomic_inc(&hw->dcpl_comp_wait);
+
+	entry.cmd = C_ATU_COMPLETION_WAIT;
+	entry.comp_wait_rsp_en = 1;
+	entry.comp_wait_rsp_addr = cq->cmp_wait_rsp_addr;
+
+	cq->wait_rsp_data.cmp = 0;
+
+	cass_nta_cq_write(hw, ATUCQ_ENTRY(wr_index), &entry);
+
+	/* WR_PTR should point at the entry that immediately follows
+	 * the last outstanding command.
+	 */
+	wr_index++;
+
+	/* Writes to C_ATU_CFG_CMDPROC are ignored if ATUCQ is not idle. */
+	cass_poll_sts_cmdproc_idle(hw, false);
+
+	/* start the processing of the command queue */
+	cass_nta_cmdproc_write(hw, wr_index);
+	cass_flush_pci(hw);
+
+	/* increase the timeout on the emulator */
+	if (HW_PLATFORM_Z1(hw))
+		timeout *= 10;
+
+	do {
+		ret = readq_poll_timeout_atomic(&cq->wait_rsp_data.cmp,
+						cw_rsp_read_data,
+						(cw_rsp_read_data == WAIT_RSP_DATA),
+						1, timeout);
+		if (ret) {
+			if (odp_sw_decouple) {
+				if (decoupled) {
+					cass_dcpl_debug(hw);
+					break;
+				}
+
+				rc = cass_odp_decouple(hw);
+				if (rc) {
+					cxidev_warn_ratelimited(&hw->cdev,
+								"Decoupling failed\n");
+					break;
+				}
+
+				decoupled++;
+				timeout = atucq_timeout_us;
+			} else {
+				hw_failure = cass_cmdproc_debug(hw, false);
+				if (hw_failure)
+					return;
+			}
+		}
+	} while (ret);
+}
+
+/**
+ * cass_invalidate_range() - Invalidate a range of IOVAs
+ *
+ * Invalidate a range of IOVAs by powers of two. Does not return until
+ * the commands have been executed - the completion wait is finished.
+ * inval_addr is modified with the length when invalidating sizes larger
+ * than a page. Treat the inval_size as bit 11 of the address.
+ *
+ * @cac:    Address Context struct
+ * @iova:   IO virtual address
+ * @length: Length of address range to invalidate
+ */
+void cass_invalidate_range(const struct cass_ac *cac, u64 iova,
+			   size_t length)
+{
+	u64 len;
+	u64 align;
+	u64 size_bits;
+	struct cass_dev *hw = container_of(cac->lni_priv->dev, struct cass_dev,
+					   cdev);
+	struct cass_atu_cq *cq = &hw->atu_cq;
+
+	if (cac->cfg_ac.do_not_cache) {
+		/* Completion wait needs to be performed so that the ODP
+		 * pri_worker is not referencing the AC while it is being
+		 * destroyed.
+		 */
+		if (cac->flags & CXI_MAP_USER_ADDR) {
+			mutex_lock(&cq->atu_cq_mutex);
+			cass_completion_wait(hw, 0);
+			mutex_unlock(&cq->atu_cq_mutex);
+		}
+
+		return;
+	}
+
+	pr_debug("ac:%d iova:%llx length:%lx\n", cac->ac.acid, iova, length);
+
+	mutex_lock(&cq->atu_cq_mutex);
+
+	while (length > 0) {
+		union c_atu_cfg_cq_table entry = {};
+		unsigned int wr_index = 0;
+
+		/* save room for the completion wait command */
+		while (length > 0 &&
+		       (C_ATU_CFG_CQ_TABLE_ENTRIES - wr_index) > 1) {
+			/* Walk through the iova and invalidate a len
+			 * based on its current alignment and the length
+			 * remaining.
+			 */
+			len = BIT(flsl(length));
+			align = !iova ? len : BIT(ffsl(iova));
+
+			if (len > align)
+				len = align;
+
+			/*
+			 * size_bits gives the 1's necessary to fill in the
+			 * lower bits of inval_addr and the inval_size fields
+			 */
+			size_bits = ((len - 1) & ~MASK(C_ADDR_SHIFT)) >> 1;
+			entry.qw = iova | size_bits;
+			entry.cmd = C_ATU_INVALIDATE_PAGES;
+			entry.inval_acid = cac->ac.acid;
+
+			atu_debug("ac:%d entry:%llx addr:%llx len:%llx\n",
+				  cac->ac.acid, entry.qw, iova, len);
+			cass_nta_cq_write(hw, ATUCQ_ENTRY(wr_index), &entry);
+
+			length -= len;
+			iova += len;
+			wr_index++;
+		}
+
+		cass_completion_wait(hw, wr_index);
+	}
+
+	mutex_unlock(&cq->atu_cq_mutex);
+}
+
+/**
+ * cass_inbound_wait() - flush internal Cassini buffers
+ *
+ * Called during resource cleanup.
+ *
+ * @hw: the device
+ * @wait_for_response: wait for hardware completion
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_inbound_wait(struct cass_dev *hw, bool wait_for_response)
+{
+	int ret;
+	int rc = 0;
+	int count = 0;
+	u64 rsp_read_data;
+	struct cass_atu_cq *cq = &hw->atu_cq;
+	union c_atu_cfg_inbound_wait cfg_iw = {
+		.rsp_en = wait_for_response,
+		.rsp_addr = cq->ib_wait_rsp_addr,
+	};
+
+	/* hw_failure was set previously. No need to progress */
+	if (cq->hw_failure)
+		return -EHOSTDOWN;
+
+	cq->wait_rsp_data.ib = 0;
+
+	/* Writes to C_ATU_CFG_CMDPROC are ignored if ATUCQ is not idle. */
+	ret = cass_poll_sts_cmdproc_idle(hw, true);
+	if (ret) {
+		rc = -EALREADY;
+		goto done;
+	}
+
+	/* process an inbound wait */
+	cass_write(hw, C_ATU_CFG_INBOUND_WAIT, &cfg_iw, sizeof(cfg_iw));
+	cass_flush_pci(hw);
+
+	if (wait_for_response) {
+		do {
+			ret = readq_poll_timeout_atomic(
+				&cq->wait_rsp_data.ib, rsp_read_data,
+				(rsp_read_data == WAIT_RSP_DATA), 1,
+				ATU_IBW_TIMEOUT);
+			if (ret) {
+				cq->hw_failure = cass_cmdproc_debug(hw, true);
+
+				if (cq->hw_failure) {
+					rc = -EHOSTDOWN;
+					break;
+				}
+
+				if (count++ > 4) {
+					rc = -ETIMEDOUT;
+					pr_err("Inbound wait is stuck - bailing out\n");
+					break;
+				}
+			}
+		} while (ret);
+	}
+
+done:
+	return rc;
+}
+
+static int cxi_inbound_wait_vf(struct cxi_dev *cdev)
+{
+	const struct cxi_inbound_wait_cmd cmd = {
+		.op = CXI_OP_INBOUND_WAIT,
+	};
+
+	return cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, 0);
+}
+
+extern bool ibw_epoch_cntr_is_0(struct cass_dev *hw, bool *epoch_ret);
+/*
+ * cxi_inbound_wait - Flush internal cassini buffers
+ *
+ * @cdev: Cassini Device
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_inbound_wait(struct cxi_dev *cdev)
+{
+	int ret;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cass_atu_cq *cq = &hw->atu_cq;
+
+	if (!cdev->is_physfn)
+		return cxi_inbound_wait_vf(cdev);
+
+	mutex_lock(&cq->atu_ib_mutex);
+	ret = cass_inbound_wait(hw, true);
+	mutex_unlock(&cq->atu_ib_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(cxi_inbound_wait);
+
+/**
+ * cass_nta_iova_alloc() - Allocate an IOVA from the domain
+ *
+ * @cac: Address Context
+ * @m_opts: Map options
+ */
+u64 cass_nta_iova_alloc(struct cass_ac *cac, const struct ac_map_opts *m_opts)
+{
+	u64 iova;
+
+	if (!cac->iovad)
+		return 0;
+
+	iova = ALLOC_IOVA_FAST(cac->iovad, m_opts->va_len, cac->iova_end);
+
+	/* Check for an iova overflow because of a 5.11+ (sles15sp4+)
+	 * iova bug. Free the current allocation and return iova not found.
+	 */
+	if (iova && iova < cac->iova_base) {
+		pr_debug("alloc_iova overflow iova:%llx iova_base:%llx\n",
+			 iova, cac->iova_base);
+		FREE_IOVA_FAST(cac->iovad, iova, m_opts->va_len);
+		iova = 0;
+	}
+
+	return iova;
+}
+
+void cass_nta_iova_fini(struct cass_ac *cac)
+{
+	if (cac->iovad) {
+		put_iova_domain(cac->iovad);
+		kfree(cac->iovad);
+	}
+}
+
+int cass_nta_iova_init(struct cass_ac *cac, size_t va_len)
+{
+#ifdef HAVE_IOVA_INIT_RCACHES
+	int ret;
+#endif
+
+	cac->iovad = kzalloc(sizeof(*cac->iovad), GFP_KERNEL);
+	if (!cac->iovad)
+		return -ENOMEM;
+
+	INIT_IOVA_DOMAIN(cac->iovad, PAGE_SIZE, cac->iova_base,
+			 cac->iova_end);
+
+/* linux 5.18 removed the initialization of the rcaches from init_iova_domain */
+#ifdef HAVE_IOVA_INIT_RCACHES
+	ret = iova_domain_init_rcaches(cac->iovad);
+	if (ret) {
+		cass_nta_iova_fini(cac);
+		return ret;
+	}
+#endif
+
+	return 0;
+}
+
+void cass_nta_free(struct cass_dev *hw, struct cass_nta *nta)
+{
+	dma_unmap_page(&hw->cdev.pdev->dev, nta->root_page_dma_addr,
+		       PAGE_SIZE << nta->root_order, DMA_TO_DEVICE);
+	__free_pages(nta->root_page, nta->root_order);
+	kfree(nta);
+}
+
+static struct cass_nta *cass_nta_alloc(struct cass_ac *cac, int l0_entries,
+				       int l1_entries)
+{
+	struct cass_dev *hw = container_of(cac->lni_priv->dev, struct cass_dev, cdev);
+	struct cass_nta *nta;
+	int ret;
+
+	nta = kzalloc(struct_size(nta, l1, l0_entries), GFP_KERNEL);
+	if (!nta)
+		return ERR_PTR(-ENOMEM);
+
+	nta->numa_node = dev_to_node(&hw->cdev.pdev->dev);
+	nta->root_order = get_order(l0_entries * ATU_PTE_ENTRY_SIZE);
+	nta->l1_order = get_order(l1_entries * ATU_PTE_ENTRY_SIZE);
+
+	nta->root_page = alloc_pages_node(nta->numa_node, GFP_KERNEL | __GFP_ZERO,
+					  nta->root_order);
+	if (!nta->root_page) {
+		ret = -ENOMEM;
+		goto alloc_pages_fail;
+	}
+
+	nta->root_page_dma_addr = dma_map_page(&hw->cdev.pdev->dev, nta->root_page, 0,
+					       PAGE_SIZE << nta->root_order,
+					       DMA_TO_DEVICE);
+	if (dma_mapping_error(&hw->cdev.pdev->dev, nta->root_page_dma_addr)) {
+		ret = -ENOMEM;
+		goto map_fail;
+	}
+
+	nta->root_ptr = page_address(nta->root_page);
+	nta->l0_entries = l0_entries;
+	nta->l1_entries = l1_entries;
+	cac->cfg_ac.nta_root_ptr = nta->root_page_dma_addr >> C_ADDR_SHIFT;
+	cac->cfg_ac.mem_base = cac->iova_base >> ATU_CFG_AC_TABLE_MB_SHIFT;
+	cac->cfg_ac.mem_size = cac->iova_len >> C_ADDR_SHIFT;
+	cac->cfg_ac.odp_mode = C_ATU_ODP_MODE_NIC_PRI;
+	cac->cfg_ac.ta_mode = C_ATU_NTA_MODE;
+
+	return nta;
+
+map_fail:
+	__free_pages(nta->root_page, nta->root_order);
+alloc_pages_fail:
+	kfree(nta);
+
+	return ERR_PTR(ret);
+}
+
+static int cass_ac_size(const struct ac_map_opts *m_opts, struct cass_ac *cac,
+			ulong npfns, int l1_entries)
+{
+	u64 l0_entries;
+
+	l0_entries = round_up(npfns / l1_entries, min_root_entries(cac));
+	cac->iova_base = ATU_VA_MASK(cass_iova_base(cac));
+	cac->iova_len = l0_entries * (u64)l1_entries * BIT(cac->page_shift);
+	cac->iova_base &= ~(cac->iova_len - 1);
+	cac->iova_end = cac->iova_base + cac->iova_len - 1;
+
+	pr_debug("ac:%d iova_base:%016llx iova_end:%016llx iova_len:%016llx\n",
+		 cac->ac.acid, cac->iova_base, cac->iova_end, cac->iova_len);
+
+	return l0_entries;
+}
+
+/**
+ * cass_nta_init() - Initialize an NTA Address Context
+ *
+ * @lni_priv: the Logical Network Interface
+ * @m_opts: Map options
+ * @cac:    Address Context
+ */
+int cass_nta_init(struct cxi_lni_priv *lni_priv, struct ac_map_opts *m_opts,
+		  struct cass_ac *cac)
+{
+	int ret;
+	ulong npfns;
+	int l0_entries;
+	int l1_entries;
+	int len_order;
+
+	l1_entries = BIT(cac->cfg_ac.pg_table_size);
+	npfns = m_opts->va_len >> m_opts->page_shift;
+	npfns = ALIGN(npfns, l1_entries);
+
+	/* Round up to the next power of 2 if not aligned. If the length
+	 * passed to init_iova_domain is not aligned to a power of 2, calling
+	 * iova_alloc_fast with a length that is larger than half of the
+	 * domain size can fail since the iova is aligned to the length.
+	 */
+	len_order = flsl(npfns);
+	if (npfns & MASK(len_order))
+		npfns = BIT(len_order + 1);
+
+	l0_entries = cass_ac_size(m_opts, cac, npfns, l1_entries);
+
+	ret = cass_nta_iova_init(cac, m_opts->va_len);
+	if (ret)
+		goto iova_init_fail;
+
+	m_opts->iova = cass_nta_iova_alloc(cac, m_opts);
+	if (!m_opts->iova) {
+		if (cac->iovad) {
+			pr_debug("cass_iova_alloc failed %lld\n", m_opts->iova);
+			ret = -ENOENT;
+			goto alloc_iova_fail;
+		}
+	}
+
+	cac->nta = cass_nta_alloc(cac, l0_entries, l1_entries);
+	if (IS_ERR(cac->nta)) {
+		ret = PTR_ERR(cac->nta);
+		goto iova_cleanup;
+	}
+
+	return 0;
+
+iova_cleanup:
+	if (cac->iovad)
+		FREE_IOVA_FAST(cac->iovad, m_opts->iova, m_opts->va_len);
+alloc_iova_fail:
+	cass_nta_iova_fini(cac);
+iova_init_fail:
+
+	return ret;
+}
+
+static void cass_l1_table_free(struct cass_dev *hw, struct cass_nta *nta,
+			       unsigned int l0_index)
+{
+	struct l1_entry *l1 = &nta->l1[l0_index];
+
+	dma_unmap_page(&hw->cdev.pdev->dev, l1->l1_pages_dma_addr,
+		       PAGE_SIZE << nta->l1_order, DMA_TO_DEVICE);
+	__free_pages(l1->l1_pages, nta->l1_order);
+	bitmap_free(l1->bitmap);
+
+	memset(l1, 0, sizeof(*l1));
+}
+
+/* Return the virtual address of a given PTE */
+static union a_pte *get_virt_pte(const struct cass_nta *nta, unsigned int l0_index,
+				 unsigned int l1_index)
+{
+	union a_pte *l1_array;
+
+	l1_array = page_address(nta->l1[l0_index].l1_pages);
+
+	return &l1_array[l1_index];
+}
+
+static void cass_pte_clear(struct cass_dev *hw, const struct cxi_md_priv *md_priv,
+			   unsigned int l0_index, unsigned int l1_index,
+			   bool unmap)
+{
+	struct cass_ac *cac = md_priv->cac;
+	struct cass_nta *nta = cac->nta;
+	union a_pte *pte = get_virt_pte(nta, l0_index, l1_index);
+	unsigned long *map;
+
+	if (pte && pte->pte.p) {
+		if (unmap)
+			dma_unmap_page(&hw->cdev.pdev->dev, PTE_ADDR(pte->pte),
+				       1 << cac->page_shift, DMA_BIDIRECTIONAL);
+		pte->qw = 0;
+	}
+
+	map = nta->l1[l0_index].bitmap;
+	if (map)
+		clear_bit(l1_index, map);
+}
+
+static void cass_clear_pde(struct cass_dev *hw, union a_pte *pde)
+{
+	pde->qw = 0;
+}
+
+void cass_l1_tables_free(struct cass_dev *hw, struct cass_nta *nta)
+{
+	int i;
+	union a_pte *pde;
+
+	for (i = 0; i < nta->l0_entries; i++) {
+		if (!nta->l1[i].bitmap)
+			continue;
+
+		pde = &nta->root_ptr[i];
+		if (!pde->qw) {
+			pr_warn("%d map entry but pde 0\n", i);
+			continue;
+		}
+
+		cass_l1_table_free(hw, nta, i);
+		cass_clear_pde(hw, pde);
+	}
+}
+
+static void cass_pg_tbl_indices(const struct cass_ac *cac, s64 iova_offset,
+				int *l0_index, int *l1_index)
+{
+	int pts = cac->cfg_ac.pg_table_size;
+	int l1_shift = cac->cfg_ac.base_pg_size + C_ADDR_SHIFT;
+	int l0_shift = l1_shift + pts;
+
+	*l0_index = iova_offset >> l0_shift;
+	*l1_index = (iova_offset >> l1_shift) & MASK(pts);
+}
+
+/**
+ * cass_clear_range() - clear a range of ptes and invalidate the ATU cache
+ *
+ * @md_priv: Private memory descriptor
+ * @iova: IO virtual address
+ * @len: IOVA range to clear
+ */
+void cass_clear_range(const struct cxi_md_priv *md_priv, u64 iova, u64 len)
+{
+	struct cass_dev *hw = container_of(md_priv->cac->lni_priv->dev,
+					   struct cass_dev, cdev);
+	int l0_index;
+	int l1_index;
+	struct cass_ac *cac = md_priv->cac;
+	int page_shift = cac->page_shift;
+	int entries = len >> page_shift;
+	s64 iova_offset = iova - cac->iova_base;
+	union a_pte *pde;
+	/* Only ODP needs to be unmapped here. Device and pinned memory will
+	 * be unmapped when the SG table is cleaned up.
+	 */
+	bool do_unmap = !md_priv->sgt;
+
+	if (!len)
+		return;
+
+	for (; entries > 0; iova_offset += BIT(page_shift), entries--) {
+		cass_pg_tbl_indices(cac, iova_offset, &l0_index, &l1_index);
+
+		pde = &cac->nta->root_ptr[l0_index];
+		if (!pde->qw)
+			continue;
+
+		if (!cac->cfg_ac.pg_table_size) {
+			/* single level table */
+			if (do_unmap)
+				dma_unmap_page(&hw->cdev.pdev->dev,
+					       PTE_ADDR(pde->pte),
+					       1 << cac->page_shift,
+					       DMA_BIDIRECTIONAL);
+			pde->qw = 0;
+		} else if (pde->pte.leaf) {
+			if (do_unmap)
+				dma_unmap_page(&hw->cdev.pdev->dev,
+					       PTE_ADDR(pde->pte),
+					       1 << cac->huge_shift,
+					       DMA_BIDIRECTIONAL);
+			cass_clear_pde(hw, pde);
+			/*
+			 * the rest of the entries for this pde don't need to
+			 * be checked
+			 */
+			entries -= ATU_PMD_NR(cac) - 1;
+			iova_offset += BIT(page_shift) * (ATU_PMD_NR(cac) - 1);
+		} else {
+			if (!cac->nta->l1[l0_index].bitmap)
+				pr_err("ac:%d iova:%llx offset:%llx map %d is NULL\n",
+				       cac->ac.acid, iova, iova_offset,
+				       l0_index);
+
+			cass_pte_clear(hw, md_priv, l0_index, l1_index,
+				       do_unmap);
+		}
+	}
+}
+
+/**
+ * cass_pte_build() - construct a page table entry based on the pfn and flags
+ *
+ * @hpfn: pfn from the CPU page table containing read and write permissions
+ * @pte: constructed page table entry
+ * @dma_addr: DMA address of the page frame number
+ * @leaf: indication of the final translation - l0 hugepage entry or l1 entry
+ * @flags: user requested read and write permissions
+ * @is_hmm_pfn: DMA address is from an hpfn - use the hpfn flags
+ * @l0_entry: indicates this is a root table entry
+ */
+static void cass_pte_build(u64 hpfn, union a_pte *pte, dma_addr_t dma_addr,
+			   bool leaf, u32 flags, bool is_hmm_pfn,
+			   bool l0_entry)
+{
+	/* Always set rd/wr permissions for a non-leaf root table entry
+	 * since the 2nd level could be either rd or wr and the NIC checks
+	 * both levels for proper permissions.
+	 */
+	bool rw = l0_entry && !leaf;
+	bool rd = rw || (flags & CXI_MAP_READ);
+	bool wr = rw || (flags & CXI_MAP_WRITE);
+	bool h_wr = rw || ATU_PFN_WRITE(hpfn);
+
+	pte->qw = dma_addr;
+	pte->pte.leaf = leaf;
+
+	if (is_hmm_pfn) {
+		if (ATU_PFN_INVALID(hpfn)) {
+			pte->qw = 0;
+			return;
+		}
+
+		pte->pte.r = rd;
+		pte->pte.w = h_wr && wr;
+		pte->pte.p = !leaf || ATU_PFN_VALID(hpfn);
+	} else {
+		/* TODO: check page attributes? */
+		pte->pte.r = rd;
+		pte->pte.w = wr;
+		pte->pte.p = 1;
+	}
+}
+
+/**
+ * cass_l1_table_empty - Free l1 map buffer if table is empty.
+ *
+ * @cac:   Address context
+ * @pde:   Page directory entry
+ * @index: L1 map to free and clean up
+ * @iova:  IO virtual address
+ */
+static int cass_l1_table_empty(const struct cass_ac *cac,
+			       union a_pte *pde, int index, u64 iova)
+{
+	struct cass_dev *hw = container_of(cac->lni_priv->dev,
+					   struct cass_dev, cdev);
+	struct cass_nta *nta = cac->nta;
+
+	if (!nta->l1[index].bitmap) {
+		pr_err("ac:%d iova:%llx map %d is NULL\n", cac->ac.acid,
+		       iova, index);
+		return -EINVAL;
+	}
+
+	if (!bitmap_empty(nta->l1[index].bitmap, nta->l1_entries)) {
+		pr_err("bitmap is not empty iova:%llx\n", iova);
+		return -EINVAL;
+	}
+
+	cass_l1_table_free(hw, nta, index);
+
+	return 0;
+}
+
+static int cass_l1_table_alloc(struct cass_dev *hw, struct cass_nta *nta,
+			       int l0_index)
+{
+	struct l1_entry *l1 = &nta->l1[l0_index];
+
+	l1->bitmap = bitmap_zalloc(nta->l1_entries, GFP_KERNEL);
+	if (!l1->bitmap)
+		return -ENOMEM;
+
+	l1->l1_pages = alloc_pages_node(nta->numa_node, GFP_KERNEL | __GFP_ZERO,
+					nta->l1_order);
+	if (!l1->l1_pages)
+		goto free_bitmap;
+
+	l1->l1_pages_dma_addr = dma_map_page(&hw->cdev.pdev->dev, l1->l1_pages,
+					     0, PAGE_SIZE << nta->l1_order,
+					     DMA_TO_DEVICE);
+	if (dma_mapping_error(&hw->cdev.pdev->dev, l1->l1_pages_dma_addr))
+		goto free_pages;
+
+	return 0;
+
+free_pages:
+	__free_pages(l1->l1_pages, nta->l1_order);
+free_bitmap:
+	bitmap_free(l1->bitmap);
+
+	memset(l1, 0, sizeof(*l1));
+
+	return -ENOMEM;
+}
+
+int cass_dma_addr_mirror(dma_addr_t dma_addr, u64 iova, struct cass_ac *cac,
+			 u32 flags, bool is_huge_page, bool *invalidate)
+{
+	int ret;
+	int l0_index;
+	int l1_index;
+	union a_pte *ppde;
+	union a_pte *ppte;
+	union a_pte pde = {};
+	union a_pte pte = {};
+	bool update_pde = false;
+	s64 iova_offset = iova - cac->iova_base;
+	bool ptg_mode_sgl = !cac->cfg_ac.pg_table_size;
+	struct cass_dev *hw = container_of(cac->lni_priv->dev, struct cass_dev,
+					   cdev);
+
+	if (iova_offset > cac->iova_len) {
+		pr_warn("iova_offset:0x%llx > iova_len:0x%llx iova:%llx iova_base:%llx\n",
+			iova_offset, cac->iova_len, iova, cac->iova_base);
+		return -EINVAL;
+	}
+
+	cass_pg_tbl_indices(cac, iova_offset, &l0_index, &l1_index);
+	ppde = &cac->nta->root_ptr[l0_index];
+
+	if (is_huge_page && ppde->qw) {
+		if (l1_index) {
+			pr_err("Huge page not aligned iova:%llx\n", iova);
+			return -EINVAL;
+		}
+
+		/* Replacing a non-leaf entry with a leaf entry. */
+		/* TODO: check if this is still necessary */
+		if (!ppde->pte.leaf) {
+			ret = cass_l1_table_empty(cac, ppde, l0_index,
+						  iova_offset);
+			if (ret)
+				return ret;
+
+			pr_debug("Replacing non-leaf pde iova:%llx entry:%lx\n",
+				 iova_offset, (ulong)PTE_ADDR(ppde->pte));
+			update_pde = true;
+			goto new_pde;
+		}
+
+		/* It is possible to get an ODP page request for the same
+		 * IOVA since we try to fill more than one entry at a time.
+		 */
+		cass_pte_build(0, &pde, dma_addr, true, flags, false, true);
+
+		if (pde.qw != ppde->qw) {
+			pr_err("Overlapping huge page ac:%d iova:%llx\n",
+			       cac->ac.acid, iova_offset);
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+new_pde:
+	if (!ppde->qw || update_pde) {
+		if (is_huge_page || ptg_mode_sgl) {
+			cass_pte_build(0, &pde, dma_addr, true, flags, false,
+				       true);
+		} else {
+			if (update_pde) {
+				pr_err("Expected hugepage update iova:%llx l0_index:%d l1_index:%d\n",
+				       iova_offset, l0_index, l1_index);
+				return -EINVAL;
+			}
+
+			ret = cass_l1_table_alloc(hw, cac->nta, l0_index);
+			if (ret) {
+				pr_err("Error allocating l1 table\n");
+				return ret;
+			}
+
+			cass_pte_build(0, &pde,
+				       cac->nta->l1[l0_index].l1_pages_dma_addr,
+				       false, flags, false, true);
+		}
+
+		atu_debug("pde iova:%llx dma_addr:0x%llx entry:%llx\n",
+			  iova, dma_addr, pde.qw);
+		ppde->qw = pde.qw;
+
+		if (update_pde)
+			cass_invalidate_range(cac, cac->iova_base + iova_offset,
+					      BIT(cac->huge_shift));
+
+		if (is_huge_page || ptg_mode_sgl)
+			return 0;
+	} else if (ppde->pte.leaf) {
+		pr_err("Unexpected leaf iova:%llx pde %llx, l0_index:%d l1_index:%d\n",
+		       iova_offset, ppde->qw, l0_index, l1_index);
+
+		return -EINVAL;
+	}
+
+	/* fill in the l1 table entry */
+	cass_pte_build(0, &pte, dma_addr, true, flags, false, false);
+	ppte = get_virt_pte(cac->nta, l0_index, l1_index);
+
+	atu_debug("pte %p phys:%lx iova:%llx entry:0x%llx\n", ppte,
+		  (ulong)PTE_ADDR(pte.pte) + l1_index * ATU_PTE_ENTRY_SIZE,
+		  iova, pte.qw);
+
+	ppte->qw = pte.qw;
+	set_bit(l1_index, cac->nta->l1[l0_index].bitmap);
+
+	return 0;
+}
+
+/**
+ * cass_pfns_mirror() - Mirror PTEs from a list of HMM pfns
+ *
+ * @md_priv: Private memory descriptor
+ * @m_opts: map options
+ * @pfns: pfns to mirror
+ * @npfns: number of pfns to mirror
+ * @is_huge_page: The vma is covered by a hugepage. For device memory,
+ *                indicates that the pfns are contiguous.
+ *
+ * Return: 0 on success or negative error value
+ */
+int cass_pfns_mirror(struct cxi_md_priv *md_priv, const struct ac_map_opts *m_opts,
+		     u64 *pfns, int npfns, bool is_huge_page)
+{
+	int ret;
+	int i;
+	size_t size;
+	bool inval = false;
+	int invalidate = 0;
+	struct page *page;
+	dma_addr_t dma_addr;
+	u64 iova = m_opts->iova;
+	struct cass_ac *cac = md_priv->cac;
+	size_t page_size = BIT(cac->page_shift);
+
+	for (i = 0; i < npfns;) {
+		/* Skip pfns that are invalid which may happen during
+		 * prefetch.
+		 */
+		if (!ATU_PFN_VALID(pfns[i])) {
+			i += ATU_PTE_NR(cac);
+			iova += page_size;
+			continue;
+		}
+
+		page = hmm_pfn_to_page(pfns[i]);
+
+		/* Check if there are enough remaining pfns to cover an L0
+		 * entry.
+		 */
+		if ((npfns - i) < K_PMD_NR(cac))
+			is_huge_page = false;
+
+		if (is_huge_page &&
+		    ((iova & MASK(cac->huge_shift)) || !PageHuge(page)))
+			is_huge_page = false;
+
+		size = is_huge_page ? BIT(cac->huge_shift) : page_size;
+		dma_addr = dma_map_page(md_priv->device, page, 0, size,
+					DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(md_priv->device, dma_addr)) {
+			ret = -EINVAL;
+			goto mirror_error;
+		}
+
+		ret = cass_dma_addr_mirror(dma_addr, iova, cac, md_priv->flags,
+					   is_huge_page, &inval);
+		if (ret)
+			goto mirror_error;
+
+		i += KPFN_INC(cac, is_huge_page);
+		invalidate += inval;
+		iova += size;
+	}
+
+mirror_error:
+	if (i < npfns) {
+		pr_err("Error populating %d PTEs at index %d\n", npfns, i);
+
+		/* Clean up previously populated ptes. */
+		cass_clear_range(md_priv, m_opts->iova, i * page_size);
+	}
+
+	/* If any PTEs are replaced they will need to be invalidated.
+	 * Invalidate the whole range.
+	 */
+	if (invalidate)
+		cass_invalidate_range(cac, m_opts->iova, npfns * page_size);
+
+	return ret;
+}
+
+static struct page *cass_virt_to_page(u64 addr)
+{
+	if (is_vmalloc_addr((void *)addr))
+		return vmalloc_to_page((void *)addr);
+	else
+		return virt_to_page(addr);
+}
+
+static bool cass_error_inject(const struct cxi_lni_priv *lni_priv)
+{
+	struct cass_dev *hw =
+		container_of(lni_priv->dev, struct cass_dev, cdev);
+
+	/* decrement if not 0 */
+	atomic_add_unless(&hw->atu_error_inject, -1, 0);
+
+	if (atomic_read(&hw->atu_error_inject) == 1)
+		return true;
+
+	return false;
+}
+
+/**
+ * cass_pin() - Call pin_user_pages() to pin an address range
+ *
+ * @cac:     Address Context metadata
+ * @pages:   Array of pages returned. Only used if there is an error.
+ * @npages:  Number of pages to pin
+ * @addr:    Virtual address
+ * @write:   Write permission
+ *
+ * Return: Success or -EFAULT or return value of gup
+ */
+int cass_pin(const struct cass_ac *cac, struct page **pages, int npages,
+	     u64 addr, bool write)
+{
+	int i;
+	int gotn;
+	unsigned int gup_flags = FOLL_LONGTERM | (write ? FOLL_WRITE : 0);
+
+	gotn = pin_user_pages_fast(addr, npages, gup_flags, pages);
+	if (gotn < 0)
+		return gotn;
+
+	if ((gotn != npages) || cass_error_inject(cac->lni_priv)) {
+		pr_debug("gup failed gotn %d of %d\n", gotn, npages);
+
+		for (i = 0; i < gotn; i++)
+			unpin_user_page(pages[i]);
+
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+/**
+ * cass_mirror_hp() - Mirror simulated hugepages from a large hugepage
+ *
+ * Support testing of arbitrary hugepage sizes.
+ * These pages do not have a notifier callback.
+ * The pinned pages are contiguous pages masquerading as a larger page size.
+ *
+ * @m_opts: map options
+ * @md_priv: Private memory descriptor
+ *
+ * Return: number of mirrored pages or error
+ */
+int cass_mirror_hp(const struct ac_map_opts *m_opts, struct cxi_md_priv *md_priv)
+{
+	int i;
+	int ret = 0;
+	int l0_index;
+	int l1_index;
+	dma_addr_t dma_addr;
+	union a_pte *ppde;
+	union a_pte pde = {};
+	struct page *page;
+	u64 iova = m_opts->iova;
+	struct cass_ac *cac = md_priv->cac;
+	uintptr_t addr = m_opts->va_start;
+	int n_mir = 1 + ((m_opts->va_len - 1) >> cac->huge_shift);
+
+	mutex_lock(&cac->ac_mutex);
+
+	for (i = 0; i < n_mir; i++) {
+		ret = cass_pin(cac, &page, 1, addr, true);
+		if (ret)
+			break;
+
+		unpin_user_page(page);
+
+		dma_addr = dma_map_page(md_priv->device, page, 0,
+					1 << cac->huge_shift,
+					DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(md_priv->device, dma_addr)) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		cass_pg_tbl_indices(cac, iova - cac->iova_base, &l0_index,
+				    &l1_index);
+		ppde = &cac->nta->root_ptr[l0_index];
+		cass_pte_build(0, &pde, dma_addr, true, m_opts->flags, false,
+			       true);
+
+		atu_debug("pde dma_addr:0x%llx entry:%llx\n", dma_addr, pde.qw);
+		ppde->qw = pde.qw;
+
+		iova += BIT(cac->huge_shift);
+		addr += BIT(cac->huge_shift);
+	}
+
+	if (ret) {
+		pr_debug("ret:%d\n", ret);
+		cass_clear_range(md_priv, m_opts->iova, i << cac->huge_shift);
+	}
+
+	mutex_unlock(&cac->ac_mutex);
+
+	return ret;
+}
+
+/**
+ * cass_mirror_device() - Mirror a GPU device memory address range into
+ *                        device page tables
+ *
+ * @md_priv: Private memory descriptor
+ * @m_opts:  User options containing the IOVA range
+ *
+ * Return: 0 on success, -ENOENT if not GPU memory or error
+ */
+int cass_mirror_device(struct cxi_md_priv *md_priv,
+		       const struct ac_map_opts *m_opts)
+{
+	int i;
+	int j = 0;
+	int ret;
+	bool inval;
+	struct scatterlist *sg;
+	u64 iova = md_priv->md.iova;
+	struct cass_ac *cac = md_priv->cac;
+	size_t plen = BIT(cac->page_shift);
+	size_t hlen = BIT(cac->huge_shift);
+
+	mutex_lock(&md_priv->cac->ac_mutex);
+
+	i = 0;
+	for_each_sgtable_dma_sg(md_priv->sgt, sg, j) {
+		long len = sg_dma_len(sg);
+		dma_addr_t dma_addr = sg_dma_address(sg);
+
+		atu_debug("dma_addr:%llx len:%lx\n", dma_addr, len);
+
+		while (len > 0) {
+			bool is_hp = ffsl(dma_addr) >= cac->huge_shift &&
+					ffsl(iova) >= cac->huge_shift &&
+					len >= hlen;
+			size_t inc = is_hp ? hlen : plen;
+
+			atu_debug("iova:%llx dma_addr:%llx inc:%lx\n",
+				  iova, dma_addr, inc);
+			ret = cass_dma_addr_mirror(dma_addr, iova, cac,
+						   md_priv->flags,
+						   is_hp, &inval);
+			if (ret)
+				goto mirror_error;
+
+			iova += inc;
+			dma_addr += inc;
+			len -= inc;
+			i += KPFN_INC(cac, is_hp);
+		}
+	}
+
+	mutex_unlock(&md_priv->cac->ac_mutex);
+
+	return 0;
+
+mirror_error:
+	if (i) {
+		pr_err("Error populating length 0x%lx at index %d\n",
+		       md_priv->md.len, i);
+
+		/* Clean up previously populated ptes. */
+		cass_clear_range(md_priv, md_priv->md.iova, md_priv->md.len);
+	}
+
+	mutex_unlock(&md_priv->cac->ac_mutex);
+
+	return ret;
+}
+
+/**
+ * cass_mirror_odp() - Mirror a virtual address range into device page tables
+ *
+ * @m_opts:  User options containing the IOVA range
+ * @cac:     Address Context
+ * @npfns:   Number of pages
+ * @addr:    Virtual address
+ *
+ * @return: 0 on success or negative error value
+ */
+int cass_mirror_odp(const struct ac_map_opts *m_opts, struct cass_ac *cac,
+		    int npfns, u64 addr)
+{
+	int ret;
+	u64 *pfns;
+
+	pfns = kcalloc(npfns, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
+		return -ENOMEM;
+
+	ret = cass_mirror_fault(m_opts, pfns, npfns, addr, m_opts->va_len);
+
+	kfree(pfns);
+
+	return ret;
+}
+
+static int cass_dma_map_pages(struct cxi_md_priv *md_priv,
+			      struct page **pages, int npages, bool is_huge_page)
+{
+	int ret;
+	struct sg_table *sgt;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return -ENOMEM;
+
+	ret = sg_alloc_table_from_pages_segment(sgt, pages, npages,
+						0, md_priv->md.len, UINT_MAX, GFP_KERNEL);
+	if (ret)
+		goto sg_table_error;
+
+	ret = dma_map_sgtable(md_priv->device, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto dma_map_error;
+
+	md_priv->sgt = sgt;
+
+	return 0;
+
+dma_map_error:
+	sg_free_table(sgt);
+sg_table_error:
+	kfree(sgt);
+
+	return ret;
+}
+
+void cass_dma_unmap_pages(struct cxi_md_priv *md_priv)
+{
+	if (!md_priv->sgt)
+		return;
+
+	if (md_priv->external_sgt_owner)
+		return;
+
+	dma_unmap_sgtable(md_priv->device, md_priv->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(md_priv->sgt);
+	kfree(md_priv->sgt);
+	md_priv->sgt = NULL;
+}
+
+/**
+ * cass_pin_mirror() - Pin and mirror a virtual address range into device
+ *                     page tables
+ *
+ * @m_opts:  User options containing the IOVA range
+ * @md_priv: Private memory descriptor
+ *
+ * Return: 0 on success or error
+ */
+int cass_pin_mirror(struct cxi_md_priv *md_priv, struct ac_map_opts *m_opts)
+{
+	int i;
+	int ret;
+	int addr_inc;
+	bool inval = false;
+	int invalidate = 0;
+	bool is_huge_page;
+	u64 iova = m_opts->iova;
+	struct page **pages = NULL;
+	struct cass_ac *cac = md_priv->cac;
+	uintptr_t addr = m_opts->va_start;
+	uintptr_t end = m_opts->va_end;
+	int hlen = BIT(m_opts->huge_shift);
+	int plen = BIT(m_opts->page_shift);
+	u64 hmask = hlen - 1;
+	size_t md_len = m_opts->va_len;
+	int npages = m_opts->va_len >> PAGE_SHIFT;
+	struct scatterlist *sg;
+
+	pages = kvmalloc_array(npages, sizeof(pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	mmap_read_lock(current->mm);
+	ret = cass_vma_write_flag(current->mm, addr, end, m_opts->flags);
+	mmap_read_unlock(current->mm);
+
+	if (ret < 0)
+		goto err;
+
+	ret = cass_pin(cac, pages, npages, m_opts->va_start, ret);
+	if (ret < 0)
+		goto err;
+
+	ret = cass_dma_map_pages(md_priv, pages, npages, m_opts->is_huge_page);
+	if (ret)
+		goto map_err;
+
+	mutex_lock(&cac->ac_mutex);
+
+	for_each_sgtable_dma_sg(md_priv->sgt, sg, i) {
+		size_t len = sg_dma_len(sg);
+		dma_addr_t dma_addr = sg_dma_address(sg);
+
+		while (len > 0 && md_len > 0) {
+			is_huge_page = m_opts->is_huge_page && (len >= hlen) &&
+						!(iova & hmask);
+			addr_inc = is_huge_page ? hlen : plen;
+
+			ret = cass_dma_addr_mirror(dma_addr, iova, cac,
+						   m_opts->flags,
+						   is_huge_page, &inval);
+			if (ret) {
+				pr_err("Error populating %d PTEs at index %d iova:%llx inc:%x\n",
+				       npages, i, iova, addr_inc);
+				goto mirror_error;
+			}
+
+			dma_addr += addr_inc;
+			iova += addr_inc;
+			len -= addr_inc;
+			md_len -= addr_inc;
+			invalidate += inval;
+		}
+
+		if (md_len <= 0)
+			break;
+	}
+
+	mutex_unlock(&cac->ac_mutex);
+
+	if (invalidate)
+		cass_invalidate_range(cac, m_opts->iova, plen * i);
+
+	md_priv->pages = pages;
+
+	return 0;
+
+mirror_error:
+	cass_clear_range(md_priv, m_opts->iova, plen * i);
+	mutex_unlock(&cac->ac_mutex);
+	cass_dma_unmap_pages(md_priv);
+
+map_err:
+	unpin_user_pages(pages, npages);
+
+err:
+	kvfree(pages);
+
+	return ret;
+}
+
+static int atu_odpq_space(struct cass_dev *hw)
+{
+	union c_atu_sts_odpq sts_odpq;
+
+	cass_read(hw, C_ATU_STS_ODPQ, &sts_odpq, sizeof(sts_odpq));
+
+	return sts_odpq.odpq_space;
+}
+
+static int cass_odpq_space(struct cass_dev *hw)
+{
+	int ret;
+	int space;
+
+	ret = readx_poll_timeout(atu_odpq_space, hw, space, (space > 0), 1,
+				 ATU_ODPQ_SPACE_TIMEOUT);
+	if (ret) {
+		pr_err("Timed out waiting for ODPQ space\n");
+		return ret;
+	}
+
+	return space;
+}
+
+/**
+ * cass_odpq_write() - Write the result of a page request
+ *
+ * Also used to clear out expired page requests.
+ * The queue is 8 deep and we just write one entry at
+ * a time so it should never overflow.
+ *
+ * @hw:     the device
+ * @index:  PRB entry
+ * @status: C_ATU_ODP_FAILURE or C_ATU_ODP_SUCCESS
+ */
+static void cass_odpq_write(struct cass_dev *hw, int index,
+			    enum c_odp_status status)
+{
+	int space;
+	union c_atu_cfg_odpq odpq = {
+		.status = status,
+		.prb_index = index
+	};
+
+	mutex_lock(&hw->odpq_mutex);
+
+	space = cass_odpq_space(hw);
+	if (space <= 0)
+		pr_err("Timed out waiting for ODPQ\n");
+	else
+		cass_write(hw, C_ATU_CFG_ODPQ, &odpq, sizeof(odpq));
+
+	mutex_unlock(&hw->odpq_mutex);
+}
+
+/**
+ * cass_prb_worker() - Clean up expired PRB entries
+ *
+ * Scan the PRB table and look for expired entries and report entry as
+ * failed. Keep scanning until there are no more entries.
+ *
+ * @work: the work_struct
+ */
+static void cass_prb_worker(struct work_struct *work)
+{
+	int i;
+	bool scan_again;
+	union c_atu_sts_prb_table entry;
+	struct cass_dev *hw = container_of(work, struct cass_dev, prb_work);
+
+	do {
+		scan_again = false;
+
+		for (i = 0; i < C_ATU_STS_PRB_TABLE_ENTRIES; i++) {
+			cass_read(hw, C_ATU_STS_PRB_TABLE(i), &entry,
+				  sizeof(entry));
+
+			if (entry.valid && entry.expired) {
+				pr_warn("Entry %d expired ac:%d addr:%lx\n",
+					i, entry.acid,
+					(ulong)entry.addr << PAGE_SHIFT);
+				scan_again = true;
+				cass_odpq_write(hw, i, C_ATU_ODP_FAILURE);
+				atomic_inc(&hw->atu_prb_expired);
+			}
+		}
+	} while (scan_again);
+}
+
+static void add_md_time_to_bin(struct cass_dev *hw, ktime_t time)
+{
+	int i;
+	int bin = FIRST_MDBIN;
+
+	if (ktime_compare(hw->pri_max_md_time, time) < 0)
+		hw->pri_max_md_time = time;
+
+	for (i = 0; i < MDBINS; i++, bin <<= 1) {
+		if (time < bin) {
+			hw->pri_md_time[i]++;
+			break;
+		}
+	}
+}
+
+static void add_fault_time_to_bin(struct cass_dev *hw, ktime_t time)
+{
+	int i;
+	int bin = FIRST_FBIN;
+
+	if (ktime_compare(hw->pri_max_fault_time, time) < 0)
+		hw->pri_max_fault_time = time;
+
+	for (i = 0; i < FBINS; i++, bin <<= 1) {
+		if (time < bin) {
+			hw->pri_fault_time[i]++;
+			break;
+		}
+	}
+}
+
+/**
+ * cass_pri_fault() - Respond to a NIC PRI page request
+ *
+ * The page request interface consists of a buffer of 512
+ * page request entries containing an AC, index and iova.
+ * Fault in the page requested, clear the request in the
+ * buffer and write a response to the ODP queue.
+ * The page request interface can only request one page
+ * at a time.
+ *
+ * @hw:  the device
+ * @pre: page request entry
+ */
+static void cass_pri_fault(struct cass_dev *hw,
+			   struct c_page_request_entry *pre)
+{
+	int rc = -1;
+	u64 iova = 0;
+	u64 addr = 0;
+	int npages;
+	int align_shift;
+	int index = pre->index;
+	struct cass_ac *cac;
+	struct cxi_md_priv *e = NULL;
+	struct ac_map_opts m_opts = {};
+	union c_atu_sts_prb_table entry;
+	enum c_odp_status status = C_ATU_ODP_FAILURE;
+	ktime_t fault_time;
+	ktime_t fault_start;
+	ktime_t get_md_time;
+	ktime_t start = ktime_get_raw();
+
+	cac = cass_cac_get(hw, pre->acid);
+	if (!cac)
+		goto no_cac;
+
+	iova = (u64)pre->addr << C_ADDR_SHIFT;
+
+	if (!(cac->flags & CXI_MAP_USER_ADDR)) {
+		pr_err("Kern iova:%llx page not present\n", iova);
+		goto no_cac;
+	}
+
+	mutex_lock(&cac->md_mutex);
+	list_for_each_entry(e, &cac->md_list, md_entry) {
+		u64 md_end = e->md.iova + e->md.len;
+
+		if ((e->md.iova <= iova) && (iova < md_end)) {
+			addr = e->md.va + (iova - e->md.iova);
+			m_opts.flags = e->flags;
+			break;
+		}
+	}
+
+	fault_start = ktime_get_raw();
+	get_md_time = fault_start - start;
+	add_md_time_to_bin(hw, get_md_time);
+
+	if (!addr)
+		goto no_md;
+
+	align_shift = pri_shift;
+	m_opts.page_shift = cac->page_shift;
+	m_opts.va_end = addr + PAGE_SIZE;
+	rc = cass_cpu_page_size(hw, &m_opts, e->mn_sub.mm, addr, NULL,
+				&align_shift);
+	if (rc)
+		goto no_md;
+
+	/* There may be vmas with larger hugepage sizes than the AC
+	 * is configured with. Use the smaller of AC configured
+	 * hugepage size or vma hugepage size (if present).
+	 */
+	align_shift = min_t(int, align_shift, cac->huge_shift);
+
+	/* Align the m_opts.va_* to align_shift */
+	cass_align_start_len(&m_opts, addr, PAGE_SIZE, align_shift);
+	/* Bound the m_opts.va_* to the MD */
+	m_opts.va_start = max_t(u64, m_opts.va_start, e->md.va);
+	m_opts.va_end = min_t(u64, m_opts.va_end, e->md.va + e->md.len);
+	m_opts.va_len = m_opts.va_end - m_opts.va_start;
+	/* Adjust iova to match va_start offset from addr */
+	m_opts.iova = iova - (addr - m_opts.va_start);
+	m_opts.md_priv = e;
+	m_opts.flags |= CXI_MAP_FAULT;
+
+	atu_debug("req_iova:%llx addr:%llx md:%d md.va:%llx iova:%llx start:%llx end:%llx va_len:%lx\n",
+		  iova, addr, e->md.id, e->md.va, m_opts.iova, m_opts.va_start,
+		  m_opts.va_end, m_opts.va_len);
+
+	npages = m_opts.va_len >> cac->page_shift;
+	rc = cass_mirror_odp(&m_opts, cac, npages, m_opts.va_start);
+	if (rc >= 0)
+		status = C_ATU_ODP_SUCCESS;
+	else {
+		atomic_inc(&hw->atu_odp_fails);
+		cass_read(hw, C_ATU_STS_PRB_TABLE(index), &entry,
+			  sizeof(entry));
+		pr_warn("ODP failure rc:%d PRT:ac:%d iova:%llx mdva:%llx SPRBT:i:%d v:%d e:%d ac:%d client:%d addr:%lx w:%d r:%d\n",
+			rc, pre->acid, iova, e->md.va,
+			index, entry.valid, entry.expired, entry.acid,
+			entry.client, (ulong)entry.addr << PAGE_SHIFT,
+			entry.w, entry.r);
+	}
+
+	fault_time = ktime_get_raw() - fault_start;
+	add_fault_time_to_bin(hw, fault_time);
+
+no_md:
+	mutex_unlock(&cac->md_mutex);
+no_cac:
+	atu_debug("sts:%s rc:%d ac:%d index:%d iova:%llx md.va:%llx\n",
+		  status ? "f" : "s", rc, pre->acid, index, iova, e ? e->md.va : 0);
+
+	*(u64 *)pre = 0;
+	/* make sure entry is zeroed before reporting to hw */
+	wmb();
+	atomic_inc(&hw->atu_odp_requests);
+	cass_odpq_write(hw, index, status);
+	cass_cac_put(cac);
+}
+
+static void cass_pri_worker(struct work_struct *work)
+{
+	struct c_page_request_entry *pre;
+	struct cass_dev *hw = container_of(work, struct cass_dev, pri_work);
+	int rd_ptr = hw->pri_rd_ptr;
+
+	while (1) {
+		pre = &hw->page_request_table[rd_ptr];
+
+		if (!pre->acid)
+			break;
+
+		cass_pri_fault(hw, pre);
+		rd_ptr = (rd_ptr + 1) % C_ATU_PRB_ENTRIES;
+	}
+
+	hw->pri_rd_ptr = rd_ptr;
+}
+
+static irqreturn_t cass_pri_int_cb(int irq, void *context)
+{
+	struct cass_dev *hw = context;
+
+	queue_work(hw->pri_wq, &hw->pri_work);
+
+	return IRQ_HANDLED;
+}
+
+int cass_nta_mirror_sgt(struct cxi_md_priv *md_priv, bool need_lock)
+{
+	int i;
+	int j = 0;
+	int ret;
+	bool inval;
+	struct scatterlist *sg;
+	u64 iova = md_priv->md.iova;
+	struct cass_ac *cac = md_priv->cac;
+
+	cass_cond_lock(&cac->ac_mutex, need_lock);
+
+	for_each_sgtable_dma_sg(md_priv->sgt, sg, i) {
+		dma_addr_t dma_addr = sg_dma_address(sg) & PAGE_MASK;
+		long len = sg_dma_len(sg) + (sg_dma_address(sg) % PAGE_SIZE);
+
+		atu_debug("dma_addr:%llx len:%lx\n", dma_addr, len);
+
+		while (len > 0) {
+			ret = cass_dma_addr_mirror(dma_addr, iova, cac,
+						   md_priv->flags, false,
+						   &inval);
+			if (ret)
+				goto mirror_error;
+
+			dma_addr += PAGE_SIZE;
+			iova += PAGE_SIZE;
+			len -= PAGE_SIZE;
+			j++;
+		}
+	}
+
+	cass_cond_unlock(&cac->ac_mutex, need_lock);
+
+	return 0;
+
+mirror_error:
+	cass_clear_range(md_priv, md_priv->md.iova, j * PAGE_SIZE);
+	cass_cond_unlock(&cac->ac_mutex, need_lock);
+
+	return ret;
+}
+
+int cass_nta_mirror_kern(struct cxi_md_priv *md_priv,
+			 const struct iov_iter *iter, bool need_lock)
+{
+	int i;
+	int j;
+	int ret;
+	int alen;
+	struct page *page;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	u64 iova = md_priv->md.iova;
+	uintptr_t addr = md_priv->md.va;
+	int npages = md_priv->md.len >> PAGE_SHIFT;
+
+	sgt = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
+	if (!sgt)
+		return -ENOMEM;
+
+	ret = sg_alloc_table(sgt, npages, GFP_KERNEL);
+	if (ret)
+		goto sg_alloc_error;
+
+	pr_debug("va:%lx iova:%llx len:%lx\n", addr, iova, md_priv->md.len);
+
+	sg = sgt->sgl;
+	if (iter == NULL) {
+		for (i = 0; i < npages; i++) {
+			if (!sg) {
+				pr_info("sg is null at %d\n", i);
+				goto dma_map_error;
+			}
+			page = cass_virt_to_page(addr + (i * PAGE_SIZE));
+			sg_set_page(sg, page, PAGE_SIZE, 0);
+			sg = sg_next(sg);
+		}
+	} else if (iov_iter_is_bvec(iter)) {
+		const struct bio_vec *bvec = iter->bvec;
+
+		for (i = 0; i < npages; i++) {
+			sg_set_page(sg, bvec->bv_page, PAGE_SIZE, 0);
+			sg = sg_next(sg);
+			bvec++;
+		}
+	} else if (iov_iter_is_kvec(iter)) {
+		int ipages;
+		const struct kvec *kvec = iter->kvec;
+
+		for (i = 0; i < npages;) {
+			alen = PAGE_ALIGN(kvec->iov_len);
+			ipages = alen >> PAGE_SHIFT;
+
+			for (j = 0; j < ipages; j++) {
+				page = cass_virt_to_page((u64)kvec->iov_base +
+								j * PAGE_SIZE);
+				sg_set_page(sg, page, PAGE_SIZE, 0);
+				sg = sg_next(sg);
+				i++;
+			}
+
+			kvec++;
+		}
+	}
+
+	ret = dma_map_sgtable(md_priv->device, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto dma_map_error;
+
+	md_priv->sgt = sgt;
+
+	ret = cass_nta_mirror_sgt(md_priv, need_lock);
+	if (ret)
+		goto mirror_error;
+
+	md_priv->need_lock = false;
+
+	return 0;
+
+mirror_error:
+	dma_unmap_sgtable(md_priv->device, sgt, DMA_BIDIRECTIONAL, 0);
+
+dma_map_error:
+	sg_free_table(sgt);
+
+sg_alloc_error:
+	kfree(sgt);
+
+	return ret;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_p2p.c b/drivers/net/ethernet/hpe/ss1/cass_p2p.c
new file mode 100644
index 000000000000..02845ff7649a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_p2p.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2021 Hewlett Packard Enterprise Development LP */
+
+/* GPU direct (P2P) interface */
+
+#include "cass_core.h"
+
+static bool device_hugepage_enable = true;
+module_param(device_hugepage_enable, bool, 0644);
+MODULE_PARM_DESC(device_hugepage_enable, "Enable device hugepages");
+
+#define DEVICE_HS_ARRAY_SIZE 2
+static int device_hs_array_n = DEVICE_HS_ARRAY_SIZE;
+/* Default to 2MB and 64M. */
+static int device_hs_array[DEVICE_HS_ARRAY_SIZE] = {21, 26};
+
+#define MIN_DEVICE_HP_SHIFT (MIN_DEVICE_PG_TABLE_SIZE + PAGE_SHIFT)
+#define MAX_DEVICE_HP_SHIFT (MIN_DEVICE_HP_SHIFT + MAX_PG_TABLE_SIZE)
+#define DEVICE_HS_ARRAY_BUFFER_SIZE (DEVICE_HS_ARRAY_SIZE * 3)
+
+static int device_hs_array_get(char *buffer, const struct kernel_param *kp)
+{
+	return param_array_ops.get(buffer, kp);
+}
+
+static int device_hs_array_set(const char *val, const struct kernel_param *kp)
+{
+	int i;
+	int ret;
+	int prev = 0;
+	char buf[DEVICE_HS_ARRAY_BUFFER_SIZE];
+
+	/* save the current list in case there is an invalid value */
+	ret = device_hs_array_get(buf, kp);
+	if (ret < 0)
+		return ret;
+
+	/* set to the new value */
+	ret = param_array_ops.set(val, kp);
+	if (ret)
+		return ret;
+
+	/* check for out of range and that they are ascending in value */
+	for (i = 0; i < device_hs_array_n; i++) {
+		if (device_hs_array[i] < MIN_DEVICE_HP_SHIFT ||
+		    device_hs_array[i] > MAX_DEVICE_HP_SHIFT) {
+			pr_info("Value (%d) out of range of %d-%d\n",
+				device_hs_array[i], MIN_DEVICE_HP_SHIFT,
+				MAX_DEVICE_HP_SHIFT);
+			goto invalid;
+		}
+
+		if (device_hs_array[i] < prev) {
+			pr_info("Values should be ascending\n");
+			goto invalid;
+		}
+
+		prev = device_hs_array[i];
+	}
+
+	return 0;
+invalid:
+	/* restore previous values */
+	param_array_ops.set(buf, kp);
+	return -EINVAL;
+}
+
+static const struct kernel_param_ops device_hs_array_ops = {
+	.set = device_hs_array_set,
+	.get = device_hs_array_get,
+};
+
+/* Modified version of module_param_array_named to include the ops */
+#define module_param_array_named_cb(name, array, type, _ops, nump, perm) \
+	param_check_##type(name, &(array)[0]);				\
+	static const struct kparam_array __param_arr_##name		\
+	= { .max = ARRAY_SIZE(array), .num = nump,			\
+	    .ops = &param_ops_##type,					\
+	    .elemsize = sizeof(array[0]), .elem = array };		\
+	__module_param_call(MODULE_PARAM_PREFIX, name, &_ops,		\
+			    .arr = &__param_arr_##name, perm, -1, 0);	\
+	__MODULE_PARM_TYPE(name, "array of " #type)
+
+module_param_array_named_cb(device_hs_array, device_hs_array, int,
+			    device_hs_array_ops, &device_hs_array_n, 0644);
+MODULE_PARM_DESC(device_hs_array, "Array of allowed hugeshift values");
+
+enum cxi_p2p_type {
+	CXI_P2P_AMD_GPU = 1,
+	CXI_P2P_NVIDIA_GPU,
+};
+
+static enum cxi_p2p_type cxi_supported_p2p_type;
+static DEFINE_MUTEX(p2p_init_lock);
+
+/**
+ * cxi_p2p_init - Discover a GPU direct interface and initialize it.
+ */
+static int cxi_p2p_init(void)
+{
+	int ret = 0;
+
+	if (cxi_supported_p2p_type > 0)
+		return 0;
+
+	mutex_lock(&p2p_init_lock);
+
+	if (cxi_supported_p2p_type > 0)
+		goto out_unlock;
+
+#ifdef HAVE_NVIDIA_P2P
+	ret = nvidia_p2p_init();
+	if (!ret) {
+		cxi_supported_p2p_type = CXI_P2P_NVIDIA_GPU;
+		goto out_unlock;
+	}
+#endif
+
+#ifdef HAVE_AMD_RDMA
+	ret = amd_p2p_init();
+	if (!ret)
+		cxi_supported_p2p_type = CXI_P2P_AMD_GPU;
+#endif
+
+out_unlock:
+	mutex_unlock(&p2p_init_lock);
+
+	return ret;
+}
+
+/**
+ * cxi_p2p_fini - Clean up a GPU direct interface.
+ */
+void cxi_p2p_fini(void)
+{
+	switch (cxi_supported_p2p_type) {
+	case CXI_P2P_AMD_GPU:
+#ifdef HAVE_AMD_RDMA
+		amd_p2p_fini();
+#endif
+		break;
+	case CXI_P2P_NVIDIA_GPU:
+#ifdef HAVE_NVIDIA_P2P
+		nvidia_p2p_fini();
+#endif
+		break;
+	}
+}
+
+/**
+ * cass_device_md() - Allocate a memory descriptor and get GPU device pages
+ *
+ * @lni_priv: LNI
+ * @va: device virtual address
+ * @len: length
+ * @dma_addr: dma address of va
+ * @return: memory descriptor
+ */
+struct cxi_md_priv *cass_device_md(struct cxi_lni_priv *lni_priv, u64 va,
+				   size_t len, dma_addr_t *dma_addr)
+{
+	int rc;
+	struct ac_map_opts m_opts = {};
+	struct cxi_md_priv *md_priv;
+	struct cass_dev *hw = container_of(lni_priv->dev, struct cass_dev,
+					   cdev);
+
+	rc = cass_is_device_memory(hw, &m_opts, va, len);
+	if (rc)
+		return ERR_PTR(rc);
+
+	md_priv = kzalloc(sizeof(*md_priv), GFP_KERNEL);
+	if (!md_priv)
+		return ERR_PTR(-ENOMEM);
+
+	m_opts.md_priv = md_priv;
+	cass_align_start_len(&m_opts, va, len, m_opts.page_shift);
+
+	md_priv->lni_priv = lni_priv;
+	md_priv->md.va = m_opts.va_start;
+	md_priv->md.len = m_opts.va_len;
+	md_priv->md.page_shift = m_opts.page_shift;
+
+	refcount_set(&md_priv->refcount, 1);
+
+	rc = cass_device_get_pages(&m_opts);
+	if (rc) {
+		kfree(md_priv);
+		return ERR_PTR(rc);
+	}
+
+	/* Get the first entry of the sg_table */
+	*dma_addr = sg_dma_address(md_priv->sgt->sgl);
+
+	return md_priv;
+}
+
+/**
+ * cass_device_hugepage_size - Determine an appropriate hugepage size for
+ *                             the dma address list based on the number of
+ *                             contiguous entries.
+ *
+ * @contig_cnt: Number contiguous entries
+ * @m_opts: User map options
+ */
+void cass_device_hugepage_size(int contig_cnt, struct ac_map_opts *m_opts)
+{
+	int i;
+	int va_shift;
+	int len_shift;
+	int cntg_shift;
+	int daddr_shift;
+	int align_shift;
+	dma_addr_t dma_addr = sg_dma_address(m_opts->md_priv->sgt->sgl);
+
+	if (!device_hugepage_enable)
+		return;
+
+	cntg_shift = flsl(contig_cnt) + m_opts->page_shift;
+	len_shift = ffsl(__rounddown_pow_of_two(m_opts->va_len));
+	va_shift = ffsl(m_opts->va_start);
+	daddr_shift = ffsl(dma_addr);
+	align_shift = min_t(int, va_shift, len_shift);
+	align_shift = min_t(int, daddr_shift, align_shift);
+	align_shift = min_t(int, cntg_shift, align_shift);
+
+	/* From the list of usable hugepage sizes, pick the largest one
+	 * that the registration consumes.
+	 */
+	for (i = device_hs_array_n - 1; i >= 0; i--) {
+		int page_table_size = device_hs_array[i] - m_opts->page_shift;
+
+		if (device_hs_array[i] <= align_shift &&
+		    page_table_size <= MAX_PG_TABLE_SIZE &&
+				page_table_size >= MIN_DEVICE_PG_TABLE_SIZE) {
+			m_opts->is_huge_page = true;
+			m_opts->huge_shift = device_hs_array[i];
+			break;
+		}
+	}
+
+	pr_debug("len:%lx align_shift:%d hs:%d is_hp:%d\n", m_opts->va_len,
+		 align_shift, m_opts->huge_shift, m_opts->is_huge_page);
+}
+
+/**
+ * cass_is_device_memory - Check if va is backed by device memory
+ *
+ * Also, return the page size.
+ *
+ * @hw: The cassini device
+ * @m_opts: User map options
+ * @va: Device virtual address
+ * @len: Length of address to map in bytes
+ * @return: 0 on success or < 0 on failure
+ */
+int cass_is_device_memory(struct cass_dev *hw, struct ac_map_opts *m_opts,
+			  uintptr_t va, size_t len)
+{
+	int ret;
+
+	if (m_opts->md_priv &&
+	    m_opts->md_priv->dmabuf_fd != INVALID_DMABUF_FD) {
+		m_opts->page_shift = PAGE_SHIFT;
+
+		return 0;
+	}
+
+	if (p2p_ops.is_device_mem == NULL) {
+		ret = cxi_p2p_init();
+		if (ret) {
+			cxidev_info_ratelimited(&hw->cdev, "p2p_init failed %d\n",
+						ret);
+			return ret;
+		}
+	}
+
+	if (!p2p_ops.is_device_mem)
+		return -EOPNOTSUPP;
+
+	ret = p2p_ops.is_device_mem(va, len, &m_opts->page_shift);
+	if (ret) {
+		cxidev_info_ratelimited(&hw->cdev, "Expected device memory ret:%d\n",
+					ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * cass_device_get_pages - Get device pages
+ *
+ * @m_opts: User map options
+ * @return: 0 on success or < 0 on failure
+ */
+int cass_device_get_pages(struct ac_map_opts *m_opts)
+{
+	if (m_opts->md_priv->dmabuf_fd != INVALID_DMABUF_FD)
+		return cxi_dmabuf_get_pages(m_opts);
+
+	if (p2p_ops.get_pages)
+		return p2p_ops.get_pages(m_opts);
+
+	return -EINVAL;
+}
+
+/**
+ * cass_device_put_pages - Put device pages returned from cass_device_get_pages
+ *
+ * @md_priv: Private memory descriptor
+ */
+void cass_device_put_pages(struct cxi_md_priv *md_priv)
+{
+	if (md_priv->dmabuf_fd != INVALID_DMABUF_FD) {
+		cxi_dmabuf_put_pages(md_priv);
+		return;
+	}
+
+	p2p_ops.put_pages(md_priv);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rmu.c b/drivers/net/ethernet/hpe/ss1/cass_rmu.c
new file mode 100644
index 000000000000..c510831c9e15
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rmu.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Create and destroy Cassini command queues */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/rbtree.h>
+#include <linux/types.h>
+
+#include "cass_core.h"
+#include "cass_ss1_debugfs.h"
+
+/* Add a new domain into a device domain tree. */
+static int insert_domain(struct rb_root *root,
+			 struct cxi_domain_priv *domain_priv)
+{
+	struct rb_node **new = &(root->rb_node), *parent = NULL;
+
+	/* Figure out where to put new node */
+	while (*new) {
+		struct cxi_domain_priv *this =
+			container_of(*new, struct cxi_domain_priv, node);
+
+		parent = *new;
+		if (domain_priv->domain.vni < this->domain.vni)
+			new = &((*new)->rb_left);
+		else if (domain_priv->domain.vni > this->domain.vni)
+			new = &((*new)->rb_right);
+		else if (domain_priv->domain.pid < this->domain.pid)
+			new = &((*new)->rb_left);
+		else if (domain_priv->domain.pid > this->domain.pid)
+			new = &((*new)->rb_right);
+		else
+			return -EEXIST;
+	}
+
+	/* Add new node and rebalance tree. */
+	rb_link_node(&domain_priv->node, parent, new);
+	rb_insert_color(&domain_priv->node, root);
+
+	return 0;
+}
+
+/* Look up an existing domain by (vni,pid) without modifying the tree. */
+static struct cxi_domain_priv *find_domain(struct rb_root *root,
+					   unsigned int vni, unsigned int pid)
+{
+	struct rb_node *node = root->rb_node;
+
+	while (node) {
+		struct cxi_domain_priv *this =
+			container_of(node, struct cxi_domain_priv, node);
+
+		if (vni < this->domain.vni)
+			node = node->rb_left;
+		else if (vni > this->domain.vni)
+			node = node->rb_right;
+		else if (pid < this->domain.pid)
+			node = node->rb_left;
+		else if (pid > this->domain.pid)
+			node = node->rb_right;
+		else
+			return this;
+	}
+
+	return NULL;
+}
+
+/* Atomically reserve a contiguous range of VNI PIDs. On success, PIDs are
+ * reserved to the LNI. Reserved PIDs are released when the LNI is destroyed.
+ * cxi_domain_alloc() must be used to create a Domain using a reserved PID.
+ */
+int cxi_domain_reserve(struct cxi_lni *lni, unsigned int vni, unsigned int pid,
+		       unsigned int count)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cxi_rx_profile *rx_profile;
+	struct cxi_reserved_pids *pids;
+	int rc;
+	int i;
+
+	/* Sanity checks. */
+	if (!is_vni_valid(vni))
+		return -EINVAL;
+
+	if (!cxi_valid_vni(cdev, CXI_PROF_RX, vni))
+		return -EINVAL;
+
+	if (pid >= cdev->prop.pid_count && pid != C_PID_ANY)
+		return -EINVAL;
+
+	if (!count || count > cdev->prop.pid_count)
+		return -EINVAL;
+
+	rx_profile = cxi_dev_find_rx_profile(cdev, vni);
+	if (!rx_profile)
+		return -ENOENT;
+
+	rc = cxi_rx_profile_alloc_pid(lni_priv, rx_profile, pid, vni, count, true);
+	if (rc < 0)
+		goto put_rx_profile;
+	pid = rc;
+
+	pids = kzalloc(sizeof(*pids), GFP_KERNEL);
+	if (!pids) {
+		rc = -ENOMEM;
+		goto clear_pids;
+	}
+
+	pids->rx_profile = rx_profile;
+
+	for (i = 0; i < count; i++)
+		set_bit(pid + i, pids->table);
+
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&pids->entry, &lni_priv->reserved_pids);
+	spin_unlock(&lni_priv->res_lock);
+
+	return pid;
+
+clear_pids:
+	cxi_rx_profile_update_pid_table(rx_profile, pid, count, false);
+put_rx_profile:
+	cxi_rx_profile_dec_refcount(cdev, rx_profile);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_domain_reserve);
+
+/* Clean up PIDs reserved to the LNI. */
+void cxi_domain_lni_cleanup(struct cxi_lni_priv *lni_priv)
+{
+	struct cxi_reserved_pids *pids;
+
+	while ((pids = list_first_entry_or_null(&lni_priv->reserved_pids,
+						struct cxi_reserved_pids,
+						entry))) {
+		list_del(&pids->entry);
+		cxi_rx_profile_andnot_pid_table(pids,
+						lni_priv->dev->prop.pid_count);
+		cxi_rx_profile_dec_refcount(lni_priv->dev, pids->rx_profile);
+		kfree(pids);
+	}
+}
+
+/** cxi_domain_alloc_vf() - Allocate a domain for VF
+ *
+ * @lni: LNI to allocate the domain on
+ * @vni: VNI for the domain
+ * @pid: PID for the domain
+ *
+ * Return: Pointer to allocated domain on success, ERR_PTR on failure.
+ */
+static struct cxi_domain *
+cxi_domain_alloc_vf(struct cxi_lni *lni, unsigned int vni, unsigned int pid)
+{
+	struct cxi_lni_priv_vf *lni_priv_vf =
+		container_of(lni, struct cxi_lni_priv_vf, lni);
+	struct cxi_dev *dev = lni_priv_vf->dev;
+	struct cxi_domain_priv_vf *domain_priv_vf;
+	const struct cxi_domain_alloc_cmd cmd = {
+		.op = CXI_OP_DOMAIN_ALLOC,
+		.lni = lni_priv_vf->lni.id,
+		.vni = vni,
+		.pid = pid,
+	};
+	struct cxi_domain_alloc_resp resp;
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	domain_priv_vf = kzalloc(sizeof(*domain_priv_vf), GFP_KERNEL);
+	if (!domain_priv_vf)
+		return ERR_PTR(-ENOMEM);
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		goto error_out;
+
+	domain_priv_vf->lni_priv = container_of(lni, struct cxi_lni_priv, lni);
+	domain_priv_vf->domain.id = resp.domain;
+	domain_priv_vf->domain.vni = resp.vni;
+	domain_priv_vf->domain.pid = resp.pid;
+
+	return &domain_priv_vf->domain;
+
+error_out:
+	kfree(domain_priv_vf);
+
+	return ERR_PTR(rc);
+}
+
+/* Allocate a new domain, with a unique per-device VNI+PID. The VNI is
+ * reserved in the RMU table if it doesn't already exist.
+ */
+struct cxi_domain *cxi_domain_alloc(struct cxi_lni *lni, unsigned int vni,
+				    unsigned int pid)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_domain_priv *domain_priv;
+	struct cxi_domain_priv *existing;
+	int rc;
+	int domain_pid = pid;
+	struct cxi_rx_profile *rx_profile;
+
+	if (!cdev->is_physfn)
+		return cxi_domain_alloc_vf(lni, vni, pid);
+
+	/* Sanity checks. */
+	if (!is_vni_valid(vni))
+		return ERR_PTR(-EINVAL);
+
+	if (domain_pid >= cdev->prop.pid_count && domain_pid != C_PID_ANY)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Multiple QPs on one LNI (one PD/svc_id, in the RDMA per-PD-LNI
+	 * model) may legitimately want the same (vni,pid) domain identity —
+	 * e.g. several receive queues/services on one PID. Share the
+	 * existing object (refcounted) instead of colliding, but only
+	 * within the same LNI: cross-LNI reuse of one (vni,pid) would mean
+	 * two unrelated processes receiving on the same address, which
+	 * stays a hard conflict. A C_PID_ANY request always allocates
+	 * fresh, since there's nothing concrete yet to look up.
+	 */
+	if (domain_pid != C_PID_ANY) {
+		spin_lock(&hw->domain_lock);
+		existing = find_domain(&hw->domain_tree, vni, domain_pid);
+		if (existing) {
+			if (existing->lni_priv != lni_priv) {
+				spin_unlock(&hw->domain_lock);
+				return ERR_PTR(-EEXIST);
+			}
+			refcount_inc(&existing->refcount);
+			spin_unlock(&hw->domain_lock);
+			return &existing->domain;
+		}
+		spin_unlock(&hw->domain_lock);
+	}
+
+	rx_profile = cxi_dev_get_rx_profile(cdev, vni);
+	if (IS_ERR(rx_profile)) {
+		rc = PTR_ERR(rx_profile);
+		pr_debug("rx_profile not found for vni:%d rc:%d\n",
+			 vni, rc);
+		return ERR_PTR(rc);
+	}
+
+	domain_pid = cxi_rx_profile_alloc_pid(lni_priv, rx_profile, pid, vni,
+					      1, false);
+	if (domain_pid < 0) {
+		rc = domain_pid;
+		goto put_rx_profile;
+	}
+
+	domain_priv = kzalloc(sizeof(*domain_priv), GFP_KERNEL);
+	if (domain_priv == NULL) {
+		rc = -ENOMEM;
+		goto free_pid;
+	}
+
+	/* Get a domain ID */
+	rc = ida_alloc_min(&hw->domain_table, 1, GFP_KERNEL);
+	if (rc < 0) {
+		cxidev_err(cdev, "ida_alloc_min failed %d\n", rc);
+		goto free_domain;
+	}
+	domain_priv->domain.id = rc;
+
+	refcount_set(&domain_priv->refcount, 1);
+
+	domain_priv->lni_priv = lni_priv;
+	domain_priv->rx_profile = rx_profile;
+	domain_priv->domain.vni = vni;
+	domain_priv->domain.pid = domain_pid;
+
+	spin_lock(&hw->domain_lock);
+	rc = insert_domain(&hw->domain_tree, domain_priv);
+	spin_unlock(&hw->domain_lock);
+	if (rc)
+		goto free_dom_id;
+
+	domain_debugfs_create(vni, domain_pid, hw, domain_priv);
+
+	spin_lock(&lni_priv->res_lock);
+	atomic_inc(&hw->stats.domain);
+	list_add_tail(&domain_priv->list, &lni_priv->domain_list);
+	spin_unlock(&lni_priv->res_lock);
+
+	refcount_inc(&lni_priv->refcount);
+	return &domain_priv->domain;
+
+free_dom_id:
+	ida_free(&hw->domain_table, domain_priv->domain.id);
+free_domain:
+	kfree(domain_priv);
+free_pid:
+	cxi_rx_profile_update_pid_table(rx_profile, pid, 1, false);
+put_rx_profile:
+	cxi_rx_profile_dec_refcount(cdev, rx_profile);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL(cxi_domain_alloc);
+
+/** cxi_domain_free_vf() - Free an allocated domain for VF
+ *
+ * @domain: Domain to be freed
+ */
+static void cxi_domain_free_vf(struct cxi_domain *domain)
+{
+	struct cxi_domain_priv_vf *domain_priv_vf =
+		container_of(domain, struct cxi_domain_priv_vf, domain);
+	struct cxi_dev *dev = domain_priv_vf->lni_priv->dev;
+	const struct cxi_domain_free_cmd cmd = {
+		.op = CXI_OP_DOMAIN_FREE,
+		.domain = domain_priv_vf->domain.id,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		cxidev_warn(dev, "VF domain free request failed: %d\n", rc);
+
+	kfree(domain_priv_vf);
+}
+
+/* Free an allocated domain. */
+void cxi_domain_free(struct cxi_domain *domain)
+{
+	struct cxi_domain_priv *domain_priv =
+			container_of(domain, struct cxi_domain_priv, domain);
+	struct cxi_lni_priv *lni_priv = domain_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn) {
+		cxi_domain_free_vf(domain);
+		return;
+	}
+
+	/* Other QPs on this LNI may still hold a reference (see the reuse
+	 * path in cxi_domain_alloc()) — only the last one actually tears
+	 * this domain down.
+	 */
+	if (!refcount_dec_and_test(&domain_priv->refcount))
+		return;
+
+	spin_lock(&lni_priv->res_lock);
+	list_del(&domain_priv->list);
+	atomic_dec(&hw->stats.domain);
+	spin_unlock(&lni_priv->res_lock);
+
+	debugfs_remove_recursive(domain_priv->debug_dir);
+
+	spin_lock(&hw->domain_lock);
+	rb_erase(&domain_priv->node, &hw->domain_tree);
+	spin_unlock(&hw->domain_lock);
+
+	cxi_rx_profile_update_pid_table(domain_priv->rx_profile,
+					domain->pid, 1, false);
+	cxi_rx_profile_dec_refcount(cdev, domain_priv->rx_profile);
+
+	ida_free(&hw->domain_table, domain_priv->domain.id);
+	kfree(domain_priv);
+
+	refcount_dec(&lni_priv->refcount);
+}
+EXPORT_SYMBOL(cxi_domain_free);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rmu_eth.c b/drivers/net/ethernet/hpe/ss1/cass_rmu_eth.c
new file mode 100644
index 000000000000..150ba1f762b6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rmu_eth.c
@@ -0,0 +1,1017 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+/* RMU Ethernet Resource Management */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/etherdevice.h>
+#include <linux/ethtool.h>
+#include <linux/xarray.h>
+#include <linux/idr.h>
+
+#include "cass_core.h"
+#include "cxi_internal.h"
+
+_Static_assert(CXI_ETH_MAX_INDIR_ENTRIES <=
+	       C_RMU_CFG_PORTAL_INDEX_INDIR_TABLE_ENTRIES,
+	       "CXI_ETH_MAX_INDIR_ENTRIES exceeds NIC table size");
+
+/* Maximum number of concurrent clients allowed in PF */
+static unsigned int rmu_pf_max_clients = 2;
+module_param(rmu_pf_max_clients, uint, 0444);
+MODULE_PARM_DESC(rmu_pf_max_clients, "Maximum number of concurrent RMU Ethernet clients in PF");
+
+/* Total MAC filter allocation (set_list entries)
+ * - PF gets fixed quota: rmu_pf_client_max_filters (default 20, module parameter)
+ * - VFs split remaining pool equally.
+ */
+static unsigned int rmu_pf_client_max_filters = 20;
+module_param(rmu_pf_client_max_filters, uint, 0444);
+MODULE_PARM_DESC(rmu_pf_client_max_filters,
+		 "Maximum number of MAC filters allocated to a PF client");
+
+/* Indirection table allocation
+ * - PF gets fixed quota: rmu_pf_client_max_rss_indir_size (default 64, module parameter)
+ * - VFs split remaining pool equally.
+ */
+static unsigned int rmu_pf_client_max_rss_indir_size = 64;
+static int param_set_rmu_pf_client_max_rss_indir_size(const char *val,
+						      const struct kernel_param *kp)
+{
+	unsigned int tmp;
+	int rc;
+
+	rc = kstrtouint(val, 0, &tmp);
+	if (rc)
+		return rc;
+
+	if (tmp > CXI_ETH_MAX_INDIR_ENTRIES)
+		return -EINVAL;
+
+	*(unsigned int *)kp->arg = tmp;
+
+	return 0;
+}
+
+static const struct kernel_param_ops param_ops_rmu_pf_client_max_rss_indir_size = {
+	.set = param_set_rmu_pf_client_max_rss_indir_size,
+	.get = param_get_uint,
+};
+
+module_param_cb(rmu_pf_client_max_rss_indir_size,
+		&param_ops_rmu_pf_client_max_rss_indir_size,
+		&rmu_pf_client_max_rss_indir_size, 0444);
+MODULE_PARM_DESC(rmu_pf_client_max_rss_indir_size,
+		 "Maximum size of RSS indirection table for each PF client");
+
+/**
+ * validate_mac_vf() - Validate MAC address for VF use
+ * @mac_addr: MAC address to validate
+ *
+ * VFs can only use valid unicast MAC addresses (not multicast, broadcast, or zero).
+ * This also includes the reserved MAC addresses for PTP and multicast base,
+ * which should not be used by VFs.
+ *
+ * Return: 0 if valid, -EINVAL if invalid
+ */
+static int validate_mac_vf(u64 mac_addr)
+{
+	u8 addr[ETH_ALEN];
+
+	u64_to_ether_addr(mac_addr, addr);
+
+	return is_valid_ether_addr(addr) ? 0 : -EINVAL;
+}
+
+/**
+ * cxi_rmu_eth_alloc_vf() - Allocate Ethernet packet matching resources for VF
+ * @cdev: CXI device
+ *
+ * VF version: Sends allocation request to PF via vsock. The PF will allocate
+ * the actual hardware resources and track them. The VF maintains a minimal
+ * private structure for sending future commands to the PF.
+ *
+ * Return: Pointer to cxi_rmu_eth or ERR_PTR on error
+ */
+static struct cxi_rmu_eth *cxi_rmu_eth_alloc_vf(struct cxi_dev *cdev)
+{
+	struct cxi_rmu_eth_priv *priv;
+	struct cxi_rmu_eth_alloc_resp resp;
+	const struct cxi_rmu_eth_alloc_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_ALLOC,
+		.resp = &resp,
+	};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	/* Send allocation request to PF */
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc) {
+		kfree(priv);
+		return ERR_PTR(rc);
+	}
+
+	priv->dev = cdev;
+	priv->rmu_eth.id = resp.rmu_eth;
+
+	return &priv->rmu_eth;
+}
+
+/**
+ * cxi_rmu_eth_alloc_internal() - Allocate Ethernet packet matching resources
+ * @cdev: CXI device
+ * @vf_en: Whether this is a VF allocation
+ * @vf_num: VF number if vf_en is true
+ *
+ * PF supports up to CXI_RMU_ETH_PF_MAX_CLIENTS concurrent allocations.
+ * VFs support single client per function.
+ * Returns -EBUSY if no slots available.
+ *
+ * Automatically allocates FULL per-function quota based on num_vfs.
+ *
+ * Return: Pointer to cxi_rmu_eth or ERR_PTR on error
+ */
+struct cxi_rmu_eth *cxi_rmu_eth_alloc_internal(struct cxi_dev *cdev, bool vf_en, u8 vf_num)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_rmu_eth *rmu_eth = NULL;
+	struct cxi_rmu_eth_priv *priv;
+	unsigned int indir_quota;
+	unsigned int set_list_quota;
+	int id;
+	int i;
+
+	if (vf_en && hw->num_vfs == 0)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&hw->rmu_eth_lock);
+
+	/* Allocate private structure */
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		mutex_unlock(&hw->rmu_eth_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Initialize structure */
+	priv->dev = cdev;
+	priv->is_vf = vf_en;
+	priv->vf_num = vf_num;
+	priv->admin = vf_en ? false : true; /* Only PF client has admin privileges */
+
+	/* Store allocation in device structure (needed before ID allocation) */
+	rmu_eth = &priv->rmu_eth;
+
+	/* Get unique ID for this allocation. PF and VFs have separate ID spaces.
+	 * PF clients: IDs 0 to (rmu_pf_max_clients - 1)
+	 * VF clients: IDs starting from rmu_pf_max_clients
+	 */
+	id = idr_alloc(&hw->rmu_eth_idr, rmu_eth,
+		       vf_en ? rmu_pf_max_clients + vf_num : 0,
+		       vf_en ? rmu_pf_max_clients + vf_num + 1 : rmu_pf_max_clients,
+		       GFP_KERNEL);
+
+	if (id < 0) {
+		kfree(priv);
+		mutex_unlock(&hw->rmu_eth_lock);
+		return ERR_PTR(id);
+	}
+
+	rmu_eth->id = id;
+
+	/* Calculate per-client quotas and base indices
+	 * - indirection table layout remains unchanged (PF first, then VFs).
+	 * - set_list places PF clients at the end to avoid PF catch-all filters
+	 *   taking early slots.
+	 */
+	if (vf_en) {
+		/* VF gets equal share of remaining indirection and set_list pools */
+		indir_quota = (C_RMU_CFG_PORTAL_INDEX_INDIR_TABLE_ENTRIES -
+			      (rmu_pf_client_max_rss_indir_size * rmu_pf_max_clients)) / hw->num_vfs;
+		set_list_quota = (C_RMU_CFG_PTLTE_SET_LIST_ENTRIES -
+				 (rmu_pf_client_max_filters * rmu_pf_max_clients)) / hw->num_vfs;
+
+		priv->indir_base = (rmu_pf_client_max_rss_indir_size * rmu_pf_max_clients) +
+				   (vf_num * indir_quota);
+		priv->set_list_base = vf_num * set_list_quota;
+	} else {
+		/* PF client keeps original indirection layout and gets tail set_list */
+		indir_quota = rmu_pf_client_max_rss_indir_size;
+		set_list_quota = rmu_pf_client_max_filters;
+
+		priv->indir_base = id * indir_quota;
+		priv->set_list_base = C_RMU_CFG_PTLTE_SET_LIST_ENTRIES -
+				     (rmu_pf_max_clients * set_list_quota) +
+				     (id * set_list_quota);
+	}
+
+	priv->indir_size = indir_quota;
+	priv->set_list_quota = set_list_quota;
+
+	/* Allocate MAC filter slot tracking array */
+	priv->mac_filter_slots = kcalloc(set_list_quota, sizeof(u8), GFP_KERNEL);
+	if (!priv->mac_filter_slots) {
+		idr_remove(&hw->rmu_eth_idr, id);
+		kfree(priv);
+		mutex_unlock(&hw->rmu_eth_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Invalidate all set_list entries in our quota to ensure clean state */
+	spin_lock(&hw->rmu_lock);
+	for (i = 0; i < set_list_quota; i++)
+		cass_invalidate_set_list(hw, priv->set_list_base + i);
+	spin_unlock(&hw->rmu_lock);
+
+	/* Default RSS configuration (disabled initially) */
+	priv->rss_queues = 0;
+	priv->hash_types = 0;
+	priv->indir_entries = 0;  /* Active indirection table size */
+
+	mutex_unlock(&hw->rmu_eth_lock);
+
+	return &priv->rmu_eth;
+}
+EXPORT_SYMBOL(cxi_rmu_eth_alloc_internal);
+
+struct cxi_rmu_eth *cxi_rmu_eth_alloc(struct cxi_dev *cdev)
+{
+	return cdev->is_physfn ? cxi_rmu_eth_alloc_internal(cdev, false, 0) :
+				 cxi_rmu_eth_alloc_vf(cdev);
+}
+EXPORT_SYMBOL(cxi_rmu_eth_alloc);
+
+/**
+ * cxi_rmu_eth_free_vf() - Free Ethernet resources (VF version)
+ * @rmu_eth: Resource handle
+ *
+ * VF version: Sends free request to PF via vsock.
+ */
+static void cxi_rmu_eth_free_vf(struct cxi_rmu_eth *rmu_eth)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	const struct cxi_rmu_eth_free_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_FREE,
+		.resp = NULL,
+		.rmu_eth = rmu_eth->id,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(priv->dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		cxidev_err(priv->dev, "Failed to free RMU Ethernet resources on PF: %d\n", rc);
+
+	kfree(priv);
+}
+
+/**
+ * cxi_rmu_eth_free() - Free Ethernet resources
+ * @rmu_eth: Resource handle
+ *
+ * Automatically invalidates all set_list entries, clears indirection table,
+ * and releases all resources.
+ */
+void cxi_rmu_eth_free(struct cxi_rmu_eth *rmu_eth)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	struct cass_dev *hw = container_of(priv->dev, struct cass_dev, cdev);
+	int i;
+
+	if (!priv->dev->is_physfn) {
+		cxi_rmu_eth_free_vf(rmu_eth);
+		return;
+	}
+
+	mutex_lock(&hw->rmu_eth_lock);
+
+	/* Invalidate all set_list entries in our quota range */
+	spin_lock(&hw->rmu_lock);
+
+	for (i = 0; i < priv->set_list_quota; i++) {
+		unsigned int hw_idx = priv->set_list_base + i;
+
+		/* Debug log for entries that were actually programmed */
+		if (priv->mac_filter_slots[i]) {
+			cxidev_dbg(priv->dev, "Removing RMU filter at idx=%d (hw_idx=%u)\n",
+				   i, hw_idx);
+		}
+
+		cass_invalidate_set_list(hw, hw_idx);
+	}
+
+	spin_unlock(&hw->rmu_lock);
+
+	/* Free slot tracking array */
+	kfree(priv->mac_filter_slots);
+
+	/* Remove from IDR */
+	idr_remove(&hw->rmu_eth_idr, rmu_eth->id);
+
+	mutex_unlock(&hw->rmu_eth_lock);
+
+	kfree(priv);
+}
+EXPORT_SYMBOL(cxi_rmu_eth_free);
+
+/**
+ * add_rmu_set_list_filter() - Common hardware programming logic for filter installation
+ * @priv: Private resource structure
+ * @idx: Relative index within client's quota
+ * @pte: PTE pointer
+ * @use_rss: Whether traffic participates in RSS
+ * @set_list: Prepared set_list entry with match criteria
+ * @set_list_mask: Prepared mask for set_list
+ *
+ * Handles index validation, translation, and hardware programming for both
+ * MAC filters and promiscuous mode filters.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+static int add_rmu_set_list_filter(struct cxi_rmu_eth_priv *priv, unsigned int idx,
+				   struct cxi_pte *pte, bool use_rss,
+				   const union c_rmu_cfg_ptlte_set_list *set_list,
+				   const union c_rmu_cfg_ptlte_set_list *set_list_mask)
+{
+	struct cass_dev *hw = container_of(priv->dev, struct cass_dev, cdev);
+	unsigned int set_list_idx;
+	unsigned int portal_idx;
+	struct c_rmu_cfg_ptlte_set_ctrl_table_entry set_ctrl = {};
+
+	/* Validate index range */
+	if (idx >= priv->set_list_quota) {
+		cxidev_err(priv->dev, "Index %d out of range [0..%u]\n",
+			   idx, priv->set_list_quota - 1);
+		return -EINVAL;
+	}
+
+	/* Extract portal index from PTE */
+	portal_idx = pte->id;
+
+	/* Translate relative index to hardware index */
+	set_list_idx = priv->set_list_base + idx;
+
+	spin_lock(&hw->rmu_lock);
+
+	/* Program set_list */
+	cass_config_set_list(hw, set_list_idx, portal_idx,
+			     set_list, set_list_mask);
+
+	/* Program set_ctrl for RSS or direct portal */
+	if (use_rss && priv->rss_queues > 1) {
+		/* Use RSS */
+		set_ctrl.portal_index_indir_base = priv->indir_base;
+		set_ctrl.hash_bits = ilog2(priv->indir_entries);
+		set_ctrl.hash_types_enabled = priv->hash_types;
+	} else {
+		/* Direct portal (RSS disabled) - point to fallback entry */
+		set_ctrl.portal_index_indir_base = 2048 + set_list_idx;
+		set_ctrl.hash_bits = 0;
+		set_ctrl.hash_types_enabled = 0;
+	}
+
+	/* Program set_ctrl */
+	cass_config_set_ctrl(hw, set_list_idx, &set_ctrl);
+
+	/* Program default portal at indir_table[2048 + set_list_idx] */
+	cass_config_indir_entry(hw, 2048 + set_list_idx, portal_idx);
+
+	spin_unlock(&hw->rmu_lock);
+
+	/* Mark slot as used */
+	priv->mac_filter_slots[idx] = use_rss ? CXI_RMU_ETH_FILTER_RSS :
+					      CXI_RMU_ETH_FILTER_DIRECT;
+
+	return 0;
+}
+
+/**
+ * cxi_rmu_eth_add_mac_filter_vf() - Add MAC address filter (VF version)
+ * @rmu_eth: Resource handle
+ * @idx: Relative index (0-based) within client's quota
+ * @mac_addr: MAC address to match (48-bit)
+ * @pte: PTE pointer
+ * @use_rss: Whether this MAC participates in RSS distribution
+ *
+ * VF version: Sends add_mac request to PF via vsock.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+static int cxi_rmu_eth_add_mac_filter_vf(struct cxi_rmu_eth *rmu_eth,
+					 unsigned int idx, u64 mac_addr,
+					 struct cxi_pte *pte, bool use_rss)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	const struct cxi_rmu_eth_add_mac_filter_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_ADD_MAC_FILTER,
+		.rmu_eth = rmu_eth->id,
+		.idx = idx,
+		.mac_addr = mac_addr,
+		.pte = pte->id,
+		.use_rss = use_rss,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(priv->dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/**
+ * cxi_rmu_eth_add_all_mcast_filter_vf() - Add all-multicast filter (VF version)
+ * @rmu_eth: Resource handle
+ * @idx: Relative index (0-based) within client's quota
+ * @pte: PTE pointer
+ * @use_rss: Whether this filter participates in RSS distribution
+ *
+ * VF version: Sends add-all-multicast request to PF via vsock.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+static int cxi_rmu_eth_add_all_mcast_filter_vf(struct cxi_rmu_eth *rmu_eth, unsigned int idx,
+					       struct cxi_pte *pte, bool use_rss)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	const struct cxi_rmu_eth_add_all_mcast_filter_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_ADD_ALL_MCAST_FILTER,
+		.rmu_eth = rmu_eth->id,
+		.idx = idx,
+		.pte = pte->id,
+		.use_rss = use_rss,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(priv->dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/**
+ * cxi_rmu_eth_add_mac_filter() - Add MAC address filter with portal and RSS control
+ * @rmu_eth: Resource handle
+ * @idx: Relative index (0-based) within client's quota
+ * @mac_addr: MAC address to match (48-bit)
+ * @pte: PTE pointer (provides portal index via pte->portal_index)
+ * @use_rss: Whether this MAC participates in RSS distribution
+ *
+ * Client provides relative index [0..quota-1], kernel translates to hardware index.
+ * Reserved indices (0-3) can only be used by PF.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+int cxi_rmu_eth_add_mac_filter(struct cxi_rmu_eth *rmu_eth, unsigned int idx, u64 mac_addr,
+			       struct cxi_pte *pte, bool use_rss)
+{
+	struct cxi_rmu_eth_priv *priv;
+	union c_rmu_cfg_ptlte_set_list set_list = {};
+	union c_rmu_cfg_ptlte_set_list set_list_mask = {};
+	u8 mac_bytes[ETH_ALEN];
+	int rc;
+
+	if (!rmu_eth || !pte)
+		return -EINVAL;
+
+	priv = container_of(rmu_eth, struct cxi_rmu_eth_priv, rmu_eth);
+
+	if (!priv->dev->is_physfn)
+		return cxi_rmu_eth_add_mac_filter_vf(rmu_eth, idx, mac_addr, pte, use_rss);
+
+	u64_to_ether_addr(mac_addr, mac_bytes);
+	cxidev_dbg(priv->dev, "Adding MAC RMU filter %pM at idx=%d (hw_idx=%u) use_rss=%d pte id %u\n",
+		   mac_bytes, idx, priv->set_list_base + idx, use_rss, pte->id);
+
+	/* VFs must use valid unicast MACs only */
+	if (!priv->admin) {
+		rc = validate_mac_vf(mac_addr);
+		if (rc) {
+			cxidev_err(priv->dev, "VF cannot use MAC %pM\n", mac_bytes);
+			return rc;
+		}
+	}
+
+	/* Prepare set_list entry for MAC match */
+	set_list.frame_type = C_RMU_ENET_802_3;
+	set_list.dmac = mac_addr;
+
+	/* Accept only that MAC */
+	set_list_mask.qw[0] = ~set_list.qw[0];
+	set_list_mask.qw[1] = ~set_list.qw[1];
+	set_list_mask.qw[2] = ~set_list.qw[2];
+	set_list_mask.qw[3] = ~set_list.qw[3];
+
+	/* Ignore VLAN/PCP/DEI bits */
+	set_list_mask.vlan_present = 0;
+	set_list_mask.pcp = 0;
+	set_list_mask.dei = 0;
+	set_list_mask.vid = 0;
+	set_list_mask.lossless = 0;
+
+	/* Program hardware set_list filter */
+	return add_rmu_set_list_filter(priv, idx, pte, use_rss, &set_list, &set_list_mask);
+}
+EXPORT_SYMBOL(cxi_rmu_eth_add_mac_filter);
+
+/**
+ * cxi_rmu_eth_add_all_mcast_filter() - Add all-multicast filter with portal and RSS control
+ * @rmu_eth: Resource handle
+ * @idx: Relative index (0-based) within client's quota
+ * @pte: PTE pointer (provides portal index via pte->portal_index)
+ * @use_rss: Whether this filter participates in RSS distribution
+ *
+ * Programs a filter that accepts all multicast Ethernet packets by matching
+ * only frame type and destination MAC multicast bit semantics.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+int cxi_rmu_eth_add_all_mcast_filter(struct cxi_rmu_eth *rmu_eth, unsigned int idx,
+				     struct cxi_pte *pte, bool use_rss)
+{
+	struct cxi_rmu_eth_priv *priv;
+	const union c_rmu_cfg_ptlte_set_list set_list = {
+		.frame_type = C_RMU_ENET_802_3,
+		.dmac = 0x010000000000ULL,
+	};
+	const union c_rmu_cfg_ptlte_set_list set_list_mask = {
+		.qw = {
+			[2] = ~set_list.qw[2],
+			[3] = ~set_list.qw[3],
+		}
+	};
+
+	if (!rmu_eth || !pte)
+		return -EINVAL;
+
+	priv = container_of(rmu_eth, struct cxi_rmu_eth_priv, rmu_eth);
+
+	if (!priv->dev->is_physfn)
+		return cxi_rmu_eth_add_all_mcast_filter_vf(rmu_eth, idx, pte, use_rss);
+
+	cxidev_dbg(priv->dev,
+		   "Adding all-multicast RMU filter at idx=%d (hw_idx=%u) use_rss=%d pte id %u\n",
+		   idx, priv->set_list_base + idx, use_rss, pte->id);
+
+	return add_rmu_set_list_filter(priv, idx, pte, use_rss, &set_list, &set_list_mask);
+}
+EXPORT_SYMBOL(cxi_rmu_eth_add_all_mcast_filter);
+
+/**
+ * cxi_rmu_eth_remove_filter_vf() - Remove filter (VF version)
+ * @rmu_eth: Resource handle
+ * @idx: Relative index of filter to remove
+ *
+ * VF version: Sends remove_filter request to PF via vsock.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+static int cxi_rmu_eth_remove_filter_vf(struct cxi_rmu_eth *rmu_eth, unsigned int idx)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	const struct cxi_rmu_eth_remove_filter_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_REMOVE_FILTER,
+		.rmu_eth = rmu_eth->id,
+		.idx = idx,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(priv->dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/**
+ * cxi_rmu_eth_remove_filter() - Remove filter by index
+ * @rmu_eth: Resource handle
+ * @idx: Relative index of filter to remove
+ *
+ * Works for both MAC address filters and promiscuous mode filters.
+ * MAC filters use slot tracking and return -ENOENT if slot is empty.
+ * Promiscuous filters don't use slot tracking.
+ *
+ * Return: 0 on success, -ENOENT if MAC slot is empty, -EINVAL for invalid index
+ */
+int cxi_rmu_eth_remove_filter(struct cxi_rmu_eth *rmu_eth, unsigned int idx)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	struct cass_dev *hw = container_of(priv->dev, struct cass_dev, cdev);
+	unsigned int set_list_idx;
+
+	if (!priv->dev->is_physfn)
+		return cxi_rmu_eth_remove_filter_vf(rmu_eth, idx);
+
+	/* Validate index range */
+	if (idx >= priv->set_list_quota) {
+		cxidev_err(priv->dev, "Index %d out of range [0..%u]\n",
+			   idx, priv->set_list_quota - 1);
+		return -EINVAL;
+	}
+
+	/* Check if slot is occupied (both MAC and promiscuous filters use slot tracking) */
+	if (!priv->mac_filter_slots[idx]) {
+		cxidev_dbg(priv->dev, "Remove filter at idx=%d (hw_idx=%u) but slot is empty\n",
+			   idx, priv->set_list_base + idx);
+		return -ENOENT;
+	}
+
+	cxidev_dbg(priv->dev, "Remove filter at idx=%d (hw_idx=%u)\n",
+		   idx, priv->set_list_base + idx);
+	/* Translate to hardware index */
+	set_list_idx = priv->set_list_base + idx;
+
+	/* Invalidate hardware entry */
+	spin_lock(&hw->rmu_lock);
+	cass_invalidate_set_list(hw, set_list_idx);
+	spin_unlock(&hw->rmu_lock);
+
+	/* Clear slot (all filters use slot tracking now) */
+	priv->mac_filter_slots[idx] = CXI_RMU_ETH_FILTER_NONE;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rmu_eth_remove_filter);
+
+/**
+ * cxi_rmu_eth_add_promiscuous_filter() - Enable promiscuous mode filter
+ * @rmu_eth: Resource handle
+ * @idx: Relative index within client's quota for this filter
+ * @pte: PTE pointer
+ * @use_rss: Whether promiscuous traffic participates in RSS
+ *
+ * Return: 0 on success, negative errno on error
+ */
+int cxi_rmu_eth_add_promiscuous_filter(struct cxi_rmu_eth *rmu_eth, unsigned int idx,
+				       struct cxi_pte *pte, bool use_rss)
+{
+	struct cxi_rmu_eth_priv *priv;
+	const union c_rmu_cfg_ptlte_set_list set_list = {
+		.frame_type = C_RMU_ENET_802_3,
+	};
+	const union c_rmu_cfg_ptlte_set_list set_list_mask = {
+		.qw = {
+			[2] = ~set_list.qw[2],
+			[3] = ~set_list.qw[3],
+		}
+	};
+
+	if (!rmu_eth || !pte)
+		return -EINVAL;
+
+	priv = container_of(rmu_eth, struct cxi_rmu_eth_priv, rmu_eth);
+
+	/* VF cannot enable promiscuous mode */
+	if (!priv->admin)
+		return -EPERM;
+
+	cxidev_dbg(priv->dev, "Add promiscuous RMU filter at idx=%u (hw_idx=%u) use_rss=%d\n",
+		   idx, priv->set_list_base + idx, use_rss);
+
+	/* Program hardware set_list filter */
+	return add_rmu_set_list_filter(priv, idx, pte, use_rss, &set_list, &set_list_mask);
+}
+EXPORT_SYMBOL(cxi_rmu_eth_add_promiscuous_filter);
+
+/**
+ * update_rss_filters() - Update set_ctrl for all RSS-enabled filters
+ * @priv: Private resource structure
+ * @enable: If true, enable RSS; if false, disable RSS
+ *
+ * Helper function to update set_ctrl entries for all filters that use RSS.
+ * This is called when changing RSS configuration or indirection table.
+ */
+static void update_rss_filters(struct cxi_rmu_eth_priv *priv, bool enable)
+{
+	struct cass_dev *hw = container_of(priv->dev, struct cass_dev, cdev);
+	unsigned int i;
+	struct c_rmu_cfg_ptlte_set_ctrl_table_entry set_ctrl = {};
+
+	if (enable && priv->rss_queues > 1) {
+		/* RSS enabled - configure indirection table */
+		set_ctrl.portal_index_indir_base = priv->indir_base;
+		set_ctrl.hash_bits = ilog2(priv->indir_entries);
+		set_ctrl.hash_types_enabled = priv->hash_types;
+	}
+	/* else: set_ctrl stays zero (direct portal mode); portal_index_indir_base
+	 * is set per-filter below */
+
+	/* Update all filters that use RSS */
+	for (i = 0; i < priv->set_list_quota; i++) {
+		if (priv->mac_filter_slots[i] == CXI_RMU_ETH_FILTER_RSS) {
+			unsigned int hw_idx = priv->set_list_base + i;
+
+			if (!enable || priv->rss_queues <= 1) {
+				/* Use direct portal */
+				set_ctrl.portal_index_indir_base = 2048 + hw_idx;
+			}
+
+			cass_config_set_ctrl(hw, hw_idx, &set_ctrl);
+		}
+	}
+}
+
+/**
+ * cxi_rmu_eth_set_rss_queues_vf() - Configure RSS queues (VF version)
+ * @rmu_eth: Resource handle
+ * @num_queues: Number of RSS queues
+ * @ptes: Array of PTE pointers
+ * @hash_types: Hash types to enable
+ *
+ * VF version: Sends set_rss_queues request to PF via vsock.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+static int cxi_rmu_eth_set_rss_queues_vf(struct cxi_rmu_eth *rmu_eth,
+					 unsigned int num_queues,
+					 struct cxi_pte **ptes,
+					 u32 hash_types)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	struct cxi_rmu_eth_set_rss_queues_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_SET_RSS_QUEUES,
+		.rmu_eth = rmu_eth->id,
+		.num_queues = num_queues,
+		.hash_types = hash_types,
+	};
+	size_t resp_len = 0;
+	unsigned int i;
+
+	if (num_queues > CXI_ETH_MAX_RSS_QUEUES)
+		return -EINVAL;
+
+	/* Copy PTE numbers into command */
+	for (i = 0; i < num_queues; i++)
+		cmd.ptes[i] = ptes[i]->id;
+
+	return cxi_send_msg_to_pf(priv->dev, &cmd, sizeof(cmd), NULL, &resp_len);
+}
+
+/**
+ * cxi_rmu_eth_set_rss_queues() - Configure RSS queues and hash types
+ * @rmu_eth: Resource handle
+ * @num_queues: Number of RSS queues (0-64, where 0 disables RSS)
+ * @ptes: Array of PTE pointers for RSS queues
+ * @hash_types: Hash types to enable
+ *
+ * Return: 0 on success, negative errno on error
+ */
+int cxi_rmu_eth_set_rss_queues(struct cxi_rmu_eth *rmu_eth,
+			       unsigned int num_queues,
+			       struct cxi_pte **ptes,
+			       u32 hash_types)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	struct cass_dev *hw = container_of(priv->dev, struct cass_dev, cdev);
+	unsigned int i;
+
+	if (!priv->dev->is_physfn)
+		return cxi_rmu_eth_set_rss_queues_vf(rmu_eth, num_queues, ptes,
+						     hash_types);
+
+	/* RSS requires at least 2 queues and non-zero hash types */
+	if (num_queues == 0 || num_queues == 1 || hash_types == 0) {
+		/* Disable RSS */
+		num_queues = 0;
+		hash_types = 0;
+	} else {
+		/* Validate RSS queue count */
+		if (num_queues > CXI_ETH_MAX_RSS_QUEUES)
+			return -EINVAL;
+
+		/* Store PTE pointers for RSS queues */
+		for (i = 0; i < num_queues; i++)
+			priv->ptes[i] = ptes[i];
+	}
+
+	/* Update default RSS configuration */
+	priv->rss_queues = num_queues;
+	priv->hash_types = hash_types;
+	priv->indir_entries = (num_queues > 1) ? priv->indir_size : 0;
+
+	/* Program indirection table with default round-robin */
+	spin_lock(&hw->rmu_lock);
+
+	/* Disable RSS filters before modifying indirection table */
+	update_rss_filters(priv, false);
+
+	if (num_queues > 1) {
+		for (i = 0; i < priv->indir_entries; i++) {
+			unsigned int queue_idx = ethtool_rxfh_indir_default(i, num_queues);
+			unsigned int portal_idx = ptes[queue_idx]->id;
+
+			cass_config_indir_entry(hw, priv->indir_base + i, portal_idx);
+		}
+
+		/* Re-enable RSS filters with new configuration */
+		update_rss_filters(priv, true);
+	}
+
+	spin_unlock(&hw->rmu_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rmu_eth_set_rss_queues);
+
+/**
+ * cxi_rmu_eth_set_indir_table_vf() - Set custom traffic distribution (VF version)
+ * @rmu_eth: Resource handle
+ * @indir_table: Custom indirection table, or NULL for default
+ * @indir_size: Size of indirection table
+ *
+ * VF version: Sends set_indir_table request to PF via vsock.
+ *
+ * Return: 0 on success, negative errno on error
+ */
+static int cxi_rmu_eth_set_indir_table_vf(struct cxi_rmu_eth *rmu_eth,
+					  const u8 *indir_table,
+					  unsigned int indir_size)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	struct cxi_rmu_eth_set_indir_table_cmd *cmd;
+	size_t resp_len = 0;
+	int ret;
+
+	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd->op = CXI_OP_RMU_ETH_SET_INDIR_TABLE;
+	cmd->rmu_eth = rmu_eth->id;
+	cmd->indir_size = indir_size;
+
+	/* Copy indirection table if provided, NULL means use default (all zeros) */
+	if (indir_table && indir_size <= CXI_ETH_MAX_INDIR_ENTRIES)
+		memcpy(cmd->indir_table, indir_table, indir_size);
+
+	ret = cxi_send_msg_to_pf(priv->dev, cmd, sizeof(*cmd), NULL, &resp_len);
+	kfree(cmd);
+	return ret;
+}
+
+/**
+ * cxi_rmu_eth_set_indir_table() - Set custom traffic distribution weights
+ * @rmu_eth: Resource handle
+ * @indir_table: Custom indirection table, or NULL for default
+ * @indir_size: Size of indirection table (must be power of 2)
+ *
+ * Return: 0 on success, negative errno on error
+ */
+int cxi_rmu_eth_set_indir_table(struct cxi_rmu_eth *rmu_eth,
+				const u8 *indir_table, unsigned int indir_size)
+{
+	struct cxi_rmu_eth_priv *priv = container_of(rmu_eth,
+						     struct cxi_rmu_eth_priv,
+						     rmu_eth);
+	struct cass_dev *hw = container_of(priv->dev, struct cass_dev, cdev);
+	unsigned int i;
+
+	if (!priv->dev->is_physfn)
+		return cxi_rmu_eth_set_indir_table_vf(rmu_eth, indir_table, indir_size);
+
+	if (indir_size == 0 || !is_power_of_2(indir_size)) {
+		cxidev_err(priv->dev, "Invalid indirection table size %u (must be power of 2)\n",
+			   indir_size);
+		return -EINVAL;
+	}
+
+	if (priv->rss_queues == 0) {
+		cxidev_dbg(priv->dev,
+			   "Ignoring indirection table update while RSS is disabled (indir_size=%u)\n",
+			   indir_size);
+		return 0;
+	}
+
+	cxidev_dbg(priv->dev, "Setting up RSS indirection table: indir_size=%u\n", indir_size);
+
+	if (indir_size > priv->indir_size) {
+		cxidev_err(priv->dev, "Indirection table size %u exceeds allocated size %u\n",
+			   indir_size, priv->indir_size);
+		return -EINVAL;
+	}
+
+	/* Validate all queue indices before modifying hardware */
+	if (indir_table) {
+		for (i = 0; i < indir_size; i++) {
+			if (indir_table[i] >= priv->rss_queues) {
+				cxidev_err(priv->dev, "Invalid queue index %u in indirection table (max %u)\n",
+					   indir_table[i], priv->rss_queues - 1);
+				return -EINVAL;
+			}
+		}
+	}
+
+	/* Update active indirection table size */
+	priv->indir_entries = indir_size;
+
+	spin_lock(&hw->rmu_lock);
+
+	/* Disable hashing on all active filters before modifying indirection table */
+	update_rss_filters(priv, false);
+
+	/* Program the requested entries (custom or default) */
+	for (i = 0; i < indir_size; i++) {
+		unsigned int queue_idx;
+		unsigned int portal_idx;
+
+		if (!indir_table) {
+			/* Default round-robin */
+			queue_idx = ethtool_rxfh_indir_default(i, priv->rss_queues);
+		} else {
+			/* Custom table - already validated above */
+			queue_idx = indir_table[i];
+		}
+
+		portal_idx = priv->ptes[queue_idx]->id;
+		cass_config_indir_entry(hw, priv->indir_base + i, portal_idx);
+	}
+
+	/* Fill remaining entries with default round-robin to avoid stale values although
+	 * the HW would not be using them once we update the hash_bits */
+	for (i = indir_size; i < priv->indir_size; i++) {
+		unsigned int queue_idx = ethtool_rxfh_indir_default(i, priv->rss_queues);
+		unsigned int portal_idx = priv->ptes[queue_idx]->id;
+
+		cass_config_indir_entry(hw, priv->indir_base + i, portal_idx);
+	}
+
+	/* Re-enable hashing on all active filters */
+	update_rss_filters(priv, true);
+
+	spin_unlock(&hw->rmu_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rmu_eth_set_indir_table);
+
+static void cxi_rmu_eth_get_hash_key_vf(struct cxi_dev *cdev, u8 *key)
+{
+	const struct cxi_rmu_eth_hash_key_get_cmd cmd = {
+		.op = CXI_OP_RMU_ETH_HASH_KEY_GET,
+	};
+	struct cxi_rmu_eth_get_hash_key_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	BUILD_BUG_ON(sizeof(resp.key) != CXI_ETH_HASH_KEY_SIZE);
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc) {
+		/* On error, zero out the key */
+		memset(key, 0, CXI_ETH_HASH_KEY_SIZE);
+		return;
+	}
+
+	memcpy(key, resp.key, CXI_ETH_HASH_KEY_SIZE);
+}
+
+/**
+ * cxi_rmu_eth_get_hash_key() - Retrieve the RSS hash key
+ *
+ * @cdev: CXI device
+ * @key: A sufficiently large (CXI_ETH_HASH_KEY_SIZE) array to store the key.
+ */
+void cxi_rmu_eth_get_hash_key(struct cxi_dev *cdev, u8 *key)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_rmu_cfg_hash_key hash_key;
+
+	if (!cdev->is_physfn) {
+		cxi_rmu_eth_get_hash_key_vf(cdev, key);
+		return;
+	}
+
+	spin_lock(&hw->rmu_lock);
+	cass_read(hw, C_RMU_CFG_HASH_KEY, &hash_key, sizeof(hash_key));
+	spin_unlock(&hw->rmu_lock);
+
+	memcpy(key, hash_key.qw, CXI_ETH_HASH_KEY_SIZE);
+}
+EXPORT_SYMBOL(cxi_rmu_eth_get_hash_key);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.c b/drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.c
new file mode 100644
index 000000000000..23bf05c02bce
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2024 Hewlett Packard Enterprise Development LP */
+
+/* VNI Entry manipulation routines for Cassini Device */
+
+#include "cass_core.h"
+#include "cass_rx_tx_profile.h"
+
+#include "cxi_rxtx_profile.h"
+#include "cxi_rxtx_profile_list.h"
+
+static struct xa_limit    rx_profile_limits = {
+	.min = RX_PROFILE_ID_MIN,
+	.max = RX_PROFILE_ID_MAX,
+};
+
+static struct xa_limit    tx_profile_limits = {
+	.min = TX_PROFILE_ID_MIN,
+	.max = TX_PROFILE_ID_MAX,
+};
+
+/* **************************************************************** */
+/* Cassini device initialization and shutdown                       */
+/* **************************************************************** */
+
+/**
+ * cass_dev_rx_tx_profiles_init() - Create device structures to support
+ *                                  RX and TX Profile lists.
+ *
+ * @hw: The cassini device
+ */
+void cass_dev_rx_tx_profiles_init(struct cass_dev *hw)
+{
+	cxi_rxtx_profile_list_init(&hw->rx_profile_list,
+				   &rx_profile_limits,
+				   RX_PROFILE_XARRAY_FLAGS,
+				   RX_PROFILE_GFP_OPTS);
+
+	cxi_rxtx_profile_list_init(&hw->tx_profile_list,
+				   &tx_profile_limits,
+				   TX_PROFILE_XARRAY_FLAGS,
+				   TX_PROFILE_GFP_OPTS);
+
+	mutex_init(&hw->rx_profile_get_lock);
+	mutex_init(&hw->tx_profile_get_lock);
+}
+
+struct profile_destroy_data {
+	struct cxi_dev   *cxi_dev;
+};
+
+static void rx_profile_destroy(struct cxi_rxtx_profile *rxtx_profile,
+			       void *user_arg)
+{
+	struct profile_destroy_data *data = user_arg;
+
+	refcount_dec(&rxtx_profile->state.refcount);
+	cxi_rx_profile_dec_refcount(data->cxi_dev, co_rx_profile(rxtx_profile));
+}
+
+/**
+ * cass_dev_rx_tx_profiles_fini() - Destroy all RX and TX Profile entries
+ * associated with this device, as well as locks, etc.
+ *
+ * @hw: Cassini Device
+ */
+void cass_dev_rx_tx_profiles_fini(struct cass_dev *hw)
+{
+	struct profile_destroy_data  data;
+
+	data.cxi_dev = &hw->cdev;
+
+	cxi_rxtx_profile_list_destroy(&hw->rx_profile_list,
+				      rx_profile_destroy, &data);
+	cxi_tx_profile_list_destroy(hw);
+}
+
+/**
+ * cass_rx_profile_init() - initialize the hardware specific
+ *                                 part of the RX Profile
+ * @hw: Cassini device pointer
+ * @rx_profile: pointer to Profile
+ */
+void cass_rx_profile_init(struct cass_dev *hw,
+			  struct cxi_rx_profile *rx_profile)
+{
+	spin_lock_init(&rx_profile->config.pid_lock);
+	rx_profile->config.device = &hw->cdev;
+	rx_profile->config.rmu_index = DEF_RMU_INDEX;
+}
+
+/**
+ * cass_tx_profile_init() - initialize the hardware specific
+ *                                 part of the TX Profile
+ * @hw: Cassini device pointer
+ * @tx_profile: pointer to Profile
+ */
+void cass_tx_profile_init(struct cass_dev *hw,
+			  struct cxi_tx_profile *tx_profile)
+{
+	tx_profile->config.hw = hw;
+	idr_init(&tx_profile->config.cass_cp_table);
+	spin_lock_init(&tx_profile->config.lock);
+}

-- 
2.56.0

