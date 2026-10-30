Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394103;
	b=i9eGh6yAiPwGXhd7SqlN/xpkFoR6zQctd2XboBflXfwKW8S+C71G9grnIMworFPwSkRV
	 Y6/xgo3g/yT/0hoC/aiMM4cMV29su4ejorwx+5uUxqAp+aylJwG+cdqZkLb0tf/zrSA77
	 Nd8g12X1vmXjbxdBaj2nQ2qQHHOVJb6fM+cOjFQS6Z4qIB09UogyomJZzHI9tAw+eo7o3
	 1FbeRBDlAKVjS6koY7S/o7djJ3KFUH3cTIxj7tSAv5Et3C0IsK5j8Jk8WANoYYhW5Q0S1
	 k6PdNiH2XCBSabw0eDChW/eYRxkxzQc+yfvQvJbce3iYMuMLyG1POeBSKjRfxakC/jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394103;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8QhJtoxxoY3CsdzFoDgKlnt8Trx5qK1//btlQyWhfpc=;
	b=Zw7ePO2r/XMit273i7XOHpmSP0fxlH5dCHX8GS+ld8tC3Ns7ckGRH+DoEeOgmCYCjmLr
	 mSVnmvlL/An6sdpfGq7gD5oa+qqXcs1D7BZ4eow6YWMW8/JSNp32902B7yBf45+dpFITn
	 cYV/D+QfHoov86dwwFGc01FE45v1VdvKslfEnzsXgW56lrhiSh4m6A8j9jeZiGhHEB05P
	 haEB7sTDcCCxkaf7sUYBJcz0zltzys2oKLMjQ6xklYRHeXB7SEri8tS15hdKyC6ks7uRA
	 kbcVftjycZlmkRH3381NhEU3m0gtwrns8mqYM9bfmeAofALQ1t+Pepn8iWqnnb1g4ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=PvnFq0ky;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A7606A337;
	Fri, 30 Oct 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5A7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=PvnFq0ky
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJVvKo2052943;
	Fri, 30 Oct 2026 21:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=8Q
	hJtoxxoY3CsdzFoDgKlnt8Trx5qK1//btlQyWhfpc=; b=PvnFq0ky4iHyZnecf1
	ZW84RMyJ7ZrbhPmdK88H+haB5dun9H6qPNJ4RI5S2TeDdMJvHByzblIJlvTHyZxk
	2pqkck7D1Nt4vuMrfOA2lGIWqdgVRTYpHJmfnRVixjsAOct+cnTnw1mMXkCPoYHp
	LOXDKQzq+qMiTDkuOZeQAQy43WeEugOr75OuA8u9zuUfTbSL/e6jRlaVXedKnhEh
	yh6mwFEjkAdcFPK8DqOYm5XXg6GTOfH9Q13iWAq/Ok12ZUKRYD6aTkWdAayM0LSd
	6DhZ6oEEdOtMdGtV3enKXqa02nZcbAg7+YdHB8qIxtndfM2JpEnegNsXXYfVev58
	up7w==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4hmx6hkhnm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:10 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 53A93D2B8;
	Fri, 30 Oct 2026 21:01:09 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:55 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:52 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:52 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3sOgJviEIzTdEaWh7IH6PxI3UUcQOY7emk+DpU9hUyZ3N0ixAYXfbCZ7yuK/IBQoDPsVSt6OMtz7Vvdp9SC8jmJoNdNffG5u1/Uz+UJWNVwL+Dzu1QDDXANn80iHl+pnzF5OxLLwFOg8yX/oSAEiUg1rKbl8JOmjuPFAAgS4lTA0UaXm5+dobfIEiID6/Wbpbodesou5tFLln8u6NIJGH/ZYw3ryFHU1QObU4D88zLjyXgoQnloBT8AzKeNG/8fiSUCV4e5RBaK8IWOfcQ7h2c1o4qmY1hrSJQu7fGHhLlS0bei/mmXQv2QemNczMjM7XXypISUiTTV5aoLctl5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QhJtoxxoY3CsdzFoDgKlnt8Trx5qK1//btlQyWhfpc=;
 b=RZV4AiD2EQO4ZlVs0BU8zkGOmlIjpXOBw4ea8dlJr2jOXqYRus2sIiaS+ltPFuH+UK/64O9tXkOHNUSTaWxc9/MJvk7OQSLgghjncFda4spnEUmC2sUofPTjlPwxtQdjJCKOulQU3pMy/IxOxVsVzneE+/LmzqgGfpjbeUndSHZEBNjuoDFmlnoZto0QA+5oWwy5Jc4TwxiFT0pCzhIzEipBSwYtUxUyyI69zcZcHIlqBhzJhIeSIBZJoqY3UbcNN12P4I6rhVHmEJ2vnD8wQxMD4sSHWdONQaKEKM6ijUW/Jy8ii0xCwHEvfjNSsVM8evAdrWK+CMhm172v7ELprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:49 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:49 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:11 -0700
