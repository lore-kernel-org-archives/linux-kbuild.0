Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394057;
	b=iQgBR2sJvcLs2z7XEv+ppjIqfVTPCiDrF8DO5NgzVv8XdWY5WllA+zGLCXdqaBr+mz7s
	 +9zEW9wLCr28enAJso0jKO4MGjSzlM/F+S1ezqXsGuzT+010xo8xglQTkZ3yllaKbSls3
	 hryqARSVmzEkPDXjeWTZRRiUZ3nWwViUSGGlw3XHbnO5d/9Rlntlt56fmnXCZ3U/yCw/0
	 L6QRfNhGoyCz5or8v2xQX4Zbev0DqwP69MGP/+CUaySzMHV9zV+4QQJmUQQs/sjW9I3Hx
	 /ZEmrhEOkYjmkEunvnpzjqrnonVl7TnI+AlIzFkGuxB9mCgR9VRUyxctvRTiJeWsmdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394057;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sCfLQxYGHYSOyKVT32b17M8L9KDAFJ1YDxMd0tnvBi0=;
	b=npWb/spT41Mmuu1Cwv1686znsQu9HpFeeesDfr1eB+RVG5lIJVzMlq1riPWoLxiC5PFo
	 eVhSAH898rxmwErN4nUdhnvK8gRs7RAh64DWpiaxQLAvALOttvPlhYTz3uR1FGGvoJV30
	 WEgd8eLMxw9hlVe8knWbZcLq+APv0RuwFi8hR0EAK+d+56Or2pd6Rga7JIczjna3DueTe
	 VCmZzBtSVDnoIWKQy4B98cevlHRlM62J1TGAwvBiiMlLbcr4h5hNFzl1YVEp/yyV6rwbN
	 8CpBMUjjlisG/ZR+aj1I76r6LlMlZTkbMFg1OzYY/bvWm2D4CCYtfy9SykJtYUWcaoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=SJx8SL+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1AB60A2622;
	Fri, 30 Oct 2026 21:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1AB60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=SJx8SL+J
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UI07AL770946;
	Fri, 30 Oct 2026 21:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=sC
	fLQxYGHYSOyKVT32b17M8L9KDAFJ1YDxMd0tnvBi0=; b=SJx8SL+JMyWKn3ReX2
	ml1ZwfYMqmpPRvNkHpsnNCWWG7opFNEd4WAq+DD9QRyz6gS7Ee3T1/qpWAJao9OL
	cZh7tGaLEAuJYgW06rVKGaygsIxFBp4i/DnHPUpbSbBjXC/2YygoKYZo88LNySSS
	rFyd6gho8Afzz9lJA9hR1eN2UECR4pYunyrWtoGBBmCOzGdKElosOnm6irw2lH6k
	2JcxYh7ZOwbAdeIlbOCzGrOi1U2GzL5kHnpuH20EAv/hUiliu5AGqqtib4X2PBcG
	0uM+KX8ZrKAQCo0J56exBG8NbDyED3zC395P+VksqjlcgP7z0hX5dDtOCI7WReAB
	MOlg==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmvmy4xsn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:29 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 39D75D29D;
	Fri, 30 Oct 2026 21:00:29 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:14 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:14 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+ia2IOBr/FFjC2fcByRU/BBU74UTnxakGT6/3o/4kjAk0MUg/LpUe3aGlkh4MTeDwp2OVpt15DW+UDkVjVuv2/4a1KQC+Aer2JmqthJJl3P7+PGTRbCs1NHwLnPmSz67mP8b2JcChBSzbXui5JGXvWjd14EWl+eGx20Hcmj+o4e6ri8e8px2yAq44O1SwC60l9o8jBKLwKrA4hfIfq7mZCkmLU0RKJvnyaFnm7DBNSeNc5E1CSPELfnNDBJ//3LzDwLBF19GkqTwaaDj2Xv9TprXmWUtMZWleQWRhDghEQ/ryENG+F0aWKo2RyqdoRi1x4HlRdc7FQogOJXK804Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCfLQxYGHYSOyKVT32b17M8L9KDAFJ1YDxMd0tnvBi0=;
 b=Gf+ZmuYLm6eo8bpE3otF+6NJZ6XxoV1rdm3NZ32LBTOBhkKOR4+BARKY9oUuJwH4DWvYC+ApMqTzcfLwX0A1tTRhF1gp6iEV8tZm5H2pO3FN+TkIqFAJyxL6fPm1Q8fbJ68BBF6mmUhVCCTmQ5u4E0CwbpuVfKOZRRFlWG9YjwXNgwWyCBBlzlKFYpolEyRIripS+/5QpkX+CUI/DcvEg/KtFBk9ha40IG0amKp/lcroZkVGHM97B7ByE3FeS/jcWs4fzPiGuimF+grvQtrG9gPmqkuGfb5P1kY4IPyR5BDXk8iiKtbGcPJYmsGbrtNCNB0X3ypicXvXEYc2e+sAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:11 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:11 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:02 -0700
Subject: [PATCH 06/23] net: hpe: sbl: add link state management
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-6-8c2c391cc283@hpe.com>
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
        "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: BL1PR13CA0351.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::26) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 9ca5cfb0-4fd2-4446-0427-08df36c8c8ea
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: FxupuYTuD5169QbiXF/VbhJpoJmGQOk3rDpLoVfw7eEKgVQEGNVPkSlBzHRs5x3lt3d5jbFLMveBE4BvMcgqGAU6L8dUe7HJFN4actdI3hyfbhGlB+wwX3QqF78OSR6o+A2trI4Qr2uaA67OSS0CRKd/2vFw891Zq1BRT1p09YFni7KW2kMx5ormCIUZQZEqw/RtAX8aKlXdUcx7FuuRxr1cDv52a/B+aFlvrXoJSCSDxZMuilImqzv+xOEL86fxRzSIfV+oLpyPfbftVVv8pWFtBgtMkZ4ZQ0VVDIzEq1VjbAeJjC6jLNiNCOkpdsV1VJ2BxCUrhBtp+qViHnXpvuaBJ6V5fluuaZEY3ZvfcMBLOc3QaXqS3gjS/oV3+Bgs+zcTINud1bITKFoU7EgNCpVsn3W3WAckKw1ZPXPWrbzsAECW9qvjDZb5poMkI2VfnDKAAWNz11xGi8HdewNNfMQKtHziwN6viY63lkd6AZ4cxCxD08xjvUVmBVeNPLK4KGFF3q6sUNZcLxo/xuml0cghMap/PoIbh3rrFGX6RGzSNYb+4lS371AzQLCLu5sOtSSd8xinqKn1YUtNUFfOT+nRFp7s6P5LZIKMehwiMePPNQTFipjV54Kod/8nsTAvTozJsKyCF1YUXH2cTg5c+VJ98Mii6uOitKlbmwZMPsmvOatgYcgWXxgVs6r/tne3BBAzbux8aXbPVQhbyZKSyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2RNYlJnWTl2MzBmL2hrN0k0K0ttMjZqaGY1Q2JrTnU3WWhKR0dpUlZENmd1?=
 =?utf-8?B?dEpXR2FQMVJLeWRCaW53dnVEczRjdEJQUmFZR2xad2NFZ2JaeUtPa0NXVHhR?=
 =?utf-8?B?SDl1bG5xajVtcDZmRUUrUWpSQ1FPNHdsblcvaTg1Y0U3ODJTMjNBRy9zeCtJ?=
 =?utf-8?B?M1FLOFdQOE5UY004ZkxlcnZnSkdlNUFvVDg1YWpiZUNVU29YYkg4TU03OTZ6?=
 =?utf-8?B?RXNobUFjSGlhaXJYbU5LcU9KVkQyY3hKWU9tRGp5QU82dENsU0RlUjUrb0gy?=
 =?utf-8?B?a1laMmhZa0h1VHU0SlhYWDBRS2ZBNXJJMkJmU3AzQ2l0NXpySkI4RzZMMThY?=
 =?utf-8?B?Ylp2THVBZUZKRmVqQzFDRVBWcXdzKy9ObXBPMk5jOWdIaUhIOWVNVUlZNk5k?=
 =?utf-8?B?b0I2UzF4bG83TjRWbTZmQnRkSWxYb21ZNU1XbHpCNWZPT2FDV0ZXd0VsdHJ2?=
 =?utf-8?B?Yi9uNkkrZFlCVTlrcTZ6cGs4MWpSLzlKNHN5T3RPMmhXQW4yeHNSSm9XZE1z?=
 =?utf-8?B?VFBTNXJMZFFnSUdtcmlYTHBoOHRvbEowc2Y1NW03N3ZjWWV5YjB4WmpOK3dh?=
 =?utf-8?B?WUhLaGxzMElkZzAxeUoxVlBlV3JNdjJ5WEV5VU9TUFplbFFkOVU2RTFENDFU?=
 =?utf-8?B?cVZNZnpLY2w1Q2x6OEdFT0w3TkNWcGFOdEJycGc1dGdwbWJyMlV3YUdkQXcz?=
 =?utf-8?B?Ni9mRlUvdEVYNnJvTWtlMVJ1SVRxSkkwN0ZlMjAxRHRLWlNBZVBWMGhLN2t0?=
 =?utf-8?B?ZXFVQS8zcTVNKzhkMEI4WnFvOCtDZkk2Z0lDR2QyUjJVaDFuSExUR1NHSG5v?=
 =?utf-8?B?WkhWOUFHdWlaRW5rQVJKSWVVOTBvUmtmbEtoSjdQSWg4Umg5aW5zWEgzV2xy?=
 =?utf-8?B?V2txcWpIMitUbTZWZ1ZRVHloczI0NkJ1UGRyMVBWL1podTNxSUFxV0NWUCtL?=
 =?utf-8?B?VDUxL2hLSEx5bFR2ekY5ajc5WUM3T0xrL3ltYVJOU2JGcDdUekp1NkMvdS9Q?=
 =?utf-8?B?UlhKSlpUR3p3QWVqMGNsZnlXS2xxVURkUnNjd1BOWlI1ZURKaVI3cDUrSFpv?=
 =?utf-8?B?c1hjNUNJZXl0UE9ObDd3YmZPQThqbHlsYUxMenNJNHREWXYrZnE4NmNYRzBL?=
 =?utf-8?B?T3lqdENWM2J0RHVVcUFWVWRZeFUwaXVZYThkQjdCd1htRWpxTW5kWHRhQTM0?=
 =?utf-8?B?ZWdSRHZsSjQraXEwUGdTWU9SNEd1TGZSK0JmV1JiT1RyNDQyTldLM2NVVnA0?=
 =?utf-8?B?amlhbVRUek4rSXJiTlh1RkpsQkl3Sm4xNDNEQlR6QXBhRnFQRVhpZHo3aWFw?=
 =?utf-8?B?WUcyc2w0bkpOWkZhak95SGo1ZEpyZ2ltS29KMFdIZ1hxV1kvSUwvVkZjNVVo?=
 =?utf-8?B?elM5c0NrcFdXRTF4UzVJVHZIY0VFRWlHR2VxNEROUTVXMDNUakxUYXJVMnJC?=
 =?utf-8?B?WEdVS3hRRzZxYjJMWmJlb3lIaTkxWnVDMnFvS1F3cENvVXlMVms0TkpwdHhh?=
 =?utf-8?B?cG5ERU5OK0hidEZIQTF1SlN4SU5XdWFPZG1pU2lPWUJ6cDJta3JnanJpNjRR?=
 =?utf-8?B?ZExMWXZNaDRpeWFDdXVVMjMzNERUOEcwTzhhZzRrWFBVdkF3TTdMNlEwZlFy?=
 =?utf-8?B?WXZtTDZGQVVKcVFrTmRlaEllZFJ0THJjVU83bTlkMXFETnJTSjZtelNSUS9J?=
 =?utf-8?B?ZFNDWDEzVkNwejV3Q3E0d3lsK2F5Kzg0dTNZSk5xVW1LSUlsTmY4M21Sa2tv?=
 =?utf-8?B?MlltcGhLN1BDM1RGN1BvZnYyZU1MbVFOWG9Yd2xPQ1hjYlVFTVBnTFNjWEU4?=
 =?utf-8?B?NkJuU3IrZ2N3VW1NWHNFRW9nc3M4UU9RWXEwU3l3QjI0dzJFUDN4QTJnQTYz?=
 =?utf-8?B?b1lNT3BsVUtxYlVYdTZQQUJuQ0p0cmtxSGpuc3NRVE0zZ0NFOHZkVlgzeGdU?=
 =?utf-8?B?T2d0a0lHUWdMVkFHWFoyRkhyb3R1aDN5dDFtSmRXYVpiTjQrL1RRQkVwNFlv?=
 =?utf-8?B?SmpkbEswV05VSWM5aGZ0dDhNMHZXcXJNNjdSQWc4T1pWK3B5ZjV3U29qclQ1?=
 =?utf-8?B?bHY3RUIrSlpjNDFpc096RXhMcDYxTVdLWkdTRUhzdzVqcmZwMVhUd25ML3pX?=
 =?utf-8?B?SGR4ejFuL2VibnZmNndQUzQyM1RVRmNjb1N1OFhvR3BhZjR6WmtEc3pHMnB1?=
 =?utf-8?B?dlpiZmpyN0RHRkZIYmNubnhzVG0yZmIvUlVMVm1zVjQ2U0FLQXBJaVFkbVhJ?=
 =?utf-8?B?T3lDbDdLdGZBZzBOSGpxUVcxK1VldDZIeDZNL2RIZEhEbE1JY0c0dWNwdlU1?=
 =?utf-8?B?T3JFTmVRNWZzWVJkaU4yckFkUjZNUElaUHhQbXZ1ajkyUmRHY2FOZz09?=
X-Exchange-RoutingPolicyChecked: nPJBW4Zk3koJRCIswfBvOE2SOMSbid1uTfHDw3ixwrX5mR0+e9uK7h5cSjC976DYgAnZlw0Tl8LBz1cXkP2V5dC02KzZbmXmZskasNKp5yMBla98d2hnaa9dsdgxTlfNrBMV4Td4kJvMkMzgIICSooL1vo0IMCjRdbPMG5rTaZpaa4LbcNPMl4tHsP8u16USvLLKTr7gSg4jfs46/ppMk58ZDGeqfsijT5Y2mpV/TtyY7jV9oxtleMu/yWPSDABJIjUvwIFsx4V6JDrcKhmam2RC7CT5V8tEWcpHJKpx7m9uczaRvE0L+JacGiiMQy0wqH9Vq7jTqSatxBEJ2U8+Sw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca5cfb0-4fd2-4446-0427-08df36c8c8ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:11.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah27lYLZa6g+KzuxxX7b+Uft96E+EsvoQcd0ysCiWHX3si7eWcN63fdTB1d8EBOB/HyD0h/cXhlTU89JfLSX9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: dZbtSJlitOyY-R2A9zpvjsMWmNBoNBFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX7NH5OuMcl4uT
 O356aIjvb6yqpOyfvWFxxse9uf42RdGrJKwIREmoAj4ttuVnGYAhJd6Y/3ORmDzIsr+gMTbcksv
 gCas3ZUpKo4kMG0zArwTSczp5NT0eVjatAIW65w8kCKCqRkFyXvcSbI991oBtPLN3VtVPEIro/L
 CKsk3BqasclYXi/psECLYMshWnPvc/YVn/QSUZI3YUodriN+5XVsyo2EcV++rESDvJtsynNR5vk
 Eut15Zszi5LuaIBiUdPS0hSkWr0wQDqQsvG5uWtjYNs5R8QwitP2wju4UqJ/aYwagxa391zUgd2
 TsDXVGV59Z4leShAojapgRi1oiEbTg/iAdLrna057DZbrK/ov01KAf778KY+7FdtJesw/f8GeGO
 VY1rBXcTJ7sU4HJVB0L8nLBgV2Dw92ZCvSIYPiobH+uYQg3mN4sx+cT5z7KvW9ZD29uf4Cq+Qqq
 jRSEjHGmYlUs2p/h4HA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6ae5056d cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ModqzXLkJJ0tFyq98apW:22 a=MvuuwTCpAAAA:8 a=QgmGcT5o_GdUoS45VkwA:9
 a=eYjDDw7RqwnV9FQP:21 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dZbtSJlitOyY-R2A9zpvjsMWmNBoNBFP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXxOaZWZV0zdCn
 40S75VovroSPDplVNO+7H1kxWpC8Ss5+gJ7wAukgjHLln0OIscP9RtW6MEZdO/1aod9NNMD72RS
 goSsyFAtf4bADDbS/C7KjvmlKygfhOk=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the link state machine: bring-up, auto-negotiation and the NIC
