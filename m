Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394113;
	b=ZXnzWeXv2E90WKTP4B4MdpWldd/NkiNErwaHMtsmP1vbZLkut2BCIQ4WFYla9J6Mj6Au
	 6yJ3sb0AUGbb/rvaw+JnkENYYDqpCg1hiOu/XdN9w9PXLVe2l2c2s49bs1DJscQjMBsMw
	 FEBi34np0pq0jhWz9GbiUUvwsagqFKn20nqhw9bCJJCZRLa6ZUoE1HmGGPe1FoBAO3I/B
	 +K9yz/WJZOUfr7Xjqr2At8bknp37dchR9DIAVBj3IxfMd6N4ToZLhnDnggQiCj0KVkl3v
	 +EgicFsAEMBh5EO+OY7LaIxWXJsR/Gq6/47f2JEkmOMMMhN6+SE147RDEdjf6pdyDeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:CC:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p6PSrk2QBCCyet/EFpzOeLMtNSI3RRR4RYzrh/Vf4CU=;
	b=TkK4f3Y8SbkDbkyeDAbLj3+aHR3KFFbhhNhVOp1yANuKW0E9z0Z1EP+LsQV2ez3I9Et6
	 H3J2KW4nFGHYuHcQsPh7qQ5ji2m7xRIO2x9+hrCLMCr5RipHFGDquUI2r1E5d8iMs07lk
	 7mmvzwYxfAEpwH+R11hW6rfCdg1WOrOvyoaR8YVkOm1mtdWTX5v4im41ZrpKSZKPGFtKr
	 fWWP07ILboZ6r93V1HLCvez90RWuC/wzUBnxl7KFFvmgaMWpSXU8byBy7cC3FPorUvwHF
	 jl0HxTgcoZPHhnupqGRQ22KQrTtG0tX9fZy8qUdUfNrdUi21d4N8uebGYUXAUUxs2LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=HEFT5Ht+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041B60A2605;
	Fri, 30 Oct 2026 21:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4041B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=HEFT5Ht+
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHxmpx770048;
	Fri, 30 Oct 2026 21:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=p6
	PSrk2QBCCyet/EFpzOeLMtNSI3RRR4RYzrh/Vf4CU=; b=HEFT5Ht+2NMHcMancP
	QTAW6SxGNuJ28avZrjk0EGj5IUkr8T9y9rV1ykECOMSMBjeo4fiYpSXcs5OB4bW0
	mgvV9xg5afxiOmskEIWs+nqD4CospvstBBXlDIeOXpWspJBlefbD7czDBNhpNXjt
	QEHVzmSuubWG3jcQToMi7GSsltejq3X27ndh0LISbt8xckt+fKy6TjhxWYYvMukd
	nJTcGap4Ultu7xqd9Qws92smWKf2I3ukCgjKXyitu8EujtwViU3BU9giNW1Z1jbm
	iyYa4eFkUzNAWHpSIsabj/awRME6Pd+Psc8Fp2dZsYZz/wnVKUW9GWlUOr4vIGXY
	ihtQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmvmy4y4v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:23 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 8F4A012B73;
	Fri, 30 Oct 2026 21:01:23 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:23 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:22 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:22 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:22 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPN0KfyPEdhbo1O6zSIL8UnV+OdkXMoFORWiwWOHhtGTUWxQWVDZWKdpdH33tXpwX2HxbZ98vX3UaT07k4hfmOlu6HuNwo/4foUMo0FSzdiHNCB/V4p58mXNxiYfvpNASC3eSk3TeOSFXi33pO1b9U5VbOmgTSlcuTiNE7jKgZ8yXe6K1cAR5CnBBBVuZ7wwVb8WSd52eLq3/PKhJJE/p/W1NU1iZrH1m2k+JE3G09U20OMdalX9eTR9aRerZVySohmPVAwmcD4/EVDgQ1p70WPFQRPZkPQ/djN2cA1aB59UZB9eePyLlPAvBhcvh2pMTjIMooh+ftD95mrMxsSuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6PSrk2QBCCyet/EFpzOeLMtNSI3RRR4RYzrh/Vf4CU=;
 b=HkAM8bH6ikhDgUV6hvsJsAh5MsceyUBgIg+FnfAAkWsFs4tPFGj4vKQrsaEOi/ZpdvgL2kqvwyEoSyzGYmIrs8qX8YSWtn+8Ef+eedAHsm3/PVv2fxIUZUp2/huXMJljYYJIj/m2DzpWC/v3AQjvlRL4xMXq0OGiVwVkqfFccFtL/Bkf80pQ5oH2o+1GWdPq74+w0cyZaNxlxT9IUswExyBLx9282mx7WmRVaabf1GK/l+yjg/FrXHzQAzhQcv+dWEK3l1bqUbCJQFuzQfxeGpLetlFKVa5+rc2bWGf64C+hcy9CdyxCnBgh/FXGc4PM4lioNKdsw8JIbSmkRU6/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:01:18 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:01:18 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:18 -0700
Subject: [PATCH 22/23] net: hpe: ss1: add the Ethernet personality
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-cxi-netdev-submission-v1-22-8c2c391cc283@hpe.com>
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
        "Sandeep
 Bhoot" <sandeep.bhoot@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SA9PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:806:28::6) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 719c52c4-a493-4e9d-6b37-08df36c8f164
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: 5tEwhrDBx9Syy1JOdyc5PiG98R3jvBhOqhJQkcAugIGHIEmm1cPcpFbx7icLBY/QLNH922QAC9QX24mjj2ejsq8MIVhSMC30oYV+cviEuvYk2LDWkAa2GDC73xNBHJlkMvGzgYUhSHnEtiikPhxB6SVVrQaYNUULzBI75JZASUQkf8eW501vqvak9W/YwLCFzaCJrcXdBPD2UIEMthBNH9Kso3Bok+ncwd9BrzWogFQc8cU7HAQxFcyrTf88k8h0Kl2SGmSpC+YhCTHvZ1D08cGjPg4GpWyfQ0IGHz3QszFjIddGdxhST7epZFwTnJhlTDdg8h3ccN5a3dvCzMB4gVKiCC+8J009W6mQfy9bJ8/ImgdCpfWvkLl2m0NBW0gwEE/3vbrd4830Bs0W3+UePCnF7BKYp3fZI9jn1262HD1wuY3UuFrmp1et4XMrGbGJzhNleFy6h6VLtbGtNLUQ+4/djvIq21d9RkCt/5FXGTnt7IdxHtHq/plOxE9MV/jF3WLHYJll47hSHwQTo/kc47kM+mDOICt2DzE50Z+UuOEXjunb/A4SYrduhnCiI7wj5TvfPBq4ElLutQvky3WD/p0tcSUtSPQBB7OUqWKsTafnhuwp/iMkeMR4kFA55n5TMwznpGgF3+BsChtAg0qWRFZ2XpqsVBL/b7E8S32ZtFS0r/m4MordN8BRd4Xfs0cbw2FtNdLnBfDsDNo6j3+5Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGJERU41T0U3SFRCUS9HOUtlUEE3R0hnTjJwUVNpS0ZEem56aytydlRhdW1O?=
 =?utf-8?B?RnVDODAzam5heHR6MC9kQjBmV1BGR0N1eldwSXhzV2NMOGpxWmpzL3hYblB3?=
 =?utf-8?B?Z2orRnZSYW05ZFlwUmlYcXBRUTlkcDU0SitBR1BGbDcyYk1oMGY3YnpMYzQ2?=
 =?utf-8?B?a2l2elF6L2dnL05ZRjFNbXVNbDd5Qjd1ZU1WNTlrMjRNY2dXTGttb05LaElM?=
 =?utf-8?B?SmdGTmJnRnBsQ0FjaC8xNVZOS2p2VkkrZnpPRUMrb09kMlNXcmdIcEgycElw?=
 =?utf-8?B?U2VOQ1dMTndEdG1SakJTUmdjbjd1L3dLUnYrR01HSWpGdlloQ2pvN0VsNThp?=
 =?utf-8?B?K0hKZTRkalhVUkJmQUpKRXZhVUhsMXZVczVLNVpmN2RlOThDZ0I2ODFhK01j?=
 =?utf-8?B?M0xaOE5vbjhwN2pjQVBDQVBDMHJubzltOHRXUmpMTGZJM1kzK3hYSHErTVMv?=
 =?utf-8?B?Ykh2T3BMQUZaeW1reHZTUnB1U080M2twbnR4ZTdKOVllU1hSSFlCbEt2Z2dy?=
 =?utf-8?B?N0NFTlhJVysvaG9lQ3pQa09RNkxqVGxIRjVFbzJVMHVPQTZGUi9renZlUXFI?=
 =?utf-8?B?YWk5UTJSV240K0xadUtkMXBTZGZEcVlKLzdNU1NFbU5DZHVIbHhGT0ttZW84?=
 =?utf-8?B?RjBSeWNUNW0rQ1MwbjZ2cEVqY1Q4MW5nSEVSbzBMMG9kOFFWRlJ0aTREMWkw?=
 =?utf-8?B?VWV3bjcrMkh5SWdCNXVuRGJUMUlYaXFURGo5UWtJSC9sUHJmSDVrbHAwdTVt?=
 =?utf-8?B?RzNTbFNBV2FybjEwWEZ4N1VMM05qVFJ6bkJVdWRBcHR2T0MwZXZCMzJ1a095?=
 =?utf-8?B?UXBHYjd2aGdTZktYenYyMGpjYWhWdGx0N0FyUUtVYWpPYy9LajlqeVhmZUhn?=
 =?utf-8?B?L2ZEeCtVUDJPVlNCdERFRTBoT2o4NnhYWHF0Q0loN3lhTlhYbXlTeERhdzlD?=
 =?utf-8?B?UDB4eVdYMUFJQlRBKzd5eW9JdkJaY1l6NFZZT29vdnI5WEYrUG9GeTk0dGxo?=
 =?utf-8?B?TXgreGt3UlVuak9NOHg1bGp0SVZ1VUdqQmhVbDQvdFozRWFIamNjajNTbVhi?=
 =?utf-8?B?YWY1cWtwM0JyYnVYUU16UFRQbWFkWjZDNHQ5R0hMTnp6L1dsMFhZSWtRdUUw?=
 =?utf-8?B?dHZaWU5NNm5seDRIR3BrNEVhdTBjdVpUZVRWTUZQd0J1R25RZXVzMWw4eHUy?=
 =?utf-8?B?d3pPMEQ0NlY3YTBrNkVvQmhlVlZITHRpejR5VXZOc2F6YzNrZFdmYzB2UTFp?=
 =?utf-8?B?M0wzOXVsTkVDSXNvazNkVXFNNDk4bWdtaGF4RmxRbEZUSStkcjExcmNLZ0Yz?=
 =?utf-8?B?T0ZsWjY1QWIva3l4NVNhcmVEOXZjcUlOem9OR1Z2LzNkVzhNRnVhaVM0czM3?=
 =?utf-8?B?NjNFejZTRDA3WTNMUmdBMllGVjI1aWltVjhzRlhNNHNpZ0o2ZGdTSXVzK1lq?=
 =?utf-8?B?WmpPVC9GSEpzT0R1bkU5Z1l5RE8rTlJxR3lJZFFab056dWZIcElJNXlzOUJW?=
 =?utf-8?B?bkNZU3pRVGFJMUNuRExUNm0veG4waFpXTCtkZGY5UDAvNy9DSWJwV2EzUHIw?=
 =?utf-8?B?NDlWMldvd1hrTGw1WFBwdEFmVlhkYUJYK3UvUUQrMHNoUTJKK3AxN1MrUG5I?=
 =?utf-8?B?Wk92akorVlN1ajFQVnE0ZldyUFJST2tURC9iaGZYOTFzY1JKaGFIZFVjcXli?=
 =?utf-8?B?bWxQOERjL003L01IV2M2VnBaZTNFQXhtT3hCaGZmYmhkQk5DYzFzT1ZlZXhC?=
 =?utf-8?B?V3NkdTlvd1UwUVB0MW1TeWZjZnJaMGxLeUowZHp5dmtHUmhNWkYzQjV5NGIr?=
 =?utf-8?B?OWVXQjh2aC9vUGxCNGdkVUlwQzVjWWFQWXJlR3dQS1VVbnJ3eWdCNXl1SXcr?=
 =?utf-8?B?OEJGWVhBdWtGWElsdjBUR3Zsc2dHRjRxUExYbHg1eUhBUFQzUnh3Wm5ub0tJ?=
 =?utf-8?B?OFN0YlhndU92OTNtQWVyUmY4TkJkRGhXa2p4UXZxYTlBZk5yZGRVWkRJVEFz?=
 =?utf-8?B?RTNVTTZnY0xReE5sb01IRVN5STBxZ2s1Nk1BUHRkMTR4ekQzeWZ0L2tmZmpn?=
 =?utf-8?B?S3ZnNWpxbnhYektUV0t6c1JkMEtNb0k2WnJ0Uk1GMXl1bVBUWXd3VlFYNTQv?=
 =?utf-8?B?ZjJjd3hnbVE4M1BYbEJSK2c3amQyZ1I5bkdSSWUvR3FJUVlEUUc4Sk90V2Np?=
 =?utf-8?B?QXd0WElkVVBsbkQ0ZEZQOEFXcEVyKzQ1bmVQcS9iUFM4MVJNaTROTlJQaFFj?=
 =?utf-8?B?NHVlbGg3V2QzTzdSSWVxcEdtZVA5MzhkM3Y3cWEwV0dyN2REQUh6SVg5cnlI?=
 =?utf-8?B?WlV1Z1B6S0pOQnlobnp4aTdnWlBpanh3bk1TZTY0MTlCOHY3T1lKQT09?=
X-Exchange-RoutingPolicyChecked: BRPqVYI0nbLaa8cAQ94mCEpOtqtRRTKZuCCuE5R1d/as9Knc07kTtnaw6RHXA8HbINskAb0Vo19kjk+FptMLdyjtZ9S7TOH3FU4gwn03gWl8xUxSBklgLVwBsrnjgk7a7u1GNAHDF8PJPOjy4OEW/PSux5sdVq6VJ0sF0EMRSbZ67AzxtLrCTbAdUPVjYdNwkADKhC6/jzAQlnxV/bnUa23/Jcd/qPvqrxQhqPtuscG2Tejrjq1rFkqNhYh5chwk68Y4d/DEDmirEcNn596VtgurSulZnzrGg7uRd5pxYaqxphb8mErIXi9NcVcjgqEgVxtROgIvoZmEcc2ww6xF1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 719c52c4-a493-4e9d-6b37-08df36c8f164
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:01:18.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fSDlWC7YdtZh+vxJjwePUurj2lHXr1AEAayiFy+aLpM9FK2yLosOif4CBODBGQ0w0MDwUjPTgwyx4wCMe4RAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: HdZzMsHlut31NecQHXq4CwY6VUDWxvu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXyOAmB0KiQnv/
 6jsv9shq5DYSmYr216o0iMORKB1LL5fCGgkHtewELAeCnGSBE/JdNF7cqkLlTGAQnze+uFhsyHl
 U8WMv5AR1jHE7AEtuKcXUKcas+iZL5BptGKi0gyu/hR2t7lg1THciHydSHfAdY6muIF706+J8nz
 zxpSPjjRRvxqK69E0AAMK56aDLleLxHGHjnA+dC9QaZ2G0aD+2yyVVCQ8hyBHrn5kCCUc3YQtdI
 npKEJYAQi8ze/4Df1A8/GRlyR853tpHa1JcHNbdp6UiTy2fJoUaNUUYcY1BrMBatuKALTGmVNeJ
 vNpMa6IUdHB0SE+AuhmcJL594ToT1yMfI8v7bPzfGvWTr9b9pHnbYTqqkJxfXxxDmwmDYFYDWXF
 q2xE4e0/AsuLSG6wOOcTAQe551kxpeIQxJ/w47NAjM5pxxZlAFOYVw0jn7fqEeIO+Um5FOBSJQH
 RwHLmApZYMMkyLN/hfw==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6ae505a4 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ModqzXLkJJ0tFyq98apW:22 a=MvuuwTCpAAAA:8 a=vrCzqNRu4LroZZJS0koA:9
 a=8seDEclQYWEnFHh0:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HdZzMsHlut31NecQHXq4CwY6VUDWxvu9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4MGCg3BZiTZ2
 JFrT0bssPNdqZxgcjC5VlnUO+d69cnzMm9Cn0mYiAwV1Aye4bZZGNy+ZsuLtITpZfxln2a7atag
 or+tvp1kjoPSnaJbUx5ouOObxzSgFqU=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add cxi-eth, the Ethernet netdev personality of the NIC: netdev and
ethtool operations, hardware timestamp configuration through
ndo_hwtstamp_get/set, the RX/TX profile lists and the debugfs
interface.

The driver does not depend on any InfiniBand configuration option; it
defines the RoCE v2 UDP port locally instead of including
rdma/ib_verbs.h.

Known limitation, deferred to V2: this patch carries SR-IOV
virtual-function code (VF-to-PF mailbox requests, mailbox opcodes or VF
resource handling) from an older, incomplete version of the Cassini
SR-IOV support. V2 of this series will include the updated SR-IOV
implementation, so issues in the VF paths should be ignored for now.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: ENOTSUPP (3), AVOID_BUG (2), SPLIT_STRING (2), BRACES (1),
  MODULE_LICENSE (1)
- CHECK: CAMELCASE (6), COMPARISON_TO_NULL (5), MULTIPLE_ASSIGNMENTS
  (2), BRACES (1), OPEN_ENDED_LINE (1), UNNECESSARY_PARENTHESES (1)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cxi_eth.c             |  443 ++++
 drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c     |  206 ++
 drivers/net/ethernet/hpe/ss1/cxi_eth_ioctl.c       |   44 +
 drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c         | 2367 ++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cxi_ethtool.c         |  916 ++++++++
 drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c    |  418 ++++
 .../net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c   |  249 ++
 7 files changed, 4643 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth.c b/drivers/net/ethernet/hpe/ss1/cxi_eth.c