Subject: [PATCH 15/23] net: hpe: sl: add the NIC binding and logging
 helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-15-8c2c391cc283@hpe.com>
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
X-ClientProxiedBy: DM6PR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::25) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 2c364af2-6c03-474e-cda1-08df36c8e02d
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|921020|56012099006|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022115727099003|261022075727099003|261022105027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ouk1nEoEh4qhSA33QgF/UbT8kXMszsYy8PaiwzVabCcKPhxFC+QDWD1NQp5JSvczEXEfN+xin7y7kXuFmHR/qLlf+ifgsXCqp4StqYrnRyj3KKhsO4nM9xOEmikGEFtFj8Hk0P0JhCuSVxswxNyl95SFmBVnMcG4bUMU3TlaiKV2DFF0x/VHNDCzobjiC5nCSwO+Rgi9c53POpr2RKIEDQh5oINbZ5qBe1QDwllURCTCfAkVo77dk6dsJ6aRl6JmAWbbOLhqK9+AUF5Ur5dgseSf4fJ41ekX4dabSGg1PYlsFPDvAbQ8EhrazeB15RHf45y8HxLphLKqKRYDm2RbydzpkREEYVxxbOzjvvWt/e/wqNDFEIrchk7p89PjlggQPuqk7J9PZJiVqLrLSPlJd7PGN/sXn1vCVz39wwgP7/ihAQdketV2lo5zEyfdJOmUisr+17tHpCwTEsB+pQSO4eGjpI6TxMJU9Ha5J8zK0/KyJVW7pPB9V4RcARsGNt32wYCtFQ4yvplPlktgELM8Dq0yuXgdWPhJ8m6ENQ5hiNnSwzhUwI3HW4u1yla+41VvJI01hAsoRFHDl2IRsCUyr1RxTvjCglQrw9ZzZR2nQ51jSTB+cVmMU7/XF/1IAqgmxe0SIHM9xgtS0SfJx+9qs3lI3H7JTFqZVbEpkJ7bQUCMY8NvUjBDM7iPItd9utnbUrEm6Q+VqNdkMEu5H6DyHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099006)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlE0UnRuMWxPcVo1UWhwWGRYUjFmM08zc1BFNm83bzFVSDVZYWp3MXBYYk16?=
 =?utf-8?B?Vnh1OHR3WW5odDVtMWJLTFBsb0o5MWdNSFNoUFBFZzlKR3d4WTRVU1VsZjVI?=
 =?utf-8?B?WjBjRW84YVJvMllFcm5sNHRVcU02OUgwZFZXbEkrdk02SFNmdFlmQk5FTTJo?=
 =?utf-8?B?alphbVNPT29KWXlWaStER0Z5RVEzRVBkVWVUL253QUhwbjRoUmVwRWQwS0Y2?=
 =?utf-8?B?Nkc0MG9lWEJrOW92a1RuNXFIU2FlZEFqR0Z5bW0xTE1qaUNlNFlwZ3FhWFQ4?=
 =?utf-8?B?bDBZd0xqNVBvbmxpK3pNc1Ivb09hUlV0VDBxbmtxOU0ySDdEdFZGNk05VStS?=
 =?utf-8?B?OVRIZlpTb1RrMGZUNUx4OWZEYWZXTCtWdkwzS2EvaS9HN2FZVjJ3Q29mMVJv?=
 =?utf-8?B?dHJHY2RHV2NMNFNCMVJudlJrcE5tdXpQU2k1MTVRVnI3SXIrWTNpSTEyS052?=
 =?utf-8?B?T2ZORzlkd0NrakJvT2lpT0JYa0lsRkVQUVhUaFhlaUZkcEtCL3d3aGxwSHQw?=
 =?utf-8?B?UTM2Nk9CR1lodlpiUk1YRVZtMzhlUVgzVEpUaUtYU1loNTJTVjY0OHZMNTdz?=
 =?utf-8?B?bWFqRi9US0gwN21zNlpJU0NrN2RUbmRJMWRVcGxTeFg5TnZRNjl6MFBKVlhM?=
 =?utf-8?B?SURNaHVvQkMvVWttSHZ4VkxmVy9wZW1kV3dydDdqVkU5blMrRWcrblc2dUhR?=
 =?utf-8?B?cUc4RFdna0pKUXF1V0Z6eURsNVh0dkdpRXpjdHVReXQ0Z2dNbm9xRi8yVGJj?=
 =?utf-8?B?aXp3WnBMbTBTYU5PRzFBc0lURU9teU5KeUJnYVd0bkpVTkI1RXFpK0tCendH?=
 =?utf-8?B?czlKQkxCK1F6UXhMa20xTUxDYy9OZS81d0tHL2xOOUViS0pEOUpSS3ZweFMz?=
 =?utf-8?B?TW5FQ2Nhb2xadkE4a3dWSmZzRjVjWlQxLzMrSjJvYmFTREJCNmVnRFlaa3NH?=
 =?utf-8?B?RTNlOEcwWkhRYmtjdFNPdGtBS0pSNkphZENzNmlrWmdOZCtkOHBNSzVLakpu?=
 =?utf-8?B?RlpBTWY5Zy9heUM4bTVsRUo3bXdZVnBmU0tNTFZQNmdhcmpmKzJzSisybEpX?=
 =?utf-8?B?Z1JyOENGZFZVd1FQT1pOY1EvS1JWcnVSblJ3VzkrdnI3RC9ETTAvajV4YVNR?=
 =?utf-8?B?ZzVQOG5SM0lROEhwOTVIUnRmNHJxblh1TUhUcEdaR2RWdHNhWmFGQmtyQXFu?=
 =?utf-8?B?a21WRTlkS0IxVUFvcVN3aGtKL1ozT1BmcTJRaUJ4SkduWU5tZ3JweHFtM2hw?=
 =?utf-8?B?azNrdUQ2Q1llMVdadENNUGdpelNIOWJ1RFp1NzltM29pSVo5bFk2U0RBRlM5?=
 =?utf-8?B?SlRBYWpRWm1CRUtPQmtSQTJic0VSUklnQ1NKRDFNbmZtQ29vTFlzcWRlSGtr?=
 =?utf-8?B?NkZOLzZobzZhN2JGT0g3a3pqWVRweWZlMWdvUUZaT05TSlgwK1c4bmdGMW9G?=
 =?utf-8?B?WW1EUnBKS0JzRk90TFN2eTFEa0pucDB5d1JHeGR0UTNZQ1MrQ21LZTZSVlZo?=
 =?utf-8?B?UXIySnJpUU5mamg3TVNyNUFYVVlCZ2dXMkdkN3gyZzFaQW5oYmRtM2hmUU1w?=
 =?utf-8?B?NVlvTWNidFRacVk2L1ZzaUtqUjFHZVJHcXRQaEJlcE1GSnlVTUFxY2ptd3d2?=
 =?utf-8?B?N3ROT0lxRXh0WDA1QjBvc3ovalFxVEhFNDFnb2IrVzZlSW9iSjR0cDBVaUEr?=
 =?utf-8?B?RUdNYnQ4bldkd2EybWhQMlVnRGJEZWVDKzI3UTBxb3dEU2h0akV1WHJ4ZFVU?=
 =?utf-8?B?aGJiV2x6S0wzWGJ6SlJhMjhTdFJaTnlHQTNRaUhqbjNMVkF6TGpoNmJaNldC?=
 =?utf-8?B?VzhVNUhkNkNqK2NNTHQybmpLa3VVRm5xZm5nalo4bGNlSW9BbGx3blQwcFIx?=
 =?utf-8?B?Sk56MnN2eitza01tbHBOQ0tYUEk1SDgvRTI0cjAyL3Z2ZE5udk1WM04yTE0w?=
 =?utf-8?B?eTFWUk1pQU1udWhQcjRrK2t2N0JpejAyRjFxaEw3RHEyY252Tkd6WjhuQlNa?=
 =?utf-8?B?ZkhiOEpsVlpDaitjWWlOcGRGbnRqeXp0Q1FDbEkrOCsrdUFiYnhWSXVqRmIw?=
 =?utf-8?B?NUZEN3d2SGIwMEt4SFJxOTRDKzhtZDVza1MwUGZhZE94OENILy95d1FwVXVP?=
 =?utf-8?B?bzU4MnVlUkdrZmRzVVhhWHNNYW0yWlRBeE15NTNQaTExc1RsQk5aQmx3b1Nq?=
 =?utf-8?B?T1hHeFRuOHJNRlNWQ01WR1M3QXFTRTkzSUdRNnBDcVVSTWJwOC9iVEg2MDJN?=
 =?utf-8?B?UG1FZXN4b3hYMHhmMGthQURaQk9TQkNDMEZBeFdsajFDSXNMNEdNQnFXSWU5?=
 =?utf-8?B?dmdwdXdaRUpiM3hmSFhvM0dwOEtyQlZyVHhDUjQzbVZqNXFuY2NLUT09?=