specific link ops.  This ties the PML and SerDes layers together and
is what the NIC driver calls to take a link up or down.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (22), LONG_LINE_COMMENT (2)
- CHECK: BRACES (22), UNNECESSARY_PARENTHESES (8), COMPARISON_TO_NULL
  (1)

Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_link.c        | 1739 ++++++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_link_an.c     | 1010 ++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c |  111 ++
 drivers/net/ethernet/hpe/sbl/sbl_link_nic.c    |  196 +++
 4 files changed, 3056 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link.c b/drivers/net/ethernet/hpe/sbl/sbl_link.c
new file mode 100644
index 000000000000..706fa9ba9676
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_link.c
@@ -0,0 +1,1739 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+#include <linux/hpe/sbl/sbl_fec.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_serdes_map.h"
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes.h"
+#include "sbl_serdes_fn.h"
+#include "sbl_internal.h"
+
+/* detect the presence of our link partner */
+static int sbl_base_link_lp_detect(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int err = 0;
+
+	/* already detected - probably from autoneg */
+	if (link->lp_detected)
+		return 0;
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LP_DET);
+
+	/* currently we have only one way to do this */
+	if (link->blattr.options & SBL_OPT_SERDES_LPD) {
+		err =  sbl_serdes_lp_detect(sbl, port_num);
+		if (!err)
+			link->lp_detected = true;
+	}
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LP_DET);
+
+	return err;
+}
+
+/* Check/recover SBL FW */
+static int sbl_base_link_check_fix_fw(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int serdes;
+	int err;
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		err = sbl_validate_serdes_fw_crc(sbl, port_num, serdes);
+		if (err) {
+			/* Any lane with corrputed FW will cause all lanes for
+			 * the port to be reloaded.
+			 */
+			goto reload_fw;
+		}
+	}
+	return 0;
+
+ reload_fw:
+	err = sbl_serdes_firmware_flash_safe(sbl, port_num, false);
+	if (err) {
+		/* All we can do is report failure here */
+		sbl_dev_err(sbl->dev, "%d: check/fix: fw flash failed [%d]\n",
+			    port_num, err);
+		link->sstate = SBL_SERDES_STATUS_ERROR;
+	}
+	return err;
+}
+
+static int sbl_link_get_mode_electrical(struct sbl_inst *sbl, int port_num)
+{
+	sbl_dev_dbg(sbl->dev, "bl %d: elec get mode", port_num);
+
+	return sbl_link_autoneg(sbl, port_num);
+}
+
+/* For now we will just use the configured speed */
+static int sbl_link_get_mode_optical(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: optical link - fixing speed to config value (%s)\n",
+		    port_num, sbl_link_mode_str(link->blattr.link_mode));
+	link->link_mode = link->blattr.link_mode;
+
+	return 0;
+}
+
+/* determine the link mode (speed) */
+static int sbl_base_link_get_mode(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int err = 0;
+
+	/* determine required mode */
+	if (link->loopback_mode == SBL_LOOPBACK_MODE_LOCAL) {
+		/* directly use the mode specified - no media check */
+		link->link_mode = link->blattr.link_mode;
+		return 0;
+	}
+
+	switch (link->mattr.media) {
+
+	case SBL_LINK_MEDIA_ELECTRICAL:
+		err = sbl_link_get_mode_electrical(sbl, port_num);
+		break;
+
+	case SBL_LINK_MEDIA_OPTICAL:
+		err = sbl_link_get_mode_optical(sbl, port_num);
+		break;
+
+	default:
+		sbl_dev_err(sbl->dev, "bl %d: bad media to determine mode", port_num);
+		err = -ENOMEDIUM;
+		break;
+	}
+	if (err)
+		return err;
+
+	/* ensure the media supports the required mode */
+	if (!sbl_media_check_mode_supported(sbl, port_num, link->link_mode)) {
+		sbl_dev_err(sbl->dev, "bl %d: config mode (%s) not supported by media",
+			    port_num, sbl_link_mode_str(link->blattr.link_mode));
+		return -EMEDIUMTYPE;
+	} else
+		return 0;
+}
+
+/* return true if get_mode failed because autoneg timed out */
+static bool sbl_base_link_an_timed_out(struct sbl_inst *sbl, int port_num, int err)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (err != -ETIME)
+		return false;
+
+	if (link->mattr.media != SBL_LINK_MEDIA_ELECTRICAL)
+		return false;
+
+	if (link->blattr.pec.an_mode == SBL_AN_MODE_OFF)
+		return false;
+
+	return true;
+}
+
+static int sbl_link_fault_monitor_start(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 err_flags;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
+	if (SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX_UNLIMITED)
+		err_flags = SBL_PML_FAULT_ERR_FLAGS;
+	else
+		err_flags = SBL_PML_REC_FAULT_ERR_FLAGS;
+
+	/* make sure we have not already had an error */
+	if (sbl_pml_err_flgs_test(sbl, port_num, err_flags)) {
+		sbl_dev_err(sbl->dev, "fm %d: start - errors already present\n",
+			    port_num);
+		err = -ENETDOWN;
+		goto out;
+	}
+
+	sbl_pml_recovery_enable(sbl, port_num);
+
+	err = sbl_pml_install_intr_handler(sbl, port_num, err_flags);
+	if (err) {
+		sbl_dev_err(sbl->dev, "fm %d: intr install failed [%d]\n", port_num, err);
+		goto out;
+	}
+
+	err = sbl_pml_enable_intr_handler(sbl, port_num, err_flags);
+	if (err) {
+		sbl_dev_err(sbl->dev, "fm %d: intr enable failed [%d]\n", port_num, err);
+		goto out_uninstall;
+		return err;
+	}
+
+	if (sbl_pml_err_flgs_test(sbl, port_num, err_flags)) {
+		sbl_dev_err(sbl->dev, "fm %d: link down during start\n", port_num);
+		err = -ENETDOWN;
+		goto out_disable;
+	} else {
+		/* all up and running */
+		sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_FAULT_MON);
+	}
+	return 0;
+
+out_disable:
+	sbl_pml_disable_intr_handler(sbl, port_num, err_flags);
+out_uninstall:
+	sbl_pml_remove_intr_handler(sbl, port_num);
+out:
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_FAULT_MON);
+
+	return err;
+}
+
+static int sbl_link_fault_monitor_stop(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 err_flags;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
+	if (SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX_UNLIMITED)
+		err_flags = SBL_PML_FAULT_ERR_FLAGS;
+	else
+		err_flags = SBL_PML_REC_FAULT_ERR_FLAGS;
+
+	err = sbl_pml_disable_intr_handler(sbl, port_num, err_flags);
+	if (err) {
+		sbl_dev_err(sbl->dev, "fm %d: intr disable failed [%d]\n", port_num, err);
+		return err;
+	}
+
+	err = sbl_pml_remove_intr_handler(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "fm %d: intr remove failed [%d]\n", port_num, err);
+		return err;
+	}
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_FAULT_MON);
+	return 0;
+}
+
+static void sbl_base_link_report_err(struct sbl_inst *sbl, char *txt, int port_num, int err)
+{
+	switch (err) {
+	case -ECANCELED:
+		sbl_dev_dbg(sbl->dev, "bl %d: %s cancelled\n", port_num, txt);
+		break;
+	case -ETIMEDOUT:
+		sbl_dev_dbg(sbl->dev, "bl %d: %s timed out\n", port_num, txt);
+		break;
+	default:
+		sbl_dev_err(sbl->dev, "bl %d: %s failed [%d]\n", port_num, txt, err);
+	}
+}
+
+/**
+ * sbl_get_lp_subtype() - Get link partner sub type
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @lp_subtype: Value to get Link partner subtype
+ *
+ * This function reads the versions used (cas(v1/v2))
+ * which refers to link partner sub type. Client driver
+ * uses this information for later process
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_get_lp_subtype(struct sbl_inst *sbl, int port_num, enum sbl_lp_subtype *lp_subtype)
+{
+	int              err;
+	struct sbl_link *link;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	if (lp_subtype == NULL)
+		return -EINVAL;
+
+	sbl_dev_dbg(sbl->dev, "%d: get lp subtype", port_num);
+
+	link = sbl->link + port_num;
+
+	*lp_subtype = link->lp_subtype;
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_get_lp_subtype);
+
+/**
+ * sbl_base_link_config() - config base link
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @blattr: Pointer to struct sbl_base_link_attr
+ *
+ * Set base link config based on attributes provided
+ *
+ * Context: Process context, Acquires lock and release link->lock <spin_lock>
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_base_link_config(struct sbl_inst *sbl, int port_num, struct sbl_base_link_attr *blattr)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: config\n", port_num);
+
+	if (!blattr)
+		return -EINVAL;
+
+	if (blattr->magic != SBL_LINK_ATTR_MAGIC)
+		return -EINVAL;
+
+	link = sbl->link + port_num;
+
+	spin_lock(&link->lock);
+
+	if (!(link->blstate & (SBL_BASE_LINK_STATUS_DOWN | SBL_BASE_LINK_STATUS_UNCONFIGURED))) {
+
+		sbl_dev_err(sbl->dev, "bl %d: wrong state (%s) for config", port_num,
+			    sbl_link_state_str(link->blstate));
+		spin_unlock(&link->lock);
+		return -EUCLEAN;
+	}
+
+	memcpy(&link->blattr, blattr, sizeof(struct sbl_base_link_attr));
+
+	link->blconfigured = true;
+
+	if (link->blattr.loopback_mode == SBL_LOOPBACK_MODE_LOCAL) {
+		/* we dont need media to go to down */
+		link->blstate = SBL_BASE_LINK_STATUS_DOWN;
+	} else if (link->mconfigured) {
+		/* we need media as well if not loopback */
+		link->blstate = SBL_BASE_LINK_STATUS_DOWN;
+	}
+
+	spin_unlock(&link->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_base_link_config);
+
+/**
+ * sbl_base_link_start() - Initialize and bring up links
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function performs full sequence to bring up serdes link.
+ * It handles firmware validation, link mode detection, alignment,
+ * SerDes startup and link integrity checks. This process ensures
+ * link partner is detected and all lanes are properly initialized
+ * and active before reporting the link is up
+ *
+ * Context: Process, May sleep. Uses mutex_lock_interruptible
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_base_link_start(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+	int tmp_err;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 cfg_pcs_reg;
+	u64 sts_pcs_lane_degrade_reg;
+	struct lane_degrade lanes;
+	u32 ucw_adj = 100;
+	u32 ccw_adj = 0;
+	s32 ucw_in = SBL_LINK_FEC_HPE;
+	s32 ccw_in = SBL_LINK_FEC_HPE;
+	struct sbl_link *link;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: start\n", port_num);
+
+	link = sbl->link + port_num;
+
+	err = mutex_lock_interruptible(&link->busy_mtx);
+	if (err)
+		return -ERESTARTSYS;
+
+	if (link->blstate == SBL_BASE_LINK_STATUS_UP) {
+		/* link came up while waiting for the mutex */
+		mutex_unlock(&link->busy_mtx);
+		return 0;
+	}
+
+	if (link->blstate != SBL_BASE_LINK_STATUS_DOWN) {
+
+		sbl_dev_err(sbl->dev, "bl %d: wrong state (%s) for start", port_num,
+			    sbl_link_state_str(link->blstate));
+		mutex_unlock(&link->busy_mtx);
+		return -EUCLEAN;
+	}
+
+	/* only local loopback is possible without media */
+	if (link->blattr.loopback_mode != SBL_LOOPBACK_MODE_LOCAL) {
+		err = sbl_media_validate_config(sbl, port_num);
+		if (err) {
+			sbl_dev_err(sbl->dev, "bl %d: config unsuitable for media type", port_num);
+			mutex_unlock(&link->busy_mtx);
+			return err;
+		}
+	}
+
+	link->blstate = SBL_BASE_LINK_STATUS_STARTING;
+
+	/* check for loopback mode change */
+	if (link->blattr.loopback_mode != link->loopback_mode)
+		link->llr_loop_time = 0;
+	link->loopback_mode = link->blattr.loopback_mode;
+
+	/* setup the timeout for start to complete
+	 * (autoneg might modify this later)
+	 */
+	sbl_link_init_start_timeout(sbl, port_num);
+
+	/* clear out any residual pcs state */
+	sbl_pml_set_defaults(sbl, port_num);
+
+	/* reset state */
+	link->lp_detected = false;
+
+	/* validate serdes firmwares are (still) uncorrupted, recover them if
+	 * needed
+	 */
+	err = sbl_base_link_check_fix_fw(sbl, port_num);
+	if (err) {
+		sbl_base_link_report_err(sbl, "ensure_healthly", port_num, err);
+		goto out;
+	}
+
+	/* determine the link mode
+	 * this may do autoneg for electrical links
+	 */
+	err = sbl_base_link_get_mode(sbl, port_num);
+	if (err) {
+		if (sbl_base_link_an_timed_out(sbl, port_num, err))
+			sbl_dev_dbg(sbl->dev, "bl %d: autoneg timeout", port_num);
+		else
+			sbl_base_link_report_err(sbl, "get_mode", port_num, err);
+		goto out;
+	}
+
+	/* start sending alignment markers for lp to tune against */
+	err = sbl_pml_pcs_am_start(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "bl %d: am_start failed [%d]\n", port_num, err);
+		goto out;
+	}
+
+	/* wait until we detect the link partner */
+	err = sbl_base_link_lp_detect(sbl, port_num);
+	if (err) {
+		sbl_base_link_report_err(sbl, "lpd", port_num, err);
+		goto out;
+	}
+
+	/* record when we really start to bring up the link */
+	sbl_link_up_begin(sbl, port_num);
+
+	/* start the serdes */
+	err = sbl_serdes_start(sbl, port_num);
+	if (err) {
+		sbl_base_link_report_err(sbl, "serdes_start", port_num, err);
+		goto out;
+	}
+
+	/* start the pml block (pcs,mac,llr) */
+	err = sbl_pml_start(sbl, port_num);
+	if (err) {
+		sbl_base_link_report_err(sbl, "pml_start", port_num, err);
+		goto out_serdes;
+	}
+
+	/* clearing fec values before start */
+	sbl_zero_all_fec_counts(sbl, port_num);
+
+	/* setup thresholds and adjustments for fec monitoring */
+	err = sbl_fec_thresholds_set(sbl, port_num, ucw_in, ccw_in);
+	if (err) {
+		sbl_dev_err(sbl->dev, "%d: setting fec thresholds failed [%d]",
+			    port_num, err);
+		goto out_pcs;
+	}
+
+	err = sbl_fec_adjustments_set(sbl, port_num, ucw_adj, ccw_adj);
+	if (err) {
+		sbl_dev_err(sbl->dev, "%d: setting fec adjustments failed [%d]",
+			    port_num, err);
+		goto out_pcs;
+	}
+
+	/* start fec checking */
+	err = sbl_fec_up_check(sbl, port_num);
+	if (err) {
+		unsigned long flags;
+
+		sbl_serdes_invalidate_tuning_params(sbl, port_num);
+		sbl_dev_info(sbl->dev, "%d: failed start fec check", port_num);
+
+		/* SSHOTPLAT-5697 forces a maximum effort tune
+		 * straight away after FEC up check fails.
+		 */
+		sbl_dev_dbg(sbl->dev, "bl %d: forcing a maximum effort tune for next retry", port_num);
+		spin_lock_irqsave(&link->lock, flags);
+		link->blattr.options |= SBL_OPT_DFE_ALWAYS_MAX_EFFORT;
+		spin_unlock_irqrestore(&link->lock, flags);
+
+		goto out_pcs;
+	}
+
+	/* start monitoring for link faults */
+	err = sbl_link_fault_monitor_start(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "bl %d: link fault detect start failed [%d]\n", port_num, err);
+		goto out_pcs;
+	}
+
+	/* final check the link is still up and all lanes remain active */
+	if (!sbl_pml_pcs_up(sbl, port_num)) {
+		sbl_dev_err(sbl->dev, "bl %d: link failed during startup\n", port_num);
+		err = -ENETDOWN;
+		goto out_fm;
+	}
+
+	cfg_pcs_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	if (SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(cfg_pcs_reg)) {
+
+		sts_pcs_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_LANE_DEGRADE_OFFSET);
+		lanes.tx = SBL_PML_STS_PCS_LANE_DEGRADE_LP_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg);
+		lanes.rx = SBL_PML_STS_PCS_LANE_DEGRADE_RX_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg);
+
+		if (lanes.tx != SBL_LINK_ALL_LANES || lanes.rx != SBL_LINK_ALL_LANES) {
+			sbl_dev_err(sbl->dev, "bl %d: lane failed during startup - TX: 0x%llx - RX: 0x%llx",
+				    port_num, lanes.tx, lanes.rx);
+			err = -ENETDOWN;
+			goto out_fm;
+		}
+	}
+
+	/* success ! */
+	sbl_link_up_record_timespec(sbl, port_num);
+	sbl_link_start_record_timespec(sbl, port_num);
+
+	link->blstate = SBL_BASE_LINK_STATUS_UP;
+	link->blerr = 0;
+
+	sbl_dev_dbg(sbl->dev, "starting timer port_num:%d ", port_num);
+	sbl_fec_monitor_start(sbl, port_num);
+	mutex_unlock(&link->busy_mtx);
+
+	return 0;
+
+	/* failed */
+out_fm:
+	sbl_link_fault_monitor_stop(sbl, port_num);
+out_pcs:
+	if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP))
+		sbl_pml_link_down(sbl, port_num);
+out_serdes:
+	if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP))
+		sbl_serdes_stop(sbl, port_num);
+out:
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP) ||
+	    sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_RELOAD_FW))
+		link->reload_serdes_fw = false;
+	else if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_RELOAD_FW))
+		link->reload_serdes_fw = true;
+
+	if (link->reload_serdes_fw) {
+		sbl_dev_info(sbl->dev, "bl %d: reloading serdes fw\n", port_num);
+		tmp_err = sbl_serdes_firmware_flash_safe(sbl, port_num, true);
+		if (tmp_err) {
+			/* All we can do is report failure here */
+			sbl_dev_err(sbl->dev, "bl %d: fw flash failed [%d]\n",
+				    port_num, tmp_err);
+			link->sstate = SBL_SERDES_STATUS_ERROR;
+		} else
+			link->sstate = SBL_SERDES_STATUS_DOWN;
+		link->serr = tmp_err;
+		link->reload_serdes_fw = false;
+	}
+	link->blstate = SBL_BASE_LINK_STATUS_ERROR;
+	link->blerr = err;
+	mutex_unlock(&link->busy_mtx);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_base_link_start);
+
+/**
+ * sbl_ignore_save_tuning_param() - Config ignore save tuning parameters
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @ignore: If set then ignore save tuning
+ *
+ * This function performs the Load saved tuning params before tuning
+ * when 'ignore' is set false from caller.
+ */
+void sbl_ignore_save_tuning_param(struct sbl_inst *sbl, int port_num, bool ignore)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	if (ignore)
+		link->blattr.options &= ~SBL_OPT_USE_SAVED_PARAMS;
+	else
+		link->blattr.options |= SBL_OPT_USE_SAVED_PARAMS;
+	spin_unlock_irqrestore(&link->lock, flags);
+}
+EXPORT_SYMBOL(sbl_ignore_save_tuning_param);
+
+/**
+ * sbl_enable_opt_lane_degrade() - Enable opt lane degrade
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @enable: if set then enable OPT LANE DEGRADE
+ *
+ * This function performs enable auto lane degrade when
+ * 'enable' is set from the caller
+ */
+void sbl_enable_opt_lane_degrade(struct sbl_inst *sbl, int port_num, bool enable)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	if (enable)
+		link->blattr.options |= SBL_OPT_LANE_DEGRADE;
+	else
+		link->blattr.options &= ~SBL_OPT_LANE_DEGRADE;
+	spin_unlock_irqrestore(&link->lock, flags);
+}
+EXPORT_SYMBOL(sbl_enable_opt_lane_degrade);
+
+/**
+ * sbl_disable_pml_recovery() - Disable PML recovery
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @disable: if set, then disable PML recovery
+ *
+ * This function performs disable PML recovery
+ * when 'disable' is set from the caller
+ */
+void sbl_disable_pml_recovery(struct sbl_inst *sbl, int port_num, bool disable)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	if (disable)
+		link->blattr.options |= SBL_DISABLE_PML_RECOVERY;
+	else
+		link->blattr.options &= ~SBL_DISABLE_PML_RECOVERY;
+	spin_unlock_irqrestore(&link->lock, flags);
+}
+EXPORT_SYMBOL(sbl_disable_pml_recovery);
+
+/**
+ * sbl_set_degraded_flag() - Set degraded flag
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and releases is_degraded_lock <spin_lock>
+ */
+void sbl_set_degraded_flag(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	spin_lock(&link->is_degraded_lock);
+	link->is_degraded = true;
+	spin_unlock(&link->is_degraded_lock);
+}
+EXPORT_SYMBOL(sbl_set_degraded_flag);
+
+/**
+ * sbl_clear_degraded_flag() - Clear degraded flag
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and releases is_degraded_lock <spin_lock>
+ */
+void sbl_clear_degraded_flag(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	spin_lock(&link->is_degraded_lock);
+	link->is_degraded = false;
+	spin_unlock(&link->is_degraded_lock);
+}
+EXPORT_SYMBOL(sbl_clear_degraded_flag);
+
+/**
+ * sbl_get_degraded_flag() - Get degraded flag
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and releases is_degraded_lock <spin_lock>
+ *
+ * Return: status of degraded flag
+ */
+bool sbl_get_degraded_flag(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	bool degraded_flag;
+
+	spin_lock(&link->is_degraded_lock);
+	degraded_flag = link->is_degraded;
+	spin_unlock(&link->is_degraded_lock);
+
+	return degraded_flag;
+}
+EXPORT_SYMBOL(sbl_get_degraded_flag);
+
+/**
+ * sbl_base_link_enable_start() - Enable base link start
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and releases link->lock <spin_lock>
+ *
+ * Return: 0
+ */
+int sbl_base_link_enable_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: enable start\n", port_num);
+
+	spin_lock(&link->lock);
+	link->start_cancelled = false;
+	spin_unlock(&link->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_base_link_enable_start);
+
+/**
+ * sbl_base_link_cancel_start() - Cancel base link start
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and releases link->lock <spin_lock>
+ *
+ * Return: 0
+ */
+int sbl_base_link_cancel_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: cancelling start\n", port_num);
+
+	spin_lock(&link->lock);
+	link->start_cancelled = true;
+	complete_all(&link->an_hw_change);
+	spin_unlock(&link->lock);
+	sbl_fec_monitor_stop(sbl, port_num);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_base_link_cancel_start);
+
+bool sbl_base_link_start_cancelled(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	bool cancelled;
+
+	spin_lock(&link->lock);
+	cancelled = link->start_cancelled;
+	spin_unlock(&link->lock);
+
+	return cancelled;
+}
+
+/**
+ * sbl_base_link_stop() - Stop base link
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function cleanly shuts down previously initialized
+ * SerDes link, link monitoring and stops the PML block.
+ *
+ * Context: Process, May sleep. Uses mutex_lock_interruptible
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_base_link_stop(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: stop", port_num);
+
+	link = sbl->link + port_num;
+
+	err = mutex_lock_interruptible(&link->busy_mtx);
+	if (err)
+		return -ERESTARTSYS;
+
+	sbl_fec_monitor_stop(sbl, port_num);
+
+	if (link->blstate == SBL_BASE_LINK_STATUS_DOWN) {
+		/* link went down while waiting for the mutex */
+		mutex_unlock(&link->busy_mtx);
+		return 0;
+	}
+
+	if (link->blstate != SBL_BASE_LINK_STATUS_UP) {
+		sbl_dev_err(sbl->dev, "bl %d: not up (%s) for stop - ignored", port_num,
+			    sbl_link_state_str(link->blstate));
+		mutex_unlock(&link->busy_mtx);
+		return -EBUSY;
+	}
+
+	/* if keeping serdes up, don't change state to stopping */
+	if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_KEEP_SERDES_UP))
+		link->blstate = SBL_BASE_LINK_STATUS_STOPPING;
+
+	/* We stop the serdes before stopping the pml to avoid breaking AOC firmware,
+	 * really we should stop the pml first. This should be harmless provided
+	 * down detection is off.
+	 */
+	err = sbl_link_fault_monitor_stop(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "bl %d: link_fault_monitor_stop failed [%d]", port_num, err);
+		goto out;
+	}
+
+	sbl_pml_recovery_cancel(sbl, port_num);
+
+	err = sbl_serdes_stop(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "bl %d: serdes_stop failed [%d]", port_num, err);
+		goto out;
+	}
+
+	err = sbl_pml_link_down(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "bl %d: pml_link_down failed [%d]", port_num, err);
+		goto out;
+	}
+
+out:
+	spin_lock(&link->lock);
+	if (err)
+		link->blstate = SBL_BASE_LINK_STATUS_ERROR;
+	/* if keep serdes up, don't change state to down */
+	else if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_KEEP_SERDES_UP))
+		link->blstate = SBL_BASE_LINK_STATUS_DOWN;
+	link->blerr = err;
+	spin_unlock(&link->lock);
+
+	mutex_unlock(&link->busy_mtx);
+
+	sbl_dev_dbg(sbl->dev, "bl %d: stop done", port_num);
+
+	return link->blerr;
+}
+EXPORT_SYMBOL(sbl_base_link_stop);
+
+/**
+ * sbl_base_link_reset() - Reset base link
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function resets the base link by disabling
+ * pml interrupt handlers, resets serdes and PML block.
+ *
+ * Context: Process, May sleep. Uses mutex_lock_interruptible
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_base_link_reset(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: reset\n", port_num);
+
+	link = sbl->link + port_num;
+
+	err = mutex_lock_interruptible(&link->busy_mtx);
+	if (err)
+		return -ERESTARTSYS;
+
+	sbl_fec_monitor_stop(sbl, port_num);
+
+	link->blstate = SBL_BASE_LINK_STATUS_RESETTING;
+
+	/* disable and remove any pml intr handlers */
+	if (link->intr_err_flgs) {
+		sbl_pml_disable_intr_handler(sbl, port_num, link->intr_err_flgs);
+		sbl_pml_remove_intr_handler(sbl, port_num);
+		link->intr_err_flgs = 0;
+	}
+
+	sbl_pml_recovery_cancel(sbl, port_num);
+
+	err = sbl_serdes_reset(sbl, port_num);
+	if (err)
+		sbl_dev_err(sbl->dev, "bl %d: reset: serdes_reset failed [%d]", port_num, err);
+
+	err = sbl_pml_link_down(sbl, port_num);
+	if (err)
+		sbl_dev_warn(sbl->dev, "bl %d: reset: pcs_link_down failed [%d]", port_num, err);
+
+	link->blstate = SBL_BASE_LINK_STATUS_UNCONFIGURED;
+	link->blerr = 0;
+	link->blconfigured = false;
+	link->pcs_config = false;
+	link->llr_loop_time = 0;
+	link->start_cancelled = false;
+	WRITE_ONCE(link->link_info, 0);
+	link->lp_subtype = SBL_LP_SUBTYPE_INVALID;
+	/* dont reset media attribute */
+
+	/* reset hw */
+	sbl_pml_set_defaults(sbl, port_num);
+
+	sbl_pml_err_flgs_clear_all(sbl, port_num);
+
+	mutex_unlock(&link->busy_mtx);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_base_link_reset);
+
+/**
+ * sbl_base_link_try_start_fail_cleanup() - Clean up resources
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Try to clear any error states that are non-fatal so we can directly
+ * attempt another start up.
+ *
+ * Context: Process, May sleep. Uses mutex_lock_interruptible
+ */
+void sbl_base_link_try_start_fail_cleanup(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return;
+
+	sbl_dev_dbg(sbl->dev, "bl %d: try start fail cleanup\n", port_num);
+
+	link = sbl->link + port_num;
+
+	err = mutex_lock_interruptible(&link->busy_mtx);
+	if (err)
+		return;
+
+	/* disable and remove any pml intr handlers */
+	if (link->intr_err_flgs) {
+		sbl_pml_disable_intr_handler(sbl, port_num, link->intr_err_flgs);
+		sbl_pml_remove_intr_handler(sbl, port_num);
+		link->intr_err_flgs = 0;
+	}
+
+	/* when debugging we can leave the hw in its current state */
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP)) {
+		sbl_dev_warn(sbl->dev, "%d: hw cleanup inhibited\n", port_num);
+		mutex_unlock(&link->busy_mtx);
+		return;
+	}
+
+	/* clean up the serdes state
+	 * We have to do this before resetting the PML or the optical transceivers can
+	 * fail.
+	 */
+	switch (link->sstate) {
+	case SBL_SERDES_STATUS_RUNNING:
+		sbl_serdes_stop(sbl, port_num);
+		break;
+	case SBL_SERDES_STATUS_AUTONEG:
+		sbl_an_serdes_stop(sbl, port_num);
+		break;
+	default:
+		break;
+	}
+
+	/* still not down! */
+	if (link->sstate != SBL_SERDES_STATUS_DOWN)
+		sbl_serdes_reset(sbl, port_num);
+
+	/* some errors we can clean up and move to down so
+	 * we can try to come up again directly
+	 */
+	if (link->blstate == SBL_BASE_LINK_STATUS_ERROR) {
+		switch (link->blerr) {
+
+		case -EADV:          /* pcs startup saw high serdes error rate */
+		case -EBADE:         /* bad page exchange during auto neg */
+		case -ENETDOWN:      /* pcs dropped out after starting */
+		case -ECHRNG:        /* serdes eye heights went bad during pcs startup */
+		case -ELNRNG:        /* unable to tune properly */
+			sbl_serdes_invalidate_all_tuning_params(sbl);
+			fallthrough;
+		case -ETIME:
+		case -ETIMEDOUT:
+		case -EOVERFLOW:
+		case -ECANCELED:
+		case -ENOSR:         /* llr failed to start */
+
+			link->blstate = SBL_BASE_LINK_STATUS_DOWN;
+			link->blerr = 0;
+			link->pcs_config = false;
+			link->llr_loop_time = 0;
+			link->start_cancelled = false;
+
+			sbl_pml_link_down(sbl, port_num);
+			sbl_pml_set_defaults(sbl, port_num);
+			break;
+
+		default:
+			sbl_dev_err(sbl->dev, "%d: start fail cleanup not clearing err %d\n",
+				    port_num, link->blerr);
+			break;
+		}
+	}
+
+	mutex_unlock(&link->busy_mtx);
+}
+EXPORT_SYMBOL(sbl_base_link_try_start_fail_cleanup);
+
+/**
+ * sbl_base_link_get_status() - Get link status
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @blstate: link state
+ * @blerr: link err
+ * @sstate: state
+ * @serr: err
+ * @media_type: media type
+ * @link_mode: link mode
+ *
+ * This function gets base link status from params
+ * used
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_base_link_get_status(struct sbl_inst *sbl, int port_num,
+			     int *blstate, int *blerr, int *sstate, int *serr,
+		int *media_type, int *link_mode)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	link = sbl->link + port_num;
+
+	if (blstate)
+		*blstate = link->blstate;
+	if (blerr)
+		*blerr = link->blerr;
+	if (sstate)
+		*sstate = link->sstate;
+	if (serr)
+		*serr = link->serr;
+	if (media_type)
+		*media_type = link->mattr.media;
+
+	if (link_mode) {
+		if (link->sstate == SBL_SERDES_STATUS_RUNNING)
+			*link_mode = link->link_mode;            /* actual mode */
+		else
+			*link_mode = link->blattr.link_mode;     /* target mode */
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_base_link_get_status);
+
+/**
+ * sbl_base_link_state_str() - Read the state of the pcs and serdes
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @len: Length of data to write
+ *
+ * This function reads the state of pcs and serdes
+ * and return in the string format
+ *
+ * Return: Number of characters written on success
+ */
+char *sbl_base_link_state_str(struct sbl_inst *sbl, int port_num, char *buf, int len)
+{
+	char pcs_buf[SBL_PCS_STATE_STR_LEN];
+	u8 not_idle_map;  /* not signalling electrical idle */
+	u8 good_eyes_map;
+	u8 active_map;
+
+	if (!buf || !len)
+		return "";
+
+	sbl_pml_pcs_state_str(sbl, port_num, pcs_buf, SBL_PCS_STATE_STR_LEN);
+
+	if (sbl_port_get_serdes_state_maps(sbl, port_num, &active_map,
+					   &not_idle_map, &good_eyes_map)) {
+		/* only active map unavailable */
+		snprintf(buf, len, "pcs %s, serdes -,-/%x", pcs_buf, active_map);
+	} else
+		snprintf(buf, len, "pcs %s, serdes %x,%x/%x", pcs_buf,
+			 not_idle_map, good_eyes_map, active_map);
+
+	return buf;
+}
+EXPORT_SYMBOL(sbl_base_link_state_str);
+
+/**
+ * sbl_link_get_ucw_thresh_hpe() - uncorrected codeword thresholds(hpe)
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function reads ucw(hpe) based on link mode
+ *
+ * Return: Threshold value on success, 0 on failure.
+ */
+u64  sbl_link_get_ucw_thresh_hpe(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* return a little under 1e-10 for all modes and cable types */
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		return 21;
+	case SBL_LINK_MODE_BJ_100G:
+	case SBL_LINK_MODE_CD_100G:
+		return 11;
+	case SBL_LINK_MODE_CD_50G:
+		return 5;
+	default:
+		sbl_dev_err(sbl->dev, "%d: cannot determine ucw rate", port_num);
+		return 0;
+	}
+}
+EXPORT_SYMBOL(sbl_link_get_ucw_thresh_hpe);
+
+/**
+ * sbl_link_get_ucw_thresh_ieee() - uncorrected codeword thresholds(ieee)
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function reads ucw(ieee).
+ *
+ * Return: Threshold value on success, 0 on failure.
+ */
+u64  sbl_link_get_ucw_thresh_ieee(struct sbl_inst *sbl, int port_num)
+{
+	/* currently these are the same as the hpe values */
+	return sbl_link_get_ucw_thresh_hpe(sbl, port_num);
+}
+EXPORT_SYMBOL(sbl_link_get_ucw_thresh_ieee);
+
+/**
+ * sbl_link_get_ccw_thresh_hpe() - corrected codeword thresholds
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function reads ccw(hpe) based on link mode
+ *
+ * Return: Threshold value on success, 0 on failure.
+ */
+u64  sbl_link_get_ccw_thresh_hpe(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* for electrical links use a threshold of 1.e-5
+	 * (we consider loopback links to be electrical)
+	 */
+	if ((link->mattr.media == SBL_LINK_MEDIA_ELECTRICAL) ||
+	    (link->loopback_mode == SBL_LOOPBACK_MODE_LOCAL)) {
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			return 21250000;
+		case SBL_LINK_MODE_BJ_100G:
+			return 10312500;
+		case SBL_LINK_MODE_CD_100G:
+			return 10625000;
+		case SBL_LINK_MODE_CD_50G:
+			return 5312500;
+		default:
+			sbl_dev_err(sbl->dev, "%d: cannot determine PEC ccw rate", port_num);
+			return 0;
+		}
+
+	}
+
+	/* optical links seem to require a threshold of about 4e-5
+	 * (otherwise pcal can sometimes take us over the threshold)
+	 */
+	if (link->mattr.media == SBL_LINK_MEDIA_OPTICAL) {
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			return 85000000;
+		case SBL_LINK_MODE_BJ_100G:
+			return 41250000;
+		case SBL_LINK_MODE_CD_100G:
+			return 42500000;
+		case SBL_LINK_MODE_CD_50G:
+			return 21250000;
+		default:
+			sbl_dev_err(sbl->dev, "%d: cannot determine AOC ccw rate", port_num);
+			return 0;
+		}
+	}
+
+	/* dont recognise media */
+	sbl_dev_err(sbl->dev, "%d: cannot determine ccw rate - unrecognised media", port_num);
+	return 0;
+}
+EXPORT_SYMBOL(sbl_link_get_ccw_thresh_hpe);
+
+/**
+ * sbl_link_get_ccw_thresh_ieee() - Get correcred code words threshold
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function reads ccw(ieee) based on link mode
+ *
+ * Return: Threshold value on success, 0 on failure.
+ */
+u64  sbl_link_get_ccw_thresh_ieee(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* ieee thresholds are about 2e-4
+	 * We dont care about media type
+	 */
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		return 42500000;
+	case SBL_LINK_MODE_BJ_100G:
+	case SBL_LINK_MODE_CD_100G:
+		return 21250000;
+	case SBL_LINK_MODE_CD_50G:
+		return 10625000;
+	default:
+		sbl_dev_err(sbl->dev, "%d: cannot determine ccw rate", port_num);
+		return 0;
+	}
+}
+EXPORT_SYMBOL(sbl_link_get_ccw_thresh_ieee);
+
+/**
+ * sbl_link_get_stp_ccw_thresh_hpe() - Get Corrected code words(hpe) threshold
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Get Corrected code words(hpe) threshold when STP is used
+ *
+ * Return: Threshold value on success, 0 on failure.
+ */
+u64  sbl_link_get_stp_ccw_thresh_hpe(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* for electrical links use a threshold of 1.e-8
+	 * (we consider loopback links to be electrical)
+	 */
+	if ((link->mattr.media == SBL_LINK_MEDIA_ELECTRICAL) ||
+	    (link->loopback_mode == SBL_LOOPBACK_MODE_LOCAL)) {
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			return 2125;
+		case SBL_LINK_MODE_BJ_100G:
+			return 1031;
+		case SBL_LINK_MODE_CD_100G:
+			return 1062;
+		case SBL_LINK_MODE_CD_50G:
+			return 531;
+		default:
+			sbl_dev_err(sbl->dev, "%d: cannot determine PEC stp ccw rate", port_num);
+			return 0;
+		}
+
+	}
+
+	/* optical links seem to require a threshold of about 4e-8
+	 * (otherwise pcal can sometimes take us over the threshold)
+	 */
+	if (link->mattr.media == SBL_LINK_MEDIA_OPTICAL) {
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			return 8500;
+		case SBL_LINK_MODE_BJ_100G:
+			return 4125;
+		case SBL_LINK_MODE_CD_100G:
+			return 4250;
+		case SBL_LINK_MODE_CD_50G:
+			return 2125;
+		default:
+			sbl_dev_err(sbl->dev, "%d: cannot determine AOC stp ccw rate", port_num);
+			return 0;
+		}
+	}
+
+	/* dont recognise media */
+	sbl_dev_err(sbl->dev, "%d: cannot determine stp ccw rate - unrecognised media", port_num);
+	return 0;
+}
+EXPORT_SYMBOL(sbl_link_get_stp_ccw_thresh_hpe);
+
+/**
+ * sbl_link_get_stp_ccw_thresh_ieee() - Get corrected code word(ieee) threshold
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Get Corrected code words(ieee) threshold when STP is used
+ *
+ * Return: Threshold value on success, 0 on failure.
+ */
+u64  sbl_link_get_stp_ccw_thresh_ieee(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* ieee thresholds are about 2e-8
+	 * We dont care about media type
+	 */
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		return 4250;
+	case SBL_LINK_MODE_BJ_100G:
+	case SBL_LINK_MODE_CD_100G:
+		return 2125;
+	case SBL_LINK_MODE_CD_50G:
+		return 1062;
+	default:
+		sbl_dev_err(sbl->dev, "%d: cannot determine stp ccw rate", port_num);
+		return 0;
+	}
+}
+EXPORT_SYMBOL(sbl_link_get_stp_ccw_thresh_ieee);
+
+/* Link info
+ * lets you see the current state of the link
+ *
+ * Atomic mask updates preserve concurrently changed flags.
+ */
+void sbl_link_info_set(struct sbl_inst *sbl, int port_num, u32 flag)
+{
+	switch (flag) {
+
+	case SBL_LINK_INFO_LP_DET:
+	case SBL_LINK_INFO_PCS_ANEG:
+	case SBL_LINK_INFO_PCS_TX_AM:
+	case SBL_LINK_INFO_PCS_TX_RF:
+	case SBL_LINK_INFO_PCS_ALIGN_EN:
+	case SBL_LINK_INFO_PCS_A_WAIT:
+	case SBL_LINK_INFO_PCS_F_WAIT:
+	case SBL_LINK_INFO_PCS_UP:
+	case SBL_LINK_INFO_MAC_OP:
+	case SBL_LINK_INFO_OS:
+	case SBL_LINK_INFO_LLR_LOOP:
+	case SBL_LINK_INFO_LLR_MEASURE:
+	case SBL_LINK_INFO_LLR_WAIT:
+	case SBL_LINK_INFO_LLR_RUN:
+	case SBL_LINK_INFO_LLR_DISABLED:
+	case SBL_LINK_INFO_FAULT_MON:
+	case SBL_LINK_INFO_LLR_DETECT:
+		set_mask_bits(&sbl->link[port_num].link_info, 0, flag);
+		break;
+
+	default:
+		sbl_dev_dbg(sbl->dev, "bl %d: unrecognised set info flag (%d)\n",
+			    port_num, flag);
+		break;
+	}
+}
+
+void sbl_link_info_clear(struct sbl_inst *sbl, int port_num, u32 flag)
+{
+	switch (flag) {
+
+	case SBL_LINK_INFO_LP_DET:
+	case SBL_LINK_INFO_PCS_ANEG:
+	case SBL_LINK_INFO_PCS_TX_AM:
+	case SBL_LINK_INFO_PCS_TX_RF:
+	case SBL_LINK_INFO_PCS_ALIGN_EN:
+	case SBL_LINK_INFO_PCS_A_WAIT:
+	case SBL_LINK_INFO_PCS_F_WAIT:
+	case SBL_LINK_INFO_PCS_UP:
+	case SBL_LINK_INFO_MAC_OP:
+	case SBL_LINK_INFO_OS:
+	case SBL_LINK_INFO_LLR_LOOP:
+	case SBL_LINK_INFO_LLR_MEASURE:
+	case SBL_LINK_INFO_LLR_WAIT:
+	case SBL_LINK_INFO_LLR_RUN:
+	case SBL_LINK_INFO_LLR_DISABLED:
+	case SBL_LINK_INFO_FAULT_MON:
+	case SBL_LINK_INFO_LLR_DETECT:
+		set_mask_bits(&sbl->link[port_num].link_info, flag, 0);
+		break;
+
+	default:
+		sbl_dev_dbg(sbl->dev, "bl %d: unrecognised clear info flag (%d)\n",
+			    port_num, flag);
+		break;
+	}
+}
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_base_link_sysfs_sprint() - Format link info into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * Context: Process, Acquires lock and release link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_base_link_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	bool mac_tx_op;
+	bool mac_rx_op;
+	u32 mac_ifg_mode;
+	u32 link_info;
+	u64 llr_cfg;
+	u32 llr_mode;
+	u32 llr_down_behavior;
+	u64 llr_sts;
+	int s = 0;
+
+	spin_lock(&link->lock);
+	link_info = READ_ONCE(link->link_info);
+
+	s += scnprintf(buf + s, size - s, "base link state: %s",
+			sbl_link_state_str(link->blstate));
+	if (link->blstate == SBL_BASE_LINK_STATUS_ERROR)
+		s += scnprintf(buf + s, size - s, " [%d]", link->blerr);
+	if (link->blstate == SBL_BASE_LINK_STATUS_STARTING)
+		s += scnprintf(buf + s, size - s, " (%d/%d)",
+				sbl_link_start_elapsed(sbl, port_num),
+				sbl_get_start_timeout(sbl, port_num));
+	if (link->blstate == SBL_BASE_LINK_STATUS_UP)
+		s += scnprintf(buf + s, size - s, " (%lld.%.3ld, %lld.%.3ld)",
+				(long long)link->start_time.tv_sec,
+				link->start_time.tv_nsec / 1000000,
+				(long long)link->up_time.tv_sec,
+				link->up_time.tv_nsec / 1000000);
+	s += scnprintf(buf + s, size - s, "\n");
+
+	if (link_info) {
+		s += scnprintf(buf + s, size - s, "base link info: ");
+		if (link_info & SBL_LINK_INFO_PCS_ANEG)
+			s += scnprintf(buf + s, size - s, "pcs-aneg ");
+		if (link_info & SBL_LINK_INFO_PCS_TX_AM)
+			s += scnprintf(buf + s, size - s, "pcs-tx-am ");
+		if (link_info & SBL_LINK_INFO_PCS_ALIGN_EN)
+			s += scnprintf(buf + s, size - s, "pcs-a-en ");
+		if (link_info & SBL_LINK_INFO_PCS_A_WAIT)
+			s += scnprintf(buf + s, size - s, "pcs-a-wait ");
+		if (link_info & SBL_LINK_INFO_PCS_TX_RF)
+			s += scnprintf(buf + s, size - s, "pcs-tx-rf ");
+		if (link_info & SBL_LINK_INFO_PCS_F_WAIT)
+			s += scnprintf(buf + s, size - s, "pcs-f-wait ");
+		if (link_info & SBL_LINK_INFO_PCS_UP)
+			s += scnprintf(buf + s, size - s, "pcs-up ");
+		if (link_info & SBL_LINK_INFO_LP_DET)
+			s += scnprintf(buf + s, size - s, "lp-det ");
+		if (link_info & SBL_LINK_INFO_MAC_OP)
+			s += scnprintf(buf + s, size - s, "mac ");
+		if (link_info & SBL_LINK_INFO_OS)
+			s += scnprintf(buf + s, size - s, "os ");
+		if (link_info & SBL_LINK_INFO_LLR_LOOP)
+			s += scnprintf(buf + s, size - s, "llr-loop-en ");
+		if (link_info & SBL_LINK_INFO_LLR_DETECT)
+			s += scnprintf(buf + s, size - s, "llr-detect ");
+		if (link_info & SBL_LINK_INFO_LLR_MEASURE)
+			s += scnprintf(buf + s, size - s, "llr-measure ");
+		if (link_info & SBL_LINK_INFO_LLR_WAIT)
+			s += scnprintf(buf + s, size - s, "llr-wait ");
+		if (link_info & SBL_LINK_INFO_LLR_RUN)
+			s += scnprintf(buf + s, size - s, "llr ");
+		if (link_info & SBL_LINK_INFO_LLR_DISABLED)
+			s += scnprintf(buf + s, size - s, "llr-dis ");
+		if (link_info & SBL_LINK_INFO_FAULT_MON)
+			s += scnprintf(buf + s, size - s, "fm ");
+		s += scnprintf(buf + s, size - s, "\n");
+	}
+
+	if (link->blconfigured) {
+
+		if (link->blattr.config_target == SBL_BASE_LINK_CONFIG_PEC) {
+			s += scnprintf(buf + s, size - s, "base link: an: mode %s",
+					sbl_an_mode_str(link->blattr.pec.an_mode));
+			if (link_info & SBL_LINK_INFO_PCS_ANEG) {
+				if (link->blattr.pec.an_mode == SBL_AN_MODE_FIXED)
+					s += scnprintf(buf + s, size - s, "(%s)",
+							sbl_link_mode_str(link->blattr.link_mode));
+				s += scnprintf(buf + s, size - s, ", tries %d, nonce %x, state %s",
+						link->an_try_count, link->an_nonce,
+						sbl_an_get_sm_state(sbl, port_num));
+			}
+			if ((link->blattr.pec.an_mode != SBL_AN_MODE_OFF) && (link->an_rx_count))
+				s += scnprintf(buf + s, size - s, ", received %d",
+					       link->an_rx_count);
+			if (link->an_100cr4_fixup_applied)
+				s += scnprintf(buf + s, size - s, ", 100cr4-fixup");
+			if (link->an_options & AN_OPT_LLR)
+				s += scnprintf(buf + s, size - s, ", llr");
+
+			s += scnprintf(buf + s, size - s, "\n");
+		}
+		sbl_pml_mac_hw_status(sbl, port_num, &mac_tx_op, &mac_rx_op, &mac_ifg_mode, NULL);
+		if (mac_tx_op || mac_rx_op) {
+			s += scnprintf(buf + s, size - s, "base link: mac: tx %d, rx %d, ifg %s\n",
+					mac_tx_op, mac_rx_op, sbl_ifg_config_str(link->ifg_config));
+		}
+
+		llr_cfg = sbl_read64(sbl, SBL_PML_BASE(port_num) | SBL_PML_CFG_LLR_OFFSET);
+		switch (SBL_PML_CFG_LLR_LLR_MODE_GET(llr_cfg)) {
+		case 0:
+			llr_mode = SBL_LLR_MODE_OFF;
+			break;
+		case 1:
+			llr_mode = SBL_LLR_MODE_MONITOR;
+			break;
+		case 2:
+			llr_mode = SBL_LLR_MODE_ON;
+			break;
+		default:
+			llr_mode = SBL_LLR_MODE_INVALID;
+		}
+		switch (SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_GET(llr_cfg)) {
+		case 0:
+			llr_down_behavior = SBL_LLR_LINK_DOWN_DISCARD;
+			break;
+		case 1:
+			llr_down_behavior = SBL_LLR_LINK_DOWN_BLOCK;
+			break;
+		case 2:
+			llr_down_behavior = SBL_LLR_LINK_DOWN_BEST_EFFORT;
+			break;
+		default:
+			llr_down_behavior = SBL_LLR_LINK_DOWN_INVALID;
+		}
+		llr_sts = sbl_read64(sbl, SBL_PML_BASE(port_num) |
+				     SBL_PML_STS_LLR_MAX_USAGE_OFFSET);
+		s += scnprintf(buf + s, size - s,
+			       "base link: llr: mode %s, down %s, loop %lld %s %s\n",
+			       sbl_llr_mode_str(llr_mode),
+			       sbl_llr_down_behaviour_str(llr_down_behavior),
+			       link->llr_loop_time,
+			       SBL_PML_STS_LLR_MAX_USAGE_BUFF_SPC_STARVED_GET(llr_sts) ?
+			       "buf starved" : "",
+			       SBL_PML_STS_LLR_MAX_USAGE_SEQ_STARVED_GET(llr_sts) ?
+			       "seq starved" : "");
+
+		if (link->blattr.options & SBL_DISABLE_PML_RECOVERY)
+			s += scnprintf(buf + s, size - s, "base link: pml rec: disabled\n");
+		else
+			s += scnprintf(buf + s, size - s,
+				       "base link: pml rec: enabled, to %u, rl %u/%u\n",
+				       link->blattr.pml_recovery.timeout,
+				       link->blattr.pml_recovery.rl_max_duration,
+				       link->blattr.pml_recovery.rl_window_size);
+	}
+
+	spin_unlock(&link->lock);
+
+	s += sbl_debug_sysfs_sprint(sbl, port_num, buf + s, size - s);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_base_link_sysfs_sprint);
+#endif
+
+/**
+ * sbl_base_link_dump_attr() - Format all link attributes into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_base_link_dump_attr(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct sbl_base_link_attr *attr = &link->blattr;
+	int s = 0;
+
+	s += scnprintf(buf + s, size - s, "%d: base link attributes:\n", port_num);
+
+	if (!link->blconfigured) {
+		s += scnprintf(buf + s, size - s, "not configured\n");
+		return s;
+	}
+
+	s += scnprintf(buf + s, size - s, "options 0x%x", attr->options);
+	if (attr->options) {
+		s += scnprintf(buf + s, size - s, " -");
+		if (attr->options & SBL_OPT_FABRIC_LINK)
+			s += scnprintf(buf + s, size - s, " fabric");
+		if (attr->options & SBL_OPT_SERDES_LPD)
+			s += scnprintf(buf + s, size - s, " serdes-lpd");
+		if (attr->options & SBL_OPT_DFE_SAVE_PARAMS)
+			s += scnprintf(buf + s, size - s, " save-params");
+		if (attr->options & SBL_OPT_USE_SAVED_PARAMS)
+			s += scnprintf(buf + s, size - s, " use-params");
+		if (attr->options & SBL_OPT_RESET_CLEAR_PARAMS)
+			s += scnprintf(buf + s, size - s, " reset-clear-params");
+		if (attr->options & SBL_OPT_ENABLE_PCAL)
+			s += scnprintf(buf + s, size - s, " pcal");
+		if (attr->options & SBL_OPT_DFE_ALWAYS_MAX_EFFORT)
+			s += scnprintf(buf + s, size - s, " max-effort");
+		if (attr->options & SBL_OPT_DFE_ALWAYS_MED_EFFORT)
+			s += scnprintf(buf + s, size - s, " med-effort");
+		if (attr->options & SBL_OPT_DFE_ALWAYS_MIN_EFFORT)
+			s += scnprintf(buf + s, size - s, " min-effort");
+		if (attr->options & SBL_OPT_AUTONEG_TIMEOUT_IEEE)
+			s += scnprintf(buf + s, size - s, " an-timeout-ieee");
+		if (attr->options & SBL_OPT_AUTONEG_TIMEOUT_SSHOT)
+			s += scnprintf(buf + s, size - s, " an-timeout-sshot");
+		if (attr->options & SBL_OPT_AUTONEG_100CR4_FIXUP)
+			s += scnprintf(buf + s, size - s, " an-100cr4-fixup");
+		if (attr->options & SBL_OPT_RELOAD_FW_ON_TIMEOUT)
+			s += scnprintf(buf + s, size - s, " timeout-reload-fw");
+		if (attr->options & SBL_OPT_ALLOW_MEDIA_BAD_MODE)
+			s += scnprintf(buf + s, size - s, " allow-media-bad-mode");
+		if (attr->options & SBL_OPT_ALLOW_MEDIA_BAD_LEN)
+			s += scnprintf(buf + s, size - s, " allow-media-bad-len");
+		if (attr->options & SBL_OPT_ENABLE_ETHER_LLR)
+			s += scnprintf(buf + s, size - s, " enable-ether-llr");
+		if (attr->options & SBL_OPT_ENABLE_IFG_HPC_WITH_LLR)
+			s += scnprintf(buf + s, size - s, " enable-ifg-hpc-with-llr");
+		if (attr->options & SBL_OPT_ENABLE_IFG_CONFIG)
+			s += scnprintf(buf + s, size - s, " enable-ifg-config");
+		if (attr->options & SBL_OPT_DISABLE_AN_LLR)
+			s += scnprintf(buf + s, size - s, " disable-an-llr");
+		if (attr->options & SBL_OPT_LANE_DEGRADE)
+			s += scnprintf(buf + s, size - s, " enable-lane-degrade");
+		if (attr->options & SBL_DISABLE_PML_RECOVERY)
+			s += scnprintf(buf + s, size - s, " disable-pml-recovery");
+	}
+	s += scnprintf(buf + s, size - s, "\n");
+	s += scnprintf(buf + s, size - s, "start_timeout %d\n", attr->start_timeout);
+	if (attr->config_target == SBL_BASE_LINK_CONFIG_PEC) {
+		s += scnprintf(buf + s, size - s, "config_target PEC\n");
+		s += scnprintf(buf + s, size - s, "an_mode %d (%s)\n",
+			       attr->pec.an_mode,
+			       sbl_an_mode_str(attr->pec.an_mode));
+		s += scnprintf(buf + s, size - s, "an_retry_timeout %d\n",
+			       attr->pec.an_retry_timeout);
+		s += scnprintf(buf + s, size - s, "an_max_retry %d\n", attr->pec.an_max_retry);
+	}
+	if (attr->config_target == SBL_BASE_LINK_CONFIG_AOC) {
+		s += scnprintf(buf + s, size - s, "config_target AOC\n");
+		s += scnprintf(buf + s, size - s, "optical_lock_delay %d\n",
+			       attr->aoc.optical_lock_delay);
+		s += scnprintf(buf + s, size - s, "optical_lock_interval %d\n",
+			       attr->aoc.optical_lock_interval);
+	}
+	s += scnprintf(buf + s, size - s, "lpd_timeout %d\n", attr->lpd_timeout);
+	s += scnprintf(buf + s, size - s, "lpd_poll_interval %d\n", attr->lpd_poll_interval);
+	s += scnprintf(buf + s, size - s, "link_mode %d (%s)\n",
+		       attr->link_mode, sbl_link_mode_str(attr->link_mode));
+	s += scnprintf(buf + s, size - s, "loopback_mode %d (%s)\n",
+		       attr->loopback_mode,
+		       sbl_loopback_mode_str(attr->loopback_mode));
+	s += scnprintf(buf + s, size - s, "link_partner %d\n", attr->link_partner);
+	s += scnprintf(buf + s, size - s, "tuning_pattern %d\n", attr->tuning_pattern);
+	s += scnprintf(buf + s, size - s, "precoding %d\n", attr->precoding);
+	s += scnprintf(buf + s, size - s, "dfe_pre_delay %d\n", attr->dfe_pre_delay);
+	s += scnprintf(buf + s, size - s, "dfe_timeout %d\n", attr->dfe_timeout);
+	s += scnprintf(buf + s, size - s, "dfe_poll_interval %d\n", attr->dfe_poll_interval);
+	s += scnprintf(buf + s, size - s, "pcal_eyecheck_holdoff %d\n",
+		       attr->pcal_eyecheck_holdoff);
+	s += scnprintf(buf + s, size - s, "nrz_min_eye_height 0x%x\n", attr->nrz_min_eye_height);
+	s += scnprintf(buf + s, size - s, "nrz_max_eye_height 0x%x\n", attr->nrz_max_eye_height);
+	s += scnprintf(buf + s, size - s, "pam4_min_eye_height 0x%x\n", attr->pam4_min_eye_height);
+	s += scnprintf(buf + s, size - s, "pam4_max_eye_height 0x%x\n", attr->pam4_max_eye_height);
+	s += scnprintf(buf + s, size - s, "fec_mode %d\n", attr->fec_mode);
+	s += scnprintf(buf + s, size - s, "enable_autodegrade %d\n", attr->enable_autodegrade);
+	s += scnprintf(buf + s, size - s, "llr_mode %d (%s)\n",
+		       attr->llr_mode, sbl_llr_mode_str(attr->llr_mode));
+	s += scnprintf(buf + s, size - s, "ifg_config %d (%s)\n",
+		       attr->ifg_config, sbl_ifg_config_str(attr->ifg_config));
+	s += scnprintf(buf + s, size - s, "pml_recovery.timeout %u\n", attr->pml_recovery.timeout);
+	s += scnprintf(buf + s, size - s, "pml_recovery.rl_max_duration %u\n",
+		       attr->pml_recovery.rl_max_duration);
+	s += scnprintf(buf + s, size - s, "pml_recovery.rl_window_size %u\n",
+		       attr->pml_recovery.rl_window_size);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_base_link_dump_attr);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link_an.c b/drivers/net/ethernet/hpe/sbl/sbl_link_an.c
new file mode 100644
index 000000000000..aecadbceb593
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_link_an.c
@@ -0,0 +1,1010 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/random.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes.h"
+#include "sbl_constants.h"
+#include "sbl_serdes_map.h"
+#include "sbl_internal.h"
+
+/* for debug purposes we can add an extra null message page for fabric links */
+#define SBL_SEND_EXTRA_FABRIC_NULL_PAGE                 0
+
+/* set the reset state */
+static void sbl_an_pml_an_reset(struct sbl_inst *sbl, int port_num, u64 reset_state)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 cfg_pcs_autoneg_reg;
+
+	/* reset */
+	cfg_pcs_autoneg_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET);
+	cfg_pcs_autoneg_reg = SBL_PML_CFG_PCS_AUTONEG_RESET_UPDATE(cfg_pcs_autoneg_reg, reset_state);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET,
+		    cfg_pcs_autoneg_reg);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET);
+}
+
+static void sbl_an_send_base_page(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+
+	/* first page is the base page (whole reg) */
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_OFFSET, link->an_tx_page[0]);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_OFFSET);
+
+	sbl_dev_dbg(sbl->dev, "an %d: tx base page: 0x%llx", port_num, link->an_tx_page[0]);
+
+	/* start autoneg by taking an sm out of reset*/
+	sbl_an_pml_an_reset(sbl, port_num, 0);
+}
+
+static u32 sbl_an_get_nonce(void)
+{
+	u16 buf;
+
+	while (1) {
+		get_random_bytes(&buf, 2);
+		buf &= 0x1f;
+		if (buf)
+			return buf;
+	}
+}
+
+static bool sbl_an_base_is_complete(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_autoneg_base_reg;
+
+	sts_autoneg_base_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET);
+
+	return SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_COMPLETE_GET(sts_autoneg_base_reg);
+}
+
+static bool sbl_an_base_is_page_recv(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_autoneg_base_reg;
+	bool val;
+
+	sts_autoneg_base_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET);
+
+	val = (SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_ABILITY_GET(sts_autoneg_base_reg)) &&
+	      (SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_PAGE_RECEIVED_GET(sts_autoneg_base_reg));
+
+	return val;
+}
+
+static bool sbl_an_is_base_page(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_autoneg_base_reg;
+	u64 state;
+	bool val;
+
+	sts_autoneg_base_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET);
+
+	state = SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(sts_autoneg_base_reg);
+
+	val = (state == SBL_PML_AUTONEG_STATE_COMPLETE_ACK) ||
+	      (state == SBL_PML_AUTONEG_STATE_AN_GOOD_CHECK);
+
+	val = val && (SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_PAGE_RECEIVED_GET(sts_autoneg_base_reg)) &&
+	      (SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_GET(sts_autoneg_base_reg)) &&
+	      (SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_ABILITY_GET(sts_autoneg_base_reg));
+
+	return val;
+}
+
+/* Setup the pages */
+static int sbl_an_setup_tx_pages(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "an %d: run setup tx pages", port_num);
+
+	/* init to known non-zero value so it's easy to tell used pages from init pages */
+	memset(link->an_tx_page, 0xAA, sizeof(link->an_tx_page));
+
+	/* build the base page */
+
+	link->an_tx_page[0] = 0;
+	link->an_tx_page[0] |= AN_CW_S_802_3;
+
+	if (link->blattr.pec.an_mode == SBL_AN_MODE_FIXED) {
+
+		switch (link->blattr.link_mode) {
+
+		case SBL_LINK_MODE_BS_200G:
+			link->an_tx_page[0] |= (AN_CW_A_200GBASE_CR4) << AN_CW_A_BASE_BIT;
+			break;
+
+		case SBL_LINK_MODE_BJ_100G:
+			link->an_tx_page[0] |= (AN_CW_A_100GBASE_CR4) << AN_CW_A_BASE_BIT;
+			break;
+
+		case SBL_LINK_MODE_CD_100G:
+			link->an_tx_page[0] |= (AN_CW_A_100GBASE_CR2) << AN_CW_A_BASE_BIT;
+			break;
+
+		case SBL_LINK_MODE_CD_50G:
+			link->an_tx_page[0] |= (AN_CW_A_50GBASE_CR) << AN_CW_A_BASE_BIT;
+			break;
+
+		default:
+			sbl_dev_err(sbl->dev, "an %d: bad an blattr mode", port_num);
+			return -EINVAL;
+		}
+	} else {
+		/* all modes we support */
+		link->an_tx_page[0] |= (AN_CW_A_200GBASE_CR4) << AN_CW_A_BASE_BIT;
+		link->an_tx_page[0] |= (AN_CW_A_100GBASE_CR4) << AN_CW_A_BASE_BIT;
+		link->an_tx_page[0] |= (AN_CW_A_100GBASE_CR2) << AN_CW_A_BASE_BIT;
+		link->an_tx_page[0] |= (AN_CW_A_50GBASE_CR)   << AN_CW_A_BASE_BIT;
+	}
+
+	/* Not sure what to set here - both Arista and Mellanox say zero so for
+	 * now we will do the same and set nothing
+	 */
+
+	/* TODO: Enhance PAUSE support. Currently only symmetric PAUSE is advertised.
+	 * Should support: asymmetric PAUSE modes, flow control negotiation per standard,
+	 * and link partner capability reporting.
+	 */
+	link->an_tx_page[0] |= (AN_CW_C_SYMMETRIC) << AN_CW_C_BASE_BIT;
+
+	sbl_dev_dbg(sbl->dev, "an %d: bp = 0x%llx", port_num, link->an_tx_page[0]);
+
+	/* check for disabled next pages */
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_DISABLE_AN_NEXT_PAGES)) {
+		sbl_dev_dbg(sbl->dev, "an %d: next pages disabled", port_num);
+		link->an_tx_count = 1;
+		return 0;
+	}
+
+	/* build HPE OUI next pages */
+
+	/* have next page (set in previous page) */
+	link->an_tx_page[0] |= AN_CW_NP_MASK;
+
+	/* OUI message page */
+	link->an_tx_page[1] = 0ULL;
+	link->an_tx_page[1] |= AN_NP_MP_MASK;
+	link->an_tx_page[1] |= AN_NP_CODE_OUI_EXTENDED_MSG;
+	link->an_tx_page[1] |= AN_NP_OUI_HPE;
+
+	sbl_dev_dbg(sbl->dev, "an %d: np mp = 0x%llx", port_num, link->an_tx_page[1]);
+
+	/* have next page (set in previous page) */
+	link->an_tx_page[1] |= AN_CW_NP_MASK;
+
+	/* unformatted page with OUI message page */
+	link->an_tx_page[2] = 0ULL;
+	link->an_tx_page[2] |= AN_NP_OUI_VER_0_1;
+	/* LLR options here */
+	if (link->blattr.llr_mode == SBL_LLR_MODE_AUTO) {
+		if (!(link->blattr.options & SBL_OPT_DISABLE_AN_LLR)) {
+			link->an_tx_page[2] |= (AN_OPT_LLR << AN_OPT_BASE_BIT);
+			if (link->blattr.options & SBL_OPT_ENABLE_ETHER_LLR)
+				link->an_tx_page[2] |= (AN_OPT_ETHER_LLR << AN_OPT_BASE_BIT);
+
+			if (link->blattr.options & SBL_OPT_ENABLE_IFG_HPC_WITH_LLR)
+				link->an_tx_page[2] |= (AN_OPT_HPC_WITH_LLR << AN_OPT_BASE_BIT);
+			/* TODO: add IPV4 option */
+		}
+	}
+	sbl_an_version_read(sbl, port_num);
+
+	sbl_dev_dbg(sbl->dev, "an %d: np ufp = 0x%llx", port_num, link->an_tx_page[2]);
+
+	link->an_tx_count = SBL_AN_MAX_TX_PAGES;
+
+	return 0;
+}
+
+static int sbl_an_pml_setup(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 cfg_pcs_autoneg_reg;
+	u64 cfg_pcs_reg;
+	u64 cfg_rx_pcs_reg;
+	u64 val64;
+
+	/* disable pcs autoneg
+	 * as pcs is also disabled this will reset the pcs-serdes CDC logic
+	 */
+	cfg_pcs_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	cfg_pcs_reg = SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_UPDATE(cfg_pcs_reg, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET, cfg_pcs_reg);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+
+	/* configure an */
+	cfg_pcs_autoneg_reg = SBL_PML_CFG_PCS_AUTONEG_RX_LANE_SET(sbl->switch_info->ports[port_num].rx_an_swizzle) |
+			      SBL_PML_CFG_PCS_AUTONEG_TX_LANE_SET(sbl->switch_info->ports[port_num].tx_an_swizzle) |
+			      SBL_PML_CFG_PCS_AUTONEG_RESET_SET(1ULL) |       /* start held in reset */
+			      SBL_PML_CFG_PCS_AUTONEG_RESTART_SET(0ULL) |     /* not used - always zero */
+			      SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_SET(0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET,
+		    cfg_pcs_autoneg_reg);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET);
+
+	/* reset alignment locking */
+	cfg_rx_pcs_reg = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	cfg_rx_pcs_reg = SBL_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(cfg_rx_pcs_reg, 0ULL);
+	cfg_rx_pcs_reg = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(cfg_rx_pcs_reg, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, cfg_rx_pcs_reg);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+
+	/* config an timers */
+	val64 = SBL_PML_CFG_PCS_AUTONEG_TIMERS_DFLT;
+	/* disable fault timeout by setting it to its max value  */
+	val64 = SBL_PML_CFG_PCS_AUTONEG_TIMERS_LINK_FAIL_INHIBIT_TIMER_MAX_UPDATE(val64, 0xffffffffULL);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_TIMERS_OFFSET, val64);
+
+	/* clear err flags */
+	sbl_pml_err_flgs_clear_all(sbl, port_num);
+
+	/* enable autoneg
+	 * this will take CDC logic out of reset
+	 */
+	cfg_pcs_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	cfg_pcs_reg = SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_UPDATE(cfg_pcs_reg, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET, cfg_pcs_reg);
+
+	/* an reset is still asserted, it will be deasserted after base page is loaded */
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_ANEG);
+
+	return 0;
+}
+
+/* perform page exchange
+ *
+ *   Rosetta has a hw bug whereby some error flags cannot be cleared by the normal method
+ *   as the an state machine will continually reassert them. (The failed, complete and
+ *   next page received err flags) so instead we disable intrs for these flags when they
+ *   are received and reset them in wait prepare.
+ *
+ *   For next pages we would like to do:
+ *
+ *      wait_prepare()
+ *      send_next_page()
+ *      wait_for_completion()
+ *
+ *   However this sequence will cause the err flags to be immediately set in the wait
+ *   prepare and the intr fire.
+ *
+ *   The best we can do is
+ *
+ *      preempt_disable()
+ *      send_next_page()
+ *      wait_prepare()
+ *      preempt_enable()
+ *      wait_for_completion()
+ *
+ *     But we can still miss intrs
+ *     There would seem to be nothing we can do about this
+ *
+ *    26 Feb 2021 - added SM exchange to work around rosetta interrupt bug
+ *
+ */
+static int sbl_an_exchange(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	unsigned long timeout = msecs_to_jiffies(1000 * link->blattr.pec.an_retry_timeout);
+	unsigned long remaining_jiffies;
+	u64 sts_autoneg_base_reg;
+	int err;
+
+	sbl_dev_dbg(sbl->dev, "an %d: exchange start", port_num);
+
+	if (sbl_base_link_start_cancelled(sbl, port_num))
+		return -ECANCELED;
+	if (sbl_start_timeout(sbl, port_num))
+		return -ETIMEDOUT;
+
+	if (!sbl->is_hw)
+		return 0;
+
+	/* clear any previous pages */
+	memset(link->an_rx_page, 0, SBL_AN_MAX_RX_PAGES * sizeof(u64));
+	link->an_rx_count = 0;
+
+	/* update the nonce */
+	link->an_nonce = sbl_an_get_nonce();
+	link->an_tx_page[0] &= ~AN_CW_T_MASK;
+	link->an_tx_page[0] |= ((link->an_nonce << AN_CW_T_BASE_BIT) & AN_CW_T_MASK);
+
+	/* base page exchange */
+
+	err = sbl_an_hw_wait_prepare(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_an_send_base_page(sbl, port_num);
+
+	remaining_jiffies = wait_for_completion_timeout(&link->an_hw_change, timeout);
+	if (sbl_base_link_start_cancelled(sbl, port_num))
+		return -ECANCELED;
+	if (remaining_jiffies == 0) {
+		sbl_dev_dbg(sbl->dev, "an %d: base page exchange timeout (nonce %.2x, sm_state %s)",
+			    port_num, link->an_nonce, sbl_an_get_sm_state(sbl, port_num));
+		sbl_an_dump_state(sbl, port_num);
+
+		/* check we have not missed the err flg */
+		if (sbl_an_base_is_complete(sbl, port_num) || sbl_an_base_is_page_recv(sbl, port_num))
+			sbl_dev_err(sbl->dev, "an %d: MISSED A BASE PAGE!!!!", port_num);
+
+		return -ETIME;
+	}
+
+	/* check it is a base page */
+	if (!sbl_an_is_base_page(sbl, port_num)) {
+		sbl_dev_err(sbl->dev, "an %d: missing base page indication", port_num);
+		sbl_an_dump_state(sbl, port_num);
+		return -EBADE;
+	}
+
+	/* copy page to return buffer */
+	sts_autoneg_base_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET);
+	link->an_rx_page[0] = SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_BASE_PAGE_GET(sts_autoneg_base_reg);
+	link->an_rx_count = 1;
+
+	/* check if an is complete i.e. no one has more to send */
+	if (sbl_an_base_is_complete(sbl, port_num))
+		goto out_success;
+
+	/* since not complete, we must have received a page - check this */
+	if (!sbl_an_base_is_page_recv(sbl, port_num)) {
+		sbl_dev_err(sbl->dev, "an %d: expected page received indication", port_num);
+		sbl_an_dump_state(sbl, port_num);
+		return -EBADE;
+	}
+
+	/* next page exchange */
+	err = sbl_an_page_exchange(sbl, port_num, remaining_jiffies);
+
+	if (err)
+		return err;
+
+out_success:
+
+	/* dump the final state on the way out */
+	sbl_an_dump_state(sbl, port_num);
+
+	sbl_dev_dbg(sbl->dev, "an %d: exchange complete", port_num);
+
+	return 0;
+}
+
+/* save away the LLR options here */
+static void sbl_an_save_llr_options(struct sbl_link *link, int x)
+{
+	if (link->blattr.llr_mode == SBL_LLR_MODE_AUTO) {
+		if (!(link->blattr.options & SBL_OPT_DISABLE_AN_LLR)) {
+			if (link->an_rx_page[x] & (AN_OPT_LLR << AN_OPT_BASE_BIT))
+				link->an_options |= AN_OPT_LLR;
+			if (link->an_rx_page[x] & (AN_OPT_ETHER_LLR << AN_OPT_BASE_BIT)) {
+				if (link->blattr.options & SBL_OPT_ENABLE_ETHER_LLR)
+					link->an_options |= AN_OPT_ETHER_LLR;
+			}
+			if (link->an_rx_page[x] & (AN_OPT_HPC_WITH_LLR << AN_OPT_BASE_BIT)) {
+				if (link->blattr.options & SBL_OPT_ENABLE_IFG_HPC_WITH_LLR)
+					link->an_options |= AN_OPT_HPC_WITH_LLR;
+			}
+			/* TODO: add IPV4 option */
+		}
+	}
+
+}
+
+static int sbl_an_ability_match(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 fec_ability;
+	u32 tech_ability;
+	u32 pause_ability;
+	u64  last_msg_code = 0;
+	bool expect_hpe    = false;
+	int  x             = 0;
+
+	sbl_dev_dbg(sbl->dev, "an %d: rx count = %d", port_num, link->an_rx_count);
+
+	if (!sbl->is_hw) {
+		/* Netsim/Z1: No AN happening, so just force the response data to the
+		 * tx data to ensure capability match
+		 */
+		link->an_rx_page[0] = link->an_tx_page[0];
+	}
+	/* abilities */
+	tech_ability = (link->an_tx_page[0] & link->an_rx_page[0] & AN_CW_A_MASK)
+			>> AN_CW_A_BASE_BIT;
+	fec_ability = (link->an_tx_page[0] & link->an_rx_page[0] & AN_CW_F_MASK)
+					>> AN_CW_F_BASE_BIT;
+	pause_ability = (link->an_tx_page[0] & link->an_rx_page[0] & AN_CW_C_MASK)
+					>> AN_CW_C_BASE_BIT;
+	sbl_dev_dbg(sbl->dev, "an %d: tech 0x%x, fec 0x%x, pause %d", port_num,
+		    tech_ability, fec_ability, pause_ability);
+
+	/* FEC mode (we only do RS) */
+	if (fec_ability & AN_CW_F_25G_RS_REQ) {
+		/* ignore for now - set in config */
+	} else if (fec_ability & AN_CW_F_25G_BASER_REQ) {
+		sbl_dev_warn(sbl->dev, "an %d: cannot do fec mode baser",
+			     port_num);
+	} else {
+		sbl_dev_dbg(sbl->dev, "an %d: no matching fec mode (partner fec 0x%x)",
+			    port_num, fec_ability);
+	}
+
+	/* TODO pause */
+
+	/* link mode (speed) */
+	if (tech_ability & AN_CW_A_200GBASE_CR4) {
+		link->link_mode = SBL_LINK_MODE_BS_200G;
+	} else if (tech_ability & AN_CW_A_100GBASE_CR4) {
+		link->link_mode = SBL_LINK_MODE_BJ_100G;
+	} else if (tech_ability & AN_CW_A_100GBASE_CR2) {
+		link->link_mode = SBL_LINK_MODE_CD_100G;
+	} else if (tech_ability & AN_CW_A_50GBASE_KR) {
+		link->link_mode = SBL_LINK_MODE_CD_50G;
+	} else {
+		sbl_dev_err(sbl->dev, "an %d: no matching mode (partner ability 0x%x)",
+			    port_num, tech_ability);
+		return -ENOENT;
+	}
+
+	/* look at next page(s) */
+	link->lp_subtype = SBL_LP_SUBTYPE_UNKNOWN;
+	for (x = 1; x < link->an_rx_count; ++x) {
+
+		/* do message page */
+		if (link->an_rx_page[x] & AN_NP_MP_MASK) {
+			last_msg_code = link->an_rx_page[x] & AN_NP_MSG_MASK;
+			sbl_dev_dbg(sbl->dev, "an %d: msg_code = %llu", port_num, last_msg_code);
+			switch (last_msg_code) {
+			case AN_NP_CODE_NULL_MSG:
+			case AN_NP_CODE_OUI_MSG:
+				/* nothing to do */
+				break;
+			case AN_NP_CODE_OUI_EXTENDED_MSG:
+				switch (link->an_rx_page[x] & AN_NP_OUI_MASK) {
+				case AN_NP_OUI_HPE:
+					/* have HPE OUI message - expect an unformatted page next */
+					expect_hpe = true;
+					break;
+				default:
+					sbl_dev_dbg(sbl->dev, "an %d: unknown OUI = 0x%llX", port_num, (link->an_rx_page[x] & AN_NP_OUI_MASK) >> AN_NP_OUI_BASE_BIT);
+					expect_hpe = false;
+					break;
+				}
+				break;
+			default:
+				sbl_dev_dbg(sbl->dev, "an %d: unknown msg_code = 0x%llX", port_num, last_msg_code);
+				break;
+			}
+			/* go on to next page */
+			continue;
+		}
+
+		/* do unformatted page */
+		switch (last_msg_code) {
+		case AN_NP_CODE_OUI_EXTENDED_MSG:
+			if (!expect_hpe)
+				break;
+
+			/* got a HPE OUI message - check the unformatted page and set options */
+			switch (link->an_rx_page[x] & AN_NP_OUI_VER_MASK) {
+			case AN_NP_OUI_VER_0_1:
+				sbl_an_save_llr_options(link, x);
+				/* save away cassini version here */
+				link->lp_subtype = ((link->an_rx_page[x] >> AN_LP_SUBTYPE_BASE_BIT) & AN_LP_SUBTYPE_MASK);
+				sbl_dev_dbg(sbl->dev, "an %d: HPE an_options = 0x%X, lp_subtype = %d", port_num, link->an_options, link->lp_subtype);
+				break;
+			default:
+				sbl_dev_dbg(sbl->dev, "an %d: unknown OUI version 0x%llX", port_num, link->an_rx_page[x] & AN_NP_OUI_VER_MASK);
+				break;
+			}
+			expect_hpe = false;
+			break;
+		default:
+			sbl_dev_dbg(sbl->dev, "an %d: unknown ufp = 0x%llX", port_num, link->an_rx_page[x]);
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void sbl_an_update_timeout(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned int new_timeout = 0;
+
+	if (link->blattr.options & SBL_OPT_AUTONEG_TIMEOUT_SSHOT) {
+		/* use slingshot timeouts - which are longer than the IEEE defaults */
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			new_timeout = SBL_LINK_AUTONEG_TIMEOUT_SSHOT_200;
+			break;
+		case SBL_LINK_MODE_BJ_100G:
+		case SBL_LINK_MODE_CD_100G:
+			new_timeout = SBL_LINK_AUTONEG_TIMEOUT_SSHOT_100;
+			break;
+		case SBL_LINK_MODE_CD_50G:
+			new_timeout = SBL_LINK_AUTONEG_TIMEOUT_SSHOT_50;
+			break;
+		default:
+			sbl_dev_warn(sbl->dev, "an %d: bad mode in update_timeout",
+				     port_num);
+		}
+	}
+
+	if (link->blattr.options & SBL_OPT_AUTONEG_TIMEOUT_IEEE) {
+		/* use IEEE timeouts */
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			new_timeout = SBL_LINK_AUTONEG_TIMEOUT_IEEE_200;
+			break;
+		case SBL_LINK_MODE_BJ_100G:
+		case SBL_LINK_MODE_CD_100G:
+			new_timeout = SBL_LINK_AUTONEG_TIMEOUT_IEEE_100;
+			break;
+		case SBL_LINK_MODE_CD_50G:
+			new_timeout = SBL_LINK_AUTONEG_TIMEOUT_IEEE_50;
+			break;
+		default:
+			sbl_dev_warn(sbl->dev, "an %d: bad mode in update_timeout",
+				     port_num);
+		}
+	}
+
+	if (new_timeout) {
+		sbl_dev_dbg(sbl->dev, "an %d: update start timeout to %d ms",
+			    port_num, new_timeout);
+		link->an_timeout_active = true;
+		sbl_link_update_start_timeout(sbl, port_num, new_timeout);
+	}
+}
+
+/* If there is no common mode between this port and our link partner
+ * and if the lp advertises 100KR4 and we advertise 100CR4 then add 100CR4
+ * to the lp's abilities.
+ *
+ * This is necessary because recent Mellanox software no longer advertises
+ * 100CR even though it seems to be able to tune in this mode. Adding 100CR4
+ * to the lp abilities means that we will resolve 100CR4 and start using this
+ * mode.
+ */
+#define SBL_AN_KR4_BIT (1ULL << (AN_CW_A_BASE_BIT + AN_CW_A_100GBASE_KR4_BIT))
+#define SBL_AN_CR4_BIT (1ULL << (AN_CW_A_BASE_BIT + AN_CW_A_100GBASE_CR4_BIT))
+
+static bool sbl_an_100cr4_fixup(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* check no match */
+	if (link->an_tx_page[0] & link->an_rx_page[0] & AN_CW_A_MASK)
+		return false;
+
+	/* check we want cr4 */
+	if (!(link->an_tx_page[0] & SBL_AN_CR4_BIT))
+		return false;
+
+	/* check lp wants kr4 */
+	if (!(link->an_rx_page[0] & SBL_AN_KR4_BIT))
+		return false;
+
+	/* add cr4 to lp abilities */
+	link->an_rx_page[0] |= SBL_AN_CR4_BIT;
+
+	/* fixup applied */
+	sbl_dev_info(sbl->dev, "an %d: 100cr4 fixup applied", port_num);
+	return true;
+}
+
+int sbl_link_autoneg(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	u32 base = SBL_PML_BASE(port_num);
+	u32 random;
+	u64 cfg_pcs_reg;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	/* set starting point */
+	link = sbl->link + port_num;
+	link->an_options = 0;
+	link->link_mode  = link->blattr.link_mode;
+
+	switch (link->blattr.pec.an_mode) {
+
+	case SBL_AN_MODE_OFF:
+		sbl_dev_dbg(sbl->dev, "an %d: AN off", port_num);
+		/* nothing more to do here */
+		return 0;
+
+	case SBL_AN_MODE_ON:
+	case SBL_AN_MODE_FIXED:
+		/* ok */
+		break;
+
+	default:
+		sbl_dev_err(sbl->dev, "an %d: invalid AN mode (%s)", port_num,
+			    sbl_an_mode_str(link->blattr.pec.an_mode));
+		return -EINVAL;
+	}
+
+	/* we can never be in loopback mode as the nonce will be the same! */
+	if (link->blattr.loopback_mode != SBL_LOOPBACK_MODE_OFF) {
+		sbl_dev_err(sbl->dev, "an %d: cannot autoneg in loopback mode", port_num);
+		return -ENOTUNIQ;
+	}
+
+	/* pcs must not be enabled and autoneg must be off */
+	cfg_pcs_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	if (SBL_PML_CFG_PCS_PCS_ENABLE_GET(cfg_pcs_reg)) {
+		sbl_dev_err(sbl->dev, "an %d: pcs is enabled", port_num);
+		err = -EBUSY;
+		goto out;
+	}
+	if (SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_GET(cfg_pcs_reg)) {
+		sbl_dev_err(sbl->dev, "an %d: autoneg already enabled", port_num);
+		err = -EBUSY;
+		goto out;
+	}
+
+	/* sort out the data to send/receive */
+	err = sbl_an_setup_tx_pages(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "an %d, page setup failed [%d]", port_num, err);
+		goto out;
+	}
+
+	/* setup */
+	err = sbl_pml_install_intr_handler(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
+	if (err)
+		goto out;
+	link->an_100cr4_fixup_applied = false;
+
+	/* try to negotiate */
+	link->an_try_count = 0;
+	while (1) {
+
+		link->an_try_count++;
+
+		/* keep trying until up timeout expires or cancelled */
+		if (sbl_start_timeout(sbl, port_num)) {
+			err = -ETIMEDOUT;
+			break;
+		}
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			err = -ECANCELED;
+			break;
+		}
+
+		/* setup the serdes and pml */
+		err = sbl_an_serdes_start(sbl, port_num);
+		if (err)
+			break;
+		usleep_range(1000, 2000);
+
+		err = sbl_an_pml_setup(sbl, port_num);
+		if (err)
+			break;
+
+		/* try to exchange pages */
+		err = sbl_an_exchange(sbl, port_num);
+		if (err == -EPROTO) {
+			/* we have received an unexpected base page
+			 * The lp must have restarted autoneg and we should too
+			 *
+			 * However we know that some Mellanox cards will do this if there is no
+			 * ability match - particularly only supporting 100KR4 not 100CR4
+			 * See if we can try to fix this up
+			 */
+			if (link->blattr.options & SBL_OPT_AUTONEG_100CR4_FIXUP) {
+				if (sbl_an_100cr4_fixup(sbl, port_num)) {
+					/* fixup applied */
+					link->an_100cr4_fixup_applied = true;
+					/* carry on to ability match */
+				} else {
+					/* fixup failed - retry exchange */
+					sbl_an_serdes_stop(sbl, port_num);
+					continue;
+				}
+			} else {
+				sbl_an_serdes_stop(sbl, port_num);
+				continue;
+			}
+		} else if (err == -ETIME) {
+			/* we have timed out */
+			if (link->an_try_count < link->blattr.pec.an_max_retry) {
+				/* retry */
+				sbl_an_serdes_stop(sbl, port_num);
+				/* Random delay of 1-5 before retry */
+				get_random_bytes(&random, sizeof(random));
+				random = 1u + (random % 5u);
+				msleep(random);
+				continue;
+			} else {
+				/* give up */
+				break;
+			}
+		} else if (err) {
+			/* other error */
+			sbl_dev_dbg(sbl->dev, "an %d: exchange failed [%d] (sm_state %s)",
+				    port_num, err, sbl_an_get_sm_state(sbl, port_num));
+			break;
+		}
+
+		/* pages have been exchanged - try to resolve the mode etc */
+		err = sbl_an_ability_match(sbl, port_num);
+		if (err) {
+			/* no match - try again (in case they change) */
+			sbl_an_serdes_stop(sbl, port_num);
+			continue;
+		}
+
+		/* see if we need to update the start timeout */
+		sbl_an_update_timeout(sbl, port_num);
+
+		/* we know the lp is there */
+		link->lp_detected = true;
+		break;
+	}
+
+	/* cleanup */
+	if (link->sstate == SBL_SERDES_STATUS_AUTONEG)
+		sbl_an_serdes_stop(sbl, port_num);
+	sbl_pml_disable_intr_handler(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
+	sbl_pml_remove_intr_handler(sbl, port_num);
+
+out:
+	sbl_pml_err_flgs_clear_all(sbl, port_num);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ANEG);
+
+	return err;
+}
+
+void sbl_an_send_next_page(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 cfg_pcs_autoneg_reg;
+
+	cfg_pcs_autoneg_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET);
+	cfg_pcs_autoneg_reg = SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_UPDATE(cfg_pcs_autoneg_reg, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET, cfg_pcs_autoneg_reg);
+}
+
+bool sbl_an_next_is_complete(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_autoneg_next_reg;
+
+	sts_autoneg_next_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+
+	return SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_COMPLETE_GET(sts_autoneg_next_reg);
+}
+
+bool sbl_an_is_next_page(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_autoneg_next_reg;
+	u64 state;
+	bool value;
+
+	sts_autoneg_next_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+
+	state = SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_STATE_GET(sts_autoneg_next_reg);
+
+	value =	 (state == SBL_PML_AUTONEG_STATE_COMPLETE_ACK) ||
+		(state == SBL_PML_AUTONEG_STATE_AN_GOOD_CHECK);
+
+	value = value && (SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_ABILITY_GET(sts_autoneg_next_reg)) &&
+		(!SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_BASE_PAGE_GET(sts_autoneg_next_reg));
+
+	return value;
+}
+
+void sbl_an_setup_next_page(struct sbl_inst *sbl, int port_num, int page_idx)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET,
+		    link->an_tx_page[page_idx]);
+	sbl_dev_dbg(sbl->dev, "an %d: tx next page: 0x%llx", port_num,
+		    link->an_tx_page[page_idx]);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+}
+
+void sbl_an_setup_null_page(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 null_page;
+
+	/* Construct a null message page as in 802.3-2015: 28.2.3.4.1 & annex 28C */
+	null_page  = sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+	null_page ^= AN_NP_T_MASK;          /* toggle bit 11 */
+	null_page &= ~AN_NP_NP_MASK;        /* clear next page bit */
+	null_page |= AN_NP_MP_MASK;         /* set this is msg page */
+	null_page &= ~AN_NP_MSG_MASK;       /* clear msg code */
+	null_page |= AN_NP_CODE_NULL_MSG;   /* set null msg code */
+	null_page &= ~AN_NP_UCF_MASK;       /* clear unformatted code field code */
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET, null_page);
+	sbl_dev_dbg(sbl->dev, "an %d: tx null next page: 0x%llx", port_num,
+		    null_page);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+}
+
+/* setup to detect complete or page received error flags become set */
+int sbl_an_hw_wait_prepare(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long flags;
+	int err;
+
+	spin_lock_irqsave(&link->lock, flags);
+	if (link->start_cancelled) {
+		spin_unlock_irqrestore(&link->lock, flags);
+		return -ECANCELED;
+	}
+	reinit_completion(&link->an_hw_change);
+	spin_unlock_irqrestore(&link->lock, flags);
+
+	sbl_pml_err_flgs_clear(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
+
+	err = sbl_pml_enable_intr_handler(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
+	if (err) {
+		sbl_dev_err(sbl->dev, "an %d: intr enable failed [%d]", port_num, err);
+		return err;
+	}
+
+	return 0;
+}
+
+const char *sbl_an_get_sm_state(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_pcs_autoneg_reg;
+	u64 sm_state;
+
+	sts_pcs_autoneg_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET);
+	sm_state = SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(sts_pcs_autoneg_reg);
+
+	return  sbl_an_state_str(sm_state);
+}
+
+/**
+ * sbl_get_an_pages() - Get an pages
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @count: number of pages
+ * @pages: Pointer to max rx pages
+ *
+ * Get number of an pages 'count' and rx pages 'pages'
+ * by reading 'an_rx_count' and 'an_rx_page'
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_get_an_pages(struct sbl_inst *sbl, int port_num, int *count, u64 *pages)
+{
+	struct sbl_link *link;
+	int i;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	if (!count || !pages)
+		return -EINVAL;
+
+	link = sbl->link + port_num;
+
+	/* check we did autoneg successfully */
+	if ((link->blattr.pec.an_mode != SBL_AN_MODE_ON) &&
+	    (link->blattr.pec.an_mode != SBL_AN_MODE_FIXED)) {
+		sbl_dev_info(sbl->dev, "%d: not autoneg mode - no pages to get", port_num);
+		return -ENODATA;
+	}
+	if (!link->an_rx_count) {
+		sbl_dev_info(sbl->dev, "%d: no an pages to get", port_num);
+		return -ENODATA;
+	}
+
+	if (link->an_rx_count > *count) {
+		/* insufficient space
+		 * update size to say how much we need and return
+		 */
+		*count = link->an_rx_count;
+		return -ENOSPC;
+	}
+
+	for (i = 0; i < link->an_rx_count; ++i)
+		*pages++ = link->an_rx_page[i];
+	*count = link->an_rx_count;
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_get_an_pages);
+
+void sbl_an_dump_state(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	int i;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_ERR_FLG_OFFSET);
+	sbl_dev_dbg(sbl->dev, "an %d: dump: err flgs       0x%llx", port_num, val64);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	sbl_dev_dbg(sbl->dev, "an %d: dump: cfg pcs        0x%llx", port_num, val64);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET);
+	sbl_dev_dbg(sbl->dev, "an %d: dump: cfg pcs an     0x%llx", port_num, val64);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET);
+	sbl_dev_dbg(sbl->dev, "an %d: dump: sts an base pg 0x%llx", port_num, val64);
+
+	sbl_dev_dbg(sbl->dev, "%d base, complete (%lld), state (%lld) (%s), received (%lld) , base page (%lld), lp (%lld), lp_base (%lld) ",
+		    port_num,
+			SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_COMPLETE_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(val64),
+			sbl_an_get_sm_state(sbl, port_num),
+			SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_PAGE_RECEIVED_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_ABILITY_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_BASE_PAGE_GET(val64));
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+
+	sbl_dev_dbg(sbl->dev, "%d next, complete (%lld), state (%lld) (%s), received (%lld) , base page (%lld), lp (%lld), lp_next (%lld) ",
+		    port_num,
+			SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_COMPLETE_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_STATE_GET(val64),
+			sbl_an_get_sm_state(sbl, port_num),
+			SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_PAGE_RECEIVED_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_BASE_PAGE_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_ABILITY_GET(val64),
+			SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_NEXT_PAGE_GET(val64));
+
+	sbl_dev_dbg(sbl->dev, "an %d: dump: sts an next pg 0x%llx", port_num, val64);
+
+	for (i = 0; i < link->an_tx_count; ++i) {
+		sbl_dev_dbg(sbl->dev, "an %d: dump: tx pg %d: 0x%llx", port_num,
+			    i, link->an_tx_page[i]);
+	}
+	for (i = 0; i < link->an_rx_count; ++i) {
+		sbl_dev_dbg(sbl->dev, "an %d: dump: rx pg %d: 0x%llx", port_num,
+			    i, link->an_rx_page[i]);
+	}
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c
new file mode 100644
index 000000000000..e9536283c47a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/random.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes.h"
+#include "sbl_constants.h"
+#include "sbl_serdes_map.h"
+#include "sbl_internal.h"
+
+int sbl_an_page_exchange(struct sbl_inst *sbl, int port_num, unsigned long remaining_jiffies)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int xcng_count = 1;
+	u64 sts_autoneg_next_reg;
+	u32 base = SBL_PML_BASE(port_num);
+	int err;
+
+	/* -- Interrupt based next page exchange sequence -- */
+	do {
+		/* Too many Rx pages ?*/
+		if (xcng_count >= SBL_AN_MAX_RX_PAGES) {
+			sbl_dev_err_ratelimited(sbl->dev, "an %d: rx next page: too many pages %d",
+						port_num, xcng_count);
+			sbl_an_dump_state(sbl, port_num);
+			return -EPROTO;
+		}
+
+		sbl_dev_dbg(sbl->dev, "an %d: next page %d: start", port_num, xcng_count);
+
+		if (sbl_base_link_start_cancelled(sbl, port_num))
+			return -ECANCELED;
+		if (sbl_start_timeout(sbl, port_num))
+			return -ETIMEDOUT;
+
+		/* setup the next page (real or null) */
+		if (xcng_count < link->an_tx_count)
+			sbl_an_setup_next_page(sbl, port_num, xcng_count);
+		else
+			sbl_an_setup_null_page(sbl, port_num);
+
+		/* setup and enable interrupt */
+		err = sbl_an_hw_wait_prepare(sbl, port_num);
+		if (err)
+			return err;
+
+		/* send the next page */
+		sbl_an_send_next_page(sbl, port_num);
+
+		/* wait for next page interrupt */
+		remaining_jiffies = wait_for_completion_timeout(&link->an_hw_change, remaining_jiffies);
+		if (sbl_base_link_start_cancelled(sbl, port_num))
+			return -ECANCELED;
+		if (!remaining_jiffies) {
+			sbl_dev_err(sbl->dev, "an %d: next page %d: exchange timeout", port_num, xcng_count);
+			sbl_an_dump_state(sbl, port_num);
+			return -ETIME;
+		}
+
+		/* check if received page is a next page */
+		if (!sbl_an_is_next_page(sbl, port_num)) {
+			sbl_dev_dbg_ratelimited(sbl->dev, "an %d: next page %d: missing next page indication, resend next-page",
+						port_num, xcng_count);
+			sbl_an_dump_state(sbl, port_num);
+			continue;
+
+		}
+
+		/* put the received page in the buffer if indicated */
+		if (link->an_rx_page[xcng_count - 1] & AN_NP_NP_MASK) {
+			sts_autoneg_next_reg = sbl_read64(sbl, base |
+						  SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET);
+			link->an_rx_page[xcng_count] =
+				SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_NEXT_PAGE_GET(sts_autoneg_next_reg);
+			sbl_dev_dbg(sbl->dev, "an %d: rx next page: 0x%llx",
+				    port_num, link->an_rx_page[xcng_count]);
+			link->an_rx_count++;
+		}
+
+		/* go to the additional next page */
+		xcng_count++;
+
+		/* check to see if the exchange is done */
+	} while (!sbl_an_next_is_complete(sbl, port_num));
+
+	return 0;
+}
+
+void sbl_an_version_read(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	/* cassini version here */
+	/* TODO: Implement dynamic version detection from HW device tree or runtime detection.
+	 * Currently hardcoded to CASSINI_V1. Should query actual hardware version
+	 * during autonegotiation setup to properly report link partner capability.
+	 */
+	link->an_tx_page[2] |= ((SBL_LP_SUBTYPE_CASSINI_V1 & AN_LP_SUBTYPE_MASK) << AN_LP_SUBTYPE_BASE_BIT);
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_link_nic.c
new file mode 100644
index 000000000000..2c0be275d019
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_link_nic.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+#include <linux/hpe/sbl/sbl_fec.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_serdes_map.h"
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes.h"
+#include "sbl_serdes_fn.h"
+#include "sbl_internal.h"
+
+/**
+ * sbl_link_get_fec_thresholds() - Get fec thresholds
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @ucw_bad: Pointer to an int where output is stored(ucw threshold value)
+ * @ccw_bad: Pointer to an int where output is stored(ccw threshold value)
+ * @fecl_warn: Pointer to an int where output is stored(warn threshold value)
+ *
+ * Get threshold values based on link mode used.
+ * @ucw_bad, @ucw_bad and @fecl_warn holds the values and
+ * returns through provided pointers to the caller.
+ *
+ * Return the failure and warning thresholds for fec metrics
+ * monitoring
+ *
+ * The ccw values used here corresponds to a BER of 1.e-4
+ * The ucw values correspond to a little less than 1e-10
+ * The single lane fec warning threshold is the ccw rate divided by
+ * the number of fec lanes in use for the mode.
+ *
+ *
+ * 200G LINK (BS) (CD)
+ *   212500000000 bits/second over a 4-lane link @ 200G
+ *   39062500 cw/s (5440 bits/codeword)
+ *
+ *   (Post)Pre-FEC BER
+ *  21250000.000000 (un)corrected cw/s => 1e-04 BER (1 bad bit per codeword)
+ *   2125000.000000 (un)corrected cw/s => 1e-05 BER
+ *    212500.000000 (un)corrected cw/s => 1e-06 BER
+ *     21250.000000 (un)corrected cw/s => 1e-07 BER
+ *      2125.000000 (un)corrected cw/s => 1e-08 BER
+ *       212.500000 (un)corrected cw/s => 1e-09 BER
+ *        21.250000 (un)corrected cw/s => 1e-10 BER
+ *         2.125000 (un)corrected cw/s => 1e-11 BER
+ *         0.212500 (un)corrected cw/s => 1e-12 BER
+ *         0.021250 (un)corrected cw/s => 1e-13 BER
+ *         0.002125 (un)corrected cw/s => 1e-13 BER
+ *
+ * 100G LINK (BJ)
+ *   103125000000 bits/second over a 4-lane link @ 100G
+ *   19531250 cw/s (5280 bits/codeword)
+ *
+ *   (Post) Pre-FEC BER
+ *   1031250.000000 (un)corrected cw/s => 1e-05 BER (1 bad bit per codeword)
+ *    103125.000000 (un)corrected cw/s => 1e-06 BER
+ *     10312.500000 (un)corrected cw/s => 1e-07 BER
+ *      1031.250000 (un)corrected cw/s => 1e-08 BER
+ *       103.125000 (un)corrected cw/s => 1e-09 BER
+ *        10.312500 (un)corrected cw/s => 1e-10 BER
+ *         1.031250 (un)corrected cw/s => 1e-11 BER
+ *         0.103125 (un)corrected cw/s => 1e-12 BER
+ *
+ * Cassini uses the old
+ *    sbl_link_get_fec_thresholds()
+ * Rosetta uses the newer
+ *    sbl_link_get_ucw_thresh_ieee()
+ *    sbl_link_get_ucw_thresh_hpe()
+ *    sbl_link_get_ccw_thresh_ieee()
+ *    sbl_link_get_ccw_thresh_hpe()
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_link_get_fec_thresholds(struct sbl_inst *sbl, int port_num,
+				int *ucw_bad, int *ccw_bad, int *fecl_warn)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int ucw;
+	int ccw;
+	int warn;
+
+	if (link->sstate != SBL_SERDES_STATUS_RUNNING)
+		return -ENAVAIL;
+
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		ucw = 21;
+		ccw = 21250000;
+		warn = ccw / 8;
+		break;
+	case SBL_LINK_MODE_BJ_100G:
+		ucw = 11;
+		ccw = 10312500;
+		warn = ccw / 8;
+		break;
+	case SBL_LINK_MODE_CD_100G:
+		ucw = 11;
+		ccw = 10625000;
+		warn = ccw / 4;
+		break;
+	case SBL_LINK_MODE_CD_50G:
+		ucw = 5;
+		ccw = 5312500;
+		warn = ccw / 2;
+		break;
+	default:
+		sbl_dev_err(sbl->dev, "%d: bad mode for fec thresh", port_num);
+		return -ENAVAIL;
+	}
+
+	if (ucw_bad)
+		*ucw_bad = ucw;
+	if (ccw_bad)
+		*ccw_bad = ccw;
+	if (fecl_warn)
+		*fecl_warn = warn;
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_link_get_fec_thresholds);
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_base_link_llr_sysfs_sprint() - Report LLR on/off status into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function checks the state info flags of LLR.
+ * Based on this flag, it formats the string indicating
+ * whether LLR is on/off and writes it into provided buffer
+ *
+ * Context: Process context, Acquires lock and release link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_base_link_llr_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+
+	spin_lock(&link->lock);
+
+	if (READ_ONCE(link->link_info) & SBL_LINK_INFO_LLR_RUN)
+		s += scnprintf(buf + s, size - s, "on");
+	else
+		s += scnprintf(buf + s, size - s, "off");
+
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_base_link_llr_sysfs_sprint);
+
+/**
+ * sbl_base_link_loopback_sysfs_sprint() - Report loopback mode status into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function gets the loopback mode status and
+ * formats the string into the provided buffer
+ *
+ * Context: Process context, Acquires lock and release link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_base_link_loopback_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+
+	spin_lock(&link->lock);
+
+	s += scnprintf(buf + s, size - s, sbl_loopback_mode_str(link->loopback_mode));
+
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_base_link_loopback_sysfs_sprint);
+#endif

-- 
2.56.0