new file mode 100644
index 000000000000..f575847120f9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_eth.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cray Cassini ethernet driver
+ * © Copyright 2018-2020 Cray Inc
+ * © Copyright 2020-2021 Hewlett Packard Enterprise Development LP
+ */
+
+/* TODO:
+ *
+ * - address all the TODOs
+ * - a lot of error handling
+ * - support PCI device removal (see srcu usage in cxi_user_core.c)
+ * - find a way to cleanly pass the hash types. Modify ethtool?
+ * - add support for RSS contexts
+ */
+
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/etherdevice.h>
+#include <linux/pci.h>
+
+#include "cxi_eth.h"
+#include "cxi_eth_debugfs.h"
+
+unsigned int rss_indir_size = 64;
+module_param(rss_indir_size, int, 0444);
+MODULE_PARM_DESC(rss_indir_size, "Size of RSS indirection table");
+
+unsigned int max_rss_queues = 16;
+module_param(max_rss_queues, int, 0444);
+MODULE_PARM_DESC(max_rss_queues, "Maximum number of RSS queues (power of 2)");
+
+unsigned int max_tx_queues = 16;
+module_param(max_tx_queues, int, 0444);
+MODULE_PARM_DESC(max_tx_queues, "Maximum number of TX queues");
+
+unsigned int small_pkts_buf_size = CXI_ETH_1_MB;
+module_param(small_pkts_buf_size, uint, 0444);
+MODULE_PARM_DESC(small_pkts_buf_size, "Size of a small packets buffer (4 KiB to 1 GiB, 4 KiB aligned)");
+
+unsigned int small_pkts_buf_count = 4;
+module_param(small_pkts_buf_count, uint, 0444);
+MODULE_PARM_DESC(small_pkts_buf_count, "Number of small packets buffers (1 to 1024)");
+
+unsigned int large_pkts_buf_count = 1024;
+module_param(large_pkts_buf_count, uint, 0444);
+MODULE_PARM_DESC(large_pkts_buf_count, "Number of large packets buffers (1 to 10000)");
+
+unsigned int buffer_threshold = 256;
+module_param(buffer_threshold, uint, 0444);
+MODULE_PARM_DESC(buffer_threshold, "Ethernet packets with length greater than"
+		 " or equal to this threshold are large packets (0 to 16383)");
+
+unsigned int lpe_cdt_thresh_id = 2;
+module_param(lpe_cdt_thresh_id, uint, 0444);
+MODULE_PARM_DESC(lpe_cdt_thresh_id, "LPE append credit id to use (0 to 3)");
+
+static unsigned int rx_repost_retry_ms = 20;
+module_param(rx_repost_retry_ms, uint, 0444);
+MODULE_PARM_DESC(rx_repost_retry_ms,
+		 "Time to wait before retrying to repost an RX buffer, in ms");
+
+static struct dentry *cxieth_debug_dir;
+unsigned long rx_repost_retry_jiffies;
+
+static int idc_dma_threshold_set(const char *val, const struct kernel_param *kp)
+{
+	unsigned long num;
+	int ret;
+
+	if (!val)
+		return -EINVAL;
+
+	ret = kstrtoul(val, 0, &num);
+	if (ret || num > C_MAX_IDC_PAYLOAD_RES)
+		return -EINVAL;
+
+	*((unsigned int *)kp->arg) = num;
+
+	return 0;
+}
+
+static const struct kernel_param_ops idc_dma_threshold_ops = {
+	.set = idc_dma_threshold_set,
+	.get = param_get_uint,
+};
+
+unsigned int idc_dma_threshold = C_MAX_IDC_PAYLOAD_RES;
+module_param_cb(idc_dma_threshold, &idc_dma_threshold_ops,
+		&idc_dma_threshold, 0644);
+MODULE_PARM_DESC(idc_dma_threshold, "Ethernet packets up to this size will be"
+		 " sent inline. Larger packets will use DMA. (0 to 224)");
+
+/* List of devices registered with this client */
+static LIST_HEAD(dev_list);
+static DEFINE_MUTEX(dev_list_mutex);
+
+static const struct net_device_ops cxi_eth_netdev_ops = {
+	.ndo_open = cxi_eth_open,
+	.ndo_start_xmit = cxi_eth_start_xmit,
+	.ndo_stop = cxi_eth_close,
+	.ndo_set_mac_address = cxi_eth_mac_addr,
+	.ndo_set_rx_mode = cxi_eth_set_rx_mode,
+	.ndo_change_mtu = cxi_change_mtu,
+	.ndo_hwtstamp_get = cxi_eth_hwtstamp_get,
+	.ndo_hwtstamp_set = cxi_eth_hwtstamp_set,
+};
+
+/* Core is adding a new device */
+static int add_device(struct cxi_dev *cxi_dev)
+{
+	struct net_device *ndev;
+	struct cxi_eth *dev;
+	int rc;
+
+	/* Disable Ethernet devices on VF devices for now */
+	if (!cxi_dev->is_physfn)
+		return -ENODEV;
+
+	ndev = alloc_etherdev_mqs(sizeof(struct cxi_eth), max_tx_queues,
+				  max_rss_queues + 1);
+	if (!ndev) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	cxi_set_ethernet_threshold(cxi_dev, buffer_threshold);
+	cxi_set_roce_rcv_seg(cxi_dev, false);
+
+	SET_NETDEV_DEV(ndev, &cxi_dev->pdev->dev);
+
+	dev = netdev_priv(ndev);
+
+	dev->txqs = kcalloc(max_tx_queues, sizeof(*dev->txqs), GFP_KERNEL);
+	if (!dev->txqs) {
+		rc = -ENOMEM;
+		goto err_free_ether;
+	}
+
+	dev->rxqs = kcalloc(max_rss_queues + 1, sizeof(*dev->rxqs), GFP_KERNEL);
+	if (!dev->rxqs) {
+		rc = -ENOMEM;
+		goto err_free_txq;
+	}
+
+	dev->ndev = ndev;
+	dev->cxi_dev = cxi_dev;
+	spin_lock_init(&dev->cq_tgt_req_lock);
+	dev->is_c2 = cassini_version(&dev->cxi_dev->prop, CASSINI_2);
+
+	ndev->netdev_ops = &cxi_eth_netdev_ops;
+	ndev->ethtool_ops = &cxi_eth_ethtool_ops;
+	ndev->watchdog_timeo = CXI_ETH_TX_TIMEOUT;
+
+	//ndev->irq = cxi_dev->pdev->irq;
+	ndev->mtu = ETH_DATA_LEN;
+	ndev->min_mtu = ETH_ZLEN;
+	ndev->max_mtu = CXI_ETH_MAX_MTU;
+	ndev->tx_queue_len = TX_QUEUE_LEN_DEFAULT;
+
+	cxi_eth_devinfo(cxi_dev, &dev->eth_info);
+
+	eth_hw_addr_set(ndev, dev->eth_info.default_mac_addr);
+
+	dev->ringparam.rx_max_pending = LARGE_PKTS_BUF_COUNT_MAX;
+	dev->ringparam.rx_mini_max_pending = num_small_packets(SMALL_PKTS_BUF_COUNT_MAX);
+	dev->ringparam.tx_max_pending = CXI_MAX_CQ_COUNT;
+
+	dev->ringparam.rx_pending = large_pkts_buf_count;
+	dev->ringparam.rx_mini_pending = num_small_packets(small_pkts_buf_count);
+	dev->ringparam.tx_pending = min_t(unsigned int, CXI_MAX_CQ_COUNT,
+					  2 * dev->ndev->tx_queue_len);
+
+	/* Used to set min_free to be equal or higher than buffer_threshold. */
+	dev->min_free = roundup_pow_of_two(buffer_threshold) >>
+		dev->eth_info.min_free_shift;
+
+	ndev->hw_features = NETIF_F_HW_CSUM | NETIF_F_GSO | NETIF_F_SG |
+		NETIF_F_GRO | NETIF_F_RXCSUM | NETIF_F_HIGHDMA |
+		NETIF_F_RXHASH;
+
+	ndev->features = ndev->hw_features;
+	ndev->vlan_features = ndev->hw_features;
+	ndev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE;
+
+	rc = netif_set_real_num_queues(ndev,
+				       min_t(unsigned int, 8, max_tx_queues),
+				       min_t(unsigned int, 8, max_rss_queues));
+	if (rc)
+		goto err_free_rxq;
+
+	rc = register_netdev(ndev);
+	if (rc)
+		goto err_free_rxq;
+
+	/* If the SerDes are up, we must report the carrier as on here,
+	 * since we've already missed the link up event which was sent from
+	 * cxi-ss1
+	 */
+	if (cxi_is_link_up(cxi_dev)) {
+		/* Without the off->on transition, the ip link state will go to
+		 * UNKNOWN.
+		 */
+		netif_carrier_off(ndev);
+		netif_carrier_on(ndev);
+	} else {
+		netif_carrier_off(ndev);
+	}
+
+	device_debugfs_create(cxi_dev->name, dev, cxieth_debug_dir);
+
+	mutex_lock(&dev_list_mutex);
+	list_add_tail(&dev->dev_list, &dev_list);
+	mutex_unlock(&dev_list_mutex);
+
+	dev_info(&cxi_dev->pdev->dev, "%s[%s]: Added Ethernet device",
+		 cxi_dev->name, netdev_name(ndev));
+
+	return 0;
+
+err_free_rxq:
+	kfree(dev->rxqs);
+err_free_txq:
+	kfree(dev->txqs);
+err_free_ether:
+	free_netdev(ndev);
+err:
+	dev_err(&cxi_dev->pdev->dev,
+		"%s[]: Failure(%d): Ethernet device not added",
+		 cxi_dev->name, rc);
+	return rc;
+}
+
+/* From a given CXI device, find the ethernet device. Must be locked. */
+static struct cxi_eth *find_eth_device(const struct cxi_dev *cxi_dev)
+{
+	struct cxi_eth *dev;
+
+	list_for_each_entry_reverse(dev, &dev_list, dev_list) {
+		if (dev->cxi_dev == cxi_dev)
+			return dev;
+	}
+
+	return NULL;
+}
+
+static void remove_device(struct cxi_dev *cxi_dev)
+{
+	struct cxi_eth *dev;
+
+	/* Ethernet devices on VF devices are not added for now, so not removed */
+	if (!cxi_dev->is_physfn)
+		return;
+
+	mutex_lock(&dev_list_mutex);
+	dev = find_eth_device(cxi_dev);
+	if (dev)
+		list_del(&dev->dev_list);
+	mutex_unlock(&dev_list_mutex);
+
+	if (!dev) {
+		dev_info(&cxi_dev->pdev->dev,
+			 "%s[]: Failure(NOT FOUND): no Ethernet device to remove",
+			 cxi_dev->name);
+		return;
+	}
+
+	debugfs_remove(dev->debug);
+
+	unregister_netdev(dev->ndev);
+
+	kfree(dev->rxqs);
+	kfree(dev->txqs);
+	free_netdev(dev->ndev);
+
+	dev_info(&cxi_dev->pdev->dev, "%s[]: Removed Ethernet device",
+		 cxi_dev->name);
+}
+
+static void async_event(struct cxi_dev *cxi_dev, enum cxi_async_event event)
+{
+	struct cxi_eth *dev;
+
+	mutex_lock(&dev_list_mutex);
+	dev = find_eth_device(cxi_dev);
+	mutex_unlock(&dev_list_mutex);
+
+	if (!dev)
+		return;
+
+	netdev_dbg(dev->ndev, "got async event %d\n", event);
+
+	switch (event) {
+	case CXI_EVENT_LINK_UP:
+		netif_carrier_on(dev->ndev);
+		break;
+
+	case CXI_EVENT_LINK_DOWN:
+		netif_carrier_off(dev->ndev);
+		break;
+
+	default:
+		break;
+	}
+}
+
+static int cxi_netdev_event(struct notifier_block *this, unsigned long event,
+			    void *ptr)
+{
+	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
+
+	if (ndev->netdev_ops->ndo_open == &cxi_eth_open &&
+	    event == NETDEV_CHANGENAME) {
+		struct cxi_eth *dev = netdev_priv(ndev);
+
+		cxi_set_eth_name(dev->cxi_dev, netdev_name(ndev));
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block cxi_netdev_notifier = {
+	.notifier_call = cxi_netdev_event,
+};
+
+static struct cxi_client cxiu_client = {
+	.add = add_device,
+	.remove = remove_device,
+	.async_event = async_event,
+};
+
+static int __init init(void)
+{
+	unsigned int new;
+	int ret;
+
+	if (rss_indir_size && (!is_power_of_2(rss_indir_size) ||
+			       rss_indir_size > CXI_ETH_MAX_INDIR_ENTRIES)) {
+		rss_indir_size = min_t(unsigned int,
+				       roundup_pow_of_two(rss_indir_size),
+				       CXI_ETH_MAX_INDIR_ENTRIES);
+		pr_info("Adjusting rss_indir_size to %d\n", rss_indir_size);
+	}
+
+	if (max_rss_queues > CXI_ETH_MAX_RSS_QUEUES ||
+	    !is_power_of_2(max_rss_queues)) {
+		max_rss_queues = min_t(unsigned int,
+				       roundup_pow_of_two(max_rss_queues),
+				       CXI_ETH_MAX_RSS_QUEUES);
+		pr_info("Adjusting max_rss_queues to %d\n", max_rss_queues);
+	}
+
+	if (max_tx_queues > CXI_ETH_MAX_TX_QUEUES) {
+		max_tx_queues = CXI_ETH_MAX_TX_QUEUES;
+		pr_info("Adjusting max_tx_queues to %d\n", max_tx_queues);
+	}
+
+	if (small_pkts_buf_size < PAGE_SIZE) {
+		small_pkts_buf_size = PAGE_SIZE;
+		pr_info("Adjusting small_pkts_buf_size to %u\n",
+			small_pkts_buf_size);
+	} else if (small_pkts_buf_size > CXI_ETH_1_GB) {
+		small_pkts_buf_size = CXI_ETH_1_GB;
+		pr_info("Adjusting small_pkts_buf_size to %u\n",
+			small_pkts_buf_size);
+	} else if ((small_pkts_buf_size % PAGE_SIZE) != 0) {
+		small_pkts_buf_size = roundup(small_pkts_buf_size, PAGE_SIZE);
+		pr_info("Adjusting small_pkts_buf_size to %u\n",
+			small_pkts_buf_size);
+	}
+
+	new = clamp(small_pkts_buf_count,
+		    SMALL_PKTS_BUF_COUNT_MIN, SMALL_PKTS_BUF_COUNT_MAX);
+	if (new != small_pkts_buf_count) {
+		small_pkts_buf_count = new;
+		pr_info("Adjusting small_pkts_buf_count to %u\n",
+			small_pkts_buf_count);
+	}
+
+	new = clamp(large_pkts_buf_count,
+		    LARGE_PKTS_BUF_COUNT_MIN, LARGE_PKTS_BUF_COUNT_MAX);
+	if (new != large_pkts_buf_count) {
+		large_pkts_buf_count = new;
+		pr_info("Adjusting large_pkts_buf_count to %u\n",
+			large_pkts_buf_count);
+	}
+
+	if (!buffer_threshold) {
+		pr_err("buffer_threshold must be nonzero\n");
+		return -EINVAL;
+	}
+	if (buffer_threshold > 16383) {
+		buffer_threshold = 16383;
+		pr_info("Adjusting buffer_threshold to %u\n", buffer_threshold);
+	}
+
+	if (lpe_cdt_thresh_id > 3) {
+		lpe_cdt_thresh_id = 0;
+		pr_info("Resetting lpe_cdt_thresh_id to 0\n");
+	}
+
+	if (rx_repost_retry_ms < 1 || rx_repost_retry_ms > 5000) {
+		rx_repost_retry_ms = 20;
+		pr_info("Resetting rx_repost_retry_ms to 20ms\n");
+	}
+	rx_repost_retry_jiffies = msecs_to_jiffies(rx_repost_retry_ms);
+
+	ret = register_netdevice_notifier(&cxi_netdev_notifier);
+	if (ret) {
+		pr_err("Failed to register netdevice_notifier\n");
+		return -EINVAL;
+	}
+
+	cxieth_debug_dir = device_eth_debugfs_init();
+
+	ret = cxi_register_client(&cxiu_client);
+	if (ret) {
+		pr_err("Couldn't register CXI ethernet driver\n");
+		goto out;
+	}
+
+	return 0;
+
+out:
+	debugfs_remove(cxieth_debug_dir);
+	unregister_netdevice_notifier(&cxi_netdev_notifier);
+
+	return ret;
+}
+
+static void __exit cleanup(void)
+{
+	cxi_unregister_client(&cxiu_client);
+	unregister_netdevice_notifier(&cxi_netdev_notifier);
+	debugfs_remove(cxieth_debug_dir);
+}
+
+module_init(init);
+module_exit(cleanup);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cray eXascale Interconnect (CXI) Ethernet driver");
+MODULE_AUTHOR("Cray Inc.");
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c b/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c
new file mode 100644
index 000000000000..310a5a6484b9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018 Hewlett Packard Enterprise Development LP */
+
+/* cxi-eth debug fs*/
+#include <linux/netdevice.h>
+#include "cxi_eth.h"
+#include "cxi_eth_debugfs.h"
+
+static u64 bucket_times[NB_BUCKETS];
+
+static void dump_rx_queue(struct seq_file *s, const struct rx_queue *rx)
+{
+	const struct bucket *bucket;
+	int i;
+
+	seq_printf(s, "  EQ=%u, PtlTE=%u TGT PRIO CQ=%u\n",
+		   rx->eq->eqn, rx->pt->id, cxi_cq_get_cqn(rx->cq_tgt_prio));
+
+	seq_printf(s, "  Preferred NUMA Node: %u\n", rx->node);
+	seq_printf(s, "  Preferred CPU: %u\n", rx->cpu);
+
+	seq_printf(s, "  list rx_unallocated=%s\n",
+		   list_empty(&rx->rx_unallocated) ? "empty" : "not empty");
+	seq_printf(s, "  list rx_ready=%s\n",
+		   list_empty(&rx->rx_ready) ? "empty" : "not empty");
+	seq_printf(s, "  list rx_in_use=%s\n",
+		   list_empty(&rx->rx_in_use) ? "empty" : "not empty");
+
+	seq_printf(s, "  rx_bufs_count=%u\n", rx->rx_bufs_count);
+	seq_printf(s, "  append_prio=%llu\n", rx->stats.append_prio);
+	seq_printf(s, "  append_req=%llu\n", rx->stats.append_req);
+	seq_printf(s, "  append_failed=%llu\n", rx->stats.append_failed);
+	seq_printf(s, "  unlinked_prio=%llu\n", rx->stats.unlinked_prio);
+	seq_printf(s, "  unlinked_req=%llu\n", rx->stats.unlinked_req);
+	seq_printf(s, "  Last bad RC for dropped fragment: %u\n",
+		   rx->last_bad_frag_drop_rc);
+
+	/* Each bucket */
+	seq_puts(s, "  bucket for napi_schedule\n");
+	bucket = &rx->eth_napi_schedule;
+	if (bucket->min_ts == UINT_MAX)
+		seq_printf(s, "    min_ts=%llu\n", 0ULL);
+	else
+		seq_printf(s, "    min_ts=%llu\n", bucket->min_ts);
+	seq_printf(s, "    max_ts=%llu\n", bucket->max_ts);
+	for (i = 0; i < NB_BUCKETS; i++) {
+		if (i < (NB_BUCKETS - 1))
+			seq_printf(s, "      < %llu ns       %llu\n",
+				   bucket_times[i],
+				   bucket->b[i]);
+		else
+			seq_printf(s, "      higher          %llu\n",
+				   bucket->b[i]);
+	}
+	seq_puts(s, "\n");
+}
+
+static void dump_cq_info(struct seq_file *s, struct cxi_cq *cq)
+{
+	seq_printf(s, "    id: %u\n", cxi_cq_get_cqn(cq));
+	seq_printf(s, "    ptrs: size32=%u, rp32=%llu, hw_rp32=%u, wp32=%llu, hw_wp32=%llu\n",
+		   cq->size32, cq->rp32, cq->status->rd_ptr * 2,
+		   cq->wp32, cq->hw_wp32);
+	seq_printf(s, "    free CQ slots: %d\n", __cxi_cq_free_slots(cq));
+}
+
+static void dump_tx_queue(struct seq_file *s, const struct tx_queue *txq,
+			  struct cxi_eth *dev)
+{
+	struct netdev_queue *dev_queue =
+		netdev_get_tx_queue(txq->dev->ndev, txq->id);
+
+	seq_printf(s, "  EQ=%u\n", txq->eq->eqn);
+	seq_puts(s,   "  eth1 CQ:\n");
+	dump_cq_info(s, txq->eth1_cq);
+	if (dev->eth2_active) {
+		seq_puts(s,   "  eth2 CQ:\n");
+		dump_cq_info(s, txq->eth2_cq);
+	}
+	seq_puts(s,   "  shared CQ:\n");
+	dump_cq_info(s, txq->shared_cq);
+
+	seq_printf(s, "  Preferred NUMA Node: %u\n", txq->node);
+	seq_printf(s, "  Preferred CPU: %u\n", txq->cpu);
+	seq_printf(s, "  polling: %llu\n", txq->stats.polling);
+	seq_printf(s, "  TXQ EQ credits: %d\n", atomic_read(&txq->dma_eq_cdt));
+	seq_printf(s, "  TXQ stopped count for full CQ: %llu\n", txq->stats.stopped);
+	seq_printf(s, "  TXQ stopped for no EQ credits: %llu\n", txq->stats.stopped_eq);
+	seq_printf(s, "  TXQ restarted count: %llu\n", txq->stats.restarted);
+	seq_printf(s, "  TXQ got busy: %llu\n", txq->stats.tx_busy);
+	seq_printf(s, "  idc: %llu\n", txq->stats.idc);
+	seq_printf(s, "  idc_bytes: %llu\n", txq->stats.idc_bytes);
+	seq_printf(s, "  dma: %llu\n", txq->stats.dma);
+	seq_printf(s, "  dma_bytes: %llu\n", txq->stats.dma_bytes);
+	seq_printf(s, "  dma_forced: %llu\n", txq->stats.dma_forced);
+	seq_printf(s, "  force_dma: %u\n", txq->force_dma);
+	seq_printf(s, "  force_dma_interval: %u\n", txq->force_dma_interval);
+	seq_printf(s, "  netdev queue state: 0x%lx\n", dev_queue->state);
+}
+
+static int dump_dev(struct seq_file *s, void *unused)
+{
+	struct cxi_eth *dev = s->private;
+	u64 min_ts = UINT_MAX;
+	u64 max_ts = 0;
+	int i;
+	int j;
+
+	seq_printf(s, "rss_indir_size=%u\n", rss_indir_size);
+	seq_printf(s, "idc_dma_threshold=%u\n", idc_dma_threshold);
+	seq_printf(s, "small_pkts_buf_size=%u\n", small_pkts_buf_size);
+	seq_printf(s, "small_pkts_buf_count=%u\n", small_pkts_buf_count);
+	seq_printf(s, "large_pkts_buf_count=%u\n", large_pkts_buf_count);
+	seq_printf(s, "num rx_pending=%u\n", dev->ringparam.rx_pending);
+	seq_printf(s, "num rx_mini_pending=%u\n", dev->ringparam.rx_mini_pending);
+	seq_printf(s, "num tx_pending=%u\n", dev->ringparam.tx_pending);
+	seq_printf(s, "num_prio_buffers=%u\n", dev->num_prio_buffers);
+	seq_printf(s, "num_req_buffers=%u\n", dev->num_req_buffers);
+
+	if (!dev->is_active)
+		return 0;
+
+	seq_printf(s, "shared TGT REQ CQ=%u\n",
+		   cxi_cq_get_cqn(dev->cq_tgt_req));
+
+	for (i = 0; i < dev->res.rss_queues; i++) {
+		seq_printf(s, "RX queue %u\n", i);
+		dump_rx_queue(s, &dev->rxqs[i]);
+	}
+
+	if (dev->res.rss_queues) {
+		seq_printf(s, "PTP RX queue %u\n", PTP_RX_Q);
+		dump_rx_queue(s, &dev->rxqs[PTP_RX_Q]);
+	}
+
+	for (i = 0; i < dev->cur_txqs; i++) {
+		seq_printf(s, "TX queue %u\n", i);
+		dump_tx_queue(s, &dev->txqs[i], dev);
+	}
+
+	/* Sum all buckets */
+	seq_puts(s, "\n");
+	seq_puts(s, "ALL buckets for RX napi_schedule\n");
+
+	for (i = 0; i < dev->res.rss_queues; i++) {
+		const struct bucket *bucket = &dev->rxqs[i].eth_napi_schedule;
+
+		if (min_ts > bucket->min_ts)
+			min_ts = bucket->min_ts;
+		if (max_ts < bucket->max_ts)
+			max_ts = bucket->max_ts;
+	}
+
+	if (min_ts == UINT_MAX)
+		min_ts = 0;
+
+	seq_printf(s, "    min_ts=%llu\n", min_ts);
+	seq_printf(s, "    max_ts=%llu\n", max_ts);
+
+	for (i = 0; i < NB_BUCKETS; i++) {
+		u64 nb = 0;
+
+		for (j = 0; j < dev->res.rss_queues; j++)
+			nb += dev->rxqs[j].eth_napi_schedule.b[i];
+
+		if (i < (NB_BUCKETS - 1))
+			seq_printf(s, "      < %llu ns       %llu\n",
+				   bucket_times[i],
+				   nb);
+		else
+			seq_printf(s, "      higher          %llu\n",
+				   nb);
+	}
+	seq_puts(s, "\n");
+
+	return 0;
+}
+
+static int dump_dev_debug_dev_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, dump_dev, inode->i_private);
+}
+
+static const struct file_operations cxi_eth_fops = {
+	.owner = THIS_MODULE,
+	.open = dump_dev_debug_dev_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+struct dentry *device_eth_debugfs_init(void)
+{
+	int i;
+
+	for (i = 0; i < NB_BUCKETS; i++)
+		bucket_times[i] = 1 << i;
+	return debugfs_create_dir("cxi_eth", NULL);
+}
+
+void device_debugfs_create(char *name, struct cxi_eth *dev,
+			   struct dentry *cxieth_debug_dir)
+{
+	dev->debug = debugfs_create_file(name, 0444, cxieth_debug_dir,
+					 dev, &cxi_eth_fops);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth_ioctl.c b/drivers/net/ethernet/hpe/ss1/cxi_eth_ioctl.c
new file mode 100644
index 000000000000..cd69e2c6fe31
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_eth_ioctl.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cray Cassini ethernet driver - hardware timestamp configuration.
+ * © Copyright 2021 Hewlett Packard Enterprise Development LP
+ */
+
+#include <linux/netdevice.h>
+#include <linux/net_tstamp.h>
+
+#include "cxi_eth.h"
+
+int cxi_eth_hwtstamp_get(struct net_device *ndev,
+			 struct kernel_hwtstamp_config *config)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	hwtstamp_config_to_kernel(config, &dev->tstamp_config);
+
+	return 0;
+}
+
+int cxi_eth_hwtstamp_set(struct net_device *ndev,
+			 struct kernel_hwtstamp_config *config,
+			 struct netlink_ext_ack *extack)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct hwtstamp_config cfg;
+	int rc;
+
+	hwtstamp_config_from_kernel(&cfg, config);
+
+	rc = cxi_eth_cfg_timestamp(dev->cxi_dev, &cfg);
+	if (rc)
+		return rc;
+
+	dev->tstamp_config = cfg;
+
+	dev->ptp_ts_enabled = cfg.rx_filter == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+
+	/* Report the configuration actually applied, e.g. TX forced on. */
+	hwtstamp_config_to_kernel(config, &cfg);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c b/drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c
new file mode 100644
index 000000000000..d19a6a27aa23
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c
@@ -0,0 +1,2367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cray Cassini ethernet driver
+ * © Copyright 2018-2020 Cray Inc
+ * © Copyright 2020 Hewlett Packard Enterprise Development LP
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/etherdevice.h>
+#include <linux/if_vlan.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <linux/netdevice.h>
+#include <linux/pci.h>
+#include <linux/tcp.h>
+#include <linux/udp.h>
+#include <linux/vmalloc.h>
+#include <net/ipv6.h>
+
+#include "cxi_eth.h"
+#include "cxi_core.h"
+
+#define ROCE_V2_UDP_DPORT	4791
+
+static unsigned int tx_eq_count;
+module_param(tx_eq_count, uint, 0444);
+MODULE_PARM_DESC(tx_eq_count, "Override the number of entries in transmit event queue");
+
+static int cxi_rx_eth_poll(struct napi_struct *napi, int budget);
+static void rx_eq_cb(void *context);
+
+static void err_eq_cb(void *context)
+{
+	struct cxi_eth *dev = context;
+	const union c_event *event;
+
+	while ((event = cxi_eq_get_event(dev->err_eq))) {
+		switch (event->hdr.event_type) {
+		case C_EVENT_COMMAND_FAILURE:
+			netdev_warn(dev->ndev, "%s CQ %u disabled\n",
+				    event->cmd_fail.is_target ?
+				    "target" : "transmit",
+				    event->cmd_fail.cq_id);
+			break;
+		default:
+			netdev_warn(dev->ndev, "Unhandled event %u, rc %d\n",
+				    event->hdr.event_type,
+				    event->hdr.return_code);
+			print_hex_dump(KERN_INFO,
+				       "cxi eth unexpected tx event: ",
+				       DUMP_PREFIX_ADDRESS, 16, 1, event,
+				       (8 << event->hdr.event_size), false);
+		}
+
+		cxi_eq_ack_events(dev->err_eq);
+	}
+
+	cxi_eq_int_enable(dev->err_eq);
+}
+
+static void cancel_tx_tstamp(struct cxi_eth *dev, struct sk_buff *skb)
+{
+	if (cmpxchg(&dev->tstamp_skb, skb, NULL) == skb)
+		skb_shinfo(skb)->tx_flags &= ~SKBTX_IN_PROGRESS;
+}
+
+static void finalize_tx_tstamp(struct cxi_eth *dev, struct sk_buff *skb)
+{
+	struct skb_shared_hwtstamps tstamps;
+	int rc;
+
+	if (skb != dev->tstamp_skb) {
+		netdev_warn_once(dev->ndev, "skb != dev->tstamp_skb : %p != %p",
+				 skb, dev->tstamp_skb);
+		return;
+	}
+
+	rc = cxi_eth_get_tx_timestamp(dev->cxi_dev, &tstamps);
+	if (!rc)
+		skb_tstamp_tx(skb, &tstamps);
+
+	/* Release timestamp slot */
+	cmpxchg(&dev->tstamp_skb, skb, NULL);
+}
+
+static void unmap_frags(struct device *dma_dev, struct sk_buff *skb)
+{
+	struct cb_data *cb = (struct cb_data *)skb->cb;
+	int i;
+
+	for (i = 0; i < cb->num_frags; i++) {
+		int len;
+
+		if (i < MAX_CB_LEN) {
+			len = cb->dma_len[i];
+		} else {
+			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i - 1];
+
+			len = skb_frag_size(frag);
+		}
+
+		dma_unmap_single(dma_dev, cb->dma_addr[i], len, DMA_TO_DEVICE);
+	}
+}
+
+/* Prepare the segments in the command, mapping them for DMA */
+static int prepare_frags(struct device *dma_dev, struct sk_buff *skb,
+			 struct c_dma_eth_cmd *dma_eth)
+{
+	struct cb_data *cb = (struct cb_data *)skb->cb;
+	int i;
+
+	BUILD_BUG_ON(sizeof(struct cb_data) > sizeof(skb->cb));
+
+	dma_eth->num_segments = 1 + skb_shinfo(skb)->nr_frags;
+
+	if (skb_shinfo(skb)->nr_frags) {
+		unsigned int segnum = 0;
+
+		cb->dma_len[segnum] = dma_eth->len[segnum] = skb_headlen(skb);
+		segnum++;
+
+		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
+			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+
+			dma_eth->len[segnum] = skb_frag_size(frag);
+
+			if (segnum < MAX_CB_LEN)
+				cb->dma_len[segnum] = dma_eth->len[segnum];
+
+			segnum++;
+		}
+	} else {
+		cb->dma_len[0] = skb->len;
+		dma_eth->len[0] = skb->len;
+	}
+
+	cb->num_frags = 0;
+
+	for (i = 0; i < dma_eth->num_segments; i++) {
+		dma_addr_t dma_addr;
+
+		if (i == 0) {
+			dma_addr = dma_map_single(dma_dev, skb->data,
+						  dma_eth->len[i], DMA_TO_DEVICE);
+		} else {
+			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i - 1];
+
+			dma_addr = dma_map_single(dma_dev, skb_frag_address(frag),
+						  dma_eth->len[i], DMA_TO_DEVICE);
+		}
+
+		if (dma_mapping_error(dma_dev, dma_addr)) {
+			unmap_frags(dma_dev, skb);
+			return -ENOMEM;
+		}
+
+		cb->dma_addr[i] = dma_eth->addr[i] = dma_addr;
+		cb->num_frags++;
+	}
+
+	return 0;
+}
+
+/* A packet was sent with a DMA command. Returns the number of EQ
+ * credits to return to the TX queue.
+ */
+static unsigned int eth_complete(struct cxi_eth *dev, struct tx_queue *txq,
+				 const union c_event *event, int budget,
+				 unsigned int *pkts, unsigned int *bytes)
+{
+	struct net_device *ndev = dev->ndev;
+	struct sk_buff *skb;
+	enum c_return_code return_code;
+
+	if (event->hdr.event_size == C_EVENT_SIZE_16_BYTE) {
+		return_code = event->init_short.return_code;
+		skb = (void *)event->init_short.user_ptr;
+	} else {
+		return_code = event->init_long.return_code;
+		skb = (void *)event->init_long.user_ptr;
+	}
+
+	if (skb == NULL) {
+		/* Bad IDC commands will generate a SEND event on error. */
+		if (return_code == C_RC_OK)
+			netdev_warn_once(dev->ndev,
+					 "Successful command with NULL skb\n");
+
+		ndev->stats.tx_dropped++;
+
+		return 0;
+	}
+
+	if (return_code == C_RC_OK) {
+		ndev->stats.tx_packets++;
+		ndev->stats.tx_bytes += skb->len;
+		*pkts += 1;
+		*bytes += skb->len;
+	} else {
+		netdev_err_once(dev->ndev,
+				"DMA command failed to complete: %d\n",
+				return_code);
+		ndev->stats.tx_dropped++;
+	}
+
+	if (skb_shinfo(skb)->tx_flags & SKBTX_IN_PROGRESS)
+		finalize_tx_tstamp(dev, skb);
+
+	unmap_frags(&dev->cxi_dev->pdev->dev, skb);
+
+	napi_consume_skb(skb, budget);
+
+	return 1;
+}
+
+static int cxi_tx_eth_poll(struct napi_struct *napi, int budget)
+{
+	struct tx_queue *txq = container_of(napi, struct tx_queue, napi);
+	struct cxi_eth *dev = txq->dev;
+	struct netdev_queue *dev_queue =
+		netdev_get_tx_queue(dev->ndev, txq->id);
+	const union c_event *event;
+	int work_done = 0;
+	unsigned int event_count = 0;
+	unsigned int pkts = 0;
+	unsigned int bytes = 0;
+	unsigned int cdts = 0;
+
+	txq->stats.polling++;
+
+	while (work_done < budget && (event = cxi_eq_get_event(txq->eq))) {
+		switch (event->hdr.event_type) {
+		case C_EVENT_SEND:
+			cdts += eth_complete(dev, txq, event, budget, &pkts, &bytes);
+			work_done++;
+			break;
+		default:
+			netdev_warn(dev->ndev, "Unhandled event %u, rc %d\n",
+				    event->hdr.event_type,
+				    event->hdr.return_code);
+			print_hex_dump(KERN_INFO,
+				       "cxi eth unexpected tx event: ",
+				       DUMP_PREFIX_ADDRESS, 16, 1, event,
+				       (8 << event->hdr.event_size), false);
+		}
+
+		event_count++;
+		if (event_count == 16) {
+			cxi_eq_int_disable(txq->eq);
+			event_count = 0;
+
+			atomic_add(cdts, &txq->dma_eq_cdt);
+			cdts = 0;
+		}
+	}
+
+	BUG_ON(work_done > budget);
+
+	/* Check to see if the TX queue needs to be re-enabled. */
+	if (netif_tx_queue_stopped(dev_queue)) {
+		if (__cxi_cq_free_slots(txq->shared_cq) >= 16 &&
+		    __cxi_cq_free_slots(txq->eth1_cq) >= 16 &&
+		    (!dev->eth2_active || __cxi_cq_free_slots(txq->eth2_cq) >= 16) &&
+		    atomic_read(&txq->dma_eq_cdt) > 0) {
+			txq->stats.restarted++;
+			netif_tx_wake_queue(dev_queue);
+		}
+	}
+
+	if (pkts)
+		netdev_tx_completed_queue(dev_queue, pkts, bytes);
+
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
+		/* Ack events and re-enable the EQ interrupt. */
+		cxi_eq_int_enable(txq->eq);
+	} else if (event_count) {
+		cxi_eq_int_disable(txq->eq);
+	}
+
+	atomic_add(cdts, &txq->dma_eq_cdt);
+
+	return work_done;
+}
+
+static void tx_eq_cb(void *context)
+{
+	struct tx_queue *tx = context;
+
+	napi_schedule(&tx->napi);
+}
+
+void enable_tx_queue(struct tx_queue *tx)
+{
+	napi_enable(&tx->napi);
+	cxi_eq_int_enable(tx->eq);
+}
+
+void disable_tx_queue(struct tx_queue *tx)
+{
+	cxi_eq_int_disable(tx->eq);
+	napi_disable(&tx->napi);
+}
+
+void free_tx_queue(struct tx_queue *tx)
+{
+	netif_napi_del(&tx->napi);
+
+	tx->untagged_cq = NULL;
+
+	cxi_cq_free(tx->shared_cq);
+	tx->shared_cq = NULL;
+
+	cxi_cq_free(tx->eth1_cq);
+	tx->eth1_cq = NULL;
+
+	if (tx->eth2_cq) {
+		cxi_cq_free(tx->eth2_cq);
+		tx->eth2_cq = NULL;
+	}
+
+	cxi_eq_free(tx->eq);
+	tx->eq = NULL;
+
+	if (is_vmalloc_addr(tx->eq_attr.queue))
+		cxi_unmap(tx->eq_md);
+	kvfree(tx->eq_attr.queue);
+	tx->eq_attr.queue = NULL;
+
+	tx->dev = NULL;
+}
+
+static void cxi_eth_get_node_cpu(struct cxi_eth *dev, unsigned int queue_id,
+				 unsigned int *queue_node,
+				 unsigned int *queue_cpu)
+{
+	int node;
+	int cpu;
+	int cpu_offset;
+	const struct cpumask *cpus;
+	int cpu_count;
+	int num_cpu_nodes = 0;
+	int i;
+
+	/* Figure out how many numa nodes are online and contain
+	 * CPUs. Apparently linux will reorder the nodes so that the
+	 * empty ones are at the end of the list. If it's not the
+	 * case, then further changes will be needed.
+	 */
+	for_each_online_node(node) {
+		cpus = cpumask_of_node(node);
+		if (!cpumask_empty(cpus))
+			num_cpu_nodes++;
+	}
+	if (!num_cpu_nodes || dev_to_node(&dev->cxi_dev->pdev->dev) < 0)
+		goto fallback;
+
+	/* Round robin queues across all the nodes in the system instead of
+	 * overloading 1 node with multiple queues. Favor the local node to
+	 * start with.
+	 */
+	node = (dev_to_node(&dev->cxi_dev->pdev->dev) + queue_id) % num_cpu_nodes;
+	if (!node_online(node)) {
+		/* For sanity, but that shouldn't be possible. */
+		netdev_err(dev->ndev, "Node %u not online. Defaulting to %u\n",
+			   node, dev_to_node(&dev->cxi_dev->pdev->dev));
+		node = dev_to_node(&dev->cxi_dev->pdev->dev);
+	}
+
+	/* If the queue ID exceeds the number of nodes, multiple queues will be
+	 * mapped to the same node. For this case, round robin queues within the
+	 * node.
+	 */
+	cpus = cpumask_of_node(node);
+	if (cpumask_empty(cpus)) {
+		/* For sanity, but that shouldn't be possible. */
+		netdev_err(dev->ndev, "Node %u is empty. Defaulting to all cpus.\n",
+			   node);
+		cpus = cpu_all_mask;
+	}
+
+	cpu_count = 0;
+	for_each_cpu(cpu, cpus) {
+		if (cpu_is_offline(cpu))
+			continue;
+		/* We only care about CPUs which belong to the NUMA node. */
+		if (cpumask_test_cpu(cpu, cpus))
+			cpu_count++;
+	}
+
+	if (!cpu_count)
+		goto fallback;
+	cpu_offset = (queue_id / num_cpu_nodes) % cpu_count;
+	i = 0;
+	for_each_cpu(cpu, cpus) {
+		if (cpu_is_offline(cpu))
+			continue;
+		if (cpumask_test_cpu(cpu, cpus)) {
+			if (i == cpu_offset)
+				break;
+			i++;
+		}
+	}
+
+	if (cpu < nr_cpu_ids)
+		goto out;
+
+fallback:
+	cpu = cpumask_local_spread(queue_id,
+				   dev_to_node(&dev->cxi_dev->pdev->dev));
+out:
+	*queue_node = cpu_to_node(cpu);
+	*queue_cpu = cpu;
+}
+
+int alloc_tx_queue(struct cxi_eth *dev, unsigned int id)
+{
+	struct tx_queue *tx = &dev->txqs[id];
+	struct cxi_cq_alloc_opts cq_alloc_opts = {};
+	struct c_cstate_cmd c_state = {};
+	unsigned int eq_count;
+	int rc;
+
+	memset(tx, 0, sizeof(*tx));
+
+	cxi_eth_get_node_cpu(dev, id, &tx->node, &tx->cpu);
+
+	tx->force_dma_interval = dev->ndev->tx_queue_len / 8;
+	tx->force_dma = tx->force_dma_interval;
+
+	cq_alloc_opts.count = min_t(unsigned int, CXI_MAX_CQ_COUNT,
+				    2 * dev->ndev->tx_queue_len);
+
+	eq_count = tx_eq_count ? tx_eq_count : 4 * cq_alloc_opts.count;
+	tx->eq_attr.queue_len = PAGE_ALIGN(C_EE_CFG_ECB_SIZE * eq_count);
+
+	tx->eq_attr.queue = kvzalloc_node(tx->eq_attr.queue_len, GFP_KERNEL,
+					  tx->node);
+	if (!tx->eq_attr.queue) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	/* Keep a 5% margin for IDC send errors if they ever happen. */
+	atomic_set(&tx->dma_eq_cdt, (eq_count * 95) / 100);
+
+	if (is_vmalloc_addr(tx->eq_attr.queue)) {
+		tx->eq_md = cxi_map(dev->lni, (uintptr_t)tx->eq_attr.queue,
+				    tx->eq_attr.queue_len, CXI_MAP_WRITE, NULL);
+		if (IS_ERR(tx->eq_md)) {
+			rc = PTR_ERR(tx->eq_md);
+			goto err_free_eq_buf;
+		}
+	} else {
+		tx->eq_attr.flags = CXI_EQ_PASSTHROUGH;
+	}
+
+	tx->eq_attr.cpu_affinity = tx->cpu;
+	tx->eq = cxi_eq_alloc(dev->lni, tx->eq_md, &tx->eq_attr, tx_eq_cb, tx,
+			      NULL, NULL);
+	if (IS_ERR(tx->eq)) {
+		rc = PTR_ERR(tx->eq);
+		goto err_unmap_eq_buf;
+	}
+
+	cq_alloc_opts.flags = CXI_CQ_IS_TX | CXI_CQ_TX_ETHERNET;
+	cq_alloc_opts.lcid = dev->eth1_cp->lcid;
+	tx->eth1_cq = cxi_cq_alloc(dev->lni, dev->err_eq, &cq_alloc_opts,
+				   tx->node);
+	if (IS_ERR(tx->eth1_cq)) {
+		rc = PTR_ERR(tx->eth1_cq);
+		goto err_free_eq;
+	}
+
+	cq_alloc_opts.lcid = dev->shared_cp->lcid;
+	tx->shared_cq = cxi_cq_alloc(dev->lni, dev->err_eq, &cq_alloc_opts,
+				     tx->node);
+	if (IS_ERR(tx->shared_cq)) {
+		rc = PTR_ERR(tx->shared_cq);
+		goto err_free_eth1_cq;
+	}
+
+	if (dev->eth2_active) {
+		cq_alloc_opts.lcid = dev->eth2_cp->lcid;
+		tx->eth2_cq = cxi_cq_alloc(dev->lni, dev->err_eq,
+					   &cq_alloc_opts, tx->node);
+
+		if (IS_ERR(tx->eth2_cq)) {
+			rc = PTR_ERR(tx->eth2_cq);
+			goto err_free_shared_cq;
+		}
+	}
+
+	/* Add C_STATE command. */
+	c_state.eq = tx->eq->eqn;
+	c_state.restricted = 1;
+	c_state.event_success_disable = 1;
+	c_state.event_send_disable = 1;
+
+	rc = cxi_cq_emit_c_state(tx->eth1_cq, &c_state);
+	if (rc) {
+		netdev_err(dev->ndev, "Command emit failed: %d\n", rc);
+		goto err_free_eth2_cq;
+	}
+
+	cxi_cq_ring(tx->eth1_cq);
+
+	rc = cxi_cq_emit_c_state(tx->shared_cq, &c_state);
+	if (rc) {
+		netdev_err(dev->ndev, "Command emit failed: %d\n", rc);
+		goto err_free_eth2_cq;
+	}
+
+	cxi_cq_ring(tx->shared_cq);
+
+	if (dev->eth2_active) {
+		rc = cxi_cq_emit_c_state(tx->eth2_cq, &c_state);
+		if (rc) {
+			netdev_err(dev->ndev, "Command emit failed: %d\n", rc);
+			goto err_free_eth2_cq;
+		}
+
+		cxi_cq_ring(tx->eth2_cq);
+	}
+
+	/* Determine which tx_queue CQ should be used for untagged traffic */
+	if (dev->cxi_dev->untagged_eth_pcp == dev->eth1_pcp)
+		tx->untagged_cq = tx->eth1_cq;
+	else if (dev->eth2_active &&
+		 dev->cxi_dev->untagged_eth_pcp == dev->eth2_pcp)
+		tx->untagged_cq = tx->eth2_cq;
+	else
+		tx->untagged_cq = tx->shared_cq;
+
+	tx->dev = dev;
+	tx->id = id;
+
+	NETIF_NAPI_ADD_TX(dev->ndev, &tx->napi, cxi_tx_eth_poll);
+
+	return 0;
+
+err_free_eth2_cq:
+	if (dev->eth2_active) {
+		cxi_cq_free(tx->eth2_cq);
+		tx->eth2_cq = NULL;
+	}
+err_free_shared_cq:
+	cxi_cq_free(tx->shared_cq);
+	tx->shared_cq = NULL;
+err_free_eth1_cq:
+	cxi_cq_free(tx->eth1_cq);
+	tx->eth1_cq = NULL;
+err_free_eq:
+	cxi_eq_free(tx->eq);
+	tx->eq = NULL;
+err_unmap_eq_buf:
+	if (is_vmalloc_addr(tx->eq_attr.queue))
+		cxi_unmap(tx->eq_md);
+err_free_eq_buf:
+	kvfree(tx->eq_attr.queue);
+	tx->eq_attr.queue = NULL;
+err:
+	return rc;
+}
+
+/* Free the receive buffers on the ready lists.
+ * TODO: when closing the device, make sure all buffers are back on
+ * the ready lists.
+ */
+static void free_rx_buffers(struct rx_queue *rx)
+{
+	struct cxi_eth *dev = rx->dev;
+	struct rx_buffer *buf;
+
+	/* Move all buffers to the ready list and free them. */
+	list_splice_init(&rx->rx_in_use, &rx->rx_ready);
+
+	while ((buf = list_first_entry_or_null(&rx->rx_ready,
+					       struct rx_buffer, buf_list))) {
+		list_del(&buf->buf_list);
+		list_add_tail(&buf->buf_list, &rx->rx_unallocated);
+
+		if (buf->ptl_list == C_PTL_LIST_PRIORITY) {
+			if (buf->page) {
+				dma_unmap_page(&dev->cxi_dev->pdev->dev,
+					       dma_unmap_addr(buf, mapping),
+				PAGE_SIZE, DMA_FROM_DEVICE);
+
+				for (; buf->posted_count > 0; buf->posted_count--)
+					put_page(buf->page);
+
+				__free_page(buf->page);
+				buf->page = NULL;
+			}
+		} else {
+			cxi_unmap(buf->md);
+			kvfree(buf->data);
+		}
+		buf->data = NULL;
+	}
+}
+
+/* Allocate and map the receive buffers. */
+static int alloc_rx_buffers(struct rx_queue *rx, unsigned int count,
+			    enum c_ptl_list ptl_list)
+{
+	int rc;
+	unsigned int i;
+	struct rx_buffer *buf;
+	unsigned int data_size;
+	struct cxi_eth *dev = rx->dev;
+	int numa_node = dev_to_node(&dev->cxi_dev->pdev->dev);
+
+	if (ptl_list == C_PTL_LIST_PRIORITY)
+		data_size = dev->eth_info.max_segment_size;
+	else
+		data_size = small_pkts_buf_size;
+
+	for (i = 0; i < count; i++) {
+		buf = list_first_entry_or_null(&rx->rx_unallocated,
+					       struct rx_buffer, buf_list);
+		if (!buf)
+			break;
+
+		list_del(&buf->buf_list);
+
+		buf->data_size = data_size;
+
+		if (ptl_list == C_PTL_LIST_REQUEST) {
+			buf->data = kvzalloc_node(buf->data_size, GFP_KERNEL,
+						  numa_node);
+			if (!buf->data)
+				goto out_requeue;
+
+			buf->md = cxi_map(dev->lni, (uintptr_t)buf->data,
+					  buf->data_size, CXI_MAP_WRITE, NULL);
+			if (IS_ERR(buf->md)) {
+				rc = PTR_ERR(buf->md);
+				netdev_err(dev->ndev,
+					   "cxi_map failed: %d\n", rc);
+				kvfree(buf->data);
+				buf->data = NULL;
+				goto out_requeue;
+			}
+		}
+
+		/* Allocated. Enqueue on the corresponding ready list. */
+		buf->ptl_list = ptl_list;
+
+		list_add_tail(&buf->buf_list, &rx->rx_ready);
+
+		if (ptl_list == C_PTL_LIST_PRIORITY)
+			dev->num_prio_buffers++;
+		else
+			dev->num_req_buffers++;
+	}
+
+	return i;
+
+out_requeue:
+	list_add_tail(&buf->buf_list, &rx->rx_unallocated);
+
+	return i;
+}
+
+/* Re-post an RX buffer. The buffer is on the rx_ready list. */
+static int append_rx_buffer(struct rx_queue *rx, struct rx_buffer *buf,
+			    gfp_t gfp)
+{
+	int rc;
+	dma_addr_t mapping;
+	struct page *page;
+	struct cxi_eth *dev = rx->dev;
+	struct c_target_cmd cmd = {
+		.command.opcode = C_CMD_TGT_APPEND,
+		.ptl_list = buf->ptl_list,
+		.ptlte_index = rx->pt->id,
+		.op_put = 1,
+		.no_truncate = 1,
+		.event_link_disable = 1,
+		.length = buf->data_size,
+		.buffer_id = buf->id,
+		.unrestricted_end_ro = 1,
+		.unrestricted_body_ro = 1,
+		.event_unlink_disable = 1,
+	};
+	int i;
+	size_t posted_offset;
+
+	if (buf->ptl_list == C_PTL_LIST_PRIORITY) {
+		cmd.use_once = 1;
+
+		if (buf->page == NULL) {
+			page = alloc_page(gfp);
+			if (!page) {
+				rc = -ENOMEM;
+				goto fail;
+			}
+
+			mapping = dma_map_page(&dev->cxi_dev->pdev->dev, page,
+					       0, PAGE_SIZE,
+					       DMA_FROM_DEVICE);
+			if (dma_mapping_error(&dev->cxi_dev->pdev->dev,
+					      mapping)) {
+				__free_page(page);
+				rc = -EIO;
+				goto fail;
+			}
+			buf->page = page;
+			buf->mapping = mapping;
+		}
+
+		cmd.start = buf->mapping;
+		cmd.lac = dev->phys_lac;
+		buf->cur_offset = 0;
+		buf->posted_count = 0;
+		posted_offset = 0;
+
+		for (i = 0; i < rx->page_chunks; i++) {
+			cmd.start = buf->mapping + posted_offset;
+
+			rc = cxi_cq_emit_target(rx->cq_tgt_prio, &cmd);
+			if (rc)
+				goto fail;
+
+			get_page(buf->page);
+			buf->posted_count++;
+			posted_offset += dev->eth_info.max_segment_size;
+			rx->stats.append_prio++;
+		}
+	} else {
+		cmd.manage_local = 1;
+		cmd.min_free = dev->min_free;
+		cmd.start = buf->md->iova;
+		cmd.lac = buf->md->lac;
+
+		spin_lock_bh(&dev->cq_tgt_req_lock);
+		rc = cxi_cq_emit_target(dev->cq_tgt_req, &cmd);
+		spin_unlock_bh(&dev->cq_tgt_req_lock);
+
+		rx->stats.append_req++;
+	}
+
+fail:
+	if (rc) {
+		netdev_err_once(dev->ndev, "Append failed on list %d: %d\n",
+				buf->ptl_list, rc);
+		rx->stats.append_failed++;
+	} else {
+		list_del(&buf->buf_list);
+		list_add_tail(&buf->buf_list, &rx->rx_in_use);
+	}
+
+	return rc;
+}
+
+/* Append all ready RX buffers to the portal.
+ * Return the number of buffers appended.
+ */
+int post_rx_buffers(struct rx_queue *rx, gfp_t gfp)
+{
+	struct cxi_eth *dev = rx->dev;
+	unsigned int posted = 0;
+	unsigned int count = 0;
+	struct rx_buffer *buf;
+	struct rx_buffer *tmp;
+	int rc = 0;
+
+	list_for_each_entry_safe(buf, tmp, &rx->rx_ready, buf_list) {
+		rc = append_rx_buffer(rx, buf, gfp);
+		if (rc)
+			break;
+
+		/* Ring the CQ regularly */
+		if (buf->ptl_list == C_PTL_LIST_PRIORITY) {
+			posted++;
+			if (posted == 16) {
+				cxi_cq_ring(rx->cq_tgt_prio);
+				posted = 0;
+			}
+		} else {
+			spin_lock_bh(&dev->cq_tgt_req_lock);
+			cxi_cq_ring(dev->cq_tgt_req);
+			spin_unlock_bh(&dev->cq_tgt_req_lock);
+		}
+
+		count++;
+	}
+
+	if (posted)
+		cxi_cq_ring(rx->cq_tgt_prio);
+
+	return rc ? rc : count;
+}
+
+#define EXPECTED_TARGET_EVENT_SIZE (sizeof(struct c_event_target_enet))
+#define MIN_PACKET_SIZE 64U
+size_t get_rxq_eq_buf_size(struct cxi_eth *dev)
+{
+	size_t num_events;
+
+	/* Calculate the maximum number of events which could occur based on
+	 * RX buffer configuration.
+	 */
+	num_events = dev->ringparam.rx_pending +
+		(small_pkts_buf_count * (small_pkts_buf_size / MIN_PACKET_SIZE));
+
+	return ALIGN((num_events * EXPECTED_TARGET_EVENT_SIZE) +
+		     C_EE_CFG_ECB_SIZE, PAGE_SIZE);
+}
+
+/* CXI_CQ_UPDATE_HIGH_FREQ_EMPTY updates the read pointer every 16 slots.
+ * Since a read pointer status update could be missed on CQ wrap, 2 * 16 slots
+ * should be included as overhead.
+ *
+ * In addition, 4 event slots are reserved for status updates. Thus, an
+ * additional 4 slots should be included as overhead.
+ */
+#define TGT_CQ_OVERHEAD_COUNT ((2U * 16U) + 4U)
+
+int alloc_rx_queue(struct cxi_eth *dev, unsigned int id)
+{
+	int i;
+	int rc;
+	static const struct cxi_pt_alloc_opts pt_alloc_opts = {
+		.en_flowctrl = 1, /* TODO: needed for ethernet? */
+		.ethernet = 1,
+		.do_space_check = 1,
+		.lossless = 1,
+	};
+	struct cxi_eq_attr eq_attr = {};
+	struct cxi_cq_alloc_opts cq_alloc_opts = {};
+	struct rx_queue *rx = &dev->rxqs[id];
+	unsigned int prio_bufs;
+
+	memset(rx, 0, sizeof(*rx));
+
+	cxi_eth_get_node_cpu(dev, id, &rx->node, &rx->cpu);
+
+	rx->dev = dev;
+	rx->id = id;
+	rx->last_bad_frag_drop_rc = C_RC_OK;
+	rx->eth_napi_schedule.min_ts = UINT_MAX;
+
+	INIT_LIST_HEAD(&rx->rx_unallocated);
+	INIT_LIST_HEAD(&rx->rx_ready);
+	INIT_LIST_HEAD(&rx->rx_in_use);
+
+	/* Packets landing on priority buffers will be chopped into
+	 * max_segment_size pieces. Since pages are priority buffers, to avoid
+	 * wasting page memory, pages should be chunked in max_segment_size
+	 * pieces and posted.
+	 */
+	rx->page_chunks = PAGE_SIZE / dev->eth_info.max_segment_size;
+
+	/* The number of priority buffers, not pages, is the size of the RX
+	 * ring divided by number of page chunks. If the
+	 * PAGE_SIZE ==  max_segment_size, the number of prio_bufs will equal
+	 * rx_pending.
+	 */
+	prio_bufs = DIV_ROUND_UP(dev->ringparam.rx_pending, rx->page_chunks);
+	rx->rx_bufs_count = prio_bufs + small_pkts_buf_count;
+	rx->rx_bufs = vzalloc(rx->rx_bufs_count * sizeof(*rx->rx_bufs));
+	if (rx->rx_bufs == NULL) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	for (i = 0; i < rx->rx_bufs_count; i++) {
+		struct rx_buffer *buf = &rx->rx_bufs[i];
+
+		buf->id = i;
+		list_add_tail(&buf->buf_list, &rx->rx_unallocated);
+	}
+
+	/* Allocate RX buffers */
+	rc = alloc_rx_buffers(rx, prio_bufs, C_PTL_LIST_PRIORITY);
+	if (rc == 0) {
+		netdev_info(dev->ndev, "Cannot allocate RX priority buffers\n");
+		rc = -ENOMEM;
+		goto err_free_rx_bufs;
+	} else if (rc != prio_bufs) {
+		netdev_info(dev->ndev,
+			    "Only allocated %d RX priority buffers out of %u requested\n",
+			    rc, prio_bufs);
+	}
+
+	rc = alloc_rx_buffers(rx, small_pkts_buf_count, C_PTL_LIST_REQUEST);
+	if (rc == 0) {
+		netdev_info(dev->ndev, "Cannot allocate RX request buffers\n");
+		rc = -ENOMEM;
+		goto err_free_buffers;
+	} else if (rc != small_pkts_buf_count) {
+		netdev_info(dev->ndev,
+			    "Only allocated %d RX request buffers out of %d requested\n",
+			    rc, small_pkts_buf_count);
+	}
+
+	cq_alloc_opts.policy = CXI_CQ_UPDATE_HIGH_FREQ_EMPTY;
+	cq_alloc_opts.count = dev->ringparam.rx_pending + TGT_CQ_OVERHEAD_COUNT;
+	cq_alloc_opts.lpe_cdt_thresh_id = lpe_cdt_thresh_id;
+	rx->cq_tgt_prio = cxi_cq_alloc(dev->lni, dev->err_eq, &cq_alloc_opts,
+				       rx->node);
+	if (IS_ERR(rx->cq_tgt_prio)) {
+		rc = PTR_ERR(rx->cq_tgt_prio);
+		goto err_free_buffers;
+	}
+
+	rx->eq_buf_size = get_rxq_eq_buf_size(dev);
+	rx->eq_buf = kvzalloc_node(rx->eq_buf_size, GFP_KERNEL, rx->node);
+	if (!rx->eq_buf) {
+		rc = -ENOMEM;
+		goto err_free_cq;
+	}
+
+	if (is_vmalloc_addr(rx->eq_buf)) {
+		rx->eq_md = cxi_map(dev->lni, (uintptr_t)rx->eq_buf,
+				    rx->eq_buf_size, CXI_MAP_WRITE, NULL);
+		if (IS_ERR(rx->eq_md)) {
+			rc = PTR_ERR(rx->eq_md);
+			goto err_free_eq_buf;
+		}
+	} else {
+		eq_attr.flags = CXI_EQ_PASSTHROUGH;
+	}
+
+	eq_attr.queue = rx->eq_buf;
+	eq_attr.queue_len = rx->eq_buf_size;
+	eq_attr.cpu_affinity = rx->cpu;
+	rx->eq = cxi_eq_alloc(dev->lni, rx->eq_md, &eq_attr, rx_eq_cb, rx, NULL,
+			      NULL);
+	if (IS_ERR(rx->eq)) {
+		rc = PTR_ERR(rx->eq);
+		goto err_unmap_eq_buf;
+	}
+
+	cxi_eq_int_disable(rx->eq);
+
+	/* Create an Ethernet portal */
+	rx->pt = cxi_pte_alloc(dev->lni, rx->eq, &pt_alloc_opts);
+	if (IS_ERR(rx->pt)) {
+		rc = PTR_ERR(rx->pt);
+		goto err_free_eq;
+	}
+
+	NETIF_NAPI_ADD(dev->ndev, &rx->napi, cxi_rx_eth_poll);
+
+	return 0;
+
+err_free_eq:
+	cxi_eq_free(rx->eq);
+err_unmap_eq_buf:
+	if (is_vmalloc_addr(rx->eq_buf))
+		cxi_unmap(rx->eq_md);
+err_free_eq_buf:
+	kvfree(rx->eq_buf);
+err_free_cq:
+	cxi_cq_free(rx->cq_tgt_prio);
+err_free_buffers:
+	free_rx_buffers(rx);
+err_free_rx_bufs:
+	vfree(rx->rx_bufs);
+err:
+	rx->dev = NULL;
+	return rc;
+}
+
+void free_rx_queue(struct rx_queue *rx)
+{
+	if (!rx->dev)
+		return;
+
+	netif_napi_del(&rx->napi);
+
+	cxi_pte_free(rx->pt);
+	rx->pt = NULL;
+	cxi_eq_free(rx->eq);
+	rx->eq = NULL;
+
+	if (is_vmalloc_addr(rx->eq_buf))
+		cxi_unmap(rx->eq_md);
+	kvfree(rx->eq_buf);
+	rx->eq_md = NULL;
+	rx->eq_buf = NULL;
+
+	cxi_cq_free(rx->cq_tgt_prio);
+	rx->cq_tgt_prio = NULL;
+	free_rx_buffers(rx);
+	vfree(rx->rx_bufs);
+	rx->rx_bufs = NULL;
+	rx->dev = NULL;
+}
+
+void enable_rx_queue(struct rx_queue *rx)
+{
+	napi_enable(&rx->napi);
+	cxi_eq_int_enable(rx->eq);
+}
+
+void disable_rx_queue(struct rx_queue *rx)
+{
+	if (!rx->dev)
+		return;
+
+	cxi_eq_int_disable(rx->eq);
+	napi_disable(&rx->napi);
+}
+
+#define DEFAULT_RESERVED_LES 1024U
+
+static unsigned int get_reserved_les(void)
+{
+	int reserved_les;
+	int max_rx_queues = max_rss_queues + 1; // +1 for PTP queue
+	int max_les_per_queue;
+
+	reserved_les = cxi_get_lpe_append_credits(lpe_cdt_thresh_id);
+	if (reserved_les < 0) {
+		pr_err("Failed to get LPE append credits. Used default %u\n",
+		       DEFAULT_RESERVED_LES);
+		return DEFAULT_RESERVED_LES;
+	}
+
+	max_les_per_queue = reserved_les + small_pkts_buf_count;
+
+	/* Each RX queue needs max_les_per_queue. Since the CXI service reserves
+	 * LEs against each LPE pool (4 pools total), the total number of LEs
+	 * needed needs to be divided by 4. cxi_pte_alloc() will then round
+	 * robind across the LPE pools.
+	 */
+	reserved_les = max_les_per_queue * (max_rx_queues / C_PE_COUNT);
+
+	/* Need to account if the number of queues is not a factor of 4. */
+	if (max_rx_queues % C_PE_COUNT)
+		reserved_les += max_les_per_queue;
+
+	return reserved_les;
+}
+
+/* Allocate the hardware resources and some receive buffers */
+int hw_setup(struct cxi_eth *dev)
+{
+	int rc;
+	int lac;
+	struct net_device *ndev = dev->ndev;
+	const struct cxi_rsrc_limits limits = {
+		.acs = {
+			.max = 1,
+			.res = 1,
+		},
+		.eqs = {
+			.max = 1 + max_rss_queues + (max_tx_queues * 2),
+			.res = 1,
+		},
+		.cts = {
+			.max = 0,
+			.res = 0,
+		},
+		.ptes = {
+			.max = 1 + max_rss_queues,
+			.res = 8,
+		},
+		.txqs = {
+			.max = max_tx_queues * 2,
+			.res = 1,
+		},
+		.tgqs = {
+			.max = 1 + 1 + max_rss_queues,
+			.res = 1,
+		},
+		.tles = {
+			.max = 0,
+			.res = 0,
+		},
+		/* Will actually have 4 * res value for les */
+		.les = {
+			.max = MAX_LE_LIMIT,
+			.res = get_reserved_les(),
+		},
+	};
+	struct cxi_svc_desc svc_desc = {
+		.resource_limits = true,
+		.limits = limits,
+		.is_system_svc = true,
+		.restricted_members = true,
+		.restricted_vnis = true,
+		.num_vld_vnis = 0,
+		.enable = true,
+		.members[0] = {
+			.type = CXI_SVC_MEMBER_UID,
+			.svc_member.uid = (current_euid()).val,
+		},
+	};
+	struct cxi_cq_alloc_opts cq_alloc_opts = {};
+	u8 shared_cp_pcp;
+
+	/* Allocate a Service */
+	rc = cxi_svc_alloc(dev->cxi_dev, &svc_desc, NULL, "ethernet-svc");
+	if (rc < 0) {
+		netdev_info(ndev, "Can't reserve resources: %d\n", rc);
+		goto err;
+	}
+	dev->svc_id = rc;
+
+	dev->lni = cxi_lni_alloc(dev->cxi_dev, dev->svc_id);
+	if (IS_ERR(dev->lni)) {
+		rc = PTR_ERR(dev->lni);
+		netdev_info(ndev, "Can't get an LNI: %d\n", rc);
+		goto err_free_svc;
+	}
+
+	lac = cxi_phys_lac_alloc(dev->lni);
+	if (lac < 0) {
+		rc = -EINVAL;
+		netdev_info(ndev, "failed to get a physical LAC: %d\n", rc);
+		goto err_free_ni;
+	}
+	dev->phys_lac = lac;
+
+	/* Store PCPs for all the Eth Classes */
+	dev->eth1_pcp = cxi_get_tc_req_pcp(dev->cxi_dev, CXI_ETH_TC1);
+	if (dev->eth1_pcp < 0) {
+		rc = -EINVAL;
+		goto err_free_ni;
+	}
+
+	/* Determine if Eth2 is active. Eth1 and Shared will always be active */
+	dev->eth2_pcp = cxi_get_tc_req_pcp(dev->cxi_dev, CXI_ETH_TC2);
+	dev->eth2_active = (dev->eth2_pcp >= 0 && dev->eth2_pcp < 8);
+
+	/* The Shared Ethernet Class is configured with all PCPs apart from
+	 * the ones used by Eth1 and Eth2. Use any of them for configuring
+	 * the CP
+	 */
+	for (shared_cp_pcp = 0; shared_cp_pcp <= 7; shared_cp_pcp++) {
+		if (shared_cp_pcp != dev->eth1_pcp &&
+		    (!dev->eth2_active || shared_cp_pcp != dev->eth2_pcp))
+			break;
+	}
+
+	/* Allocate CPs for each Eth TC
+	 * TODO: Support unique communication profiles + CQ + MCUs for each
+	 * PCP. This may not be feasible with the resource needed for each.
+	 */
+	dev->eth1_cp = cxi_trig_cp_alloc(dev->lni, dev->eth1_pcp,
+					 CXI_ETH_TC1, CXI_TC_TYPE_DEFAULT,
+					 NON_TRIG_LCID);
+	if (IS_ERR(dev->eth1_cp)) {
+		rc = PTR_ERR(dev->eth1_cp);
+		netdev_info(ndev, "Can't allocate Eth1 CP: %d\n", rc);
+		goto err_free_lac;
+	}
+
+	dev->shared_cp = cxi_trig_cp_alloc(dev->lni, shared_cp_pcp,
+					   CXI_ETH_SHARED,
+					   CXI_TC_TYPE_DEFAULT, NON_TRIG_LCID);
+	if (IS_ERR(dev->shared_cp)) {
+		rc = PTR_ERR(dev->shared_cp);
+		netdev_info(ndev, "Can't allocate Eth shared CP: %d\n", rc);
+		goto err_free_eth1_cp;
+	}
+
+	if (dev->eth2_active) {
+		dev->eth2_cp = cxi_trig_cp_alloc(dev->lni, dev->eth2_pcp,
+						 CXI_ETH_TC2,
+						 CXI_TC_TYPE_DEFAULT,
+						 NON_TRIG_LCID);
+		if (IS_ERR(dev->eth2_cp)) {
+			rc = PTR_ERR(dev->eth2_cp);
+			netdev_info(ndev, "Can't allocate Eth2 CP: %d\n", rc);
+			goto err_free_shared_cp;
+		}
+	}
+
+	dev->err_eq_attr.queue_len = PAGE_SIZE;
+	dev->err_eq_attr.queue = (void *)
+		__get_free_pages(GFP_KERNEL | __GFP_ZERO,
+				 get_order(dev->err_eq_attr.queue_len));
+	if (!dev->err_eq_attr.queue) {
+		rc = -ENOMEM;
+		netdev_info(ndev, "Can't allocate the EQ buffer: %d\n", rc);
+		goto err_free_eth2_cp;
+	}
+
+	dev->err_eq_attr.flags = CXI_EQ_PASSTHROUGH;
+	dev->err_eq = cxi_eq_alloc(dev->lni, NULL, &dev->err_eq_attr, err_eq_cb,
+				   dev, NULL, NULL);
+	if (IS_ERR(dev->err_eq)) {
+		rc = PTR_ERR(dev->err_eq);
+		netdev_info(ndev, "Can't allocate the EQ: %d\n", rc);
+		goto err_free_err_eq_buf;
+	}
+
+	cq_alloc_opts.policy = CXI_CQ_UPDATE_HIGH_FREQ_EMPTY;
+	cq_alloc_opts.count =
+		(small_pkts_buf_count * (max_rss_queues + 1)) +	TGT_CQ_OVERHEAD_COUNT;
+	dev->cq_tgt_req = cxi_cq_alloc(dev->lni, dev->err_eq, &cq_alloc_opts,
+				       dev_to_node(&dev->cxi_dev->pdev->dev));
+	if (IS_ERR(dev->cq_tgt_req)) {
+		rc = PTR_ERR(dev->cq_tgt_req);
+		netdev_info(ndev, "Can't allocate the target CQ: %d\n", rc);
+		goto err_free_err_eq;
+	}
+
+	/* Configure RXQ zero used for default/catch-all traffic. */
+	rc = alloc_rx_queue(dev, 0);
+	if (rc) {
+		netdev_info(ndev, "Can't allocate the receive queue: %d\n", rc);
+		goto err_free_cq_tgt_req;
+	}
+	dev->res.ptn_def = dev->rxqs[0].pt->id;
+
+	rc = post_rx_buffers(&dev->rxqs[0], GFP_KERNEL);
+	if (rc < 0) {
+		netdev_info(ndev, "Cannot post any RX buffers: %d\n", rc);
+		goto err_free_rx_queue;
+	}
+
+	/* Configure PTP RX queue */
+	rc = alloc_rx_queue(dev, PTP_RX_Q);
+	if (rc) {
+		netdev_info(ndev, "Can't allocate the PTP receive queue: %d\n",
+			    rc);
+		goto err_free_rx_queue;
+	}
+	dev->res.ptn_ptp = dev->rxqs[PTP_RX_Q].pt->id;
+	rc = post_rx_buffers(&dev->rxqs[PTP_RX_Q], GFP_KERNEL);
+	if (rc < 0) {
+		netdev_info(ndev, "Cannot post RX buffers: %d\n", rc);
+		goto err_free_ptp_queue;
+	}
+
+	rc = alloc_tx_queue(dev, 0);
+	if (rc) {
+		netdev_info(ndev, "Can't allocate the transmit queue: %d\n",
+			    rc);
+		goto err_free_ptp_queue;
+	}
+
+	dev->mac_addr = ether_addr_to_u64(ndev->dev_addr);
+	dev->ptp_mac_addr = PTP_L2_MAC;
+
+	cxi_eth_add_mac(dev->cxi_dev, &dev->res, dev->mac_addr,	false);
+
+	enable_rx_queue(&dev->rxqs[0]);
+	enable_rx_queue(&dev->rxqs[PTP_RX_Q]);
+	enable_tx_queue(&dev->txqs[0]);
+
+	dev->res.rss_queues = 1;
+	rc = cxi_set_rx_channels(dev, dev->ndev->real_num_rx_queues);
+	if (rc) {
+		netdev_info(ndev,
+			    "Can't set the number of RX channels to %d: %d\n",
+			    dev->ndev->real_num_rx_queues, rc);
+		goto err_disable_queues;
+	}
+
+	dev->cur_txqs = 1;
+	rc = cxi_set_tx_channels(dev, dev->ndev->real_num_tx_queues);
+	if (rc) {
+		netdev_info(ndev,
+			    "Can't set the number of TX channels to %d: %d\n",
+			    dev->ndev->real_num_tx_queues, rc);
+		goto err_set_rx_queues;
+	}
+
+	cxi_eth_set_rx_mode(ndev);
+	netif_tx_start_all_queues(ndev);
+	dev->is_active = true;
+
+	return 0;
+
+err_set_rx_queues:
+	cxi_set_rx_channels(dev, 1);
+err_disable_queues:
+	disable_tx_queue(&dev->txqs[0]);
+	disable_rx_queue(&dev->rxqs[PTP_RX_Q]);
+	disable_rx_queue(&dev->rxqs[0]);
+	cxi_eth_set_list_invalidate_all(dev->cxi_dev, &dev->res);
+	free_tx_queue(&dev->txqs[0]);
+err_free_ptp_queue:
+	free_rx_queue(&dev->rxqs[PTP_RX_Q]);
+err_free_rx_queue:
+	free_rx_queue(&dev->rxqs[0]);
+err_free_cq_tgt_req:
+	cxi_cq_free(dev->cq_tgt_req);
+err_free_err_eq:
+	cxi_eq_free(dev->err_eq);
+err_free_err_eq_buf:
+	free_pages((unsigned long)dev->err_eq_attr.queue,
+		   get_order(dev->err_eq_attr.queue_len));
+err_free_eth2_cp:
+	if (dev->eth2_active)
+		cxi_cp_free(dev->eth2_cp);
+err_free_shared_cp:
+	cxi_cp_free(dev->shared_cp);
+err_free_eth1_cp:
+	cxi_cp_free(dev->eth1_cp);
+err_free_lac:
+	cxi_phys_lac_free(dev->lni, dev->phys_lac);
+err_free_ni:
+	cxi_lni_free(dev->lni);
+err_free_svc:
+	cxi_svc_destroy(dev->cxi_dev, dev->svc_id);
+err:
+	return rc;
+}
+
+/* Release hardware resources belonging to a device. */
+void hw_cleanup(struct cxi_eth *dev)
+{
+	int i;
+
+	if (!dev->is_active)
+		return;
+
+	netif_tx_stop_all_queues(dev->ndev);
+
+	dev->is_active = false;
+
+	for (i = 0; i < dev->cur_txqs; i++)
+		disable_tx_queue(&dev->txqs[i]);
+
+	/* Disable RSS support and free RX queues. */
+	cxi_eth_clear_indir_table(dev->cxi_dev, &dev->res);
+	for (i = 0; i < dev->res.rss_queues; i++)
+		disable_rx_queue(&dev->rxqs[i]);
+	disable_rx_queue(&dev->rxqs[PTP_RX_Q]);
+
+	cxi_eth_set_list_invalidate_all(dev->cxi_dev, &dev->res);
+
+	for (i = 0; i < dev->cur_txqs; i++)
+		free_tx_queue(&dev->txqs[i]);
+
+	for (i = 0; i < dev->res.rss_queues; i++)
+		free_rx_queue(&dev->rxqs[i]);
+	free_rx_queue(&dev->rxqs[PTP_RX_Q]);
+
+	cxi_cq_free(dev->cq_tgt_req);
+	dev->cq_tgt_req = NULL;
+	cxi_eq_free(dev->err_eq);
+	free_pages((unsigned long)dev->err_eq_attr.queue,
+		   get_order(dev->err_eq_attr.queue_len));
+	dev->err_eq = NULL;
+	if (dev->eth2_active) {
+		cxi_cp_free(dev->eth2_cp);
+		dev->eth2_cp = NULL;
+	}
+	cxi_cp_free(dev->shared_cp);
+	dev->shared_cp = NULL;
+	cxi_cp_free(dev->eth1_cp);
+	dev->eth1_cp = NULL;
+	cxi_phys_lac_free(dev->lni, dev->phys_lac);
+	dev->phys_lac = 0;
+	cxi_lni_free(dev->lni);
+	dev->lni = NULL;
+	cxi_svc_destroy(dev->cxi_dev, dev->svc_id);
+}
+
+static struct sk_buff *eth_rx_copy(struct rx_queue *rx,
+				   struct rx_buffer *buf,
+				   const struct c_event_target_enet *event)
+{
+	struct cxi_eth *dev = rx->dev;
+	struct net_device *ndev = dev->ndev;
+	struct sk_buff *skb;
+	struct page *page;
+	unsigned char *start;
+	u64 buffer_start;
+	u64 offset;
+
+	if (unlikely(!buf->md || !buf->data))
+		return NULL;
+	buffer_start = CXI_VA_TO_IOVA(buf->md, (uintptr_t)buf->data);
+	if (unlikely(event->start < buffer_start))
+		return NULL;
+	offset = event->start - buffer_start;
+	if (unlikely(offset > buf->data_size ||
+		     event->length > buf->data_size - offset))
+		return NULL;
+	start = buf->data + offset;
+
+	if (likely(rx->frag_state == FRAG_NONE && !event->more_frags)) {
+		/* single fragment */
+		skb = napi_alloc_skb(&rx->napi, event->length);
+		if (unlikely(!skb))
+			return NULL;
+
+		__skb_put_data(skb, start, event->length);
+
+		skb->protocol = eth_type_trans(skb, ndev);
+	} else {
+		skb = napi_get_frags(&rx->napi);
+		if (unlikely(!skb))
+			return NULL;
+
+		/* The SKB may already be full, due to the adapter
+		 * being configured to fragment too much.
+		 */
+		if (unlikely(skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS))
+			return NULL;
+
+		if (rx->frag_state == FRAG_NONE &&
+		    event->length <= skb_availroom(skb)) {
+			__skb_put_data(skb, start, event->length);
+		} else {
+			if (unlikely(event->length > PAGE_SIZE))
+				return NULL;
+			page = alloc_page(GFP_ATOMIC);
+			if (unlikely(!page)) {
+				napi_free_frags(&rx->napi);
+				return NULL;
+			}
+
+			memcpy(page_address(page), start, event->length);
+
+			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
+					page, 0, event->length, PAGE_SIZE);
+		}
+	}
+
+	return skb;
+}
+
+static struct sk_buff *eth_rx_frags(struct rx_queue *rx,
+				    struct rx_buffer *buf,
+				    const struct c_event_target_enet *event)
+{
+	struct cxi_eth *eth_dev = rx->dev;
+	struct device *dev = &eth_dev->cxi_dev->pdev->dev;
+	struct sk_buff *skb;
+	struct page *page;
+	int frag_len;
+
+	if (unlikely(!buf->page || !buf->posted_count ||
+		     buf->cur_offset >= PAGE_SIZE ||
+		     event->length > PAGE_SIZE - buf->cur_offset ||
+		     event->length > eth_dev->eth_info.max_segment_size))
+		return NULL;
+
+	skb = napi_get_frags(&rx->napi);
+	if (unlikely(!skb))
+		return NULL;
+
+	/* The SKB may already be full, due to the adapter
+	 * being configured to fragment too much.
+	 */
+	if (unlikely(skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS))
+		return NULL;
+
+	page = buf->page;
+	frag_len = event->length;
+
+	if (rx->frag_state == FRAG_NONE)
+		prefetch(page_address(page));
+
+	skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
+			page, buf->cur_offset, frag_len,
+			eth_dev->eth_info.max_segment_size);
+	dma_sync_single_for_cpu(dev, buf->mapping + buf->cur_offset, frag_len,
+				DMA_FROM_DEVICE);
+
+	buf->cur_offset += eth_dev->eth_info.max_segment_size;
+	buf->posted_count--;
+
+	if (buf->posted_count == 0) {
+		dma_unmap_page(dev, dma_unmap_addr(buf, mapping), PAGE_SIZE,
+			       DMA_FROM_DEVICE);
+		put_page(page);
+		buf->page = NULL;
+	}
+
+	return skb;
+}
+
+/* Check whether the RoCE packet in the SKB has been segmented by
+ * hardware, which also removed its iCRC. Fix the headers if that
+ * happened.
+ */
+static void check_segmented_roce(struct sk_buff *skb)
+{
+	int frag_len;
+	u16 protocol;
+	struct ethhdr *ethhdr;
+	size_t vhdr_size = 0;
+
+	/* heuristic to figure out whether Cassini stripped the iCRC
+	 * from a RoCE packet, following its segmentation.
+	 */
+	if (skb_shinfo(skb)->nr_frags != 1)
+		return;
+
+	ethhdr = (void *)skb->data;
+	protocol = be16_to_cpu(ethhdr->h_proto);
+
+	/* Check for vlan header - we will support at most one vlan header,
+	 * no nested headers, ipv6 extensions, etc.
+	 */
+	if (eth_type_vlan(ethhdr->h_proto)) {
+		struct vlan_ethhdr *veth;
+
+		veth = (struct vlan_ethhdr *)skb->data;
+		protocol = be16_to_cpu(veth->h_vlan_encapsulated_proto);
+		vhdr_size = sizeof(struct vlan_hdr);
+	}
+
+	/* Check length. ETH+IPv4/6+UDP+BTH headers. */
+	if (skb_headlen(skb) < (54 + vhdr_size) || skb_headlen(skb) > (90 + vhdr_size))
+		return;
+
+	frag_len = skb_frag_size(&skb_shinfo(skb)->frags[0]);
+	if (frag_len != 1024 && frag_len != 2048 && frag_len != 4096)
+		return;
+
+	/* Adjust the IP packet by removing the 4 bytes and
+	 * recomputing the IP header checksum.
+	 */
+	switch (protocol) {
+	case ETH_P_IP: {
+		struct udphdr *udph;
+		struct iphdr *iph;
+
+		iph = (void *)skb->data + sizeof(struct ethhdr) + vhdr_size;
+		iph->tot_len = cpu_to_be16(be16_to_cpu(iph->tot_len) - 4);
+		iph->check = 0;
+		iph->check = ip_fast_csum((const void *)iph, iph->ihl);
+
+		udph = (void *)(iph + 1);
+		udph->len = cpu_to_be16(be16_to_cpu(udph->len) - 4);
+	}
+		break;
+
+	case ETH_P_IPV6: {
+		struct udphdr *udph;
+		struct ipv6hdr *ip6h;
+
+		ip6h = (void *)skb->data + sizeof(struct ethhdr) + vhdr_size;
+		ip6h->payload_len =
+			cpu_to_be16(be16_to_cpu(ip6h->payload_len) - 4);
+
+		if (ip6h->nexthdr != NEXTHDR_UDP) {
+			netdev_warn_once(skb->dev,
+					 "Unexpected ipv6 packet format (nexthdr = %d)\n",
+					 ip6h->nexthdr);
+			return;
+		}
+
+		udph = (void *)(ip6h + 1);
+		udph->len = cpu_to_be16(be16_to_cpu(udph->len) - 4);
+	}
+		break;
+
+	default:
+		netdev_warn_once(skb->dev,
+				 "unexpected protocol in RoCE packet: %x\n",
+				 protocol);
+		return;
+	}
+
+	/* TODO. For now, use a bit in the SKB to tell RXE that
+	 * the iCRC is gone, and that the packet is otherwise correct.
+	 */
+	cxi_skb_icrc_gone(skb);
+}
+
+/* Convert from hash type (i.e. C_RSS_HASH_IPV4_UDP) to linux hash
+ * type (i.e. PKT_HASH_TYPE_L4). Only valid if the hash type is not
+ * C_RSS_HASH_NONE.
+ */
+static const u8 rss_hash_type_to_level[C_RSS_HASH_IPV6_FLOW_LABEL + 1] = {
+	[C_RSS_HASH_IPV4] = PKT_HASH_TYPE_L3,
+	[C_RSS_HASH_IPV4_PROTOCOL] = PKT_HASH_TYPE_L3,
+	[C_RSS_HASH_IPV4_FLOW_LABEL] = PKT_HASH_TYPE_L3,
+	[C_RSS_HASH_IPV6] = PKT_HASH_TYPE_L3,
+	[C_RSS_HASH_IPV6_PROTOCOL] = PKT_HASH_TYPE_L3,
+	[C_RSS_HASH_IPV6_FLOW_LABEL] = PKT_HASH_TYPE_L3,
+
+	[C_RSS_HASH_IPV4_TCP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV4_UDP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV4_PROTOCOL_TCP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV4_PROTOCOL_UDP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV4_PROTOCOL_UDP_ROCE] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV6_TCP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV6_UDP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV6_PROTOCOL_TCP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV6_PROTOCOL_UDP] = PKT_HASH_TYPE_L4,
+	[C_RSS_HASH_IPV6_PROTOCOL_UDP_ROCE] = PKT_HASH_TYPE_L4,
+};
+
+static void set_rss_hash_value(const struct c_event_target_enet *event,
+			       struct sk_buff *skb)
+{
+	if (event->rss_hash_type == C_RSS_HASH_NONE ||
+	    event->rss_hash_type > C_RSS_HASH_IPV6_FLOW_LABEL)
+		return;
+
+	skb_set_hash(skb, event->rss_hash_value,
+		     rss_hash_type_to_level[event->rss_hash_type]);
+}
+
+/* Process a received packet */
+static bool eth_receive(struct rx_queue *rx,
+			const struct c_event_target_enet *event)
+{
+	struct cxi_eth *dev = rx->dev;
+	struct net_device *ndev = dev->ndev;
+	struct sk_buff *skb = NULL;
+	struct rx_buffer *buf;
+	bool packet_complete = false;
+
+	/* Find the target buffer */
+	if (event->ptlte_index != rx->pt->id) {
+		netdev_err(ndev, "Unknown portal target in RX event (%d instead of %d)\n",
+			   event->ptlte_index, rx->pt->id);
+		return packet_complete;
+	}
+
+	buf = &rx->rx_bufs[event->buffer_id];
+
+	if (unlikely(event->return_code != C_RC_OK ||
+		     (event->is_roce && !event->more_frags &&
+		      !event->roce_icrc_ok) ||
+		     event->parser_err ||
+		     rx->frag_state == FRAG_DROP)) {
+		goto drop;
+	}
+
+	if (event->ptl_list == C_PTL_LIST_PRIORITY)
+		skb = eth_rx_frags(rx, buf, event);
+	else
+		skb = eth_rx_copy(rx, buf, event);
+
+	if (unlikely(!skb))
+		goto drop;
+
+	if (dev->is_c2) {
+		if (event->seg_cnt == 0) {
+			/* It's a new packet */
+			rx->pkt_cnt = event->pkt_cnt;
+			rx->next_seg_cnt = 1;
+
+			/* Free existing incomplete segments if any */
+			if (rx->frag_state != FRAG_NONE) {
+				ndev->stats.rx_dropped++;
+				rx->frag_state = FRAG_NONE;
+				napi_free_frags(&rx->napi);
+			}
+		} else if (event->pkt_cnt != rx->pkt_cnt ||
+			   event->seg_cnt != rx->next_seg_cnt) {
+			goto drop;
+		} else {
+			rx->next_seg_cnt++;
+		}
+	}
+
+	if (event->more_frags == 0) {
+		__be16 csum;
+
+		ndev->stats.rx_packets++;
+		ndev->stats.rx_bytes += skb->len;
+
+		csum = (__force __be16)event->checksum;
+		skb->csum = (__force __wsum)be16_to_cpu(csum);
+		skb->ip_summed = CHECKSUM_COMPLETE;
+
+		/* Cassini ERRATA-3258. This should test event->timestamp, but
+		 * Cassini 1/1.1 doesn't set it.
+		 */
+		if (dev->ptp_ts_enabled &&
+		    event->ptlte_index == dev->res.ptn_ptp) {
+			struct c_ts ts;
+			int rc;
+
+			rc = skb_copy_bits(skb, skb->len - sizeof(ts),
+					   &ts, sizeof(ts));
+			if (rc)
+				goto drop;
+
+			/* Cassini ERRATA-3276. Ignore the timestamp on Cassini 1
+			 * if ns is close to 1s, as RX timestamp can
+			 * be off by one second in that case. No issue
+			 * on Cassini 2.
+			 */
+			if (dev->is_c2 || ts.ns < 999999700)
+				skb_hwtstamps(skb)->hwtstamp =
+					ktime_set(ts.sec, ts.ns);
+
+			pskb_trim(skb, skb->len - sizeof(ts));
+		}
+
+		if (event->is_roce) {
+			if (skb->len <= 64 && !dev->is_c2 &&
+			    (skb_shinfo(skb)->nr_frags == 0))
+				/* Due to a rarely occurring hardware
+				 * bug, iCRC on packets smaller than
+				 * 65 bytes may be passed although
+				 * they are corrupted.  Tell the rxe
+				 * driver to check it again.
+				 */
+				cxi_force_icrc_check(skb);
+			else if (dev->priv_flags & CXI_ETH_PF_ROCE_OPT)
+				check_segmented_roce(skb);
+		}
+
+		skb_record_rx_queue(skb, rx->id);
+
+		if (ndev->features & NETIF_F_RXHASH)
+			set_rss_hash_value(event, skb);
+
+		if (skb_is_nonlinear(skb)) {
+			napi_gro_frags(&rx->napi);
+
+			rx->frag_state = FRAG_NONE;
+		} else {
+			napi_gro_receive(&rx->napi, skb);
+		}
+
+		packet_complete = true;
+	} else {
+		rx->frag_state = FRAG_MORE;
+	}
+
+requeue:
+	if (event->ptl_list == C_PTL_LIST_PRIORITY) {
+		rx->stats.unlinked_prio++;
+
+		if (buf->page == NULL) {
+			list_del(&buf->buf_list);
+			list_add_tail(&buf->buf_list, &rx->rx_ready);
+		}
+	} else if (event->auto_unlinked) {
+		rx->stats.unlinked_req++;
+		list_del(&buf->buf_list);
+		list_add_tail(&buf->buf_list, &rx->rx_ready);
+	}
+
+	return packet_complete;
+
+drop:
+	/* Error on receive, NIC dropped this frag, or driver dropped a previous
+	 * frag, or skb allocation failure
+	 */
+	netdev_dbg(dev->ndev,
+		   "received return_code=%d more=%d state=%d ptl_list=%d roce=%d\n",
+		   event->return_code, event->more_frags, rx->frag_state,
+		   event->ptl_list, event->is_roce);
+
+	if (event->return_code != C_RC_OK)
+		rx->last_bad_frag_drop_rc = event->return_code;
+
+	/* Not always a whole packet, so in theory a single packet
+	 * could be counted several times, one for each segment.
+	 */
+	ndev->stats.rx_dropped++;
+
+	if (rx->frag_state != FRAG_DROP)
+		napi_free_frags(&rx->napi);
+
+	if (event->more_frags)
+		rx->frag_state = FRAG_DROP;
+	else
+		rx->frag_state = FRAG_NONE;
+
+	goto requeue;
+}
+
+/* RX queue interrupt handler. Disable the interrupts for that EQ and
+ * trigger NAPI.
+ */
+static void rx_eq_cb(void *context)
+{
+	struct rx_queue *rx = context;
+
+	rx->time_napi_schedule = ktime_get_raw();
+	napi_schedule(&rx->napi);
+}
+
+static void add_ktime_to_bucket(struct bucket *bucket, u64 ns)
+{
+	int i;
+
+	if (ns > bucket->max_ts)
+		bucket->max_ts = ns;
+	if (ns < bucket->min_ts)
+		bucket->min_ts = ns;
+
+	i = fls(ns + 1);
+	if (i >= NB_BUCKETS)
+		i = NB_BUCKETS - 1;
+
+	bucket->b[i]++;
+}
+
+#define RX_ETH_EQ_UNACKED_MAX 16U
+
+/* NAPI poll function.
+ * Only the receive event will be counted towards the budget.
+ */
+static int cxi_rx_eth_poll(struct napi_struct *napi, int budget)
+{
+	struct rx_queue *rx = container_of(napi, struct rx_queue, napi);
+	struct cxi_eth *dev = rx->dev;
+	const union c_event *event;
+	int work_done = 0;
+	int event_count = 0;
+	bool reschedule = false;
+	bool packet_processed = false;
+	int rc;
+
+	if (rx->time_napi_schedule) {
+		ktime_t enter_ts;
+		u64 time_exec;
+
+		enter_ts = ktime_get_raw();
+		time_exec = ktime_to_ns(ktime_sub(enter_ts,
+						  rx->time_napi_schedule));
+		add_ktime_to_bucket(&rx->eth_napi_schedule, time_exec);
+
+		/* Prevent adding time when the function is re-entered */
+		rx->time_napi_schedule = 0;
+	}
+
+	while (work_done < budget &&
+	       (event = cxi_eq_get_event(rx->eq))) {
+		switch (event->hdr.event_type) {
+		case C_EVENT_LINK:
+			packet_processed = false;
+			netdev_warn(dev->ndev, "LE append failure: %d\n",
+				    event->tgt_long.return_code);
+			break;
+		case C_EVENT_ETHERNET:
+			packet_processed = eth_receive(rx, &event->enet);
+			if (packet_processed)
+				work_done++;
+			break;
+		case C_EVENT_STATE_CHANGE:
+			packet_processed = false;
+			netdev_warn(dev->ndev, "State change (%d, %d, %d)\n",
+				    event->tgt_long.ptlte_index,
+			       event->tgt_long.initiator.state_change.ptlte_state,
+			       event->tgt_long.return_code);
+			break;
+		default:
+			packet_processed = false;
+			netdev_warn(dev->ndev, "Unhandled event %d, rc %d\n",
+				    event->hdr.event_type,
+				    event->hdr.return_code);
+			print_hex_dump(KERN_INFO,
+				       "cxi eth unexpected target event: ",
+				       DUMP_PREFIX_ADDRESS, 16, 1, event,
+				       (8 << event->hdr.event_size), false);
+		}
+
+		event_count++;
+		if ((event_count >= RX_ETH_EQ_UNACKED_MAX) &&
+		    packet_processed) {
+			cxi_eq_int_disable(rx->eq);
+			rc = post_rx_buffers(rx, GFP_ATOMIC);
+			if (rc < 0)
+				reschedule = true;
+
+			event_count = 0;
+		}
+	}
+
+	BUG_ON(work_done > budget);
+
+	/* ACK all EQ space before appending new buffers. */
+	if (event_count)
+		cxi_eq_int_disable(rx->eq);
+
+	if (!list_empty(&rx->rx_ready)) {
+		rc = post_rx_buffers(rx, GFP_ATOMIC);
+		if (rc < 0)
+			reschedule = true;
+	}
+
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
+		/* Only re-enable interrupts if NAPI is not going to be
+		 * rescheduled.
+		 */
+		if (reschedule) {
+			netdev_warn_once(dev->ndev,
+					 "Forcing NAPI reschedule\n");
+			napi_schedule(&rx->napi);
+		} else {
+			cxi_eq_int_enable(rx->eq);
+		}
+	}
+
+	return work_done;
+}
+
+/* Hardware defined RSS hash bit is one less than the corresponding
+ * c_rss_hash_type enum value. This macro should only be used if the
+ * c_rss_hash_type enum value is not C_RSS_HASH_NONE.
+ */
+#define RSS_HASH_BIT(hash_type) ((hash_type) - 1)
+
+int cxi_eth_open(struct net_device *ndev)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct hwtstamp_config ts_cfg = {
+		.flags = 0,
+		.tx_type = HWTSTAMP_TX_OFF,
+		.rx_filter = HWTSTAMP_FILTER_NONE,
+	};
+
+	cxi_set_eth_name(dev->cxi_dev, netdev_name(ndev));
+
+	/* The indirection base is always 0 for now, as there is only
+	 * one Ethernet device supported. The driver will need an
+	 * allocation scheme when VFs support Ethernet.
+	 */
+	dev->res.portal_index_indir_base = 0;
+
+	/* Enable some default hash type.
+	 * TODO: remove when ethtool supports them.
+	 */
+	dev->res.hash_types_enabled =
+		BIT(RSS_HASH_BIT(C_RSS_HASH_IPV4_TCP)) |
+		BIT(RSS_HASH_BIT(C_RSS_HASH_IPV4_UDP)) |
+		BIT(RSS_HASH_BIT(C_RSS_HASH_IPV4_PROTOCOL_UDP_ROCE)) |
+		BIT(RSS_HASH_BIT(C_RSS_HASH_IPV6_TCP)) |
+		BIT(RSS_HASH_BIT(C_RSS_HASH_IPV6_UDP)) |
+		BIT(RSS_HASH_BIT(C_RSS_HASH_IPV6_PROTOCOL_UDP_ROCE));
+
+	cxi_eth_cfg_timestamp(dev->cxi_dev, &ts_cfg);
+
+	return hw_setup(dev);
+}
+
+int cxi_eth_close(struct net_device *ndev)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	hw_cleanup(dev);
+
+	return 0;
+}
+
+/* Get a flow hash for the commands */
+static u8 get_flow_hash(struct sk_buff *skb)
+{
+	u32 hash = skb_get_hash(skb);
+
+	/* XOR the 4 bytes into one */
+	hash ^= hash >> 16;
+	hash ^= hash >> 8;
+
+	return hash & 0xff;
+}
+
+static void cxi_eth_get_skb_checksum_settings(struct sk_buff *skb,
+					      struct cxi_eth *dev,
+					      enum c_checksum_ctrl *ctrl,
+					      unsigned int *start,
+					      unsigned int *offset)
+{
+	__be16 proto;
+
+	if (skb->ip_summed != CHECKSUM_PARTIAL)
+		goto no_crc;
+
+	*start = skb_checksum_start_offset(skb) / 2;
+	*offset = skb->csum_offset / 2;
+
+	if (eth_type_vlan(skb->protocol))
+		proto = vlan_get_protocol(skb);
+	else
+		proto = skb->protocol;
+
+	if (proto == htons(ETH_P_IP)) {
+		struct iphdr *iph = ip_hdr(skb);
+
+		if (iph->protocol == IPPROTO_UDP) {
+			if ((dev->priv_flags & CXI_ETH_PF_ROCE_OPT) &&
+			    ntohs(udp_hdr(skb)->dest) == ROCE_V2_UDP_DPORT)
+				*ctrl = C_CHECKSUM_CTRL_ROCE;
+			else
+				*ctrl = C_CHECKSUM_CTRL_UDP;
+		} else if (iph->protocol == IPPROTO_TCP) {
+			*ctrl = C_CHECKSUM_CTRL_TCP;
+		}
+	} else if (proto == htons(ETH_P_IPV6)) {
+		struct ipv6hdr *iph = ipv6_hdr(skb);
+
+		if (iph->nexthdr == IPPROTO_UDP) {
+			if ((dev->priv_flags & CXI_ETH_PF_ROCE_OPT) &&
+			    ntohs(udp_hdr(skb)->dest) == ROCE_V2_UDP_DPORT)
+				*ctrl = C_CHECKSUM_CTRL_ROCE;
+			else
+				*ctrl = C_CHECKSUM_CTRL_UDP;
+		} else if (iph->nexthdr == IPPROTO_TCP) {
+			*ctrl = C_CHECKSUM_CTRL_TCP;
+		}
+	} else {
+		netdev_warn_once(dev->ndev,
+				 "Checksum type not supported. Protocol=%u\n",
+				 skb->protocol);
+		goto no_crc;
+	}
+
+	return;
+
+no_crc:
+	*ctrl = C_CHECKSUM_CTRL_NONE;
+	*start = 0;
+	*offset = 0;
+}
+
+/* Emit a packet using an IDC command */
+static netdev_tx_t emit_idc(struct sk_buff *skb, struct tx_queue *txq,
+			    struct cxi_cq *cq)
+{
+	struct c_idc_eth_cmd idc_eth = {
+		.fmt = C_PKT_FORMAT_STD,
+	};
+	struct cxi_eth *dev = txq->dev;
+	struct net_device *ndev = dev->ndev;
+	enum c_checksum_ctrl checksum_ctrl;
+	unsigned int checksum_start;
+	unsigned int checksum_offset;
+	int rc;
+
+	cxi_eth_get_skb_checksum_settings(skb, dev, &checksum_ctrl,
+					  &checksum_start, &checksum_offset);
+
+	idc_eth.checksum_ctrl = checksum_ctrl;
+	idc_eth.checksum_start = checksum_start;
+	idc_eth.checksum_offset = checksum_offset;
+	idc_eth.flow_hash = get_flow_hash(skb);
+
+	skb_tx_timestamp(skb);
+
+	rc = cxi_cq_emit_idc_eth(cq, &idc_eth, skb->data, skb->len);
+	if (rc) {
+		/* Hard error which should never happen. */
+		netdev_err(dev->ndev, "TX queue %u full when queue awake\n",
+			   txq->id);
+		txq->stats.tx_busy++;
+
+		return NETDEV_TX_BUSY;
+	}
+
+	txq->stats.idc++;
+	txq->stats.idc_bytes += skb->len;
+
+	ndev->stats.tx_packets++;
+	ndev->stats.tx_bytes += skb->len;
+
+	dev_kfree_skb(skb);
+
+	return NETDEV_TX_OK;
+}
+
+/* Emit a packet using a DMA command */
+static netdev_tx_t emit_dma(struct sk_buff *skb, struct tx_queue *txq,
+			    struct cxi_cq *cq, unsigned int *bytes)
+{
+	struct cxi_eth *dev = txq->dev;
+	struct device *dma_dev = &dev->cxi_dev->pdev->dev;
+	struct net_device *ndev = dev->ndev;
+	struct c_dma_eth_cmd dma_eth = {
+		.read_lac = txq->dev->phys_lac,
+		.fmt = C_PKT_FORMAT_STD,
+		.checksum_ctrl = C_CHECKSUM_CTRL_NONE,
+		.eq = txq->eq->eqn,
+		.user_ptr = (uintptr_t)skb,
+		.total_len = skb->len,
+	};
+	enum c_checksum_ctrl checksum_ctrl;
+	unsigned int checksum_start;
+	unsigned int checksum_offset;
+	int rc;
+
+	if (skb_shinfo(skb)->nr_frags >= C_MAX_ETH_FRAGS) {
+		if (skb_linearize(skb) ||
+		    skb_shinfo(skb)->nr_frags >= C_MAX_ETH_FRAGS) {
+			netdev_warn(ndev, "skb could not be linearized\n");
+			cancel_tx_tstamp(dev, skb);
+			dev_kfree_skb(skb);
+			ndev->stats.tx_dropped++;
+			return NETDEV_TX_OK;
+		}
+	}
+
+	if (prepare_frags(dma_dev, skb, &dma_eth)) {
+		netdev_warn(ndev, "skb could not be mapped for DMA\n");
+		cancel_tx_tstamp(dev, skb);
+		dev_kfree_skb(skb);
+		ndev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
+	cxi_eth_get_skb_checksum_settings(skb, dev, &checksum_ctrl,
+					  &checksum_start, &checksum_offset);
+
+	dma_eth.checksum_ctrl = checksum_ctrl;
+	dma_eth.checksum_start = checksum_start;
+	dma_eth.checksum_offset = checksum_offset;
+	dma_eth.flow_hash = get_flow_hash(skb);
+
+	skb_tx_timestamp(skb);
+
+	rc = cxi_cq_emit_dma_eth(cq, &dma_eth);
+	if (rc) {
+		/* Hard error which should never happen. */
+		netdev_err(dev->ndev, "TX queue %u full when queue awake\n",
+			   txq->id);
+		txq->stats.tx_busy++;
+
+		unmap_frags(dma_dev, skb);
+		cancel_tx_tstamp(dev, skb);
+
+		return NETDEV_TX_BUSY;
+	}
+
+	atomic_dec(&txq->dma_eq_cdt);
+	txq->stats.dma++;
+	txq->stats.dma_bytes += skb->len;
+
+	*bytes += skb->len;
+	return NETDEV_TX_OK;
+}
+
+/* Check whether an outgoing packet can be timestamped, and reserve
+ * the unique slot if it can.
+ */
+static bool tstamp_xmit(struct cxi_eth *dev, struct sk_buff *skb)
+{
+	struct ethhdr *ethhdr;
+
+	if (likely(!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)))
+		return false;
+
+	/* Only Ethernet PTP packets are supported. That's what was
+	 * programmed in cxi_eth_cfg_timestamp().
+	 */
+	ethhdr = (struct ethhdr *)skb->data;
+	if (ethhdr->h_proto != htons(PTP_L2_ETHERTYPE))
+		return false;
+
+	if (cmpxchg(&dev->tstamp_skb, NULL, skb))
+		return false;
+
+	skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
+
+	return true;
+}
+
+static void ring_txq(struct tx_queue *txq)
+{
+	cxi_cq_ring(txq->eth1_cq);
+	if (txq->eth2_cq)
+		cxi_cq_ring(txq->eth2_cq);
+	cxi_cq_ring(txq->shared_cq);
+}
+
+netdev_tx_t cxi_eth_start_xmit(struct sk_buff *skb, struct net_device *ndev)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	unsigned int qid = skb_get_queue_mapping(skb);
+	struct tx_queue *txq = &dev->txqs[qid];
+	struct netdev_queue *dev_queue =
+		netdev_get_tx_queue(dev->ndev, txq->id);
+	unsigned int bytes = 0;
+	netdev_tx_t tx_status;
+	bool kick_cq;
+	bool more = netdev_xmit_more();
+	struct cxi_cq *cq;
+
+	if (eth_type_vlan(skb->protocol)) {
+		/* Tagged traffic. Check PCPs to steer appropriately */
+		struct vlan_ethhdr *veth;
+		unsigned int pcp;
+
+		veth = (struct vlan_ethhdr *)vlan_eth_hdr(skb);
+		pcp = (be16_to_cpu(veth->h_vlan_TCI) & VLAN_PRIO_MASK) >> VLAN_PRIO_SHIFT;
+
+		if (pcp == dev->cxi_dev->untagged_eth_pcp)
+			cq = txq->untagged_cq;
+		else if (pcp == dev->eth1_pcp)
+			cq = txq->eth1_cq;
+		else if (dev->eth2_active && pcp == dev->eth2_pcp)
+			cq = txq->eth2_cq;
+		else
+			cq = txq->shared_cq;
+	} else {
+		/* Untagged traffic. */
+		cq = txq->untagged_cq;
+	}
+
+	if (tstamp_xmit(dev, skb) || skb_shinfo(skb)->nr_frags ||
+	    skb->len > idc_dma_threshold) {
+		tx_status = emit_dma(skb, txq, cq, &bytes);
+		txq->force_dma = txq->force_dma_interval;
+	} else if (--txq->force_dma == 0) {
+		/* Too many consecutive IDC. Use DMA instead */
+		tx_status = emit_dma(skb, txq, cq, &bytes);
+		txq->force_dma = txq->force_dma_interval;
+		txq->stats.dma_forced++;
+	} else {
+		tx_status = emit_idc(skb, txq, cq);
+	}
+
+	/* Kick CQ if netdev TX queue is ready. */
+	kick_cq = __netdev_tx_sent_queue(dev_queue, bytes, more);
+	if (kick_cq)
+		ring_txq(txq);
+
+	/* Stop TX queue if not enough free slots to emit another SKB
+	 * or NETDEV_TX_BUSY is set. 8 slots, aligned on an 8-slot
+	 * boundary, are required to emit the largest IDC or DMA
+	 * commands. TX queue will be re-enabled as space frees up. If
+	 * the TX queue is to be stopped, the TX queue is always
+	 * kicked in an attempt to free up space.
+	 */
+	if (__cxi_cq_free_slots(cq) < 16 || tx_status == NETDEV_TX_BUSY) {
+		if (!kick_cq)
+			ring_txq(txq);
+		netif_tx_stop_queue(dev_queue);
+		txq->stats.stopped++;
+	} else if (atomic_read(&txq->dma_eq_cdt) <= 0) {
+		/* The EQ is getting full */
+		if (!kick_cq)
+			ring_txq(txq);
+		netif_tx_stop_queue(dev_queue);
+		txq->stats.stopped_eq++;
+	}
+
+	return tx_status;
+}
+
+int cxi_eth_mac_addr(struct net_device *ndev, void *p)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	int rc;
+
+	rc = eth_mac_addr(ndev, p);
+	if (rc)
+		return rc;
+
+	dev->mac_addr = ether_addr_to_u64(ndev->dev_addr);
+	ether_addr_copy(dev->cxi_dev->mac_addr, ndev->dev_addr);
+
+	cxi_eth_set_rx_mode(ndev);
+
+	/* We expect the NID to be configured before the MAC address is set.
+	 * To be backwards compatible, we will attempt to set the NID from the MAC address.
+	 * If the NID was not set, it will be derived from the MAC. Otherwise this will be ignored
+	 */
+	cxi_set_nid_from_mac(dev->cxi_dev, ndev->dev_addr);
+
+	return 0;
+}
+
+/* Program MAC filters.
+ *
+ * Since the ethernet driver is the only thing using the MAC filter
+ * (set_list), we can reset the whole list when entering this
+ * function, and reprogram everything.
+ */
+void cxi_eth_set_rx_mode(struct net_device *ndev)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct netdev_hw_addr *ha;
+	int rc;
+
+	/* Invalidate all existing filters. */
+	cxi_eth_set_list_invalidate_all(dev->cxi_dev, &dev->res);
+
+	/* Cassini ERRATA-3258. Workaround timestamp bug. Program the PTP MAC
+	 * address first so all the PTP packets will land on the PTP
+	 * RX queue, even if promiscuous mode is enabled.
+	 */
+	cxi_eth_add_mac(dev->cxi_dev, &dev->res, dev->ptp_mac_addr, true);
+
+	if (ndev->flags & IFF_PROMISC) {
+		/* Listen on everything. */
+		cxi_eth_set_promiscuous(dev->cxi_dev, &dev->res);
+		cxi_eth_set_indir_table(dev->cxi_dev, &dev->res);
+		return;
+	}
+
+	rc = cxi_eth_add_mac(dev->cxi_dev, &dev->res, dev->mac_addr, false);
+	if (rc) {
+		netdev_err(ndev, "Cannot program MAC address\n");
+		return;
+	}
+
+	if (ndev->flags & IFF_BROADCAST) {
+		rc = cxi_eth_add_mac(dev->cxi_dev, &dev->res,
+				     0xffffffffffffULL, false);
+		if (rc) {
+			netdev_err(ndev, "Cannot program broadcast address\n");
+			return;
+		}
+	}
+
+	netdev_for_each_uc_addr(ha, ndev) {
+		netdev_dbg(ndev, "Adding UC addr %pM\n", ha->addr);
+
+		rc = cxi_eth_add_mac(dev->cxi_dev, &dev->res,
+				     ether_addr_to_u64(ha->addr), false);
+		if (rc) {
+			netdev_err(ndev, "Cannot program unicast address\n");
+			return;
+		}
+	}
+
+	if (ndev->flags & IFF_ALLMULTI) {
+		/* Accept all multicasts. */
+		rc = cxi_eth_set_all_multi(dev->cxi_dev, &dev->res);
+		if (rc) {
+			netdev_err(ndev,
+				   "Cannot program all multicast addresses\n");
+			return;
+		}
+	} else if (ndev->flags & IFF_MULTICAST) {
+		netdev_for_each_mc_addr(ha, ndev) {
+			netdev_dbg(ndev, "Adding MC addr %pM\n", ha->addr);
+
+			rc = cxi_eth_add_mac(dev->cxi_dev, &dev->res,
+					     ether_addr_to_u64(ha->addr),
+					     false);
+			if (rc) {
+				netdev_err(ndev,
+					   "Cannot program multicast address\n");
+				return;
+			}
+		}
+	}
+
+	cxi_eth_set_indir_table(dev->cxi_dev, &dev->res);
+}
+
+int cxi_change_mtu(struct net_device *ndev, int new_mtu)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	bool was_running;
+	int rc;
+
+	was_running = netif_running(ndev);
+	if (was_running)
+		hw_cleanup(dev);
+
+	rc = cxi_set_max_eth_rxsize(dev->cxi_dev, new_mtu + VLAN_ETH_HLEN);
+	if (rc)
+		netdev_err(ndev, "Invalid MTU size: %u\n", new_mtu);
+	else
+		ndev->mtu = new_mtu;
+
+	if (was_running) {
+		int rc2;
+
+		rc2 = hw_setup(dev);
+		if (rc2) {
+			netdev_err(ndev,
+				   "Failed to setup resources after an MTU change\n");
+			rc = rc2;
+		}
+	}
+
+	return rc;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_ethtool.c b/drivers/net/ethernet/hpe/ss1/cxi_ethtool.c
new file mode 100644
index 000000000000..67d8a0d23b90
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_ethtool.c
@@ -0,0 +1,916 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cassini ethernet driver
+ * Copyright 2018,2022,2024,2026 Hewlett Packard Enterprise Development LP
+ */
+
+#include <linux/netdevice.h>
+#include <linux/etherdevice.h>
+#include <linux/ethtool.h>
+#include <linux/firmware.h>
+#include <uapi/linux/net_tstamp.h>
+
+#include "cxi_eth.h"
+#include "cxi_link.h"
+/*
+ * definitions for CXI_GLOBAL_STATS_LEN, cxi_get_ethtool_stats_set,
+ * and cxi_get_ethtool_stats_name.
+ */
+#include "cxi_ethtool_names.h"
+
+/* Ethtool priv_flags */
+static const char priv_flags_str[PRIV_FLAGS_COUNT][ETH_GSTRING_LEN] = {
+	"internal-loopback",
+	"external-loopback",
+	"llr",
+	"precoding",
+	"ifg-hpc",
+	"roce-opt",
+	"ignore-align",
+	"pml-recovery",
+	"link-train",
+	"remote-fault-recovery",
+	"use-unsupported-cable",
+	"fec_monitor",
+	"auto-lane-degrade",
+	"ignore-media-error",
+	"use-supported-ss200-cable",
+	"los-lol-hide",
+	"r1-link-partner"
+};
+
+/* ethtool ops */
+static void cxi_get_drvinfo(struct net_device *ndev,
+			    struct ethtool_drvinfo *info)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	strscpy(info->driver, "cxi_eth", sizeof(info->driver));
+	strscpy(info->version, "0.2", sizeof(info->version));
+	strscpy(info->bus_info, dev_name(ndev->dev.parent),
+		sizeof(info->bus_info));
+	strscpy(info->fw_version, dev->eth_info.fw_version,
+		sizeof(info->fw_version));
+	strscpy(info->erom_version, dev->eth_info.erom_version,
+		sizeof(info->erom_version));
+
+	info->n_priv_flags = PRIV_FLAGS_COUNT;
+}
+
+static int cxi_get_sset_count(struct net_device *ndev, int sset)
+{
+	switch (sset) {
+	case ETH_SS_PRIV_FLAGS:
+		return PRIV_FLAGS_COUNT;
+	case ETH_SS_STATS:
+		return CXI_GLOBAL_STATS_LEN;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void cxi_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
+{
+	char *p = data;
+	struct cxi_eth *dev = netdev_priv(ndev);
+	char *dst;
+
+	switch (stringset) {
+	case ETH_SS_PRIV_FLAGS:
+		memcpy(p, priv_flags_str, PRIV_FLAGS_COUNT * ETH_GSTRING_LEN);
+		if (cassini_version(&dev->cxi_dev->prop, CASSINI_1)) {
+			dst = p + 7 * ETH_GSTRING_LEN;
+			memset(dst, 0, ETH_GSTRING_LEN);
+			strscpy(dst, "disable-pml-recovery", ETH_GSTRING_LEN);
+		}
+		break;
+	case ETH_SS_STATS:
+		memcpy(p, cxi_get_ethtool_stats_name, CXI_GLOBAL_STATS_LEN *
+		       ETH_GSTRING_LEN);
+		break;
+
+	}
+}
+
+/* Return the number of RSS queues. */
+static void cxi_get_channels(struct net_device *ndev,
+			     struct ethtool_channels *channels)
+{
+	channels->max_rx = max_rss_queues;
+	channels->max_tx = max_tx_queues;
+	channels->max_combined = 0;
+	channels->max_other = 0;
+	channels->rx_count = ndev->real_num_rx_queues;
+	channels->tx_count = ndev->real_num_tx_queues;
+	channels->other_count = 0;
+	channels->combined_count = 0;
+}
+
+static int cxi_grow_tx_channels(struct cxi_eth *dev,
+				unsigned int num_tx_channels)
+{
+	int i;
+	int rc;
+
+	for (i = dev->cur_txqs; i < num_tx_channels; i++) {
+		rc = alloc_tx_queue(dev, i);
+		if (rc)
+			goto err_free_txqs;
+	}
+
+	for (i = dev->cur_txqs; i < num_tx_channels; i++)
+		enable_tx_queue(&dev->txqs[i]);
+
+	rc = netif_set_real_num_tx_queues(dev->ndev, num_tx_channels);
+	if (rc)
+		goto err_disable_txqs;
+
+	return 0;
+
+err_disable_txqs:
+	for (i = dev->cur_txqs; i < num_tx_channels; i++)
+		disable_tx_queue(&dev->txqs[i]);
+err_free_txqs:
+	while (i > dev->cur_txqs)
+		free_tx_queue(&dev->txqs[--i]);
+
+	return rc;
+}
+
+static int cxi_shrink_tx_channels(struct cxi_eth *dev,
+				  unsigned int num_tx_channels)
+{
+	int i;
+	int rc;
+
+	rc = netif_set_real_num_tx_queues(dev->ndev, num_tx_channels);
+	if (rc)
+		return rc;
+
+	for (i = dev->cur_txqs - 1; i >= num_tx_channels; i--)
+		disable_tx_queue(&dev->txqs[i]);
+
+	for (i = dev->cur_txqs - 1; i >= num_tx_channels; i--)
+		free_tx_queue(&dev->txqs[i]);
+
+	return 0;
+}
+
+int cxi_set_tx_channels(struct cxi_eth *dev, unsigned int num_tx_channels)
+{
+	int rc;
+
+	if (dev->cur_txqs == num_tx_channels)
+		return 0;
+	else if (num_tx_channels < dev->cur_txqs)
+		rc = cxi_shrink_tx_channels(dev, num_tx_channels);
+	else
+		rc = cxi_grow_tx_channels(dev, num_tx_channels);
+
+	if (!rc)
+		dev->cur_txqs = num_tx_channels;
+
+	return rc;
+}
+
+static int cxi_grow_rx_channels(struct cxi_eth *dev,
+				unsigned int num_rx_channels)
+{
+	int rc;
+	int i;
+
+	for (i = dev->res.rss_queues; i < num_rx_channels; i++) {
+		rc = alloc_rx_queue(dev, i);
+		if (rc)
+			goto err_free_rxqs;
+
+		rc = post_rx_buffers(&dev->rxqs[i], GFP_KERNEL);
+		if (rc < 0) {
+			netdev_info(dev->ndev, "Cannot post RX buffers: %d\n",
+				    rc);
+			/* Increment i to free this RXQ. */
+			i++;
+			goto err_free_rxqs;
+		}
+	}
+
+	for (i = dev->res.rss_queues; i < num_rx_channels; i++)
+		enable_rx_queue(&dev->rxqs[i]);
+
+	return 0;
+
+err_free_rxqs:
+	for (i--; i >= dev->res.rss_queues; i--)
+		free_rx_queue(&dev->rxqs[i]);
+
+	return rc;
+}
+
+static void cxi_shrink_rx_channels(struct cxi_eth *dev,
+				   unsigned int num_rx_channels)
+{
+	int i;
+
+	for (i = dev->res.rss_queues - 1; i >= num_rx_channels; i--)
+		disable_rx_queue(&dev->rxqs[i]);
+
+	for (i = dev->res.rss_queues - 1; i >= num_rx_channels; i--)
+		free_rx_queue(&dev->rxqs[i]);
+}
+
+static bool valid_rx_channel_count(unsigned int num_rx_channels)
+{
+	if (!is_power_of_2(num_rx_channels) || num_rx_channels < 1 ||
+	    num_rx_channels > max_rss_queues)
+		return false;
+	return true;
+}
+
+int cxi_set_rx_channels(struct cxi_eth *dev, unsigned int num_rx_channels)
+{
+	unsigned int old_rx_channels = dev->ndev->real_num_rx_queues;
+	int rc;
+	int i;
+
+	if (!valid_rx_channel_count(num_rx_channels))
+		return -EINVAL;
+
+	if (num_rx_channels == dev->res.rss_queues)
+		return 0;
+
+	/* Disable RSS support for all configure MAC addresses/set lists. This
+	 * will temporarily force all traffic to the RXQ 0 which is the
+	 * default/catch-all RX queue.
+	 */
+	cxi_eth_clear_indir_table(dev->cxi_dev, &dev->res);
+
+	rc = netif_set_real_num_rx_queues(dev->ndev, num_rx_channels);
+	if (rc) {
+		cxi_eth_set_indir_table(dev->cxi_dev, &dev->res);
+		goto out;
+	}
+
+	if (num_rx_channels > dev->res.rss_queues) {
+		rc = cxi_grow_rx_channels(dev, num_rx_channels);
+		if (rc) {
+			netif_set_real_num_rx_queues(dev->ndev, old_rx_channels);
+			/* Number of channels have not changed. Re-enable RSS
+			 * and exit.
+			 */
+			cxi_eth_set_indir_table(dev->cxi_dev, &dev->res);
+			goto out;
+		}
+	} else {
+		cxi_shrink_rx_channels(dev, num_rx_channels);
+	}
+
+	dev->res.rss_queues = num_rx_channels;
+	dev->res.rss_indir_size = num_rx_channels > 1 ? rss_indir_size : 0;
+
+	for (i = 0; i < dev->res.rss_queues; i++)
+		dev->res.ptn_rss[i] = dev->rxqs[i].pt->id;
+
+	for (i = 0; i < dev->res.rss_indir_size; i++)
+		dev->res.indir_table[i] =
+			ethtool_rxfh_indir_default(i, dev->res.rss_queues);
+
+	/* Re-enable RSS if number of RX queues is successfully changed. */
+	cxi_eth_set_indir_table(dev->cxi_dev, &dev->res);
+
+out:
+	return rc;
+}
+
+static int cxi_set_channels(struct net_device *ndev,
+			    struct ethtool_channels *ch)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	unsigned int old_tx_channels = dev->cur_txqs;
+	int rc;
+
+	if (ch->combined_count || ch->other_count)
+		return -EINVAL;
+	if (!valid_rx_channel_count(ch->rx_count) || !ch->tx_count ||
+	    ch->tx_count > ndev->num_tx_queues)
+		return -EINVAL;
+
+	/* If interface is not running, update the real TX/RX queue count. The
+	 * real TX/RX queue count is used to initialize TX/RX channels during
+	 * hardware setup.
+	 */
+	if (!netif_running(dev->ndev)) {
+		return netif_set_real_num_queues(ndev, ch->tx_count, ch->rx_count);
+	}
+
+	if (ch->tx_count > old_tx_channels) {
+		rc = cxi_set_tx_channels(dev, ch->tx_count);
+		if (rc)
+			return rc;
+	}
+
+	rc = cxi_set_rx_channels(dev, ch->rx_count);
+	if (rc) {
+		if (ch->tx_count > old_tx_channels)
+			WARN_ON_ONCE(cxi_set_tx_channels(dev, old_tx_channels));
+		return rc;
+	}
+
+	if (ch->tx_count < old_tx_channels)
+		return cxi_set_tx_channels(dev, ch->tx_count);
+	return 0;
+}
+
+static int cxi_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *cmd,
+			 u32 *rule_locs)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	int rc;
+
+	switch (cmd->cmd) {
+	case ETHTOOL_GRXRINGS:
+		/* The catch-all queue is always present */
+		cmd->data = dev->res.rss_queues ? : 1;
+		rc = 0;
+		break;
+
+	default:
+		rc = -EOPNOTSUPP;
+		break;
+	}
+
+	return rc;
+}
+
+static u32 cxi_get_rxfh_indir_size(struct net_device *ndev)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	return dev->res.rss_indir_size;
+}
+
+static u32 cxi_get_rxfh_key_size(struct net_device *ndev)
+{
+	return CXI_ETH_HASH_KEY_SIZE;
+}
+
+static int cxi_get_rxfh(struct net_device *ndev,
+			struct ethtool_rxfh_param *rxfh)
+{
+	u8 *key = rxfh->key;
+	u8 *hfunc = &rxfh->hfunc;
+	u32 *indir = rxfh->indir;
+
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	if (hfunc)
+		*hfunc = ETH_RSS_HASH_TOP;
+
+	if (key)
+		cxi_eth_get_hash_key(dev->cxi_dev, key);
+
+	if (indir && dev->res.rss_queues)
+		memcpy(indir, dev->res.indir_table,
+		       dev->res.rss_indir_size * sizeof(u32));
+
+	return 0;
+}
+
+static int cxi_set_rxfh(struct net_device *ndev,
+			struct ethtool_rxfh_param *rxfh,
+			struct netlink_ext_ack *extack)
+{
+	u8 *key = rxfh->key;
+	u8 hfunc = rxfh->hfunc;
+	u32 *indir = rxfh->indir;
+
+	struct cxi_eth *dev = netdev_priv(ndev);
+	int i;
+
+	if (hfunc != ETH_RSS_HASH_NO_CHANGE && hfunc != ETH_RSS_HASH_TOP)
+		return -EINVAL;
+
+	if (key != NULL)
+		return -EINVAL;
+
+	if (indir) {
+		/* Sanity check the table */
+		for (i = 0; i < dev->res.rss_indir_size; i++) {
+			if (indir[i] >= dev->res.rss_queues) {
+				netdev_warn_once(ndev, "Bad new indirection - %d %d\n",
+						 indir[i],
+						 dev->res.rss_queues);
+				return -EINVAL;
+			}
+		}
+
+		memcpy(dev->res.indir_table, indir,
+		       dev->res.rss_indir_size * sizeof(u32));
+		cxi_eth_set_indir_table(dev->cxi_dev, &dev->res);
+	}
+
+	return 0;
+}
+
+static int cxi_get_module_info(struct net_device *ndev,
+			       struct ethtool_modinfo *modinfo)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	cxi_eth_devinfo(dev->cxi_dev, &dev->eth_info);
+
+	if (dev->eth_info.qsfp_eeprom_len == 0)
+		return -ENOMEDIUM;
+
+	switch (dev->eth_info.qsfp_eeprom[0]) {
+	case 0xc: /* QSFP */
+	case 0xd: /* QSFP+ */
+		modinfo->type = ETH_MODULE_SFF_8436;
+		modinfo->eeprom_len = ETH_MODULE_SFF_8436_LEN;
+		break;
+	case 0x11: /* QSFP-28 */
+	case 0x1E:
+		modinfo->type = ETH_MODULE_SFF_8636;
+		modinfo->eeprom_len = ETH_MODULE_SFF_8636_LEN;
+		break;
+	default:
+		netdev_err(dev->ndev, "Unsupported transceiver type 0x%x\n",
+			   dev->eth_info.qsfp_eeprom[0]);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int cxi_get_module_eeprom(struct net_device *ndev,
+				 struct ethtool_eeprom *eeprom, u8 *data)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	int ret;
+
+	ret = cxi_get_qsfp_data(dev->cxi_dev, eeprom->offset, eeprom->len,
+				0, data);
+
+	if (ret > 0)
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static int cxi_get_module_eeprom_by_page(struct net_device *ndev,
+					 const struct ethtool_module_eeprom *req,
+					 struct netlink_ext_ack *extack)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	return cxi_get_qsfp_data(dev->cxi_dev, req->offset, req->length,
+				 req->page, req->data);
+}
+
+static int cxi_flash_device(struct net_device *ndev,
+			    struct ethtool_flash *flash)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	const struct firmware *fw;
+	int rc;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	rc = request_firmware(&fw, flash->data, &ndev->dev);
+	if (rc != 0)
+		return rc;
+
+	// TODO? stop adapter
+	rc = cxi_program_firmware(dev->cxi_dev, fw);
+	release_firmware(fw);
+	// TODO? restart adapter
+
+	if (!rc)
+		cxi_eth_devinfo(dev->cxi_dev, &dev->eth_info);
+
+	return rc;
+}
+
+/* Link settings. */
+static int cxi_get_link_ksettings(struct net_device *ndev,
+				  struct ethtool_link_ksettings *s)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct cxi_link_info link_info;
+
+	memset(s, 0, sizeof(struct ethtool_link_ksettings));
+
+	cxi_link_mode_get(dev->cxi_dev, &link_info);
+
+	s->base.speed = link_info.speed;
+	s->base.port = link_info.port_type;
+	s->base.duplex = DUPLEX_FULL;
+	s->base.phy_address = 0; /* N/A */
+	s->base.autoneg = link_info.autoneg;
+	s->base.eth_tp_mdix = ETH_TP_MDI;
+	s->base.eth_tp_mdix_ctrl = ETH_TP_MDI;
+
+	ethtool_link_ksettings_add_link_mode(s, supported, Autoneg);
+	ethtool_link_ksettings_add_link_mode(s, supported, FIBRE);
+	ethtool_link_ksettings_add_link_mode(s, supported, TP);
+	ethtool_link_ksettings_add_link_mode(s, supported, Backplane);
+	ethtool_link_ksettings_add_link_mode(s, supported, Pause);
+	if (cassini_version(&dev->cxi_dev->prop, CASSINI_1)) {
+		ethtool_link_ksettings_add_link_mode(s, supported, 50000baseKR_Full);
+		ethtool_link_ksettings_add_link_mode(s, supported, 100000baseCR2_Full);
+		ethtool_link_ksettings_add_link_mode(s, supported, 100000baseCR4_Full);
+		ethtool_link_ksettings_add_link_mode(s, supported, 200000baseCR4_Full);
+		if (s->base.autoneg == AUTONEG_ENABLE)
+			ethtool_link_ksettings_add_link_mode(s, advertising, Autoneg);
+		ethtool_link_ksettings_add_link_mode(s, advertising, Pause);
+		ethtool_link_ksettings_add_link_mode(s, advertising, 50000baseKR_Full);
+		ethtool_link_ksettings_add_link_mode(s, advertising, 100000baseCR2_Full);
+		ethtool_link_ksettings_add_link_mode(s, advertising, 100000baseCR4_Full);
+		ethtool_link_ksettings_add_link_mode(s, advertising, 200000baseCR4_Full);
+	} else if (cassini_version(&dev->cxi_dev->prop, CASSINI_2)) {
+		ethtool_link_ksettings_add_link_mode(s, supported, 100000baseCR2_Full);
+		ethtool_link_ksettings_add_link_mode(s, supported, 200000baseCR4_Full);
+		ethtool_link_ksettings_add_link_mode(s, supported, 400000baseCR4_Full);
+		ethtool_link_ksettings_add_link_mode(s, supported, FEC_RS);
+		if (s->base.autoneg == AUTONEG_ENABLE) {
+			ethtool_link_ksettings_add_link_mode(s, advertising, Autoneg);
+			ethtool_link_ksettings_add_link_mode(s, advertising, 100000baseCR2_Full);
+			ethtool_link_ksettings_add_link_mode(s, advertising, 200000baseCR4_Full);
+			ethtool_link_ksettings_add_link_mode(s, advertising, 400000baseCR4_Full);
+			ethtool_link_ksettings_add_link_mode(s, advertising, FEC_RS);
+		}
+	}
+
+	return 0;
+}
+
+static int
+cxi_set_link_ksettings(struct net_device *ndev,
+		       const struct ethtool_link_ksettings *s)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct cxi_link_info link_info;
+
+	cxi_link_mode_get(dev->cxi_dev, &link_info);
+
+	if (s->base.duplex != DUPLEX_UNKNOWN &&
+	    s->base.duplex != DUPLEX_FULL)
+		return -ENOTSUPP;
+
+	if (s->base.eth_tp_mdix != ETH_TP_MDI ||
+	    s->base.eth_tp_mdix_ctrl != ETH_TP_MDI)
+		return -ENOTSUPP;
+
+	if (dev->is_c2 && s->base.autoneg == AUTONEG_ENABLE &&
+	    (link_info.flags & LOOPBACK_MODE) != 0) {
+		netdev_err(ndev,
+			   "autoneg must not be enabled in loopback mode\n");
+		return -EINVAL;
+	}
+
+	link_info.speed = s->base.speed;
+	link_info.autoneg = s->base.autoneg;
+
+	cxi_link_mode_set(dev->cxi_dev, &link_info);
+
+	return 0;
+}
+
+static int cxi_set_priv_flags(struct net_device *ndev, u32 flags)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct cxi_link_info link_info;
+	u32 changes;
+	u32 old_flags;
+	u32 debug_flags;
+
+	cxi_link_mode_get(dev->cxi_dev, &link_info);
+	cxi_link_flags_get(dev->cxi_dev, &debug_flags);
+
+	old_flags = dev->priv_flags | link_info.flags | debug_flags;
+
+	changes = flags ^ old_flags;
+
+	if (!changes)
+		return 0;
+
+	if (changes & LOOPBACK_MODE) {
+		u32 loopback_mode = flags & LOOPBACK_MODE;
+
+		if (loopback_mode ==
+		    (CXI_ETH_PF_INTERNAL_LOOPBACK | CXI_ETH_PF_EXTERNAL_LOOPBACK)) {
+			netdev_err(dev->ndev,
+				   "Loopback private flags are mutually exclusive\n");
+			return -EINVAL;
+		}
+	}
+
+	if (changes & flags & LINK_DEBUG_FLAGS &
+	    ~cxi_link_flags_supported(dev->cxi_dev)) {
+		netdev_err(ndev, "Link debug private flag not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	link_info.flags = flags;
+	cxi_link_mode_set(dev->cxi_dev, &link_info);
+
+	if (changes & CXI_ETH_PF_FEC_MONITOR) {
+		if (flags & CXI_ETH_PF_FEC_MONITOR)
+			dev->priv_flags |= CXI_ETH_PF_FEC_MONITOR;
+		else
+			dev->priv_flags &= ~CXI_ETH_PF_FEC_MONITOR;
+	}
+
+	if (changes & CXI_ETH_PF_ROCE_OPT) {
+		if (flags & CXI_ETH_PF_ROCE_OPT)
+			dev->priv_flags |= CXI_ETH_PF_ROCE_OPT;
+		else
+			dev->priv_flags &= ~CXI_ETH_PF_ROCE_OPT;
+
+		cxi_set_roce_rcv_seg(dev->cxi_dev, flags & CXI_ETH_PF_ROCE_OPT);
+	}
+
+	if (changes & CXI_ETH_PF_IGNORE_ALIGN) {
+		if (flags & CXI_ETH_PF_IGNORE_ALIGN)
+			cxi_link_flags_set(dev->cxi_dev,
+					   0, CXI_ETH_PF_IGNORE_ALIGN);
+		else
+			cxi_link_flags_set(dev->cxi_dev,
+					   CXI_ETH_PF_IGNORE_ALIGN, 0);
+	}
+
+	if (changes & CXI_ETH_PF_PML_REC) {
+		if (flags & CXI_ETH_PF_PML_REC) {
+			dev->priv_flags |= CXI_ETH_PF_PML_REC;
+			cxi_pml_recovery_set(dev->cxi_dev, true);
+		} else {
+			dev->priv_flags &= ~CXI_ETH_PF_PML_REC;
+			cxi_pml_recovery_set(dev->cxi_dev, false);
+		}
+	}
+
+	if (changes & CXI_ETH_PF_REMOTE_FAULT_RECOVERY) {
+		if (flags & CXI_ETH_PF_REMOTE_FAULT_RECOVERY)
+			cxi_link_flags_set(dev->cxi_dev,
+					   0, CXI_ETH_PF_REMOTE_FAULT_RECOVERY);
+		else
+			cxi_link_flags_set(dev->cxi_dev,
+					   CXI_ETH_PF_REMOTE_FAULT_RECOVERY, 0);
+	}
+
+	if (changes & CXI_ETH_PF_USE_UNSUPPORTED_CABLE) {
+		if (flags & CXI_ETH_PF_USE_UNSUPPORTED_CABLE) {
+			dev->priv_flags |= CXI_ETH_PF_USE_UNSUPPORTED_CABLE;
+			cxi_link_use_unsupported_cable(dev->cxi_dev, true);
+		} else {
+			dev->priv_flags &= ~CXI_ETH_PF_USE_UNSUPPORTED_CABLE;
+			cxi_link_use_unsupported_cable(dev->cxi_dev, false);
+		}
+	}
+
+	if (changes & CXI_ETH_PF_USE_SUPPORTED_SS200_CABLE) {
+		if (flags & CXI_ETH_PF_USE_SUPPORTED_SS200_CABLE) {
+			dev->priv_flags |= CXI_ETH_PF_USE_SUPPORTED_SS200_CABLE;
+			cxi_link_use_supported_ss200_cable(dev->cxi_dev, true);
+		} else {
+			dev->priv_flags &= ~CXI_ETH_PF_USE_SUPPORTED_SS200_CABLE;
+			cxi_link_use_supported_ss200_cable(dev->cxi_dev, false);
+		}
+	}
+
+	if (changes & CXI_ETH_PF_IGNORE_MEDIA_ERROR) {
+		if (flags & CXI_ETH_PF_IGNORE_MEDIA_ERROR) {
+			dev->priv_flags |= CXI_ETH_PF_IGNORE_MEDIA_ERROR;
+			cxi_link_ignore_media_error(dev->cxi_dev, true);
+		} else {
+			dev->priv_flags &= ~CXI_ETH_PF_IGNORE_MEDIA_ERROR;
+			cxi_link_ignore_media_error(dev->cxi_dev, false);
+		}
+	}
+
+	if (changes & CXI_ETH_PF_ALD) {
+		if (flags & CXI_ETH_PF_ALD) {
+			dev->priv_flags |= CXI_ETH_PF_ALD;
+			cxi_link_auto_lane_degrade(dev->cxi_dev, true);
+		} else {
+			dev->priv_flags &= ~CXI_ETH_PF_ALD;
+			cxi_link_auto_lane_degrade(dev->cxi_dev, false);
+		}
+	}
+
+	if (changes & CXI_ETH_PF_LOS_LOL_HIDE) {
+		if (flags & CXI_ETH_PF_LOS_LOL_HIDE) {
+			dev->priv_flags |= CXI_ETH_PF_LOS_LOL_HIDE;
+			cxi_link_los_lol_hide(dev->cxi_dev, true);
+		} else {
+			dev->priv_flags &= ~CXI_ETH_PF_LOS_LOL_HIDE;
+			cxi_link_los_lol_hide(dev->cxi_dev, false);
+		}
+	}
+
+	if (changes & CXI_ETH_PF_R1_LINK_PARTNER) {
+		if (flags & CXI_ETH_PF_R1_LINK_PARTNER)
+			dev->priv_flags |= CXI_ETH_PF_R1_LINK_PARTNER;
+		else
+			dev->priv_flags &= ~CXI_ETH_PF_R1_LINK_PARTNER;
+	}
+
+	return 0;
+}
+
+static u32 cxi_get_priv_flags(struct net_device *ndev)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct cxi_link_info link_info;
+	u32 debug_flags;
+
+	cxi_link_mode_get(dev->cxi_dev, &link_info);
+	cxi_link_flags_get(dev->cxi_dev, &debug_flags);
+
+	return dev->priv_flags | link_info.flags | debug_flags;
+}
+
+static void cxi_get_ethtool_stats(struct net_device *ndev,
+				  struct ethtool_stats *stats, u64 *data)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct cxi_dev *cdev = dev->cxi_dev;
+	int retval;
+	int i;
+
+	retval = cxi_telem_get_selected(cdev, cxi_get_ethtool_stats_set, data,
+					CXI_GLOBAL_STATS_LEN);
+	if (retval != 0)
+		for (i = 0 ; i < CXI_GLOBAL_STATS_LEN ; ++i)
+			data[i] = 0;
+}
+
+static int cxi_get_ts_info(struct net_device *ndev,
+			   struct kernel_ethtool_ts_info *info)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	info->so_timestamping =
+		SOF_TIMESTAMPING_RX_SOFTWARE | SOF_TIMESTAMPING_RX_HARDWARE |
+		SOF_TIMESTAMPING_TX_SOFTWARE | SOF_TIMESTAMPING_TX_HARDWARE |
+		SOF_TIMESTAMPING_SOFTWARE | SOF_TIMESTAMPING_RAW_HARDWARE;
+
+	info->phc_index = dev->eth_info.ptp_clock_index;
+
+	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
+
+	/* The HW only supports PTP Ethernet filter. Timestamp cannot
+	 * be added to PTP UDP packet.
+	 */
+	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
+			   BIT(HWTSTAMP_FILTER_PTP_V2_L2_EVENT);
+
+	return 0;
+}
+
+static void cxi_get_pauseparam(struct net_device *ndev,
+			       struct ethtool_pauseparam *pause)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	cxi_eth_get_pause(dev->cxi_dev, pause);
+	pause->autoneg = 0;
+}
+
+static int cxi_set_pauseparam(struct net_device *ndev,
+			      struct ethtool_pauseparam *pause)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	if (pause->autoneg != 0)
+		return -EINVAL;
+
+	cxi_eth_set_pause(dev->cxi_dev, pause);
+
+	return 0;
+}
+
+static int cxi_get_fecparam(struct net_device *ndev,
+			    struct ethtool_fecparam *fec)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	struct cxi_link_info link_info;
+
+	cxi_link_mode_get(dev->cxi_dev, &link_info);
+
+	fec->active_fec = link_info.fec_type;
+
+	return 0;
+}
+
+static int cxi_set_fecparam(struct net_device *ndev,
+			    struct ethtool_fecparam *fec)
+{
+	return -ENOTSUPP;
+}
+
+static void cxi_get_ringparam(struct net_device *ndev,
+			      struct ethtool_ringparam *ring,
+			      struct kernel_ethtool_ringparam *kernel_ring,
+			      struct netlink_ext_ack *extack)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	*ring = dev->ringparam;
+
+#ifdef ETHTOOL_RING_USE_CQE_SIZE
+	kernel_ring->cqe_size = get_rxq_eq_buf_size(dev) /
+		sizeof(struct c_event_target_enet);
+#endif
+	kernel_ring->rx_buf_len =
+		dev->ringparam.rx_pending * dev->eth_info.max_segment_size +
+		small_pkts_buf_count * small_pkts_buf_size;
+}
+
+static int cxi_set_ringparam(struct net_device *ndev,
+			     struct ethtool_ringparam *ring,
+			     struct kernel_ethtool_ringparam *kernel_ring,
+			     struct netlink_ext_ack *extack)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+	int rc = 0;
+
+	if (ring->rx_jumbo_pending)
+		return -EINVAL;
+
+	dev->ringparam.rx_pending = clamp(ring->rx_pending,
+					  LARGE_PKTS_BUF_COUNT_MIN,
+					  LARGE_PKTS_BUF_COUNT_MAX);
+
+	dev->ringparam.rx_mini_pending = num_small_packets(
+		clamp(round_up(ring->rx_mini_pending, 4096) /
+		      (small_pkts_buf_size / buffer_threshold),
+		      SMALL_PKTS_BUF_COUNT_MIN, SMALL_PKTS_BUF_COUNT_MAX));
+
+	dev->ringparam.tx_pending = clamp_t(unsigned int, ring->tx_pending,
+					    1, CXI_MAX_CQ_COUNT);
+
+	if (netif_running(ndev)) {
+		hw_cleanup(dev);
+		rc = hw_setup(dev);
+		if (rc)
+			netdev_err(ndev,
+				   "Failed to restart after ringparam change\n");
+	}
+
+	return rc;
+}
+
+static int cxi_set_phys_id(struct net_device *ndev,
+			   enum ethtool_phys_id_state state)
+{
+	struct cxi_eth *dev = netdev_priv(ndev);
+
+	switch (state) {
+	case ETHTOOL_ID_ACTIVE:
+		cxi_set_led_beacon(dev->cxi_dev, true);
+		return 0;
+
+	case ETHTOOL_ID_INACTIVE:
+		cxi_set_led_beacon(dev->cxi_dev, false);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+const struct ethtool_ops cxi_eth_ethtool_ops = {
+	.supported_ring_params =
+#ifdef ETHTOOL_RING_USE_CQE_SIZE
+	ETHTOOL_RING_USE_CQE_SIZE |
+#endif
+	ETHTOOL_RING_USE_RX_BUF_LEN,
+	.get_drvinfo	= cxi_get_drvinfo,
+	.get_sset_count	= cxi_get_sset_count,
+	.get_strings	= cxi_get_strings,
+	.get_rxnfc	= cxi_get_rxnfc,
+	.get_channels	= cxi_get_channels,
+	.set_channels	= cxi_set_channels,
+	.get_rxfh_indir_size = cxi_get_rxfh_indir_size,
+	.get_rxfh       = cxi_get_rxfh,
+	.set_rxfh       = cxi_set_rxfh,
+	.get_rxfh_key_size = cxi_get_rxfh_key_size,
+	.get_module_info = cxi_get_module_info,
+	.get_module_eeprom = cxi_get_module_eeprom,
+	.get_module_eeprom_by_page = cxi_get_module_eeprom_by_page,
+	.flash_device   = cxi_flash_device,
+	.get_link	= ethtool_op_get_link,
+	.get_link_ksettings = cxi_get_link_ksettings,
+	.set_link_ksettings = cxi_set_link_ksettings,
+	.get_priv_flags     = cxi_get_priv_flags,
+	.set_priv_flags     = cxi_set_priv_flags,
+	.get_ethtool_stats  = cxi_get_ethtool_stats,
+	.get_ts_info        = cxi_get_ts_info,
+	.set_phys_id        = cxi_set_phys_id,
+	.get_pauseparam     = cxi_get_pauseparam,
+	.set_pauseparam     = cxi_set_pauseparam,
+	.get_fecparam       = cxi_get_fecparam,
+	.set_fecparam       = cxi_set_fecparam,
+	.get_ringparam      = cxi_get_ringparam,
+	.set_ringparam      = cxi_set_ringparam,
+};
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c
new file mode 100644
index 000000000000..f5c978efd183
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2024 Hewlett Packard Enterprise Development LP */
+
+/* Common parts of RX and TX Profile */
+
+#include "cass_core.h"
+#include "cxi_rxtx_profile.h"
+#include "cxi_rxtx_profile_list.h"
+
+/**
+ * cxi_rxtx_profile_init() - Initialize the common portions
+ *
+ * @rxtx_profile: profile pointer
+ * @hw: Cassini device
+ * @vni_attr: VNI attributes for profile
+ *
+ */
+void cxi_rxtx_profile_init(struct cxi_rxtx_profile *rxtx_profile,
+			   struct cass_dev *hw,
+			   const struct cxi_rxtx_vni_attr *vni_attr)
+{
+	rxtx_profile->vni_attr.match  = vni_attr->match;
+	rxtx_profile->vni_attr.ignore = vni_attr->ignore;
+	strscpy(rxtx_profile->vni_attr.name, vni_attr->name,
+		ARRAY_SIZE(rxtx_profile->vni_attr.name));
+
+	/* Profiles are long lived.  We indicate this by an
+	 * initial reference count of 1, and a release status of false.
+	 *
+	 * The release operation is atomic: it sets the value of
+	 * 'released' to true, and decrements the reference count.
+	 *
+	 * When no references remain, the profile is deleted.
+	 *
+	 * TODO: is revoke still needed?
+	 */
+
+	refcount_set(&rxtx_profile->state.refcount, 1);
+	rxtx_profile->state.enable = false;
+
+	cxi_ac_entry_list_init(&rxtx_profile->ac_entry_list);
+}
+
+/**
+ * cxi_rxtx_profile_destroy() - tear down common portion
+ *
+ * @rxtx_profile: profile pointer
+ */
+void cxi_rxtx_profile_destroy(struct cxi_rxtx_profile *rxtx_profile)
+{
+	/* TODO: make sure these commented functions get */
+	/* implemented in rx and tx profiles... */
+
+	/* cass_vni_entry_disable_hw(vni_entry); */
+	cxi_ac_entry_list_destroy(&rxtx_profile->ac_entry_list);
+}
+
+/**
+ * cxi_rxtx_profile_find_inc_refcount() - Look up RX Profile in the
+ *                                        device list by ID and increment
+ *                                        its refcount.
+ *
+ * @list: profile list
+ * @profile_id: the ID to use for the lookup
+ * @rxtx_profile: location to place rxtx_profile pointer
+ *
+ * Return: 0 on success or error code.
+ *
+ * Note: this function is used internally for cases where we need to
+ * examine a profile even if it is released or revoked.
+ *
+ * Refcount must be decremented when usage is done.
+ */
+int cxi_rxtx_profile_find_inc_refcount(struct cxi_rxtx_profile_list *list,
+				       unsigned int profile_id,
+				       struct cxi_rxtx_profile **rxtx_profile)
+	__must_hold(&list->xarray.xa_lock)
+{
+	struct cxi_rxtx_profile    *profile;
+	int    ret = 0;
+
+	ret = cxi_rxtx_profile_list_retrieve(list, profile_id, &profile);
+	if (ret)
+		goto out;
+
+	if (!refcount_inc_not_zero(&profile->state.refcount)) {
+		ret = -EBADR;
+		goto out;
+	}
+
+	*rxtx_profile = profile;
+
+out:
+	return ret;
+}
+
+/**
+ * cxi_rxtx_profile_release() - Mark a Profile as released.
+ *
+ * No new references can be taken.
+ *
+ * @rxtx_profile: pointer to profile
+ */
+void cxi_rxtx_profile_release(struct cxi_rxtx_profile *rxtx_profile)
+{
+	/* Reduce the reference count.  Note that this function is
+	 * called via pointer to profile, indicating that the caller
+	 * also has a reference to this profile.  Thus the reference
+	 * count after this function returns will be at least 1.
+	 * (Eating the return from cxi_rxtx_profile_dec_refcount() is ok).
+	 */
+	refcount_dec(&rxtx_profile->state.refcount);
+}
+
+/**
+ * cxi_rxtx_profile_revoke() - Revoke the VNI associated with profile.
+ *
+ * RDMA operations for this VNI will fail.  Since the Profile is
+ * essentially dead at this point, 'revoke' implies 'release' as well.
+ *
+ * @rxtx_profile: pointer to profile
+ */
+void cxi_rxtx_profile_revoke(struct cxi_rxtx_profile *rxtx_profile)
+{
+	/* Remove all the Access Control entries associated with
+	 * this Profile.  This ensures it can't be used again.
+	 */
+
+	cxi_ac_entry_list_purge(&rxtx_profile->ac_entry_list);
+
+	/* TODO: this has to be done at the RX or TX layer */
+	/* cass_rx_profile_revoke(rx_profile); */
+
+	cxi_rxtx_profile_release(rxtx_profile);
+}
+
+/**
+ * cxi_rxtx_profile_get_info() - Retrieve the attributes and state associated
+ *                               with this Profile.
+ *
+ * @rxtx_profile: pointer to Profile
+ * @vni_attr: location to place attributes
+ * @state: location to put state
+ *
+ * Note: attr and/or state may be NULL.
+ */
+void cxi_rxtx_profile_get_info(struct cxi_rxtx_profile *rxtx_profile,
+			       struct cxi_rxtx_vni_attr *vni_attr,
+			       struct cxi_rxtx_profile_state *state)
+{
+	if (vni_attr) {
+		vni_attr->ignore   = rxtx_profile->vni_attr.ignore;
+		vni_attr->match    = rxtx_profile->vni_attr.match;
+		strscpy(vni_attr->name, rxtx_profile->vni_attr.name,
+			ARRAY_SIZE(vni_attr->name));
+	}
+
+	if (state) {
+		state->enable = rxtx_profile->state.enable;
+		state->refcount = rxtx_profile->state.refcount;
+	}
+}
+
+/**
+ * cxi_rxtx_profile_add_ac_entry() - add an Access Control entry to
+ *                                   an existing Profile
+ *
+ * @rxtx_profile: pointer to Profile
+ * @ac_type: type of AC Entry to add
+ * @ac_data: UID/GID for AC Entry
+ * @ac_entry_id: location to put AC Entry id on success
+ *
+ * Return:
+ * * 0       - success
+ * * -EBUSY  - AC Entry already exists
+ */
+int cxi_rxtx_profile_add_ac_entry(struct cxi_rxtx_profile *rxtx_profile,
+				  enum cxi_ac_type ac_type,
+				  union cxi_ac_data *ac_data,
+				  unsigned int *ac_entry_id)
+{
+	/* insert will fail with error if data is already present */
+
+	return cxi_ac_entry_list_insert(&rxtx_profile->ac_entry_list, ac_type,
+					ac_data, ac_entry_id);
+}
+
+/**
+ * cxi_rxtx_profile_remove_ac_entry() - disable access control to a Profile
+ *                                      by access control id.
+ *
+ * @rxtx_profile: pointer to profile
+ * @ac_entry_id: id of AC entry
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - ac entry id unknown
+ */
+int cxi_rxtx_profile_remove_ac_entry(struct cxi_rxtx_profile *rxtx_profile,
+				     unsigned int ac_entry_id)
+{
+	return cxi_ac_entry_list_delete(&rxtx_profile->ac_entry_list,
+					ac_entry_id);
+}
+
+/**
+ * cxi_rxtx_profile_get_ac_entry_ids() - get the list of AC entry ids
+ *                                       associated with a Profile
+ *
+ * @rxtx_profile: pointer to Profile
+ * @max_ids: size of the ac_entry_ids array
+ * @ac_entry_ids: location to store ids
+ * @num_ids: number of valid ids in ac_entry_ids array on success
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_ids is not large enough.  num_ids holds value required.
+ */
+int cxi_rxtx_profile_get_ac_entry_ids(struct cxi_rxtx_profile *rxtx_profile,
+				      size_t max_ids,
+				      unsigned int *ac_entry_ids,
+				      size_t *num_ids)
+{
+	return cxi_ac_entry_list_get_ids(&rxtx_profile->ac_entry_list, max_ids,
+					 ac_entry_ids, num_ids);
+}
+
+/**
+ * cxi_rxtx_profile_get_ac_entry_data() - retrieve the type and data for a
+ *                                        AC entry associated with a Profile
+ *
+ * @rxtx_profile: pointer to Profile
+ * @ac_entry_id: id of AC entry
+ * @ac_type: location to store AC entry type
+ * @ac_data: location to store AC data
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - AC entry id unknown
+ */
+int cxi_rxtx_profile_get_ac_entry_data(struct cxi_rxtx_profile *rxtx_profile,
+				       unsigned int ac_entry_id,
+				       enum cxi_ac_type *ac_type,
+				       union cxi_ac_data *ac_data)
+{
+	return cxi_ac_entry_list_retrieve_by_id(&rxtx_profile->ac_entry_list,
+						ac_entry_id, ac_type, ac_data);
+}
+
+/**
+ * cxi_rxtx_profile_get_ac_entry_id_by_data() - get the AC entry id associated
+ *                                              with a Profile for a given
+ *                                              type and data
+ *
+ * @rxtx_profile: pointer to Profile
+ * @ac_type: type of AC entry to look for
+ * @ac_data: AC entry data to look for
+ * @ac_entry_id: location to store AC entry id on success
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - AC entry with given type&data not found
+ * * -EBADR   - invalid ac_type
+ */
+int cxi_rxtx_profile_get_ac_entry_id_by_data(struct cxi_rxtx_profile *rxtx_profile,
+					     enum cxi_ac_type ac_type,
+					     const union cxi_ac_data *ac_data,
+					     unsigned int *ac_entry_id)
+{
+	return cxi_ac_entry_list_retrieve_by_data(&rxtx_profile->ac_entry_list,
+						  ac_type, ac_data, ac_entry_id);
+}
+
+/**
+ * cxi_rxtx_profile_get_ac_entry_id_by_user() - retrieve the AC entry associated
+ *                                              with a Profile by user and group
+ *
+ * @rxtx_profile: pointer to Profile
+ * @uid: user id
+ * @gid: group id
+ * @netns: The Network Namespace id
+ * @desired_types: one or more of the enum cxi_ac_type values OR's together
+ * @ac_entry_id: location to store AC entry id on success
+ *
+ * Return:
+ * * 0       - success
+ * * -EPERM  - no AC entries found for given uid and gid
+ *
+ * Note: multiple AC entries may apply.  The priority of return is
+ * CXI_AC_UID, CXI_AC_GID, CXI_AC_NETNS, CXI_AC_OPEN.
+ */
+int cxi_rxtx_profile_get_ac_entry_id_by_user(struct cxi_rxtx_profile *rxtx_profile,
+					     uid_t uid,
+					     gid_t gid,
+					     unsigned int netns,
+					     cxi_ac_typeset_t desired_types,
+					     unsigned int *ac_entry_id)
+{
+	return cxi_ac_entry_list_retrieve_by_user(&rxtx_profile->ac_entry_list,
+						  uid, gid, netns, desired_types, ac_entry_id);
+}
+
+struct valid_ac_data {
+	uid_t uid;
+	gid_t gid;
+	unsigned int netns;
+};
+
+struct valid_user_data {
+	unsigned int vni;
+	struct valid_ac_data ac_data;
+};
+
+int vni_overlap_test(struct cxi_rxtx_profile *profile1,
+		     void *user_arg)
+{
+	struct cxi_rxtx_profile  *profile2 = user_arg;
+	bool overlap = vni_overlap(&profile1->vni_attr, &profile2->vni_attr);
+
+	/* ignore profiles with 0 VNI */
+	if (zero_vni(&profile1->vni_attr))
+		return 0;
+
+	return overlap ? -EEXIST : 0;
+}
+
+/* Make sure the VNI space is unique */
+bool unique_vni_space(struct cass_dev *hw,
+		      struct cxi_rxtx_profile_list *list,
+		      const struct cxi_rxtx_vni_attr *attr)
+{
+	int rc;
+	struct cxi_rxtx_profile rxtx_prof = {
+		.vni_attr.match = attr->match,
+		.vni_attr.ignore = attr->ignore,
+	};
+
+	cxi_rxtx_profile_list_lock(list);
+
+	rc = cxi_rxtx_profile_list_iterate(list,
+					   vni_overlap_test,
+					   &rxtx_prof);
+
+	cxi_rxtx_profile_list_unlock(list);
+
+	return !rc;
+}
+
+static int valid_vni_operator(struct cxi_rxtx_profile *rxtx_profile,
+			      void *user_data)
+{
+	int rc;
+	bool valid = false;
+	unsigned int ac_entry_id;
+	struct cxi_rxtx_vni_attr vni_attr;
+	struct cxi_rxtx_profile_state state;
+	struct valid_user_data *data = user_data;
+	struct cxi_rxtx_vni_attr user_vni = {
+		.match = data->vni,
+	};
+	struct valid_ac_data ac_data = data->ac_data;
+
+	cxi_rxtx_profile_get_info(rxtx_profile, &vni_attr, &state);
+
+	if (!state.enable)
+		return false;
+
+	/* If there is a vni match, check if user is authorized */
+	if (vni_overlap(&user_vni, &vni_attr)) {
+		rc = cxi_rxtx_profile_get_ac_entry_id_by_user(rxtx_profile,
+							      ac_data.uid,
+							      ac_data.gid,
+							      ac_data.netns,
+							      CXI_AC_ANY,
+							      &ac_entry_id);
+		if (!rc)
+			valid = true;
+	}
+
+	return valid;
+}
+
+/**
+ * cxi_valid_vni() - Check if user has permission to use a VNI by searching
+ *                   for a profile containing the VNI.
+ *
+ * @dev: Cassini Device
+ * @type: TX or RX profile
+ * @vni: VNI to verify
+ *
+ * Return:
+ * * true if VNI is valid
+ */
+bool cxi_valid_vni(struct cxi_dev *dev, enum cxi_profile_type type,
+		   unsigned int vni)
+{
+	struct cxi_rxtx_profile_list *list;
+	bool valid;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct valid_user_data user_data = {
+		.vni = vni,
+		.ac_data = {
+			.uid = __kuid_val(current_euid()),
+			.gid = __kgid_val(current_egid()),
+			.netns = CURRENT_NETNS_ID(),
+		},
+	};
+
+	if (type == CXI_PROF_RX)
+		list = &hw->rx_profile_list;
+	else
+		list = &hw->tx_profile_list;
+
+	cxi_rxtx_profile_list_lock(list);
+	valid = cxi_rxtx_profile_list_iterate(list, valid_vni_operator, &user_data);
+	cxi_rxtx_profile_list_unlock(list);
+	return valid;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c
new file mode 100644
index 000000000000..605f08abe53c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2024 Hewlett Packard Enterprise Development LP */
+
+/* RX Profile and TX Profile List Implementations */
+
+#include "cass_core.h"
+#include "cxi_rxtx_profile_list.h"
+
+/* **************************************************************** */
+/* RXTX Profile List implementation                                 */
+/* **************************************************************** */
+
+/**
+ * cxi_rxtx_profile_list_init() - initialize the Profile list object
+ *
+ * @list: address of list object
+ * @limits: address of index limits struct
+ * @flags: optional flags for xarray
+ * @gfp_opts: memory allocation options for xarray
+ */
+void cxi_rxtx_profile_list_init(struct cxi_rxtx_profile_list *list,
+				struct xa_limit *limits,
+				gfp_t flags,
+				gfp_t gfp_opts)
+{
+	xa_init_flags(&list->xarray, flags);
+
+	list->limits   = limits;
+	list->flags    = flags;
+	list->gfp_opts = gfp_opts;
+}
+
+/**
+ * cxi_rxtx_profile_list_destroy() - remove all Profile references
+ * from the list and free the underlying resources.
+ *
+ * @list: address of list
+ * @cleanup: function to call for additional cleanup processing of each
+ *           profile in the list
+ * @user_arg: second arg to cleanup function
+ */
+void cxi_rxtx_profile_list_destroy(struct cxi_rxtx_profile_list *list,
+				   void (*cleanup)(struct cxi_rxtx_profile *profile,
+						   void *user_arg),
+				   void *user_arg)
+{
+	unsigned long              index;
+	struct cxi_rxtx_profile    *profile;
+
+	index = list->limits->min;
+
+	xa_lock(&list->xarray);
+
+	xa_for_each(&list->xarray, index, profile) {
+		__xa_erase(&list->xarray, index);
+		if (cleanup)
+			cleanup(profile, user_arg);
+	}
+
+	xa_unlock(&list->xarray);
+	xa_destroy(&list->xarray);
+}
+
+/**
+ * cxi_rxtx_profile_list_lock() - lock the list
+ *
+ * @list: address of list
+ */
+void cxi_rxtx_profile_list_lock(struct cxi_rxtx_profile_list *list)
+	__acquires(&list->xarray.xa_lock)
+{
+	xa_lock(&list->xarray);
+}
+
+/**
+ * cxi_rxtx_profile_list_unlock() - unlock the list
+ *
+ * @list: address of list
+ */
+void cxi_rxtx_profile_list_unlock(struct cxi_rxtx_profile_list *list)
+	__releases(&list->xarray.xa_lock)
+{
+	xa_unlock(&list->xarray);
+}
+
+/**
+ * cxi_rxtx_profile_list_insert() - Allocate a free Id and
+ *                                  add a Profile to the list.
+ *
+ * @list: address of list
+ * @profile: address of Profile to add
+ * @profile_id: location to store newly allocated Id on success
+ *
+ * Return:
+ * * 0 - success
+ *
+ * Errors related to memory allocation failures are also possible.
+ */
+int cxi_rxtx_profile_list_insert(struct cxi_rxtx_profile_list *list,
+				 struct cxi_rxtx_profile *profile,
+				 unsigned int *profile_id)
+	__must_hold(&list->xarray.xa_lock)
+{
+	int    ret;
+
+	ret = __xa_alloc(&list->xarray, &profile->id, profile,
+			 *list->limits, list->gfp_opts);
+
+	if (!ret)
+		*profile_id = profile->id;
+
+	return ret;
+}
+
+/**
+ * cxi_rxtx_profile_list_remove() - remove the Profile from the list
+ *
+ * @list: address of list struct
+ * @rxtx_profile_id: index of Profile
+ *
+ * Return: 0 on success
+ * -EBADR: Profile struct is not in list
+ */
+int cxi_rxtx_profile_list_remove(struct cxi_rxtx_profile_list *list,
+				 unsigned int rxtx_profile_id)
+{
+	struct cxi_rxtx_profile   *previous_entry;
+
+	previous_entry = xa_erase(&list->xarray, rxtx_profile_id);
+
+	return previous_entry ? 0 : -EBADR;
+}
+
+/**
+ * cxi_rxtx_profile_list_retrieve() - get the pointer to a Profile by Id
+ *
+ * @list: address of list
+ * @profile_id: Id of desired Profile
+ * @profile: location to place Profile pointer
+ *
+ * Return: 0 on success
+ * -EBADR: Profile with desired Id not found.
+ */
+int cxi_rxtx_profile_list_retrieve(struct cxi_rxtx_profile_list *list,
+				   unsigned int profile_id,
+				   struct cxi_rxtx_profile **profile)
+{
+	struct cxi_rxtx_profile  *my_profile;
+	int    ret;
+
+	my_profile = xa_load(&list->xarray, profile_id);
+	ret = xa_err(my_profile);
+
+	if (ret)
+		return ret;
+
+	*profile = my_profile;
+
+	return my_profile ? 0 : -EBADR;
+}
+
+/**
+ * cxi_rxtx_profile_list_iterate() - walk list and call function on each member.
+ *
+ * @list: address of list
+ * @operator: function to call (see below).
+ * @user_args: other data to pass to operator (see below).
+ *
+ * This iterator calls the function 'operator(profile, user_args)' for each
+ * profile in the list.
+ * Iteration continues as long as the return value of 'operator' is 0.
+ *
+ * The return value of the iterator function is the final return value
+ * of the operator.
+ *
+ * The caller may lock the list during iteration but it is not required.
+ */
+int cxi_rxtx_profile_list_iterate(struct cxi_rxtx_profile_list *list,
+				  int (*operator)(struct cxi_rxtx_profile *profile,
+						  void *user_args),
+				  void *user_args)
+{
+	struct cxi_rxtx_profile    *profile;
+	unsigned long              index;
+
+	index = list->limits->min;
+
+	xa_for_each(&list->xarray, index, profile) {
+		int ret = operator(profile, user_args);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct get_ids_data {
+	size_t         max_ids;
+	unsigned int   *ids;
+	size_t         num_ids;
+};
+
+static int get_ids_operator(struct cxi_rxtx_profile *rxtx_profile,
+			    void *user_data)
+{
+	struct get_ids_data   *data = user_data;
+
+	if (data->num_ids < data->max_ids) {
+		*data->ids = rxtx_profile->id;
+		data->ids++;
+	}
+
+	data->num_ids++;
+	return 0;
+}
+
+/**
+ * cxi_rxtx_profile_list_get_ids() - Get a list of the active IDs
+ *
+ * @list: address of list
+ * @max_ids: size of the ids array
+ * @ids: array to put ids in
+ * @num_ids: number of valid IDs in ids
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_ids is not large enough, num_ids hold required value
+ */
+int cxi_rxtx_profile_list_get_ids(struct cxi_rxtx_profile_list *list,
+				  size_t max_ids,
+				  unsigned int *ids,
+				  size_t *num_ids)
+{
+	struct get_ids_data   data = {
+		.max_ids = max_ids,
+		.ids     = ids,
+		.num_ids = 0,
+	};
+	int    ret;
+
+	ret = cxi_rxtx_profile_list_iterate(list, get_ids_operator, &data);
+	if (ret)
+		return ret;
+
+	*num_ids = data.num_ids;
+
+	return (data.num_ids > max_ids) ? -ENOSPC : 0;
+}

-- 
2.56.0