X-Exchange-RoutingPolicyChecked: EPgVr0sQEgycqtA+J24qJh9ymdOXe8awHRx304x0qhdr3ERSYqHy8Fi3+xUWKUbsRYskhE18N3Dd9YCFkQwdJBUXi5Cuk3N+MvE1JjcBVKrKRdCK6JhRlMSI11a+HDs734/Q2e+/t00AhCHJr2JZ93mav6F6wTYf/q7Xvyy4du4LcYjbhh33ywLpy3J9OJBPuIxVZuHeCyEjQk+mFVeO8x+k+lnGAsJddo4c5rrgrwnE9vCjM4H/lgTCex2OP2/J9f9t1Kvu70ZFNHrVqFu/btu2F5xwh/GSkQIxYzvzkyGzwgLrU9ICAiIo87+G1I18zW0ovOYmUBchIrE3uCArjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c364af2-6c03-474e-cda1-08df36c8e02d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:49.4687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKz0UFx94GNssW38Yw5EfDrY3RA4R54s6b49JsBs4yQ4u2p4uzJqC1LzeIZy69cM0/rg9KP8mq+u4qbWu+gwxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: ToAyTD8bXR2-TtUxYl_4yBcjln5lU4Pt
X-Authority-Analysis: v=2.4 cv=DfuCOftW c=1 sm=1 tr=0 ts=6ae50596 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=J0OTuHAx6l5K1fCpvPfz:22 a=MvuuwTCpAAAA:8 a=QflfBJZxeua8LnXGOOsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX+PbvQNLyDDGO
 hpySkryKiE0MhVxdUoZQxgZBCt5MI7xGxeGgs/FClS1/x9XFpTNHfQ5KAOSUsXgaXpl38R/k88x
 MhMHEyyHS49zGbskiZMyPWnLZRNWlUE=
X-Proofpoint-GUID: ToAyTD8bXR2-TtUxYl_4yBcjln5lU4Pt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX3YJTxGH8DtDb
 A+MQ9dlMoUPnwxjPOwyV9z+GUEzhuPXsuahJUvWMAF0ZgDE/wfN9977mCt198evJfLm6lSEsaxT
 AUSZFJY1UEB5gEZSDhNB2mzW1qG+BEAz/xHBSLKCYAF2TYRK84A9Zst/+rbbbDa5mCPawoPfxAl
 4pUVf1K4xBEWeHUERfagfq10VfSA26zZfLkRNt0zAjTcRxvZaKCrbVinUe6kF8m5NVhDwLW+igX
 Zda9i6W8iXjgUqVS4ddbQPJF+8LXrynEil9lMXSXQwRP5QJpa0yilRzWu0Vb1b/fY6bpNAorBE4
 IJPrdirOjr9EHC3ux7TuOP3p/8uGgXkwuKMfoN7e6r8rM6Mkj1X3OjmaWSvul6nE/UWEEO4LeZf
 uJenb9GPRdZ1NPTHCJ7yrv9+dkdOxwWjQYiEr34NbDE4maVn9uUEOWjt278MLZB3ert0HibpnvA
 nVpCeGAOFAvr7t6t/Xg==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the glue that binds SL to a NIC: ASIC and CSR definitions, the NIC
logical device and media hooks, and the logging helpers.

sl_asic_csrs.h is generated from the hardware register description and
is kept in that form; its integer types were converted to the kernel
types in the same pass as the other UAPI/header cleanups.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (18)
- CHECK: UNNECESSARY_PARENTHESES (16), COMPARISON_TO_NULL (3)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sl/log/sl_log.c   | 566 +++++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/sl/nic/sl_ldev.c  | 147 ++++++++
 drivers/net/ethernet/hpe/sl/nic/sl_media.c |  53 +++
 3 files changed, 766 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sl/log/sl_log.c b/drivers/net/ethernet/hpe/sl/log/sl_log.c
new file mode 100644
index 000000000000..64382f9b46bb
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/log/sl_log.c
@@ -0,0 +1,566 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/sched.h>
+
+#include "sl_asic.h"
+
+#include "sl_log.h"
+
+#include "sl_ldev.h"
+#include "sl_lgrp.h"
+#include "sl_link.h"
+#include "sl_llr.h"
+#include "sl_mac.h"
+
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_llr.h"
+#include "sl_ctrl_mac.h"
+
+#include "sl_core_ldev.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_core_mac.h"
+#include "sl_core_llr.h"
+
+#include "sl_media_ldev.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+
+#include "data/sl_ctrl_data_lgrp_trace.h"
+
+#include "hw/sl_core_hw_intr.h"
+#include "data/sl_core_data_link.h"
+#include "data/sl_core_data_lgrp.h"
+#include "data/sl_core_data_lgrp_trace.h"
+#include "data/sl_core_data_ldev.h"
+
+#include "data/sl_media_data_lgrp_trace.h"
+
+#define SL_LOG_MSG_LEN              150
+#define SL_LOG_NULL_ID_FMT          "%c[-:--:-] ???         "
+#define SL_LOG_DFLT_ID_FMT          "%c[-:--:-] 0x%08X  "
+#define SL_LOG_LDEV_ID_FMT          "%c[%1u:--:-] ldev%1u       "
+#define SL_LOG_LGRP_ID_FMT          "%c[%1u:%02u:-] %-12s"
+#define SL_LOG_LINK_ID_FMT          "%c[%1u:%02u:%1u] %-12s"
+#define SL_LOG_JACK_ID_FMT          "%c[-:--:-] jack%03u     "
+#define SL_LOG_CONTEXT              (in_interrupt() ? '^' : ' ')
+
+static int remaining_chars(int idx)
+{
+	return max(SL_LOG_MSG_LEN - idx, 0);
+}
+
+static void sl_log_msg_create(const char *level, void *ptr, char *msg,
+			      const char *block, const char *name, const char *text)
+{
+	struct sl_ldev            *ldev;
+	struct sl_lgrp            *lgrp;
+	struct sl_link            *link;
+	struct sl_llr             *llr;
+	struct sl_mac             *mac;
+	struct sl_ctrl_ldev       *ctrl_ldev;
+	struct sl_ctrl_lgrp       *ctrl_lgrp;
+	struct sl_ctrl_link       *ctrl_link;
+	struct sl_ctrl_llr        *ctrl_llr;
+	struct sl_ctrl_mac        *ctrl_mac;
+	struct sl_core_ldev       *core_ldev;
+	struct sl_core_lgrp       *core_lgrp;
+	struct sl_core_link       *core_link;
+	struct sl_core_mac        *core_mac;
+	struct sl_core_llr        *core_llr;
+	struct sl_media_ldev      *media_ldev;
+	struct sl_media_lgrp      *media_lgrp;
+	struct sl_media_jack      *media_jack;
+	int                        idx;
+	unsigned long              irq_flags;
+
+	idx = snprintf(msg, SL_LOG_MSG_LEN, "%s%s", level, module_name(THIS_MODULE));
+	if (ptr != NULL) {
+		switch (*((u32 *)ptr)) {
+		case SL_LDEV_MAGIC:
+			ldev = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LDEV_ID_FMT,
+				SL_LOG_CONTEXT,
+				ldev->num, ldev->num);
+			break;
+		case SL_LGRP_MAGIC:
+			lgrp = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LGRP_ID_FMT,
+				SL_LOG_CONTEXT,
+				lgrp->ldev_num, lgrp->num, "lgrp");
+			break;
+		case SL_LINK_MAGIC:
+			link = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				link->ldev_num, link->lgrp_num, link->num, "link");
+			break;
+		case SL_LLR_MAGIC:
+			llr = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				llr->ldev_num, llr->lgrp_num, llr->num, "llr");
+			break;
+		case SL_MAC_MAGIC:
+			mac = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				mac->ldev_num, mac->lgrp_num, mac->num, "mac");
+			break;
+		case SL_CTRL_LDEV_MAGIC:
+			ctrl_ldev = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LDEV_ID_FMT,
+				SL_LOG_CONTEXT,
+				ctrl_ldev->num, ctrl_ldev->num);
+			break;
+		case SL_CTRL_LGRP_MAGIC:
+			ctrl_lgrp = ptr;
+			spin_lock_irqsave(&(ctrl_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LGRP_ID_FMT,
+				SL_LOG_CONTEXT,
+				ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num,
+				ctrl_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(ctrl_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CTRL_LINK_MAGIC:
+			ctrl_link = ptr;
+			spin_lock_irqsave(&(ctrl_link->ctrl_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num,
+				ctrl_link->ctrl_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(ctrl_link->ctrl_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CTRL_LLR_MAGIC:
+			ctrl_llr = ptr;
+			spin_lock_irqsave(&(ctrl_llr->ctrl_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				ctrl_llr->ctrl_lgrp->ctrl_ldev->num, ctrl_llr->ctrl_lgrp->num, ctrl_llr->num,
+				ctrl_llr->ctrl_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(ctrl_llr->ctrl_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CTRL_MAC_MAGIC:
+			ctrl_mac = ptr;
+			spin_lock_irqsave(&(ctrl_mac->ctrl_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				ctrl_mac->ctrl_lgrp->ctrl_ldev->num, ctrl_mac->ctrl_lgrp->num, ctrl_mac->num,
+				ctrl_mac->ctrl_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(ctrl_mac->ctrl_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CORE_LDEV_MAGIC:
+			core_ldev = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LDEV_ID_FMT,
+				SL_LOG_CONTEXT,
+				core_ldev->num, core_ldev->num);
+			break;
+		case SL_CORE_LGRP_MAGIC:
+			core_lgrp = ptr;
+			spin_lock_irqsave(&(core_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LGRP_ID_FMT,
+				SL_LOG_CONTEXT,
+				core_lgrp->core_ldev->num, core_lgrp->num,
+				core_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(core_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CORE_LINK_MAGIC:
+			core_link = ptr;
+			spin_lock_irqsave(&(core_link->core_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				core_link->core_lgrp->core_ldev->num, core_link->core_lgrp->num, core_link->num,
+				core_link->core_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(core_link->core_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CORE_MAC_MAGIC:
+			core_mac = ptr;
+			spin_lock_irqsave(&(core_mac->core_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				core_mac->core_lgrp->core_ldev->num, core_mac->core_lgrp->num, core_mac->num,
+				core_mac->core_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(core_mac->core_lgrp->log_lock), irq_flags);
+			break;
+		case SL_CORE_LLR_MAGIC:
+			core_llr = ptr;
+			spin_lock_irqsave(&(core_llr->core_lgrp->log_lock), irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LINK_ID_FMT,
+				SL_LOG_CONTEXT,
+				core_llr->core_lgrp->core_ldev->num, core_llr->core_lgrp->num, core_llr->num,
+				core_llr->core_lgrp->log_connect_id);
+			spin_unlock_irqrestore(&(core_llr->core_lgrp->log_lock), irq_flags);
+			break;
+		case SL_MEDIA_LDEV_MAGIC:
+			media_ldev = ptr;
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LDEV_ID_FMT,
+				SL_LOG_CONTEXT,
+				media_ldev->num, media_ldev->num);
+			break;
+		case SL_MEDIA_LGRP_MAGIC:
+			media_lgrp = ptr;
+			spin_lock_irqsave(&media_lgrp->log_lock, irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_LGRP_ID_FMT,
+				SL_LOG_CONTEXT,
+				media_lgrp->media_ldev->num, media_lgrp->num,
+				media_lgrp->connect_id);
+			spin_unlock_irqrestore(&media_lgrp->log_lock, irq_flags);
+			break;
+		case SL_MEDIA_JACK_MAGIC:
+			media_jack = ptr;
+			spin_lock_irqsave(&media_jack->log_lock, irq_flags);
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_JACK_ID_FMT,
+				SL_LOG_CONTEXT,
+				media_jack->physical_num);
+			spin_unlock_irqrestore(&media_jack->log_lock, irq_flags);
+			break;
+		default:
+			idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_DFLT_ID_FMT,
+				SL_LOG_CONTEXT,
+				*((u32 *)ptr));
+			break;
+		}
+	} else {
+		idx += snprintf(msg + idx, remaining_chars(idx), SL_LOG_NULL_ID_FMT,
+			SL_LOG_CONTEXT);
+	}
+
+	snprintf(msg + idx, remaining_chars(idx), " %5s-%-10s: %s\n", block, name, text);
+}
+
+void sl_log(void *ptr, const char *level, const char *block,
+	    const char *name, const char *text, ...)
+{
+	char    msg[SL_LOG_MSG_LEN + 1];
+	va_list args;
+
+	if (!level) {
+		pr_err("NULL level\n");
+		return;
+	}
+	if (!block) {
+		pr_err("NULL block\n");
+		return;
+	}
+	if (!name) {
+		pr_err("NULL name\n");
+		return;
+	}
+	if (!text) {
+		pr_err("NULL text\n");
+		return;
+	}
+
+	sl_log_msg_create(level, ptr, msg, block, name, text);
+
+	va_start(args, text);
+	vprintk(msg, args);
+	va_end(args);
+}
+
+void sl_log_err_trace(void *ptr, const char *block,
+		      const char *name, const char *text, ...)
+{
+	int                  rtn;
+	char                 msg[SL_LOG_MSG_LEN + 1];
+	va_list              args;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_ctrl_link  *ctrl_link;
+	struct sl_ctrl_llr   *ctrl_llr;
+	struct sl_ctrl_mac   *ctrl_mac;
+	struct sl_core_lgrp  *core_lgrp;
+	struct sl_core_link  *core_link;
+	struct sl_core_mac   *core_mac;
+	struct sl_core_llr   *core_llr;
+	struct sl_media_lgrp *media_lgrp;
+	bool                  err_trace_enable;
+
+	if (!block) {
+		pr_err("NULL block\n");
+		return;
+	}
+	if (!name) {
+		pr_err("NULL name\n");
+		return;
+	}
+	if (!text) {
+		pr_err("NULL text\n");
+		return;
+	}
+
+	if (ptr == NULL)
+		return;
+
+	switch (*((u32 *)ptr)) {
+	case SL_CTRL_LGRP_MAGIC:
+		ctrl_lgrp = ptr;
+		rtn = sl_ctrl_data_lgrp_is_err_trace_enabled(ctrl_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CTRL_LINK_MAGIC:
+		ctrl_link = ptr;
+		rtn = sl_ctrl_data_lgrp_is_err_trace_enabled(ctrl_link->ctrl_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CTRL_LLR_MAGIC:
+		ctrl_llr = ptr;
+		rtn = sl_ctrl_data_lgrp_is_err_trace_enabled(ctrl_llr->ctrl_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CTRL_MAC_MAGIC:
+		ctrl_mac = ptr;
+		rtn = sl_ctrl_data_lgrp_is_err_trace_enabled(ctrl_mac->ctrl_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CORE_LGRP_MAGIC:
+		core_lgrp = ptr;
+		rtn = sl_core_data_lgrp_is_err_trace_enabled(core_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CORE_LINK_MAGIC:
+		core_link = ptr;
+		rtn = sl_core_data_lgrp_is_err_trace_enabled(core_link->core_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CORE_MAC_MAGIC:
+		core_mac = ptr;
+		rtn = sl_core_data_lgrp_is_err_trace_enabled(core_mac->core_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_CORE_LLR_MAGIC:
+		core_llr = ptr;
+		rtn = sl_core_data_lgrp_is_err_trace_enabled(core_llr->core_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	case SL_MEDIA_LGRP_MAGIC:
+		media_lgrp = ptr;
+		rtn = sl_media_data_lgrp_is_err_trace_enabled(media_lgrp, &err_trace_enable);
+		if (rtn)
+			return;
+		if (!err_trace_enable)
+			return;
+		break;
+	default:
+		return;
+	}
+
+	sl_log_msg_create(KERN_ERR, ptr, msg, block, name, text);
+
+	va_start(args, text);
+	vprintk(msg, args);
+	va_end(args);
+}
+
+void sl_log_warn_trace(void *ptr, const char *block,
+		       const char *name, const char *text, ...)
+{
+	int                   rtn;
+	char                  msg[SL_LOG_MSG_LEN + 1];
+	va_list               args;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_ctrl_link  *ctrl_link;
+	struct sl_ctrl_llr   *ctrl_llr;
+	struct sl_ctrl_mac   *ctrl_mac;
+	struct sl_core_lgrp  *core_lgrp;
+	struct sl_core_link  *core_link;
+	struct sl_core_mac   *core_mac;
+	struct sl_core_llr   *core_llr;
+	struct sl_media_lgrp *media_lgrp;
+	bool                  warn_trace_enable;
+
+	if (!block) {
+		pr_err("NULL block\n");
+		return;
+	}
+	if (!name) {
+		pr_err("NULL name\n");
+		return;
+	}
+	if (!text) {
+		pr_err("NULL text\n");
+		return;
+	}
+
+	if (ptr == NULL)
+		return;
+
+	switch (*((u32 *)ptr)) {
+	case SL_CTRL_LGRP_MAGIC:
+		ctrl_lgrp = ptr;
+		rtn = sl_ctrl_data_lgrp_is_warn_trace_enabled(ctrl_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CTRL_LINK_MAGIC:
+		ctrl_link = ptr;
+		rtn = sl_ctrl_data_lgrp_is_warn_trace_enabled(ctrl_link->ctrl_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CTRL_LLR_MAGIC:
+		ctrl_llr = ptr;
+		rtn = sl_ctrl_data_lgrp_is_warn_trace_enabled(ctrl_llr->ctrl_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CTRL_MAC_MAGIC:
+		ctrl_mac = ptr;
+		rtn = sl_ctrl_data_lgrp_is_warn_trace_enabled(ctrl_mac->ctrl_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CORE_LGRP_MAGIC:
+		core_lgrp = ptr;
+		rtn = sl_core_data_lgrp_is_warn_trace_enabled(core_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CORE_LINK_MAGIC:
+		core_link = ptr;
+		rtn = sl_core_data_lgrp_is_warn_trace_enabled(core_link->core_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CORE_MAC_MAGIC:
+		core_mac = ptr;
+		rtn = sl_core_data_lgrp_is_warn_trace_enabled(core_mac->core_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_CORE_LLR_MAGIC:
+		core_llr = ptr;
+		rtn = sl_core_data_lgrp_is_warn_trace_enabled(core_llr->core_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	case SL_MEDIA_LGRP_MAGIC:
+		media_lgrp = ptr;
+		rtn = sl_media_data_lgrp_is_warn_trace_enabled(media_lgrp, &warn_trace_enable);
+		if (rtn)
+			return;
+		if (!warn_trace_enable)
+			return;
+		break;
+	default:
+		return;
+	}
+
+	sl_log_msg_create(KERN_WARNING, ptr, msg, block, name, text);
+
+	va_start(args, text);
+	vprintk(msg, args);
+	va_end(args);
+}
+
+void sl_log_io_trace(void *ptr, const char *block, const char *name, const char *text, ...)
+{
+	char                 msg[SL_LOG_MSG_LEN + 1];
+	va_list              args;
+	struct sl_core_lgrp *core_lgrp;
+
+	if (!block) {
+		pr_err("NULL block\n");
+		return;
+	}
+	if (!name) {
+		pr_err("NULL name\n");
+		return;
+	}
+	if (!text) {
+		pr_err("NULL text\n");
+		return;
+	}
+
+	if (!ptr)
+		return;
+
+	switch (*((u32 *)ptr)) {
+	case SL_CORE_LGRP_MAGIC:
+		core_lgrp = ptr;
+		if (!sl_core_data_lgrp_is_io_trace_enabled(core_lgrp))
+			return;
+		break;
+	default:
+		return;
+	}
+
+	sl_log_msg_create(KERN_INFO, ptr, msg, block, name, text);
+
+	va_start(args, text);
+	vprintk(msg, args);
+	va_end(args);
+}
+
+void __sl_log_dynamic_dbg(struct _ddebug *desc, void *ptr, const char *block,
+			  const char *name, const char *text, ...)
+{
+	char    msg[SL_LOG_MSG_LEN + 1];
+	va_list args;
+
+	if (!desc) {
+		pr_err("NULL desc\n");
+		return;
+	}
+	if (!block) {
+		pr_err("NULL desc\n");
+		return;
+	}
+	if (!name) {
+		pr_err("NULL name\n");
+		return;
+	}
+	if (!text) {
+		pr_err("NULL text\n");
+		return;
+	}
+
+	sl_log_msg_create(KERN_DEBUG, ptr, msg, block, name, text);
+
+	va_start(args, text);
+	vprintk(msg, args);
+	va_end(args);
+}
diff --git a/drivers/net/ethernet/hpe/sl/nic/sl_ldev.c b/drivers/net/ethernet/hpe/sl/nic/sl_ldev.c
new file mode 100644
index 000000000000..e93cd667dab8
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/nic/sl_ldev.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+
+#include <linux/hpe/sl/sl_ldev.h>
+
+#include "sl_log.h"
+#include "sl_ldev.h"
+#include "sl_media_ldev.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_LDEV_LOG_NAME
+
+int sl_ldev_attr_check(struct sl_ldev_attr *ldev_attr)
+{
+	if (!ldev_attr) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ldev_attr");
+		return -EINVAL;
+	}
+	if (IS_ERR(ldev_attr)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "ldev_attr pointer error");
+		return -EINVAL;
+	}
+	if (ldev_attr->magic != SL_LDEV_ATTR_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev_attr magic");
+		return -EINVAL;
+	}
+	if (ldev_attr->ver != SL_LDEV_ATTR_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev_attr version");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ldev_attr ops");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ldev_attr accessors");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->read64) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops read64");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->write64) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops write64");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->sbus_op) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops sbus_op");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->pmi_op) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops pmi_op");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->pml_intr_register) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops pml_intr_register");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->pml_intr_unregister) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops pml_intr_unregister");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->pml_intr_enable) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops pml_intr_enable");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->pml_intr_disable) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops pml_intr_disable");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->dt_info_get) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops dt_info_get");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->mb_info_get) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops mb_info_get");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->dmac_alloc) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops dmac_alloc");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->dmac_free) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops dmac_free");
+		return -EINVAL;
+	}
+	if (!ldev_attr->ops->dmac_xfer) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ops dmac_xfer");
+		return -EINVAL;
+	}
+
+	if (!ldev_attr->accessors->pci) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor PCI");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors->sbus) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor SBUS");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors->pmi) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor PMI");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors->intr) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor INTR");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors->dt) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor DT");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors->mb) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor MB");
+		return -EINVAL;
+	}
+	if (!ldev_attr->accessors->dmac) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL accessor DMAC");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int sl_ldev_uc_ops_set(struct sl_ldev *ldev, struct sl_uc_ops *uc_ops,
+		       struct sl_uc_accessor *uc_accessor)
+{
+	int rtn;
+
+	rtn = sl_ldev_check(ldev);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "check fail");
+		return rtn;
+	}
+
+	sl_log_dbg(ldev, LOG_BLOCK, LOG_NAME, "uc ops_set");
+
+	rtn = sl_media_ldev_uc_ops_set(ldev->num, uc_ops, uc_accessor);
+	if (rtn) {
+		sl_log_err(ldev, LOG_BLOCK, LOG_NAME, "media_ldev_uc_ops_set failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sl_ldev_uc_ops_set);
diff --git a/drivers/net/ethernet/hpe/sl/nic/sl_media.c b/drivers/net/ethernet/hpe/sl/nic/sl_media.c
new file mode 100644
index 000000000000..dddfaef0cb28
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/nic/sl_media.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "base/sl_media_log.h"
+#include "sl_lgrp.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_MEDIA_LOG_NAME
+
+int sl_media_cable_insert(struct sl_lgrp *lgrp, u8 *eeprom_page0, u8 *eeprom_page1, u32 flags)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "cable insert fail");
+		return rtn;
+	}
+	if (!eeprom_page0) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL eeprom");
+		return -EINVAL;
+	}
+
+	/*
+	 * hardcoding 0 for now since there is only one jack. Might change in future
+	 */
+	return sl_media_jack_cable_insert(lgrp->ldev_num, lgrp->num, 0, eeprom_page0,
+					  eeprom_page1, flags);
+}
+EXPORT_SYMBOL(sl_media_cable_insert);
+
+int sl_media_cable_remove(struct sl_lgrp *lgrp)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "cable remove fail");
+		return rtn;
+	}
+
+	/*
+	 * hardcoding 0 for now since there is only one jack. Might change in future
+	 */
+	return sl_media_jack_cable_remove(lgrp->ldev_num, lgrp->num, 0);
+}
+EXPORT_SYMBOL(sl_media_cable_remove);

-- 
2.56.0

