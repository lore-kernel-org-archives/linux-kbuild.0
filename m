Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394094;
	b=TyU4NewFySxjhiGAGdH4ARdN5X/K9xRcd9Mn/ywks3WeELB4AJEngqA7ScweUpRTTsbL
	 GnFdCOdQ1MO2vTXKG98QDpGpC8mbTyDEnMLiIHMaMRAfxn+ueYytfWOYSl9iYYZSxXqUN
	 LrLmQQrwuLtWYuV0oXBHfZcvzO/vzpdGze6Rkz9mk2gV29QJ1VKfdof79yKhNiu8KZHok
	 54MMB3S3kNTZmFdSn1YZRxBYsm4oPru2duslTAWc/jkdihb9wEdUWmlJUBGn6B5AMIN3U
	 tT98K1MBRKWgjlETstpeyjpJTPm8j41XaXgYRYC1Bc1wbPySBkYCXTg3soy8iQMMC/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394094;
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
	bh=rrc0C/f0u2kGK9foscgQXAVwvl/68rTIsun8PigPDWA=;
	b=UeSmsypmk9J4kIY5mC2AS9o6Ktt5b8k4dIUei1o9stBqhXL36aIojhyioOlkBA5hqF24
	 3ZPrCPZVhCoPPSDO04O5blZXmSyPNEwS/sqOEsT7DVK2Xy5PgzFwA0YXHEh+KFQqKtF5/
	 W1uU7NSb75d80e3F/w3+oC7/Xk1PDnvBL/uAs/l24oGp7y11OZuk0THyy4sWo6f9XUJvR
	 Yz005of6pE+rmRhw4doFblzZUJ4aIcF4IHyVDkxYqc0Ol0FQoGlHFT5rZu0i8Kzkyuty3
	 Oyf0rdp+8oGzNdGaLJhwAssBBcDdS/Y6coExP9mLLFG966D9pZkGQjABcveqHhZyuuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=OpwERkWX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46660A2626;
	Fri, 30 Oct 2026 21:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D46660A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=OpwERkWX
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHxho83237753;
	Fri, 30 Oct 2026 21:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=rr
	c0C/f0u2kGK9foscgQXAVwvl/68rTIsun8PigPDWA=; b=OpwERkWXPBFCCmKKKW
	AZSQm3dsT0s0Qb2r7EhfRPTWPnlHbCA4n6zjg4NnyPCOoZjMkmxfxIJwVp1/T2tw
	mJoU2SP0H1IQNVvJXDs5xeYaLVD0RW1I9YWmrmWtG+jbf+1XLiFylGcIOai1oT5I
	vU3yLULXQzV7cD1nu7x0dgRhII8DpffI7OLNKyLp+UZqhIzjcnw5Ob5iBrvjlW4A
	htnC4YtGTKglThast/1oHDOjQvM1K6lE+bx7XEYKQOArHnDncPzBeVL2JnXyLZoB
	4UXCy0l1Z1mdmmGHao/lL6HKyDQqpfQaCn3Wx1Ii4Krszog+Pl74C6LeFkyo57pa
	c5RQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmw2jvkvt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:02 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id B6903800EE7;
	Fri, 30 Oct 2026 21:01:01 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:00 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:00 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:00 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyb+jYccOVMN7kAVtKIYpCPoo/bvMXyaBnKlwp2YaWNugwpyXL5UarU+QDDiSGuu5Yi2Qf2iq180k6gyJxFrlZEYk9Ja9G+T25IDVdkQDRwzRCSNeSfxlNGC5RMoFGwOuc5xbBH8hyr77LOAophozzty21yioa0AjgceoHq4QFx1EHOE+lVX+/oFYzIKlnAubA7SqTdT8JVL9lFBGur8Jx94Q/1ZqEpgoyTTN8NDYbtf0Ahj0EWQ0wVcvoQ1n3+XLyJYxBFehhh+WnxGOCdnve0SlsCcYirQLjSB8Ot2Qbz1kAB6j1dXIko8j0ItxhaKsT1G7zvM6U/qulo9VP91Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrc0C/f0u2kGK9foscgQXAVwvl/68rTIsun8PigPDWA=;
 b=sDHjsUgM03DfXFDue8n5B2+9MxIF4VMIAv0PGeLyY6dlqH+Btqsv88d9QX2H8iZCsUr9GcgoqoIn8eOHW3+NOGGRWkUYJF4e2STaIG3fZ6nqsFdwmbo6x0Yfp0UcBk7raq1gSXN9CIjxqlGShfw4nYHFZshiKfC5IR+U8SCVKt8YCMQ9tiLjYMwJQZrofHYd377eRw6VK55OSj/slCbUpAoHCOqouMnWCSv/jUKhbsNUhLC5u5QWZ3sEqijLVRt5KviPapxlfVF+JJaXTW8OV3pckUu3ollEr18HQHaWumjNo2rMxt74sbERKPJVeb+Un8geLf9IxGWIsD5MZqOXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:54 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:54 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:12 -0700
Subject: [PATCH 16/23] net: hpe: ss1: add the Cassini core device layer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-16-8c2c391cc283@hpe.com>
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
 Bhoot" <sandeep.bhoot@hpe.com>,
        Iraimani P <iraimani.pavadai@hpe.com>,
        "Mamila Santosh" <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: DS1PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:8:44d::8) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 09d5ca2f-6842-4be9-742a-08df36c8e1f9
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|21046099003|18002099003|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: rE/E4re2Ce+BGbihEN5yGcau05LlC+HB1XgRqabEFUcR2Mqh5jiFHpCarLjcqapnSmdV7cmIhcOFIhoxu/PLXGsvr1eF6fh6n299tq1ZJQT1irodWXSCOXCuGOWL9PYS5Swa0ky9vX7PpC6u3NrR61xRu1tp9Ayn/psgZWJXMK/3FJgJbRgU3D4hqM8cMme0ACfTpxkt9NlnTZ198fk0ipF3iuUpdcpiRsaBvoPEcmzFNt/528sOmVOCNSn61rOQ/3R9KGNajBORJng70vc9Zikep+FwX42HuhQw7EdljZBiC7ETuhLLKIoZYchx4b0LoKlEj9Tjs6esPyAOv9rOceC+VdIDD2+nDJznWVMiV2SKrqEIK/CVfV+5T7g9l1Exq5pBaaTz3v1O/GuptMnXfYdfZRQIKLx62/De3FoASh1YNFD+1mZb6mtA4puwo0TqKsm5RLVoaSsHoBZy26qmRYBgofbeKf0I7e79nkx5YqFAAuCBhhRXemOOwX49V60aSuUq41reP0nkKEwAdbkA3hboRCvVnXH9v6fthXulMJXRsseohDLL+Be1dDW1rUd18BIw5CMwC7arWQadhzrd2rHkEdWbi0MEwnbSiENlYuadTMkbt4Fl58nKirQvGncn1U3xJ68Vf6Et+o91OKY0nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(21046099003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVWdm10bW5SY0hQMyt1R2lIV1Z1eG02UVFZcEFPWTFyc3VJVVBSUE1NOTNl?=
 =?utf-8?B?TE43cnJRTXo4MWwxOUVla080eWEzMFRkMTJ6a042anMrTm5VYWtySE84NjZn?=
 =?utf-8?B?STIzeGJvTHhZQ2pSNVVxTzRaUGM5eDkrU0FPZndOZzVHZjY0UUMwZnlOZ1RQ?=
 =?utf-8?B?Q1dFSGFxei9mSHBvcTJLSXBrSEttVjVmT0JaQ3lzQmpHOTY0ZjJyM3U2ZzNE?=
 =?utf-8?B?WlY3TlFpMkJlaFdkQ3NseDZoQm1RY2ptY1FCLzBXRkdFOHJidzRtbm8xKy9t?=
 =?utf-8?B?dEp0NzRpSHluNHlicCs5SVVhVUJwMFNmVzhRL1Z4dGhhTE1ZeHA1M0hqNlF5?=
 =?utf-8?B?UmhkaDYvVTZMNjkraGRZYnp6RmRUOGJlSG5HdzBzS1VWVm83Y2V4TEVsZGtt?=
 =?utf-8?B?SWh5bHFHZGFTa2xDOEdyRDlteXU3VWtpZGtzb3pKZVBISGVPVkVRb3FLYVZW?=
 =?utf-8?B?dFl2ZVpvb0IwVXhVL2VHVXcvbWZOR05VSWlDNG9sN0tXVVA4cDJwazY2YUFz?=
 =?utf-8?B?NC9KWHhzaXpTcTl0RHZFbDZxSGt1bnlxRmFzdmZjTVdsajVHZFp4QVF4VDlN?=
 =?utf-8?B?NVg0YjN3L2N6OGZYdVN0Sk1Zc3lyMllEZVVaVVgrcHdKb04wTGF2WFltYlBp?=
 =?utf-8?B?S2FMR0UwWFB3Q3lNWDNaNVFuaTBrYzJ0ZWVTaTd5MkJpSXh1SnpKYU55THhu?=
 =?utf-8?B?T3ozRmZQL3lSSlFuWFdoNlZoYTk1cUdxeUpQWWRtbEJEd2RtajgrMTA0Mmoy?=
 =?utf-8?B?cWdjTkpxUkhKMzc2M1lnTGk5RTVaUHlWSHlWRjl4S0NzMnJ4QWU5M2JBeTNZ?=
 =?utf-8?B?TlNyVXBpU0cyd0pwcmtMQklmUTZ3a1MycmhaNnZFYnNFbEdWNkxWSDNGTE05?=
 =?utf-8?B?blVPSERZcUp2M0UveERVUUxrcW1zQ25ncGJtWlF0ckRoZnBFdU5mWFUveEIy?=
 =?utf-8?B?R28yOEFCTm55RnBia1FGZzZ0NThldnFPKzljWjZUcUJ1SGVlTVp3dUNJdFVK?=
 =?utf-8?B?UTZGQXZIQ2NrSFBMV1pMVXlrSUFQZk1mdEZ5T1hWci90cFYrK0RvOE1pZ1NW?=
 =?utf-8?B?VjBSbSs0K054VXZnZThiRWIrbzVvRllqSy9uK1VsNWhxMXFMZ2VIRWNyajZk?=
 =?utf-8?B?aFNncHllY0dYYURCU0RQdWw0MVFtQW1yNGgwZEZzSVk3TUxyNWVkemF0VFZC?=
 =?utf-8?B?RGd4ckhWNXlsYXQ0SUpmVmx3UWErdVRvMlRIMEFOSXgwSHE1c3pqMXhtVkkz?=
 =?utf-8?B?SEtnV3BISFpabkJYM2l4STNCOXBHRGJoVkdTWk5pQVBic1VWZVA2Wlg0SFRC?=
 =?utf-8?B?TWRMaGpVYi85RERlbGlCYno5QXpBcU41eSswbVZkN25ldGN3UlFoZkQ2bEVK?=
 =?utf-8?B?QndHMFo2WTAzQjJkSWw0d1A1RzBKb2Zxdm8yYWZ4cnF4N2l5dE9KS3JMNE5V?=
 =?utf-8?B?dXFqN2MwREdhMnRoM3hXWm05bWxMUGxuWXl2OHJvSkhiOW9jUE05V3VLQjFC?=
 =?utf-8?B?T0wvSFpQSEJFK2xHVDRrUUpKNUFVRDZpVHUrYUVXTGROSy9HaDloaHozL2lD?=
 =?utf-8?B?WXhPbUhMckEzU2dSLy82b0tRNlFzNjB2QlYvclFvTWRUdW5aNnMrRHIrTmNr?=
 =?utf-8?B?eHFJYVB6eDVBYitGcjh0Umo0eGlkUEsrY1dRYythTXhTNXdrcmsyUHJTYXVJ?=
 =?utf-8?B?T05iSHAwU3IvWlMvbEEwSUhWZHE5WUtocTlrMG0rbG1WbUVuN1FTU2gyM0E0?=
 =?utf-8?B?MGtsSXBuRVNBUFVCQzBpZFBiOEsyM1d4Z2Y3djNZTjdtOWIzSXVsQmlaU3ly?=
 =?utf-8?B?R2xrdldYdlhZc0pSNjVzeHF3KzRCRmFBaVpKRzljTVhCRmFCUGhBWjA4ak1H?=
 =?utf-8?B?dDNHUkpXVU1vQjRRVTJNYlZhbUwwdHNUM280TXMrV2RNNmx6cm4rOHVmSkd6?=
 =?utf-8?B?MzlZa3c4bnlqMzlQb2k0dFZlR2RoZU9kNkF2WURqeC9jUGp0ajdGMHAvYUtn?=
 =?utf-8?B?QWFBT1BzV0hMRWpkdWgwT24ySXVOT3dKc1VrTGV4SEZYVWdFU3ZnV3ZiQ2hw?=
 =?utf-8?B?L0dnek5rMkhkbUxYMFJia0hzMjAyNXljT1hUOWtqekd6VTZXS3U2bk1rSDll?=
 =?utf-8?B?Qm5tVEZKS3hWSFRueGFIVEhXSnlVVmZRQjNqNWF3WGJqNS9iRFEwSFFpNEpQ?=
 =?utf-8?B?YmtTZXZMbXV4eU45RVlkdEkxY0dnY252ZkdtT1BpTi80VGNQU2EvemVqc3VC?=
 =?utf-8?B?Ty9PS2hJOXM2eXMvaGY1QzE2SlIrN2ovcTQ5WFIwWVVCSEFSMisrMFhvbUd2?=
 =?utf-8?B?c3NJZThFb0Z4T29XRkhnSldDeUo0Z1g4WmZFbktReHBTU21hN1YxQT09?=
X-Exchange-RoutingPolicyChecked: a9am+B5waoKl6o/DGJ0tF2smRMXGcSor2EPnHhwR29S44oaGtEKgeookZMnFgDgEFunW8saxYthYkZGgWhUHfrkPydV9J7lyZVzWzTwUJ9tsRozIyVpvAB9H1ITjrWqlRhE5pkp0Hl6URujqVRe9n28bb/NEQ6iuvfiiXiIOpkTm+uGaMSf26Ye22AwIO7VCmfncyeTwNSP/n/QVf0wamQvwvzsJIyerT5A75N5ofqCwP/5/op8IEkuNwjGvelFdCjFSUDs1BfU/Kgcd8+kt/VJ4wPaSQi8xzeoagpkbFknCBij1ZopnLNPEpQNGzLN9yQP2L8jkCDKiHxf5h2u4Cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d5ca2f-6842-4be9-742a-08df36c8e1f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:54.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ3IKM9WjAM6BXJBVj+Y8QlNWbhY1egHIdEuXIexkPCKk0Zjq/0FkeU+cMPeoH8NdfiEUPepQnOhpYrPMsDc7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX6FrEh6I+2wwS
 XgHbMGDdxKFCW97QuObxZkMKcFRVoRq/rsIuWTz+cRGZ9s2s6iK3C4S4jStrZXw2A+HxrCgG3IH
 rkN6fM7bwR53tPWQnldNejL6TFk5g5g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4aW28FRYQWJT
 R2KvVI6m5/twAfIKV+3uUl++bOJuVIKa+Ps9/7ZHROM4mzxeBMgZxgVKfnuE7OYC2sxGHHeu4Tt
 /rjeR0hNdJzqyGqIsC7QEITtbKeHKi35MlW8jlaI5zpp1Qc7zWU+2rsXtV78GVmY7RN9VXVmkqb
 dDhyqQZvVlCGSgeGgf+xUKeXitE+Afh2zILnuV0h9ctfqxICK0NnZTlVuJ5LO9DBBdvue5efmSl
 yEDS/Cy2Cs5OpHHD51EFUm6B8NYGS9kqjbPp86eQTS+RFUqhWCNa/2iXGO8P3vx5aVpGtuVU+nb
 1oV5trLLcmHESsEULFW77jDZgJ+WG31MhqHtbe5+8J58neMscAp1atFItL2bRZscIDTigPSJHVV
 cvarFy9AkbHfU38LwIp5CfIAY1KzLrvCu02uWwAeC+FA5uLzNQJeNQibWzvx67ddk+CllZiOKgm
 E7vxZCM1bHpjxC9VKOA==
X-Authority-Analysis: v=2.4 cv=QOn91QLL c=1 sm=1 tr=0 ts=6ae5058e cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=I0CVDw5ZAAAA:8 a=iGbCS3zQAAAA:8 a=MvuuwTCpAAAA:8
 a=OYxYWkJugu8vdt9jpLYA:9 a=UKJKs2caTbgaU9aD:21 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=oRZS8w7TM5j8Y1SnqK-S:22
X-Proofpoint-GUID: 541nuRCe3tU9z1vCozWOT5vpnJbHZ-sh
X-Proofpoint-ORIG-GUID: 541nuRCe3tU9z1vCozWOT5vpnJbHZ-sh
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the PCI device core: probe and remove, device information, interrupt
setup, cable and link handling and the debugfs interface.

The private headers of the whole driver are added with this patch so
that each later patch, which adds the sources of one layer, compiles
on its own.

Known limitation, deferred to V2: this patch carries SR-IOV
virtual-function code (VF-to-PF mailbox requests, mailbox opcodes or VF
resource handling) from an older, incomplete version of the Cassini
SR-IOV support. V2 of this series will include the updated SR-IOV
implementation, so issues in the VF paths should be ignored for now.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- ERROR: COMPLEX_MACRO (5), FLEXIBLE_ARRAY (4)
- WARNING: LEADING_SPACE (47), SPDX_LICENSE_TAG (8), ENOTSUPP (6),
  PREFER_DEFINED_ATTRIBUTE_MACRO (3), BLOCK_COMMENT_STYLE (2),
  MACRO_ARG_UNUSED (2), RETURN_VOID (2), ALLOC_WITH_SIZEOF (1),
  AVOID_BUG (1), BRACES (1), DEPRECATED_API (1), LONG_LINE (1),
  LONG_LINE_COMMENT (1), STRCPY (1)
- CHECK: UNCOMMENTED_DEFINITION (32), BRACES (15), COMPARISON_TO_NULL
  (15), MACRO_ARG_PRECEDENCE (14), MACRO_ARG_REUSE (13), BIT_MACRO (5),
  AVOID_EXTERNS (4), UNNECESSARY_PARENTHESES (4), OPEN_ENDED_LINE (3),
  LINE_SPACING (1), PARENTHESIS_ALIGNMENT (1)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Iraimani P <iraimani.pavadai@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cass_cable.c          |  702 ++++
 drivers/net/ethernet/hpe/ss1/cass_cable.h          |  157 +
 drivers/net/ethernet/hpe/ss1/cass_core.c           | 1564 ++++++++
 drivers/net/ethernet/hpe/ss1/cass_core.h           | 1472 ++++++++
 drivers/net/ethernet/hpe/ss1/cass_dev_info.c       |   60 +
 drivers/net/ethernet/hpe/ss1/cass_irq.c            |  210 ++
 drivers/net/ethernet/hpe/ss1/cass_link.c           |  192 +
 drivers/net/ethernet/hpe/ss1/cass_link_misc.c      |  159 +
 drivers/net/ethernet/hpe/ss1/cass_p2p.h            |   69 +
 drivers/net/ethernet/hpe/ss1/cass_rgroup.h         |   30 +
 drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.h  |   15 +
 drivers/net/ethernet/hpe/ss1/cass_sbl.h            |  581 +++
 drivers/net/ethernet/hpe/ss1/cass_sl.h             |   95 +
 drivers/net/ethernet/hpe/ss1/cass_sl_io.h          |   19 +
 drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.c    |  824 +++++
 drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.h    |   86 +
 drivers/net/ethernet/hpe/ss1/cass_telem_tables.h   | 3874 ++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_trace.h          |   60 +
 drivers/net/ethernet/hpe/ss1/cass_vf.h             |   59 +
 drivers/net/ethernet/hpe/ss1/cass_vf_notif.h       |   34 +
 drivers/net/ethernet/hpe/ss1/cuc_cxi.h             |  370 ++
 drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.h   |   20 +
 drivers/net/ethernet/hpe/ss1/cxi_aux_dev.h         |   14 +
 drivers/net/ethernet/hpe/ss1/cxi_config.h          |  234 ++
 drivers/net/ethernet/hpe/ss1/cxi_configuration.h   |  332 ++
 drivers/net/ethernet/hpe/ss1/cxi_core.h            |  434 +++
 drivers/net/ethernet/hpe/ss1/cxi_eth.h             |  352 ++
 drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.h     |   26 +
 drivers/net/ethernet/hpe/ss1/cxi_ethtool.h         |   26 +
 drivers/net/ethernet/hpe/ss1/cxi_ethtool_names.h   |  110 +
 drivers/net/ethernet/hpe/ss1/cxi_internal.h        |   39 +
 drivers/net/ethernet/hpe/ss1/cxi_link.h            |   65 +
 drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.h    |  149 +
 drivers/net/ethernet/hpe/ss1/cxi_rgroup.h          |   68 +
 drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.h    |  135 +
 .../net/ethernet/hpe/ss1/cxi_rxtx_profile_list.h   |   53 +
 drivers/net/ethernet/hpe/ss1/cxi_vf_cmd.h          |   52 +
 drivers/net/ethernet/hpe/ss1/pldm_cxi.h            |  374 ++
 38 files changed, 13115 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cass_cable.c b/drivers/net/ethernet/hpe/ss1/cass_cable.c
new file mode 100644
index 000000000000..a9008a839bd5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_cable.c
@@ -0,0 +1,702 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2022,2025 Hewlett Packard Enterprise Development LP */
+
+/* Cassini HSN cable support */
+
+#include <linux/hpe/sbl/sbl.h>
+#include "cass_core.h"
+#include "cass_cable.h"
+
+static int cass_hdsh_get_format(struct cass_dev *hw, u8 *qsfp_format);
+static void cass_hdsh_get_media(struct cass_dev *hw,
+				struct sbl_media_attr *attr, u8 qsfp_format);
+static void cass_hdsh_get_info(struct cass_dev *hw,
+			       struct sbl_media_attr *attr, u8 qsfp_format);
+static void cass_hdsh_get_length(struct cass_dev *hw,
+				 struct sbl_media_attr *attr, u8 qsfp_format);
+static void cass_hdsh_get_vendor(struct cass_dev *hw,
+				 struct sbl_media_attr *attr, u8 qsfp_format);
+static int cass_link_headshell_down_no_media(struct cass_dev *hw, int reason);
+
+/**
+ * cass_is_cable_present() - Check if we have an HSN cable installed
+ *
+ * @hw: the device
+ *
+ * Return: 1 if cable present, else 0
+ */
+int cass_is_cable_present(struct cass_dev *hw)
+{
+	if (!HW_PLATFORM_ASIC(hw))
+		return 1;
+	return (hw->qsfp_eeprom_page_len != 0);
+}
+
+/**
+ * cass_parse_heashell_data() - Read the QSFP EEPROM and parse into attr
+ *
+ * @hw: the device
+ * @attr: pointer to struct to initialize with cable information
+ * @qsfp_format: What spec this cable CSR space is organized according to.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_parse_heashell_data(struct cass_dev *hw, struct sbl_media_attr *attr,
+			     u8 *qsfp_format)
+{
+	int rc = 0;
+
+	mutex_lock(&hw->qsfp_eeprom_lock);
+
+	if (hw->qsfp_eeprom_page_len <= 0) {
+		cxidev_err(&hw->cdev,
+			   "Failed to parse headshell data. EEPROM data unavailable!\n");
+		rc = -EIO;
+		goto out_unlock;
+	}
+
+	/* Start by determining the cable format */
+	rc = cass_hdsh_get_format(hw, qsfp_format);
+	if (rc)
+		goto out_unlock;
+
+	/* Read out media type information and parse into attr */
+	cass_hdsh_get_media(hw, attr, *qsfp_format);
+
+	/* Read out the supported speed modes into attr */
+	cass_hdsh_get_info(hw, attr, *qsfp_format);
+
+	/* Read out media length information into attr */
+	cass_hdsh_get_length(hw, attr, *qsfp_format);
+
+	/* Read out vendor information and parse into attr */
+	cass_hdsh_get_vendor(hw, attr, *qsfp_format);
+
+ out_unlock:
+	mutex_unlock(&hw->qsfp_eeprom_lock);
+	return rc;
+}
+
+/**
+ * cass_hdsh_get_format() - Read the QSFP EEPROM and parse out the media format
+ *
+ * @hw: the device
+ * @qsfp_format: pointer to spec this cable CSR space is organized according to
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_hdsh_get_format(struct cass_dev *hw, u8 *qsfp_format)
+{
+	if (hw->qsfp_eeprom_page0[QSFP_IDENTIFIER_OFFSET] >= SFF8024_TYPE_QSFPDD) {
+		// What revision compliance do they claim
+		if (hw->qsfp_eeprom_page0[QSFP_REV_CMPL_OFFSET] < 0x27)
+			/* Very similar to CMIS 2.0, might need to distinguish
+			 *  someday?
+			 */
+			*qsfp_format = QDD_SFF8636;
+		else {
+			*qsfp_format = QDD_CMIS;
+			/* CMIS V3.0-V4.0 are mostly compatible.
+			 * Version-specific differences are handled in the code.
+			 */
+			/* allow CMIS v5.* */
+			if (hw->qsfp_eeprom_page0[QSFP_REV_CMPL_OFFSET] >= 0x60) {
+				cxidev_err(&hw->cdev,
+					   "Failed to parse headshell data. Bad CMIS rev (%d)!\n",
+					   hw->qsfp_eeprom_page0[QSFP_REV_CMPL_OFFSET]);
+				return -EMEDIUMTYPE;
+			}
+		}
+	} else
+		// Treat anything else as SFF-8636 Format
+		*qsfp_format = QDD_SFF8636;
+
+	return 0;
+}
+
+/**
+ * cass_hdsh_get_media() - Read the QSFP EEPROM and parse out the media type
+ *
+ * @hw: the device
+ * @attr: pointer to struct to initialize with cable information
+ * @qsfp_format: What spec this cable CSR space is organized according to.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static void cass_hdsh_get_media(struct cass_dev *hw,
+				struct sbl_media_attr *attr, u8 qsfp_format)
+{
+	u8 qsfp_media;
+
+	if (qsfp_format == QDD_CMIS)
+		qsfp_media = hw->qsfp_eeprom_page0[CMIS_MEDIA_TYPE_OFFSET];
+	else /* QDD_SFF8636 */
+		qsfp_media = hw->qsfp_eeprom_page0[SFF8436_MEDIA_TYPE_OFFSET];
+	if (qsfp_media >= MEDIA_COPPER_UNEQ)
+		attr->media = SBL_LINK_MEDIA_ELECTRICAL;
+	else
+		attr->media = SBL_LINK_MEDIA_OPTICAL;
+}
+
+/**
+ * cass_hdsh_get_info() - Read the QSFP EEPROM and parse out the media info
+ *
+ * @hw: the device
+ * @attr: pointer to struct to initialize with cable information
+ * @qsfp_format: What spec this cable CSR space is organized according to.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static void cass_hdsh_get_info(struct cass_dev *hw,
+			       struct sbl_media_attr *attr, u8 qsfp_format)
+{
+	if (attr->media == SBL_LINK_MEDIA_ELECTRICAL)
+		// For copper cables, we support all link modes
+		attr->info = SBL_MEDIA_INFO_SUPPORTS_BS_200G |
+			SBL_MEDIA_INFO_SUPPORTS_BJ_100G |
+			SBL_MEDIA_INFO_SUPPORTS_CD_100G |
+			SBL_MEDIA_INFO_SUPPORTS_CD_50G;
+	else {
+		if (qsfp_format == QDD_CMIS)
+			/* TODO - CMIS support is not immediately required */
+			return;
+		/* else: QDD_SFF8636 */
+		/* SFF8636 is not supported, so advertise all link mode
+		 *  are supported.
+		 */
+		attr->info = SBL_MEDIA_INFO_SUPPORTS_BS_200G |
+			SBL_MEDIA_INFO_SUPPORTS_BJ_100G |
+			SBL_MEDIA_INFO_SUPPORTS_CD_100G |
+			SBL_MEDIA_INFO_SUPPORTS_CD_50G;
+	}
+}
+
+/**
+ * cass_hdsh_get_length() - Read the QSFP EEPROM and parse out the media length
+ *
+ * @hw: the device
+ * @attr: pointer to struct to initialize with cable information
+ * @qsfp_format: What spec this cable CSR space is organized according to.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static void cass_hdsh_get_length(struct cass_dev *hw,
+				 struct sbl_media_attr *attr, u8 qsfp_format)
+{
+	u8 qsfp_length;
+	int mult, qsfp_length_mm;
+
+	if (qsfp_format == QDD_CMIS) {
+		qsfp_length = hw->qsfp_eeprom_page0[CMIS_CABLE_LEN_OFFSET];
+		mult = (qsfp_length & 0xC0) >> 6;
+		qsfp_length &= 0x3F;
+		switch (mult) {
+		case 0:
+			attr->len = qsfp_length * 10;
+			break;
+		case 1:
+			attr->len = qsfp_length * 100;
+			break;
+		case 2:
+			attr->len = qsfp_length * 1000;
+			break;
+		case 3:
+			attr->len = qsfp_length * 10000;
+			break;
+		default:
+			attr->len = 0;
+			break;
+		}
+	} else { /* QDD_SFF8636 */
+		qsfp_length = hw->qsfp_eeprom_page0[SFF8436_LINK_LEN_OFFSET];
+		attr->len = qsfp_length * 100;
+	}
+
+	/* TODO - sbl_link_len will be converted to len in cm, rather than
+	 *  this enum. Remove this section when that happens
+	 */
+	qsfp_length_mm = attr->len * 10;
+	switch (qsfp_length_mm) {
+	case 300:
+		attr->len = SBL_LINK_LEN_000_300; break;
+	case 400:
+		attr->len = SBL_LINK_LEN_000_400; break;
+	case 750:
+		attr->len = SBL_LINK_LEN_000_750; break;
+	case 800:
+		attr->len = SBL_LINK_LEN_000_800; break;
+	case 1000:
+		attr->len = SBL_LINK_LEN_001_000; break;
+	case 1100:
+		attr->len = SBL_LINK_LEN_001_100; break;
+	case 1150:
+		attr->len = SBL_LINK_LEN_001_150; break;
+	case 1200:
+		attr->len = SBL_LINK_LEN_001_200; break;
+	case 1400:
+		attr->len = SBL_LINK_LEN_001_400; break;
+	case 1420:
+		attr->len = SBL_LINK_LEN_001_420; break;
+	case 1500:
+		attr->len = SBL_LINK_LEN_001_500; break;
+	case 1600:
+		attr->len = SBL_LINK_LEN_001_600; break;
+	case 1640:
+		attr->len = SBL_LINK_LEN_001_640; break;
+	case 1700:
+		attr->len = SBL_LINK_LEN_001_700; break;
+	case 1900:
+		attr->len = SBL_LINK_LEN_001_900; break;
+	case 1910:
+		attr->len = SBL_LINK_LEN_001_910; break;
+	case 2000:
+		attr->len = SBL_LINK_LEN_002_000; break;
+	case 2100:
+		attr->len = SBL_LINK_LEN_002_100; break;
+	case 2130:
+		attr->len = SBL_LINK_LEN_002_130; break;
+	case 2200:
+		attr->len = SBL_LINK_LEN_002_200; break;
+	case 2300:
+		attr->len = SBL_LINK_LEN_002_300; break;
+	case 2390:
+		attr->len = SBL_LINK_LEN_002_390; break;
+	case 2400:
+		attr->len = SBL_LINK_LEN_002_400; break;
+	case 2500:
+		attr->len = SBL_LINK_LEN_002_500; break;
+	case 2600:
+		attr->len = SBL_LINK_LEN_002_600; break;
+	case 2620:
+		attr->len = SBL_LINK_LEN_002_620; break;
+	case 2700:
+		attr->len = SBL_LINK_LEN_002_700; break;
+	case 2800:
+		attr->len = SBL_LINK_LEN_002_800; break;
+	case 2900:
+		attr->len = SBL_LINK_LEN_002_900; break;
+	case 2990:
+		attr->len = SBL_LINK_LEN_002_990; break;
+	case 3000:
+		attr->len = SBL_LINK_LEN_003_000; break;
+	case 4000:
+		attr->len = SBL_LINK_LEN_004_000; break;
+	case 5000:
+		attr->len = SBL_LINK_LEN_005_000; break;
+	case 6000:
+		attr->len = SBL_LINK_LEN_006_000; break;
+	case 7000:
+		attr->len = SBL_LINK_LEN_007_000; break;
+	case 8000:
+		attr->len = SBL_LINK_LEN_008_000; break;
+	case 10000:
+		attr->len = SBL_LINK_LEN_010_000; break;
+	case 14000:
+		attr->len = SBL_LINK_LEN_014_000; break;
+	case 15000:
+		attr->len = SBL_LINK_LEN_015_000; break;
+	case 19000:
+		attr->len = SBL_LINK_LEN_019_000; break;
+	case 25000:
+		attr->len = SBL_LINK_LEN_025_000; break;
+	case 30000:
+		attr->len = SBL_LINK_LEN_030_000; break;
+	case 35000:
+		attr->len = SBL_LINK_LEN_035_000; break;
+	case 50000:
+		attr->len = SBL_LINK_LEN_050_000; break;
+	case 75000:
+		attr->len = SBL_LINK_LEN_075_000; break;
+	case 100000:
+		attr->len = SBL_LINK_LEN_100_000; break;
+	default:
+		attr->len = SBL_LINK_LEN_INVALID;
+		cxidev_warn(&hw->cdev, "No valid enum found for link length %d!",
+			    qsfp_length_mm);
+		break;
+	}
+}
+
+/**
+ * cass_hdsh_get_vendor() - Read the QSFP EEPROM and parse out the media vendor
+ *
+ * @hw: the device
+ * @attr: pointer to struct to initialize with cable information
+ * @qsfp_format: What spec this cable CSR space is organized according to.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static void cass_hdsh_get_vendor(struct cass_dev *hw,
+				 struct sbl_media_attr *attr, u8 qsfp_format)
+{
+	const char *qsfp_vendor;
+
+	if (qsfp_format == QDD_CMIS)
+		qsfp_vendor = &(hw->qsfp_eeprom_page0[CMIS_VENDOR_OFFSET]);
+	else /* QDD_SFF8636 */
+		qsfp_vendor = &(hw->qsfp_eeprom_page0[SFF8436_VENDOR_OFFSET]);
+
+	if (strnstr(qsfp_vendor, QDD_VENDOR_TE, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_TE;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_LEONI, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_LEONI;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_MOLEX, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_MOLEX;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_HISENSE, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_HISENSE;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_DUST_PHOTONICS, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_DUST_PHOTONICS;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_FINISAR, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_FINISAR;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_LUXSHARE, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_LUXSHARE;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_FIT, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_FIT;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_FT, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_FT;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_MELLANOX, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_MELLANOX;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_HITACHI, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_HITACHI;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_HPE, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_HPE;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_CLOUD_LIGHT, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_CLOUD_LIGHT;
+	else if (strnstr(qsfp_vendor, QDD_VENDOR_AMPHENOL, QSFP_VENDOR_MAX_STR_LEN) != NULL)
+		attr->vendor = SBL_LINK_VENDOR_AMPHENOL;
+	else {
+		cxidev_warn(&hw->cdev, "No valid enum found for link Vendor %.*s",
+			    QSFP_VENDOR_MAX_STR_LEN, qsfp_vendor);
+		attr->vendor = SBL_LINK_VENDOR_INVALID;
+	}
+}
+
+/**
+ * cass_headshell_power_up() - Power headshell up to high power mode
+ *
+ * @hw: the device
+ * @qsfp_format: What spec this cable CSR space is organized according to.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_headshell_power_up(struct cass_dev *hw, u8 qsfp_format)
+{
+	u8 qsfp_extid, data;
+	int rc = 0;
+
+	mutex_lock(&hw->qsfp_eeprom_lock);
+
+	// Full power up of all data paths + high power mode
+	if (qsfp_format == QDD_CMIS) {
+		/* TODO: aapl script will do the power up */
+		rc = 0;
+	} else if (qsfp_format == QDD_SFF8636) {
+		// If not, power up the QSFP
+		data = (SFF8636_PWR_CLASS_567_ENABLE | SFF8636_PWR_OVERRIDE);
+		qsfp_extid = hw->qsfp_eeprom_page0[SFF8436_EXT_IDENTIFIER_OFFSET];
+		// If the module supports Class8+ set that enable bit too
+		if (qsfp_extid & SFF8636_PWR_CLASS_8)
+			data |= SFF8636_PWR_CLASS_8_ENABLE;
+		rc = uc_cmd_qsfp_write(hw, 0, SFF8436_POWER_DATA_OFFSET,
+				       &data, sizeof(data));
+	} else
+		rc = -EINVAL;
+
+	mutex_unlock(&hw->qsfp_eeprom_lock);
+	return rc;
+}
+
+/**
+ * cass_link_headshell_insert() - Headshell insert
+ *
+ * @hw: the device
+ * @attr: pointer to struct containing cable information
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_link_headshell_insert(struct cass_dev *hw,
+			       struct sbl_media_attr *attr)
+{
+	int err;
+
+	cass_phy_set_state(CASS_PHY_NOLINK, hw);
+	cxidev_dbg(&hw->cdev, "headshell insert: phy state = %d\n", hw->phy.state);
+
+	if (hw->port->hstate == CASS_HEADSHELL_STATUS_PRESENT) {
+		cxidev_err(&hw->cdev, "headshell insert - already present\n");
+		return -EUCLEAN;
+	}
+
+	if (hw->port->config_state & CASS_MEDIA_CONFIGURED) {
+		cxidev_err(&hw->cdev,
+			   "headshell insert - media already configured\n");
+		return -EUCLEAN;
+	}
+
+	err = hw->link_ops->media_config(hw, attr);
+	if (err) {
+		cxidev_err(&hw->cdev, "headshell insert - media config failed [%d]\n",
+			   err);
+		hw->port->config_state &= ~CASS_MEDIA_CONFIGURED;
+		return err;
+	}
+
+	/*
+	 * check any existing link config is compatible with the new media type
+	 *
+	 *    if not unconfigure link so it must be reconfigured again
+	 *
+	 */
+	if (hw->port->config_state & CASS_LINK_CONFIGURED) {
+		switch (hw->port->lattr.bl.config_target) {
+		case SBL_BASE_LINK_CONFIG_PEC:
+			if (attr->media != SBL_LINK_MEDIA_ELECTRICAL) {
+				cxidev_warn(&hw->cdev,
+					    "headshell insert - link attr PEC incompatible with new media");
+				hw->port->config_state &= ~CASS_LINK_CONFIGURED;
+			}
+			break;
+		case SBL_BASE_LINK_CONFIG_AOC:
+			if (attr->media != SBL_LINK_MEDIA_OPTICAL) {
+				cxidev_warn(&hw->cdev,
+					    "headshell insert - link attr AOC incompatible with new media");
+				hw->port->config_state &= ~CASS_LINK_CONFIGURED;
+			}
+			break;
+		default:
+			cxidev_warn(&hw->cdev,
+				    "headshell insert - link attr incompatible with new media");
+			hw->port->config_state &= ~CASS_LINK_CONFIGURED;
+			break;
+		}
+	}
+
+	hw->port->hstate = CASS_HEADSHELL_STATUS_PRESENT;
+	hw->port->config_state |= CASS_MEDIA_CONFIGURED;
+
+	/*
+	 * if the link is supposed to be up try to restart it
+	 */
+	if ((cass_link_get_state(hw) == CASS_LINK_STATUS_DOWN) &&
+	    (hw->port->lmon_dirn == CASS_LMON_DIRECTION_UP)) {
+
+		if ((hw->port->lattr.options &
+		     CASS_LINK_OPT_RESTART_ON_INSERT)) {
+			cxidev_dbg(&hw->cdev, "starting link after insert\n");
+			cass_lmon_request_up(hw);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * cass_link_headshell_remove() - Headshell remove
+ *
+ *    Headshell must already be present and media configured.
+ *    Stop link if running and unconfigure media
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_link_headshell_remove(struct cass_dev *hw)
+{
+	int err;
+
+	cass_phy_set_state(CASS_PHY_HEADSHELL_REMOVED, hw);
+	cxidev_dbg(&hw->cdev, "headshell remove: phy state = %d\n", hw->phy.state);
+
+	switch (hw->port->hstate) {
+	case CASS_HEADSHELL_STATUS_NOT_PRESENT:
+		cxidev_err(&hw->cdev, "headshell remove - not present\n");
+		return -EUCLEAN;
+
+	case CASS_HEADSHELL_STATUS_PRESENT:
+		if (!(hw->port->config_state & CASS_MEDIA_CONFIGURED)) {
+			cxidev_err(&hw->cdev,
+				   "headshell remove - media not configured\n");
+			return -EUCLEAN;
+		}
+		break;
+
+	case CASS_HEADSHELL_STATUS_ERROR:
+		break;
+
+	default:
+		cxidev_err(&hw->cdev, "headshell remove - unrecognised state\n");
+		return -EUCLEAN;
+	}
+
+	/* stop link coming up */
+	cass_lmon_set_up_pause(hw, true);
+
+	/* setup new state */
+	hw->port->hstate = CASS_HEADSHELL_STATUS_NOT_PRESENT;
+	cass_link_set_led(hw);
+
+	/* ensure link down and no media configured */
+	err = cass_link_headshell_down_no_media(hw,
+						CASS_DOWN_ORIGIN_HEADSHELL_REMOVED);
+	if (err) {
+		cxidev_err(&hw->cdev,
+			   "headshell remove - down_no_media failed [%d]\n",
+			   err);
+		cass_lmon_set_up_pause(hw, false);
+		return err;
+	}
+
+	cass_lmon_set_up_pause(hw, false);
+	return 0;
+}
+
+/**
+ * cass_link_headshell_error() - Headshell error
+ *
+ *    Any start state
+ *    Stop link and unconfigure media
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_link_headshell_error(struct cass_dev *hw)
+{
+	int err;
+
+	cass_phy_set_state(CASS_PHY_HEADSHELL_REMOVED, hw);
+	cxidev_dbg(&hw->cdev, "headshell error: phy state = %d\n", hw->phy.state);
+
+	/* stop link coming up */
+	cass_lmon_set_up_pause(hw, true);
+
+	/* ensure link down and no media configured */
+	err = cass_link_headshell_down_no_media(hw,
+						CASS_DOWN_ORIGIN_HEADSHELL_ERROR);
+	if (err) {
+		cxidev_err(&hw->cdev,
+			   "headshell error - down_no_media failed [%d]\n",
+			   err);
+		cass_lmon_set_up_pause(hw, false);
+		return err;
+	}
+
+	/* setup new state */
+	hw->port->hstate = CASS_HEADSHELL_STATUS_ERROR;
+	cass_link_set_led(hw);
+
+	cass_lmon_set_up_pause(hw, false);
+	return 0;
+}
+
+/**
+ * cass_link_headshell_down_no_media() - take link down and unconfigure cable
+ *
+ * Common headshell remove/error code to stop link and unconfigure media
+ *
+ * @hw: the device
+ * @reason: the reason the link is going down
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int cass_link_headshell_down_no_media(struct cass_dev *hw, int reason)
+{
+	int err;
+
+	cxidev_dbg(&hw->cdev, "headshell down no media\n");
+
+	/* ensure link down  */
+	spin_lock(&hw->port->lock);
+	switch (hw->port->lstate) {
+	case CASS_LINK_STATUS_DOWN:
+	case CASS_LINK_STATUS_ERROR:
+	case CASS_LINK_STATUS_UNCONFIGURED:
+	case CASS_LINK_STATUS_UNKNOWN:
+		cxidev_dbg(&hw->cdev, "headshell down - already link down (%s)\n",
+			   cass_link_state_str(hw->port->lstate));
+		spin_unlock(&hw->port->lock);
+		break;
+	default:
+		spin_unlock(&hw->port->lock);
+		err = cass_link_async_down_wait(hw, reason);
+		if (err) {
+			cxidev_err(&hw->cdev,
+				   "headshell down - down_wait failed [%d]\n",
+				   err);
+			return err;
+		}
+		break;
+	}
+
+	/* remove any media configuration */
+	if (hw->port->config_state & CASS_MEDIA_CONFIGURED) {
+		err = hw->link_ops->media_unconfig(hw);
+		if (err) {
+			cxidev_err(&hw->cdev, "headshell down - media unconfig failed [%d]\n", err);
+			return err;
+		}
+		hw->port->config_state &= ~CASS_MEDIA_CONFIGURED;
+	}
+
+	return 0;
+}
+
+/*
+ * Direct media configuration
+ *
+ *   Called by hms to set media for backplane media
+ *
+ *   If you are playing with the backplane (i.e. changing compute blades)
+ *   then leave it to the user to restart the link
+ */
+int cass_link_media_config(struct cass_dev *hw, struct sbl_media_attr *attr)
+{
+	int err;
+
+	cxidev_dbg(&hw->cdev, "media config\n");
+
+	if (hw->port->hstate != CASS_HEADSHELL_STATUS_NOT_PRESENT) {
+		cxidev_dbg(&hw->cdev, "media config - bad state %s\n",
+			   cass_link_headshell_state_str(hw->port->hstate));
+		return -EUCLEAN;
+	}
+
+	if (hw->port->config_state & CASS_MEDIA_CONFIGURED) {
+		cxidev_dbg(&hw->cdev, "media config - media already configured\n");
+		return -EUCLEAN;
+	}
+
+	err = hw->link_ops->media_config(hw, attr);
+	if (err) {
+		cxidev_dbg(&hw->cdev, "media config - media config failed [%d]\n",
+			   err);
+		hw->port->config_state &= ~CASS_MEDIA_CONFIGURED;
+		return err;
+	}
+
+	hw->port->hstate = CASS_HEADSHELL_STATUS_NO_DEVICE;
+	hw->port->config_state |= CASS_MEDIA_CONFIGURED;
+
+	return 0;
+}
+
+/**
+ * cass_link_headshell_state_str() - Get a string for the headshell state
+ *
+ * Return a text string describing a headshell status
+ *
+ * @state: input enum of target headshell state
+ *
+ * Return: This function will always return a text string
+ */
+const char *cass_link_headshell_state_str(enum cass_headshell_status state)
+{
+	switch (state) {
+	case CASS_HEADSHELL_STATUS_UNKNOWN:     return "unknown";
+	case CASS_HEADSHELL_STATUS_PRESENT:     return "present";
+	case CASS_HEADSHELL_STATUS_NOT_PRESENT: return "not present";
+	case CASS_HEADSHELL_STATUS_NO_DEVICE:   return "no device";
+	case CASS_HEADSHELL_STATUS_ERROR:       return "error";
+	default:                                return "unrecognised";
+	}
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_cable.h b/drivers/net/ethernet/hpe/ss1/cass_cable.h
new file mode 100644
index 000000000000..e43bdfcf236f
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_cable.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2021 Hewlett Packard Enterprise Development LP */
+#ifndef _CASS_CABLE_H
+#define _CASS_CABLE_H
+
+#define QSFP_IDENTIFIER_OFFSET                   0
+#define QSFP_REV_CMPL_OFFSET                     1
+#define QSFP_VENDOR_MAX_STR_LEN                  16
+
+#define QDD_VENDOR_TE                   "TE Connectivity"
+#define QDD_VENDOR_HISENSE              "Hisense"
+#define QDD_VENDOR_FIT                  "FIT HON TENG"
+#define QDD_VENDOR_FT                   "FT HON TENG"
+#define QDD_VENDOR_MELLANOX             "Mellanox"
+#define QDD_VENDOR_MOLEX                "Molex"
+#define QDD_VENDOR_LEONI                "LEONI"
+#define QDD_VENDOR_HITACHI              "Hitachi Metals"
+#define QDD_VENDOR_LUXSHARE             "LUXSHARE-ICT"
+#define QDD_VENDOR_DUST_PHOTONICS       "DustPhotonics"
+#define QDD_VENDOR_FINISAR              "FINISAR CORP"
+#define QDD_VENDOR_HPE                  "HPE"
+#define QDD_VENDOR_CLOUD_LIGHT          "Cloud Light"
+#define QDD_VENDOR_AMPHENOL             "Amphenol"
+
+// SFF-8024 Specification for SFF Cross Reference -----------------------------
+#define SFF8436_MEDIA_TYPE_OFFSET                147
+#define SFF8436_LINK_LEN_OFFSET                  146
+#define SFF8436_VENDOR_OFFSET                    148
+#define SFF8436_EXT_IDENTIFIER_OFFSET            129
+#define SFF8436_POWER_DATA_OFFSET                93
+#define SFF8436_LOW_POWER_MASK                   0x02
+
+// SFF-8024 TABLE 4-1 IDENTIFIER VALUES
+#define SFF8024_TYPE_UNKNOWN                     0x00
+#define SFF8024_TYPE_GBIC                        0x01
+#define SFF8024_TYPE_MOTHERBOARD                 0x02
+#define SFF8024_TYPE_SFP                         0x03
+#define SFF8024_TYPE_300P_XBI                    0x04
+#define SFF8024_TYPE_XENPAK                      0x05
+#define SFF8024_TYPE_XFP                         0x06
+#define SFF8024_TYPE_XFF                         0x07
+#define SFF8024_TYPE_XFP_E                       0x08
+#define SFF8024_TYPE_XPAK                        0x09
+#define SFF8024_TYPE_X2                          0x0A
+#define SFF8024_TYPE_DWDM_SFP                    0x0B
+#define SFF8024_TYPE_QSFP_INF8438                0x0C
+#define SFF8024_TYPE_QSFP_PLUS                   0x0D
+#define SFF8024_TYPE_CXP                         0x0E
+#define SFF8024_TYPE_SMMHD4X                     0x0F
+#define SFF8024_TYPE_SMMHD8X                     0x10
+#define SFF8024_TYPE_QSFP28                      0x11
+#define SFF8024_TYPE_CXP2                        0x12
+#define SFF8024_TYPE_CDFP                        0x13
+#define SFF8024_TYPE_SMMHD4X_FANOUT              0x14
+#define SFF8024_TYPE_SMMHD8X_FANOUT              0x15
+#define SFF8024_TYPE_CDFP_3                      0x16
+#define SFF8024_TYPE_uQSFP                       0x17
+#define SFF8024_TYPE_QSFPDD                      0x18
+#define SFF8024_TYPE_OSFP8X                      0x19
+#define SFF8024_TYPE_SFPDD                       0x1A
+#define SFF8024_TYPE_DSFP                        0x1B
+#define SFF8024_TYPE_MINILINK4X                  0x1C
+#define SFF8024_TYPE_MINILINK8X                  0x1D
+#define SFF8024_TYPE_QSFP_PLUS_CMIS              0x1E
+
+// SFF-8636 Byte @ 93
+#define SFF8636_SW_RESET                         0x80
+#define SFF8636_PWR_CLASS_8_ENABLE               0x08
+#define SFF8636_PWR_CLASS_567_ENABLE             0x04
+#define SFF8636_PWR_CLASS_LOW                    0x02
+#define SFF8636_PWR_OVERRIDE                     0x01
+
+// SFF-8636 Extended Identifier Byte @ Page 00h byte 129
+#define SFF8636_PWR_CLASS_1234_MASK              0xC0
+#define SFF8636_PWR_CLASS_1                      0x00
+#define SFF8636_PWR_CLASS_2                      0x40
+#define SFF8636_PWR_CLASS_3                      0x80
+#define SFF8636_PWR_CLASS_4_AND_UP               0xC0
+#define SFF8636_PWR_CLASS_8                      0x20
+#define SFF8636_CLEI_IN_PG02                     0x10
+#define SFF8636_CDR_IN_TX                        0x08
+#define SFF8636_CDR_IN_RX                        0x04
+#define SFF8636_PWR_CLASS_567_MASK               0x03
+#define SFF8636_SEE_PWR_CLASS_1234               0x00
+#define SFF8636_PWR_CLASS_5                      0x01
+#define SFF8636_PWR_CLASS_6                      0x02
+#define SFF8636_PWR_CLASS_7                      0x03
+
+// Common Management Interface Specification (CMIS) ---------------------------
+#define CMIS_MEDIA_TYPE_OFFSET                   212
+#define CMIS_CABLE_LEN_OFFSET                    202
+#define CMIS_VENDOR_OFFSET                       129
+
+// CMIS and SFF-8636 Media/Transmitter Technology Types
+#define MEDIA_850_NM_VCSEL                       0x00
+#define MEDIA_1310_NM_VCSEL                      0x01
+#define MEDIA_1550_NM_VCSEL                      0x02
+#define MEDIA_1310_NM_FP                         0x03
+#define MEDIA_1310_NM_DFB                        0x04
+#define MEDIA_1550_NM_DFB                        0x05
+#define MEDIA_1310_NM_EML                        0x06
+#define MEDIA_1550_NM_EML                        0x07
+#define MEDIA_OTHERS                             0x08
+#define MEDIA_1490_NM_DFB                        0x09
+#define MEDIA_COPPER_UNEQ                        0x0A
+#define MEDIA_COPPER_PASSIVE_EQ                  0x0B
+#define MEDIA_COPPER_NEAR_FAR_LMT_ACT_EQ         0x0C
+#define MEDIA_COPPER_FAR_LMT_ACT_EQ              0x0D
+#define MEDIA_COPPER_NEAR_LMT_ACT_EQ             0x0E
+#define MEDIA_COPPER_LIN_ACT_EQ                  0x0F
+
+/**
+ * enum qsfp_format - cable spec types
+ *
+ * @QDD_FMT_UNKNOWN:       Format unknown
+ * @QDD_SFF8636:           Format compatible with SFF-8636
+ * @QDD_CMIS:              Format compatible with CMIS
+ *
+ * QSFP / QSFP-DD Protocol/Specification Types
+ */
+enum qsfp_format {
+	QDD_FMT_UNKNOWN = 0,
+	QDD_SFF8636,
+	QDD_CMIS,
+};
+
+/**
+ * enum cass_headshell_status - cable status
+ *
+ * @CASS_HEADSHELL_STATUS_UNKNOWN:       State unknown
+ * @CASS_HEADSHELL_STATUS_PRESENT:       A headshell is inserted
+ * @CASS_HEADSHELL_STATUS_NOT_PRESENT:   A headshell is not inserted
+ * @CASS_HEADSHELL_STATUS_ERROR:         A headshell has error
+ * @CASS_HEADSHELL_STATUS_NO_DEVICE:     No headshell hardware device
+ *
+ * The status of the media headshell
+ */
+enum cass_headshell_status {
+	CASS_HEADSHELL_STATUS_UNKNOWN          = 0,
+	CASS_HEADSHELL_STATUS_PRESENT          = 1 << 0,
+	CASS_HEADSHELL_STATUS_NOT_PRESENT      = 1 << 1,
+	CASS_HEADSHELL_STATUS_ERROR            = 1 << 2,
+	CASS_HEADSHELL_STATUS_NO_DEVICE        = 1 << 3,
+};
+
+int cass_is_cable_present(struct cass_dev *hw);
+int cass_headshell_power_up(struct cass_dev *hw, u8 qsfp_format);
+int cass_parse_heashell_data(struct cass_dev *hw, struct sbl_media_attr *attr,
+			     u8 *qsfp_format);
+int cass_link_headshell_insert(struct cass_dev *hw,
+			       struct sbl_media_attr *mattr);
+int cass_link_headshell_remove(struct cass_dev *hw);
+int cass_link_headshell_error(struct cass_dev *hw);
+int cass_link_media_config(struct cass_dev *hw, struct sbl_media_attr *attr);
+const char *cass_link_headshell_state_str(enum cass_headshell_status state);
+
+#endif	/* _CASS_CABLE_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_core.c b/drivers/net/ethernet/hpe/ss1/cass_core.c
new file mode 100644
index 000000000000..45e992379e12
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_core.c
@@ -0,0 +1,1564 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2026 Hewlett Packard Enterprise Development LP */
+
+/* Cassini device handler */
+
+#include <linux/interrupt.h>
+#include <linux/pci.h>
+#include <linux/types.h>
+#include <linux/iopoll.h>
+#include <linux/seq_file.h>
+#include <linux/phy/phy.h>
+#include <linux/if_vlan.h>
+#include <linux/aer.h>
+#include <linux/hpe/cxi/driver.h>
+
+#include "cass_core.h"
+#include "cass_sbl.h"
+#include <linux/hpe/sbl/sbl.h>
+#include "cass_ss1_debugfs.h"
+#include "cxi_aux_dev.h"
+
+/* Range of available number of IRQs, depending on the number of VFs
+ * configured in Cassini.
+ */
+#define MIN_NUM_IRQS 63
+#define MAX_NUM_IRQS 2048
+
+static unsigned int sct_pid_mask = 0x7;
+module_param(sct_pid_mask, uint, 0444);
+MODULE_PARM_DESC(sct_pid_mask, "Source Connection PID Mask");
+
+static unsigned int hw_rev_override;
+module_param(hw_rev_override, uint, 0644);
+MODULE_PARM_DESC(hw_rev_override, "Hardware revision override");
+
+static bool enable_fgfc = true;
+module_param(enable_fgfc, bool, 0444);
+MODULE_PARM_DESC(enable_fgfc, "Enable/disable fine grain flow control");
+
+#define OUTSTANDING_LIMIT_MAX 2047U
+#define OUTSTANDING_LIMIT_MIN 1U
+#define OUTSTANDING_LIMIT_DEFAULT 64U
+
+static unsigned int get_pkt_limit;
+module_param(get_pkt_limit, uint, 0444);
+MODULE_PARM_DESC(get_pkt_limit,
+		 "Maximum number of outstanding GET packets (1-2047) per MCU");
+
+static unsigned int put_pkt_limit;
+module_param(put_pkt_limit, uint, 0444);
+MODULE_PARM_DESC(put_pkt_limit,
+		 "Maximum number of outstanding PUT packets (1-2047) per MCU");
+
+static unsigned int ioi_ord_limit;
+module_param(ioi_ord_limit, uint, 0444);
+MODULE_PARM_DESC(ioi_ord_limit,
+		 "Maximum number of outstanding ordered packets (1-2047) per MCU");
+
+static unsigned int ioi_unord_limit;
+module_param(ioi_unord_limit, uint, 0444);
+MODULE_PARM_DESC(ioi_unord_limit,
+		 "Maximum number of outstanding unordered packets (1-2047) per MCU");
+
+static bool ioi_enable = true;
+module_param(ioi_enable, bool, 0444);
+MODULE_PARM_DESC(ioi_enable,
+		 "Enable the In-Out-In protocol for puts.");
+
+bool disable_on_error = true;
+module_param(disable_on_error, bool, 0644);
+MODULE_PARM_DESC(disable_on_error,
+		 "Disable cxi device on certain unrecoverable errors");
+
+#ifndef PCI_EXT_CAP_ID_DVSEC
+#define PCI_EXT_CAP_ID_DVSEC 0x23
+#define PCI_DVSEC_HEADER1       0x4 /* Designated Vendor-Specific Header1 */
+#endif
+#ifndef PCI_DVSEC_HEADER1_VID
+#define PCI_DVSEC_HEADER1_VID(x)   ((x) & 0xffff)
+#define PCI_DVSEC_HEADER1_REV(x)   (((x) >> 16) & 0xf)
+#define PCI_DVSEC_HEADER1_LEN(x)   (((x) >> 20) & 0xfff)
+#endif
+
+static void cass_dev_release(struct device *dev)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, class_dev);
+
+	kfree(hw);
+}
+
+/**
+ * cxi_get_csrs_range() - Return the whole physical range of the CSRs
+ *
+ * The BAR0 contains amongst other things the CSRs. At least the retry
+ * handler needs an access to them. The CXI user module needs to mmap
+ * it.
+ *
+ * @cdev: the device
+ * @base: base address
+ * @len: length of the CSRs
+ */
+void cxi_get_csrs_range(struct cxi_dev *cdev, phys_addr_t *base, size_t *len)
+{
+	struct cass_dev *hw = container_of(cdev, struct
+					   cass_dev, cdev);
+
+	*base = hw->regs_base + C_MEMORG_CSR;
+	*len = C_MEMORG_CSR_SIZE;
+
+}
+EXPORT_SYMBOL(cxi_get_csrs_range);
+
+void traffic_shaping_cfg(struct cass_dev *hw)
+{
+	static const union c_oxe_cfg_arb_config arb_config = {
+		.mfs_out_sel = 1,
+		.fill_rate = 9,
+	};
+	const union c_oxe_cfg_arb_head_out_c head_out_c = {
+		.enable = 1,
+		.fill_qty = hw->tsc_fill_qty,
+		.limit = DIV_ROUND_UP(8 * ETHERNET_MAX_FRAME_SIZE, 1024),
+	};
+	const union c_oxe_cfg_arb_head_in_c head_in_c = {
+		.enable = 1,
+		.fill_qty = hw->tsc_fill_qty,
+		.limit = DIV_ROUND_UP(8 * ETHERNET_MAX_FRAME_SIZE, 1024),
+	};
+
+	/* 16 traffic shaping credits are returned at 100MHz frequency 200 Gbps
+	 * performance.
+	 */
+	cass_write(hw, C_OXE_CFG_ARB_CONFIG, &arb_config, sizeof(arb_config));
+	cass_write(hw, C_OXE_CFG_ARB_HEAD_OUT_C, &head_out_c,
+		   sizeof(head_out_c));
+	cass_write(hw, C_OXE_CFG_ARB_HEAD_IN_C, &head_in_c, sizeof(head_in_c));
+}
+
+/* Set the number of packets inflight based on link speed.
+ */
+static unsigned int calculate_packets_inflight(struct cass_dev *hw)
+{
+	unsigned int value;
+	struct cxi_link_info link_info;
+	bool is_link_up;
+
+	is_link_up = cass_sbl_is_link_up(hw);
+	if (!is_link_up) {
+		pr_err("cxi link info error: link is not up yet.\n");
+		return 0;
+	}
+	cxi_link_mode_get(&hw->cdev, &link_info);
+
+	if (link_info.speed == SPEED_400000)
+		value = CASS2_MAX_PACKETS_INFLIGHT;
+	else
+		value = CASS1_MAX_PACKETS_INFLIGHT;
+
+	return value;
+}
+
+/* Set outstanding limits based on kernel module parameters.
+ * If no input, use the calculated packets_inflight.
+ */
+void cass_set_outstanding_limit(struct cass_dev *hw)
+{
+	int i;
+	unsigned int packets_inflight;
+	union c_oxe_cfg_outstanding_limit outstanding_limit;
+
+	packets_inflight = calculate_packets_inflight(hw);
+
+	if (packets_inflight < OUTSTANDING_LIMIT_MIN ||
+	    packets_inflight > OUTSTANDING_LIMIT_MAX) {
+		packets_inflight = OUTSTANDING_LIMIT_DEFAULT;
+	}
+
+	if (get_pkt_limit == 0)
+		get_pkt_limit = packets_inflight;
+	if (get_pkt_limit < OUTSTANDING_LIMIT_MIN ||
+	    get_pkt_limit > OUTSTANDING_LIMIT_MAX) {
+		pr_err("Invalid get_pkt_limit %u. Setting to %u\n",
+		       get_pkt_limit, OUTSTANDING_LIMIT_DEFAULT);
+		get_pkt_limit = OUTSTANDING_LIMIT_DEFAULT;
+	}
+
+	if (put_pkt_limit == 0)
+		put_pkt_limit = packets_inflight;
+	if (put_pkt_limit < OUTSTANDING_LIMIT_MIN ||
+	    put_pkt_limit > OUTSTANDING_LIMIT_MAX) {
+		pr_err("Invalid put_pkt_limit %u. Setting to %u\n",
+		       put_pkt_limit, OUTSTANDING_LIMIT_DEFAULT);
+		put_pkt_limit = OUTSTANDING_LIMIT_DEFAULT;
+	}
+
+	if (ioi_ord_limit == 0)
+		ioi_ord_limit = packets_inflight;
+	if (ioi_ord_limit < OUTSTANDING_LIMIT_MIN ||
+	    ioi_ord_limit > OUTSTANDING_LIMIT_MAX) {
+		pr_err("Invalid ioi_ord_limit %u. Setting to %u\n",
+		       ioi_ord_limit, OUTSTANDING_LIMIT_DEFAULT);
+		ioi_ord_limit = OUTSTANDING_LIMIT_DEFAULT;
+	}
+
+	if (ioi_unord_limit == 0)
+		ioi_unord_limit = packets_inflight;
+	if (ioi_unord_limit < OUTSTANDING_LIMIT_MIN ||
+	    ioi_unord_limit > OUTSTANDING_LIMIT_MAX) {
+		pr_err("Invalid ioi_unord_limit %u. Setting to %u\n",
+		       ioi_unord_limit, OUTSTANDING_LIMIT_DEFAULT);
+		ioi_unord_limit = OUTSTANDING_LIMIT_DEFAULT;
+	}
+
+	for (i = 0; i < C_OXE_CFG_OUTSTANDING_LIMIT_ENTRIES; i++) {
+		cass_read(hw, C_OXE_CFG_OUTSTANDING_LIMIT(i),
+			  &outstanding_limit, sizeof(outstanding_limit));
+		outstanding_limit.get_limit = get_pkt_limit;
+		outstanding_limit.put_limit = put_pkt_limit;
+		outstanding_limit.ioi_ord_limit = ioi_ord_limit;
+		outstanding_limit.ioi_unord_limit = ioi_unord_limit;
+		cass_write(hw, C_OXE_CFG_OUTSTANDING_LIMIT(i),
+			   &outstanding_limit, sizeof(outstanding_limit));
+	}
+}
+
+/* Initialize OXE registers. */
+static void cass_oxe_init(struct cass_dev *hw)
+{
+	int i;
+	union c_oxe_cfg_common cfg_common;
+	union c_oxe_cfg_fgfc fgfc;
+	static const union c_oxe_cfg_arb_drr_out wdrr_out = {
+		.quanta_val0 = DIV_ROUND_UP(PORTALS_MAX_FRAME_SIZE, 32),
+		.quanta_val1 = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 32),
+	};
+	static const union c_oxe_cfg_arb_drr_in wdrr_in = {
+		.quanta_val0 = DIV_ROUND_UP(PORTALS_MAX_FRAME_SIZE, 32),
+	};
+	static const union c_oxe_cfg_arb_mfs_out mfs_out = {
+		.mfs0 = DIV_ROUND_UP(PORTALS_MAX_FRAME_SIZE, 32),
+		.mfs1 = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 32),
+	};
+	static const union c_oxe_cfg_arb_mfs_in mfs_in = {
+		.mfs0 = DIV_ROUND_UP(PORTALS_MAX_FRAME_SIZE, 32),
+	};
+	static const union c_oxe_cfg_mcu_priority_limit mcu_priority_limit = {
+		.occ_climit = 8,
+		.occ_blimit = 4,
+	};
+	static const union c_oxe_cfg_fgfc_cnt fgfc_cnt = {
+		.vni_mask = 0xffff,
+	};
+	union c_oxe_cfg_fab_param fab_param;
+
+	/* Note: All MCUs must use quanta and mfs value zero. */
+	cass_write(hw, C_OXE_CFG_ARB_DRR_OUT, &wdrr_out, sizeof(wdrr_out));
+	cass_write(hw, C_OXE_CFG_ARB_DRR_IN, &wdrr_in, sizeof(wdrr_in));
+	cass_write(hw, C_OXE_CFG_ARB_MFS_OUT, &mfs_out, sizeof(mfs_out));
+	cass_write(hw, C_OXE_CFG_ARB_MFS_IN, &mfs_in, sizeof(mfs_in));
+
+	traffic_shaping_cfg(hw);
+
+	/* Clear all default reserved buffer class values. */
+	cass_clear(hw, C_OXE_CFG_PCT_BC_CDT(0), C_OXE_CFG_PCT_BC_CDT_SIZE);
+	cass_clear(hw, C_OXE_CFG_BUF_BC_PARAM(0), C_OXE_CFG_BUF_BC_PARAM_SIZE);
+
+	/* Lower MCU arbitration priority limits to prevent a single MCU
+	 * starving other MCUs within a traffic class.
+	 */
+	for (i = 0; i < C_OXE_CFG_MCU_PRIORITY_LIMIT_ENTRIES; i++)
+		cass_write(hw, C_OXE_CFG_MCU_PRIORITY_LIMIT(i),
+			   &mcu_priority_limit, sizeof(mcu_priority_limit));
+
+	for (i = 0; i < C_OXE_CFG_FGFC_CNT_ENTRIES; i++)
+		cass_write(hw, C_OXE_CFG_FGFC_CNT(i), &fgfc_cnt,
+			   sizeof(fgfc_cnt));
+
+	cass_read(hw, C_OXE_CFG_FAB_PARAM, &fab_param, sizeof(fab_param));
+	fab_param.req_32b_enabled = 0;
+	fab_param.rsp_32b_enabled = 0;
+	cass_write(hw, C_OXE_CFG_FAB_PARAM, &fab_param, sizeof(fab_param));
+
+	/* Disable In-Out-In for C1 and Mix system */
+	if (system_type_identifier == CASSINI_1_ONLY ||
+	    system_type_identifier == CASSINI_MIX) {
+		ioi_enable = false;
+	}
+	cass_read(hw, C_OXE_CFG_COMMON, &cfg_common,
+		  sizeof(cfg_common));
+	cfg_common.ioi_enable = ioi_enable;
+	cass_write(hw, C_OXE_CFG_COMMON, &cfg_common,
+		   sizeof(cfg_common));
+
+	cass_read(hw, C_OXE_CFG_FGFC, &fgfc, sizeof(fgfc));
+	fgfc.enable = enable_fgfc;
+	cass_write(hw, C_OXE_CFG_FGFC, &fgfc, sizeof(fgfc));
+}
+
+#define DFA_NID_MASK 0xfffff000U
+
+/* TODO: Allow multiple request and response PCP configurations. Currently only
+ * request PCP 0 and response PCP 1 configuration is used.
+ */
+static void cass_pct_init(struct cass_dev *hw)
+{
+	union c_pct_cfg_ixe_rsp_fifo_limits rsp_fifo_limits;
+	union c_pct_cfg_tgt_clr_req_fifo_limit req_fifo_limit;
+	u32 pid_mask = sct_pid_mask;
+	union c_cq_cfg_ocu_hash_mask hash_mask;
+	union c_pct_cfg_sct_tag_dfa_mask dfa_mask;
+	union c_pct_cfg_timing timing;
+	int i;
+
+	/* Errata 2848 */
+	cass_read(hw, C_PCT_CFG_TGT_CLR_REQ_FIFO_LIMIT,
+		  &req_fifo_limit, sizeof(req_fifo_limit));
+	req_fifo_limit.mst_dealloc_fifo_limit = 7;
+	cass_write(hw, C_PCT_CFG_TGT_CLR_REQ_FIFO_LIMIT,
+		   &req_fifo_limit, sizeof(req_fifo_limit));
+
+	cass_read(hw, C_PCT_CFG_IXE_RSP_FIFO_LIMITS,
+		  &rsp_fifo_limits, sizeof(rsp_fifo_limits));
+	rsp_fifo_limits.smt_cdt_ack_limit = 7;
+	rsp_fifo_limits.spt_cdt_ack_limit = 7;
+	rsp_fifo_limits.sct_cdt_ack_limit = 7;
+	cass_write(hw, C_PCT_CFG_IXE_RSP_FIFO_LIMITS,
+		   &rsp_fifo_limits, sizeof(rsp_fifo_limits));
+
+	/* Set default PCT timeouts */
+	cass_read(hw, C_PCT_CFG_TIMING, &timing, sizeof(timing));
+	timing.spt_timeout_epoch_sel = C1_DEFAULT_SPT_TIMEOUT_EPOCH;
+	timing.sct_idle_epoch_sel = C1_DEFAULT_SCT_IDLE_EPOCH;
+	timing.sct_close_epoch_sel = C1_DEFAULT_SCT_CLOSE_EPOCH;
+	timing.tct_timeout_epoch_sel = C1_DEFAULT_TCT_TIMEOUT_EPOCH;
+	cass_write(hw, C_PCT_CFG_TIMING, &timing, sizeof(timing));
+
+	/* Set SCT PID Mask. CQ and PCT DFA masks must be consistent. */
+	cass_read(hw, C_CQ_CFG_OCU_HASH_MASK, &hash_mask, sizeof(hash_mask));
+
+	/* Mask off PID granule space as a part of SCT mask selection. */
+	pid_mask &= BIT(pid_bits) - 1;
+
+	/* Software uses the top bit of the PID granule space to differentiate
+	 * between unrestricted puts and gets. To support having unrestricted
+	 * puts and gets on different SCTs, the top bit of the PID granule
+	 * space must always be included in SCT selection. This bit is the top
+	 * bit in the endpoint define.
+	 */
+	pid_mask |= BIT(C_DFA_ENDPOINT_DEFINED_BITS - 1);
+
+	hash_mask.dfa = DFA_NID_MASK | pid_mask;
+	cass_write(hw, C_CQ_CFG_OCU_HASH_MASK, &hash_mask, sizeof(hash_mask));
+
+	for (i = 0; i < 4; i++)
+		dfa_mask.dscp[i].dfa_mask = pid_mask;
+
+	for (i = 0; i < C_PCT_CFG_SCT_TAG_DFA_MASK_ENTRIES; i++) {
+		cass_write(hw, C_PCT_CFG_SCT_TAG_DFA_MASK(i), &dfa_mask,
+			   sizeof(dfa_mask));
+
+		if (cass_version(hw, CASSINI_2))
+			cass_write(hw, C2_LPE_CFG_GET_FQ_DFA_MASK(i),
+				   &dfa_mask, sizeof(dfa_mask));
+	}
+
+	/* Clear the default target resource settings. This is configured later
+	 * as a part of traffic class configuration.
+	 */
+	if (cass_version(hw, CASSINI_1)) {
+		cass_clear(hw, C1_PCT_CFG_TRS_TC_DED_LIMIT(0),
+			   C1_PCT_CFG_TRS_TC_DED_LIMIT_SIZE);
+		cass_clear(hw, C1_PCT_CFG_TRS_TC_MAX_LIMIT(0),
+			   C1_PCT_CFG_TRS_TC_MAX_LIMIT_SIZE);
+	} else {
+		cass_clear(hw, C2_PCT_CFG_TRS_TC_DED_LIMIT(0),
+			   C2_PCT_CFG_TRS_TC_DED_LIMIT_SIZE);
+		cass_clear(hw, C2_PCT_CFG_TRS_TC_MAX_LIMIT(0),
+			   C2_PCT_CFG_TRS_TC_MAX_LIMIT_SIZE);
+	}
+	cass_clear(hw, C_PCT_CFG_MST_TC_DED_LIMIT(0),
+		   C_PCT_CFG_MST_TC_DED_LIMIT_SIZE);
+	cass_clear(hw, C_PCT_CFG_MST_TC_MAX_LIMIT(0),
+		   C_PCT_CFG_MST_TC_MAX_LIMIT_SIZE);
+	cass_clear(hw, C_PCT_CFG_TCT_TC_DED_LIMIT(0),
+		   C_PCT_CFG_TCT_TC_DED_LIMIT_SIZE);
+	cass_clear(hw, C_PCT_CFG_TCT_TC_MAX_LIMIT(0),
+		   C_PCT_CFG_TCT_TC_MAX_LIMIT_SIZE);
+};
+
+/* Wait for the hardware to be ready after a reset. */
+static int wait_hw_ready(struct cass_dev *hw)
+{
+	void __iomem *csr = cass_csr(hw, C_RMU_STS_INIT_DONE);
+	union {
+		u64 value;
+		union c_atu_sts_init_done atu_sts_init_done;
+		union c_cq_sts_init_done cq_sts_init_done;
+		union c_lpe_sts_init_done lpe_sts_init_done;
+		union c_oxe_sts_common oxe_sts_common;
+		union c_rmu_sts_init_done rmu_sts_init_done;
+		union c_ee_sts_init_done ee_sts_init_done;
+	} x;
+	int rc;
+
+	csr = cass_csr(hw, C_ATU_STS_INIT_DONE);
+	rc = readq_poll_timeout(csr, x.value,
+				(x.atu_sts_init_done.anchor_init_done == 1 &&
+				 x.atu_sts_init_done.tag_init_done == 1 &&
+				 x.atu_sts_init_done.prb_init_done == 1),
+				1, 1000000);
+	if (rc)
+		return rc;
+
+	csr = cass_csr(hw, C_CQ_STS_INIT_DONE);
+	rc = readq_poll_timeout(csr, x.value,
+				(x.cq_sts_init_done.tou_init_done == 1 &&
+				 x.cq_sts_init_done.cq_init_done == 1),
+				1, 1000000);
+	if (rc)
+		return rc;
+
+	csr = cass_csr(hw, C_LPE_STS_INIT_DONE);
+	rc = readq_poll_timeout(csr, x.value,
+				(x.lpe_sts_init_done.free_mask_init_done == 0xf &&
+				 x.lpe_sts_init_done.ptlte_init_done == 1),
+				1, 1000000);
+	if (rc)
+		return rc;
+
+	csr = cass_csr(hw, C_OXE_STS_COMMON);
+	rc = readq_poll_timeout(csr, x.value,
+				(x.oxe_sts_common.init_done == 1),
+				1, 1000000);
+	if (rc)
+		return rc;
+
+	csr = cass_csr(hw, C_RMU_STS_INIT_DONE);
+	rc = readq_poll_timeout(csr, x.value,
+				(x.rmu_sts_init_done.warm_reset == 0 &&
+				 x.rmu_sts_init_done.init_done == 1),
+				1, 1000000);
+	if (rc)
+		return rc;
+
+	csr = cass_csr(hw, C_EE_STS_INIT_DONE);
+	rc = readq_poll_timeout(csr, x.value,
+				(x.ee_sts_init_done.warm_reset == 0 &&
+				 x.ee_sts_init_done.init_done == 1),
+				1, 1000000);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/* Program the device NID. */
+static void program_nid(struct cass_dev *hw, u32 nid)
+{
+	struct cxi_dev *cdev = &hw->cdev;
+	struct cxi_adev *cadev;
+	union c_oxe_cfg_fab_sfa cfg_fab_sfa = {};
+	union c_lpe_cfg_get_ctrl cfg_get_ctrl;
+	union c_ixe_cfg_dfa cfg_dfa = {};
+	union c_pct_cfg_pkt_misc cfg_pkt_misc;
+
+	cdev->prop.nid = nid;
+
+	cass_read(hw, C_PCT_CFG_PKT_MISC, &cfg_pkt_misc, sizeof(cfg_pkt_misc));
+	cfg_pkt_misc.sfa_nid = cdev->prop.nid;
+	cass_write(hw, C_PCT_CFG_PKT_MISC, &cfg_pkt_misc, sizeof(cfg_pkt_misc));
+
+	cfg_fab_sfa.nid = cdev->prop.nid;
+	cass_write(hw, C_OXE_CFG_FAB_SFA, &cfg_fab_sfa, sizeof(cfg_fab_sfa));
+
+	cass_read(hw, C_LPE_CFG_GET_CTRL, &cfg_get_ctrl, sizeof(cfg_get_ctrl));
+	cfg_get_ctrl.dfa_nid = cdev->prop.nid;
+	cass_write(hw, C_LPE_CFG_GET_CTRL, &cfg_get_ctrl, sizeof(cfg_get_ctrl));
+
+	cfg_dfa.dfa_chk_en = 0xFF;
+	cfg_dfa.dfa_nid = cdev->prop.nid;
+	cass_write(hw, C_IXE_CFG_DFA, &cfg_dfa, sizeof(cfg_dfa));
+
+	cxi_send_async_event(cdev, CXI_EVENT_NID_CHANGED);
+
+	/*
+	 * The auxiliary device is freed when it is removed, which clears
+	 * cxi_adev under this lock first. Hold the lock for the whole
+	 * notification so removal waits for it and cannot free the device
+	 * under it.
+	 */
+	mutex_lock(&hw->cxi_adev_lock);
+	cadev = hw->cxi_adev;
+	if (cadev)
+		blocking_notifier_call_chain(&cadev->nid_notifier, nid, cdev);
+	mutex_unlock(&hw->cxi_adev_lock);
+}
+
+void cxi_set_nid(struct cxi_dev *cdev, u32 nid)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	/* The NID cannot be set from a VF */
+	if (!cdev->is_physfn)
+		return;
+
+	program_nid(hw, nid);
+	hw->cdev.prop.nid_configured = true;
+}
+EXPORT_SYMBOL(cxi_set_nid);
+
+void cxi_set_nid_from_mac(struct cxi_dev *cdev, const u8 *addr)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	u32 nid;
+
+	/* The NID cannot be set from a VF */
+	if (!cdev->is_physfn)
+		return;
+
+	/* If the NID has already been explicitly configured, do not override it. */
+	if (hw->cdev.prop.nid_configured)
+		return;
+
+	nid = ether_addr_to_u64(addr) & 0xFFFFFULL;
+	program_nid(hw, nid);
+	cxidev_warn(&hw->cdev,
+		    "NID has not been explicitly set. NID derived from MAC: 0x%x\n", nid);
+}
+EXPORT_SYMBOL(cxi_set_nid_from_mac);
+
+/* Determine the Cassini link speed. When CCIX Extended Speed Mode
+ * (ESM) is enabled, non-standard speeds exist.
+ */
+static int get_pcie_link_speed(struct cass_dev *hw)
+{
+	struct pci_dev *pdev = hw->cdev.pdev;
+	enum pci_bus_speed speed;
+	u32 val;
+	int pos;
+	int rc;
+
+	/* Get the regular PCIe speed first */
+	speed = pcie_get_speed_cap(pdev);
+	switch (speed) {
+	case PCIE_SPEED_2_5GT:
+	case PCIE_SPEED_5_0GT:
+	case PCIE_SPEED_8_0GT:
+	case PCIE_SPEED_16_0GT:
+	case PCIE_SPEED_32_0GT:
+		hw->pcie_link_speed = speed;
+		break;
+
+	default:
+		hw->pcie_link_speed = CASS_SPEED_UNKNOWN;
+		break;
+	}
+
+	/* ESM is only present on first generation Cassini hardware. */
+	if (cass_version(hw, CASSINI_2))
+		return 0;
+
+	pos = 0;
+	while ((pos = pci_find_next_ext_capability(pdev, pos,
+						   PCI_EXT_CAP_ID_DVSEC))) {
+		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER1, &val);
+		if (PCI_DVSEC_HEADER1_VID(val) == 0x0001 &&
+		    PCI_DVSEC_HEADER1_REV(val) == 0x1 &&
+		    PCI_DVSEC_HEADER1_LEN(val) == 0x040)
+			break;
+	}
+	if (pos == 0) {
+		/* The header is not present when using PCIe
+		 * passthrough with the vfio-pci driver.
+		 */
+		cxidev_warn(&hw->cdev, "Cannot find the PCIe DVSEC header\n");
+		return 0;
+	}
+
+	/* ESM control register */
+	rc = pci_read_config_dword(pdev, pos + 0x18, &val);
+	if (rc) {
+		cxidev_err(&hw->cdev, "Cannot get ESM status\n");
+		return -EIO;
+	}
+	hw->esm_active = !!(val & BIT(15));
+
+	if (!hw->esm_active)
+		return 0;
+
+	/* ESM PCIe link speed, from the ESM status register */
+	rc = pci_read_config_dword(pdev, pos + 0x14, &val);
+	if (rc) {
+		cxidev_err(&hw->cdev, "Cannot get PCIe link speed\n");
+		return -EIO;
+	}
+
+	switch (val & 0x7f) {
+	case 0x1:
+		hw->pcie_link_speed = PCIE_SPEED_2_5GT;
+		break;
+	case 0x2:
+		hw->pcie_link_speed = PCIE_SPEED_5_0GT;
+		break;
+	case 0x3:
+		hw->pcie_link_speed = PCIE_SPEED_8_0GT;
+		break;
+	case 0x6:
+		hw->pcie_link_speed = PCIE_SPEED_16_0GT;
+		break;
+	case 0xa:
+		hw->pcie_link_speed = CASS_SPEED_20_0GT;
+		break;
+	case 0xf:
+		hw->pcie_link_speed = CASS_SPEED_25_0GT;
+		break;
+	default:
+		hw->pcie_link_speed = CASS_SPEED_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
+static const unsigned int cfg_crnc_csr[] = {
+	C_ATU_CFG_CRNC,
+	C_CQ_CFG_CRNC,
+	C_EE_CFG_CRNC,
+	C_HNI_CFG_CRNC,
+	C_HNI_PML_CFG_CRNC,
+	C_IXE_CFG_CRNC,
+	C_LPE_CFG_CRNC,
+	C_MB_CFG_CRNC,
+	C_MST_CFG_CRNC,
+	C_OXE_CFG_CRNC,
+	C_PARBS_CFG_CRNC,
+	C_PCT_CFG_CRNC,
+	C_PI_CFG_CRNC,
+	C_PI_IPD_CFG_CRNC,
+	C_RMU_CFG_CRNC,
+};
+
+/* Initializes the hardware. */
+static int init_hw(struct cass_dev *hw)
+{
+	int ret;
+	int i;
+	u64 do_dump = 0;
+	union c_lpe_cfg_min_free_shft lpe_cfg_min_free_shift = {
+		.min_free_shft = min_free_shift,
+	};
+	static const union c_mb_cfg_crmc cfg_crmc = {
+		.ring_timeout = 0xff,
+		.rd_addr_invalid_decerr_disable = 1,
+	};
+	static const union c_mb_cfg_misc cfg_mask = {
+		.nic_warm_rst0 = 1,
+		.nic_warm_rst1 = 1,
+		.nic_warm_rst2 = 1,
+		.nic_warm_rst3 = 1,
+		.nic_warm_rst4 = 1,
+		.nic_warm_rst5 = 1,
+		.nic_warm_rst6 = 1,
+		.nic_warm_rst7 = 1,
+		.nic_warm_rst8 = 1,
+		.nic_warm_rst9 = 1,
+	};
+	union c_mb_cfg_misc cfg;
+
+	/* Trigger a warm reset of the hardware - Only the bits common
+	 * to Cassini 1 & 2 are used here.
+	 */
+	cass_read(hw, C_MB_CFG_MISC, &cfg, sizeof(cfg));
+	cfg.qw |= cfg_mask.qw;
+	cass_write(hw, C_MB_CFG_MISC, &cfg, sizeof(cfg));
+
+	/* This CSR must be cleared while warm reset is asserted. */
+	cass_clear(hw, C_EE_DBG_LM_CB_TO_EQ_MAP(0), C_EE_DBG_LM_CB_TO_EQ_MAP_SIZE);
+
+	/* De-assert warm reset */
+	cfg.qw &= ~cfg_mask.qw;
+	cass_write(hw, C_MB_CFG_MISC, &cfg, sizeof(cfg));
+
+	cass_flush_pci(hw);
+
+	if (wait_hw_ready(hw)) {
+		cxidev_err(&hw->cdev, "chip not ready\n");
+		return -ENOTSUPP;
+	}
+
+	cass_init(hw);
+
+	/* Fake hardware initialization */
+	if (HW_PLATFORM_NETSIM(hw))
+		cass_write(hw, NICSIM_CONFIG_DUMP, &do_dump, sizeof(do_dump));
+
+	for (i = 0; i < C_MB_CFG_CRMC_ENTRIES; i++)
+		cass_write(hw, C_MB_CFG_CRMC(i), &cfg_crmc, sizeof(cfg_crmc));
+
+	for (i = 0; i < ARRAY_SIZE(cfg_crnc_csr); i++) {
+		static const union c_atu_cfg_crnc cfg_crnc = {
+			.csr_timeout = 0xfd,
+		};
+
+		/* Use c_atu_cfg_crnc as it's the same structure for
+		 * all CSRs
+		 */
+		cass_write(hw, cfg_crnc_csr[i], &cfg_crnc, sizeof(cfg_crnc));
+	}
+
+	cass_write(hw, C_LPE_CFG_MIN_FREE_SHFT, &lpe_cfg_min_free_shift,
+		   sizeof(lpe_cfg_min_free_shift));
+
+	if (cass_version(hw, CASSINI_2)) {
+		union c2_lpe_cfg_match_sel cfg_match_sel = {
+			.vni_cfg = vni_matching,
+		};
+
+		hw->cdev.prop.vni_matching = vni_matching;
+		cass_write(hw, C2_LPE_CFG_MATCH_SEL, &cfg_match_sel,
+			   sizeof(cfg_match_sel));
+	}
+
+	ret = cass_dmac_init(hw);
+	if (ret)
+		goto __init_hw_err_0;
+
+	ret = cass_telem_init(hw);
+	if (ret)
+		goto __init_hw_err_1;
+
+	cass_pct_init(hw);
+	cass_hni_init(hw);
+	cass_tle_init(hw);
+	cass_cq_init(hw);
+	cass_oxe_init(hw);
+
+	ret = cass_ixe_init(hw);
+	if (ret)
+		goto __init_hw_err_2;
+
+	cass_pte_init(hw);
+	ret = cass_atu_init(hw);
+	if (ret)
+		goto __init_hw_err_2;
+
+	cass_ee_init(hw);
+	ret = cass_tc_init(hw);
+	if (ret)
+		goto __init_hw_err_3;
+
+	cxi_dev_init_eth_tx_profile(hw);
+
+	return 0;
+
+__init_hw_err_3:
+	cass_atu_fini(hw);
+
+__init_hw_err_2:
+	cass_hni_fini(hw);
+	cass_telem_fini(hw);
+
+__init_hw_err_1:
+	cass_dmac_fini(hw);
+
+__init_hw_err_0:
+	return ret;
+}
+
+static void fini_hw(struct cass_dev *hw)
+{
+	cxi_eth_tx_profile_cleanup(hw);
+	cass_tc_fini(hw);
+	cass_atu_fini(hw);
+	cass_ixe_fini(hw);
+	cass_hni_fini(hw);
+	cass_telem_fini(hw);
+	cass_dmac_fini(hw);
+}
+
+/* Check whether the hardware is supported, and set the version. */
+static int is_supported(struct cass_dev *hw)
+{
+	cass_read(hw, C_MB_STS_REV, &hw->rev, sizeof(hw->rev));
+
+	if (!HW_PLATFORM_ASIC(hw) && !HW_PLATFORM_Z1(hw) &&
+	    !HW_PLATFORM_NETSIM(hw)) {
+		cxidev_err(&hw->cdev, "device %x/%x/%x/%x/%x is not supported\n",
+			   hw->rev.vendor_id, hw->rev.device_id,
+			   hw->rev.platform, hw->rev.proto, hw->rev.rev);
+		return -ENOTSUPP;
+	}
+
+	if (hw->rev.vendor_id == PCI_VENDOR_ID_CRAY &&
+	    hw->rev.device_id == PCI_DEVICE_ID_CASSINI_1) {
+		if (hw->rev.rev == 1)
+			hw->cdev.prop.cassini_version = CASSINI_1_0;
+		else if (hw->rev.rev == 2)
+			hw->cdev.prop.cassini_version = CASSINI_1_1;
+		else
+			goto unsupported;
+	} else if (hw->rev.vendor_id == PCI_VENDOR_ID_HPE &&
+		   (hw->rev.device_id == PCI_DEVICE_ID_CASSINI_2_PF ||
+		    hw->rev.device_id == PCI_DEVICE_ID_CASSINI_2_VF)) {
+		if (hw->rev.rev == 1)
+			hw->cdev.prop.cassini_version = CASSINI_2_0;
+		else
+			goto unsupported;
+	}
+
+	if (hw_rev_override) {
+		if (hw_rev_override != CASSINI_1_0 &&
+		    hw_rev_override != CASSINI_1_1 &&
+		    hw_rev_override != CASSINI_2_0)
+			goto unsupported;
+
+		hw->cdev.prop.cassini_version = hw_rev_override;
+	}
+
+	if (cass_version(hw, CASSINI_2) && HW_PLATFORM_Z1(hw) &&
+	    (hw->rev.proto & 0x001) == 1) {
+		cxidev_info(&hw->cdev, "device has reduced PCT tables\n");
+		hw->reduced_pct_tables = true;
+	}
+
+	return 0;
+
+unsupported:
+	cxidev_err(&hw->cdev, "device %x/%x/%x/%x/%x is not supported\n",
+		   hw->rev.vendor_id, hw->rev.device_id,
+		   hw->rev.platform, hw->rev.proto, hw->rev.rev);
+	return -ENOTSUPP;
+}
+
+static int cass_link_fini_once(struct cass_dev *hw, bool *link_started)
+{
+	int rtn;
+
+	if (!*link_started)
+		return 0;
+
+	rtn = hw->link_ops->link_fini(hw);
+	if (!rtn)
+		*link_started = false;
+
+	return rtn;
+}
+
+static int cass_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	int i;
+	int rc = 0;
+	struct cass_dev *hw;
+	bool is_physfn;
+	bool link_started = false;
+	bool class_dev_initialized = false;
+	int pos;
+
+	hw = kzalloc(sizeof(*hw), GFP_KERNEL);
+	if (!hw)
+		return -ENOMEM;
+
+	pci_set_drvdata(pdev, hw);
+	hw->cdev.pdev = pdev;
+	INIT_LIST_HEAD(&hw->lni_list);
+	spin_lock_init(&hw->lni_lock);
+	refcount_set(&hw->refcount, 1);
+
+	atomic_set(&hw->stats.lni, 0);
+
+	/* Initializes the RMU domains */
+	atomic_set(&hw->stats.domain, 0);
+	ida_init(&hw->rmu_index_table);
+	ida_init(&hw->domain_table);
+	spin_lock_init(&hw->domain_lock);
+	spin_lock_init(&hw->pid_pool_lock);
+	spin_lock_init(&hw->rmu_lock);
+
+	/* Initialize the EQs */
+	atomic_set(&hw->stats.eq, 0);
+	ida_init(&hw->eq_index_table);
+	spin_lock_init(&hw->eq_shadow_lock);
+	mutex_init(&hw->init_eq_hw_state);
+
+	/* Initialize the communication profiles. */
+	ida_init(&hw->cp_table);
+	mutex_init(&hw->cp_lock);
+
+	/* Initialize the transmit and target CQs. */
+	atomic_set(&hw->stats.txq, 0);
+	atomic_set(&hw->stats.tgq, 0);
+	ida_init(&hw->cq_table);
+	spin_lock_init(&hw->cq_shadow_lock);
+	mutex_init(&hw->cq_init_lock);
+
+	/* Initialize the PTs */
+	atomic_set(&hw->stats.pt, 0);
+	ida_init(&hw->pte_table);
+	ida_init(&hw->pt_index_table);
+	ida_init(&hw->set_list_table);
+	ida_init(&hw->multicast_table);
+	spin_lock_init(&hw->lpe_shadow_lock);
+	spin_lock_init(&hw->rmu_portal_list_lock);
+	mutex_init(&hw->mst_table_lock);
+	mutex_init(&hw->pte_transition_sm_lock);
+	atomic_set(&hw->plec_count, 0);
+
+	/* Initialize the CTs. */
+	atomic_set(&hw->stats.ct, 0);
+	mutex_init(&hw->ct_init_lock);
+	ida_init(&hw->ct_table);
+
+	ida_init(&hw->lni_table);
+	cass_rgid_init(hw);
+
+	ida_init(&hw->md_index_table);
+
+	for (i = 0; i < C_PE_COUNT; i++)
+		ida_init(&hw->le_pool_ids[i]);
+
+	ida_init(&hw->tle_pool_ids);
+	mutex_init(&hw->msg_relay_lock);
+	mutex_init(&hw->tc_lock);
+	INIT_LIST_HEAD(&hw->tc_list);
+	mutex_init(&hw->cxi_adev_lock);
+	for (i = 0; i < ARRAY_SIZE(hw->vfs); i++)
+		mutex_init(&hw->vfs[i].notif_lock);
+
+	/* Initialize RMU Ethernet resource management */
+	idr_init(&hw->rmu_eth_idr);
+	mutex_init(&hw->rmu_eth_lock);
+
+	mutex_init(&hw->err_flg_mutex);
+	INIT_LIST_HEAD(&hw->err_flg_list);
+	spin_lock_init(&hw->sfs_err_flg_lock);
+
+	spin_lock_init(&hw->mst_match_done_lock);
+	mutex_init(&hw->mst_update_lock);
+
+	spin_lock_init(&hw->sbl_state_lock);
+
+	mutex_init(&hw->qsfp_eeprom_lock);
+	cass_phy_init(hw);
+
+	INIT_DELAYED_WORK(&hw->lni_cleanups_work, lni_cleanups_work);
+	mutex_init(&hw->lni_cleanups_lock);
+	INIT_LIST_HEAD(&hw->lni_cleanups_list);
+
+	mutex_init(&hw->sbus_mutex);
+	mutex_init(&hw->get_ctrl_mutex);
+	mutex_init(&hw->amo_remap_to_pcie_fadd_mutex);
+
+	hw->tsc_fill_qty = TSC_DEFAULT_FILL_QTY;
+	hw->uc_platform = CUC_BOARD_TYPE_UNKNOWN;
+
+	/* Enable Device */
+	rc = pci_enable_device(pdev);
+	if (rc) {
+		cxidev_err(&hw->cdev, "pci_enable_device() failed.\n");
+		goto hw_free;
+	}
+
+	/* The is_physfn and is_virtfn fields of struct pci_dev are only set if
+	 * SR-IOV has been successfully enabled. This means that we cannot rely on
+	 * them to identify physical vs. virtual functions in all cases. A PF on
+	 * real hardware without SR-IOV support, a passthrough PF attached to a VM,
+	 * or a VF attached to a VM, will all have is_physfn = is_virtfn = 0.
+	 *
+	 * C2 (and most other PCI devices) have distinct device IDs for PF and VF.
+	 * However, C1 uses the same ID for both, so we identify PF vs. VF by the
+	 * size of BAR 0.
+	 */
+
+	switch (id->device) {
+	case PCI_DEVICE_ID_CASSINI_1:
+		is_physfn = pci_resource_len(pdev, MMIO_BAR) >= MMIO_BAR_LEN_PF;
+		break;
+	case PCI_DEVICE_ID_CASSINI_2_PF:
+		is_physfn = true;
+		break;
+	case PCI_DEVICE_ID_CASSINI_2_VF:
+		is_physfn = false;
+		break;
+	default:
+		cxidev_err(&hw->cdev, "Unknown device ID: %04x", id->device);
+		return -EOPNOTSUPP;
+	}
+	hw->cdev.is_physfn = is_physfn;
+
+	hw->pci_disabled = false;
+
+	rc = pci_enable_pcie_error_reporting(pdev);
+	if (rc)
+		cxidev_err(&hw->cdev, "PCIe AER not enabled: %d\n", rc);
+
+	/* Set PID space variables for NIC. */
+	hw->cdev.prop.pid_bits = pid_bits;
+	hw->cdev.prop.pid_count = (1 << pid_bits) - 1; /* -1 is wildcard */
+	hw->cdev.prop.pid_granule =
+		(1 << (DFA_EP_BITS - hw->cdev.prop.pid_bits));
+
+	hw->cdev.prop.min_free_shift = min_free_shift;
+
+	/* Set the NID to invalid */
+	hw->cdev.prop.nid = CXI_INVALID_NID;
+
+	/* Enable DMA */
+	pci_set_master(pdev);
+
+	dma_set_max_seg_size(&hw->cdev.pdev->dev, UINT_MAX);
+
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(57));
+	if (rc) {
+		cxidev_err(&hw->cdev, "dma_set_mask_and_coherent failed: %d\n", rc);
+		goto dev_disable;
+	}
+
+	/* Enable PCIe AMO requests */
+	pcie_capability_set_word(pdev, PCI_EXP_DEVCTL2,
+				 PCI_EXP_DEVCTL2_ATOMIC_REQ);
+
+	/* Make sure VF 10-bit tag support bit is set for correct counting of
+	 * PI_IPD_pti_tarb_blocked_on_tag.
+	 */
+#define PCI_SRIOV_CTRL_VF_10BIT_TAG 0x20
+	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
+	if (pos) {
+		u16 word;
+
+		pci_read_config_word(pdev, pos + PCI_SRIOV_CTRL, &word);
+		word |= PCI_SRIOV_CTRL_VF_10BIT_TAG;
+		pci_write_config_word(pdev, pos + PCI_SRIOV_CTRL, word);
+	}
+
+	/* Sanity Check. Check BAR 0 is defined and mapped */
+	if (!(pci_resource_flags(pdev, MMIO_BAR) & IORESOURCE_MEM)) {
+		cxidev_err(&hw->cdev, "Incorrect Bar configuration\n");
+		goto dev_disable;
+	}
+
+	/* Take ownership of memory region */
+	rc = pci_request_regions(pdev, "cxi");
+	if (rc) {
+		cxidev_err(&hw->cdev, "pci_request_regions() failed.\n");
+		goto dev_disable;
+	}
+
+	/* Map the base registers */
+	hw->regs_base = pci_resource_start(pdev, MMIO_BAR);
+	if (is_physfn) {
+		hw->regs = ioremap(hw->regs_base + C_MEMORG_CSR,
+				   C_MEMORG_CSR_SIZE);
+		if (!hw->regs) {
+			cxidev_err(&hw->cdev, "ioremap failed\n");
+			goto free_regions;
+		}
+
+		/* Check hardware is supported */
+		rc = is_supported(hw);
+		if (rc)
+			goto unmap_regions;
+
+		/* Check for input and hardware version consistency */
+		if ((system_type_identifier == CASSINI_1_ONLY &&
+		     !cass_version(hw, CASSINI_1)) ||
+		    (system_type_identifier == CASSINI_2_ONLY &&
+		     !cass_version(hw, CASSINI_2))) {
+			cxidev_err(&hw->cdev,
+				   "NIC Version and system_type_identifier (%u) are inconsistent\n",
+				   system_type_identifier);
+			goto unmap_regions;
+		}
+
+		hw->cdev.system_type_identifier = system_type_identifier;
+
+		rc = get_pcie_link_speed(hw);
+		if (rc)
+			goto unmap_regions;
+
+#if defined(CXI_DISABLE_SRIOV)
+		rc = pci_sriov_set_totalvfs(pdev, 0);
+		if (rc)
+			goto unmap_regions;
+#endif
+	}
+
+	hw->with_vf_support = pdev->is_physfn || pci_msix_vec_count(pdev) != 2;
+
+	hw->cdev.cxi_num = atomic_inc_return(&cxi_num);
+	dev_set_name(&hw->class_dev, "cxi%u", hw->cdev.cxi_num);
+	strcpy(hw->cdev.name, dev_name(&hw->class_dev));
+
+	cxi_set_link_ops(hw);
+
+	rc = cass_irq_init(hw);
+	if (rc) {
+		cxidev_err(&hw->cdev, "cass_irq_init failed: %d\n", rc);
+		goto unmap_regions;
+	}
+
+	if (is_physfn) {
+		/* NIC address needs to be assigned before initialization. */
+		rc = init_hw(hw);
+		if (rc) {
+			cxidev_err(&hw->cdev, "init_hw failed: %d\n", rc);
+			goto free_irqs;
+		}
+
+		rc = register_error_handlers(hw);
+		if (rc)
+			goto fini_hw;
+
+		rc = cass_register_uc(hw);
+		if (rc) {
+			cxidev_err(&hw->cdev, "Cannot register the uC: %d\n", rc);
+			goto free_error_handlers;
+		}
+
+		switch (hw->uc_platform) {
+		case CUC_BOARD_TYPE_SAWTOOTH:
+		case CUC_BOARD_TYPE_BRAZOS:
+			if (!cass_version(hw, CASSINI_1)) {
+				cxidev_err(&hw->cdev, "Invalid Cassini 1 platform: %d\n",
+					   hw->uc_platform);
+				goto unregister_uc;
+			}
+			break;
+		case CUC_BOARD_TYPE_WASHINGTON:
+		case CUC_BOARD_TYPE_KENNEBEC:
+		case CUC_BOARD_TYPE_SOUHEGAN:
+			if (!cass_version(hw, CASSINI_2)) {
+				cxidev_err(&hw->cdev, "Invalid Cassini 2 platform: %d\n",
+					   hw->uc_platform);
+				goto unregister_uc;
+			}
+			break;
+		default:
+			cxidev_err(&hw->cdev, "Unknown uC platform %d\n",
+				   hw->uc_platform);
+			goto unregister_uc;
+		}
+
+		if (HW_PLATFORM_ASIC(hw) || HW_PLATFORM_NETSIM(hw)) {
+			/* These platforms have a micro-controller to fetch the
+			 * NIC ID from
+			 */
+			rc = uc_cmd_get_nic_id(hw);
+			if (rc)
+				goto unregister_uc;
+		} else {
+			hw->uc_nic = 0;
+		}
+
+		rc = uc_cmd_get_mac(hw);
+		if (rc)
+			eth_random_addr(hw->default_mac_addr);
+		uc_cmd_set_link_leds(hw, LED_FAST_GRN);
+
+		if (HW_PLATFORM_ASIC(hw)) {
+			/* Program MAC with burned-in MAC. */
+			ether_addr_copy(hw->cdev.mac_addr, hw->default_mac_addr);
+		} else {
+			u64 reg;
+			u8 mac_addr[ETH_ALEN];
+
+			/* Pull MAC from a scratch register on netsim and derive NID from it. */
+			if (HW_PLATFORM_NETSIM(hw))
+				cass_read(hw, NICSIM_NIC_ID, &reg, 8);
+			else
+				cass_read(hw, C_MB_DBG_SCRATCH(1), &reg, 8);
+
+			u64_to_ether_addr(reg, mac_addr);
+			ether_addr_copy(hw->cdev.mac_addr, mac_addr);
+			program_nid(hw, ether_addr_to_u64(hw->cdev.mac_addr) & 0xFFFFFULL);
+		}
+
+		/* SBL init must happen after uC init, since SBL needs to know
+		 * which NIC is associated with this driver instance
+		 */
+		rc = hw->link_ops->link_start(hw);
+		if (rc)
+			goto unregister_uc;
+		link_started = true;
+
+		cass_tc_get_hni_pause_cfg(hw);
+
+		if (cass_version(hw, CASSINI_1)) {
+			rc = cass_register_port(hw);
+			if (rc)
+				goto link_fini;
+		}
+
+		rc = cass_ptp_init(hw);
+		if (rc)
+			goto unregister_port;
+
+		rc = cxi_dmac_desc_set_alloc(&hw->cdev, 1, "pt_id");
+		if (rc < 0)
+			goto cass_ptp_fini;
+		hw->dmac_pt_id = rc;
+
+		hw->mst_entries = dma_alloc_coherent(&pdev->dev,
+						     C_MST_DBG_MST_TABLE_SIZE,
+						     &hw->mst_entries_dma_addr,
+						     GFP_KERNEL);
+		if (!hw->mst_entries)
+			goto cass_dmac_fini;
+
+		rc = cxi_dmac_desc_set_add(&hw->cdev, hw->dmac_pt_id,
+					   hw->mst_entries_dma_addr,
+					   C_MST_DBG_MST_TABLE(0),
+					   C_MST_DBG_MST_TABLE_SIZE);
+		if (rc)
+			goto cass_mst_fini;
+	}
+
+	/* Set after TC/QOS init */
+	hw->cdev.untagged_eth_pcp = hw->qos.untagged_eth_pcp;
+
+	hw->cdev.prop.device_rev = hw->rev.rev;
+	hw->cdev.prop.device_proto = hw->rev.proto;
+	hw->cdev.prop.device_platform = hw->rev.platform;
+
+	hw->max_eth_rxsize = VLAN_ETH_FRAME_LEN;
+
+	cass_probe_debugfs_init(hw);
+
+	/* Hack to grant exclusive access to userspace for QSFP
+	 * firmware flashing. The SL driver must not be able to query
+	 * the QSFP module while an upgrade is happening. Since the UC
+	 * accesses are serialized, we shouldn't need anything
+	 * stronger than that. More ideally, we should have this file
+	 * attached to the i2c debugfs entry, but this was only made
+	 * available in kernel 6.8.
+	 */
+	debugfs_create_bool("i2c_locked", 0644, hw->debug_dir, &hw->uc_i2c_locked);
+
+	/* RX and TX profile setup */
+	cass_dev_rx_tx_profiles_init(hw);
+
+	/* Resource Group setup */
+	cass_dev_rgroup_init(hw);
+
+	/* Service setup */
+	rc = cass_svc_init(hw);
+	if (rc)
+		goto rgroup_fini;
+
+	rc = cxi_configfs_device_init(hw);
+	if (rc) {
+		pr_err("configfs initialize failed\n");
+		goto svc_fini;
+	}
+
+	if (!is_physfn) {
+		struct cxi_get_dev_properties_cmd cmd = {
+			.op = CXI_OP_GET_DEV_PROPERTIES,
+		};
+		struct cxi_properties_info resp;
+		size_t reply_len = sizeof(resp);
+
+		rc = cass_vf_init(hw);
+		if (rc)
+			goto configfs_fini;
+
+		/* Retrieve the device properties */
+		rc = cxi_send_msg_to_pf(&hw->cdev, &cmd, sizeof(cmd),
+					&resp, &reply_len);
+		if (rc != 0) {
+			cxidev_err(&hw->cdev, "BAD: Reply has return code %d\n", rc);
+			goto vf_fini;
+		} else if (reply_len != sizeof(resp)) {
+			cxidev_err(&hw->cdev,
+				   "BAD: Reply has unexpected length %zu\n",
+				   reply_len);
+			goto vf_fini;
+		} else {
+			cxidev_dbg(&hw->cdev, "Reply is valid\n");
+
+			hw->cdev.prop = resp;
+		}
+	}
+
+	/* Export device information. */
+	rc = create_sysfs_properties(hw);
+	if (rc)
+		goto vf_fini;
+
+	/* Register the device with sysfs */
+	hw->class_dev.class = &cxi_class;
+	hw->class_dev.parent = &pdev->dev;
+	hw->class_dev.release = cass_dev_release;
+	dev_set_drvdata(&hw->class_dev, hw);
+	class_dev_initialized = true;
+	if (device_register(&hw->class_dev)) {
+		destroy_sysfs_properties(hw);
+		goto vf_fini;
+	}
+
+	cxi_add_device(&hw->cdev);
+
+	if (is_physfn) {
+		cass_phy_start(hw, true);
+		start_pcie_monitoring(hw);
+	}
+
+	/* RDMA is optional; the NIC and Ethernet work without it. */
+	rc = cxi_ib_add_adev(pdev, hw, hw->cdev.cxi_num);
+	if (rc)
+		cxidev_warn(&hw->cdev,
+			    "RDMA auxiliary device not created: %d\n", rc);
+
+	return 0;
+
+vf_fini:
+	if (!is_physfn)
+		cass_vf_fini(hw);
+
+configfs_fini:
+	cxi_configfs_cleanup(hw);
+svc_fini:
+	cass_svc_fini(hw);
+rgroup_fini:
+	cass_dev_rgroup_fini(hw);
+	cass_dev_rx_tx_profiles_fini(hw);
+	debugfs_remove_recursive(hw->debug_dir);
+cass_mst_fini:
+	if (is_physfn) {
+		rc = cass_link_fini_once(hw, &link_started);
+		if (rc) {
+			WARN(1, "Cassini link teardown failed during probe unwind: %d\n", rc);
+			return rc;
+		}
+	}
+	if (is_physfn)
+		dma_free_coherent(&pdev->dev, C_MST_DBG_MST_TABLE_SIZE,
+				  hw->mst_entries, hw->mst_entries_dma_addr);
+cass_dmac_fini:
+	if (is_physfn) {
+		rc = cass_link_fini_once(hw, &link_started);
+		if (rc) {
+			WARN(1, "Cassini link teardown failed during probe unwind: %d\n", rc);
+			return rc;
+		}
+	}
+	if (is_physfn)
+		cxi_dmac_desc_set_free(&hw->cdev, hw->dmac_pt_id);
+cass_ptp_fini:
+	if (is_physfn) {
+		rc = cass_link_fini_once(hw, &link_started);
+		if (rc) {
+			WARN(1, "Cassini link teardown failed during probe unwind: %d\n", rc);
+			return rc;
+		}
+	}
+	if (is_physfn)
+		cass_ptp_fini(hw);
+unregister_port:
+	if (is_physfn) {
+		rc = cass_link_fini_once(hw, &link_started);
+		if (rc) {
+			WARN(1, "Cassini link teardown failed during probe unwind: %d\n", rc);
+			return rc;
+		}
+	}
+	if (is_physfn)
+		if (cass_version(hw, CASSINI_1))
+			cass_unregister_port(hw);
+link_fini:
+	if (is_physfn) {
+		rc = cass_link_fini_once(hw, &link_started);
+		if (rc) {
+			WARN(1, "Cassini link teardown failed during probe unwind: %d\n", rc);
+			return rc;
+		}
+	}
+unregister_uc:
+	if (is_physfn) {
+		uc_cmd_set_link_leds(hw, LED_OFF);
+		cass_unregister_uc(hw);
+	}
+free_error_handlers:
+	if (is_physfn)
+		deregister_error_handlers(hw);
+fini_hw:
+	if (is_physfn)
+		fini_hw(hw);
+free_irqs:
+	cass_irq_fini(hw);
+unmap_regions:
+	if (is_physfn)
+		iounmap(hw->regs);
+free_regions:
+	pci_release_regions(pdev);
+dev_disable:
+	cxidev_err(&hw->cdev, "deregistering device\n");
+
+	pci_clear_master(pdev);
+	pci_disable_pcie_error_reporting(pdev);
+	pci_disable_device(pdev);
+hw_free:
+	pci_set_drvdata(pdev, NULL);
+	if (class_dev_initialized)
+		put_device(&hw->class_dev);
+	else
+		kfree(hw);
+
+	return -ENODEV;
+}
+
+static void cass_remove(struct pci_dev *pdev)
+{
+	struct cass_dev *hw = pci_get_drvdata(pdev);
+	int rtn;
+
+	if (hw->cxi_adev) {
+		cxi_ib_remove_adev(hw);
+	}
+
+	cxi_remove_device(&hw->cdev);
+	destroy_sysfs_properties(hw);
+	debugfs_lookup_and_remove("port", hw->debug_dir);
+	debugfs_lookup_and_remove("counters", hw->debug_dir);
+
+	if (hw->cdev.is_physfn) {
+		stop_pcie_monitoring(hw);
+		cass_phy_stop(hw, true);
+		rtn = hw->link_ops->link_fini(hw);
+		if (rtn) {
+			WARN(1, "Cassini link teardown failed during remove: %d; aborting device teardown\n",
+			     rtn);
+			return;
+		}
+	}
+
+	cancel_delayed_work_sync(&hw->lni_cleanups_work);
+	lni_cleanups(hw, true);
+
+	/* Destroy RMU Ethernet resource management */
+	idr_destroy(&hw->rmu_eth_idr);
+
+	cass_rgid_fini(hw);
+	cxi_configfs_cleanup(hw);
+	cass_svc_fini(hw);
+	cass_dev_rgroup_fini(hw);
+	cass_dev_rx_tx_profiles_fini(hw);
+
+	debugfs_remove_recursive(hw->debug_dir);
+
+	if (hw->cdev.is_physfn) {
+		if (hw->num_vfs)
+			cass_sriov_configure(hw->cdev.pdev, 0);
+		dma_free_coherent(&pdev->dev, C_MST_DBG_MST_TABLE_SIZE,
+				  hw->mst_entries, hw->mst_entries_dma_addr);
+		cxi_dmac_desc_set_free(&hw->cdev, hw->dmac_pt_id);
+		cass_ptp_fini(hw);
+		uc_cmd_set_link_leds(hw, LED_OFF);
+		cass_unregister_uc(hw);
+		if (cass_version(hw, CASSINI_1))
+			cass_unregister_port(hw);
+		deregister_error_handlers(hw);
+		fini_hw(hw);
+	} else {
+		cass_vf_fini(hw);
+	}
+
+	cass_irq_fini(hw);
+
+	if (hw->cdev.is_physfn)
+		iounmap(hw->regs);
+	pci_release_regions(pdev);
+	pci_clear_master(pdev);
+	pci_disable_pcie_error_reporting(pdev);
+	if (!hw->pci_disabled)
+		pci_disable_device(pdev);
+
+	cxidev_WARN_ONCE(&hw->cdev, !refcount_dec_and_test(&hw->refcount),
+			 "Resource leaks - HW refcount not zero: %d\n",
+			 refcount_read(&hw->refcount));
+	device_unregister(&hw->class_dev);
+}
+
+void cass_disable_device(struct pci_dev *pdev, const char *reason)
+{
+	struct cass_dev *hw = pci_get_drvdata(pdev);
+
+	if (reason)
+		cxidev_err(&hw->cdev, "Disabling device. Reason: %s", reason);
+	else
+		cxidev_err(&hw->cdev, "Disabling device");
+
+	pci_clear_master(pdev);
+	pci_disable_device(pdev);
+
+	hw->pci_disabled = true;
+}
+
+void uncor_cb(struct cass_dev *hw, unsigned int irq, bool is_ext,
+	      unsigned int bitn)
+{
+	char reason[200];
+
+	if (!disable_on_error)
+		return;
+
+	snprintf(reason, sizeof(reason),
+		 "Unrecoverable error: %s with bitn: %d",
+		 (*hw->err_handlers)[irq][is_ext ? 1 : 0].csr_name_lo, bitn);
+
+	cass_disable_device(hw->cdev.pdev, reason);
+}
+
+static struct pci_device_id cass_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_CRAY, PCI_DEVICE_ID_CASSINI_1) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_HPE, PCI_DEVICE_ID_CASSINI_2_PF) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_HPE, PCI_DEVICE_ID_CASSINI_2_VF) },
+	{ 0, },
+};
+
+static struct pci_driver cass_pci_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = cass_ids,
+	.probe = cass_probe,
+	.remove = cass_remove,
+	.sriov_configure = cass_sriov_configure,
+};
+
+MODULE_DEVICE_TABLE(pci, cass_ids);
+
+int hw_register(void)
+{
+	int rc;
+
+	rc = genl_register_family(&cxierr_genl_family);
+	if (rc)
+		return rc;
+
+	rc = pci_register_driver(&cass_pci_driver);
+
+	if (rc)
+		genl_unregister_family(&cxierr_genl_family);
+
+	return rc;
+}
+
+void hw_unregister(void)
+{
+	pci_unregister_driver(&cass_pci_driver);
+	genl_unregister_family(&cxierr_genl_family);
+}
+
+/**
+ * cxi_retry_handler_running() - Check if retry handler is running.
+ *
+ * @cdev: CXI device.
+ *
+ * Return: True if retry handler is running. Else, false.
+ */
+bool cxi_retry_handler_running(struct cxi_dev *cdev)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	return hw->pct_eq_n != C_EQ_NONE;
+}
+EXPORT_SYMBOL(cxi_retry_handler_running);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_core.h b/drivers/net/ethernet/hpe/ss1/cass_core.h
new file mode 100644
index 000000000000..0810664d4ab9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_core.h
@@ -0,0 +1,1472 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_CORE_H
+#define _CASS_CORE_H
+
+#include <linux/device.h>
+#include <linux/iova.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+#include <linux/rbtree.h>
+#include <linux/workqueue.h>
+#include <net/netlink.h>
+#include <net/genetlink.h>
+#include <linux/ptp_clock_kernel.h>
+#include <linux/etherdevice.h>
+#include <linux/completion.h>
+#include <linux/hrtimer.h>
+#include <linux/hwmon.h>
+#include <linux/socket.h>
+#include <linux/i2c.h>
+
+#include "cxi_link.h"
+#include "cxi_core.h"
+#include "cuc_cxi.h"	/* from firmware_cassini/ */
+#include "cass_sbl.h"
+#include "pldm_cxi.h"
+#include "cass_sl.h"
+#include "cxi_qos_profiles.h"
+#include "cass_rx_tx_profile.h"
+#include "cass_rgroup.h"
+#include "cxi_config.h"
+#include "cass_p2p.h"
+#include "cass_vf.h"
+
+#define PCI_VENDOR_ID_CRAY         0x17db
+#define PCI_DEVICE_ID_CASSINI_1    0x0501
+#define PCI_VENDOR_ID_HPE          0x1590
+#define PCI_DEVICE_ID_CASSINI_2_PF 0x0371
+#define PCI_DEVICE_ID_CASSINI_2_VF 0x0372
+
+#define CXI_MODULE_NAME "cxi_ss1"
+
+/* The following are IPv6 next header values used for IPv6 extension headers.
+ * https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml
+ */
+#define IPV6_EH_HOPOPTS 0
+#define IPV6_EH_ROUTE 43
+#define IPV6_EH_FRAG 44
+#define IPV6_EH_ESP 50
+#define IPV6_EH_AH 51
+#define IPV6_EH_OPTS 60
+#define IPV6_EH_MOBILITY 135
+#define IPV6_EH_HIP 139
+#define IPV6_EH_SHIM6 140
+#define IPV6_EH_RSVD1 253
+#define IPV6_EH_RSVD2 254
+
+#define HW_PLATFORM(_hw) ((_hw)->rev.platform)
+#define HW_PLATFORM_ASIC(_hw) (HW_PLATFORM(_hw) == C_PLATFORM_ASIC)
+#define HW_PLATFORM_Z1(_hw) (HW_PLATFORM(_hw) == C_PLATFORM_Z1)
+#define HW_PLATFORM_NETSIM(_hw) (HW_PLATFORM(_hw) == C_PLATFORM_NETSIM)
+
+#define C_MAX_CSR_ERR_INFO 3
+#define C_MAX_CSR_CNTRS   3
+
+/* HPC MTU is fixed at 2k. The largest HPC header is 64 bytes. */
+#define C_MAX_HPC_MTU (2048 + 64)
+
+/* PCI BARs containing the CSRs and CQ/EQ areas. */
+#define MMIO_BAR 0
+
+/* Expected length of PCI BAR 0 for a Physical Function. Used to differentiate
+ * between Virtual Function (512M BAR 0) and Physical Function (2G BAR 0) under
+ * SR-IOV.
+ */
+#define MMIO_BAR_LEN_PF 2147483648
+
+/* Number of error interrupts */
+#define NUM_ERR_INTS 30
+
+#define PORTALS_MAX_FRAME_SIZE 2111U
+#define ETHERNET_MAX_FRAME_SIZE 9022U
+#define TSC_DEFAULT_FILL_QTY 16U
+
+#define PLEC_SIZE 256U
+
+enum cass_phy_state {
+	CASS_PHY_DOWN,
+	CASS_PHY_READY,
+	CASS_PHY_HALTED,
+	CASS_PHY_UP,
+	CASS_PHY_RUNNING,
+	CASS_PHY_NOLINK,
+	CASS_PHY_HEADSHELL_REMOVED,
+};
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s:%d " fmt, __func__, __LINE__
+
+#define atu_debug(fmt, ...) \
+do {						\
+	if (more_debug)				\
+		pr_debug(fmt, ##__VA_ARGS__);	\
+} while (0)
+
+/* Helper to get current task network namespace inode id safely. */
+#define CURRENT_NETNS_ID() ({					\
+	unsigned int __netns_id = 0;				\
+	struct task_struct *__ct = current;			\
+	rcu_read_lock();					\
+	if (__ct->nsproxy && __ct->nsproxy->net_ns)		\
+		__netns_id = __ct->nsproxy->net_ns->ns.inum;	\
+	rcu_read_unlock();					\
+	__netns_id;						\
+})
+
+#define ALLOC_IOVA_FAST(iovad, len, end) alloc_iova_fast(iovad, len, end, true)
+#define FREE_IOVA_FAST free_iova_fast
+
+#define INIT_IOVA_DOMAIN(iovad, ps, base, end) \
+		init_iova_domain(iovad, ps, base)
+
+#define ATU_HMM_PFN_TO_PFN(hpfn) page_to_pfn(hmm_pfn_to_page(hpfn))
+
+#define ATU_PFN_INVALID(hpfn) \
+	(!(hpfn & HMM_PFN_VALID) || \
+	 !(hpfn & HMM_PFN_WRITE) || \
+	  (hpfn & HMM_PFN_ERROR))
+#define ATU_PFN_WRITE(hpfn) ((hpfn & HMM_PFN_WRITE))
+#define ATU_PFN_VALID(hpfn) ((hpfn & HMM_PFN_VALID))
+
+/* AER is automatically enabled by the PCI core. */
+static inline int pci_enable_pcie_error_reporting(void *p) { return 0; }
+static inline void pci_disable_pcie_error_reporting(void *p) {}
+
+/* SR-IOV requires VFIO with KVM support enabled and kernel >= 5.19 */
+#if !defined(CONFIG_KVM_VFIO)
+#define CXI_DISABLE_SRIOV
+#endif
+
+#define ATU_FAULT_RETRY_MAX 16
+#define ATU_PTE_PTR (1 << 6)
+#define ATU_PTE_READ (1UL << 57)
+#define ATU_PTE_WRITE (1UL << 58)
+#define ATU_PTE_LEAF (1UL << 59)
+#define ATU_PTE_PRESENT (1UL << 60)
+#define ATU_HMM_RANGE_TIMEOUT 1000
+#define ATU_PTE_MASK (~(ATU_PTE_READ | ATU_PTE_WRITE | ATU_PTE_LEAF | \
+				ATU_PTE_PRESENT))
+
+#define MASK(x) (BIT(x) - 1)
+#define ATU_PTEPTR_SHIFT 6
+#define PTE_ADDR(pte) ((pte).ptr << ATU_PTEPTR_SHIFT)
+#define pfn2phys __pfn_to_phys
+#define PHYS_TO_PAGE(pa) pfn_to_page(__phys_to_pfn(pa))
+
+#define C_ADDR_SHIFT 12
+#define ATU_PTE_ENTRY_SIZE    sizeof(union a_pte)
+#define flsl(x) (fls64(x) - 1)
+#define ffsl(x) (fls64((x) & -(x)) - 1)
+#define ATUCQ_TIMEOUT (odp_sw_decouple ? decouple_timeout_us : atucq_timeout_us)
+#define ATU_IBW_TIMEOUT (5 * MSEC_PER_SEC * USEC_PER_MSEC)
+#define ATU_ODPQ_SPACE_TIMEOUT (100 * USEC_PER_MSEC)
+#define ATU_STS_ATUCQ_IDLE_TIMEOUT (10 * MSEC_PER_SEC * USEC_PER_MSEC)
+#define ATU_STS_IBW_IDLE_TIMEOUT (1000 * MSEC_PER_SEC * USEC_PER_MSEC)
+#define ATUCQ_ENTRY(index) (index & (C_ATU_CFG_CQ_TABLE_ENTRIES - 1))
+/* Based on the AC base page size */
+#define ATU_PMD_ORDER(cac) (cac->huge_shift - cac->page_shift)
+#define ATU_PMD_NR(cac) BIT(ATU_PMD_ORDER(cac))
+#define ATU_PTE_ORDER(cac) (cac->page_shift - PAGE_SHIFT)
+#define ATU_PTE_NR(cac) BIT(ATU_PTE_ORDER(cac))
+#define PFN_INC(cac, leaf) (leaf ? ATU_PMD_NR(cac) : 1)
+/* Based on the kernel base page size */
+#define K_PMD_ORDER(cac) (cac->huge_shift - PAGE_SHIFT)
+#define K_PMD_NR(cac) BIT(K_PMD_ORDER(cac))
+#define KPFN_INC(cac, leaf) (leaf ? K_PMD_NR(cac) : ATU_PTE_NR(cac))
+#define ATU_FLAGS_MASK ~(CXI_MAP_READ | CXI_MAP_WRITE | CXI_MAP_ALLOC_MD | \
+			 CXI_MAP_FAULT | CXI_MAP_PREFETCH)
+#define ATUCQ_INVALIDATE_ALL 0x200000000000000UL
+#define MAX_PG_TABLE_SIZE 15
+#define MIN_PG_TABLE_SIZE 3
+#define MIN_DEVICE_PG_TABLE_SIZE (MIN_PG_TABLE_SIZE + 2)
+#define INVALID_DMABUF_FD (-1)
+
+/* Reserve an AC for physical mapping to be shared by all processes */
+#define ATU_PHYS_AC (C_ATU_CFG_AC_TABLE_ENTRIES - 1)
+#define ATU_NTA_DEF_PI_ACXT ATU_PHYS_AC
+#define ATU_FLUSH_REQ_DELAY 0x3ff
+
+#ifndef VMA_ITERATOR
+#define for_each_vma(vmi, vma) for (; vma; vma = vma->vm_next)
+#endif /* VMA_ITERATOR */
+
+#define CASS_NUM_LE_POOLS (C_LPE_CFG_PE_LE_POOLS_ENTRIES / C_PE_COUNT)
+#define CASS_MIN_POOL_TLES 8
+#define ACS_AVAIL (ATU_PHYS_AC - 1)
+#define CTS_AVAIL (C_NUM_CTS - 1) /* CT 0 invalid */
+#define EQS_AVAIL (C_NUM_EQS - 1) /* EQ 0 invalid */
+
+#define CASS_MAX_IRQ_NAME 24
+
+/* Current devices have up to 31 sensors */
+#define CASS_MAX_SENSORS 32
+
+#define CASS2_MAX_PACKETS_INFLIGHT 128U
+#define CASS1_MAX_PACKETS_INFLIGHT 64U
+
+#define DEFAULT_LE_POOL_ID 0
+#define DEFAULT_TLE_POOL_ID 0
+
+enum cass_link_speed {
+	CASS_SPEED_UNKNOWN = PCI_SPEED_UNKNOWN,
+	CASS_SPEED_2_5GT = PCIE_SPEED_2_5GT,
+	CASS_SPEED_5_0GT = PCIE_SPEED_5_0GT,
+	CASS_SPEED_8_0GT = PCIE_SPEED_8_0GT,
+	CASS_SPEED_16_0GT = PCIE_SPEED_16_0GT,
+	CASS_SPEED_32_0GT = PCIE_SPEED_32_0GT,
+
+	CASS_SPEED_20_0GT,
+	CASS_SPEED_25_0GT,
+};
+
+/* Cassini clock frequency */
+#define C1_CLK_FREQ_HZ 1000000000ULL /* 1 GHz */
+#define C2_CLK_FREQ_HZ 1100000000ULL /* 1.1 GHz */
+
+extern const struct file_operations uc_fops;
+
+union a_pte {
+	struct c_page_table_entry pte;
+	u64 qw;
+};
+
+struct l1_entry {
+	/* The array of PTEs */
+	struct page *l1_pages;
+	dma_addr_t l1_pages_dma_addr;
+
+	/* Bitmap of used PTEs */
+	unsigned long *bitmap;
+};
+
+struct cass_nta {
+	/* nta root page table pointer virtual address */
+	union a_pte *root_ptr;
+	struct page *root_page;
+	dma_addr_t root_page_dma_addr;
+	int root_order;
+	int l1_order;
+	int numa_node;
+
+	/* Each L0 PDE has its own bitmap of allocated L1 PTE. */
+	int l0_entries;
+	int l1_entries;
+	struct l1_entry l1[];
+};
+
+struct cass_ac {
+	struct cxi_ac ac;
+	struct list_head list;
+	struct list_head md_list;
+	struct mutex md_mutex;
+	struct cxi_lni_priv *lni_priv;
+
+	struct mutex ac_mutex;
+
+	/* copy of the atu ac struct */
+	union c_atu_cfg_ac_table cfg_ac;
+	u32 flags;
+
+	int page_shift;
+	int huge_shift;
+	int ptg_mode;
+	bool hugepage_test;
+
+	struct cass_nta *nta;
+
+	u64 iova_base;
+	u64 iova_end;
+	u64 iova_len;
+
+	struct iova_domain *iovad;
+	struct dentry *debug_dir;
+	struct dentry *lni_dir;
+	refcount_t refcount;
+	refcount_t reader_refs;
+	struct completion readers_done;
+
+	u32 pasid;
+	struct iommu_sva *sva;
+};
+
+/* Value written by the ATU CQ in wait_rsp_data when completing
+ * commands.
+ */
+#define WAIT_RSP_DATA 0xf00fbeefULL
+
+struct cass_atu_cq {
+	/* Protects access to the ATU CQ and wait_rsp_data */
+	struct mutex atu_cq_mutex;
+	struct mutex atu_ib_mutex;
+	/* Inbound-wait hardware failure latch, protected by atu_ib_mutex. */
+	bool hw_failure;
+
+	struct wait_rsp_data {
+		u64 cmp ____cacheline_aligned;
+		u64 ib ____cacheline_aligned;
+	} wait_rsp_data;
+
+	dma_addr_t rsp_dma_addr;
+	dma_addr_t cmp_wait_rsp_addr;
+	dma_addr_t ib_wait_rsp_addr;
+
+	char cmpl_wait_int_name[CASS_MAX_IRQ_NAME];
+};
+
+struct sts_idle {
+	struct cass_dev *hw;
+	bool ib_wait;
+};
+
+#define MAX_VFMSG_SIZE (22432 + sizeof(struct vf_pf_msg_hdr))
+
+/* A VF to PF message header */
+struct vf_pf_msg_hdr {
+	unsigned int len;	/* whole message length */
+	int rc;			/* return code */
+	uid_t uid;
+	gid_t gid;
+	int seq;
+};
+
+/* Traffic Class descriptions. */
+struct cass_tc_cfg {
+	struct list_head tc_entry;
+
+	unsigned int tc;
+	enum cxi_traffic_class_type tc_type;
+
+	/* Restricted request DSCP. */
+	unsigned int res_req_dscp;
+
+	/* Unrestricted request DSCP. */
+	unsigned int unres_req_dscp;
+
+	/* Restricted response DSCP. */
+	unsigned int res_rsp_dscp;
+
+	/* Unrestricted response DSCP. */
+	unsigned int unres_rsp_dscp;
+
+	/* Request PCP. */
+	unsigned int req_pcp;
+
+	/* Response PCP. */
+	unsigned int rsp_pcp;
+
+	/* CQ OCU Set Index */
+	unsigned int ocuset;
+
+	/* Traffic class value specific to CQ configuration. */
+	unsigned int cq_tc;
+
+	/* Buffer Class */
+	unsigned int req_bc;
+};
+
+struct cass_rsrc_info {
+	u16 res;
+	u16 shared_total;
+	u16 shared_in_use;
+};
+
+struct cass_irq {
+	struct atomic_notifier_head nh;
+	int idx;
+	struct cpumask mask;
+	char irq_name[CASS_MAX_IRQ_NAME];
+	atomic_t refcount;
+	int vec;
+	struct mutex lock;
+};
+
+/* Maximum size of an error flag CSR. For Cassini-1, they are all 64
+ * bits. For Cassini-2, C_HNI_PML_ERR_FLG is 256 bits long.
+ */
+#define MAX_ERR_FLAG_BITLEN 256
+union err_flags {
+	DECLARE_BITMAP(mask, MAX_ERR_FLAG_BITLEN);
+	union c_pi_err_flg pi;
+	union c_pi_ext_err_flg pi_ext;
+	union c_pi_ipd_ext_err_flg pi_ipd_ext;
+	union c_atu_err_flg atu;
+	union c_atu_ext_err_flg atu_ext;
+	union c1_hni_err_flg c1_hni;
+	union c2_hni_err_flg c2_hni;
+	union c2_hni_ext_err_flg c2_hni_ext;
+	union c1_hni_pml_err_flg c1_hni_pml;
+	union ss2_port_pml_err_flg ss2_port_pml;
+	union c_rmu_err_flg rmu;
+	union c_lpe_err_flg lpe;
+	union c_pct_ext_err_flg pct_ext;
+	union c_ee_err_flg ee;
+	union c_ixe_err_flg ixe_err_flg;
+};
+
+struct cxi_reg_err_flg {
+	struct list_head list;
+	unsigned int irq;
+	bool is_ext;
+	union err_flags err_flags;
+	/* Callback. irq is the MSI-X interrupt index (0 to 29), and
+	 * is_ext indicates whether the flag is set in the ERR_FLG or
+	 * EXT_ERR_FLG CSR. bitn is the bit index in abovementioned
+	 * CSR.
+	 */
+	void (*cb)(struct cass_dev *hw, unsigned int irq,
+		   bool is_ext, unsigned int bitn);
+};
+
+/* For error CSR processing */
+struct flg_err_info;
+struct csr_info {
+	const char *csr_name;
+	const char *csr_name_lo; /* same, in lower case */
+
+	/* Various CSR offsets for that error. */
+	unsigned int flg;
+	unsigned int mask;
+	unsigned int clr;
+	unsigned int first_flg;
+	unsigned int first_flg_ts;
+	unsigned int bitlen;
+	const struct flg_err_info *flg_info;
+};
+
+extern const struct file_operations decouple_stats_fops;
+extern const struct file_operations sw_decouple_fops;
+
+/*
+ * there currently are not that many entities that need to reserve
+ * sets of dma descriptors.
+ *
+ * Currently, cassini telemetry/counters (with test/experimental code)
+ * uses five dmac descriptor sets and rosetta link monitoring (lmon)
+ * may use two dma descriptor sets.
+ *
+ */
+#define DMAC_DESC_SET_COUNT			16
+
+struct dmac_desc_set {
+	u16 count;      /* total number of descs */
+	u16 index;      /* index of first desc */
+	u16 numused;    /* number of descs written */
+	const char *name;	/* descriptive name to identify use */
+};
+
+struct cass_vf {
+	struct task_struct *task;
+	struct socket *req_sock;
+	struct socket *notif_sock;
+
+	/* Index and back-pointer to hardware struct for use by VF handler thread */
+	struct cass_dev *hw;
+	int vf_idx;
+
+	/* ID of physical-address context for use when configuring CQ, EQ, etc. */
+	unsigned int phys_ac;
+
+	unsigned int token;
+	int notif_seq;
+
+	/* Per VF mutex to maintain notification message/response sequencing */
+	struct mutex notif_lock;
+
+	/* Per-VF message buffers */
+	char request[MAX_VFMSG_SIZE];
+	char reply[MAX_VFMSG_SIZE];
+
+	struct task_struct *kvm_task;
+};
+
+enum cxi_rmu_eth_filter_mode {
+	CXI_RMU_ETH_FILTER_NONE = 0,
+	CXI_RMU_ETH_FILTER_DIRECT,
+	CXI_RMU_ETH_FILTER_RSS,
+};
+
+/**
+ * struct cxi_rmu_eth_priv - Private Ethernet resource tracking (INTERNAL)
+ *
+ * Full internal structure containing all resource management state.
+ * One allocation per function (PF or VF).
+ */
+struct cxi_rmu_eth_priv {
+	struct cxi_rmu_eth rmu_eth;     /* Public opaque handle */
+	struct cxi_dev *dev;            /* Device this allocation belongs to */
+	bool is_vf;                     /* True if this is a VF allocation */
+	unsigned int vf_num;            /* VF number (if is_vf=true) */
+	bool admin;                     /* True if it has admin privileges */
+
+	/* Resource allocation */
+	unsigned int indir_base;        /* Absolute offset in HW indirection table */
+	unsigned int indir_size;        /* Number of indir entries allocated */
+	unsigned int set_list_base;     /* Absolute offset in HW set_list (4+ for dynamic) */
+	unsigned int set_list_quota;    /* Max set_list entries for this function */
+
+	/* Default RSS configuration (used by all MACs when use_rss=true) */
+	unsigned int rss_queues;
+	struct cxi_pte *ptes[64];   /* PTE pointers for RSS queues */
+	u32 hash_types;
+	unsigned int indir_entries;     /* Active indirection table size */
+
+	/* Filter tracking [0..quota-1]: enum cxi_rmu_eth_filter_mode values */
+	u8 *mac_filter_slots;
+};
+
+struct cass_ac *cass_cac_get(struct cass_dev *hw, int acid);
+void cass_cac_put(struct cass_ac *cac);
+
+/* Private hardware data for Cassini. This is not seen by clients. */
+struct cass_dev {
+	/* Embed a cxi device. */
+	struct cxi_dev cdev;
+	struct cxi_cfg_group_item *cfg_dev_dir;
+
+	/* Register base in BAR0 */
+	void __iomem *regs;
+	unsigned long regs_base;
+
+	/* /sys/class interface */
+	struct device class_dev;
+
+	/* Device type and revision */
+	union c_mb_sts_rev rev;
+	bool reduced_pct_tables;
+
+	/* TODO: For development only. Netsim VFs are not really
+	 * supported.
+	 */
+	bool with_vf_support;
+
+	/* Number of VFs currently configured in the PF. */
+	unsigned int num_vfs;
+
+	/* Interrupt vector used for the PF/ VF communication */
+	unsigned int pf_vf_vec;
+	char pf_vf_int_name[CASS_MAX_IRQ_NAME];
+	struct completion pf_to_vf_comp;
+
+	/* Virtual function communication socket for SR-IOV. Used by PF to
+	 * listen for incoming VF connections, used by VF to initiate connection
+	 */
+	struct socket *vf_req_sock;
+	struct socket *vf_notif_sock;
+	struct task_struct *vf_listener;
+	struct task_struct *vf_notif_handler;
+	u8 vf_notif_buf[MAX_VFMSG_SIZE];
+	u8 vf_notif_rsp_buf[MAX_VFMSG_SIZE];
+	struct cass_vf vfs[C_NUM_VFS];
+	cxi_msg_relay_t msg_relay;
+	void *msg_relay_data;
+	struct mutex msg_relay_lock;
+	unsigned int vf_cmd_seq;
+	/* Mutex to maintain command message/response sequencing */
+	struct mutex vf_cmd_lock;
+
+	/* PCIe info */
+	bool esm_active;
+	u8 pcie_link_speed;
+	bool pci_disabled;
+
+	struct {
+		/* Monitoring */
+		struct delayed_work task;
+
+		/* Acceptable number of correctable errors per minute */
+		unsigned int corr_err_min;
+
+		/* PCIe Vendor Specific Information position */
+		unsigned int event_counter_control;
+		unsigned int event_counter_data;
+
+		/* Number of correctable and uncorrectable errors seen. */
+		u64 uncorr_err;
+		u64 corr_err;
+	} pcie_mon;
+
+	/* Error interrupts handling. Represent each of the 30 error
+	 * interrupts by a bit in err_irq_mask.
+	 */
+	unsigned long err_irq_mask;
+	unsigned long err_irq_raised;
+	int err_irq_vecs[NUM_ERR_INTS];
+	char err_int_names[NUM_ERR_INTS][CASS_MAX_IRQ_NAME];
+	struct workqueue_struct *err_irq_wq;
+	struct work_struct err_irq_work;
+	struct kobject *err_flgs_dir_kobj[2]; /* IRQA and IRQB */
+	const struct csr_info (*err_handlers)[NUM_ERR_INTS][2];
+
+	spinlock_t sfs_err_flg_lock; /* protects mask update */
+	struct sfs_err_flg {
+		struct kobject kobj;
+
+		/* IRQ A mask for the error flag CSR. */
+		DECLARE_BITMAP(err_irq_mask, MAX_ERR_FLAG_BITLEN);
+		unsigned int bitlen;
+
+		/* Which bits must never be automatically masked */
+		union err_flags no_auto_mask;
+
+		/* Which bits must never be printed in logs. Some error bits
+		 * can be raised during normal operation (eg. UC_INTERRUPT)
+		 * and should not appear in logs.
+		 */
+		union err_flags no_print_mask;
+	} sfs_err_flg[NUM_ERR_INTS][2];
+
+	/* Clients registered with the error interrupt handler, for
+	 * certain bits
+	 */
+	struct mutex err_flg_mutex;
+	struct list_head err_flg_list;
+
+	/* Temporary storage for CSR error processing. As there is
+	 * only one work at any given time, there is no race to access
+	 * these.
+	 */
+	struct {
+		struct err_info {
+			u64 data[5];
+			int count;
+		} err_info[C_MAX_CSR_ERR_INFO];
+		unsigned int err_info_count;
+		u64 cntrs_val[C_MAX_CSR_CNTRS];
+		unsigned int err_cntrs_count;
+		char err_info_str[100];
+		DECLARE_BITMAP(first_flg, MAX_ERR_FLAG_BITLEN);
+		union c_any_err_first_flg_ts first_flg_ts;
+	};
+
+	/* Each error is rate limited. If too many interrupts happen
+	 * for the same error bit, then the bit will be permanently
+	 * masked.
+	 */
+	struct ratelimit_state err_rl[NUM_ERR_INTS][MAX_ERR_FLAG_BITLEN];
+
+	/* Debugfs directories for that device */
+	struct dentry *debug_dir;
+	struct dentry *port_dir;
+	struct dentry *stats_dir;
+	struct dentry *lni_dir;
+	struct dentry *atu_dir;
+	struct dentry *decouple_dir;
+
+	/* Count users of this device. */
+	refcount_t refcount;
+
+	/* Keep track of NIs. TODO: keep as that may help debugging,
+	 * but should be removed eventually.
+	 */
+	struct list_head lni_list;
+	spinlock_t lni_lock;
+
+	struct {
+		atomic_t lni;
+		atomic_t domain;
+		atomic_t eq;
+		atomic_t txq;
+		atomic_t tgq;
+		atomic_t pt;
+		atomic_t ct;
+		atomic_t ac;
+		atomic_t md;
+	} stats;
+
+	struct dentry *domain_dir;
+	struct dentry *eq_dir;
+	struct dentry *cq_dir;
+	struct dentry *pt_dir;
+	struct dentry *ct_dir;
+	struct dentry *ac_dir;
+
+	/* Pending LNI cleanups */
+	struct list_head lni_cleanups_list;
+	struct delayed_work lni_cleanups_work;
+	struct mutex lni_cleanups_lock;
+
+	/* Number of IRQs available to that device. */
+	unsigned int num_irqs;
+
+	unsigned int atu_cq_vec;
+	unsigned int atu_pri_vec;
+
+	/* Completion IRQs */
+	unsigned int num_comp_irqs;
+	struct cass_irq *comp_irqs;
+
+	/* RMU table allocation bitmap. Each entry in the RMU table
+	 * contains a different VNI.
+	 */
+	struct ida rmu_index_table;
+	struct ida domain_table;
+	spinlock_t rmu_lock;
+	struct rb_root rmu_tree;
+
+	/* Physical PID leases and per-profile use counts are protected by
+	 * pid_pool_lock. domain_lock protects unique VNI+PID domain identities.
+	 */
+	spinlock_t pid_pool_lock;
+	spinlock_t domain_lock;
+	struct rb_root domain_tree;
+	DECLARE_BITMAP(leased_pids, 1 << MAX_PID_BITS);
+	u32 pid_usecount[1 << MAX_PID_BITS];
+
+	/* EQ allocation bitmap */
+	spinlock_t eq_shadow_lock;
+	struct ida eq_index_table;
+	struct mutex init_eq_hw_state;
+
+	/* Which EQ is registered with the PCT block. Protected by
+	 * init_eq_hw_state.
+	 */
+	unsigned int pct_eq_n;
+
+	/* Communication Profile Table (CPT) and containers. The table,
+	 * cpt_index_table, resides on the adapter and is used to reserve
+	 * one of the hardware resource. The RB tree, cp_cont_tree, is used to
+	 * store the allocated communication containers. Each container is
+	 * identified by a VNI and traffic class. Each container may contain
+	 * multiple communication profiles which map to an index in the CPT.
+	 * The lock, cp_lock, protects the tree.
+	 */
+	struct ida cp_table;
+	struct mutex cp_lock;
+
+	/* Configured traffic classes; entries can be added and removed at run time. */
+	struct list_head tc_list;
+	struct mutex tc_lock;	/* protects tc_list */
+
+	/* Next resource to be used for traffic class configuration. */
+	unsigned int next_oxe_bc;
+	unsigned int next_oxe_branch_bucket;
+	unsigned int next_oxe_leaf_bucket;
+	unsigned int next_cq_tc;
+	unsigned int next_cq_ocuset;
+	unsigned int next_cq_ocu;
+	unsigned int next_ixe_wrq;
+	unsigned int next_ixe_fq;
+	unsigned int next_lpe_fq;
+
+	u8 tsc_fill_qty;
+	struct qos_profile qos;
+	struct kobject tcs_kobj;
+
+	/* CQ allocation bitmaps. */
+	spinlock_t cq_shadow_lock;
+	struct mutex cq_init_lock;
+	struct ida cq_table;
+
+	/* CT allocations */
+	struct mutex ct_init_lock;
+
+	/* Multicast uniqueness table */
+	struct ida multicast_table;
+
+	/* PT allocation bitmap */
+	spinlock_t lpe_shadow_lock;
+	struct ida pte_table;
+	struct ida pt_index_table;
+	unsigned int dmac_pt_id;
+	struct mutex mst_table_lock;
+	struct mutex pte_transition_sm_lock;
+	union c_mst_dbg_mst_table *mst_entries;
+	dma_addr_t mst_entries_dma_addr;
+	atomic_t plec_count;
+
+	/* LE pool allocation bitmap */
+	struct ida le_pool_ids[C_PE_COUNT];
+	struct ida tle_pool_ids;
+
+	/* Ethernet Set List */
+	struct ida set_list_table;
+	struct cxi_tx_profile eth_tx_profile;
+
+	/* RMU Ethernet resource management */
+	struct idr rmu_eth_idr;
+
+	/* Protects all RMU Eth resources */
+	struct mutex rmu_eth_lock;
+
+	/* Protects C_RMU_CFG_PORTAL_LIST_X/Y. */
+	spinlock_t rmu_portal_list_lock;
+
+	/* RGID management */
+	struct xarray rgid_array;
+	refcount_t rgids_refcount;
+	struct ida lni_table;
+
+	/* ATU info */
+	void *oxe_dummy_addr;
+	dma_addr_t oxe_dummy_dma_addr;
+	struct cass_ac *cac_table[C_ATU_CFG_AC_TABLE_ENTRIES];
+	/* Protects AC publication and acquisition of reader pins. */
+	spinlock_t cac_table_lock;
+	struct ida atu_table;
+	struct cass_atu_cq atu_cq;
+	spinlock_t atu_shadow_lock;
+	atomic_t atu_error_inject;
+	atomic_t atu_odp_requests;
+	atomic_t atu_odp_fails;
+	atomic_t atu_prb_expired;
+	char odp_pri_int_name[CASS_MAX_IRQ_NAME];
+	int pri_rd_ptr;
+	struct work_struct pri_work;
+	struct workqueue_struct *pri_wq;
+	struct c_page_request_entry *page_request_table;
+	dma_addr_t prt_dma_addr;
+	struct cxi_reg_err_flg atu_err;
+	struct work_struct prb_work;
+	struct workqueue_struct *prb_wq;
+	struct mutex odpq_mutex;
+	struct list_head mm_lni_list;
+	struct mutex mm_mutex;
+	struct ida md_index_table;
+	bool ac_filter_disabled;
+	/* Flag to indicate that the IOMMU callback is in place to support
+	 * C1 ODP.
+	 */
+	bool ats_c1_odp_enable;
+
+	/* Number of invalidations due to memory deregistration */
+	atomic_t dcpl_md_clear_inval;
+	/* Number of invalidations due to the mmu notifier for NTA mode */
+	atomic_t dcpl_nta_mn_inval;
+	/* Number of invalidations due to the mmu notifier (via IOMMU callback)
+	 * for ATS mode
+	 */
+	atomic_t dcpl_ats_mn_inval;
+	/* Completion wait count */
+	atomic_t dcpl_comp_wait;
+	/* ODP decoupling entered - Completion wait has timed out */
+	atomic_t dcpl_entered;
+	/* ixe_epoch_x_cntr was 0 */
+	atomic_t dcpl_ixe_cntr_0;
+	/* ixe_epoch_x_cntr was not initially 0 but it decremented to 0 */
+	atomic_t dcpl_ixe_cntr_dec_0;
+	/* ee_epoch_x_cntr count of entering dec loop */
+	atomic_t dcpl_ee_cntr_dec_0;
+	/* ee_epoch_x_cntr is stuck */
+	atomic_t dcpl_ee_cntr_stuck;
+	/* oxe_epoch_x_cntr count of entering dec loop */
+	atomic_t dcpl_oxe_cntr_dec_0;
+	/* oxe_epoch_x_cntr is stuck */
+	atomic_t dcpl_oxe_cntr_stuck;
+	/* ixe_epoch_x_cntr is stuck after hw decoupling enabled */
+	atomic_t dcpl_ixe_cntr_stuck;
+	/* decouple process successful after hw decoupling enabled */
+	atomic_t dcpl_success;
+	/* ib_epoch_x_cntr decremented to 0 in step 6.2 */
+	atomic_t dcpl_ibw_cntr_dec_0_62;
+	/* ib_epoch_x_cntr count of dec loops in step 6.2 */
+	atomic_t dcpl_ibw_cntr_dec_0_62_count;
+	/* ib_epoch_x_cntr decremented to 0 in step 6.4 */
+	atomic_t dcpl_ibw_cntr_dec_0_64;
+	/* ib_epoch_x_cntr count of dec loops in step 6.4 */
+	atomic_t dcpl_ibw_cntr_dec_0_64_count;
+	/* ib_epoch_x_cntr is stuck */
+	atomic_t dcpl_step7;
+	/* IBW is active and ib_epoch_x_cntr is stuck */
+	atomic_t dcpl_ibw_active_stuck;
+	/* How long waiting to get the lock */
+	atomic_t dcpl_ibw_idle_wait;
+	/* IBW counter is inside of trylock loop */
+	atomic_t dcpl_ibw_cntr_is_0;
+	/* Decouple issued inbound wait */
+	atomic_t dcpl_ibw_issued;
+	/* Maximum time spent in decoupling */
+	ktime_t dcpl_max_time;
+	/* Histogram of time spent in decoupling */
+	#define DBINS 12
+	#define FIRST_BIN (64 * 1024)
+	int dcpl_time[DBINS];
+	/* Maximum time spent finding an MD */
+	ktime_t pri_max_md_time;
+	/* Histogram of time spent in finding MD during a fault */
+	#define MDBINS 8
+	#define FIRST_MDBIN (8 * 1024)
+	int pri_md_time[MDBINS];
+	/* Maximum time spent servicing a fault */
+	ktime_t pri_max_fault_time;
+	/* Histogram of time spent servicing a fault */
+	#define FBINS 7
+	#define FIRST_FBIN (8 * 1024)
+	int pri_fault_time[FBINS];
+
+	/* Counting event bitmap. */
+	struct ida ct_table;
+
+	/* Precision Time Protocol Clock */
+	struct ptp_clock_info ptp_info;
+	struct ptp_clock *ptp_clock;
+	spinlock_t rtc_lock;
+
+	/* MST locks. */
+	spinlock_t mst_match_done_lock;
+	struct mutex mst_update_lock;
+
+	/* Micro-controller */
+	bool uc_present;
+	int uc_platform;	/* CUC_BOARD_TYPE_xxx */
+	struct cxi_reg_err_flg uc_err;
+	struct completion uc_attention0_comp;
+	struct cuc_pkt uc_req;
+	struct cuc_pkt uc_resp;
+	struct workqueue_struct *uc_attn1_wq;
+	struct work_struct uc_attn1_work;
+	struct mutex uc_mbox_mutex;
+	struct i2c_adapter uc_i2c;
+	bool uc_i2c_locked;
+	s8 uc_nic;		/* NIC index from uC point of view */
+	u8 default_mac_addr[ETH_ALEN];
+	struct kobject uc_kobj;
+	char *fw_versions[7];	/* indexed by enum casuc_fw_target */
+	bool fru_info_valid;	/* FRU query was successful; do not query again. */
+	char *fru_info[PLDM_FRU_FIELD_VENDOR_IANA + 1];
+	struct idr pldm_sensors;
+	unsigned int pldm_sensors_count;
+	struct kobject *pldm_sensors_kobj;
+	unsigned int uc_dmac_id;
+	struct kobject port_kobj;
+	struct kobject port_num_kobj;
+	bool qsfp_beacon_active;
+	bool qsfp_over_temp;
+	bool qsfp_bad;
+
+	/* HW mon */
+	struct {
+		struct device *dev;
+		struct hwmon_chip_info chip_info;
+		const struct hwmon_channel_info *all_types[hwmon_max];
+
+		struct hwmon_channel_info info[5];
+
+		/* Enough room for 30 sensors. */
+		u32 config[CASS_MAX_SENSORS + hwmon_max];
+	} hwmon;
+
+	/* RX and TX Profiles */
+	struct cxi_rxtx_profile_list rx_profile_list;
+	struct cxi_rxtx_profile_list tx_profile_list;
+	struct mutex tx_profile_get_lock;
+	struct mutex rx_profile_get_lock;
+
+	/* Services */
+	struct mutex svc_lock;
+	struct idr svc_ids;
+	struct dentry *svc_debug;
+	struct list_head svc_list;
+	unsigned int svc_count;
+	struct cxi_resource_use resource_use[CXI_RESOURCE_MAX];
+	spinlock_t rgrp_lock;
+
+	/* Resource Groups */
+	struct cxi_rgroup_list rgroup_list;
+
+	/* HNI */
+	struct cxi_reg_err_flg hni_pause_err;
+	struct work_struct pause_timeout_work;
+	struct cxi_reg_err_flg hni_uncor_err;
+	struct cxi_reg_err_flg hni_pml_uncor_err;
+
+	/* IXE */
+	struct cxi_reg_err_flg ixe_pbuf_rd_err;
+
+	/* PML */
+	struct cxi_reg_err_flg pml_err;
+	struct {
+		spinlock_t lock;
+		enum cass_phy_state state;
+		struct delayed_work state_queue;
+		/* protected by lock; bumped by every non-worker transition */
+		unsigned int generation;
+		bool stopped;
+	} phy;
+
+	u32 max_eth_rxsize;
+
+	/* Ethernet TX timestamp shift. 0 to 3, stays at zero but
+	 * could become a kernel parameter.
+	 */
+	int tx_timestamp_shift;
+
+	/* base link support */
+	struct sbl_inst *sbl;           /* slingshot base-link instance */
+	atomic_t *sbl_counters;         /* sbl link counters */
+	bool link_config_dirty;         /* link config != running config */
+	spinlock_t sbl_state_lock;      /* link state lock */
+	struct cass_port *port;         /* port db array */
+	const struct cxi_link_ops *link_ops;
+
+	/* SBus config */
+	struct mutex sbus_mutex;      /* serialise SBus config accesses */
+
+	/* Rendezvous get control config */
+	struct mutex get_ctrl_mutex;  /* serialize writes from sysfs */
+
+	/* AMO remap sysfs mutex. */
+	struct mutex amo_remap_to_pcie_fadd_mutex;
+
+	/* sysfs support */
+	struct kobject properties_kobj;
+	struct kobject fru_kobj;
+	struct kobject link_restarts_kobj;
+
+	/* debugfs support */
+	struct attribute_group  port_group;
+	struct attribute        **port_attrs;
+	struct device_attribute *port_dev_attrs;
+	struct device_attribute port_attr;
+
+	/* Current copy of the QSFP eeprom, with its length. If length
+	 * is 0, the data is not valid.
+	 */
+	struct mutex qsfp_eeprom_lock;
+	u8 qsfp_eeprom_page0[ETH_MODULE_SFF_8436_LEN];
+	u8 qsfp_eeprom_page1[ETH_MODULE_SFF_8436_LEN];
+	u8 qsfp_format;
+	unsigned int qsfp_eeprom_page_len;
+
+	/*
+	 * telemetry for cassini
+	 */
+	struct {
+		struct telem_info	*info;
+	} telemetry;
+
+	/*
+	 * dma controller
+	 */
+	struct {
+		struct mutex			lock;
+		struct completion		irupt;
+		char				irupt_name[CASS_MAX_IRQ_NAME];
+		struct c_pi_dmac_cdesc		*cpl_desc;
+		dma_addr_t                      cpl_desc_dma_addr;
+		struct dmac_desc_set		*desc_sets;
+		unsigned long			*desc_map;
+	} dmac;
+
+	/* sl */
+	struct cass_sl_dev sl;
+
+	/*auxiliary device*/
+	void *cxi_adev;
+	/*
+	 * Protects the publication of cxi_adev and covers every use of it, so
+	 * the auxiliary device cannot be freed while a NID change is being
+	 * sent to it.
+	 */
+	struct mutex cxi_adev_lock;
+};
+
+static inline struct cass_dev *cxi_to_cass_dev(struct cxi_dev *dev)
+{
+	return container_of(dev, struct cass_dev, cdev);
+}
+
+/* Communication profile. */
+struct cass_cp {
+	struct cass_dev *hw;
+	struct cxi_tx_profile *tx_profile;
+
+	/* VNI/PCP and TC identify a unique communication profile. */
+	unsigned int vni_pcp;
+	enum cxi_traffic_class tc;
+	enum cxi_traffic_class_type tc_type;
+
+	/* Communication profile table ID. */
+	unsigned int id;
+
+	/* CP list ID. */
+	unsigned int list_id;
+
+	/* Number of users of this profile. */
+	refcount_t ref;
+};
+
+struct pldm_sensor {
+	struct cass_dev *hw;
+	unsigned int id;
+	struct kobject kobj;
+	char name[AUX_NAME_MAX];
+	struct numeric_sensor_pdr num;
+
+	/* Mapping when inserted into hwmon */
+	struct {
+		enum hwmon_sensor_types type;
+		int channel;
+		int multiplier;
+	} hwmon;
+};
+
+/* From struct getsensorreading_rsp */
+struct pldm_sensor_reading {
+	u8 operational_state;
+	u8 present_state;
+	u8 previous_state;
+	s64 present_reading;
+};
+
+/* Read one of the fields from a PLDM declaration */
+#define get_pldm_value(sensor, field) ({				\
+	const int s = sensor->num.sensor_data_size;			\
+	s64 value;							\
+									\
+	if (s == PLDM_DATA_SIZE_UINT8 || s == PLDM_DATA_SIZE_SINT8)	\
+		value = sensor->num.ssd.ssd8.field;			\
+	else if (s == PLDM_DATA_SIZE_UINT16 ||				\
+		 s == PLDM_DATA_SIZE_SINT16)				\
+		value = sensor->num.ssd.ssd16.field;			\
+	else								\
+		value = sensor->num.ssd.ssd32.field;			\
+									\
+	value;								\
+})
+
+static inline void __iomem *cass_csr(struct cass_dev *hw, u64 offset)
+{
+	BUG_ON(offset > C_MEMORG_CSR_SIZE);
+	return hw->regs + offset;
+}
+
+/**
+ * cass_clear() - Writes zeroes to a CSR
+ *
+ * @hw: the device
+ * @offset: offset of the CSR in the region
+ * @len: length to clear, in bytes. Must be a multiple of 8.
+ */
+static inline void cass_clear(struct cass_dev *hw, u64 offset, size_t len)
+{
+	void __iomem *base = cass_csr(hw, offset);
+	int i;
+
+	len /= sizeof(u64);
+
+	for (i = 0; i < len; i++, base += sizeof(u64))
+		writeq(0, base);
+}
+
+/* must come after cass_read/write/clear definitions. */
+#include <linux/hpe/cxi/libcassini.h>
+
+static inline bool cass_version(const struct cass_dev *hw,
+				enum cassini_version version)
+{
+	return cassini_version(&hw->cdev.prop, version);
+}
+
+static inline void cass_cond_lock(struct mutex *lock, bool need_lock)
+{
+	if (need_lock)
+		mutex_lock(lock);
+}
+
+static inline void cass_cond_unlock(struct mutex *lock, bool need_lock)
+{
+	if (need_lock)
+		mutex_unlock(lock);
+}
+
+static inline void cass_cp_lock(struct cass_dev *hw)
+{
+	mutex_lock(&hw->cp_lock);
+}
+
+static inline void cass_cp_unlock(struct cass_dev *hw)
+{
+	mutex_unlock(&hw->cp_lock);
+}
+
+static const char * const cxi_tc_strs[] = {
+	[CXI_TC_DEDICATED_ACCESS]       = "DEDICATED_ACCESS",
+	[CXI_TC_LOW_LATENCY]            = "LOW_LATENCY",
+	[CXI_TC_BULK_DATA]              = "BULK_DATA",
+	[CXI_TC_BEST_EFFORT]            = "BEST_EFFORT",
+	[CXI_TC_ETH]                    = "ETH",
+};
+
+static const char * const cxi_tc_type_strs[] = {
+	[CXI_TC_TYPE_DEFAULT] = "DEFAULT",
+	[CXI_TC_TYPE_HRP] = "HRP",
+	[CXI_TC_TYPE_RESTRICTED] = "RESTRICTED",
+	[CXI_TC_TYPE_COLL_LEAF] = "COLL_LEAF",
+};
+
+static inline const char *cxi_tc_to_str(enum cxi_traffic_class tc)
+{
+	if (tc >= CXI_TC_DEDICATED_ACCESS && tc < CXI_TC_MAX)
+		return cxi_tc_strs[tc];
+	return "(invalid)";
+}
+
+static inline
+const char *cxi_tc_type_to_str(enum cxi_traffic_class_type tc_type)
+{
+	if (tc_type >= CXI_TC_TYPE_DEFAULT && tc_type < CXI_TC_TYPE_MAX)
+		return cxi_tc_type_strs[tc_type];
+	return "(invalid)";
+}
+
+static const char * const cxi_rsrc_type_strs[] = {
+	[CXI_RSRC_TYPE_PTE] = "PTEs",
+	[CXI_RSRC_TYPE_TXQ] = "TXQs",
+	[CXI_RSRC_TYPE_TGQ] = "TGQs",
+	[CXI_RSRC_TYPE_EQ] = "EQs",
+	[CXI_RSRC_TYPE_CT] = "CTs",
+	[CXI_RSRC_TYPE_LE] = "LEs",
+	[CXI_RSRC_TYPE_TLE] = "TLEs",
+	[CXI_RSRC_TYPE_AC] = "ACs",
+};
+
+static inline
+const char *cxi_rsrc_type_to_str(enum cxi_rsrc_type rsrc_type)
+{
+	if (rsrc_type >= CXI_RSRC_TYPE_PTE && rsrc_type < CXI_RSRC_TYPE_MAX)
+		return cxi_rsrc_type_strs[rsrc_type];
+	return "(invalid)";
+}
+
+int cass_ixe_set_amo_remap_to_pcie_fadd(struct cass_dev *hw, int amo_remap);
+void cass_pte_init(struct cass_dev *hw);
+void cass_pte_set_get_ctrl(struct cass_dev *hw);
+int cass_atu_init(struct cass_dev *hw);
+void cass_atu_fini(struct cass_dev *hw);
+void cass_acs_disable(struct cxi_lni_priv *lni_priv);
+void cass_acs_free(struct cxi_lni_priv *lni_priv);
+int cass_ac_phys_alloc(struct cass_dev *hw, bool vf_en, int vf_num);
+void cass_ac_phys_free(struct cass_dev *hw, int acid);
+
+void cass_cq_init(struct cass_dev *hw);
+void cass_ee_init(struct cass_dev *hw);
+int cass_svc_init(struct cass_dev *hw);
+void cass_svc_fini(struct cass_dev *hw);
+int cass_tc_find(struct cass_dev *hw, enum cxi_traffic_class tc,
+		 enum cxi_traffic_class_type tc_type, u8 ethernet_pcp,
+		 struct cass_tc_cfg *tc_cfg);
+int cass_tc_init(struct cass_dev *hw);
+void cass_tc_fini(struct cass_dev *hw);
+void traffic_shaping_cfg(struct cass_dev *hw);
+void cass_tc_set_tx_pause_all(struct cass_dev *hw, bool enable);
+void cass_tc_set_rx_pause_all(struct cass_dev *hw, bool enable);
+void cass_clear_cps(struct cxi_tx_profile *tx_profile);
+
+static inline bool is_vni_valid(unsigned int vni)
+{
+	/* A VNI is 16 bits and VNI 0 is invalid */
+	return vni && !(vni & ~0xffff);
+}
+
+int register_error_handlers(struct cass_dev *hw);
+void deregister_error_handlers(struct cass_dev *hw);
+int cass_sriov_configure(struct pci_dev *pdev, int num_vfs);
+int cass_vf_init(struct cass_dev *hw);
+void cass_vf_fini(struct cass_dev *hw);
+
+#define ATU_CFG_AC_TABLE_MB_SHIFT 15
+/* Based on note in MEM_SIZE description - MEM_BASE must be aligned to
+ * 8x the largest configured page size.
+ * Derivative 1 Page Size as described in Table 364 - Page Table Sizes
+ */
+#define ATU_IOVA_BASE_SHIFT(ac) (12 + ac.base_pg_size + ac.pg_table_size + 3)
+#define ATU_IOVA_MASK(ac) (~MASK(ATU_IOVA_BASE_SHIFT(ac)))
+/* Maximum addressable memory range (56 bits) of Cassini. */
+#define ATU_MAX_ADDR_MEM_BITS 56
+#define ATU_LAC_SHIFT (ATU_MAX_ADDR_MEM_BITS - 3)
+#define ATU_VA_MASK(va) (va & MASK(ATU_MAX_ADDR_MEM_BITS))
+#define IS_DEVICE_MEM(md_priv) (md_priv->flags & CXI_MAP_DEVICE)
+
+extern struct mutex dev_list_mutex;
+extern int more_debug;
+extern struct genl_family cxierr_genl_family;
+extern struct cass_p2p_ops p2p_ops;
+extern bool odp_sw_decouple;
+extern bool ats_c1_override;
+
+/* Add the LAC to the top 3 bits of the IOVA so they are unique */
+static inline u64 cass_iova_base(struct cass_ac *cac)
+{
+	u64 iova_base;
+
+	iova_base = (u64)get_random_u32() << ATU_IOVA_BASE_SHIFT(cac->cfg_ac);
+	iova_base &= ~(0x7UL << ATU_LAC_SHIFT);
+	iova_base |= (u64)cac->ac.lac << ATU_LAC_SHIFT;
+
+	return iova_base;
+}
+
+void __iomem *cass_csr(struct cass_dev *hw, u64 offset);
+int cass_nta_cq_init(struct cass_dev *hw);
+void cass_nta_cq_fini(struct cass_dev *hw);
+int cass_nta_pri_init(struct cass_dev *hw);
+int cass_sts_idle(struct sts_idle *sidle);
+void cass_nta_pri_fini(struct cass_dev *hw);
+int cass_inbound_wait(struct cass_dev *hw, bool wait_for_response);
+u64 cass_nta_iova_alloc(struct cass_ac *cac, const struct ac_map_opts *m_opts);
+void cass_nta_iova_fini(struct cass_ac *cac);
+int cass_nta_iova_init(struct cass_ac *cac, size_t va_len);
+void cass_nta_free(struct cass_dev *hw, struct cass_nta *nta);
+void cass_l1_tables_free(struct cass_dev *hw, struct cass_nta *nta);
+void cass_clear_range(const struct cxi_md_priv *md_priv, u64 iova, u64 len);
+void cass_md_clear(struct cxi_md_priv *md_prv, bool inval, bool need_lock);
+void cass_dma_unmap_pages(struct cxi_md_priv *md_priv);
+int cass_dma_addr_mirror(dma_addr_t dma_addr, u64 iova, struct cass_ac *cac,
+			 u32 flags, bool is_huge_page, bool *invalidate);
+int cass_mirror_fault(const struct ac_map_opts *m_opts, u64 *pfns, int count,
+		      uintptr_t addr, size_t len);
+int cass_mirror_odp(const struct ac_map_opts *m_opts, struct cass_ac *cac,
+		    int npfns, u64 addr);
+int cass_mirror_device(struct cxi_md_priv *md_priv,
+		       const struct ac_map_opts *m_opts);
+int cass_mirror_range(struct cxi_md_priv *md_priv, struct ac_map_opts *m_opts);
+void cass_invalidate_range(const struct cass_ac *cac, u64 iova,
+			   size_t length);
+int cass_nta_init(struct cxi_lni_priv *lni_priv, struct ac_map_opts *m_opts,
+		  struct cass_ac *cac);
+int cass_nta_mirror_sgt(struct cxi_md_priv *md_priv, bool need_lock);
+int cass_nta_mirror_kern(struct cxi_md_priv *md_priv,
+			 const struct iov_iter *iter, bool need_lock);
+int cass_pin(const struct cass_ac *cac, struct page **pages, int npages,
+	     u64 addr, bool write);
+int cass_mirror_hp(const struct ac_map_opts *m_opts, struct cxi_md_priv *md_priv);
+int cass_pfns_mirror(struct cxi_md_priv *md_priv, const struct ac_map_opts *m_opts,
+		     u64 *pfns, int npfns, bool is_huge_page);
+int cass_vma_write_flag(struct mm_struct *mm, ulong start, ulong end,
+			u32 flags);
+int cass_pin_mirror(struct cxi_md_priv *md_priv, struct ac_map_opts *m_opts);
+void cass_notifier_cleanup(struct cxi_md_priv *md_priv);
+int cass_odp_decouple(struct cass_dev *hw);
+int cass_odp_supported(struct cass_dev *hw, u32 flags);
+int cass_mmu_notifier_insert(struct cxi_md_priv *md_priv,
+			     const struct ac_map_opts *m_opts);
+void cass_device_hugepage_size(int contig_cnt, struct ac_map_opts *m_opts);
+void cass_align_start_len(struct ac_map_opts *m_opts, uintptr_t va, size_t len,
+			  int align_shift);
+int cass_cpu_page_size(struct cass_dev *hw, struct ac_map_opts *m_opts,
+		       struct mm_struct *mm, uintptr_t va,
+		       const struct cxi_md_hints *hints, int *align_shift);
+int cass_ptp_init(struct cass_dev *hw);
+void cass_ptp_fini(struct cass_dev *hw);
+int cass_ats_init(struct cxi_lni_priv *lni_priv, struct ac_map_opts *m_opts,
+		  struct cass_ac *cac);
+int cass_ats_md_init(struct cxi_md_priv *md_priv, const struct ac_map_opts *m_opts);
+void cass_amd_iommu_inval_cb_init(struct pci_dev *pdev);
+void cass_unbind_ac(struct cass_dev *hw, const struct cass_ac *cac);
+void cass_iommu_init(struct cass_dev *hw);
+void cass_iommu_fini(struct cass_dev *hw);
+
+void cass_hni_init(struct cass_dev *hw);
+void cass_hni_fini(struct cass_dev *hw);
+int cass_cable_scan(struct cass_dev *hw);
+void update_oxe_link_up(struct cass_dev *hw);
+void update_hni_link_up(struct cass_dev *hw);
+int cass_create_tc_sysfs(struct cass_dev *hw);
+void cass_destroy_tc_sysfs(struct cass_dev *hw);
+
+int cass_ixe_init(struct cass_dev *hw);
+void cass_ixe_fini(struct cass_dev *hw);
+
+int cass_register_uc(struct cass_dev *hw);
+void cass_unregister_uc(struct cass_dev *hw);
+int cass_register_port(struct cass_dev *hw);
+void cass_unregister_port(struct cass_dev *hw);
+int uc_cmd_get_nic_id(struct cass_dev *hw);
+int uc_cmd_get_mac(struct cass_dev *hw);
+int uc_cmd_get_fru(struct cass_dev *hw);
+void uc_cmd_update_ier(struct cass_dev *hw, u32 set_bits, u32 clear_bits);
+int uc_cmd_qsfp_write(struct cass_dev *hw, u8 page, u8 addr,
+		      const u8 *data, size_t data_len);
+void uc_prepare_comm(struct cass_dev *hw);
+int uc_wait_for_response(struct cass_dev *hw);
+int cxi_get_qsfp_data(struct cxi_dev *cdev, u32 offset,
+		      u32 len, u32 page, u8 *data);
+void uc_cmd_set_link_leds(struct cass_dev *hw, enum casuc_led_states led_state);
+int update_sensor(struct pldm_sensor *sensor,
+		  struct pldm_sensor_reading *result);
+
+void finalize_pt_cleanups(struct cxi_lni_priv *lni, bool force);
+void finalize_cq_cleanups(struct cxi_lni_priv *lni, bool force);
+void finalize_eq_cleanups(struct cxi_lni_priv *lni);
+void finalize_ct_cleanups(struct cxi_lni_priv *lni);
+bool lni_cleanups(struct cass_dev *hw, bool force);
+void lni_cleanups_work(struct work_struct *work);
+void cass_rgid_init(struct cass_dev *hw);
+void cass_rgid_fini(struct cass_dev *hw);
+int cass_lac_get(struct cass_dev *hw, int id);
+void cass_lac_put(struct cass_dev *hw, int id, int lac);
+int cass_rgid_get(struct cass_dev *hw, struct cxi_rgroup *rgroup);
+void cass_rgid_put(struct cass_dev *hw, int id);
+int cass_lcid_get(struct cass_dev *hw, struct cxi_cp_priv *cp_priv, int rgid,
+		  enum cxi_trig_cp cp_type);
+void cass_lcid_put(struct cass_dev *hw, int rgid, int lcid);
+struct cxi_cp_priv *cass_cp_find(struct cass_dev *hw, int rgid, int lcid);
+struct cxi_cp_priv *cass_cp_rgid_find(struct cass_dev *hw,
+				      struct cxi_lni_priv *lni_priv,
+				      unsigned int vni_pcp, unsigned int tc,
+				      enum cxi_traffic_class_type tc_type,
+				      enum cxi_trig_cp cp_type);
+
+int get_dma_addr_if_contig(struct cass_dev *hw, void *addr, size_t len,
+			   enum dma_data_direction dir, struct page ***pages,
+			   dma_addr_t *dma_addr);
+
+int cass_telem_init(struct cass_dev *hw);
+void cass_telem_fini(struct cass_dev *hw);
+
+int create_sysfs_properties(struct cass_dev *hw);
+void destroy_sysfs_properties(struct cass_dev *hw);
+
+void cass_phy_init(struct cass_dev *hw);
+void cass_phy_start(struct cass_dev *hw, bool force_reconfig);
+void cass_phy_stop(struct cass_dev *hw, bool block);
+void cass_phy_bounce(struct cass_dev *hw);
+void cass_phy_trigger_machine(struct cass_dev *hw);
+void cass_phy_link_up(struct cass_dev *hw);
+void cass_phy_link_down(struct cass_dev *hw);
+
+extern unsigned int pe_total_les;
+void cass_cfg_le_pools(struct cass_dev *hw, int pool_id, int pe,
+		       const struct cxi_limits *les, bool release);
+void cass_cfg_tle_pool(struct cass_dev *hw, int pool_id,
+		       const struct cxi_limits *tles, bool release);
+void cass_tle_init(struct cass_dev *hw);
+
+int cass_dmac_init(struct cass_dev *hw);
+void cass_dmac_fini(struct cass_dev *hw);
+
+int cass_irq_init(struct cass_dev *hw);
+void cass_irq_fini(struct cass_dev *hw);
+struct cass_irq *cass_comp_irq_attach(struct cass_dev *hw,
+				      const struct cpumask *mask,
+				      struct notifier_block *nb);
+void cass_comp_irq_detach(struct cass_dev *hw, struct cass_irq *irq,
+			  struct notifier_block *nb);
+
+void cxi_register_hw_errors(struct cass_dev *hw,
+			    struct cxi_reg_err_flg *reg_err_flg);
+void cxi_unregister_hw_errors(struct cass_dev *hw,
+			      struct cxi_reg_err_flg *reg_err_flg);
+void cxi_enable_hw_errors(struct cass_dev *hw, unsigned int irq, bool is_ext,
+			  const unsigned long *bitmask);
+void cxi_disable_hw_errors(struct cass_dev *hw, unsigned int irq, bool is_ext,
+			   const unsigned long *bitmask);
+
+bool cass_phy_is_headshell_removed(struct cass_dev *hw);
+void cass_phy_set_state(enum cass_phy_state state, struct cass_dev *hw);
+
+void start_pcie_monitoring(struct cass_dev *hw);
+void stop_pcie_monitoring(struct cass_dev *hw);
+void cass_set_outstanding_limit(struct cass_dev *hw);
+
+void cass_disable_device(struct pci_dev *pdev, const char *reason);
+extern bool disable_on_error;
+void uncor_cb(struct cass_dev *hw, unsigned int irq, bool is_ext,
+	      unsigned int bitn);
+
+#endif	/* _CASS_CORE_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_dev_info.c b/drivers/net/ethernet/hpe/ss1/cass_dev_info.c
new file mode 100644
index 000000000000..15f3e49fe380
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_dev_info.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+#include "cass_core.h"
+
+int cxi_dev_info_get(struct cxi_dev *dev,
+		     struct cxi_dev_info_use *devinfo)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	int speed;
+	int state;
+
+	devinfo->nid = hw->cdev.prop.nid;
+	devinfo->pid_bits = hw->cdev.prop.pid_bits;
+	devinfo->pid_count = hw->cdev.prop.pid_count;
+	devinfo->pid_granule = hw->cdev.prop.pid_granule;
+	devinfo->min_free_shift = hw->cdev.prop.min_free_shift;
+	devinfo->rdzv_get_idx = hw->cdev.prop.rdzv_get_idx;
+	devinfo->device_rev = hw->cdev.prop.device_rev;
+	devinfo->device_proto = hw->cdev.prop.device_proto;
+	devinfo->device_platform = hw->cdev.prop.device_platform;
+	devinfo->vendor_id = hw->rev.vendor_id;
+	devinfo->device_id = hw->rev.device_id;
+	devinfo->pct_eq = hw->pct_eq_n;
+	devinfo->uc_nic = hw->uc_nic;
+	devinfo->link_mtu = C_MAX_HPC_MTU;
+	devinfo->num_ptes = hw->cdev.prop.rsrcs.ptes.max;
+	devinfo->num_txqs = hw->cdev.prop.rsrcs.txqs.max;
+	devinfo->num_tgqs = hw->cdev.prop.rsrcs.tgqs.max;
+	devinfo->num_eqs = hw->cdev.prop.rsrcs.eqs.max;
+	devinfo->num_cts = hw->cdev.prop.rsrcs.cts.max;
+	devinfo->num_acs = hw->cdev.prop.rsrcs.acs.max;
+	devinfo->num_tles = hw->cdev.prop.rsrcs.tles.max;
+	devinfo->num_les = hw->cdev.prop.rsrcs.les.max;
+	devinfo->cassini_version = hw->cdev.prop.cassini_version;
+	devinfo->system_type_identifier = hw->cdev.system_type_identifier;
+
+	if (hw->port)
+		cass_sbl_link_mode_to_speed(hw->port->lattr.bl.link_mode, &speed);
+	else
+		speed = 0;
+	devinfo->link_speed = speed;
+
+	state = hw->phy.state == CASS_PHY_RUNNING;
+	devinfo->link_state = state;
+
+	if (!hw->fru_info_valid)
+		uc_cmd_get_fru(hw);
+
+	if (hw->fru_info[PLDM_FRU_FIELD_DESCRIPTION])
+		strscpy(devinfo->fru_description, hw->fru_info[PLDM_FRU_FIELD_DESCRIPTION],
+			sizeof(devinfo->fru_description) - 1);
+	else
+		strscpy(devinfo->fru_description, "Not Available",
+			sizeof(devinfo->fru_description) - 1);
+	devinfo->fru_description[sizeof(devinfo->fru_description) - 1] = '\0';
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_dev_info_get);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_irq.c b/drivers/net/ethernet/hpe/ss1/cass_irq.c
new file mode 100644
index 000000000000..c8ccd8912e8d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_irq.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021 Hewlett Packard Enterprise Development LP */
+
+/* Cassini interrupt management */
+
+#include <linux/interrupt.h>
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include "cass_core.h"
+
+/*
+ * cass_irq_int_handler() - Completion interrupt handler
+ */
+static irqreturn_t cass_irq_int_handler(int irq, void *nh)
+{
+	atomic_notifier_call_chain(nh, 0, NULL);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * cass_comp_irq_attach() - Attach to a completion interrupt
+ *
+ * @hw: Cassini device
+ * @mask: CPU mask used as an affinity hint to select IRQ vector
+ * @nb: Notifier block to be called on interrupt
+ *
+ * @return Interrupt is returned index on success. A negative errno is returned
+ * on error.
+ */
+struct cass_irq *cass_comp_irq_attach(struct cass_dev *hw,
+				      const struct cpumask *mask,
+				      struct notifier_block *nb)
+{
+	struct cass_irq *best_irq = NULL;
+	int cpu;
+	int rc;
+	int i;
+
+	for_each_cpu(cpu, mask) {
+		for (i = 0; i < hw->num_comp_irqs; i++) {
+			struct cass_irq *irq = &hw->comp_irqs[i];
+
+			if (!cpumask_test_cpu(cpu, &irq->mask))
+				continue;
+
+			if (atomic_read(&irq->refcount) == 0) {
+				best_irq = irq;
+				goto do_register;
+			}
+
+			if (!best_irq || atomic_read(&best_irq->refcount) >
+					 atomic_read(&irq->refcount))
+				best_irq = irq;
+		}
+	}
+
+	/* If no match, select a random IRQ vector. */
+	if (!best_irq) {
+		i = get_random_u32() % hw->num_comp_irqs;
+		best_irq = &hw->comp_irqs[i];
+	}
+
+do_register:
+	rc = atomic_notifier_chain_register(&best_irq->nh, nb);
+	if (rc < 0)
+		return ERR_PTR(rc);
+
+	mutex_lock(&best_irq->lock);
+
+	if (atomic_read(&best_irq->refcount) == 0) {
+		rc = request_irq(best_irq->vec, cass_irq_int_handler, 0,
+				 best_irq->irq_name, &best_irq->nh);
+		if (rc) {
+			mutex_unlock(&best_irq->lock);
+
+			cxidev_err(&hw->cdev, "request_irq failed at index %d: %d\n",
+				   i, rc);
+
+			atomic_notifier_chain_unregister(&best_irq->nh, nb);
+
+			return ERR_PTR(rc);
+		}
+
+		rc = irq_set_affinity_hint(best_irq->vec, &best_irq->mask);
+		if (rc)
+			cxidev_err(&hw->cdev, "irq_set_affinity_hint failed: %d\n",
+				   rc);
+	}
+
+	atomic_inc(&best_irq->refcount);
+
+	mutex_unlock(&best_irq->lock);
+
+	return best_irq;
+}
+
+/*
+ * cass_comp_irq_detach() - Detach from a completion interrupt
+ *
+ * @hw: Cassini device
+ * @irq: An interrupt returned from cass_comp_irq_attach()
+ * @nb: The notifier block to detach
+ */
+void cass_comp_irq_detach(struct cass_dev *hw, struct cass_irq *irq,
+			  struct notifier_block *nb)
+{
+	atomic_notifier_chain_unregister(&irq->nh, nb);
+
+	mutex_lock(&irq->lock);
+
+	if (atomic_dec_return(&irq->refcount) == 0) {
+		irq_set_affinity_hint(irq->vec, NULL);
+		free_irq(irq->vec, &irq->nh);
+	} else {
+		synchronize_irq(irq->vec);
+	}
+
+	mutex_unlock(&irq->lock);
+}
+
+/*
+ * cass_irq_init() - Initialize interrupts
+ */
+int cass_irq_init(struct cass_dev *hw)
+{
+	int rc;
+	int i;
+	int nvecs_res = 0;
+	int nvecs_min = 0;
+	int nvecs_max = 0;
+	struct cass_irq *irq;
+	struct pci_dev *pdev = hw->cdev.pdev;
+	int numa = dev_to_node(&pdev->dev);
+
+	if (!hw->with_vf_support)
+		return 0;
+
+	/* Initialize the MSI vectors table */
+	if (hw->cdev.is_physfn) {
+		/* Reserve the special IRQ numbers */
+		nvecs_res += C_FIRST_AVAIL_MSIX_INT;
+	} else {
+		/* Reserve IRQ number 0 for communicating with the PF. */
+		nvecs_res += 1;
+	}
+
+	/* Reserve IRQs for ATU */
+	hw->atu_cq_vec = nvecs_res++;
+	hw->atu_pri_vec = nvecs_res++;
+
+	/* Get as many IRQs as possible, but not too many as
+	 * request_irq() will eventually fail.
+	 */
+	nvecs_min = nvecs_res + 1;
+	if (HW_PLATFORM_NETSIM(hw))
+		nvecs_max = 128;
+	else
+		nvecs_max = pci_msix_vec_count(pdev);
+
+	/* Enable MSIX. */
+	rc = pci_alloc_irq_vectors(pdev, nvecs_min, nvecs_max, PCI_IRQ_MSIX);
+	if (rc < 0)
+		return rc;
+
+	hw->num_irqs = rc;
+	hw->num_comp_irqs = hw->num_irqs - nvecs_res;
+
+	/* Use remaining IRQs for completions */
+	hw->comp_irqs = kcalloc(hw->num_comp_irqs, sizeof(struct cass_irq),
+				GFP_KERNEL);
+	if (!hw->comp_irqs) {
+		rc = -ENOMEM;
+		goto free_irq_vecs;
+	}
+
+	for (i = 0; i < hw->num_comp_irqs; i++) {
+		irq = &hw->comp_irqs[i];
+		irq->idx = nvecs_res + i;
+		ATOMIC_INIT_NOTIFIER_HEAD(&irq->nh);
+		atomic_set(&irq->refcount, 0);
+		irq->vec = pci_irq_vector(pdev, irq->idx);
+		mutex_init(&irq->lock);
+
+		scnprintf(irq->irq_name, sizeof(irq->irq_name),
+			  "%s_comp%d", hw->cdev.name, i);
+		cpumask_set_cpu(cpumask_local_spread(i, numa), &irq->mask);
+	}
+
+	return 0;
+
+free_irq_vecs:
+	pci_free_irq_vectors(pdev);
+
+	return rc;
+}
+
+/*
+ * cass_irq_fini() - Finalize interrupts
+ */
+void cass_irq_fini(struct cass_dev *hw)
+{
+	if (!hw->with_vf_support)
+		return;
+
+	kfree(hw->comp_irqs);
+
+	pci_free_irq_vectors(hw->cdev.pdev);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_link.c b/drivers/net/ethernet/hpe/ss1/cass_link.c
new file mode 100644
index 000000000000..db2b3bc281c1
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_link.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/workqueue.h>
+#include <linux/delay.h>
+#include <linux/hpe/sbl/sbl.h>
+
+#include "cass_core.h"
+
+/*
+ * The link has asynchronously gone down
+ *
+ *   i.e. the fabric LSM has gone down, the base link has gone down or
+ *        the headshell/media removed
+ *
+ */
+void cass_link_async_down(struct cass_dev *hw, u32 origin)
+{
+	cxidev_dbg(&hw->cdev,
+		   "async link down, origin %s, (current dirn %s, origin %s)\n",
+		   cass_link_down_origin_str(origin),
+		   cass_lmon_dirn_str(cass_lmon_get_dirn(hw)),
+		   cass_link_down_origin_str(cass_link_get_down_origin(hw)));
+
+	if (cass_version(hw, CASSINI_1))
+		atomic_inc(&hw->sbl_counters[link_async_down_tries]);
+
+	if (cass_lmon_get_dirn(hw) == CASS_LMON_DIRECTION_RESET) {
+		/*
+		 * Do nothing
+		 * This will take us down anyway and is only cleared
+		 * when reset had completed
+		 */
+		return;
+	}
+
+	spin_lock(&hw->port->lock);
+	if (hw->port->link_down_origin != CASS_DOWN_ORIGIN_CMD) {
+		/*
+		 * We are executing a command don't overwrite origin
+		 * as the link keep-up code requires it
+		 */
+		hw->port->link_down_origin = origin;
+	}
+	spin_unlock(&hw->port->lock);
+	if (cass_version(hw, CASSINI_1))
+		atomic_inc(&hw->sbl_counters[link_async_down]);
+	cass_lmon_request_down(hw);
+}
+
+/*
+ * blocking async link down
+ *
+ *   wait until the link is in a suitable state ("down") for the
+ *   media to be changed
+ *
+ *   we would link to use a completion here but its too complicated so
+ *   will simply poll for it to be in a "down" state.
+ */
+int cass_link_async_down_wait(struct cass_dev *hw, u32 origin)
+{
+	unsigned long timeout = jiffies +
+		msecs_to_jiffies(CASS_LINK_ASYNC_DOWN_TIMEOUT);
+
+	cxidev_dbg(&hw->cdev, "async down wait - origin %s\n",
+		   cass_link_down_origin_str(origin));
+
+	if (cass_version(hw, CASSINI_1))
+		atomic_inc(&hw->sbl_counters[link_async_down_tries]);
+
+	/* stop the link if its coming up */
+	spin_lock(&hw->port->lock);
+	switch (hw->port->lstate) {
+
+	case CASS_LINK_STATUS_STARTING:
+	case CASS_LINK_STATUS_UP:
+		hw->port->link_down_origin = origin;
+		spin_unlock(&hw->port->lock);
+		cass_lmon_request_down(hw);
+		break;
+
+	default:
+		spin_unlock(&hw->port->lock);
+	}
+
+	/* wait for it to get to a "down" state */
+	do {
+		spin_lock(&hw->port->lock);
+		switch (hw->port->lstate) {
+
+		case CASS_LINK_STATUS_DOWN:
+		case CASS_LINK_STATUS_UNCONFIGURED:
+		case CASS_LINK_STATUS_ERROR:
+		case CASS_LINK_STATUS_UNKNOWN:
+			cxidev_dbg(&hw->cdev, "async down wait done (%s)\n",
+				   cass_link_state_str(hw->port->lstate));
+			if (cass_version(hw, CASSINI_1))
+				atomic_inc(&hw->sbl_counters[link_async_down]);
+			spin_unlock(&hw->port->lock);
+			return 0;
+
+		default:
+			spin_unlock(&hw->port->lock);
+			msleep(CASS_LINK_ASYNC_DOWN_INTERVAL);
+			break;
+		}
+	} while time_is_after_jiffies(timeout);
+
+	cxidev_err(&hw->cdev, "async down wait timed out (%s)\n",
+		   cass_link_state_str(hw->port->lstate));
+	return -ETIMEDOUT;
+}
+
+/*
+ * blocking async link reset
+ *
+ *   block until the link reset completes
+ *
+ *   we would link to use a completion here but its too complicated so
+ *   will simply poll for it to be in an "unconfigured" state.
+ */
+int cass_link_async_reset_wait(struct cass_dev *hw, u32 origin)
+{
+	unsigned long timeout = jiffies +
+		msecs_to_jiffies(CASS_LINK_ASYNC_RESET_TIMEOUT);
+
+	cxidev_dbg(&hw->cdev, "async reset wait - origin %s\n",
+		   cass_link_down_origin_str(origin));
+
+	/* stop the link if its coming up */
+	spin_lock(&hw->port->lock);
+	switch (hw->port->lstate) {
+
+	case CASS_LINK_STATUS_STARTING:
+	case CASS_LINK_STATUS_UP:
+	case CASS_LINK_STATUS_STOPPING:
+	case CASS_LINK_STATUS_DOWN:
+	case CASS_LINK_STATUS_ERROR:
+	case CASS_LINK_STATUS_UNCONFIGURED:
+		hw->port->link_down_origin = origin;
+		spin_unlock(&hw->port->lock);
+		cass_lmon_request_reset(hw);
+		break;
+
+	default:
+		spin_unlock(&hw->port->lock);
+	}
+
+	/* wait for it to get to an "unconfigured" state */
+	do {
+		spin_lock(&hw->port->lock);
+		switch (hw->port->lstate) {
+
+		case CASS_LINK_STATUS_UNCONFIGURED:
+			cxidev_dbg(&hw->cdev, "async reset wait done (%s)\n",
+				   cass_link_state_str(hw->port->lstate));
+			spin_unlock(&hw->port->lock);
+			return 0;
+
+		default:
+			spin_unlock(&hw->port->lock);
+			msleep(CASS_LINK_ASYNC_RESET_INTERVAL);
+			break;
+		}
+	} while time_is_after_jiffies(timeout);
+
+	cxidev_err(&hw->cdev, "async reset wait timed out (%s)\n",
+		   cass_link_state_str(hw->port->lstate));
+	return -ETIMEDOUT;
+}
+
+/*
+ * print out link state, info etc for sysfs diags
+ *
+ */
+int cass_link_sysfs_sprint(struct cass_dev *hw, char *buf, size_t size)
+{
+	int rc;
+	int state;
+
+	spin_lock(&hw->port->lock);
+	state = hw->port->lstate;
+	spin_unlock(&hw->port->lock);
+
+	rc = scnprintf(buf, size, "%s", cass_link_state_str(state));
+
+	return rc;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_link_misc.c b/drivers/net/ethernet/hpe/ss1/cass_link_misc.c
new file mode 100644
index 000000000000..aa411234c101
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_link_misc.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/workqueue.h>
+#include <linux/delay.h>
+#include <linux/hpe/sbl/sbl.h>
+
+#include "cass_core.h"
+#include "cass_cable.h"
+
+/*
+ * thread safe access functions
+ *
+ *   TODO inline these
+ */
+int cass_link_get_state(struct cass_dev *hw)
+{
+	int state;
+
+	spin_lock(&hw->port->lock);
+	state = hw->port->lstate;
+	spin_unlock(&hw->port->lock);
+
+	return state;
+}
+
+void cass_link_set_led(struct cass_dev *hw)
+{
+	cxidev_dbg(&hw->cdev,
+		   "beacon = %s, overtemp = %s, hstate = %d, lstate = %d\n",
+		   hw->qsfp_beacon_active ? "true" : "false",
+		   hw->qsfp_over_temp ? "true" : "false",
+		   hw->port->hstate,
+		   hw->port->lstate);
+
+	if (hw->qsfp_beacon_active) {
+		uc_cmd_set_link_leds(hw, LED_SLOW_GRN);
+		return;
+	}
+
+	if (!cass_version(hw, CASSINI_1))
+		return;
+
+	if (hw->port->hstate == CASS_HEADSHELL_STATUS_NOT_PRESENT)
+		uc_cmd_set_link_leds(hw, LED_OFF);
+	else if (hw->qsfp_over_temp)
+		uc_cmd_set_link_leds(hw, LED_ON_YEL);
+	else if (hw->port->hstate == CASS_HEADSHELL_STATUS_ERROR)
+		uc_cmd_set_link_leds(hw, LED_FAST_YEL);
+	else {
+		switch (hw->port->lstate) {
+		case CASS_LINK_STATUS_UNKNOWN:
+		case CASS_LINK_STATUS_ERROR:
+			uc_cmd_set_link_leds(hw, LED_FAST_GRN_YEL);
+			break;
+		case CASS_LINK_STATUS_RESETTING:
+		case CASS_LINK_STATUS_UNCONFIGURED:
+		case CASS_LINK_STATUS_STOPPING:
+		case CASS_LINK_STATUS_DOWN:
+			uc_cmd_set_link_leds(hw, LED_OFF);
+			break;
+		case CASS_LINK_STATUS_STARTING:
+			uc_cmd_set_link_leds(hw, LED_FAST_GRN);
+			break;
+		case CASS_LINK_STATUS_UP:
+			uc_cmd_set_link_leds(hw, LED_ON_GRN);
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+void cass_link_set_state(struct cass_dev *hw, int state, int err)
+{
+	spin_lock(&hw->port->lock);
+	hw->port->prev_lstate = hw->port->lstate;
+	hw->port->lstate = state;
+	hw->port->lerr = err;
+	spin_unlock(&hw->port->lock);
+
+	cass_link_set_led(hw);
+}
+
+int cass_link_get_down_origin(struct cass_dev *hw)
+{
+	int origin;
+
+	spin_lock(&hw->port->lock);
+	origin = hw->port->link_down_origin;
+	spin_unlock(&hw->port->lock);
+
+	return origin;
+}
+
+void cass_link_set_down_origin(struct cass_dev *hw, int origin)
+{
+	spin_lock(&hw->port->lock);
+	hw->port->link_down_origin = origin;
+	spin_unlock(&hw->port->lock);
+}
+
+/*
+ * enum to string functions
+ */
+const char *cass_link_state_str(enum cass_link_status state)
+{
+	switch (state) {
+	case CASS_LINK_STATUS_UNKNOWN:      return "unknown";
+	case CASS_LINK_STATUS_RESETTING:    return "resetting";
+	case CASS_LINK_STATUS_UNCONFIGURED: return "unconfigured";
+	case CASS_LINK_STATUS_STARTING:     return "starting";
+	case CASS_LINK_STATUS_UP:           return "up";
+	case CASS_LINK_STATUS_STOPPING:     return "stopping";
+	case CASS_LINK_STATUS_DOWN:         return "down";
+	case CASS_LINK_STATUS_ERROR:        return "error";
+	default:                            return "unrecognised";
+	}
+}
+
+const char *cass_lmon_dirn_str(enum cass_lmon_direction dirn)
+{
+	switch (dirn) {
+	case CASS_LMON_DIRECTION_INVALID: return "unknown";
+	case CASS_LMON_DIRECTION_NONE:    return "none";
+	case CASS_LMON_DIRECTION_UP:      return "up";
+	case CASS_LMON_DIRECTION_DOWN:    return "down";
+	case CASS_LMON_DIRECTION_RESET:   return "reset";
+	default:                          return "unrecognised";
+	}
+}
+
+const char *cass_link_down_origin_str(u32 origin)
+{
+	switch (origin) {
+	case CASS_DOWN_ORIGIN_UNKNOWN:           return "unknown";
+	case CASS_DOWN_ORIGIN_NONE:              return "none";
+	case CASS_DOWN_ORIGIN_CONFIG:            return "config";
+	case CASS_DOWN_ORIGIN_BL_LFAULT:         return "bl/lfault";
+	case CASS_DOWN_ORIGIN_BL_RFAULT:         return "bl/rfault";
+	case CASS_DOWN_ORIGIN_BL_ALIGN:          return "bl/align";
+	case CASS_DOWN_ORIGIN_BL_DOWN:           return "bl/down";
+	case CASS_DOWN_ORIGIN_BL_HISER:          return "bl/hiser";
+	case CASS_DOWN_ORIGIN_BL_LLR:            return "bl/llr";
+	case CASS_DOWN_ORIGIN_BL_UNKNOWN:        return "bl/unknown";
+	case CASS_DOWN_ORIGIN_LMON_UCW:          return "lmon/ucw";
+	case CASS_DOWN_ORIGIN_LMON_CCW:          return "lmon/ccw";
+	case CASS_DOWN_ORIGIN_LLR_TX_REPLAY:     return "lmon/llr_tx_replay";
+	case CASS_DOWN_ORIGIN_HEADSHELL_REMOVED: return "headshell-removed";
+	case CASS_DOWN_ORIGIN_HEADSHELL_ERROR:   return "headshell-error";
+	case CASS_DOWN_ORIGIN_MEDIA_REMOVED:     return "media-removed";
+	case CASS_DOWN_ORIGIN_CMD:               return "cmd";
+	default:                                 return "unrecognised";
+	}
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_p2p.h b/drivers/net/ethernet/hpe/ss1/cass_p2p.h
new file mode 100644
index 000000000000..ab8fe48998a2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_p2p.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2024,2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_P2P_H
+#define _CASS_P2P_H
+
+struct ac_map_opts {
+	u64 va_start;
+	u64 va_end;
+	size_t va_len;
+	u32 flags;
+	u64 iova;
+	dma_addr_t *dma_addrs;
+	int page_shift;
+	int huge_shift;
+	int ptg_mode;
+	bool hugepage_test;
+	bool is_huge_page;
+	struct cxi_md_priv *md_priv;
+};
+
+struct cass_p2p_ops {
+	int (*get_pages)(struct ac_map_opts *m_opts);
+	void (*put_pages)(struct cxi_md_priv *md_priv);
+	int (*is_device_mem)(uintptr_t va, size_t len, int *page_shift);
+};
+
+#ifdef CONFIG_HPE_SS1_P2P_DMABUF
+int cass_device_get_pages(struct ac_map_opts *m_opts);
+void cass_device_put_pages(struct cxi_md_priv *md_priv);
+struct cxi_md_priv *cass_device_md(struct cxi_lni_priv *lni_priv, u64 va,
+				   size_t len, dma_addr_t *dma_addr);
+int cass_is_device_memory(struct cass_dev *hw, struct ac_map_opts *m_opts,
+			  uintptr_t va, size_t len);
+void cxi_p2p_fini(void);
+#else
+static inline int cass_device_get_pages(struct ac_map_opts *m_opts)
+{
+	return -ENOTSUPP;
+}
+
+static inline void cass_device_put_pages(struct cxi_md_priv *md_priv)
+{
+	return;
+}
+
+static inline struct cxi_md_priv *cass_device_md(struct cxi_lni_priv *lni_priv,
+						 u64 va, size_t len,
+						 dma_addr_t *dma_addr)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline int cass_is_device_memory(struct cass_dev *hw,
+					struct ac_map_opts *m_opts,
+					uintptr_t va, size_t len)
+{
+	return -ENOTSUPP;
+}
+
+static inline void cxi_p2p_fini(void)
+{
+	return;
+}
+#endif
+int cxi_dmabuf_get_pages(struct ac_map_opts *m_opts);
+void cxi_dmabuf_put_pages(struct cxi_md_priv *md_priv);
+
+#endif /* CASS_P2P_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rgroup.h b/drivers/net/ethernet/hpe/ss1/cass_rgroup.h
new file mode 100644
index 000000000000..2a8ded868b21
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rgroup.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_RGROUP_H_
+#define _CASS_RGROUP_H_
+
+#include <linux/xarray.h>
+
+#include "cxi_rgroup.h"
+
+void cass_dev_rgroup_init(struct cass_dev *hw);
+
+void cass_dev_rgroup_fini(struct cass_dev *hw);
+
+int cass_rgroup_add_resource(struct cxi_rgroup *rgroup,
+			     struct cxi_resource_entry *resource);
+
+int cass_rgroup_remove_resource(struct cxi_rgroup *rgroup,
+				struct cxi_resource_entry *resource);
+
+void cass_free_resource(struct cxi_rgroup *rgroup,
+			struct cxi_resource_entry *entry);
+
+int cass_alloc_resource(struct cxi_rgroup *rgroup,
+			struct cxi_resource_entry *entry);
+
+void cass_get_tle_in_use(struct cxi_rgroup *rgroup,
+			 struct cxi_resource_entry *entry);
+
+#endif /* _CASS_RGROUP_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.h b/drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.h
new file mode 100644
index 000000000000..26082e1cac82
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_RX_TX_PROFILE_H_
+#define _CASS_RX_TX_PROFILE_H_
+
+struct cass_dev;
+
+void cass_dev_rx_tx_profiles_init(struct cass_dev *hw);
+void cass_dev_rx_tx_profiles_fini(struct cass_dev *hw);
+
+void cass_rx_profile_init(struct cass_dev *hw, struct cxi_rx_profile *rx_profile);
+void cass_tx_profile_init(struct cass_dev *hw, struct cxi_tx_profile *tx_profile);
+
+#endif /* _CASS_RX_TX_PROFILE_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sbl.h b/drivers/net/ethernet/hpe/ss1/cass_sbl.h
new file mode 100644
index 000000000000..e6e730087a86
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sbl.h
@@ -0,0 +1,581 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2024 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_SBL_H
+#define _CXI_SBL_H
+
+#include <linux/phy/phy.h>
+#include "uapi/ethernet/sbl-abi.h"
+
+#define PCA_SHASTA_BRAZOS_PASS_1_PN        "102325100"
+#define PCA_SHASTA_BRAZOS_PASS_2_PN        "102325101"
+#define PCA_SHASTA_BRAZOS_PASS_3_PN        "102325102"
+#define PCA_SHASTA_BRAZOS_PASS_4_PN        "P41345-"
+
+#define PCA_SHASTA_SAWTOOTH_PASS_1_PN      "102251000"
+#define PCA_SHASTA_SAWTOOTH_PASS_2_PN      "102251001"
+#define PCA_SHASTA_SAWTOOTH_PASS_3_PN      "P43012-"
+
+#define CASS_LINK_ASYNC_DOWN_TIMEOUT              5000
+#define CASS_LINK_ASYNC_DOWN_INTERVAL              500
+#define CASS_LINK_ASYNC_RESET_TIMEOUT             5000
+#define CASS_LINK_ASYNC_RESET_INTERVAL             500
+#define CASS_PORT_DEFAULT_OPT_FLAGS                  0
+
+#define CASS_PCS_NUM_FECL_CNTRS                           8
+
+/**
+ * @brief default link options flags
+ */
+#define CASS_LINK_ATTR_DEFAULT_OPT_FLAGS                  0
+#define CASS_SBL_PORT_CONFIG1_PRE                         4
+#define CASS_SBL_PORT_CONFIG2_ATTEN                       12
+#define CASS_SBL_PORT_CONFIG2_GS1                         0
+#define CASS_SBL_PORT_CONFIG2_NUM_INTR                    4
+#define CASS_SBL_PORT_CONFIG2_INTR0                       0x2c
+#define CASS_SBL_PORT_CONFIG2_DATA0                       0x0909
+#define CASS_SBL_PORT_CONFIG2_INTR1                       0x6c
+#define CASS_SBL_PORT_CONFIG2_DATA1                       0x3
+#define CASS_SBL_PORT_CONFIG2_INTR2                       0x2c
+#define CASS_SBL_PORT_CONFIG2_DATA2                       0x090a
+#define CASS_SBL_PORT_CONFIG2_INTR3                       0x6c
+#define CASS_SBL_PORT_CONFIG2_DATA3                       0xa
+#define CASS_SBL_PORT_CONFIG3_ATTEN                       6
+#define CASS_SBL_PORT_CONFIG3_PRE                         4
+#define CASS_SBL_PORT_CONFIG3_POST                        0
+#define CASS_SBL_PORT_CONFIG3_GS1                         0
+
+#define CASS_SBL_SC_MASKED_OUT                            0
+#define CASS_SBL_SC_MASKED_IN                             0xffffffffffffffff
+#define CASS_SBL_SC_NA                                    0x0
+#define CASS_SBL_SC_LP_SWITCH                             0x1
+#define CASS_SBL_SC_MT_ELEC                               0x1
+#define CASS_SBL_SC_MT_OPT_ANY                            0x6
+#define CASS_SBL_SC_LBM_ANY                               0xff
+#define CASS_SBL_SC_LM_100                                0x2
+#define CASS_SBL_SC_LM_200                                0x1
+
+/* NOTE: don't forget to add sysfs entries if changing this */
+#define CASS_SBL_LINK_RESTART_TIME_SIZE 10
+
+/* Link up FEC check */
+#define CASS_SBL_UP_MIN_FEC_WINDOW             250    /* ms */
+
+/**
+ * @brief software counter names initialisers
+ *
+ *   provides a name for each counter index
+ *
+ */
+#define CASS_SBL_COUNTER_NAMES  "link_up", \
+				"link_up_tries", \
+				"link_down", \
+				"link_down_tries", \
+				"link_async_down", \
+				"link_async_down_tries", \
+				"link_reset", \
+				"link_reset_tries", \
+				"link_auto_restart", \
+				"link_down_origin_config", \
+				"link_down_origin_bl_lfault", \
+				"link_down_origin_bl_rfault", \
+				"link_down_origin_bl_align", \
+				"link_down_origin_bl_down", \
+				"link_down_origin_bl_hiser", \
+				"link_down_origin_bl_llr", \
+				"link_down_origin_bl_unknown", \
+				"link_down_origin_lmon_ucw", \
+				"link_down_origin_lmon_ccw", \
+				"link_down_origin_lmon_llr_tx_replay", \
+				"link_down_origin_headshell_removed", \
+				"link_down_origin_headshell_error", \
+				"link_down_origin_media_removed", \
+				"link_down_origin_cmd", \
+				SBL_COUNTERS_NAME
+
+#define CASS_LMON_COUNTER_NAMES "lmon_wakeup", \
+				"lmon_active", \
+				"lmon_limiter"
+
+/**
+ * enum cass_port_subtype - The sub-type of a port
+ * @CASS_PORT_SUBTYPE_INVALID: Invalid
+ * @CASS_PORT_SUBTYPE_LOCAL:   Local group fabric port
+ * @CASS_PORT_SUBTYPE_GLOBAL:  Global (inter-group) fabric port
+ * @CASS_PORT_SUBTYPE_IEEE:    Standard Ethernet NIC
+ * @CASS_PORT_SUBTYPE_CASSINI: Cassini NIC
+ *
+ * The sub-type of a port
+ */
+enum cass_port_subtype {
+	CASS_PORT_SUBTYPE_INVALID = 0,
+	CASS_PORT_SUBTYPE_LOCAL,
+	CASS_PORT_SUBTYPE_GLOBAL,
+	CASS_PORT_SUBTYPE_IEEE,
+	CASS_PORT_SUBTYPE_CASSINI,
+};
+
+/**
+ * enum cass_port_command - Commands that can be issued to a port
+ * @CASS_CMD_NULL:       Invalid
+ * @CASS_CMD_NOOP:       Do nothing (for testing)
+ * @CASS_CMD_PORT_START: Request port starts
+ * @CASS_CMD_PORT_STOP:  Request port stops
+ * @CASS_CMD_PORT_RESET: Request port reset
+ * @CASS_CMD_LINK_UP:    Request link bring-up
+ * @CASS_CMD_LINK_DOWN:  Request link bring-down
+ * @CASS_CMD_LINK_RESET: Request link resets
+ *
+ * Commands that can be issued to a port
+ */
+enum cass_port_command {
+	CASS_CMD_NULL = 0,
+	CASS_CMD_NOOP,
+	CASS_CMD_PORT_START,
+	CASS_CMD_PORT_STOP,
+	CASS_CMD_PORT_RESET,
+	CASS_CMD_LINK_UP,
+	CASS_CMD_LINK_DOWN,
+	CASS_CMD_LINK_RESET,
+};
+
+/**
+ * enum cass_port_status - The status of a port
+ * @CASS_PORT_STATUS_UNKNOWN:          State unknown
+ * @CASS_PORT_STATUS_NOT_PRESENT:      Port not present in hardware
+ * @CASS_PORT_STATUS_UNCONFIGURED:     Port is not configured
+ * @CASS_PORT_STATUS_STARTING:         Port Starting
+ * @CASS_PORT_STATUS_UP:               Port Up
+ * @CASS_PORT_STATUS_RUNNING:          Port Up and Link Up
+ * @CASS_PORT_STATUS_RUNNING_DEGRADED: Port Up and Link Up but link degraded
+ * @CASS_PORT_STATUS_STOPPING:         Port Stopping
+ * @CASS_PORT_STATUS_DOWN:             Port is down and ready to start
+ * @CASS_PORT_STATUS_RESETTING:        Port is resetting
+ * @CASS_PORT_STATUS_ERROR:            Port has an Error
+ *
+ * The status of a port
+ */
+enum cass_port_status {
+	CASS_PORT_STATUS_UNKNOWN          = 0,
+	CASS_PORT_STATUS_NOT_PRESENT      = 1 << 0,
+	CASS_PORT_STATUS_UNCONFIGURED     = 1 << 1,
+	CASS_PORT_STATUS_STARTING         = 1 << 2,
+	CASS_PORT_STATUS_UP               = 1 << 3,
+	CASS_PORT_STATUS_RUNNING          = 1 << 4,
+	CASS_PORT_STATUS_RUNNING_DEGRADED = 1 << 5,
+	CASS_PORT_STATUS_STOPPING         = 1 << 6,
+	CASS_PORT_STATUS_DOWN             = 1 << 7,
+	CASS_PORT_STATUS_RESETTING        = 1 << 8,
+	CASS_PORT_STATUS_ERROR            = 1 << 9,
+};
+
+/**
+ * enum cass_lmon_direction - link monitor direction flags
+ *
+ * @CASS_LMON_DIRECTION_INVALID: Invalid
+ * @CASS_LMON_DIRECTION_NONE:    no action requested
+ * @CASS_LMON_DIRECTION_UP:      port should try to come up
+ * @CASS_LMON_DIRECTION_DOWN:    port should try to come down
+ * @CASS_LMON_DIRECTION_RESET:   port should reset
+ */
+enum cass_lmon_direction {
+	CASS_LMON_DIRECTION_INVALID = 0,
+	CASS_LMON_DIRECTION_NONE,
+	CASS_LMON_DIRECTION_UP,
+	CASS_LMON_DIRECTION_DOWN,
+	CASS_LMON_DIRECTION_RESET,
+};
+
+/**
+ * enum cass_link_status - Status of the link
+ *
+ * @CASS_LINK_STATUS_UNKNOWN:		State unknown
+ * @CASS_LINK_STATUS_UNCONFIGURED:	Link is not configured
+ * @CASS_LINK_STATUS_STARTING:		Link bring-up in progress
+ * @CASS_LINK_STATUS_UP:		Link Up
+ * @CASS_LINK_STATUS_STOPPING:		Link bring-down in progress
+ * @CASS_LINK_STATUS_DOWN:		Link Down
+ * @CASS_LINK_STATUS_RESETTING:		Link reset in progress
+ * @CASS_LINK_STATUS_ERROR:		Link has an error
+ */
+enum cass_link_status {
+	CASS_LINK_STATUS_UNKNOWN      = 0,
+	CASS_LINK_STATUS_UNCONFIGURED = 1 << 0,
+	CASS_LINK_STATUS_STARTING     = 1 << 1,
+	CASS_LINK_STATUS_UP           = 1 << 2,
+	CASS_LINK_STATUS_STOPPING     = 1 << 3,
+	CASS_LINK_STATUS_DOWN         = 1 << 4,
+	CASS_LINK_STATUS_RESETTING    = 1 << 5,
+	CASS_LINK_STATUS_ERROR        = 1 << 6,
+};
+
+/**
+ * enum cass_link_status - Link configuration option flags
+ * @CASS_LINK_OPT_UP_AUTO_RESTART:	Keep trying to bring up a link that has
+ *					gone down
+ * @CASS_LINK_OPT_NO_SHUTDOWN:		Keep trying to bring up a link that has
+ *					gone down
+ * @CASS_LINK_OPT_RESTART_ON_INSERT:    Allow link restart if up before
+ *                                      headshell remove
+ *
+ * Link configuration option flags
+ */
+enum cass_link_options {
+	CASS_LINK_OPT_UP_AUTO_RESTART    = 1 << 1,
+	CASS_LINK_OPT_NO_SHUTDOWN        = CASS_LINK_OPT_UP_AUTO_RESTART,
+	CASS_LINK_OPT_RESTART_ON_INSERT  = 1 << 2,
+};
+
+/**
+ * enum cass_link_down_origin - The reason the link went down
+ * @CASS_DOWN_ORIGIN_UNKNOWN:		Origin is not known
+ * @CASS_DOWN_ORIGIN_NONE:		not coming down
+ * @CASS_DOWN_ORIGIN_CONFIG:		down after config
+ * @CASS_DOWN_ORIGIN_BL_LFAULT:		base link - local fault
+ * @CASS_DOWN_ORIGIN_BL_RFAULT:		base link - remote fault
+ * @CASS_DOWN_ORIGIN_BL_ALIGN:		base link - alignment lost
+ * @CASS_DOWN_ORIGIN_BL_DOWN:		base link - link down
+ * @CASS_DOWN_ORIGIN_BL_HISER:		base link - high serdes errors
+ * @CASS_DOWN_ORIGIN_BL_LLR:		base link - llr max buffer
+ * @CASS_DOWN_ORIGIN_BL_UNKNOWN:	base link - some other reason
+ * @CASS_DOWN_ORIGIN_LMON_UCW:		lmon - high uncorrected fec error rate
+ * @CASS_DOWN_ORIGIN_LMON_CCW:		lmon - high corrected fec error rate
+ * @CASS_DOWN_ORIGIN_LLR_TX_REPLAY:	lmon - high llr_tx_replay fec error rate
+ * @CASS_DOWN_ORIGIN_HEADSHELL_REMOVED: headshell removed
+ * @CASS_DOWN_ORIGIN_HEADSHELL_ERROR:   headshell fault
+ * @CASS_DOWN_ORIGIN_MEDIA_REMOVED:     media removed
+ * @CASS_DOWN_ORIGIN_CMD:               direct command
+ *
+ * The last reason why the link has gone down.
+ */
+enum cass_link_down_origin {
+	CASS_DOWN_ORIGIN_UNKNOWN,
+	CASS_DOWN_ORIGIN_NONE,
+	CASS_DOWN_ORIGIN_CONFIG,
+	CASS_DOWN_ORIGIN_BL_LFAULT,
+	CASS_DOWN_ORIGIN_BL_RFAULT,
+	CASS_DOWN_ORIGIN_BL_ALIGN,
+	CASS_DOWN_ORIGIN_BL_DOWN,
+	CASS_DOWN_ORIGIN_BL_HISER,
+	CASS_DOWN_ORIGIN_BL_LLR,
+	CASS_DOWN_ORIGIN_BL_UNKNOWN,
+	CASS_DOWN_ORIGIN_LMON_UCW,
+	CASS_DOWN_ORIGIN_LMON_CCW,
+	CASS_DOWN_ORIGIN_LLR_TX_REPLAY,
+	CASS_DOWN_ORIGIN_HEADSHELL_REMOVED,
+	CASS_DOWN_ORIGIN_HEADSHELL_ERROR,
+	CASS_DOWN_ORIGIN_MEDIA_REMOVED,
+	CASS_DOWN_ORIGIN_CMD,
+};
+
+/**
+ * enum cass_port_config_flags - Configure/unconfigured state
+ * @CASS_TYPE_CONFIGURED:	type info has been configured
+ * @CASS_PORT_CONFIGURED:	port info  has been configured
+ * @CASS_LINK_CONFIGURED:	link info has been configured
+ * @CASS_MEDIA_CONFIGURED:	media info has been configured
+ *
+ * Configured/uncofigured state for tpml
+ */
+enum cass_port_config_flags {
+	CASS_TYPE_CONFIGURED   = (1 << 0),
+	CASS_PORT_CONFIGURED   = (1 << 1),
+	CASS_LINK_CONFIGURED   = (1 << 2),
+	CASS_MEDIA_CONFIGURED  = (1 << 3),
+};
+
+/**
+ * enum cass_phy_mode - Phy mode for Cassini SerDes
+ * @PHY_MODE_NORMAL:		normal operation
+ * @PHY_MODE_TX_DISABLED:	Transmitter disabled
+ * @PHY_MODE_LOW_POWER:		SerDes in low power mode
+ * @PHY_MODE_OFF:		SerDes powered off
+ * @PHY_MODE_SPECIAL:		special operation flag
+ *
+ * Phy mode for Cassini SerDes
+ */
+enum cass_phy_mode {
+	PHY_MODE_NORMAL		= 0,
+	PHY_MODE_TX_DISABLED	= 1,
+	PHY_MODE_LOW_POWER	= 2,
+	PHY_MODE_OFF		= 4,
+	PHY_MODE_SPECIAL	= 8,
+};
+
+/**
+ * enum cass_pause_type - Pause type for Cassini
+ * @CASS_PAUSE_TYPE_INVALID:	invalid pause type
+ * @CASS_PAUSE_TYPE_NONE:		no pause specified
+ * @CASS_PAUSE_TYPE_GLOBAL:		standard pause
+ * @CASS_PAUSE_TYPE_802_3X:		standard pause
+ * @CASS_PAUSE_TYPE_PFC:		priority flow control pause
+ * @CASS_PAUSE_TYPE_802_1QBB:	priority flow control pause
+ *
+ * Pause type for Cassini
+ */
+enum cass_pause_type {
+	CASS_PAUSE_TYPE_INVALID  = 0,
+	CASS_PAUSE_TYPE_NONE,
+	CASS_PAUSE_TYPE_GLOBAL,
+	CASS_PAUSE_TYPE_802_3X   = CASS_PAUSE_TYPE_GLOBAL,
+	CASS_PAUSE_TYPE_PFC,
+	CASS_PAUSE_TYPE_802_1QBB = CASS_PAUSE_TYPE_PFC,
+};
+
+/**
+ * enum cass_sbl_counters_idx - Software counter indexes
+ *
+ * Counters cannot be reset
+ *
+ * @link_up:                            link reached up state
+ * @link_up_tries:                      link up called
+ * @link_down:                          link reached down state
+ * @link_down_tries:                    link down called
+ * @link_async_down:                    link async down triggers down
+ * @link_async_down_tries:              link async down called
+ * @link_reset:                         link reset completed
+ * @link_reset_tries:                   link reset called
+ * @link_auto_restart:                  lmon link auto-restarted
+ * @link_down_origin_config:            after config
+ * @link_down_origin_bl_lfault:         pcs local fault
+ * @link_down_origin_bl_rfault:         pcr remote fault
+ * @link_down_origin_bl_align:          pcs align
+ * @link_down_origin_bl_down:           pcs link down
+ * @link_down_origin_bl_hiser:          pcs high serdes error rate
+ * @link_down_origin_bl_llr:            llr error
+ * @link_down_origin_bl_unknown:        base link unknown
+ * @link_down_origin_lmon_ucw:          lmon high ucw rate
+ * @link_down_origin_lmon_ccw:          lmon high ccw rate
+ * @link_down_origin_lmon_llr_tx_replay:lmon high llr tx replay rate
+ * @link_down_origin_headshell_removed: headshell removed
+ * @link_down_origin_headshell_error:   headshell in error
+ * @link_down_origin_media_removed:     media removed
+ * @link_down_origin_cmd:               user command
+ * @SBL_COUNTERS:                       sbl counters defined in sbl_counters.h
+ * @CASS_SBL_NUM_COUNTERS:              the number of counters
+ */
+enum cass_sbl_counters_idx {
+	link_up,
+	link_up_tries,
+	link_down,
+	link_down_tries,
+	link_async_down,
+	link_async_down_tries,
+	link_reset,
+	link_reset_tries,
+	link_auto_restart,
+	link_down_origin_config,
+	link_down_origin_bl_lfault,
+	link_down_origin_bl_rfault,
+	link_down_origin_bl_align,
+	link_down_origin_bl_down,
+	link_down_origin_bl_hiser,
+	link_down_origin_bl_llr,
+	link_down_origin_bl_unknown,
+	link_down_origin_lmon_ucw,
+	link_down_origin_lmon_ccw,
+	link_down_origin_lmon_llr_tx_replay,
+	link_down_origin_headshell_removed,
+	link_down_origin_headshell_error,
+	link_down_origin_media_removed,
+	link_down_origin_cmd,
+	SBL_COUNTERS,
+	CASS_SBL_NUM_COUNTERS,
+};
+
+/**
+ * enum cass_counters_idx - Software counter indexes
+ *
+ * Counters cannot be reset
+ *
+ * @lmon_wakeup:                        lmon wakeup
+ * @lmon_active:                        lmon active
+ * @lmon_limiter:                       lmon limiter
+ */
+enum cass_lmon_counters_idx {
+	lmon_wakeup,
+	lmon_active,
+	lmon_limiter,
+	CASS_LMON_NUM_COUNTERS,
+};
+
+/**
+ * struct cass_link_attr - Attributes for link configuration
+ * @bl:                 base-link attributes
+ * @options:            option flags for links
+ * @el:                 ether link specific attributes;
+ * @el.mattr:           cable related configuration
+ *
+ * These attributes must be configured for a link.
+ * Different setting will be required for fabric or Ethernet links
+ * The anonymous union is not required by base link.
+ */
+struct cass_link_attr {
+	struct sbl_base_link_attr bl;
+	__u32 options;
+	struct sbl_media_attr mattr;
+};
+
+/**
+ * struct cass_port - port-specific values
+ *
+ * @subtype:                  ieee or casssini
+ * @lock:                     TODO what lock type?
+ * @lmon:                     link monitor thread
+ * @lmon_dirn:                lmon direction
+ * @lmon_wq:                  wq for waking the link monitor
+ * @lmon_active:              lmon is awake
+ * @lmon_limiter_on:          rate limiter is active
+ * @lmon_up_pause:            link up is paused
+ * @lmon_wake_jiffies:        end of wake count period
+ * @lmon_wake_cnt:            wakeups in period
+ * @lmon_counters:            sw counter block (can never be cleared)
+ * @config_state:             what has been configured
+ * @lattr:                    link related configuration
+ * @lstate:                   link state
+ * @prev_lstate:              previous link state
+ * @lerr:                     error number that caused error state
+ * @hstate:                   headshell state
+ * @link_down_origin:         reason we are going down
+ * @link_restart_count:       auto link restarts since last up command
+ * @link_restart_time_idx     auto link restarts current buffer index
+ * @link_restart_time_buf     auto link restarts timestamp buffer
+ * @pause_lock:               lock on pause state access
+ * @pause_type:               type of pause (global/pfc)
+ * @tx_pause:                 enable tx pause
+ * @rx_pause:                 enable rx pause
+ */
+struct cass_port {
+	int subtype;
+	spinlock_t lock;
+	struct task_struct *lmon;
+	int lmon_dirn;
+	wait_queue_head_t lmon_wq;
+	bool lmon_active;
+	bool lmon_limiter_on;
+	bool lmon_up_pause;
+	unsigned long lmon_wake_jiffies;
+	int lmon_wake_cnt;
+	atomic_t *lmon_counters;
+	u32 config_state;
+	struct cass_link_attr lattr;
+	u32 lstate;
+	u32 prev_lstate;
+	u32 lerr;
+	u32 hstate;
+	u32 link_down_origin;
+	u32 link_restart_count;
+	u32 link_restart_time_idx;
+	time64_t link_restart_time_buf[CASS_SBL_LINK_RESTART_TIME_SIZE];
+	spinlock_t pause_lock;
+	u32 pause_type;
+	bool tx_pause;
+	bool rx_pause;
+	time64_t start_time;
+};
+
+int cass_sbl_init(struct cass_dev *hw);
+int cass_sbl_link_start(struct cass_dev *hw);
+int cass_sbl_link_fini(struct cass_dev *hw);
+int cass_sbl_power_on(struct cass_dev *hw);
+int cass_sbl_power_off(struct cass_dev *hw);
+void cass_sbl_set_defaults(struct cass_dev *hw);
+int cass_sbl_configure(struct cass_dev *hw);
+int cass_sbl_reset(struct cass_dev *hw);
+
+/*
+ * link monitors (lmon)
+ */
+int  cass_lmon_start_all(struct cass_dev *hw);
+int  cass_lmon_stop_all(struct cass_dev *hw);
+void cass_lmon_kill_all(struct cass_dev *hw);
+int cass_lmon_get_dirn(struct cass_dev *hw);
+void cass_lmon_set_dirn(struct cass_dev *hw, int dirn);
+bool cass_lmon_get_active(struct cass_dev *hw);
+void cass_lmon_set_active(struct cass_dev *hw, bool state);
+void cass_lmon_set_up_pause(struct cass_dev *hw, bool state);
+bool cass_lmon_get_up_pause(struct cass_dev *hw);
+int  cass_lmon_request_up(struct cass_dev *hw);
+int  cass_lmon_request_down(struct cass_dev *hw);
+int  cass_lmon_request_reset(struct cass_dev *hw);
+const char *cass_lmon_dirn_str(enum cass_lmon_direction dirn);
+
+/*
+ * misc
+ */
+int  cass_link_get_down_origin(struct cass_dev *hw);
+void cass_link_set_down_origin(struct cass_dev *hw, int origin);
+const char *cass_link_state_str(enum cass_link_status state);
+const char *cass_link_down_origin_str(u32 origin);
+void cass_tc_get_hni_pause_cfg(struct cass_dev *hw);
+
+/*
+ * Port database
+ */
+int cass_port_new_port_db(struct cass_dev *hw);
+void cass_port_del_port_db(struct cass_dev *hw);
+
+/*
+ * link state access
+ */
+int  cass_link_get_state(struct cass_dev *hw);
+void cass_link_set_state(struct cass_dev *hw, int state, int err);
+
+/*
+ * set link led
+ */
+void cass_link_set_led(struct cass_dev *hw);
+
+/*
+ * sysfs
+ */
+int cass_link_sysfs_sprint(struct cass_dev *hw, char *buf, size_t size);
+int cass_pause_sysfs_sprint(struct cass_dev *hw, char *buf, size_t size);
+
+/*
+ * Text output helpers
+ */
+const char *cass_port_subtype_str(enum cass_port_subtype subtype);
+const char *cass_link_state_str(enum cass_link_status state);
+const char *cass_pause_type_str(enum cass_pause_type type);
+
+/*
+ * principal link functions
+ */
+void cass_link_async_down(struct cass_dev *hw, u32 origin);
+int  cass_link_async_down_wait(struct cass_dev *hw, u32 origin);
+int cass_link_async_reset_wait(struct cass_dev *hw, u32 origin);
+
+void cass_sbl_mode_get(struct cass_dev *hw, struct cxi_link_info *link_info);
+void cass_sbl_mode_set(struct cass_dev *hw, const struct cxi_link_info *link_info);
+void cass_sbl_pml_recovery_set(struct cass_dev *hw, bool set);
+void cass_sbl_get_debug_flags(struct cass_dev *hw, u32 *flags);
+void cass_sbl_set_debug_flags(struct cass_dev *hw, u32 clr_flags, u32 set_flags);
+void cass_sbl_link_mode_to_speed(u32 link_mode, int *speed);
+void cass_sbl_link_speed_to_mode(int speed, u32 *link_mode);
+
+int cass_sbl_media_config(struct cass_dev *hw, void *attr);
+int cass_sbl_media_unconfig(struct cass_dev *hw);
+int cass_sbl_link_config(struct cass_dev *hw);
+bool cass_sbl_is_link_up(struct cass_dev *hw);
+
+bool cass_sbl_pml_pcs_aligned(struct cass_dev *hw);
+int cass_sbl_exit(struct cass_dev *hw);
+void cass_sbl_exit_legacy(struct cass_dev *hw);
+
+/*
+ * sbl counters
+ */
+int cass_sbl_counters_init(struct cass_dev *hw);
+void cass_sbl_counters_term(struct cass_dev *hw);
+void cass_sbl_counters_down_origin_inc(struct cass_dev *hw, int down_origin);
+void cass_sbl_counters_update(struct cass_dev *hw);
+
+/*
+ * lmon counters
+ */
+void cass_lmon_counters_init(struct cass_dev *hw);
+void cass_lmon_counters_term(struct cass_dev *hw);
+
+int cass_sbl_set_eth_name(struct cass_dev *hw, const char *name);
+#endif	/* _CXI_SBL_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sl.h b/drivers/net/ethernet/hpe/ss1/cass_sl.h
new file mode 100644
index 000000000000..e36f7e695c9a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sl.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2022,2023,2024 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_SL_H_
+#define _CASS_SL_H_
+
+#include <linux/hpe/sl/sl_media.h>
+#include <linux/hpe/sl/sl_link.h>
+#include <linux/hpe/sl/sl_llr.h>
+#include <linux/hpe/sl/sl_mac.h>
+#include <linux/hpe/sl/sl_lgrp.h>
+#include <linux/hpe/sl/sl_ldev.h>
+#include <linux/hpe/sl/sl_fec.h>
+
+struct cass_sl_dev {
+	bool                         is_initialized;
+
+	struct sl_ops                ops;
+	struct sl_uc_ops             uc_ops;
+	struct sl_accessors          accessors;
+	struct sl_uc_accessor        uc_accessor;
+
+	struct sl_hw_attr            hw_attr;
+
+	struct sl_ldev              *ldev;
+	struct sl_ldev_attr          ldev_config;
+
+	struct sl_lgrp              *lgrp;
+	struct sl_lgrp_config        lgrp_config;
+
+	u32                          static_tech_map;
+	u32                          autoneg_tech_map;
+	u32                          link_up_mode;
+	u32                          link_up_fec_type;
+
+	struct sl_link              *link;
+	struct sl_link_config        link_config;
+	struct sl_link_policy        link_policy;
+	u32                          link_state;
+	bool                         is_fw_loaded;
+
+	struct sl_mac               *mac;
+
+	struct sl_llr               *llr;
+	struct sl_llr_config         llr_config;
+	bool                         enable_llr;
+	u32                          llr_state;
+	struct sl_llr_data           llr_data;
+
+	struct sl_media_attr         media_attr;
+	bool                         has_cable;
+
+	struct list_head             intr_list;
+	/* Serializes interrupt registration and removal. */
+	struct mutex                 intr_lock;
+
+	struct mutex                 pmi_lock;
+	struct mutex                 sbus_lock;
+
+	struct completion            step_complete;
+
+	u32                          old_an_mode;
+	u32                          old_lt_mode;
+
+	bool                         is_canceled;
+
+	struct {
+		void       *cntrs;
+		size_t      cntrs_size;
+		int         dma_id;
+		dma_addr_t  dma_addr;
+	} fec;
+};
+
+bool cass_sl_is_pcs_aligned(struct cass_dev *cass_dev);
+
+void cass_sl_mode_get(struct cass_dev *cass_dev, struct cxi_link_info *link_info);
+void cass_sl_mode_set(struct cass_dev *cass_dev, const struct cxi_link_info *link_info);
+void cass_sl_flags_get(struct cass_dev *cass_dev, u32 *flags);
+void cass_sl_flags_set(struct cass_dev *cass_dev, u32 clr_flags, u32 set_flags);
+
+void cass_sl_pml_recovery_set(struct cass_dev *cass_dev, bool set);
+
+int  cass_sl_init(struct cass_dev *cass_dev);
+int  cass_sl_connect_id_set(struct cass_dev *cass_dev, const char *connect_id);
+int  cass_sl_media_config(struct cass_dev *cass_dev, void *media_attr);
+int  cass_sl_link_config(struct cass_dev *cass_dev);
+bool cass_sl_is_link_up(struct cass_dev *cass_dev);
+int  cass_sl_link_up(struct cass_dev *cass_dev);
+int  cass_sl_link_down(struct cass_dev *cass_dev);
+int cass_sl_exit(struct cass_dev *cass_dev);
+int  cass_sl_media_unconfig(struct cass_dev *cass_dev);
+int cass_sl_link_fini(struct cass_dev *cass_dev);
+
+#endif /* _CASS_SL_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sl_io.h b/drivers/net/ethernet/hpe/ss1/cass_sl_io.h
new file mode 100644
index 000000000000..d03509583407
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sl_io.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_SL_IO_H_
+#define _CASS_SL_IO_H_
+
+int cass_sl_uc_write8(void *uc_accessor, u8 page, u8 addr, u8 data);
+int cass_sl_uc_read(void *uc_accessor, u32 offset, u32 page, u8 *data, u32 len);
+u64 cass_sl_read64(void *pci_accessor, long addr);
+void cass_sl_write64(void *pci_accessor, long addr, u64 data64);
+int cass_sl_sbus_rd(void *sbus_accessor, u32 sbus_addr, u8 reg_addr, u32 *rd_data);
+int cass_sl_sbus_wr(void *sbus_accessor, u32 sbus_addr, u8 reg_addr, u32 req_data);
+int cass_sl_sbus_cmd(void *sbus_accessor, int ring, u32 req_data, u8 reg_addr,
+		     u8 dev_addr, u8 op, u32 *rsp_data, u8 *result_code,
+	u8 *overrun, u8 *error, int timeout_ms, u32 flags);
+int cass_sl_pmi_rd(void *pmi_accessor, u8 lgrp_num, u32 addr, u16 *data);
+int cass_sl_pmi_wr(void *pmi_accessor, u8 lgrp_num, u32 addr, u16 data, u16 mask);
+
+#endif /* _CASS_SL_IO_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.c b/drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.c
new file mode 100644
index 000000000000..edeee3937705
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.c
@@ -0,0 +1,824 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2025-2026 Hewlett Packard Enterprise Development LP */
+
+/* cxi-ss1 debug fs*/
+#include <linux/etherdevice.h>
+#include <linux/seq_file.h>
+#include <linux/hpe/sbl/sbl.h>
+#include "cass_core.h"
+#include "cass_ss1_debugfs.h"
+
+#define DEBUGFS_BUFSIZE        800
+
+/* Dump UC logging to debugfs */
+static int uc_log(struct seq_file *s, void *unused)
+{
+	struct cass_dev *hw = s->private;
+	int rc;
+
+	if (!hw->uc_present)
+		return 0;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	while (!seq_has_overflowed(s)) {
+		uc_prepare_comm(hw);
+
+		hw->uc_req.cmd = CUC_CMD_GET_LOG;
+		hw->uc_req.count = 1;
+
+		rc = uc_wait_for_response(hw);
+		if (rc || hw->uc_resp.count <= 1)
+			break;
+
+		hw->uc_resp.data[CUC_DATA_BYTES - 1] = 0;
+		seq_printf(s, "%s\n", hw->uc_resp.data);
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return 0;
+}
+
+static int uc_log_debug_dev_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, uc_log, inode->i_private);
+}
+
+const struct file_operations uc_fops = {
+	.owner = THIS_MODULE,
+	.open = uc_log_debug_dev_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+/*
+ * print out pause state for debugfs diags
+ *
+ */
+static void cass_pause_debugfs_print(struct cass_dev *hw, struct seq_file *s)
+{
+	u32 pause_type;
+	bool tx_pause;
+	bool rx_pause;
+
+	spin_lock(&hw->port->pause_lock);
+	pause_type = hw->port->pause_type;
+	tx_pause = hw->port->tx_pause;
+	rx_pause = hw->port->rx_pause;
+	spin_unlock(&hw->port->pause_lock);
+
+	seq_printf(s, "pause: %s", cass_pause_type_str(pause_type));
+	switch (pause_type) {
+	case CASS_PAUSE_TYPE_GLOBAL:
+	case CASS_PAUSE_TYPE_PFC:
+		seq_printf(s, ", tx %s, rx %s",
+			   tx_pause ? "on" : "off", rx_pause ? "on" : "off");
+		break;
+	default:
+		break;
+	}
+	seq_puts(s, "\n");
+}
+
+static const int rsrc_dump_order[] = {
+	CXI_RESOURCE_AC,
+	CXI_RESOURCE_CT,
+	CXI_RESOURCE_EQ,
+	CXI_RESOURCE_PTLTE,
+	CXI_RESOURCE_TGQ,
+	CXI_RESOURCE_TXQ,
+	CXI_RESOURCE_PE0_LE,
+	CXI_RESOURCE_PE1_LE,
+	CXI_RESOURCE_PE2_LE,
+	CXI_RESOURCE_PE3_LE,
+	CXI_RESOURCE_TLE
+};
+
+static int dump_rgroups(struct cass_dev *hw, struct seq_file *s)
+{
+	int i;
+	int rc;
+	unsigned long index;
+	struct cxi_rgroup *rgroup;
+	struct cxi_resource_entry *entry;
+
+	seq_puts(s, "Rgroups:");
+	for_each_rgroup(index, rgroup) {
+		seq_printf(s, "\nID: %u\n", rgroup->id);
+		seq_printf(s, "  Name:%s\n", cxi_rgroup_name(rgroup));
+		seq_printf(s, "  State:%s\n",
+			   cxi_rgroup_is_enabled(rgroup) ? "Enabled" : "Disabled");
+		seq_printf(s, "  LNIs/RGID:%d\n",
+			   cxi_rgroup_lnis_per_rgid(rgroup));
+		seq_printf(s, "  System service:%d\n",
+			   cxi_rgroup_system_service(rgroup));
+		seq_printf(s, "  Counter pool ID:%d\n",
+			   cxi_rgroup_cntr_pool_id(rgroup));
+		seq_printf(s, "  LE pool IDs: %d %d %d %d  TLE pool ID: %d\n",
+			   rgroup->pools.le_pool_id[0],
+			   rgroup->pools.le_pool_id[1],
+			   rgroup->pools.le_pool_id[2],
+			   rgroup->pools.le_pool_id[3],
+			   rgroup->pools.tle_pool_id);
+
+		cxi_rgroup_print_ac_entry_info(rgroup, s);
+
+		seq_puts(s, "           ACs     CTs     EQs    PTEs    TGQs    TXQs    LE0s    LE1s    LE2s    LE3s    TLEs\n");
+		seq_puts(s, "  max   ");
+		for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++) {
+			rc = cxi_rgroup_get_resource_entry(rgroup,
+							   rsrc_dump_order[i],
+							   &entry);
+			seq_printf(s, "%6lu  ", rc ? 0 : entry->limits.max);
+		}
+		seq_puts(s, "\n");
+
+		seq_puts(s, "  res   ");
+		for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++) {
+			rc = cxi_rgroup_get_resource_entry(rgroup,
+							   rsrc_dump_order[i],
+							   &entry);
+			seq_printf(s, "%6lu  ", rc ? 0 : entry->limits.reserved);
+		}
+		seq_puts(s, "\n");
+
+		seq_puts(s, "Alloc   ");
+		for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++) {
+			rc = cxi_rgroup_get_resource_entry(rgroup,
+							   rsrc_dump_order[i],
+							   &entry);
+			seq_printf(s, "%6lu  ", rc ? 0 : entry->limits.in_use);
+		}
+		seq_puts(s, "\n");
+	}
+
+	cxi_rx_profile_print(s);
+	cxi_tx_profile_print(s);
+
+	return 0;
+}
+
+static int dump_services(struct seq_file *s, void *unused)
+{
+	int i;
+	ulong value;
+	struct cass_dev *hw = s->private;
+	struct cxi_resource_use *rsrc_use = hw->resource_use;
+
+	spin_lock(&hw->rgrp_lock);
+
+	seq_puts(s, "Resources\n");
+	seq_puts(s, "           ACs     CTs     EQs    PTEs    TGQs    TXQs    LE0s    LE1s    LE2s    LE3s    TLEs\n");
+
+	seq_puts(s, "  Max ");
+	for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++)
+		seq_printf(s, "  %6lu", rsrc_use[rsrc_dump_order[i]].max);
+	seq_puts(s, "\n");
+
+	seq_puts(s, "  Res ");
+	for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++)
+		seq_printf(s, "  %6lu", rsrc_use[rsrc_dump_order[i]].reserved);
+	seq_puts(s, "\n");
+
+	seq_puts(s, "Alloc ");
+	for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++)
+		seq_printf(s, "  %6lu", rsrc_use[rsrc_dump_order[i]].in_use);
+	seq_puts(s, "\n");
+
+	seq_puts(s, "Avail ");
+	for (i = 0; i < ARRAY_SIZE(rsrc_dump_order); i++) {
+		value = rsrc_use[rsrc_dump_order[i]].shared -
+			rsrc_use[rsrc_dump_order[i]].shared_use;
+		seq_printf(s, "  %6lu", value);
+	}
+	seq_puts(s, "\n\n");
+
+	dump_rgroups(hw, s);
+
+	spin_unlock(&hw->rgrp_lock);
+
+	return 0;
+}
+
+static int dump_service_debug_dev_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, dump_services, inode->i_private);
+}
+
+static const struct file_operations svc_debug_fops = {
+	.owner = THIS_MODULE,
+	.open = dump_service_debug_dev_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+void svc_service_debugfs_create(struct cass_dev *hw)
+{
+	hw->svc_debug = debugfs_create_file("services", 0444, hw->debug_dir,
+					    hw, &svc_debug_fops);
+}
+
+static int cass_port_uptime_str(time64_t time, char *buf, int len)
+{
+	int days;
+	int hours;
+	int mins;
+	int secs;
+	int bytes;
+
+	/* divide time by seconds per day to get days */
+	days  = time / (24 * 60 * 60);
+	time %= 24 * 60 * 60;
+
+	/* divide remainder by seconds per hour to get hours */
+	hours = time / (60 * 60);
+	time %= 60 * 60;
+
+	/* divide remainder by seconds per minute to get minutes */
+	mins  = time / 60;
+	time %= 60;
+
+	/* remainder in seconds */
+	secs  = time;
+
+	if (days)
+		bytes = snprintf(buf, len, "%dd %dh %dm %ds", days, hours, mins, secs);
+	else if (hours)
+		bytes = snprintf(buf, len, "%dh %dm %ds", hours, mins, secs);
+	else if (mins)
+		bytes = snprintf(buf, len, "%dm %ds", mins, secs);
+	else
+		bytes = snprintf(buf, len, "%ds", secs);
+
+	if (bytes > len)
+		return -ENOSPC;
+	else
+		return 0;
+}
+
+/*
+ * return the time (s) that we have been running for
+ * if we are not running return 0;
+ */
+static time64_t cass_port_uptime_get(struct cass_dev *hw)
+{
+	if (hw->port->lstate == CASS_LINK_STATUS_UP)
+		return  ktime_get_seconds() - hw->port->start_time;
+
+	return 0;
+}
+
+static void cass_uptime_debugfs_print(struct cass_dev *hw, struct seq_file *s)
+{
+	time64_t uptime;
+	char uptime_str[64];
+	int err;
+
+	uptime = cass_port_uptime_get(hw);
+	if (!uptime)
+		return;
+
+	err = cass_port_uptime_str(uptime, uptime_str, sizeof(uptime_str));
+	if (err) {
+		cxidev_err(&hw->cdev, "get uptime str failed [%d]\n", err);
+		return;
+	}
+
+	seq_printf(s, "uptime: %lld (%s)\n", uptime, uptime_str);
+}
+
+static void cass_lmon_debugfs_print(struct cass_dev *hw, struct seq_file *s)
+{
+	struct task_struct *lmon;
+	int limiter;
+	int dirn;
+	bool active;
+	u32 restart_count;
+
+	spin_lock(&hw->port->lock);
+	lmon  = hw->port->lmon;
+	limiter  = hw->port->lmon_limiter_on;
+	dirn  = hw->port->lmon_dirn;
+	active = hw->port->lmon_active;
+	restart_count = hw->port->link_restart_count;
+	spin_unlock(&hw->port->lock);
+
+	if (!lmon)
+		return;
+
+	seq_printf(s, "lmon: dirn %s%s%s", cass_lmon_dirn_str(dirn),
+		   active ? ", active" : "", limiter ? ", (limited)" : "");
+	if (cass_lmon_get_up_pause(hw))
+		seq_puts(s, ", up-paused");
+	if (hw->port->lattr.options & CASS_LINK_OPT_UP_AUTO_RESTART) {
+		seq_puts(s, ", up-auto-restart");
+		if (restart_count && (dirn == CASS_LMON_DIRECTION_UP))
+			seq_printf(s, " (%d)", restart_count);
+	}
+	seq_puts(s, "\n");
+}
+
+static void cass_link_debugfs_print(struct cass_dev *hw, struct seq_file *s)
+{
+	int state;
+	int down_origin;
+	int lerr;
+
+	spin_lock(&hw->port->lock);
+	state = hw->port->lstate;
+	lerr = hw->port->lerr;
+	down_origin = hw->port->link_down_origin;
+	spin_unlock(&hw->port->lock);
+
+	seq_printf(s, "link state: %s", cass_link_state_str(state));
+
+	if (state == CASS_LINK_STATUS_ERROR)
+		seq_printf(s, " [%d]\n", lerr);
+	else if (state == CASS_LINK_STATUS_DOWN)
+		seq_printf(s, " (%s)\n",
+			   cass_link_down_origin_str(down_origin));
+	else
+		seq_puts(s, "\n");
+}
+
+static int cass_port_show(struct seq_file *s, void *unused)
+{
+	struct cass_dev *hw = s->private;
+	char buf[DEBUGFS_BUFSIZE];
+	int nic_num = hw->uc_nic;
+
+	if (!cass_version(hw, CASSINI_1)) {
+		seq_puts(s, "NOT IMPLEMENTED!!\n");
+		return 0;
+	}
+
+	seq_printf(s, "** %d **\n", nic_num);
+
+	/* config */
+	spin_lock(&hw->port->lock);
+	seq_printf(s, "configured: %c%c%c%c\n",
+		   (hw->port->config_state & CASS_TYPE_CONFIGURED)   ? 't' : '-',
+		 (hw->port->config_state & CASS_PORT_CONFIGURED)   ? 'p' : '-',
+		 (hw->port->config_state & CASS_MEDIA_CONFIGURED)  ? 'm' : '-',
+		 (hw->port->config_state & CASS_LINK_CONFIGURED)   ? 'l' : '-');
+
+	/* port */
+	seq_printf(s, "type: ether (%s)\n",
+		   cass_port_subtype_str(hw->port->subtype));
+	spin_unlock(&hw->port->lock);
+
+	/* uptime */
+	cass_uptime_debugfs_print(hw, s);
+
+	/* media */
+	memset(buf, 0, DEBUGFS_BUFSIZE);
+	sbl_media_sysfs_sprint(hw->sbl, 0, buf, DEBUGFS_BUFSIZE);
+	seq_puts(s, buf);
+
+	/* pause */
+	cass_pause_debugfs_print(hw, s);
+
+	/* serdes */
+	memset(buf, 0, DEBUGFS_BUFSIZE);
+	sbl_serdes_sysfs_sprint(hw->sbl, 0, buf, DEBUGFS_BUFSIZE);
+	seq_puts(s, buf);
+
+	/* pcs */
+	memset(buf, 0, DEBUGFS_BUFSIZE);
+	sbl_pml_pcs_sysfs_sprint(hw->sbl, 0, buf, DEBUGFS_BUFSIZE);
+	seq_puts(s, buf);
+
+	/* lane degrade status */
+	memset(buf, 0, DEBUGFS_BUFSIZE);
+	sbl_pml_pcs_lane_degrade_sysfs_sprint(hw->sbl, 0, buf, DEBUGFS_BUFSIZE);
+	seq_puts(s, buf);
+
+	/* base link */
+	memset(buf, 0, DEBUGFS_BUFSIZE);
+	sbl_base_link_sysfs_sprint(hw->sbl, 0, buf, DEBUGFS_BUFSIZE);
+	seq_puts(s, buf);
+
+	/* base link */
+	memset(buf, 0, DEBUGFS_BUFSIZE);
+	sbl_fec_sysfs_sprint(hw->sbl, 0, buf, DEBUGFS_BUFSIZE);
+	seq_puts(s, buf);
+
+	/* link */
+	cass_link_debugfs_print(hw, s);
+	cass_lmon_debugfs_print(hw, s);
+
+	return 0;
+}
+
+static int cass_port_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cass_port_show, inode->i_private);
+}
+
+static const struct file_operations cass_port_fops = {
+	.owner = THIS_MODULE,
+	.open = cass_port_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+void cass_port_debugfs_init(struct cass_dev *hw)
+{
+	debugfs_create_file("port", 0444, hw->debug_dir, hw, &cass_port_fops);
+}
+
+static int cass_sbl_counters_show(struct seq_file *s, void *unused)
+{
+	struct cass_dev *hw = s->private;
+	static char *sbl_counter_names[CASS_SBL_NUM_COUNTERS] = { CASS_SBL_COUNTER_NAMES };
+	static char *lmon_counter_names[CASS_LMON_NUM_COUNTERS] = { CASS_LMON_COUNTER_NAMES };
+	int i;
+
+	cass_sbl_counters_update(hw);
+
+	for (i = 0; i < CASS_SBL_NUM_COUNTERS; ++i)
+		seq_printf(s, "%s %d\n", sbl_counter_names[i], atomic_read(&hw->sbl_counters[i]));
+
+	for (i = 0; i < CASS_LMON_NUM_COUNTERS; ++i)
+		seq_printf(s, "%s %d\n", lmon_counter_names[i],
+			   atomic_read(&hw->port->lmon_counters[i]));
+
+	return 0;
+}
+
+static int cass_sbl_counters_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cass_sbl_counters_show, inode->i_private);
+}
+
+static const struct file_operations cass_sbl_counters_fops = {
+	.owner = THIS_MODULE,
+	.open = cass_sbl_counters_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+void cass_sbl_counters_debugfs_init(struct cass_dev *hw)
+{
+	debugfs_create_file("counters", 0444, hw->debug_dir, hw, &cass_sbl_counters_fops);
+}
+
+void domain_debugfs_create(int vni, int pid, struct cass_dev *hw,
+			   struct cxi_domain_priv *domain_priv)
+{
+	char name[30];
+
+	sprintf(name, "%u_%u", vni, pid);
+	domain_priv->debug_dir = debugfs_create_dir(name, hw->domain_dir);
+	debugfs_create_u32("vni", 0444, domain_priv->debug_dir,
+			   &domain_priv->domain.vni);
+}
+
+void pt_debugfs_create(int id, struct cxi_pte_priv *pt, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv)
+{
+	char name[30];
+	char path[30];
+
+	sprintf(name, "%u", id);
+	pt->debug_dir = debugfs_create_dir(name, hw->pt_dir);
+	sprintf(path, "../../../pt/%u", id);
+	pt->lni_dir = debugfs_create_symlink(name, lni_priv->pt_dir,
+					     path);
+}
+
+void lni_debugfs_create(int id, struct cass_dev *hw, struct cxi_lni_priv *lni_priv)
+{
+	char name[30];
+
+	sprintf(name, "%d", id);
+	lni_priv->debug_dir = debugfs_create_dir(name, hw->lni_dir);
+	debugfs_create_u32("id", 0444, lni_priv->debug_dir, &lni_priv->lni.id);
+	debugfs_create_u32("rgid", 0444, lni_priv->debug_dir, &lni_priv->lni.rgid);
+	debugfs_create_u32("pid", 0444, lni_priv->debug_dir, &lni_priv->pid);
+
+	lni_priv->cq_dir = debugfs_create_dir("cq", lni_priv->debug_dir);
+	lni_priv->pt_dir = debugfs_create_dir("pt", lni_priv->debug_dir);
+	lni_priv->eq_dir = debugfs_create_dir("eq", lni_priv->debug_dir);
+	lni_priv->ct_dir = debugfs_create_dir("ct", lni_priv->debug_dir);
+	lni_priv->ac_dir = debugfs_create_dir("ac", lni_priv->debug_dir);
+}
+
+static int eq_debugfs_info(struct seq_file *s, void *unused)
+{
+	struct cxi_eq_priv *eq = s->private;
+
+	seq_printf(s, "EQ id: %u\n", eq->eq.eqn);
+	seq_puts(s, "event MSI vector: ");
+	if (eq->event_msi_irq) {
+		const struct cass_irq *irq = eq->event_msi_irq;
+
+		seq_printf(s, "%s\n", irq->irq_name);
+	} else {
+		seq_puts(s, "none\n");
+	}
+
+	seq_puts(s, "status MSI vector: ");
+	if (eq->status_msi_irq) {
+		const struct cass_irq *irq = eq->status_msi_irq;
+
+		seq_printf(s, "%s\n", irq->irq_name);
+	} else {
+		seq_puts(s, "none\n");
+	}
+
+	seq_printf(s, "slots: %lu\n", eq->queue_size);
+	seq_printf(s, "flags: %llx\n", eq->attr.flags);
+
+	return 0;
+}
+
+static int debug_eq_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, eq_debugfs_info, inode->i_private);
+}
+
+static const struct file_operations eq_fops = {
+	.owner = THIS_MODULE,
+	.open = debug_eq_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+void eq_debugfs_create(int id, struct cxi_eq_priv *eq, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv)
+{
+	char name[30];
+	char path[30];
+
+	sprintf(name, "%u", id);
+	eq->debug_file = debugfs_create_file(name, 0444, hw->eq_dir,
+					     eq, &eq_fops);
+	sprintf(path, "../../../eq/%u", id);
+	eq->lni_dir = debugfs_create_symlink(name, lni_priv->eq_dir,
+					     path);
+}
+
+static int cass_dmac_desc_sets_show(struct seq_file *s, void *unused)
+{
+	struct cass_dev *hw = s->private;
+	int i;
+	int j;
+	u16 count;
+	u16 index;
+	u16 numused;
+	const char *name;
+	union c_pi_cfg_dmac_desc desc;
+	s64 dst;
+	s32 src;
+	s32 len;
+	s16 rem;
+
+	mutex_lock(&hw->dmac.lock);
+	for (i = 0 ; i < DMAC_DESC_SET_COUNT ; ++i) {
+		count	= hw->dmac.desc_sets[i].count;
+		index	= hw->dmac.desc_sets[i].index;
+		numused = hw->dmac.desc_sets[i].numused;
+		name    = hw->dmac.desc_sets[i].name;
+		seq_printf(s, "desc_set[%02d]: count=%u index=%u numused=%u name='%s'\n",
+			   i, count, index, numused,
+			   name == NULL ? "" : name);
+		if (count != 0)
+			for (j = 0; j < count; ++j) {
+				cass_read(hw, C_PI_CFG_DMAC_DESC(index + j), &desc,
+					  sizeof(desc));
+				dst =  desc.qw[0];
+				src =  desc.qw[1] & 0xffffffff;
+				len = (desc.qw[1] >> 32) & 0x000fffff;
+				rem = (desc.qw[1] >> (32 + 20)) & 0x0fff;
+				seq_printf(s, "\tdesc[%04u]=0x%03x,0x%05x,0x%08x,0x%016llx %s\n",
+					   index + j, rem, len, src, dst,
+					   (((dst & 0x7f) == 0) ? "(dst 128-byte aligned)" : ""));
+			}
+	}
+	mutex_unlock(&hw->dmac.lock);
+	return 0;
+}
+
+static int cass_dmac_desc_sets_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cass_dmac_desc_sets_show,
+			   inode->i_private);
+}
+
+static const struct file_operations cass_dmac_desc_sets_fops = {
+	.owner = THIS_MODULE,
+	.open = cass_dmac_desc_sets_open,
+	.read = seq_read,
+	.llseek	 = seq_lseek,
+	.release = single_release,
+};
+
+void cass_dmac_debugfs_init(struct cass_dev *hw)
+{
+	debugfs_create_file("dmac-desc-sets", 0444, hw->debug_dir,
+			    hw, &cass_dmac_desc_sets_fops);
+}
+
+static int cass_rmu_eth_filters_show(struct seq_file *s, void *unused)
+{
+	struct cass_dev *hw = s->private;
+	struct cxi_rmu_eth *rmu_eth;
+	int id;
+	int active_filters = 0;
+
+	mutex_lock(&hw->rmu_eth_lock);
+	idr_for_each_entry(&hw->rmu_eth_idr, rmu_eth, id) {
+		struct cxi_rmu_eth_priv *priv =
+			container_of(rmu_eth, struct cxi_rmu_eth_priv, rmu_eth);
+		unsigned int i;
+
+		for (i = 0; i < priv->set_list_quota; i++) {
+			union c_rmu_cfg_ptlte_set_list set_list;
+			union c_rmu_cfg_ptlte_set_list set_list_mask;
+			unsigned int hw_idx;
+			u8 mac[ETH_ALEN];
+			char func[8];
+			const char *type;
+			const char *rss;
+
+			if (!priv->mac_filter_slots[i])
+				continue;
+
+			hw_idx = priv->set_list_base + i;
+			if (priv->is_vf)
+				scnprintf(func, sizeof(func), "vf%u", priv->vf_num + 1);
+			else
+				scnprintf(func, sizeof(func), "pf");
+			rss = priv->mac_filter_slots[i] == CXI_RMU_ETH_FILTER_RSS ?
+				"on" : "off";
+
+			spin_lock(&hw->rmu_lock);
+			cass_read(hw, C_RMU_CFG_PTLTE_SET_LIST_X(hw_idx), &set_list,
+				  sizeof(set_list));
+			cass_shadow_read(hw, C_RMU_BASE,
+					 C_RMU_CFG_PTLTE_SET_LIST_Y_OFFSET(hw_idx),
+					 &set_list_mask, sizeof(set_list_mask));
+			spin_unlock(&hw->rmu_lock);
+
+			u64_to_ether_addr(set_list.dmac, mac);
+
+			if (!set_list.dmac && !set_list_mask.dmac)
+				type = "promisc";
+			else if (set_list.dmac == 0x010000000000ULL)
+				type = "allmcst";
+			else
+				type = "macaddr";
+
+			seq_printf(s,
+				   "func=%-4s client=%-3d slot=%-3u hw_idx=%-4u rss=%-3s type=%-7s mac=%pM ",
+				   func, id, i, hw_idx, rss, type, mac);
+			seq_printf(s,
+				   "match=%016llx:%016llx:%016llx:%016llx ",
+				   (unsigned long long)set_list.qw[0],
+				   (unsigned long long)set_list.qw[1],
+				   (unsigned long long)set_list.qw[2],
+				   (unsigned long long)set_list.qw[3]);
+			seq_printf(s,
+				   "mask=%016llx:%016llx:%016llx:%016llx",
+				   (unsigned long long)set_list_mask.qw[0],
+				   (unsigned long long)set_list_mask.qw[1],
+				   (unsigned long long)set_list_mask.qw[2],
+				   (unsigned long long)set_list_mask.qw[3]);
+			seq_puts(s, "\n");
+
+			active_filters++;
+		}
+	}
+
+	if (!active_filters)
+		seq_puts(s, "none\n");
+
+	mutex_unlock(&hw->rmu_eth_lock);
+
+	return 0;
+}
+
+static int cass_rmu_eth_filters_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cass_rmu_eth_filters_show, inode->i_private);
+}
+
+static const struct file_operations cass_rmu_eth_filters_fops = {
+	.owner = THIS_MODULE,
+	.open = cass_rmu_eth_filters_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+static int tc_cfg_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, tc_cfg_show, inode->i_private);
+}
+
+static const struct file_operations tc_cfg_fops = {
+	.owner = THIS_MODULE,
+	.open = tc_cfg_open,
+	.read = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+void cass_probe_debugfs_init(struct cass_dev *hw)
+{
+	/* Various debugfs entries */
+	hw->debug_dir = debugfs_create_dir(hw->cdev.name, cxi_debug_dir);
+	hw->lni_dir = debugfs_create_dir("lni", hw->debug_dir);
+	hw->stats_dir = debugfs_create_dir("stats", hw->debug_dir);
+	hw->atu_dir = debugfs_create_dir("atu", hw->debug_dir);
+	debugfs_create_atomic_t("lni", 0444, hw->stats_dir, &hw->stats.lni);
+	debugfs_create_atomic_t("domain", 0444, hw->stats_dir,
+				&hw->stats.domain);
+	debugfs_create_atomic_t("eq", 0444, hw->stats_dir, &hw->stats.eq);
+	debugfs_create_atomic_t("txq", 0444, hw->stats_dir, &hw->stats.txq);
+	debugfs_create_atomic_t("tgq", 0444, hw->stats_dir, &hw->stats.tgq);
+	debugfs_create_atomic_t("pt", 0444, hw->stats_dir, &hw->stats.pt);
+	debugfs_create_atomic_t("ct", 0444, hw->stats_dir, &hw->stats.ct);
+	debugfs_create_atomic_t("ac", 0444, hw->stats_dir, &hw->stats.ac);
+	debugfs_create_atomic_t("md", 0444, hw->stats_dir, &hw->stats.md);
+
+	hw->domain_dir = debugfs_create_dir("domain", hw->debug_dir);
+	hw->eq_dir = debugfs_create_dir("eq", hw->debug_dir);
+	hw->cq_dir = debugfs_create_dir("cq", hw->debug_dir);
+	hw->pt_dir = debugfs_create_dir("pt", hw->debug_dir);
+	hw->ct_dir = debugfs_create_dir("ct", hw->debug_dir);
+	hw->ac_dir = debugfs_create_dir("ac", hw->debug_dir);
+
+	debugfs_create_file("tc_cfg", 0444, hw->debug_dir, hw, &tc_cfg_fops);
+	debugfs_create_atomic_t("error_inject", 0644, hw->atu_dir,
+				&hw->atu_error_inject);
+	debugfs_create_atomic_t("odp_requests", 0644, hw->atu_dir,
+				&hw->atu_odp_requests);
+	debugfs_create_atomic_t("atu_odp_fails", 0644, hw->atu_dir,
+				&hw->atu_odp_fails);
+	debugfs_create_atomic_t("atu_prb_expired", 0644, hw->atu_dir,
+				&hw->atu_prb_expired);
+
+	/* ODP Decouple stats */
+	debugfs_create_file("decouple_stats", 0644, hw->atu_dir, hw,
+			    &decouple_stats_fops);
+	debugfs_create_file("odp_sw_decouple", 0644, hw->atu_dir, hw,
+			    &sw_decouple_fops);
+
+	debugfs_create_file("uc_log", 0444, hw->debug_dir, hw, &uc_fops);
+	debugfs_create_file("rmu_eth_filters", 0444, hw->debug_dir, hw,
+			    &cass_rmu_eth_filters_fops);
+
+	/* setup SBL debugfs interface */
+	cass_port_debugfs_init(hw);
+
+	if (cass_version(hw, CASSINI_1))
+		cass_sbl_counters_debugfs_init(hw); /* Port counters */
+
+	cass_dmac_debugfs_init(hw);
+}
+
+void cq_debugfs_create(int id, struct cxi_cq_priv *cq, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv)
+{
+	char name[30];
+	char path[30];
+
+	sprintf(name, "%u", id);
+	cq->debug_dir = debugfs_create_dir(name, hw->cq_dir);
+	sprintf(path, "../../../cq/%u", id);
+	cq->lni_dir = debugfs_create_symlink(name, lni_priv->cq_dir, path);
+	debugfs_create_u32("id", 0444, cq->debug_dir, &cq->cass_cq.idx);
+}
+
+void ct_debugfs_setup(int id, struct cxi_ct_priv *ct_priv, struct cass_dev *hw,
+		      struct cxi_lni_priv *lni_priv)
+{
+	char name[30];
+	char path[30];
+
+	sprintf(name, "%u", id);
+	ct_priv->debug_dir = debugfs_create_dir(name, hw->ct_dir);
+	sprintf(path, "../../../ct/%u", id);
+	ct_priv->lni_dir = debugfs_create_symlink(name, lni_priv->ct_dir,
+						  path);
+}
+
+void ac_debugfs_create(int id, struct cass_ac *cac, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv)
+{
+	char name[30];
+	char path[30];
+
+	sprintf(name, "%u", id);
+	cac->debug_dir = debugfs_create_dir(name, hw->ac_dir);
+	sprintf(path, "../../../ac/%u", id);
+	cac->lni_dir = debugfs_create_symlink(name, lni_priv->ac_dir, path);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.h b/drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.h
new file mode 100644
index 000000000000..26f9bc58ba5e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2018 Hewlett Packard Enterprise Development LP */
+
+#ifndef __CASS_DEBUGFS_H__
+#define __CASS_DEBUGFS_H__
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include <linux/netdevice.h>
+
+#ifdef CONFIG_DEBUG_FS
+
+void cass_port_debugfs_init(struct cass_dev *hw);
+void cass_sbl_counters_debugfs_init(struct cass_dev *hw);
+void domain_debugfs_create(int vni, int pid, struct cass_dev *hw,
+			   struct cxi_domain_priv *domain_priv);
+void pt_debugfs_create(int id, struct cxi_pte_priv *pt, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv);
+void lni_debugfs_create(int id, struct cass_dev *hw, struct cxi_lni_priv *lni_priv);
+void eq_debugfs_create(int id, struct cxi_eq_priv *eq, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv);
+void cass_dmac_debugfs_init(struct cass_dev *hw);
+void cass_probe_debugfs_init(struct cass_dev *hw);
+void cq_debugfs_create(int id, struct cxi_cq_priv *cq, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv);
+void ct_debugfs_setup(int id, struct cxi_ct_priv *ct_priv, struct cass_dev *hw,
+		      struct cxi_lni_priv *lni_priv);
+void ac_debugfs_create(int id, struct cass_ac *cac, struct cass_dev *hw,
+		       struct cxi_lni_priv *lni_priv);
+void svc_service_debugfs_create(struct cass_dev *hw);
+#else
+static inline void cass_port_debugfs_init(struct cass_dev *hw)
+{
+}
+
+static inline void cass_sbl_counters_debugfs_init(struct cass_dev *hw)
+{
+}
+
+static inline void domain_debugfs_create(int vni, int pid, struct cass_dev *hw,
+					 struct cxi_domain_priv *domain_priv)
+{
+}
+
+static inline void pt_debugfs_create(int id, struct cxi_pte_priv *pt, struct cass_dev *hw,
+				     struct cxi_lni_priv *lni_priv)
+{
+}
+
+static inline void lni_debugfs_create(int id, struct cass_dev *hw,
+				      struct cxi_lni_priv *lni_priv)
+{
+}
+
+static inline void eq_debugfs_create(int id, struct cxi_eq_priv *eq, struct cass_dev *hw,
+				     struct cxi_lni_priv *lni_priv)
+{
+}
+
+static inline void cass_dmac_debugfs_init(struct cass_dev *hw)
+{
+}
+
+static inline void cass_probe_debugfs_init(struct cass_dev *hw)
+{
+}
+
+static inline void cq_debugfs_create(int id, struct cxi_cq_priv *cq,
+				     struct cass_dev *hw, struct cxi_lni_priv *lni_priv)
+{
+}
+
+static inline void ct_debugfs_setup(int id, struct cxi_ct_priv *ct_priv, struct cass_dev *hw,
+				    struct cxi_lni_priv *lni_priv)
+{
+}
+
+static inline void ac_debugfs_create(int id, struct cass_ac *cac, struct cass_dev *hw,
+				     struct cxi_lni_priv *lni_priv)
+{
+}
+
+static inline void svc_service_debugfs_create(struct cass_dev *hw)
+{
+}
+#endif
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cass_telem_tables.h b/drivers/net/ethernet/hpe/ss1/cass_telem_tables.h
new file mode 100644
index 000000000000..b9e925172ec3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_telem_tables.h
@@ -0,0 +1,3874 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+/*
+ * Location of each Cassini telemetry item, indexed by item ID. The item
+ * IDs and these locations come from the Cassini hardware description;
+ * user space names the items, the kernel only knows their numbers.
+ */
+
+#ifndef _CASS_TELEM_TABLES_H
+#define _CASS_TELEM_TABLES_H
+
+/* offset, lsb, numbits, type */
+#define TI(o, l, n, t) { .offset = (o), .lsb = (l), .numbits = (n), \
+			 .type = CASSINI_TELEMETRY_ITEM_TYPE_##t }
+#define TU { .type = CASSINI_TELEMETRY_ITEM_TYPE_UNDEFINED }
+
+#define C1_TELEM_TOTAL	1923
+#define C1_TELEM_VALID	1890
+static const struct telem_item c1_items[C1_TELEM_TOTAL] = {
+	TU,
+	TI(0x100205d0, 0, 56, COUNTER),
+	TI(0x100205d8, 0, 56, COUNTER),
+	TI(0x100205e0, 0, 56, COUNTER),
+	TI(0x100205e8, 0, 56, COUNTER),
+	TI(0x100205c8, 0, 56, COUNTER),
+	TI(0x10020590, 0, 56, COUNTER),
+	TI(0x10020508, 0, 56, COUNTER),
+	TI(0x10020510, 0, 56, COUNTER),
+	TI(0x10020518, 0, 56, COUNTER),
+	TI(0x10020520, 0, 56, COUNTER),
+	TI(0x100205b8, 0, 56, COUNTER),
+	TI(0x100204a8, 0, 56, COUNTER),
+	TI(0x100204b0, 0, 56, COUNTER),
+	TI(0x100204b8, 0, 56, COUNTER),
+	TI(0x100204c0, 0, 56, COUNTER),
+	TI(0x100205a8, 0, 56, COUNTER),
+	TI(0x10020588, 0, 56, COUNTER),
+	TI(0x10020430, 0, 56, COUNTER),
+	TI(0x10020438, 0, 56, COUNTER),
+	TI(0x10020440, 0, 56, COUNTER),
+	TI(0x10020448, 0, 56, COUNTER),
+	TI(0x10020450, 0, 56, COUNTER),
+	TI(0x10020458, 0, 56, COUNTER),
+	TI(0x10020460, 0, 56, COUNTER),
+	TI(0x10020468, 0, 56, COUNTER),
+	TI(0x10020470, 0, 56, COUNTER),
+	TI(0x10020478, 0, 56, COUNTER),
+	TI(0x10020480, 0, 56, COUNTER),
+	TI(0x10020488, 0, 56, COUNTER),
+	TI(0x10020410, 0, 56, COUNTER),
+	TI(0x10020418, 0, 56, COUNTER),
+	TI(0x10020420, 0, 56, COUNTER),
+	TI(0x10020428, 0, 56, COUNTER),
+	TI(0x100204a0, 0, 56, COUNTER),
+	TI(0x10020498, 0, 56, COUNTER),
+	TI(0x10020490, 0, 56, COUNTER),
+	TI(0x100204f8, 0, 56, COUNTER),
+	TI(0x100204f0, 0, 56, COUNTER),
+	TI(0x100204e8, 0, 56, COUNTER),
+	TI(0x10020568, 0, 56, COUNTER),
+	TI(0x10020570, 0, 56, COUNTER),
+	TI(0x10020578, 0, 56, COUNTER),
+	TI(0x10020580, 0, 56, COUNTER),
+	TI(0x10020500, 0, 56, COUNTER),
+	TI(0x100205a0, 0, 56, COUNTER),
+	TI(0x10020598, 0, 56, COUNTER),
+	TI(0x100205f0, 0, 56, COUNTER),
+	TI(0x100205f8, 0, 56, COUNTER),
+	TI(0x10020400, 0, 56, COUNTER),
+	TI(0x10020408, 0, 56, COUNTER),
+	TI(0x10020528, 0, 56, COUNTER),
+	TI(0x10020530, 0, 56, COUNTER),
+	TI(0x10020538, 0, 56, COUNTER),
+	TI(0x10020540, 0, 56, COUNTER),
+	TI(0x100204c8, 0, 56, COUNTER),
+	TI(0x100204d0, 0, 56, COUNTER),
+	TI(0x100204d8, 0, 56, COUNTER),
+	TI(0x100204e0, 0, 56, COUNTER),
+	TI(0x10020548, 0, 56, COUNTER),
+	TI(0x10020550, 0, 56, COUNTER),
+	TI(0x10020558, 0, 56, COUNTER),
+	TI(0x10020560, 0, 56, COUNTER),
+	TI(0x100205c0, 0, 56, COUNTER),
+	TI(0x100205b0, 0, 56, COUNTER),
+	TI(0x540, 4, 16, COUNTER),
+	TI(0x100280, 0, 56, COUNTER),
+	TI(0x100288, 0, 56, COUNTER),
+	TI(0x100290, 0, 56, COUNTER),
+	TI(0x100298, 0, 56, COUNTER),
+	TI(0x1002a0, 0, 56, COUNTER),
+	TI(0x1002a8, 0, 56, COUNTER),
+	TI(0x1002b0, 0, 56, COUNTER),
+	TI(0x1002b8, 0, 56, COUNTER),
+	TI(0x1002c0, 0, 56, COUNTER),
+	TI(0x1002c8, 0, 56, COUNTER),
+	TI(0x1002d0, 0, 56, COUNTER),
+	TI(0x1002d8, 0, 56, COUNTER),
+	TI(0x1002e0, 0, 56, COUNTER),
+	TI(0x1002e8, 0, 56, COUNTER),
+	TI(0x1002f0, 0, 56, COUNTER),
+	TI(0x1002f8, 0, 56, COUNTER),
+	TI(0x100130, 0, 56, COUNTER),
+	TI(0x100140, 0, 56, COUNTER),
+	TI(0x100138, 0, 56, COUNTER),
+	TI(0x100148, 0, 56, COUNTER),
+	TI(0x100158, 0, 56, COUNTER),
+	TI(0x100150, 0, 56, COUNTER),
+	TI(0x100300, 0, 56, COUNTER),
+	TI(0x100308, 0, 56, COUNTER),
+	TI(0x100310, 0, 56, COUNTER),
+	TI(0x100318, 0, 56, COUNTER),
+	TI(0x100200, 0, 56, COUNTER),
+	TI(0x100208, 0, 56, COUNTER),
+	TI(0x100210, 0, 56, COUNTER),
+	TI(0x100218, 0, 56, COUNTER),
+	TI(0x100220, 0, 56, COUNTER),
+	TI(0x100228, 0, 56, COUNTER),
+	TI(0x100230, 0, 56, COUNTER),
+	TI(0x100238, 0, 56, COUNTER),
+	TI(0x100240, 0, 56, COUNTER),
+	TI(0x100248, 0, 56, COUNTER),
+	TI(0x100250, 0, 56, COUNTER),
+	TI(0x100258, 0, 56, COUNTER),
+	TI(0x100260, 0, 56, COUNTER),
+	TI(0x100268, 0, 56, COUNTER),
+	TI(0x100270, 0, 56, COUNTER),
+	TI(0x100278, 0, 56, COUNTER),
+	TI(0x100018, 0, 56, COUNTER),
+	TI(0x100010, 0, 56, COUNTER),
+	TI(0x100020, 0, 56, COUNTER),
+	TI(0x100028, 0, 56, COUNTER),
+	TI(0x1001a0, 0, 56, COUNTER),
+	TI(0x1001a8, 0, 56, COUNTER),
+	TI(0x1001b0, 0, 56, COUNTER),
+	TI(0x1001b8, 0, 56, COUNTER),
+	TI(0x100180, 0, 56, COUNTER),
+	TI(0x100188, 0, 56, COUNTER),
+	TI(0x100190, 0, 56, COUNTER),
+	TI(0x100198, 0, 56, COUNTER),
+	TI(0x100160, 0, 56, COUNTER),
+	TI(0x100168, 0, 56, COUNTER),
+	TI(0x100170, 0, 56, COUNTER),
+	TI(0x100178, 0, 56, COUNTER),
+	TI(0x1001c0, 0, 56, COUNTER),
+	TI(0x1001c8, 0, 56, COUNTER),
+	TI(0x1001d0, 0, 56, COUNTER),
+	TI(0x1001d8, 0, 56, COUNTER),
+	TI(0x1003e0, 0, 56, COUNTER),
+	TI(0x1003e8, 0, 56, COUNTER),
+	TI(0x1003f0, 0, 56, COUNTER),
+	TI(0x1003f8, 0, 56, COUNTER),
+	TI(0x1003a0, 0, 56, COUNTER),
+	TI(0x1003a8, 0, 56, COUNTER),
+	TI(0x1003b0, 0, 56, COUNTER),
+	TI(0x1003b8, 0, 56, COUNTER),
+	TI(0x1003c0, 0, 56, COUNTER),
+	TI(0x1003c8, 0, 56, COUNTER),
+	TI(0x1003d0, 0, 56, COUNTER),
+	TI(0x1003d8, 0, 56, COUNTER),
+	TI(0x100380, 0, 56, COUNTER),
+	TI(0x100388, 0, 56, COUNTER),
+	TI(0x100390, 0, 56, COUNTER),
+	TI(0x100398, 0, 56, COUNTER),
+	TI(0x100080, 0, 56, COUNTER),
+	TI(0x100088, 0, 56, COUNTER),
+	TI(0x100090, 0, 56, COUNTER),
+	TI(0x100098, 0, 56, COUNTER),
+	TI(0x100120, 0, 56, COUNTER),
+	TI(0x100128, 0, 56, COUNTER),
+	TI(0x1001e0, 0, 56, COUNTER),
+	TI(0x1001e8, 0, 56, COUNTER),
+	TI(0x1001f0, 0, 56, COUNTER),
+	TI(0x1001f8, 0, 56, COUNTER),
+	TI(0x1000a0, 0, 56, COUNTER),
+	TI(0x1000a8, 0, 56, COUNTER),
+	TI(0x1000b0, 0, 56, COUNTER),
+	TI(0x1000b8, 0, 56, COUNTER),
+	TI(0x100100, 0, 56, COUNTER),
+	TI(0x100110, 0, 56, COUNTER),
+	TI(0x100108, 0, 56, COUNTER),
+	TI(0x100118, 0, 56, COUNTER),
+	TI(0x100060, 0, 56, COUNTER),
+	TI(0x100068, 0, 56, COUNTER),
+	TI(0x100070, 0, 56, COUNTER),
+	TI(0x100078, 0, 56, COUNTER),
+	TI(0x100038, 0, 56, COUNTER),
+	TI(0x100030, 0, 56, COUNTER),
+	TI(0x8b0, 24, 5, UGAUGE),
+	TI(0x8b8, 52, 9, UGAUGE),
+	TI(0x8b8, 40, 9, UGAUGE),
+	TI(0x8b0, 0, 10, UGAUGE),
+	TI(0x8b0, 16, 4, UGAUGE),
+	TI(0x8b8, 0, 5, UGAUGE),
+	TI(0x8b0, 56, 5, UGAUGE),
+	TI(0x8b0, 48, 5, UGAUGE),
+	TI(0x8b8, 24, 3, UGAUGE),
+	TI(0x8b8, 36, 3, UGAUGE),
+	TI(0x8b8, 16, 3, UGAUGE),
+	TI(0x8b0, 40, 7, UGAUGE),
+	TI(0x8b8, 8, 5, UGAUGE),
+	TI(0x8b8, 32, 4, UGAUGE),
+	TI(0x4a000, 0, 56, COUNTER),
+	TI(0x4a008, 0, 56, COUNTER),
+	TI(0x4a010, 0, 56, COUNTER),
+	TI(0x4a018, 0, 56, COUNTER),
+	TI(0x4b000, 0, 41, UGAUGE),
+	TI(0x4b008, 0, 41, UGAUGE),
+	TI(0x4b010, 0, 41, UGAUGE),
+	TI(0x4b018, 0, 41, UGAUGE),
+	TI(0x4b020, 0, 41, UGAUGE),
+	TI(0x4b028, 0, 41, UGAUGE),
+	TI(0x4b030, 0, 41, UGAUGE),
+	TI(0x4b038, 0, 41, UGAUGE),
+	TI(0x4b040, 0, 41, UGAUGE),
+	TI(0x4b048, 0, 41, UGAUGE),
+	TI(0x4b050, 0, 41, UGAUGE),
+	TI(0x4b058, 0, 41, UGAUGE),
+	TI(0x4b060, 0, 41, UGAUGE),
+	TI(0x4b068, 0, 41, UGAUGE),
+	TI(0x4b070, 0, 41, UGAUGE),
+	TI(0x4b078, 0, 41, UGAUGE),
+	TI(0x4b080, 0, 41, UGAUGE),
+	TI(0x4b088, 0, 41, UGAUGE),
+	TI(0x4b090, 0, 41, UGAUGE),
+	TI(0x4b098, 0, 41, UGAUGE),
+	TI(0x4b0a0, 0, 41, UGAUGE),
+	TI(0x4b0a8, 0, 41, UGAUGE),
+	TI(0x4b0b0, 0, 41, UGAUGE),
+	TI(0x4b0b8, 0, 41, UGAUGE),
+	TI(0x4b0c0, 0, 41, UGAUGE),
+	TI(0x4b0c8, 0, 41, UGAUGE),
+	TI(0x4b0d0, 0, 41, UGAUGE),
+	TI(0x4b0d8, 0, 41, UGAUGE),
+	TI(0x4b0e0, 0, 41, UGAUGE),
+	TI(0x4b0e8, 0, 41, UGAUGE),
+	TI(0x4b0f0, 0, 41, UGAUGE),
+	TI(0x4b0f8, 0, 41, UGAUGE),
+	TI(0x4b100, 0, 41, UGAUGE),
+	TI(0x4b108, 0, 41, UGAUGE),
+	TI(0x4b110, 0, 41, UGAUGE),
+	TI(0x4b118, 0, 41, UGAUGE),
+	TI(0x4b120, 0, 41, UGAUGE),
+	TI(0x4b128, 0, 41, UGAUGE),
+	TI(0x4b130, 0, 41, UGAUGE),
+	TI(0x4b138, 0, 41, UGAUGE),
+	TI(0x4b140, 0, 41, UGAUGE),
+	TI(0x4b148, 0, 41, UGAUGE),
+	TI(0x4b150, 0, 41, UGAUGE),
+	TI(0x4b158, 0, 41, UGAUGE),
+	TI(0x4b160, 0, 41, UGAUGE),
+	TI(0x4b168, 0, 41, UGAUGE),
+	TI(0x4b170, 0, 41, UGAUGE),
+	TI(0x4b178, 0, 41, UGAUGE),
+	TI(0x4a020, 0, 56, COUNTER),
+	TI(0x4a028, 0, 56, COUNTER),
+	TI(0x4a030, 0, 56, COUNTER),
+	TI(0x4a038, 0, 56, COUNTER),
+	TI(0x4a040, 0, 56, COUNTER),
+	TI(0x4a048, 0, 56, COUNTER),
+	TI(0x4a050, 0, 56, COUNTER),
+	TI(0x4a058, 0, 56, COUNTER),
+	TI(0x4a080, 0, 56, COUNTER),
+	TI(0x4a088, 0, 56, COUNTER),
+	TI(0x4a090, 0, 56, COUNTER),
+	TI(0x4a098, 0, 56, COUNTER),
+	TI(0x850, 0, 12, UGAUGE),
+	TI(0x858, 0, 12, UGAUGE),
+	TI(0x860, 0, 12, UGAUGE),
+	TI(0x868, 0, 12, UGAUGE),
+	TI(0x4a060, 0, 56, COUNTER),
+	TI(0x4a068, 0, 56, COUNTER),
+	TI(0x4a070, 0, 56, COUNTER),
+	TI(0x4a078, 0, 56, COUNTER),
+	TI(0x100008, 0, 56, COUNTER),
+	TI(0x100000, 0, 56, COUNTER),
+	TI(0x1000e0, 0, 56, COUNTER),
+	TI(0x1000e8, 0, 56, COUNTER),
+	TI(0x1000f0, 0, 56, COUNTER),
+	TI(0x1000f8, 0, 56, COUNTER),
+	TI(0x1000c0, 0, 56, COUNTER),
+	TI(0x1000c8, 0, 56, COUNTER),
+	TI(0x1000d0, 0, 56, COUNTER),
+	TI(0x1000d8, 0, 56, COUNTER),
+	TI(0x100040, 0, 56, COUNTER),
+	TI(0x100b40, 0, 56, COUNTER),
+	TI(0x100b48, 0, 56, COUNTER),
+	TI(0x100b50, 0, 56, COUNTER),
+	TI(0x100b58, 0, 56, COUNTER),
+	TI(0x100d20, 0, 56, COUNTER),
+	TI(0x100aa0, 0, 56, COUNTER),
+	TI(0x100aa8, 0, 56, COUNTER),
+	TI(0x100ab0, 0, 56, COUNTER),
+	TI(0x100ab8, 0, 56, COUNTER),
+	TI(0x100c90, 0, 56, COUNTER),
+	TI(0x100c98, 0, 56, COUNTER),
+	TI(0x100c58, 0, 56, COUNTER),
+	TI(0x100c60, 0, 56, COUNTER),
+	TI(0x100c68, 0, 56, COUNTER),
+	TI(0x100b20, 0, 56, COUNTER),
+	TI(0x100b28, 0, 56, COUNTER),
+	TI(0x100b30, 0, 56, COUNTER),
+	TI(0x100b38, 0, 56, COUNTER),
+	TI(0x100b00, 0, 56, COUNTER),
+	TI(0x100b08, 0, 56, COUNTER),
+	TI(0x100b10, 0, 56, COUNTER),
+	TI(0x100b18, 0, 56, COUNTER),
+	TI(0x100e50, 0, 56, COUNTER),
+	TI(0x100e60, 0, 56, COUNTER),
+	TI(0x100e58, 0, 56, COUNTER),
+	TI(0x100e68, 0, 56, COUNTER),
+	TI(0x100e90, 0, 56, COUNTER),
+	TI(0x100a80, 0, 56, COUNTER),
+	TI(0x100a88, 0, 56, COUNTER),
+	TI(0x100a90, 0, 56, COUNTER),
+	TI(0x100a98, 0, 56, COUNTER),
+	TI(0x100b60, 0, 56, COUNTER),
+	TI(0x100b68, 0, 56, COUNTER),
+	TI(0x100b70, 0, 56, COUNTER),
+	TI(0x100b78, 0, 56, COUNTER),
+	TI(0x100d10, 0, 56, COUNTER),
+	TI(0x100cb0, 0, 56, COUNTER),
+	TI(0x100cb8, 0, 56, COUNTER),
+	TI(0x100d00, 0, 56, COUNTER),
+	TI(0x100d08, 0, 56, COUNTER),
+	TI(0x100cd0, 0, 56, COUNTER),
+	TI(0x100cd8, 0, 56, COUNTER),
+	TI(0x100d18, 0, 56, COUNTER),
+	TI(0x100cc0, 0, 56, COUNTER),
+	TI(0x100cc8, 0, 56, COUNTER),
+	TI(0x100ca8, 0, 56, COUNTER),
+	TI(0x100ce0, 0, 56, COUNTER),
+	TI(0x100ce8, 0, 56, COUNTER),
+	TI(0x100cf0, 0, 56, COUNTER),
+	TI(0x100cf8, 0, 56, COUNTER),
+	TI(0x100d88, 0, 56, COUNTER),
+	TI(0x100d50, 0, 56, COUNTER),
+	TI(0x100d70, 0, 56, COUNTER),
+	TI(0x100dc8, 0, 56, COUNTER),
+	TI(0x100e30, 0, 56, COUNTER),
+	TI(0x100e20, 0, 56, COUNTER),
+	TI(0x100dc0, 0, 56, COUNTER),
+	TI(0x100dd8, 0, 56, COUNTER),
+	TI(0x100d58, 0, 56, COUNTER),
+	TI(0x100d78, 0, 56, COUNTER),
+	TI(0x100d48, 0, 56, COUNTER),
+	TI(0x100d68, 0, 56, COUNTER),
+	TI(0x100d98, 0, 56, COUNTER),
+	TI(0x100de8, 0, 56, COUNTER),
+	TI(0x100e38, 0, 56, COUNTER),
+	TI(0x100de0, 0, 56, COUNTER),
+	TI(0x100d40, 0, 56, COUNTER),
+	TI(0x100d60, 0, 56, COUNTER),
+	TI(0x100db8, 0, 56, COUNTER),
+	TI(0x100d90, 0, 56, COUNTER),
+	TI(0x100da0, 0, 56, COUNTER),
+	TI(0x100d80, 0, 56, COUNTER),
+	TI(0x100da8, 0, 56, COUNTER),
+	TI(0x100e28, 0, 56, COUNTER),
+	TI(0x100dd0, 0, 56, COUNTER),
+	TI(0x100db0, 0, 56, COUNTER),
+	TI(0x100a40, 0, 56, COUNTER),
+	TI(0x100a48, 0, 56, COUNTER),
+	TI(0x100a50, 0, 56, COUNTER),
+	TI(0x100a58, 0, 56, COUNTER),
+	TI(0x100a60, 0, 56, COUNTER),
+	TI(0x100a68, 0, 56, COUNTER),
+	TI(0x100a70, 0, 56, COUNTER),
+	TI(0x100a78, 0, 56, COUNTER),
+	TI(0x100a20, 0, 56, COUNTER),
+	TI(0x100a28, 0, 56, COUNTER),
+	TI(0x100a30, 0, 56, COUNTER),
+	TI(0x100a38, 0, 56, COUNTER),
+	TI(0x100a00, 0, 56, COUNTER),
+	TI(0x100a08, 0, 56, COUNTER),
+	TI(0x100a10, 0, 56, COUNTER),
+	TI(0x100a18, 0, 56, COUNTER),
+	TI(0x100ae0, 0, 56, COUNTER),
+	TI(0x100ae8, 0, 56, COUNTER),
+	TI(0x100af0, 0, 56, COUNTER),
+	TI(0x100af8, 0, 56, COUNTER),
+	TI(0x100c80, 0, 56, COUNTER),
+	TI(0x100c88, 0, 56, COUNTER),
+	TI(0x100c40, 0, 56, COUNTER),
+	TI(0x100c48, 0, 56, COUNTER),
+	TI(0x100c50, 0, 56, COUNTER),
+	TI(0x100bc8, 0, 56, COUNTER),
+	TI(0x100bd8, 0, 56, COUNTER),
+	TI(0x100bc0, 0, 56, COUNTER),
+	TI(0x100bb0, 0, 56, COUNTER),
+	TI(0x100bb8, 0, 56, COUNTER),
+	TI(0x100bd0, 0, 56, COUNTER),
+	TI(0x100b98, 0, 56, COUNTER),
+	TI(0x100ba8, 0, 56, COUNTER),
+	TI(0x100b90, 0, 56, COUNTER),
+	TI(0x100b80, 0, 56, COUNTER),
+	TI(0x100b88, 0, 56, COUNTER),
+	TI(0x100ba0, 0, 56, COUNTER),
+	TI(0x100ca0, 0, 56, COUNTER),
+	TI(0x100e40, 0, 56, COUNTER),
+	TI(0x100e48, 0, 56, COUNTER),
+	TI(0x100bf8, 0, 56, COUNTER),
+	TI(0x100c08, 0, 56, COUNTER),
+	TI(0x100bf0, 0, 56, COUNTER),
+	TI(0x100be0, 0, 56, COUNTER),
+	TI(0x100be8, 0, 56, COUNTER),
+	TI(0x100c00, 0, 56, COUNTER),
+	TI(0x100ac0, 0, 56, COUNTER),
+	TI(0x100ac8, 0, 56, COUNTER),
+	TI(0x100ad0, 0, 56, COUNTER),
+	TI(0x100ad8, 0, 56, COUNTER),
+	TI(0x100c28, 0, 56, COUNTER),
+	TI(0x100c38, 0, 56, COUNTER),
+	TI(0x100c20, 0, 56, COUNTER),
+	TI(0x100c10, 0, 56, COUNTER),
+	TI(0x100c18, 0, 56, COUNTER),
+	TI(0x100c30, 0, 56, COUNTER),
+	TI(0x100e78, 0, 56, COUNTER),
+	TI(0x100e80, 0, 56, COUNTER),
+	TI(0x8800808, 0, 9, UGAUGE),
+	TI(0x8800808, 16, 9, UGAUGE),
+	TI(0x100e88, 0, 56, COUNTER),
+	TI(0x100d30, 0, 56, COUNTER),
+	TI(0x100d38, 0, 56, COUNTER),
+	TI(0x100d28, 0, 56, COUNTER),
+	TI(0x100c70, 0, 56, COUNTER),
+	TI(0x100c78, 0, 56, COUNTER),
+	TI(0x100e70, 0, 56, COUNTER),
+	TI(0x10004b8, 4, 16, COUNTER),
+	TI(0x1002000, 0, 56, COUNTER),
+	TI(0x10020c0, 0, 56, COUNTER),
+	TI(0x10020c8, 0, 56, COUNTER),
+	TI(0x10020d0, 0, 56, COUNTER),
+	TI(0x10020d8, 0, 56, COUNTER),
+	TI(0x10020e0, 0, 56, COUNTER),
+	TI(0x10020e8, 0, 56, COUNTER),
+	TI(0x10020f0, 0, 56, COUNTER),
+	TI(0x10020f8, 0, 56, COUNTER),
+	TI(0x10022b8, 0, 56, COUNTER),
+	TI(0x10022b0, 0, 56, COUNTER),
+	TI(0x10022a8, 0, 56, COUNTER),
+	TI(0x1002290, 0, 56, COUNTER),
+	TI(0x1002298, 0, 56, COUNTER),
+	TI(0x1002288, 0, 56, COUNTER),
+	TI(0x10022a0, 0, 56, COUNTER),
+	TI(0x1002280, 0, 56, COUNTER),
+	TI(0x1002270, 0, 56, COUNTER),
+	TI(0x1002278, 0, 56, COUNTER),
+	TI(0x1002620, 0, 56, COUNTER),
+	TU,
+	TI(0x1002630, 0, 56, COUNTER),
+	TI(0x1002608, 0, 56, COUNTER),
+	TI(0x1002660, 0, 56, COUNTER),
+	TI(0x1002648, 0, 56, COUNTER),
+	TI(0x1002688, 0, 56, COUNTER),
+	TI(0x1002678, 0, 56, COUNTER),
+	TI(0x1002668, 0, 56, COUNTER),
+	TI(0x1002670, 0, 56, COUNTER),
+	TI(0x1002610, 0, 56, COUNTER),
+	TI(0x1002618, 0, 56, COUNTER),
+	TI(0x10025f8, 0, 56, COUNTER),
+	TI(0x1002600, 0, 56, COUNTER),
+	TI(0x1002628, 0, 56, COUNTER),
+	TI(0x1002650, 0, 56, COUNTER),
+	TI(0x1002638, 0, 56, COUNTER),
+	TI(0x1002658, 0, 56, COUNTER),
+	TI(0x1002640, 0, 56, COUNTER),
+	TI(0x1002690, 0, 56, COUNTER),
+	TI(0x1002680, 0, 56, COUNTER),
+	TI(0x10025a0, 0, 56, COUNTER),
+	TU,
+	TU,
+	TU,
+	TI(0x10025b0, 0, 56, COUNTER),
+	TI(0x1002590, 0, 56, COUNTER),
+	TI(0x1002598, 0, 56, COUNTER),
+	TU,
+	TU,
+	TI(0x1002580, 0, 56, COUNTER),
+	TI(0x1002588, 0, 56, COUNTER),
+	TI(0x10025a8, 0, 56, COUNTER),
+	TI(0x10025e8, 0, 56, COUNTER),
+	TI(0x10025c0, 0, 56, COUNTER),
+	TI(0x10025c8, 0, 56, COUNTER),
+	TI(0x10025b8, 0, 56, COUNTER),
+	TI(0x10025d8, 0, 56, COUNTER),
+	TI(0x10025e0, 0, 56, COUNTER),
+	TI(0x10025d0, 0, 56, COUNTER),
+	TI(0x10025f0, 0, 56, COUNTER),
+	TI(0x1002570, 0, 56, COUNTER),
+	TI(0x1002568, 0, 56, COUNTER),
+	TI(0x1002578, 0, 56, COUNTER),
+	TU,
+	TI(0x10024c0, 0, 56, COUNTER),
+	TI(0x10024c8, 0, 56, COUNTER),
+	TI(0x10024d0, 0, 56, COUNTER),
+	TI(0x10024d8, 0, 56, COUNTER),
+	TI(0x10024e0, 0, 56, COUNTER),
+	TI(0x10024e8, 0, 56, COUNTER),
+	TI(0x10024f0, 0, 56, COUNTER),
+	TI(0x10024f8, 0, 56, COUNTER),
+	TI(0x1002480, 0, 56, COUNTER),
+	TI(0x1002488, 0, 56, COUNTER),
+	TI(0x1002490, 0, 56, COUNTER),
+	TI(0x1002498, 0, 56, COUNTER),
+	TI(0x10024a0, 0, 56, COUNTER),
+	TI(0x10024a8, 0, 56, COUNTER),
+	TI(0x10024b0, 0, 56, COUNTER),
+	TI(0x10024b8, 0, 56, COUNTER),
+	TI(0x10022c0, 0, 56, COUNTER),
+	TI(0x10022c8, 0, 56, COUNTER),
+	TI(0x10022d0, 0, 56, COUNTER),
+	TI(0x10022d8, 0, 56, COUNTER),
+	TI(0x10022e0, 0, 56, COUNTER),
+	TI(0x10022e8, 0, 56, COUNTER),
+	TI(0x10022f0, 0, 56, COUNTER),
+	TI(0x10022f8, 0, 56, COUNTER),
+	TI(0x10023d0, 0, 56, COUNTER),
+	TI(0x10023c8, 0, 56, COUNTER),
+	TI(0x1002300, 0, 56, COUNTER),
+	TI(0x1002308, 0, 56, COUNTER),
+	TI(0x1002310, 0, 56, COUNTER),
+	TI(0x1002318, 0, 56, COUNTER),
+	TI(0x1002320, 0, 56, COUNTER),
+	TI(0x1002328, 0, 56, COUNTER),
+	TI(0x1002330, 0, 56, COUNTER),
+	TI(0x1002338, 0, 56, COUNTER),
+	TI(0x1002510, 0, 56, COUNTER),
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TI(0x1002528, 0, 56, COUNTER),
+	TI(0x1002530, 0, 56, COUNTER),
+	TI(0x1002538, 0, 56, COUNTER),
+	TI(0x1002540, 0, 56, COUNTER),
+	TI(0x1002548, 0, 56, COUNTER),
+	TI(0x1002550, 0, 56, COUNTER),
+	TI(0x1002558, 0, 56, COUNTER),
+	TI(0x1002560, 0, 56, COUNTER),
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TU,
+	TI(0x1002520, 0, 56, COUNTER),
+	TI(0x1002500, 0, 56, COUNTER),
+	TI(0x1002508, 0, 56, COUNTER),
+	TI(0x1002518, 0, 56, COUNTER),
+	TI(0x1002080, 0, 56, COUNTER),
+	TI(0x1002088, 0, 56, COUNTER),
+	TI(0x1002090, 0, 56, COUNTER),
+	TI(0x1002098, 0, 56, COUNTER),
+	TI(0x10020a0, 0, 56, COUNTER),
+	TI(0x10020a8, 0, 56, COUNTER),
+	TI(0x10020b0, 0, 56, COUNTER),
+	TI(0x10020b8, 0, 56, COUNTER),
+	TI(0x1002440, 0, 56, COUNTER),
+	TI(0x1002448, 0, 56, COUNTER),
+	TI(0x1002450, 0, 56, COUNTER),
+	TI(0x1002458, 0, 56, COUNTER),
+	TI(0x1002460, 0, 56, COUNTER),
+	TI(0x1002468, 0, 56, COUNTER),
+	TI(0x1002470, 0, 56, COUNTER),
+	TI(0x1002478, 0, 56, COUNTER),
+	TI(0x1002400, 0, 56, COUNTER),
+	TI(0x1002408, 0, 56, COUNTER),
+	TI(0x1002410, 0, 56, COUNTER),
+	TI(0x1002418, 0, 56, COUNTER),
+	TI(0x1002420, 0, 56, COUNTER),
+	TI(0x1002428, 0, 56, COUNTER),
+	TI(0x1002430, 0, 56, COUNTER),
+	TI(0x1002438, 0, 56, COUNTER),
+	TI(0x10021a8, 0, 56, COUNTER),
+	TI(0x10021b0, 0, 56, COUNTER),
+	TI(0x1002200, 0, 56, COUNTER),
+	TI(0x1002208, 0, 56, COUNTER),
+	TI(0x1002210, 0, 56, COUNTER),
+	TI(0x1002218, 0, 56, COUNTER),
+	TI(0x1002220, 0, 56, COUNTER),
+	TI(0x1002228, 0, 56, COUNTER),
+	TI(0x1002230, 0, 56, COUNTER),
+	TI(0x1002238, 0, 56, COUNTER),
+	TI(0x1002240, 0, 56, COUNTER),
+	TI(0x1002248, 0, 56, COUNTER),
+	TI(0x1002250, 0, 56, COUNTER),
+	TI(0x1002258, 0, 56, COUNTER),
+	TI(0x1002260, 0, 56, COUNTER),
+	TI(0x1002268, 0, 56, COUNTER),
+	TI(0x10021d0, 0, 56, COUNTER),
+	TI(0x10021b8, 0, 56, COUNTER),
+	TI(0x10021d8, 0, 56, COUNTER),
+	TI(0x1002198, 0, 56, COUNTER),
+	TI(0x10021e8, 0, 56, COUNTER),
+	TI(0x10021c8, 0, 56, COUNTER),
+	TI(0x10021c0, 0, 56, COUNTER),
+	TI(0x10021a0, 0, 56, COUNTER),
+	TI(0x10021e0, 0, 56, COUNTER),
+	TI(0x10021f0, 0, 56, COUNTER),
+	TI(0x10021f8, 0, 56, COUNTER),
+	TI(0x1002340, 0, 56, COUNTER),
+	TI(0x1002348, 0, 56, COUNTER),
+	TI(0x1002350, 0, 56, COUNTER),
+	TI(0x1002358, 0, 56, COUNTER),
+	TI(0x1002360, 0, 56, COUNTER),
+	TI(0x1002368, 0, 56, COUNTER),
+	TI(0x1002370, 0, 56, COUNTER),
+	TI(0x1002378, 0, 56, COUNTER),
+	TI(0x10023c0, 0, 56, COUNTER),
+	TI(0x1002020, 0, 56, COUNTER),
+	TI(0x1002040, 0, 56, COUNTER),
+	TI(0x1002048, 0, 56, COUNTER),
+	TI(0x1002050, 0, 56, COUNTER),
+	TI(0x1002058, 0, 56, COUNTER),
+	TI(0x1002060, 0, 56, COUNTER),
+	TI(0x1002068, 0, 56, COUNTER),
+	TI(0x1002070, 0, 56, COUNTER),
+	TI(0x1002078, 0, 56, COUNTER),
+	TI(0x1001048, 0, 56, COUNTER),
+	TI(0x1001060, 0, 56, COUNTER),
+	TI(0x1001050, 0, 56, COUNTER),
+	TI(0x1001058, 0, 56, COUNTER),
+	TI(0x1001068, 0, 56, COUNTER),
+	TI(0x1001040, 0, 56, COUNTER),
+	TI(0x1001018, 0, 56, COUNTER),
+	TI(0x1001030, 0, 56, COUNTER),
+	TI(0x1001020, 0, 56, COUNTER),
+	TI(0x1001028, 0, 56, COUNTER),
+	TI(0x1001038, 0, 56, COUNTER),
+	TI(0x1001010, 0, 56, COUNTER),
+	TI(0x1002138, 0, 56, COUNTER),
+	TI(0x1002140, 0, 56, COUNTER),
+	TI(0x1002148, 0, 56, COUNTER),
+	TI(0x1002150, 0, 56, COUNTER),
+	TI(0x1002158, 0, 56, COUNTER),
+	TI(0x1002160, 0, 56, COUNTER),
+	TI(0x1002168, 0, 56, COUNTER),
+	TI(0x1002170, 0, 56, COUNTER),
+	TI(0x1002178, 0, 56, COUNTER),
+	TI(0x1002180, 0, 56, COUNTER),
+	TI(0x1002188, 0, 56, COUNTER),
+	TI(0x1002190, 0, 56, COUNTER),
+	TI(0x1002120, 0, 56, COUNTER),
+	TI(0x1002100, 0, 56, COUNTER),
+	TI(0x1002128, 0, 56, COUNTER),
+	TI(0x1002108, 0, 56, COUNTER),
+	TI(0x1002130, 0, 56, COUNTER),
+	TI(0x10023e8, 0, 56, COUNTER),
+	TI(0x10023f8, 0, 56, COUNTER),
+	TI(0x1002380, 0, 56, COUNTER),
+	TI(0x1002388, 0, 56, COUNTER),
+	TI(0x1002390, 0, 56, COUNTER),
+	TI(0x1002398, 0, 56, COUNTER),
+	TI(0x10023a0, 0, 56, COUNTER),
+	TI(0x10023a8, 0, 56, COUNTER),
+	TI(0x10023b0, 0, 56, COUNTER),
+	TI(0x10023b8, 0, 56, COUNTER),
+	TI(0x1002110, 0, 56, COUNTER),
+	TI(0x1002118, 0, 56, COUNTER),
+	TI(0x1002010, 0, 56, COUNTER),
+	TI(0x10023e0, 0, 56, COUNTER),
+	TI(0x10023f0, 0, 56, COUNTER),
+	TI(0x1002008, 0, 56, COUNTER),
+	TI(0x9870900, 0, 56, COUNTER),
+	TI(0x98708f0, 0, 56, COUNTER),
+	TI(0x9870958, 0, 56, COUNTER),
+	TI(0x98708c8, 0, 56, COUNTER),
+	TI(0x98708d0, 0, 56, COUNTER),
+	TI(0x98708d8, 0, 56, COUNTER),
+	TI(0x98708a0, 0, 56, COUNTER),
+	TI(0x98708a8, 0, 56, COUNTER),
+	TI(0x98708b0, 0, 56, COUNTER),
+	TI(0x98708e0, 0, 56, COUNTER),
+	TI(0x9870850, 0, 56, COUNTER),
+	TI(0x9870858, 0, 56, COUNTER),
+	TI(0x9870870, 0, 56, COUNTER),
+	TI(0x9870878, 0, 56, COUNTER),
+	TI(0x9870840, 0, 56, COUNTER),
+	TI(0x9870848, 0, 56, COUNTER),
+	TI(0x9870880, 0, 56, COUNTER),
+	TI(0x9870888, 0, 56, COUNTER),
+	TI(0x9870860, 0, 56, COUNTER),
+	TI(0x9870868, 0, 56, COUNTER),
+	TI(0x98708b8, 0, 56, COUNTER),
+	TI(0x98708c0, 0, 56, COUNTER),
+	TI(0x98708e8, 0, 56, COUNTER),
+	TI(0x9870898, 0, 56, COUNTER),
+	TI(0x9870890, 0, 56, COUNTER),
+	TI(0x9870920, 0, 56, COUNTER),
+	TI(0x9870928, 0, 56, COUNTER),
+	TI(0x9870908, 0, 56, COUNTER),
+	TI(0x9870918, 0, 56, COUNTER),
+	TI(0x9870930, 0, 56, COUNTER),
+	TI(0x9870948, 0, 56, COUNTER),
+	TI(0x9870938, 0, 56, COUNTER),
+	TI(0x9870940, 0, 56, COUNTER),
+	TI(0x9870950, 0, 56, COUNTER),
+	TI(0x9870910, 0, 56, COUNTER),
+	TI(0x98708f8, 0, 56, COUNTER),
+	TI(0x98709f0, 0, 56, COUNTER),
+	TI(0x98709d8, 0, 56, COUNTER),
+	TI(0x98709e0, 0, 56, COUNTER),
+	TI(0x98709e8, 0, 56, COUNTER),
+	TI(0x9870a00, 0, 56, COUNTER),
+	TI(0x9870a08, 0, 56, COUNTER),
+	TI(0x98709f8, 0, 56, COUNTER),
+	TI(0x98709b8, 0, 56, COUNTER),
+	TI(0x98709c0, 0, 56, COUNTER),
+	TI(0x98709c8, 0, 56, COUNTER),
+	TI(0x98709b0, 0, 56, COUNTER),
+	TI(0x98709a0, 0, 56, COUNTER),
+	TI(0x9870a18, 0, 56, COUNTER),
+	TI(0x9870a10, 0, 56, COUNTER),
+	TI(0x98709d0, 0, 56, COUNTER),
+	TI(0x9870998, 0, 56, COUNTER),
+	TI(0x9870988, 0, 56, COUNTER),
+	TI(0x9870990, 0, 56, COUNTER),
+	TI(0x9870980, 0, 56, COUNTER),
+	TI(0x98709a8, 0, 56, COUNTER),
+	TI(0x9870548, 0, 56, COUNTER),
+	TI(0x9870528, 0, 56, COUNTER),
+	TI(0x9870568, 0, 56, COUNTER),
+	TI(0x9870538, 0, 56, COUNTER),
+	TI(0x9870540, 0, 56, COUNTER),
+	TI(0x9870530, 0, 56, COUNTER),
+	TI(0x9870500, 0, 56, COUNTER),
+	TI(0x9870508, 0, 56, COUNTER),
+	TI(0x9870558, 0, 56, COUNTER),
+	TI(0x9870560, 0, 56, COUNTER),
+	TI(0x9870700, 0, 56, COUNTER),
+	TI(0x9870708, 0, 56, COUNTER),
+	TI(0x9870710, 0, 56, COUNTER),
+	TI(0x9870718, 0, 56, COUNTER),
+	TI(0x9870720, 0, 56, COUNTER),
+	TI(0x9870728, 0, 56, COUNTER),
+	TI(0x9870730, 0, 56, COUNTER),
+	TI(0x9870738, 0, 56, COUNTER),
+	TI(0x9870520, 0, 56, COUNTER),
+	TI(0x9870550, 0, 56, COUNTER),
+	TI(0x9870640, 0, 56, COUNTER),
+	TI(0x9870590, 0, 56, COUNTER),
+	TI(0x9870598, 0, 56, COUNTER),
+	TI(0x9870628, 0, 56, COUNTER),
+	TI(0x9870610, 0, 56, COUNTER),
+	TI(0x9870618, 0, 56, COUNTER),
+	TI(0x9870620, 0, 56, COUNTER),
+	TI(0x9870630, 0, 56, COUNTER),
+	TI(0x9870638, 0, 56, COUNTER),
+	TI(0x98705d8, 0, 56, COUNTER),
+	TI(0x98705c8, 0, 56, COUNTER),
+	TI(0x98705a8, 0, 56, COUNTER),
+	TI(0x9870608, 0, 56, COUNTER),
+	TI(0x98705f8, 0, 56, COUNTER),
+	TI(0x9870600, 0, 56, COUNTER),
+	TI(0x98705e0, 0, 56, COUNTER),
+	TI(0x98705d0, 0, 56, COUNTER),
+	TI(0x98705c0, 0, 56, COUNTER),
+	TI(0x98705f0, 0, 56, COUNTER),
+	TI(0x98705b0, 0, 56, COUNTER),
+	TI(0x98705b8, 0, 56, COUNTER),
+	TI(0x98705a0, 0, 56, COUNTER),
+	TI(0x9870648, 0, 56, COUNTER),
+	TI(0x9870650, 0, 56, COUNTER),
+	TI(0x9870588, 0, 56, COUNTER),
+	TI(0x9870580, 0, 56, COUNTER),
+	TI(0x98705e8, 0, 56, COUNTER),
+	TI(0x9870740, 0, 56, COUNTER),
+	TI(0x9870748, 0, 56, COUNTER),
+	TI(0x9870750, 0, 56, COUNTER),
+	TI(0x9870758, 0, 56, COUNTER),
+	TI(0x9870760, 0, 56, COUNTER),
+	TI(0x9870768, 0, 56, COUNTER),
+	TI(0x9870770, 0, 56, COUNTER),
+	TI(0x9870778, 0, 56, COUNTER),
+	TI(0x9870780, 0, 56, COUNTER),
+	TI(0x9870788, 0, 56, COUNTER),
+	TI(0x9870790, 0, 56, COUNTER),
+	TI(0x9870798, 0, 56, COUNTER),
+	TI(0x98707a0, 0, 56, COUNTER),
+	TI(0x98707a8, 0, 56, COUNTER),
+	TI(0x98707b0, 0, 56, COUNTER),
+	TI(0x98707b8, 0, 56, COUNTER),
+	TI(0x98707c0, 0, 56, COUNTER),
+	TI(0x98707c8, 0, 56, COUNTER),
+	TI(0x98707d0, 0, 56, COUNTER),
+	TI(0x98707d8, 0, 56, COUNTER),
+	TI(0x98707e0, 0, 56, COUNTER),
+	TI(0x98707e8, 0, 56, COUNTER),
+	TI(0x98707f0, 0, 56, COUNTER),
+	TI(0x98707f8, 0, 56, COUNTER),
+	TI(0x9870800, 0, 56, COUNTER),
+	TI(0x9870808, 0, 56, COUNTER),
+	TI(0x9870810, 0, 56, COUNTER),
+	TI(0x9870818, 0, 56, COUNTER),
+	TI(0x9870820, 0, 56, COUNTER),
+	TI(0x9870828, 0, 56, COUNTER),
+	TI(0x9870830, 0, 56, COUNTER),
+	TI(0x9870838, 0, 56, COUNTER),
+	TI(0x9870040, 0, 56, COUNTER),
+	TI(0x9870320, 0, 56, COUNTER),
+	TI(0x9870328, 0, 56, COUNTER),
+	TI(0x9870330, 0, 56, COUNTER),
+	TI(0x9870338, 0, 56, COUNTER),
+	TI(0x9870340, 0, 56, COUNTER),
+	TI(0x9870348, 0, 56, COUNTER),
+	TI(0x9870350, 0, 56, COUNTER),
+	TI(0x9870358, 0, 56, COUNTER),
+	TI(0x9800448, 4, 16, COUNTER),
+	TI(0x9800a00, 32, 15, UGAUGE),
+	TI(0x9800a08, 32, 15, UGAUGE),
+	TI(0x9800a10, 32, 15, UGAUGE),
+	TI(0x9800a18, 32, 15, UGAUGE),
+	TI(0x9800a00, 0, 15, UGAUGE),
+	TI(0x9800a08, 0, 15, UGAUGE),
+	TI(0x9800a10, 0, 15, UGAUGE),
+	TI(0x9800a18, 0, 15, UGAUGE),
+	TI(0x9800a00, 48, 15, UGAUGE),
+	TI(0x9800a08, 48, 15, UGAUGE),
+	TI(0x9800a10, 48, 15, UGAUGE),
+	TI(0x9800a18, 48, 15, UGAUGE),
+	TI(0x9800a00, 16, 15, UGAUGE),
+	TI(0x9800a08, 16, 15, UGAUGE),
+	TI(0x9800a10, 16, 15, UGAUGE),
+	TI(0x9800a18, 16, 15, UGAUGE),
+	TI(0x98701f8, 0, 56, COUNTER),
+	TI(0x98701f0, 0, 56, COUNTER),
+	TI(0x98701e8, 0, 56, COUNTER),
+	TI(0x98701c0, 0, 56, COUNTER),
+	TI(0x98701c8, 0, 56, COUNTER),
+	TI(0x98701d0, 0, 56, COUNTER),
+	TI(0x98701d8, 0, 56, COUNTER),
+	TI(0x98701e0, 0, 56, COUNTER),
+	TI(0x98700d0, 0, 56, COUNTER),
+	TI(0x98700b8, 0, 56, COUNTER),
+	TI(0x9870078, 0, 56, COUNTER),
+	TI(0x98700c8, 0, 56, COUNTER),
+	TI(0x98700c0, 0, 56, COUNTER),
+	TI(0x98700b0, 0, 56, COUNTER),
+	TI(0x98700a0, 0, 56, COUNTER),
+	TI(0x9870110, 0, 56, COUNTER),
+	TI(0x98700d8, 0, 56, COUNTER),
+	TI(0x98700e0, 0, 56, COUNTER),
+	TI(0x98700e8, 0, 56, COUNTER),
+	TI(0x98700a8, 0, 56, COUNTER),
+	TI(0x9870090, 0, 56, COUNTER),
+	TI(0x9870080, 0, 56, COUNTER),
+	TI(0x9870098, 0, 56, COUNTER),
+	TI(0x9870088, 0, 56, COUNTER),
+	TI(0x9870108, 0, 56, COUNTER),
+	TI(0x9870118, 0, 56, COUNTER),
+	TI(0x98700f0, 0, 56, COUNTER),
+	TI(0x98700f8, 0, 56, COUNTER),
+	TI(0x9870100, 0, 56, COUNTER),
+	TI(0x9870168, 0, 56, COUNTER),
+	TI(0x9870178, 0, 56, COUNTER),
+	TI(0x9870158, 0, 56, COUNTER),
+	TI(0x9870190, 0, 56, COUNTER),
+	TI(0x9870148, 0, 56, COUNTER),
+	TI(0x9870188, 0, 56, COUNTER),
+	TI(0x9870180, 0, 56, COUNTER),
+	TI(0x98701a0, 0, 56, COUNTER),
+	TI(0x9870198, 0, 56, COUNTER),
+	TI(0x9870008, 0, 56, COUNTER),
+	TI(0x9870048, 0, 56, COUNTER),
+	TI(0x9870038, 0, 56, COUNTER),
+	TI(0x9870010, 0, 56, COUNTER),
+	TI(0x9870018, 0, 56, COUNTER),
+	TI(0x98702a0, 0, 56, COUNTER),
+	TI(0x98702a8, 0, 56, COUNTER),
+	TI(0x98702b0, 0, 56, COUNTER),
+	TI(0x98702b8, 0, 56, COUNTER),
+	TI(0x98702e0, 0, 56, COUNTER),
+	TI(0x98702e8, 0, 56, COUNTER),
+	TI(0x98702f0, 0, 56, COUNTER),
+	TI(0x98702f8, 0, 56, COUNTER),
+	TI(0x98702c0, 0, 56, COUNTER),
+	TI(0x98702c8, 0, 56, COUNTER),
+	TI(0x98702d0, 0, 56, COUNTER),
+	TI(0x98702d8, 0, 56, COUNTER),
+	TI(0x9870300, 0, 56, COUNTER),
+	TI(0x9870308, 0, 56, COUNTER),
+	TI(0x9870310, 0, 56, COUNTER),
+	TI(0x9870318, 0, 56, COUNTER),
+	TI(0x9870240, 0, 56, COUNTER),
+	TI(0x9870248, 0, 56, COUNTER),
+	TI(0x9870250, 0, 56, COUNTER),
+	TI(0x9870258, 0, 56, COUNTER),
+	TI(0x9870260, 0, 56, COUNTER),
+	TI(0x9870268, 0, 56, COUNTER),
+	TI(0x9870270, 0, 56, COUNTER),
+	TI(0x9870278, 0, 56, COUNTER),
+	TI(0x9870280, 0, 56, COUNTER),
+	TI(0x9870288, 0, 56, COUNTER),
+	TI(0x9870290, 0, 56, COUNTER),
+	TI(0x9870298, 0, 56, COUNTER),
+	TI(0x9870440, 0, 56, COUNTER),
+	TI(0x9870448, 0, 56, COUNTER),
+	TI(0x9870450, 0, 56, COUNTER),
+	TI(0x9870458, 0, 56, COUNTER),
+	TI(0x98701a8, 0, 56, COUNTER),
+	TI(0x98701b0, 0, 56, COUNTER),
+	TI(0x9870170, 0, 56, COUNTER),
+	TI(0x98701b8, 0, 56, COUNTER),
+	TI(0x9870028, 0, 56, COUNTER),
+	TI(0x9870030, 0, 56, COUNTER),
+	TI(0x9870400, 0, 56, COUNTER),
+	TI(0x9870408, 0, 56, COUNTER),
+	TI(0x9870410, 0, 56, COUNTER),
+	TI(0x9870418, 0, 56, COUNTER),
+	TI(0x9870420, 0, 56, COUNTER),
+	TI(0x9870428, 0, 56, COUNTER),
+	TI(0x9870430, 0, 56, COUNTER),
+	TI(0x9870438, 0, 56, COUNTER),
+	TI(0x9870200, 0, 56, COUNTER),
+	TI(0x9870218, 0, 56, COUNTER),
+	TI(0x9870228, 0, 56, COUNTER),
+	TI(0x9870220, 0, 56, COUNTER),
+	TI(0x9870210, 0, 56, COUNTER),
+	TI(0x98703a0, 0, 56, COUNTER),
+	TI(0x98703a8, 0, 56, COUNTER),
+	TI(0x98703b0, 0, 56, COUNTER),
+	TI(0x98703b8, 0, 56, COUNTER),
+	TI(0x98703c0, 0, 56, COUNTER),
+	TI(0x98703c8, 0, 56, COUNTER),
+	TI(0x98703d0, 0, 56, COUNTER),
+	TI(0x98703d8, 0, 56, COUNTER),
+	TI(0x98703e0, 0, 56, COUNTER),
+	TI(0x98703e8, 0, 56, COUNTER),
+	TI(0x98703f0, 0, 56, COUNTER),
+	TI(0x98703f8, 0, 56, COUNTER),
+	TI(0x9870208, 0, 56, COUNTER),
+	TI(0x9870360, 0, 56, COUNTER),
+	TI(0x9870368, 0, 56, COUNTER),
+	TI(0x9870370, 0, 56, COUNTER),
+	TI(0x9870378, 0, 56, COUNTER),
+	TI(0x9870380, 0, 56, COUNTER),
+	TI(0x9870388, 0, 56, COUNTER),
+	TI(0x9870390, 0, 56, COUNTER),
+	TI(0x9870398, 0, 56, COUNTER),
+	TI(0x9803120, 0, 56, COUNTER),
+	TI(0x9803128, 0, 56, COUNTER),
+	TI(0x9803130, 0, 56, COUNTER),
+	TI(0x9803138, 0, 56, COUNTER),
+	TI(0x9803220, 0, 15, UGAUGE),
+	TI(0x9803228, 0, 15, UGAUGE),
+	TI(0x9803230, 0, 15, UGAUGE),
+	TI(0x9803238, 0, 15, UGAUGE),
+	TI(0x9803220, 16, 12, UGAUGE),
+	TI(0x9803228, 16, 12, UGAUGE),
+	TI(0x9803230, 16, 12, UGAUGE),
+	TI(0x9803238, 16, 12, UGAUGE),
+	TI(0x9803000, 0, 48, COUNTER),
+	TI(0x9803008, 0, 48, COUNTER),
+	TI(0x9803010, 0, 48, COUNTER),
+	TI(0x9803018, 0, 48, COUNTER),
+	TI(0x9803000, 60, 4, UGAUGE),
+	TI(0x9803008, 60, 4, UGAUGE),
+	TI(0x9803010, 60, 4, UGAUGE),
+	TI(0x9803018, 60, 4, UGAUGE),
+	TI(0x9803020, 0, 52, COUNTER),
+	TI(0x9803028, 0, 52, COUNTER),
+	TI(0x9803030, 0, 52, COUNTER),
+	TI(0x9803038, 0, 52, COUNTER),
+	TI(0x9803020, 52, 12, UGAUGE),
+	TI(0x9803028, 52, 12, UGAUGE),
+	TI(0x9803030, 52, 12, UGAUGE),
+	TI(0x9803038, 52, 12, UGAUGE),
+	TI(0x9803100, 0, 56, COUNTER),
+	TI(0x9803108, 0, 56, COUNTER),
+	TI(0x9803110, 0, 56, COUNTER),
+	TI(0x9803118, 0, 56, COUNTER),
+	TI(0x9803200, 0, 15, UGAUGE),
+	TI(0x9803208, 0, 15, UGAUGE),
+	TI(0x9803210, 0, 15, UGAUGE),
+	TI(0x9803218, 0, 15, UGAUGE),
+	TI(0x9803200, 16, 12, UGAUGE),
+	TI(0x9803208, 16, 12, UGAUGE),
+	TI(0x9803210, 16, 12, UGAUGE),
+	TI(0x9803218, 16, 12, UGAUGE),
+	TI(0x9800800, 0, 15, UGAUGE),
+	TI(0x9800808, 0, 15, UGAUGE),
+	TI(0x9800810, 0, 15, UGAUGE),
+	TI(0x9800818, 0, 15, UGAUGE),
+	TI(0x9800820, 0, 15, UGAUGE),
+	TI(0x9800828, 0, 15, UGAUGE),
+	TI(0x9800830, 0, 15, UGAUGE),
+	TI(0x9800838, 0, 15, UGAUGE),
+	TI(0x9800840, 0, 15, UGAUGE),
+	TI(0x9800848, 0, 15, UGAUGE),
+	TI(0x9800850, 0, 15, UGAUGE),
+	TI(0x9800858, 0, 15, UGAUGE),
+	TI(0x9800860, 0, 15, UGAUGE),
+	TI(0x9800868, 0, 15, UGAUGE),
+	TI(0x9800870, 0, 15, UGAUGE),
+	TI(0x9800878, 0, 15, UGAUGE),
+	TI(0x9800880, 0, 15, UGAUGE),
+	TI(0x9800888, 0, 15, UGAUGE),
+	TI(0x9800890, 0, 15, UGAUGE),
+	TI(0x9800898, 0, 15, UGAUGE),
+	TI(0x98008a0, 0, 15, UGAUGE),
+	TI(0x98008a8, 0, 15, UGAUGE),
+	TI(0x98008b0, 0, 15, UGAUGE),
+	TI(0x98008b8, 0, 15, UGAUGE),
+	TI(0x98008c0, 0, 15, UGAUGE),
+	TI(0x98008c8, 0, 15, UGAUGE),
+	TI(0x98008d0, 0, 15, UGAUGE),
+	TI(0x98008d8, 0, 15, UGAUGE),
+	TI(0x98008e0, 0, 15, UGAUGE),
+	TI(0x98008e8, 0, 15, UGAUGE),
+	TI(0x98008f0, 0, 15, UGAUGE),
+	TI(0x98008f8, 0, 15, UGAUGE),
+	TI(0x9800900, 0, 15, UGAUGE),
+	TI(0x9800908, 0, 15, UGAUGE),
+	TI(0x9800910, 0, 15, UGAUGE),
+	TI(0x9800918, 0, 15, UGAUGE),
+	TI(0x9800920, 0, 15, UGAUGE),
+	TI(0x9800928, 0, 15, UGAUGE),
+	TI(0x9800930, 0, 15, UGAUGE),
+	TI(0x9800938, 0, 15, UGAUGE),
+	TI(0x9800940, 0, 15, UGAUGE),
+	TI(0x9800948, 0, 15, UGAUGE),
+	TI(0x9800950, 0, 15, UGAUGE),
+	TI(0x9800958, 0, 15, UGAUGE),
+	TI(0x9800960, 0, 15, UGAUGE),
+	TI(0x9800968, 0, 15, UGAUGE),
+	TI(0x9800970, 0, 15, UGAUGE),
+	TI(0x9800978, 0, 15, UGAUGE),
+	TI(0x9800980, 0, 15, UGAUGE),
+	TI(0x9800988, 0, 15, UGAUGE),
+	TI(0x9800990, 0, 15, UGAUGE),
+	TI(0x9800998, 0, 15, UGAUGE),
+	TI(0x98009a0, 0, 15, UGAUGE),
+	TI(0x98009a8, 0, 15, UGAUGE),
+	TI(0x98009b0, 0, 15, UGAUGE),
+	TI(0x98009b8, 0, 15, UGAUGE),
+	TI(0x98009c0, 0, 15, UGAUGE),
+	TI(0x98009c8, 0, 15, UGAUGE),
+	TI(0x98009d0, 0, 15, UGAUGE),
+	TI(0x98009d8, 0, 15, UGAUGE),
+	TI(0x98009e0, 0, 15, UGAUGE),
+	TI(0x98009e8, 0, 15, UGAUGE),
+	TI(0x98009f0, 0, 15, UGAUGE),
+	TI(0x98009f8, 0, 15, UGAUGE),
+	TI(0x9870000, 0, 56, COUNTER),
+	TI(0x9870460, 0, 56, COUNTER),
+	TI(0x9870468, 0, 56, COUNTER),
+	TI(0x9870470, 0, 56, COUNTER),
+	TI(0x9870478, 0, 56, COUNTER),
+	TI(0x9870230, 0, 56, COUNTER),
+	TI(0x9870238, 0, 56, COUNTER),
+	TI(0x10004010, 4, 16, COUNTER),
+	TI(0x10020170, 0, 56, COUNTER),
+	TI(0x10020178, 0, 56, COUNTER),
+	TI(0x10020180, 0, 56, COUNTER),
+	TI(0x10020188, 0, 56, COUNTER),
+	TI(0x10020150, 0, 56, COUNTER),
+	TI(0x10020158, 0, 56, COUNTER),
+	TI(0x10020160, 0, 56, COUNTER),
+	TI(0x10020168, 0, 56, COUNTER),
+	TI(0x100200f0, 0, 56, COUNTER),
+	TI(0x100200f8, 0, 56, COUNTER),
+	TI(0x10020130, 0, 56, COUNTER),
+	TI(0x10020138, 0, 56, COUNTER),
+	TI(0x10020090, 0, 56, COUNTER),
+	TI(0x10020098, 0, 56, COUNTER),
+	TI(0x100200a0, 0, 56, COUNTER),
+	TI(0x10020048, 0, 56, COUNTER),
+	TI(0x10020050, 0, 56, COUNTER),
+	TI(0x10020058, 0, 56, COUNTER),
+	TI(0x10020078, 0, 56, COUNTER),
+	TI(0x10020080, 0, 56, COUNTER),
+	TI(0x10020088, 0, 56, COUNTER),
+	TI(0x10020018, 0, 56, COUNTER),
+	TI(0x10020020, 0, 56, COUNTER),
+	TI(0x10020028, 0, 56, COUNTER),
+	TI(0x100200a8, 0, 56, COUNTER),
+	TI(0x100200b0, 0, 56, COUNTER),
+	TI(0x100200b8, 0, 56, COUNTER),
+	TI(0x10020000, 0, 56, COUNTER),
+	TI(0x10020008, 0, 56, COUNTER),
+	TI(0x10020010, 0, 56, COUNTER),
+	TI(0x10020060, 0, 56, COUNTER),
+	TI(0x10020068, 0, 56, COUNTER),
+	TI(0x10020070, 0, 56, COUNTER),
+	TI(0x10020030, 0, 56, COUNTER),
+	TI(0x10020038, 0, 56, COUNTER),
+	TI(0x10020040, 0, 56, COUNTER),
+	TI(0x10020100, 0, 56, COUNTER),
+	TI(0x10020108, 0, 56, COUNTER),
+	TI(0x10020140, 0, 56, COUNTER),
+	TI(0x10020148, 0, 56, COUNTER),
+	TI(0x100200e0, 0, 56, COUNTER),
+	TI(0x100200e8, 0, 56, COUNTER),
+	TI(0x10020120, 0, 56, COUNTER),
+	TI(0x10020128, 0, 56, COUNTER),
+	TI(0x100200c8, 0, 56, COUNTER),
+	TI(0x100200c0, 0, 56, COUNTER),
+	TI(0x100200d0, 0, 56, COUNTER),
+	TI(0x100200d8, 0, 56, COUNTER),
+	TI(0x10020110, 0, 56, COUNTER),
+	TI(0x10020118, 0, 56, COUNTER),
+	TI(0x9870cd0, 0, 56, COUNTER),
+	TI(0x9870d40, 0, 56, COUNTER),
+	TI(0x9870cc0, 0, 56, COUNTER),
+	TI(0x9870cc8, 0, 56, COUNTER),
+	TI(0x9870cd8, 0, 56, COUNTER),
+	TI(0x9870cf8, 0, 56, COUNTER),
+	TI(0x9870ce0, 0, 56, COUNTER),
+	TI(0x9870ce8, 0, 56, COUNTER),
+	TI(0x9870cf0, 0, 56, COUNTER),
+	TI(0xa010018, 0, 12, UGAUGE),
+	TI(0x1002a90, 0, 56, COUNTER),
+	TI(0x10026b0, 0, 56, COUNTER),
+	TI(0x10026a8, 0, 56, COUNTER),
+	TI(0x10026b8, 0, 56, COUNTER),
+	TI(0x10026c8, 0, 56, COUNTER),
+	TI(0x10026d8, 0, 56, COUNTER),
+	TI(0x10026d0, 0, 56, COUNTER),
+	TI(0x10026c0, 0, 56, COUNTER),
+	TI(0x1002970, 0, 56, COUNTER),
+	TI(0x1002978, 0, 56, COUNTER),
+	TI(0x1002980, 0, 56, COUNTER),
+	TI(0x1002988, 0, 56, COUNTER),
+	TI(0x1002a98, 0, 56, COUNTER),
+	TI(0x1002aa0, 0, 56, COUNTER),
+	TI(0x1002aa8, 0, 56, COUNTER),
+	TI(0x1002ab0, 0, 56, COUNTER),
+	TI(0x1002ab8, 0, 56, COUNTER),
+	TI(0x1002ac0, 0, 56, COUNTER),
+	TI(0x1002ac8, 0, 56, COUNTER),
+	TI(0x1002ad0, 0, 56, COUNTER),
+	TI(0x1002ad8, 0, 56, COUNTER),
+	TI(0x1002ae0, 0, 56, COUNTER),
+	TI(0x1002ae8, 0, 56, COUNTER),
+	TI(0x1002af0, 0, 56, COUNTER),
+	TI(0x1002af8, 0, 56, COUNTER),
+	TI(0x1002b00, 0, 56, COUNTER),
+	TI(0x1002b08, 0, 56, COUNTER),
+	TI(0x1002b10, 0, 56, COUNTER),
+	TI(0x1002b18, 0, 56, COUNTER),
+	TI(0x1002b20, 0, 56, COUNTER),
+	TI(0x1002b28, 0, 56, COUNTER),
+	TI(0x1002b30, 0, 56, COUNTER),
+	TI(0x1002b38, 0, 56, COUNTER),
+	TI(0x1002b40, 0, 56, COUNTER),
+	TI(0x1002b48, 0, 56, COUNTER),
+	TI(0x1002b50, 0, 56, COUNTER),
+	TI(0x1002b58, 0, 56, COUNTER),
+	TI(0x1002b60, 0, 56, COUNTER),
+	TI(0x1002b68, 0, 56, COUNTER),
+	TI(0x1002b70, 0, 56, COUNTER),
+	TI(0x1002b78, 0, 56, COUNTER),
+	TI(0x1002b80, 0, 56, COUNTER),
+	TI(0x1002b88, 0, 56, COUNTER),
+	TI(0x1002b90, 0, 56, COUNTER),
+	TI(0x1002b98, 0, 56, COUNTER),
+	TI(0x1002ba0, 0, 56, COUNTER),
+	TI(0x1002ba8, 0, 56, COUNTER),
+	TI(0x1002bb0, 0, 56, COUNTER),
+	TI(0x1002bb8, 0, 56, COUNTER),
+	TI(0x1002bc0, 0, 56, COUNTER),
+	TI(0x1002bc8, 0, 56, COUNTER),
+	TI(0x1002bd0, 0, 56, COUNTER),
+	TI(0x1002bd8, 0, 56, COUNTER),
+	TI(0x1002be0, 0, 56, COUNTER),
+	TI(0x1002be8, 0, 56, COUNTER),
+	TI(0x1002bf0, 0, 56, COUNTER),
+	TI(0x1002bf8, 0, 56, COUNTER),
+	TI(0x1002c00, 0, 56, COUNTER),
+	TI(0x1002c08, 0, 56, COUNTER),
+	TI(0x1002c10, 0, 56, COUNTER),
+	TI(0x1002c18, 0, 56, COUNTER),
+	TI(0x1002c20, 0, 56, COUNTER),
+	TI(0x1002c28, 0, 56, COUNTER),
+	TI(0x1002c30, 0, 56, COUNTER),
+	TI(0x1002c38, 0, 56, COUNTER),
+	TI(0x1002c40, 0, 56, COUNTER),
+	TI(0x1002c48, 0, 56, COUNTER),
+	TI(0x1002c50, 0, 56, COUNTER),
+	TI(0x1002c58, 0, 56, COUNTER),
+	TI(0x1002c60, 0, 56, COUNTER),
+	TI(0x1002c68, 0, 56, COUNTER),
+	TI(0x1002c70, 0, 56, COUNTER),
+	TI(0x1002c78, 0, 56, COUNTER),
+	TI(0x1002c80, 0, 56, COUNTER),
+	TI(0x1002c88, 0, 56, COUNTER),
+	TI(0x1002c90, 0, 56, COUNTER),
+	TI(0x1002c98, 0, 56, COUNTER),
+	TI(0x1002ca0, 0, 56, COUNTER),
+	TI(0x1002ca8, 0, 56, COUNTER),
+	TI(0x1002cb0, 0, 56, COUNTER),
+	TI(0x1002cb8, 0, 56, COUNTER),
+	TI(0x1002cc0, 0, 56, COUNTER),
+	TI(0x1002cc8, 0, 56, COUNTER),
+	TI(0x1002cd0, 0, 56, COUNTER),
+	TI(0x1002cd8, 0, 56, COUNTER),
+	TI(0x1002ce0, 0, 56, COUNTER),
+	TI(0x1002ce8, 0, 56, COUNTER),
+	TI(0x1002cf0, 0, 56, COUNTER),
+	TI(0x1002cf8, 0, 56, COUNTER),
+	TI(0x1002d00, 0, 56, COUNTER),
+	TI(0x1002d08, 0, 56, COUNTER),
+	TI(0x1002d10, 0, 56, COUNTER),
+	TI(0x1002d18, 0, 56, COUNTER),
+	TI(0x1002d20, 0, 56, COUNTER),
+	TI(0x1002d28, 0, 56, COUNTER),
+	TI(0x1002d30, 0, 56, COUNTER),
+	TI(0x1002d38, 0, 56, COUNTER),
+	TI(0x1002d40, 0, 56, COUNTER),
+	TI(0x1002d48, 0, 56, COUNTER),
+	TI(0x1002d50, 0, 56, COUNTER),
+	TI(0x1002d58, 0, 56, COUNTER),
+	TI(0x1002d60, 0, 56, COUNTER),
+	TI(0x1002d68, 0, 56, COUNTER),
+	TI(0x1002d70, 0, 56, COUNTER),
+	TI(0x1002d78, 0, 56, COUNTER),
+	TI(0x1002d80, 0, 56, COUNTER),
+	TI(0x1002d88, 0, 56, COUNTER),
+	TI(0x1002d90, 0, 56, COUNTER),
+	TI(0x1002698, 0, 56, COUNTER),
+	TI(0x10026a0, 0, 56, COUNTER),
+	TI(0x1002a88, 0, 56, COUNTER),
+	TI(0x1002df8, 0, 56, COUNTER),
+	TI(0x1002e00, 0, 56, COUNTER),
+	TI(0x1002e08, 0, 56, COUNTER),
+	TI(0x1002e10, 0, 56, COUNTER),
+	TI(0x1002dd0, 0, 56, COUNTER),
+	TI(0x1002de0, 0, 56, COUNTER),
+	TI(0x1002dd8, 0, 56, COUNTER),
+	TI(0x1002de8, 0, 56, COUNTER),
+	TI(0x1002dc0, 0, 56, COUNTER),
+	TI(0x1002dc8, 0, 56, COUNTER),
+	TI(0x1002db8, 0, 56, COUNTER),
+	TI(0x1002da0, 0, 56, COUNTER),
+	TI(0x1002db0, 0, 56, COUNTER),
+	TI(0x1002da8, 0, 56, COUNTER),
+	TI(0x1002d98, 0, 56, COUNTER),
+	TI(0x1002df0, 0, 56, COUNTER),
+	TI(0x1002e78, 0, 56, COUNTER),
+	TI(0x1002e80, 0, 56, COUNTER),
+	TI(0x1002e88, 0, 56, COUNTER),
+	TI(0x1002e90, 0, 56, COUNTER),
+	TI(0x1002e50, 0, 56, COUNTER),
+	TI(0x1002e60, 0, 56, COUNTER),
+	TI(0x1002e58, 0, 56, COUNTER),
+	TI(0x1002e68, 0, 56, COUNTER),
+	TI(0x1002e40, 0, 56, COUNTER),
+	TI(0x1002e48, 0, 56, COUNTER),
+	TI(0x1002e38, 0, 56, COUNTER),
+	TI(0x1002e20, 0, 56, COUNTER),
+	TI(0x1002e30, 0, 56, COUNTER),
+	TI(0x1002e28, 0, 56, COUNTER),
+	TI(0x1002e18, 0, 56, COUNTER),
+	TI(0x1002e70, 0, 56, COUNTER),
+	TI(0x10029e0, 0, 56, COUNTER),
+	TI(0x10029e8, 0, 56, COUNTER),
+	TI(0x10029f0, 0, 56, COUNTER),
+	TI(0x10029f8, 0, 56, COUNTER),
+	TI(0x1002a00, 0, 56, COUNTER),
+	TI(0x1002a08, 0, 56, COUNTER),
+	TI(0x1002a10, 0, 56, COUNTER),
+	TI(0x1002a18, 0, 56, COUNTER),
+	TI(0x1002a20, 0, 56, COUNTER),
+	TI(0x1002a28, 0, 56, COUNTER),
+	TI(0x1002a80, 0, 56, COUNTER),
+	TI(0x1002990, 0, 56, COUNTER),
+	TI(0x1002998, 0, 56, COUNTER),
+	TI(0x10029a0, 0, 56, COUNTER),
+	TI(0x10029a8, 0, 56, COUNTER),
+	TI(0x10029b0, 0, 56, COUNTER),
+	TI(0x10029b8, 0, 56, COUNTER),
+	TI(0x10029c0, 0, 56, COUNTER),
+	TI(0x10029c8, 0, 56, COUNTER),
+	TI(0x10029d0, 0, 56, COUNTER),
+	TI(0x10029d8, 0, 56, COUNTER),
+	TI(0x1002a30, 0, 56, COUNTER),
+	TI(0x1002a38, 0, 56, COUNTER),
+	TI(0x1002a40, 0, 56, COUNTER),
+	TI(0x1002a48, 0, 56, COUNTER),
+	TI(0x1002a50, 0, 56, COUNTER),
+	TI(0x1002a58, 0, 56, COUNTER),
+	TI(0x1002a60, 0, 56, COUNTER),
+	TI(0x1002a68, 0, 56, COUNTER),
+	TI(0x1002a70, 0, 56, COUNTER),
+	TI(0x1002a78, 0, 56, COUNTER),
+	TU,
+	TU,
+	TI(0x10028c8, 0, 56, COUNTER),
+	TI(0x10028d0, 0, 56, COUNTER),
+	TI(0x10028d8, 0, 56, COUNTER),
+	TI(0x10028e0, 0, 56, COUNTER),
+	TI(0x10028e8, 0, 56, COUNTER),
+	TI(0x10028f0, 0, 56, COUNTER),
+	TI(0x10028f8, 0, 56, COUNTER),
+	TI(0x1002900, 0, 56, COUNTER),
+	TI(0x1002928, 0, 56, COUNTER),
+	TI(0x1002930, 0, 56, COUNTER),
+	TI(0x1002938, 0, 56, COUNTER),
+	TI(0x1002940, 0, 56, COUNTER),
+	TI(0x1002908, 0, 56, COUNTER),
+	TI(0x1002910, 0, 56, COUNTER),
+	TI(0x1002918, 0, 56, COUNTER),
+	TI(0x1002920, 0, 56, COUNTER),
+	TI(0x1002948, 0, 56, COUNTER),
+	TI(0x10028b8, 0, 56, COUNTER),
+	TI(0x1002868, 0, 56, COUNTER),
+	TI(0x1002870, 0, 56, COUNTER),
+	TI(0x1002878, 0, 56, COUNTER),
+	TI(0x1002880, 0, 56, COUNTER),
+	TI(0x1002888, 0, 56, COUNTER),
+	TI(0x1002890, 0, 56, COUNTER),
+	TI(0x1002898, 0, 56, COUNTER),
+	TI(0x10028a0, 0, 56, COUNTER),
+	TI(0x10028a8, 0, 56, COUNTER),
+	TI(0x10028b0, 0, 56, COUNTER),
+	TI(0x1002950, 0, 56, COUNTER),
+	TI(0x10028c0, 0, 56, COUNTER),
+	TI(0x1002738, 0, 56, COUNTER),
+	TI(0x1002740, 0, 56, COUNTER),
+	TI(0x1002748, 0, 56, COUNTER),
+	TI(0x1002750, 0, 56, COUNTER),
+	TI(0x1002758, 0, 56, COUNTER),
+	TI(0x1002760, 0, 56, COUNTER),
+	TI(0x1002768, 0, 56, COUNTER),
+	TI(0x1002770, 0, 56, COUNTER),
+	TI(0x1002778, 0, 56, COUNTER),
+	TI(0x1002780, 0, 56, COUNTER),
+	TI(0x1002840, 0, 56, COUNTER),
+	TI(0x10026e8, 0, 56, COUNTER),
+	TI(0x10026f0, 0, 56, COUNTER),
+	TI(0x10026f8, 0, 56, COUNTER),
+	TI(0x1002700, 0, 56, COUNTER),
+	TI(0x1002708, 0, 56, COUNTER),
+	TI(0x1002710, 0, 56, COUNTER),
+	TI(0x1002718, 0, 56, COUNTER),
+	TI(0x1002720, 0, 56, COUNTER),
+	TI(0x1002728, 0, 56, COUNTER),
+	TI(0x1002730, 0, 56, COUNTER),
+	TI(0x1002838, 0, 56, COUNTER),
+	TI(0x10027d8, 0, 56, COUNTER),
+	TI(0x10027e0, 0, 56, COUNTER),
+	TI(0x10027e8, 0, 56, COUNTER),
+	TI(0x10027f0, 0, 56, COUNTER),
+	TI(0x10027f8, 0, 56, COUNTER),
+	TI(0x1002800, 0, 56, COUNTER),
+	TI(0x1002808, 0, 56, COUNTER),
+	TI(0x1002810, 0, 56, COUNTER),
+	TI(0x1002818, 0, 56, COUNTER),
+	TI(0x1002820, 0, 56, COUNTER),
+	TI(0x1002788, 0, 56, COUNTER),
+	TI(0x1002790, 0, 56, COUNTER),
+	TI(0x1002798, 0, 56, COUNTER),
+	TI(0x10027a0, 0, 56, COUNTER),
+	TI(0x10027a8, 0, 56, COUNTER),
+	TI(0x10027b0, 0, 56, COUNTER),
+	TI(0x10027b8, 0, 56, COUNTER),
+	TI(0x10027c0, 0, 56, COUNTER),
+	TI(0x10027c8, 0, 56, COUNTER),
+	TI(0x10027d0, 0, 56, COUNTER),
+	TI(0x1002830, 0, 56, COUNTER),
+	TI(0x1002828, 0, 56, COUNTER),
+	TI(0x1002848, 0, 56, COUNTER),
+	TI(0x1002850, 0, 56, COUNTER),
+	TI(0x1002858, 0, 56, COUNTER),
+	TI(0x1002860, 0, 56, COUNTER),
+	TI(0xa803400, 32, 11, UGAUGE),
+	TI(0xa803408, 32, 11, UGAUGE),
+	TI(0xa803410, 32, 11, UGAUGE),
+	TI(0xa803418, 32, 11, UGAUGE),
+	TI(0xa803420, 32, 11, UGAUGE),
+	TI(0xa803428, 32, 11, UGAUGE),
+	TI(0xa803430, 32, 11, UGAUGE),
+	TI(0xa803438, 32, 11, UGAUGE),
+	TI(0xa803440, 32, 11, UGAUGE),
+	TI(0xa803448, 32, 11, UGAUGE),
+	TI(0xa803400, 0, 11, UGAUGE),
+	TI(0xa803408, 0, 11, UGAUGE),
+	TI(0xa803410, 0, 11, UGAUGE),
+	TI(0xa803418, 0, 11, UGAUGE),
+	TI(0xa803420, 0, 11, UGAUGE),
+	TI(0xa803428, 0, 11, UGAUGE),
+	TI(0xa803430, 0, 11, UGAUGE),
+	TI(0xa803438, 0, 11, UGAUGE),
+	TI(0xa803440, 0, 11, UGAUGE),
+	TI(0xa803448, 0, 11, UGAUGE),
+	TI(0xa803400, 16, 11, UGAUGE),
+	TI(0xa803408, 16, 11, UGAUGE),
+	TI(0xa803410, 16, 11, UGAUGE),
+	TI(0xa803418, 16, 11, UGAUGE),
+	TI(0xa803420, 16, 11, UGAUGE),
+	TI(0xa803428, 16, 11, UGAUGE),
+	TI(0xa803430, 16, 11, UGAUGE),
+	TI(0xa803438, 16, 11, UGAUGE),
+	TI(0xa803440, 16, 11, UGAUGE),
+	TI(0xa803448, 16, 11, UGAUGE),
+	TI(0xa803000, 32, 11, UGAUGE),
+	TI(0xa803008, 32, 11, UGAUGE),
+	TI(0xa803010, 32, 11, UGAUGE),
+	TI(0xa803018, 32, 11, UGAUGE),
+	TI(0xa803020, 32, 11, UGAUGE),
+	TI(0xa803028, 32, 11, UGAUGE),
+	TI(0xa803030, 32, 11, UGAUGE),
+	TI(0xa803038, 32, 11, UGAUGE),
+	TI(0xa803040, 32, 11, UGAUGE),
+	TI(0xa803048, 32, 11, UGAUGE),
+	TI(0xa803050, 32, 11, UGAUGE),
+	TI(0xa803058, 32, 11, UGAUGE),
+	TI(0xa803060, 32, 11, UGAUGE),
+	TI(0xa803068, 32, 11, UGAUGE),
+	TI(0xa803070, 32, 11, UGAUGE),
+	TI(0xa803078, 32, 11, UGAUGE),
+	TI(0xa803080, 32, 11, UGAUGE),
+	TI(0xa803088, 32, 11, UGAUGE),
+	TI(0xa803090, 32, 11, UGAUGE),
+	TI(0xa803098, 32, 11, UGAUGE),
+	TI(0xa8030a0, 32, 11, UGAUGE),
+	TI(0xa8030a8, 32, 11, UGAUGE),
+	TI(0xa8030b0, 32, 11, UGAUGE),
+	TI(0xa8030b8, 32, 11, UGAUGE),
+	TI(0xa8030c0, 32, 11, UGAUGE),
+	TI(0xa8030c8, 32, 11, UGAUGE),
+	TI(0xa8030d0, 32, 11, UGAUGE),
+	TI(0xa8030d8, 32, 11, UGAUGE),
+	TI(0xa8030e0, 32, 11, UGAUGE),
+	TI(0xa8030e8, 32, 11, UGAUGE),
+	TI(0xa8030f0, 32, 11, UGAUGE),
+	TI(0xa8030f8, 32, 11, UGAUGE),
+	TI(0xa803100, 32, 11, UGAUGE),
+	TI(0xa803108, 32, 11, UGAUGE),
+	TI(0xa803110, 32, 11, UGAUGE),
+	TI(0xa803118, 32, 11, UGAUGE),
+	TI(0xa803120, 32, 11, UGAUGE),
+	TI(0xa803128, 32, 11, UGAUGE),
+	TI(0xa803130, 32, 11, UGAUGE),
+	TI(0xa803138, 32, 11, UGAUGE),
+	TI(0xa803140, 32, 11, UGAUGE),
+	TI(0xa803148, 32, 11, UGAUGE),
+	TI(0xa803150, 32, 11, UGAUGE),
+	TI(0xa803158, 32, 11, UGAUGE),
+	TI(0xa803160, 32, 11, UGAUGE),
+	TI(0xa803168, 32, 11, UGAUGE),
+	TI(0xa803170, 32, 11, UGAUGE),
+	TI(0xa803178, 32, 11, UGAUGE),
+	TI(0xa803180, 32, 11, UGAUGE),
+	TI(0xa803188, 32, 11, UGAUGE),
+	TI(0xa803190, 32, 11, UGAUGE),
+	TI(0xa803198, 32, 11, UGAUGE),
+	TI(0xa8031a0, 32, 11, UGAUGE),
+	TI(0xa8031a8, 32, 11, UGAUGE),
+	TI(0xa8031b0, 32, 11, UGAUGE),
+	TI(0xa8031b8, 32, 11, UGAUGE),
+	TI(0xa8031c0, 32, 11, UGAUGE),
+	TI(0xa8031c8, 32, 11, UGAUGE),
+	TI(0xa8031d0, 32, 11, UGAUGE),
+	TI(0xa8031d8, 32, 11, UGAUGE),
+	TI(0xa8031e0, 32, 11, UGAUGE),
+	TI(0xa8031e8, 32, 11, UGAUGE),
+	TI(0xa8031f0, 32, 11, UGAUGE),
+	TI(0xa8031f8, 32, 11, UGAUGE),
+	TI(0xa803200, 32, 11, UGAUGE),
+	TI(0xa803208, 32, 11, UGAUGE),
+	TI(0xa803210, 32, 11, UGAUGE),
+	TI(0xa803218, 32, 11, UGAUGE),
+	TI(0xa803220, 32, 11, UGAUGE),
+	TI(0xa803228, 32, 11, UGAUGE),
+	TI(0xa803230, 32, 11, UGAUGE),
+	TI(0xa803238, 32, 11, UGAUGE),
+	TI(0xa803240, 32, 11, UGAUGE),
+	TI(0xa803248, 32, 11, UGAUGE),
+	TI(0xa803250, 32, 11, UGAUGE),
+	TI(0xa803258, 32, 11, UGAUGE),
+	TI(0xa803260, 32, 11, UGAUGE),
+	TI(0xa803268, 32, 11, UGAUGE),
+	TI(0xa803270, 32, 11, UGAUGE),
+	TI(0xa803278, 32, 11, UGAUGE),
+	TI(0xa803280, 32, 11, UGAUGE),
+	TI(0xa803288, 32, 11, UGAUGE),
+	TI(0xa803290, 32, 11, UGAUGE),
+	TI(0xa803298, 32, 11, UGAUGE),
+	TI(0xa8032a0, 32, 11, UGAUGE),
+	TI(0xa8032a8, 32, 11, UGAUGE),
+	TI(0xa8032b0, 32, 11, UGAUGE),
+	TI(0xa8032b8, 32, 11, UGAUGE),
+	TI(0xa8032c0, 32, 11, UGAUGE),
+	TI(0xa8032c8, 32, 11, UGAUGE),
+	TI(0xa8032d0, 32, 11, UGAUGE),
+	TI(0xa8032d8, 32, 11, UGAUGE),
+	TI(0xa8032e0, 32, 11, UGAUGE),
+	TI(0xa8032e8, 32, 11, UGAUGE),
+	TI(0xa8032f0, 32, 11, UGAUGE),
+	TI(0xa8032f8, 32, 11, UGAUGE),
+	TI(0xa803000, 0, 11, UGAUGE),
+	TI(0xa803008, 0, 11, UGAUGE),
+	TI(0xa803010, 0, 11, UGAUGE),
+	TI(0xa803018, 0, 11, UGAUGE),
+	TI(0xa803020, 0, 11, UGAUGE),
+	TI(0xa803028, 0, 11, UGAUGE),
+	TI(0xa803030, 0, 11, UGAUGE),
+	TI(0xa803038, 0, 11, UGAUGE),
+	TI(0xa803040, 0, 11, UGAUGE),
+	TI(0xa803048, 0, 11, UGAUGE),
+	TI(0xa803050, 0, 11, UGAUGE),
+	TI(0xa803058, 0, 11, UGAUGE),
+	TI(0xa803060, 0, 11, UGAUGE),
+	TI(0xa803068, 0, 11, UGAUGE),
+	TI(0xa803070, 0, 11, UGAUGE),
+	TI(0xa803078, 0, 11, UGAUGE),
+	TI(0xa803080, 0, 11, UGAUGE),
+	TI(0xa803088, 0, 11, UGAUGE),
+	TI(0xa803090, 0, 11, UGAUGE),
+	TI(0xa803098, 0, 11, UGAUGE),
+	TI(0xa8030a0, 0, 11, UGAUGE),
+	TI(0xa8030a8, 0, 11, UGAUGE),
+	TI(0xa8030b0, 0, 11, UGAUGE),
+	TI(0xa8030b8, 0, 11, UGAUGE),
+	TI(0xa8030c0, 0, 11, UGAUGE),
+	TI(0xa8030c8, 0, 11, UGAUGE),
+	TI(0xa8030d0, 0, 11, UGAUGE),
+	TI(0xa8030d8, 0, 11, UGAUGE),
+	TI(0xa8030e0, 0, 11, UGAUGE),
+	TI(0xa8030e8, 0, 11, UGAUGE),
+	TI(0xa8030f0, 0, 11, UGAUGE),
+	TI(0xa8030f8, 0, 11, UGAUGE),
+	TI(0xa803100, 0, 11, UGAUGE),
+	TI(0xa803108, 0, 11, UGAUGE),
+	TI(0xa803110, 0, 11, UGAUGE),
+	TI(0xa803118, 0, 11, UGAUGE),
+	TI(0xa803120, 0, 11, UGAUGE),
+	TI(0xa803128, 0, 11, UGAUGE),
+	TI(0xa803130, 0, 11, UGAUGE),
+	TI(0xa803138, 0, 11, UGAUGE),
+	TI(0xa803140, 0, 11, UGAUGE),
+	TI(0xa803148, 0, 11, UGAUGE),
+	TI(0xa803150, 0, 11, UGAUGE),
+	TI(0xa803158, 0, 11, UGAUGE),
+	TI(0xa803160, 0, 11, UGAUGE),
+	TI(0xa803168, 0, 11, UGAUGE),
+	TI(0xa803170, 0, 11, UGAUGE),
+	TI(0xa803178, 0, 11, UGAUGE),
+	TI(0xa803180, 0, 11, UGAUGE),
+	TI(0xa803188, 0, 11, UGAUGE),
+	TI(0xa803190, 0, 11, UGAUGE),
+	TI(0xa803198, 0, 11, UGAUGE),
+	TI(0xa8031a0, 0, 11, UGAUGE),
+	TI(0xa8031a8, 0, 11, UGAUGE),
+	TI(0xa8031b0, 0, 11, UGAUGE),
+	TI(0xa8031b8, 0, 11, UGAUGE),
+	TI(0xa8031c0, 0, 11, UGAUGE),
+	TI(0xa8031c8, 0, 11, UGAUGE),
+	TI(0xa8031d0, 0, 11, UGAUGE),
+	TI(0xa8031d8, 0, 11, UGAUGE),
+	TI(0xa8031e0, 0, 11, UGAUGE),
+	TI(0xa8031e8, 0, 11, UGAUGE),
+	TI(0xa8031f0, 0, 11, UGAUGE),
+	TI(0xa8031f8, 0, 11, UGAUGE),
+	TI(0xa803200, 0, 11, UGAUGE),
+	TI(0xa803208, 0, 11, UGAUGE),
+	TI(0xa803210, 0, 11, UGAUGE),
+	TI(0xa803218, 0, 11, UGAUGE),
+	TI(0xa803220, 0, 11, UGAUGE),
+	TI(0xa803228, 0, 11, UGAUGE),
+	TI(0xa803230, 0, 11, UGAUGE),
+	TI(0xa803238, 0, 11, UGAUGE),
+	TI(0xa803240, 0, 11, UGAUGE),
+	TI(0xa803248, 0, 11, UGAUGE),
+	TI(0xa803250, 0, 11, UGAUGE),
+	TI(0xa803258, 0, 11, UGAUGE),
+	TI(0xa803260, 0, 11, UGAUGE),
+	TI(0xa803268, 0, 11, UGAUGE),
+	TI(0xa803270, 0, 11, UGAUGE),
+	TI(0xa803278, 0, 11, UGAUGE),
+	TI(0xa803280, 0, 11, UGAUGE),
+	TI(0xa803288, 0, 11, UGAUGE),
+	TI(0xa803290, 0, 11, UGAUGE),
+	TI(0xa803298, 0, 11, UGAUGE),
+	TI(0xa8032a0, 0, 11, UGAUGE),
+	TI(0xa8032a8, 0, 11, UGAUGE),
+	TI(0xa8032b0, 0, 11, UGAUGE),
+	TI(0xa8032b8, 0, 11, UGAUGE),
+	TI(0xa8032c0, 0, 11, UGAUGE),
+	TI(0xa8032c8, 0, 11, UGAUGE),
+	TI(0xa8032d0, 0, 11, UGAUGE),
+	TI(0xa8032d8, 0, 11, UGAUGE),
+	TI(0xa8032e0, 0, 11, UGAUGE),
+	TI(0xa8032e8, 0, 11, UGAUGE),
+	TI(0xa8032f0, 0, 11, UGAUGE),
+	TI(0xa8032f8, 0, 11, UGAUGE),
+	TI(0x9870c98, 0, 56, COUNTER),
+	TI(0x9870c90, 0, 56, COUNTER),
+	TI(0x9870c68, 0, 56, COUNTER),
+	TI(0x9870c60, 0, 56, COUNTER),
+	TI(0x9870c70, 0, 56, COUNTER),
+	TI(0x9870c80, 0, 56, COUNTER),
+	TI(0x9870c78, 0, 56, COUNTER),
+	TI(0x9870c88, 0, 56, COUNTER),
+	TI(0x9870c48, 0, 56, COUNTER),
+	TI(0x9870c58, 0, 56, COUNTER),
+	TI(0x9870c40, 0, 56, COUNTER),
+	TI(0x9870c50, 0, 56, COUNTER),
+	TI(0x9001008, 8, 6, UGAUGE),
+	TI(0x9001008, 0, 6, UGAUGE),
+	TI(0x9870b48, 0, 56, COUNTER),
+	TI(0x9870be8, 0, 56, COUNTER),
+	TI(0x9870ba8, 0, 56, COUNTER),
+	TI(0x9870b38, 0, 56, COUNTER),
+	TI(0x9870be0, 0, 56, COUNTER),
+	TI(0x9870ba0, 0, 56, COUNTER),
+	TI(0x9870b30, 0, 56, COUNTER),
+	TI(0x9870b40, 0, 56, COUNTER),
+	TI(0x9870ad8, 0, 56, COUNTER),
+	TI(0x9870bb8, 0, 56, COUNTER),
+	TI(0x9870b78, 0, 56, COUNTER),
+	TI(0x9870ac8, 0, 56, COUNTER),
+	TI(0x9870bb0, 0, 56, COUNTER),
+	TI(0x9870b70, 0, 56, COUNTER),
+	TI(0x9870ac0, 0, 56, COUNTER),
+	TI(0x9870ad0, 0, 56, COUNTER),
+	TI(0x9870af0, 0, 56, COUNTER),
+	TI(0x9870bc0, 0, 56, COUNTER),
+	TI(0x9870b80, 0, 56, COUNTER),
+	TI(0x9870ae0, 0, 56, COUNTER),
+	TI(0x9870ae8, 0, 56, COUNTER),
+	TI(0x9870b10, 0, 56, COUNTER),
+	TI(0x9870bd0, 0, 56, COUNTER),
+	TI(0x9870b90, 0, 56, COUNTER),
+	TI(0x9870b00, 0, 56, COUNTER),
+	TI(0x9870bc8, 0, 56, COUNTER),
+	TI(0x9870b88, 0, 56, COUNTER),
+	TI(0x9870af8, 0, 56, COUNTER),
+	TI(0x9870b08, 0, 56, COUNTER),
+	TI(0x9870b28, 0, 56, COUNTER),
+	TI(0x9870bd8, 0, 56, COUNTER),
+	TI(0x9870b98, 0, 56, COUNTER),
+	TI(0x9870b18, 0, 56, COUNTER),
+	TI(0x9870b20, 0, 56, COUNTER),
+	TI(0x9870b68, 0, 56, COUNTER),
+	TI(0x9870b58, 0, 56, COUNTER),
+	TI(0x9870b60, 0, 56, COUNTER),
+	TI(0x9870b50, 0, 56, COUNTER),
+	TI(0x100698, 0, 56, COUNTER),
+	TI(0x1006b0, 0, 56, COUNTER),
+	TI(0x1006a0, 0, 56, COUNTER),
+	TI(0x100688, 0, 56, COUNTER),
+	TI(0x100728, 0, 56, COUNTER),
+	TI(0x100690, 0, 56, COUNTER),
+	TI(0x100720, 0, 56, COUNTER),
+	TI(0x1007d8, 0, 56, COUNTER),
+	TI(0x100680, 0, 56, COUNTER),
+	TI(0x100660, 0, 56, COUNTER),
+	TI(0x100668, 0, 56, COUNTER),
+	TI(0x1006e8, 0, 56, COUNTER),
+	TI(0x1006e0, 0, 56, COUNTER),
+	TI(0x100628, 0, 56, COUNTER),
+	TI(0x100900, 0, 56, COUNTER),
+	TI(0x100908, 0, 56, COUNTER),
+	TI(0x100910, 0, 56, COUNTER),
+	TI(0x100918, 0, 56, COUNTER),
+	TI(0x100920, 0, 56, COUNTER),
+	TI(0x100928, 0, 56, COUNTER),
+	TI(0x100930, 0, 56, COUNTER),
+	TI(0x100938, 0, 56, COUNTER),
+	TI(0x100940, 0, 56, COUNTER),
+	TI(0x100948, 0, 56, COUNTER),
+	TI(0x100950, 0, 56, COUNTER),
+	TI(0x100958, 0, 56, COUNTER),
+	TI(0x100960, 0, 56, COUNTER),
+	TI(0x100968, 0, 56, COUNTER),
+	TI(0x100970, 0, 56, COUNTER),
+	TI(0x100978, 0, 56, COUNTER),
+	TI(0x100648, 0, 56, COUNTER),
+	TI(0x100650, 0, 56, COUNTER),
+	TI(0x100658, 0, 56, COUNTER),
+	TI(0x100600, 0, 56, COUNTER),
+	TI(0x100608, 0, 56, COUNTER),
+	TI(0x100670, 0, 56, COUNTER),
+	TI(0x1006d0, 0, 56, COUNTER),
+	TI(0x1006c0, 0, 56, COUNTER),
+	TI(0x1006b8, 0, 56, COUNTER),
+	TI(0x1006c8, 0, 56, COUNTER),
+	TI(0x100630, 0, 56, COUNTER),
+	TI(0x100798, 0, 56, COUNTER),
+	TI(0x1007a0, 0, 56, COUNTER),
+	TI(0x100788, 0, 56, COUNTER),
+	TI(0x100790, 0, 56, COUNTER),
+	TI(0x100778, 0, 56, COUNTER),
+	TI(0x100780, 0, 56, COUNTER),
+	TI(0x1007a8, 0, 56, COUNTER),
+	TI(0x1007b8, 0, 56, COUNTER),
+	TI(0x1007b0, 0, 56, COUNTER),
+	TI(0x1007c0, 0, 56, COUNTER),
+	TI(0xb00130, 32, 12, UGAUGE),
+	TI(0xb00130, 0, 12, UGAUGE),
+	TI(0xb00100, 32, 13, UGAUGE),
+	TI(0xb00100, 0, 13, UGAUGE),
+	TI(0xb00118, 32, 9, UGAUGE),
+	TI(0xb00118, 0, 9, UGAUGE),
+	TI(0xb00110, 32, 12, UGAUGE),
+	TI(0xb00110, 0, 12, UGAUGE),
+	TI(0xb00128, 32, 12, UGAUGE),
+	TI(0xb00128, 0, 12, UGAUGE),
+	TI(0xb00108, 32, 14, UGAUGE),
+	TI(0xb00108, 0, 14, UGAUGE),
+	TI(0xb00120, 32, 12, UGAUGE),
+	TI(0xb00120, 0, 12, UGAUGE),
+	TI(0x100638, 0, 56, COUNTER),
+	TI(0x100740, 0, 56, COUNTER),
+	TI(0x100738, 0, 56, COUNTER),
+	TI(0x100748, 0, 56, COUNTER),
+	TI(0x100620, 0, 56, COUNTER),
+	TI(0x100610, 0, 56, COUNTER),
+	TI(0x100800, 0, 56, COUNTER),
+	TI(0x100808, 0, 56, COUNTER),
+	TI(0x100810, 0, 56, COUNTER),
+	TI(0x100818, 0, 56, COUNTER),
+	TI(0x100820, 0, 56, COUNTER),
+	TI(0x100828, 0, 56, COUNTER),
+	TI(0x100830, 0, 56, COUNTER),
+	TI(0x100838, 0, 56, COUNTER),
+	TI(0x100840, 0, 56, COUNTER),
+	TI(0x100848, 0, 56, COUNTER),
+	TI(0x100850, 0, 56, COUNTER),
+	TI(0x100858, 0, 56, COUNTER),
+	TI(0x100860, 0, 56, COUNTER),
+	TI(0x100868, 0, 56, COUNTER),
+	TI(0x100870, 0, 56, COUNTER),
+	TI(0x100878, 0, 56, COUNTER),
+	TI(0x100880, 0, 56, COUNTER),
+	TI(0x100888, 0, 56, COUNTER),
+	TI(0x100890, 0, 56, COUNTER),
+	TI(0x100898, 0, 56, COUNTER),
+	TI(0x1008a0, 0, 56, COUNTER),
+	TI(0x1008a8, 0, 56, COUNTER),
+	TI(0x1008b0, 0, 56, COUNTER),
+	TI(0x1008b8, 0, 56, COUNTER),
+	TI(0x1008c0, 0, 56, COUNTER),
+	TI(0x1008c8, 0, 56, COUNTER),
+	TI(0x1008d0, 0, 56, COUNTER),
+	TI(0x1008d8, 0, 56, COUNTER),
+	TI(0x1008e0, 0, 56, COUNTER),
+	TI(0x1008e8, 0, 56, COUNTER),
+	TI(0x1008f0, 0, 56, COUNTER),
+	TI(0x1008f8, 0, 56, COUNTER),
+	TI(0x1006a8, 0, 56, COUNTER),
+	TI(0x1007e0, 0, 56, COUNTER),
+	TI(0x100618, 0, 56, COUNTER),
+	TI(0x1006d8, 0, 56, COUNTER),
+	TI(0x100640, 0, 56, COUNTER),
+	TI(0x100718, 0, 56, COUNTER),
+	TI(0x100708, 0, 56, COUNTER),
+	TI(0x100710, 0, 56, COUNTER),
+	TI(0x100768, 0, 56, COUNTER),
+	TI(0x100770, 0, 56, COUNTER),
+	TI(0x100758, 0, 56, COUNTER),
+	TI(0x100760, 0, 56, COUNTER),
+	TI(0x100750, 0, 56, COUNTER),
+	TI(0x1007c8, 0, 56, COUNTER),
+	TI(0x1006f8, 0, 56, COUNTER),
+	TI(0x1006f0, 0, 56, COUNTER),
+	TI(0x100700, 0, 56, COUNTER),
+	TI(0x1007d0, 0, 56, COUNTER),
+	TI(0x100678, 0, 56, COUNTER),
+	TI(0x1007e8, 0, 56, COUNTER),
+	TI(0x100730, 0, 56, COUNTER),
+	TI(0x100203b8, 0, 56, COUNTER),
+	TI(0x100203c0, 0, 56, COUNTER),
+	TI(0x100203d0, 0, 56, COUNTER),
+	TI(0x100203c8, 0, 56, COUNTER),
+	TI(0x100203e0, 0, 56, COUNTER),
+	TI(0x100203f0, 0, 56, COUNTER),
+	TI(0x100203f8, 0, 56, COUNTER),
+	TI(0x100203e8, 0, 56, COUNTER),
+	TI(0x100203d8, 0, 56, COUNTER),
+	TI(0x11005000, 4, 16, COUNTER),
+	TI(0x110061d8, 0, 56, COUNTER),
+	TI(0x110061d0, 0, 56, COUNTER),
+	TI(0x110061c0, 0, 56, COUNTER),
+	TI(0x110061c8, 0, 56, COUNTER),
+	TI(0x110061e0, 0, 56, COUNTER),
+	TI(0x110061e8, 0, 56, COUNTER),
+	TI(0x11006178, 0, 56, COUNTER),
+	TI(0x11006170, 0, 56, COUNTER),
+	TI(0x11006160, 0, 56, COUNTER),
+	TI(0x11006168, 0, 56, COUNTER),
+	TI(0x11006158, 0, 56, COUNTER),
+	TI(0x11006150, 0, 56, COUNTER),
+	TI(0x11006140, 0, 56, COUNTER),
+	TI(0x11006148, 0, 56, COUNTER),
+	TI(0x11006180, 0, 56, COUNTER),
+	TI(0x11006188, 0, 56, COUNTER),
+	TI(0x110061b0, 0, 56, COUNTER),
+	TI(0x110061b8, 0, 56, COUNTER),
+	TI(0x11006190, 0, 56, COUNTER),
+	TI(0x11006198, 0, 56, COUNTER),
+	TI(0x11006068, 0, 56, COUNTER),
+	TI(0x11006060, 0, 56, COUNTER),
+	TI(0x11006050, 0, 56, COUNTER),
+	TI(0x11006058, 0, 56, COUNTER),
+	TI(0x11006030, 0, 56, COUNTER),
+	TI(0x11006038, 0, 56, COUNTER),
+	TI(0x11006048, 0, 56, COUNTER),
+	TI(0x11006040, 0, 56, COUNTER),
+	TI(0x11006010, 0, 56, COUNTER),
+	TI(0x11006018, 0, 56, COUNTER),
+	TI(0x11006020, 0, 56, COUNTER),
+	TI(0x11006008, 0, 56, COUNTER),
+	TI(0x11006000, 0, 56, COUNTER),
+	TI(0x11006028, 0, 56, COUNTER),
+	TI(0x11006118, 0, 56, COUNTER),
+	TI(0x11006110, 0, 56, COUNTER),
+	TI(0x11006108, 0, 56, COUNTER),
+	TI(0x11006120, 0, 56, COUNTER),
+	TI(0x11006090, 0, 56, COUNTER),
+	TI(0x11006088, 0, 56, COUNTER),
+	TI(0x110060f0, 0, 56, COUNTER),
+	TI(0x110060e8, 0, 56, COUNTER),
+	TI(0x11006098, 0, 56, COUNTER),
+	TI(0x11006100, 0, 56, COUNTER),
+	TI(0x110060f8, 0, 56, COUNTER),
+	TI(0x110061a0, 0, 56, COUNTER),
+	TI(0x110061a8, 0, 56, COUNTER),
+	TI(0x11006080, 0, 56, COUNTER),
+	TI(0x110060d8, 0, 56, COUNTER),
+	TI(0x110060d0, 0, 56, COUNTER),
+	TI(0x110060c8, 0, 56, COUNTER),
+	TI(0x110060c0, 0, 56, COUNTER),
+	TI(0x110060e0, 0, 56, COUNTER),
+	TI(0x11006128, 0, 56, COUNTER),
+	TI(0x11006130, 0, 56, COUNTER),
+	TI(0x11006138, 0, 56, COUNTER),
+	TI(0x110060b0, 0, 56, COUNTER),
+	TI(0x110060b8, 0, 56, COUNTER),
+	TI(0x110060a0, 0, 56, COUNTER),
+	TI(0x110060a8, 0, 56, COUNTER),
+	TI(0x11006078, 0, 56, COUNTER),
+	TI(0x11006070, 0, 56, COUNTER),
+	TI(0x10020268, 0, 56, COUNTER),
+	TI(0x10020280, 0, 56, COUNTER),
+	TI(0x10020290, 0, 56, COUNTER),
+	TI(0x10020288, 0, 56, COUNTER),
+	TI(0x10020260, 0, 56, COUNTER),
+	TI(0x10020270, 0, 56, COUNTER),
+	TI(0x10020278, 0, 56, COUNTER),
+	TI(0x10020238, 0, 56, COUNTER),
+	TI(0x10020240, 0, 56, COUNTER),
+	TI(0x10020210, 0, 56, COUNTER),
+	TI(0x10020208, 0, 56, COUNTER),
+	TI(0x10020228, 0, 56, COUNTER),
+	TI(0x10020220, 0, 56, COUNTER),
+	TI(0x10020230, 0, 56, COUNTER),
+	TI(0x10020218, 0, 56, COUNTER),
+	TI(0x10020200, 0, 56, COUNTER),
+	TI(0x10020250, 0, 56, COUNTER),
+	TI(0x10020248, 0, 56, COUNTER),
+	TI(0x10020258, 0, 56, COUNTER),
+	TI(0x100202e0, 0, 56, COUNTER),
+	TI(0x100202e8, 0, 56, COUNTER),
+	TI(0x100202d8, 0, 56, COUNTER),
+	TI(0x100202d0, 0, 56, COUNTER),
+	TI(0x100202c0, 0, 56, COUNTER),
+	TI(0x100202c8, 0, 56, COUNTER),
+	TI(0x100202a8, 0, 56, COUNTER),
+	TI(0x100202b0, 0, 56, COUNTER),
+	TI(0x100202a0, 0, 56, COUNTER),
+	TI(0x100202b8, 0, 56, COUNTER),
+	TI(0x10020298, 0, 56, COUNTER),
+	TI(0x100202f0, 0, 56, COUNTER),
+	TI(0x100202f8, 0, 56, COUNTER),
+	TI(0x10020380, 0, 56, COUNTER),
+	TI(0x10020388, 0, 56, COUNTER),
+	TI(0x10020350, 0, 56, COUNTER),
+	TI(0x10020370, 0, 56, COUNTER),
+	TI(0x10020378, 0, 56, COUNTER),
+	TI(0x10020358, 0, 56, COUNTER),
+	TI(0x10020328, 0, 56, COUNTER),
+	TI(0x10020360, 0, 56, COUNTER),
+	TI(0x10020368, 0, 56, COUNTER),
+	TI(0x10020340, 0, 56, COUNTER),
+	TI(0x10020330, 0, 56, COUNTER),
+	TI(0x10020320, 0, 56, COUNTER),
+	TI(0x10020318, 0, 56, COUNTER),
+	TI(0x10020348, 0, 56, COUNTER),
+	TI(0x10020308, 0, 56, COUNTER),
+	TI(0x10020300, 0, 56, COUNTER),
+	TI(0x10020310, 0, 56, COUNTER),
+	TI(0x10020338, 0, 56, COUNTER),
+	TI(0x9870a78, 0, 56, COUNTER),
+	TI(0x9870a80, 0, 56, COUNTER),
+	TI(0x9870a48, 0, 56, COUNTER),
+	TI(0x9870a50, 0, 56, COUNTER),
+	TI(0x9870a58, 0, 56, COUNTER),
+	TI(0x9870a60, 0, 56, COUNTER),
+	TI(0x9870a68, 0, 56, COUNTER),
+	TI(0x9870a70, 0, 56, COUNTER),
+	TI(0x9870a40, 0, 56, COUNTER),
+	TI(0x100450, 0, 56, COUNTER),
+	TI(0x100420, 0, 56, COUNTER),
+	TI(0x100428, 0, 56, COUNTER),
+	TI(0x1004e0, 0, 56, COUNTER),
+	TI(0x1004e8, 0, 56, COUNTER),
+	TI(0x1004f0, 0, 56, COUNTER),
+	TI(0x1004f8, 0, 56, COUNTER),
+	TI(0x100500, 0, 56, COUNTER),
+	TI(0x100508, 0, 56, COUNTER),
+	TI(0x100510, 0, 56, COUNTER),
+	TI(0x100518, 0, 56, COUNTER),
+	TI(0x100520, 0, 56, COUNTER),
+	TI(0x100528, 0, 56, COUNTER),
+	TI(0x100530, 0, 56, COUNTER),
+	TI(0x100538, 0, 56, COUNTER),
+	TI(0x100540, 0, 56, COUNTER),
+	TI(0x100548, 0, 56, COUNTER),
+	TI(0x100550, 0, 56, COUNTER),
+	TI(0x100558, 0, 56, COUNTER),
+	TI(0x100408, 0, 56, COUNTER),
+	TI(0x100448, 0, 56, COUNTER),
+	TI(0x100498, 0, 56, COUNTER),
+	TI(0x100490, 0, 56, COUNTER),
+	TI(0x1004c0, 0, 56, COUNTER),
+	TI(0x1004c8, 0, 56, COUNTER),
+	TI(0x1004d0, 0, 56, COUNTER),
+	TI(0x1004d8, 0, 56, COUNTER),
+	TI(0x1004a0, 0, 56, COUNTER),
+	TI(0x1004a8, 0, 56, COUNTER),
+	TI(0x1004b0, 0, 56, COUNTER),
+	TI(0x1004b8, 0, 56, COUNTER),
+	TI(0x100400, 0, 56, COUNTER),
+	TI(0x100430, 0, 56, COUNTER),
+	TI(0x100440, 0, 56, COUNTER),
+	TI(0x100438, 0, 56, COUNTER),
+};
+
+#define C2_TELEM_TOTAL	1923
+#define C2_TELEM_VALID	1922
+static const struct telem_item c2_items[C2_TELEM_TOTAL] = {
+	TU,
+	TI(0x100205d0, 0, 56, COUNTER),
+	TI(0x100205d8, 0, 56, COUNTER),
+	TI(0x100205e0, 0, 56, COUNTER),
+	TI(0x100205e8, 0, 56, COUNTER),
+	TI(0x100205c8, 0, 56, COUNTER),
+	TI(0x10020590, 0, 56, COUNTER),
+	TI(0x10020508, 0, 56, COUNTER),
+	TI(0x10020510, 0, 56, COUNTER),
+	TI(0x10020518, 0, 56, COUNTER),
+	TI(0x10020520, 0, 56, COUNTER),
+	TI(0x100205b8, 0, 56, COUNTER),
+	TI(0x100204a8, 0, 56, COUNTER),
+	TI(0x100204b0, 0, 56, COUNTER),
+	TI(0x100204b8, 0, 56, COUNTER),
+	TI(0x100204c0, 0, 56, COUNTER),
+	TI(0x100205a8, 0, 56, COUNTER),
+	TI(0x10020588, 0, 56, COUNTER),
+	TI(0x10020430, 0, 56, COUNTER),
+	TI(0x10020438, 0, 56, COUNTER),
+	TI(0x10020440, 0, 56, COUNTER),
+	TI(0x10020448, 0, 56, COUNTER),
+	TI(0x10020450, 0, 56, COUNTER),
+	TI(0x10020458, 0, 56, COUNTER),
+	TI(0x10020460, 0, 56, COUNTER),
+	TI(0x10020468, 0, 56, COUNTER),
+	TI(0x10020470, 0, 56, COUNTER),
+	TI(0x10020478, 0, 56, COUNTER),
+	TI(0x10020480, 0, 56, COUNTER),
+	TI(0x10020488, 0, 56, COUNTER),
+	TI(0x10020410, 0, 56, COUNTER),
+	TI(0x10020418, 0, 56, COUNTER),
+	TI(0x10020420, 0, 56, COUNTER),
+	TI(0x10020428, 0, 56, COUNTER),
+	TI(0x100204a0, 0, 56, COUNTER),
+	TI(0x10020498, 0, 56, COUNTER),
+	TI(0x10020490, 0, 56, COUNTER),
+	TI(0x100204f8, 0, 56, COUNTER),
+	TI(0x100204f0, 0, 56, COUNTER),
+	TI(0x100204e8, 0, 56, COUNTER),
+	TI(0x10020568, 0, 56, COUNTER),
+	TI(0x10020570, 0, 56, COUNTER),
+	TI(0x10020578, 0, 56, COUNTER),
+	TI(0x10020580, 0, 56, COUNTER),
+	TI(0x10020500, 0, 56, COUNTER),
+	TI(0x100205a0, 0, 56, COUNTER),
+	TI(0x10020598, 0, 56, COUNTER),
+	TI(0x100205f0, 0, 56, COUNTER),
+	TI(0x100205f8, 0, 56, COUNTER),
+	TI(0x10020400, 0, 56, COUNTER),
+	TI(0x10020408, 0, 56, COUNTER),
+	TI(0x10020528, 0, 56, COUNTER),
+	TI(0x10020530, 0, 56, COUNTER),
+	TI(0x10020538, 0, 56, COUNTER),
+	TI(0x10020540, 0, 56, COUNTER),
+	TI(0x100204c8, 0, 56, COUNTER),
+	TI(0x100204d0, 0, 56, COUNTER),
+	TI(0x100204d8, 0, 56, COUNTER),
+	TI(0x100204e0, 0, 56, COUNTER),
+	TI(0x10020548, 0, 56, COUNTER),
+	TI(0x10020550, 0, 56, COUNTER),
+	TI(0x10020558, 0, 56, COUNTER),
+	TI(0x10020560, 0, 56, COUNTER),
+	TI(0x100205c0, 0, 56, COUNTER),
+	TI(0x100205b0, 0, 56, COUNTER),
+	TI(0x540, 4, 16, COUNTER),
+	TI(0x100280, 0, 56, COUNTER),
+	TI(0x100288, 0, 56, COUNTER),
+	TI(0x100290, 0, 56, COUNTER),
+	TI(0x100298, 0, 56, COUNTER),
+	TI(0x1002a0, 0, 56, COUNTER),
+	TI(0x1002a8, 0, 56, COUNTER),
+	TI(0x1002b0, 0, 56, COUNTER),
+	TI(0x1002b8, 0, 56, COUNTER),
+	TI(0x1002c0, 0, 56, COUNTER),
+	TI(0x1002c8, 0, 56, COUNTER),
+	TI(0x1002d0, 0, 56, COUNTER),
+	TI(0x1002d8, 0, 56, COUNTER),
+	TI(0x1002e0, 0, 56, COUNTER),
+	TI(0x1002e8, 0, 56, COUNTER),
+	TI(0x1002f0, 0, 56, COUNTER),
+	TI(0x1002f8, 0, 56, COUNTER),
+	TI(0x100130, 0, 56, COUNTER),
+	TI(0x100140, 0, 56, COUNTER),
+	TI(0x100138, 0, 56, COUNTER),
+	TI(0x100148, 0, 56, COUNTER),
+	TI(0x100158, 0, 56, COUNTER),
+	TI(0x100150, 0, 56, COUNTER),
+	TI(0x100300, 0, 56, COUNTER),
+	TI(0x100308, 0, 56, COUNTER),
+	TI(0x100310, 0, 56, COUNTER),
+	TI(0x100318, 0, 56, COUNTER),
+	TI(0x100200, 0, 56, COUNTER),
+	TI(0x100208, 0, 56, COUNTER),
+	TI(0x100210, 0, 56, COUNTER),
+	TI(0x100218, 0, 56, COUNTER),
+	TI(0x100220, 0, 56, COUNTER),
+	TI(0x100228, 0, 56, COUNTER),
+	TI(0x100230, 0, 56, COUNTER),
+	TI(0x100238, 0, 56, COUNTER),
+	TI(0x100240, 0, 56, COUNTER),
+	TI(0x100248, 0, 56, COUNTER),
+	TI(0x100250, 0, 56, COUNTER),
+	TI(0x100258, 0, 56, COUNTER),
+	TI(0x100260, 0, 56, COUNTER),
+	TI(0x100268, 0, 56, COUNTER),
+	TI(0x100270, 0, 56, COUNTER),
+	TI(0x100278, 0, 56, COUNTER),
+	TI(0x100018, 0, 56, COUNTER),
+	TI(0x100010, 0, 56, COUNTER),
+	TI(0x100020, 0, 56, COUNTER),
+	TI(0x100028, 0, 56, COUNTER),
+	TI(0x1001a0, 0, 56, COUNTER),
+	TI(0x1001a8, 0, 56, COUNTER),
+	TI(0x1001b0, 0, 56, COUNTER),
+	TI(0x1001b8, 0, 56, COUNTER),
+	TI(0x100180, 0, 56, COUNTER),
+	TI(0x100188, 0, 56, COUNTER),
+	TI(0x100190, 0, 56, COUNTER),
+	TI(0x100198, 0, 56, COUNTER),
+	TI(0x100160, 0, 56, COUNTER),
+	TI(0x100168, 0, 56, COUNTER),
+	TI(0x100170, 0, 56, COUNTER),
+	TI(0x100178, 0, 56, COUNTER),
+	TI(0x1001c0, 0, 56, COUNTER),
+	TI(0x1001c8, 0, 56, COUNTER),
+	TI(0x1001d0, 0, 56, COUNTER),
+	TI(0x1001d8, 0, 56, COUNTER),
+	TI(0x1003e0, 0, 56, COUNTER),
+	TI(0x1003e8, 0, 56, COUNTER),
+	TI(0x1003f0, 0, 56, COUNTER),
+	TI(0x1003f8, 0, 56, COUNTER),
+	TI(0x1003a0, 0, 56, COUNTER),
+	TI(0x1003a8, 0, 56, COUNTER),
+	TI(0x1003b0, 0, 56, COUNTER),
+	TI(0x1003b8, 0, 56, COUNTER),
+	TI(0x1003c0, 0, 56, COUNTER),
+	TI(0x1003c8, 0, 56, COUNTER),
+	TI(0x1003d0, 0, 56, COUNTER),
+	TI(0x1003d8, 0, 56, COUNTER),
+	TI(0x100380, 0, 56, COUNTER),
+	TI(0x100388, 0, 56, COUNTER),
+	TI(0x100390, 0, 56, COUNTER),
+	TI(0x100398, 0, 56, COUNTER),
+	TI(0x100080, 0, 56, COUNTER),
+	TI(0x100088, 0, 56, COUNTER),
+	TI(0x100090, 0, 56, COUNTER),
+	TI(0x100098, 0, 56, COUNTER),
+	TI(0x100120, 0, 56, COUNTER),
+	TI(0x100128, 0, 56, COUNTER),
+	TI(0x1001e0, 0, 56, COUNTER),
+	TI(0x1001e8, 0, 56, COUNTER),
+	TI(0x1001f0, 0, 56, COUNTER),
+	TI(0x1001f8, 0, 56, COUNTER),
+	TI(0x1000a0, 0, 56, COUNTER),
+	TI(0x1000a8, 0, 56, COUNTER),
+	TI(0x1000b0, 0, 56, COUNTER),
+	TI(0x1000b8, 0, 56, COUNTER),
+	TI(0x100100, 0, 56, COUNTER),
+	TI(0x100110, 0, 56, COUNTER),
+	TI(0x100108, 0, 56, COUNTER),
+	TI(0x100118, 0, 56, COUNTER),
+	TI(0x100060, 0, 56, COUNTER),
+	TI(0x100068, 0, 56, COUNTER),
+	TI(0x100070, 0, 56, COUNTER),
+	TI(0x100078, 0, 56, COUNTER),
+	TI(0x100038, 0, 56, COUNTER),
+	TI(0x100030, 0, 56, COUNTER),
+	TI(0x8b0, 24, 5, UGAUGE),
+	TI(0x8b8, 52, 9, UGAUGE),
+	TI(0x8b8, 40, 9, UGAUGE),
+	TI(0x8b0, 0, 10, UGAUGE),
+	TI(0x8b0, 16, 4, UGAUGE),
+	TI(0x8b8, 0, 5, UGAUGE),
+	TI(0x8b0, 56, 5, UGAUGE),
+	TI(0x8b0, 48, 5, UGAUGE),
+	TI(0x8b8, 24, 3, UGAUGE),
+	TI(0x8b8, 36, 3, UGAUGE),
+	TI(0x8b8, 16, 3, UGAUGE),
+	TI(0x8b0, 40, 7, UGAUGE),
+	TI(0x8b8, 8, 5, UGAUGE),
+	TI(0x8b8, 32, 4, UGAUGE),
+	TI(0x4a000, 0, 56, COUNTER),
+	TI(0x4a008, 0, 56, COUNTER),
+	TI(0x4a010, 0, 56, COUNTER),
+	TI(0x4a018, 0, 56, COUNTER),
+	TI(0x4b000, 0, 41, UGAUGE),
+	TI(0x4b008, 0, 41, UGAUGE),
+	TI(0x4b010, 0, 41, UGAUGE),
+	TI(0x4b018, 0, 41, UGAUGE),
+	TI(0x4b020, 0, 41, UGAUGE),
+	TI(0x4b028, 0, 41, UGAUGE),
+	TI(0x4b030, 0, 41, UGAUGE),
+	TI(0x4b038, 0, 41, UGAUGE),
+	TI(0x4b040, 0, 41, UGAUGE),
+	TI(0x4b048, 0, 41, UGAUGE),
+	TI(0x4b050, 0, 41, UGAUGE),
+	TI(0x4b058, 0, 41, UGAUGE),
+	TI(0x4b060, 0, 41, UGAUGE),
+	TI(0x4b068, 0, 41, UGAUGE),
+	TI(0x4b070, 0, 41, UGAUGE),
+	TI(0x4b078, 0, 41, UGAUGE),
+	TI(0x4b080, 0, 41, UGAUGE),
+	TI(0x4b088, 0, 41, UGAUGE),
+	TI(0x4b090, 0, 41, UGAUGE),
+	TI(0x4b098, 0, 41, UGAUGE),
+	TI(0x4b0a0, 0, 41, UGAUGE),
+	TI(0x4b0a8, 0, 41, UGAUGE),
+	TI(0x4b0b0, 0, 41, UGAUGE),
+	TI(0x4b0b8, 0, 41, UGAUGE),
+	TI(0x4b0c0, 0, 41, UGAUGE),
+	TI(0x4b0c8, 0, 41, UGAUGE),
+	TI(0x4b0d0, 0, 41, UGAUGE),
+	TI(0x4b0d8, 0, 41, UGAUGE),
+	TI(0x4b0e0, 0, 41, UGAUGE),
+	TI(0x4b0e8, 0, 41, UGAUGE),
+	TI(0x4b0f0, 0, 41, UGAUGE),
+	TI(0x4b0f8, 0, 41, UGAUGE),
+	TI(0x4b100, 0, 41, UGAUGE),
+	TI(0x4b108, 0, 41, UGAUGE),
+	TI(0x4b110, 0, 41, UGAUGE),
+	TI(0x4b118, 0, 41, UGAUGE),
+	TI(0x4b120, 0, 41, UGAUGE),
+	TI(0x4b128, 0, 41, UGAUGE),
+	TI(0x4b130, 0, 41, UGAUGE),
+	TI(0x4b138, 0, 41, UGAUGE),
+	TI(0x4b140, 0, 41, UGAUGE),
+	TI(0x4b148, 0, 41, UGAUGE),
+	TI(0x4b150, 0, 41, UGAUGE),
+	TI(0x4b158, 0, 41, UGAUGE),
+	TI(0x4b160, 0, 41, UGAUGE),
+	TI(0x4b168, 0, 41, UGAUGE),
+	TI(0x4b170, 0, 41, UGAUGE),
+	TI(0x4b178, 0, 41, UGAUGE),
+	TI(0x4a020, 0, 56, COUNTER),
+	TI(0x4a028, 0, 56, COUNTER),
+	TI(0x4a030, 0, 56, COUNTER),
+	TI(0x4a038, 0, 56, COUNTER),
+	TI(0x4a040, 0, 56, COUNTER),
+	TI(0x4a048, 0, 56, COUNTER),
+	TI(0x4a050, 0, 56, COUNTER),
+	TI(0x4a058, 0, 56, COUNTER),
+	TI(0x4a080, 0, 56, COUNTER),
+	TI(0x4a088, 0, 56, COUNTER),
+	TI(0x4a090, 0, 56, COUNTER),
+	TI(0x4a098, 0, 56, COUNTER),
+	TI(0x850, 0, 12, UGAUGE),
+	TI(0x858, 0, 12, UGAUGE),
+	TI(0x860, 0, 12, UGAUGE),
+	TI(0x868, 0, 12, UGAUGE),
+	TI(0x4a060, 0, 56, COUNTER),
+	TI(0x4a068, 0, 56, COUNTER),
+	TI(0x4a070, 0, 56, COUNTER),
+	TI(0x4a078, 0, 56, COUNTER),
+	TI(0x100008, 0, 56, COUNTER),
+	TI(0x100000, 0, 56, COUNTER),
+	TI(0x1000e0, 0, 56, COUNTER),
+	TI(0x1000e8, 0, 56, COUNTER),
+	TI(0x1000f0, 0, 56, COUNTER),
+	TI(0x1000f8, 0, 56, COUNTER),
+	TI(0x1000c0, 0, 56, COUNTER),
+	TI(0x1000c8, 0, 56, COUNTER),
+	TI(0x1000d0, 0, 56, COUNTER),
+	TI(0x1000d8, 0, 56, COUNTER),
+	TI(0x100040, 0, 56, COUNTER),
+	TI(0x100b40, 0, 56, COUNTER),
+	TI(0x100b48, 0, 56, COUNTER),
+	TI(0x100b50, 0, 56, COUNTER),
+	TI(0x100b58, 0, 56, COUNTER),
+	TI(0x100d20, 0, 56, COUNTER),
+	TI(0x100aa0, 0, 56, COUNTER),
+	TI(0x100aa8, 0, 56, COUNTER),
+	TI(0x100ab0, 0, 56, COUNTER),
+	TI(0x100ab8, 0, 56, COUNTER),
+	TI(0x100c90, 0, 56, COUNTER),
+	TI(0x100c98, 0, 56, COUNTER),
+	TI(0x100c58, 0, 56, COUNTER),
+	TI(0x100c60, 0, 56, COUNTER),
+	TI(0x100c68, 0, 56, COUNTER),
+	TI(0x100b20, 0, 56, COUNTER),
+	TI(0x100b28, 0, 56, COUNTER),
+	TI(0x100b30, 0, 56, COUNTER),
+	TI(0x100b38, 0, 56, COUNTER),
+	TI(0x100b00, 0, 56, COUNTER),
+	TI(0x100b08, 0, 56, COUNTER),
+	TI(0x100b10, 0, 56, COUNTER),
+	TI(0x100b18, 0, 56, COUNTER),
+	TI(0x100e50, 0, 56, COUNTER),
+	TI(0x100e60, 0, 56, COUNTER),
+	TI(0x100e58, 0, 56, COUNTER),
+	TI(0x100e68, 0, 56, COUNTER),
+	TI(0x100e90, 0, 56, COUNTER),
+	TI(0x100a80, 0, 56, COUNTER),
+	TI(0x100a88, 0, 56, COUNTER),
+	TI(0x100a90, 0, 56, COUNTER),
+	TI(0x100a98, 0, 56, COUNTER),
+	TI(0x100b60, 0, 56, COUNTER),
+	TI(0x100b68, 0, 56, COUNTER),
+	TI(0x100b70, 0, 56, COUNTER),
+	TI(0x100b78, 0, 56, COUNTER),
+	TI(0x100d10, 0, 56, COUNTER),
+	TI(0x100cb0, 0, 56, COUNTER),
+	TI(0x100cb8, 0, 56, COUNTER),
+	TI(0x100d00, 0, 56, COUNTER),
+	TI(0x100d08, 0, 56, COUNTER),
+	TI(0x100cd0, 0, 56, COUNTER),
+	TI(0x100cd8, 0, 56, COUNTER),
+	TI(0x100d18, 0, 56, COUNTER),
+	TI(0x100cc0, 0, 56, COUNTER),
+	TI(0x100cc8, 0, 56, COUNTER),
+	TI(0x100ca8, 0, 56, COUNTER),
+	TI(0x100ce0, 0, 56, COUNTER),
+	TI(0x100ce8, 0, 56, COUNTER),
+	TI(0x100cf0, 0, 56, COUNTER),
+	TI(0x100cf8, 0, 56, COUNTER),
+	TI(0x100d88, 0, 56, COUNTER),
+	TI(0x100d50, 0, 56, COUNTER),
+	TI(0x100d70, 0, 56, COUNTER),
+	TI(0x100dc8, 0, 56, COUNTER),
+	TI(0x100e30, 0, 56, COUNTER),
+	TI(0x100e20, 0, 56, COUNTER),
+	TI(0x100dc0, 0, 56, COUNTER),
+	TI(0x100dd8, 0, 56, COUNTER),
+	TI(0x100d58, 0, 56, COUNTER),
+	TI(0x100d78, 0, 56, COUNTER),
+	TI(0x100d48, 0, 56, COUNTER),
+	TI(0x100d68, 0, 56, COUNTER),
+	TI(0x100d98, 0, 56, COUNTER),
+	TI(0x100de8, 0, 56, COUNTER),
+	TI(0x100e38, 0, 56, COUNTER),
+	TI(0x100de0, 0, 56, COUNTER),
+	TI(0x100d40, 0, 56, COUNTER),
+	TI(0x100d60, 0, 56, COUNTER),
+	TI(0x100db8, 0, 56, COUNTER),
+	TI(0x100d90, 0, 56, COUNTER),
+	TI(0x100da0, 0, 56, COUNTER),
+	TI(0x100d80, 0, 56, COUNTER),
+	TI(0x100da8, 0, 56, COUNTER),
+	TI(0x100e28, 0, 56, COUNTER),
+	TI(0x100dd0, 0, 56, COUNTER),
+	TI(0x100db0, 0, 56, COUNTER),
+	TI(0x100a40, 0, 56, COUNTER),
+	TI(0x100a48, 0, 56, COUNTER),
+	TI(0x100a50, 0, 56, COUNTER),
+	TI(0x100a58, 0, 56, COUNTER),
+	TI(0x100a60, 0, 56, COUNTER),
+	TI(0x100a68, 0, 56, COUNTER),
+	TI(0x100a70, 0, 56, COUNTER),
+	TI(0x100a78, 0, 56, COUNTER),
+	TI(0x100a20, 0, 56, COUNTER),
+	TI(0x100a28, 0, 56, COUNTER),
+	TI(0x100a30, 0, 56, COUNTER),
+	TI(0x100a38, 0, 56, COUNTER),
+	TI(0x100a00, 0, 56, COUNTER),
+	TI(0x100a08, 0, 56, COUNTER),
+	TI(0x100a10, 0, 56, COUNTER),
+	TI(0x100a18, 0, 56, COUNTER),
+	TI(0x100ae0, 0, 56, COUNTER),
+	TI(0x100ae8, 0, 56, COUNTER),
+	TI(0x100af0, 0, 56, COUNTER),
+	TI(0x100af8, 0, 56, COUNTER),
+	TI(0x100c80, 0, 56, COUNTER),
+	TI(0x100c88, 0, 56, COUNTER),
+	TI(0x100c40, 0, 56, COUNTER),
+	TI(0x100c48, 0, 56, COUNTER),
+	TI(0x100c50, 0, 56, COUNTER),
+	TI(0x100bc8, 0, 56, COUNTER),
+	TI(0x100bd8, 0, 56, COUNTER),
+	TI(0x100bc0, 0, 56, COUNTER),
+	TI(0x100bb0, 0, 56, COUNTER),
+	TI(0x100bb8, 0, 56, COUNTER),
+	TI(0x100bd0, 0, 56, COUNTER),
+	TI(0x100b98, 0, 56, COUNTER),
+	TI(0x100ba8, 0, 56, COUNTER),
+	TI(0x100b90, 0, 56, COUNTER),
+	TI(0x100b80, 0, 56, COUNTER),
+	TI(0x100b88, 0, 56, COUNTER),
+	TI(0x100ba0, 0, 56, COUNTER),
+	TI(0x100ca0, 0, 56, COUNTER),
+	TI(0x100e40, 0, 56, COUNTER),
+	TI(0x100e48, 0, 56, COUNTER),
+	TI(0x100bf8, 0, 56, COUNTER),
+	TI(0x100c08, 0, 56, COUNTER),
+	TI(0x100bf0, 0, 56, COUNTER),
+	TI(0x100be0, 0, 56, COUNTER),
+	TI(0x100be8, 0, 56, COUNTER),
+	TI(0x100c00, 0, 56, COUNTER),
+	TI(0x100ac0, 0, 56, COUNTER),
+	TI(0x100ac8, 0, 56, COUNTER),
+	TI(0x100ad0, 0, 56, COUNTER),
+	TI(0x100ad8, 0, 56, COUNTER),
+	TI(0x100c28, 0, 56, COUNTER),
+	TI(0x100c38, 0, 56, COUNTER),
+	TI(0x100c20, 0, 56, COUNTER),
+	TI(0x100c10, 0, 56, COUNTER),
+	TI(0x100c18, 0, 56, COUNTER),
+	TI(0x100c30, 0, 56, COUNTER),
+	TI(0x100e78, 0, 56, COUNTER),
+	TI(0x100e80, 0, 56, COUNTER),
+	TI(0x8800808, 0, 9, UGAUGE),
+	TI(0x8800808, 16, 9, UGAUGE),
+	TI(0x100e88, 0, 56, COUNTER),
+	TI(0x100d30, 0, 56, COUNTER),
+	TI(0x100d38, 0, 56, COUNTER),
+	TI(0x100d28, 0, 56, COUNTER),
+	TI(0x100c70, 0, 56, COUNTER),
+	TI(0x100c78, 0, 56, COUNTER),
+	TI(0x100e70, 0, 56, COUNTER),
+	TI(0x10004b8, 4, 16, COUNTER),
+	TI(0x1002000, 0, 56, COUNTER),
+	TI(0x10020c0, 0, 56, COUNTER),
+	TI(0x10020c8, 0, 56, COUNTER),
+	TI(0x10020d0, 0, 56, COUNTER),
+	TI(0x10020d8, 0, 56, COUNTER),
+	TI(0x10020e0, 0, 56, COUNTER),
+	TI(0x10020e8, 0, 56, COUNTER),
+	TI(0x10020f0, 0, 56, COUNTER),
+	TI(0x10020f8, 0, 56, COUNTER),
+	TI(0x10022b8, 0, 56, COUNTER),
+	TI(0x10022b0, 0, 56, COUNTER),
+	TI(0x10022a8, 0, 56, COUNTER),
+	TI(0x1002290, 0, 56, COUNTER),
+	TI(0x1002298, 0, 56, COUNTER),
+	TI(0x1002288, 0, 56, COUNTER),
+	TI(0x10022a0, 0, 56, COUNTER),
+	TI(0x1002280, 0, 56, COUNTER),
+	TI(0x1002270, 0, 56, COUNTER),
+	TI(0x1002278, 0, 56, COUNTER),
+	TI(0x1002708, 0, 56, COUNTER),
+	TI(0x1002780, 0, 56, COUNTER),
+	TI(0x1002718, 0, 56, COUNTER),
+	TI(0x10026f0, 0, 56, COUNTER),
+	TI(0x1002748, 0, 56, COUNTER),
+	TI(0x1002730, 0, 56, COUNTER),
+	TI(0x1002770, 0, 56, COUNTER),
+	TI(0x1002760, 0, 56, COUNTER),
+	TI(0x1002750, 0, 56, COUNTER),
+	TI(0x1002758, 0, 56, COUNTER),
+	TI(0x10026f8, 0, 56, COUNTER),
+	TI(0x1002700, 0, 56, COUNTER),
+	TI(0x10026e0, 0, 56, COUNTER),
+	TI(0x10026e8, 0, 56, COUNTER),
+	TI(0x1002710, 0, 56, COUNTER),
+	TI(0x1002738, 0, 56, COUNTER),
+	TI(0x1002720, 0, 56, COUNTER),
+	TI(0x1002740, 0, 56, COUNTER),
+	TI(0x1002728, 0, 56, COUNTER),
+	TI(0x1002778, 0, 56, COUNTER),
+	TI(0x1002768, 0, 56, COUNTER),
+	TI(0x1002660, 0, 56, COUNTER),
+	TI(0x10026b0, 0, 56, COUNTER),
+	TI(0x10026b8, 0, 56, COUNTER),
+	TI(0x10026a8, 0, 56, COUNTER),
+	TI(0x1002670, 0, 56, COUNTER),
+	TI(0x1002650, 0, 56, COUNTER),
+	TI(0x1002658, 0, 56, COUNTER),
+	TI(0x10026d0, 0, 56, COUNTER),
+	TI(0x10026d8, 0, 56, COUNTER),
+	TI(0x1002640, 0, 56, COUNTER),
+	TI(0x1002648, 0, 56, COUNTER),
+	TI(0x1002668, 0, 56, COUNTER),
+	TI(0x10026c0, 0, 56, COUNTER),
+	TI(0x1002680, 0, 56, COUNTER),
+	TI(0x1002688, 0, 56, COUNTER),
+	TI(0x1002678, 0, 56, COUNTER),
+	TI(0x1002698, 0, 56, COUNTER),
+	TI(0x10026a0, 0, 56, COUNTER),
+	TI(0x1002690, 0, 56, COUNTER),
+	TI(0x10026c8, 0, 56, COUNTER),
+	TI(0x1002628, 0, 56, COUNTER),
+	TI(0x1002620, 0, 56, COUNTER),
+	TI(0x1002630, 0, 56, COUNTER),
+	TI(0x1002638, 0, 56, COUNTER),
+	TI(0x10024c0, 0, 56, COUNTER),
+	TI(0x10024c8, 0, 56, COUNTER),
+	TI(0x10024d0, 0, 56, COUNTER),
+	TI(0x10024d8, 0, 56, COUNTER),
+	TI(0x10024e0, 0, 56, COUNTER),
+	TI(0x10024e8, 0, 56, COUNTER),
+	TI(0x10024f0, 0, 56, COUNTER),
+	TI(0x10024f8, 0, 56, COUNTER),
+	TI(0x1002480, 0, 56, COUNTER),
+	TI(0x1002488, 0, 56, COUNTER),
+	TI(0x1002490, 0, 56, COUNTER),
+	TI(0x1002498, 0, 56, COUNTER),
+	TI(0x10024a0, 0, 56, COUNTER),
+	TI(0x10024a8, 0, 56, COUNTER),
+	TI(0x10024b0, 0, 56, COUNTER),
+	TI(0x10024b8, 0, 56, COUNTER),
+	TI(0x10022c0, 0, 56, COUNTER),
+	TI(0x10022c8, 0, 56, COUNTER),
+	TI(0x10022d0, 0, 56, COUNTER),
+	TI(0x10022d8, 0, 56, COUNTER),
+	TI(0x10022e0, 0, 56, COUNTER),
+	TI(0x10022e8, 0, 56, COUNTER),
+	TI(0x10022f0, 0, 56, COUNTER),
+	TI(0x10022f8, 0, 56, COUNTER),
+	TI(0x10023d0, 0, 56, COUNTER),
+	TI(0x10023c8, 0, 56, COUNTER),
+	TI(0x1002300, 0, 56, COUNTER),
+	TI(0x1002308, 0, 56, COUNTER),
+	TI(0x1002310, 0, 56, COUNTER),
+	TI(0x1002318, 0, 56, COUNTER),
+	TI(0x1002320, 0, 56, COUNTER),
+	TI(0x1002328, 0, 56, COUNTER),
+	TI(0x1002330, 0, 56, COUNTER),
+	TI(0x1002338, 0, 56, COUNTER),
+	TI(0x1002510, 0, 56, COUNTER),
+	TI(0x10025a8, 0, 56, COUNTER),
+	TI(0x10025b0, 0, 56, COUNTER),
+	TI(0x10025b8, 0, 56, COUNTER),
+	TI(0x10025c0, 0, 56, COUNTER),
+	TI(0x10025c8, 0, 56, COUNTER),
+	TI(0x10025d0, 0, 56, COUNTER),
+	TI(0x10025d8, 0, 56, COUNTER),
+	TI(0x10025e0, 0, 56, COUNTER),
+	TI(0x10025e8, 0, 56, COUNTER),
+	TI(0x10025f0, 0, 56, COUNTER),
+	TI(0x10025f8, 0, 56, COUNTER),
+	TI(0x1002600, 0, 56, COUNTER),
+	TI(0x1002608, 0, 56, COUNTER),
+	TI(0x1002610, 0, 56, COUNTER),
+	TI(0x1002618, 0, 56, COUNTER),
+	TI(0x1002528, 0, 56, COUNTER),
+	TI(0x1002530, 0, 56, COUNTER),
+	TI(0x1002538, 0, 56, COUNTER),
+	TI(0x1002540, 0, 56, COUNTER),
+	TI(0x1002548, 0, 56, COUNTER),
+	TI(0x1002550, 0, 56, COUNTER),
+	TI(0x1002558, 0, 56, COUNTER),
+	TI(0x1002560, 0, 56, COUNTER),
+	TI(0x1002568, 0, 56, COUNTER),
+	TI(0x1002570, 0, 56, COUNTER),
+	TI(0x1002578, 0, 56, COUNTER),
+	TI(0x1002580, 0, 56, COUNTER),
+	TI(0x1002588, 0, 56, COUNTER),
+	TI(0x1002590, 0, 56, COUNTER),
+	TI(0x1002598, 0, 56, COUNTER),
+	TI(0x10025a0, 0, 56, COUNTER),
+	TI(0x1002520, 0, 56, COUNTER),
+	TI(0x1002500, 0, 56, COUNTER),
+	TI(0x1002508, 0, 56, COUNTER),
+	TI(0x1002518, 0, 56, COUNTER),
+	TI(0x1002080, 0, 56, COUNTER),
+	TI(0x1002088, 0, 56, COUNTER),
+	TI(0x1002090, 0, 56, COUNTER),
+	TI(0x1002098, 0, 56, COUNTER),
+	TI(0x10020a0, 0, 56, COUNTER),
+	TI(0x10020a8, 0, 56, COUNTER),
+	TI(0x10020b0, 0, 56, COUNTER),
+	TI(0x10020b8, 0, 56, COUNTER),
+	TI(0x1002440, 0, 56, COUNTER),
+	TI(0x1002448, 0, 56, COUNTER),
+	TI(0x1002450, 0, 56, COUNTER),
+	TI(0x1002458, 0, 56, COUNTER),
+	TI(0x1002460, 0, 56, COUNTER),
+	TI(0x1002468, 0, 56, COUNTER),
+	TI(0x1002470, 0, 56, COUNTER),
+	TI(0x1002478, 0, 56, COUNTER),
+	TI(0x1002400, 0, 56, COUNTER),
+	TI(0x1002408, 0, 56, COUNTER),
+	TI(0x1002410, 0, 56, COUNTER),
+	TI(0x1002418, 0, 56, COUNTER),
+	TI(0x1002420, 0, 56, COUNTER),
+	TI(0x1002428, 0, 56, COUNTER),
+	TI(0x1002430, 0, 56, COUNTER),
+	TI(0x1002438, 0, 56, COUNTER),
+	TI(0x10021a8, 0, 56, COUNTER),
+	TI(0x10021b0, 0, 56, COUNTER),
+	TI(0x1002200, 0, 56, COUNTER),
+	TI(0x1002208, 0, 56, COUNTER),
+	TI(0x1002210, 0, 56, COUNTER),
+	TI(0x1002218, 0, 56, COUNTER),
+	TI(0x1002220, 0, 56, COUNTER),
+	TI(0x1002228, 0, 56, COUNTER),
+	TI(0x1002230, 0, 56, COUNTER),
+	TI(0x1002238, 0, 56, COUNTER),
+	TI(0x1002240, 0, 56, COUNTER),
+	TI(0x1002248, 0, 56, COUNTER),
+	TI(0x1002250, 0, 56, COUNTER),
+	TI(0x1002258, 0, 56, COUNTER),
+	TI(0x1002260, 0, 56, COUNTER),
+	TI(0x1002268, 0, 56, COUNTER),
+	TI(0x10021d0, 0, 56, COUNTER),
+	TI(0x10021b8, 0, 56, COUNTER),
+	TI(0x10021d8, 0, 56, COUNTER),
+	TI(0x1002198, 0, 56, COUNTER),
+	TI(0x10021e8, 0, 56, COUNTER),
+	TI(0x10021c8, 0, 56, COUNTER),
+	TI(0x10021c0, 0, 56, COUNTER),
+	TI(0x10021a0, 0, 56, COUNTER),
+	TI(0x10021e0, 0, 56, COUNTER),
+	TI(0x10021f0, 0, 56, COUNTER),
+	TI(0x10021f8, 0, 56, COUNTER),
+	TI(0x1002340, 0, 56, COUNTER),
+	TI(0x1002348, 0, 56, COUNTER),
+	TI(0x1002350, 0, 56, COUNTER),
+	TI(0x1002358, 0, 56, COUNTER),
+	TI(0x1002360, 0, 56, COUNTER),
+	TI(0x1002368, 0, 56, COUNTER),
+	TI(0x1002370, 0, 56, COUNTER),
+	TI(0x1002378, 0, 56, COUNTER),
+	TI(0x10023c0, 0, 56, COUNTER),
+	TI(0x1002020, 0, 56, COUNTER),
+	TI(0x1002040, 0, 56, COUNTER),
+	TI(0x1002048, 0, 56, COUNTER),
+	TI(0x1002050, 0, 56, COUNTER),
+	TI(0x1002058, 0, 56, COUNTER),
+	TI(0x1002060, 0, 56, COUNTER),
+	TI(0x1002068, 0, 56, COUNTER),
+	TI(0x1002070, 0, 56, COUNTER),
+	TI(0x1002078, 0, 56, COUNTER),
+	TI(0x1001048, 0, 56, COUNTER),
+	TI(0x1001060, 0, 56, COUNTER),
+	TI(0x1001050, 0, 56, COUNTER),
+	TI(0x1001058, 0, 56, COUNTER),
+	TI(0x1001068, 0, 56, COUNTER),
+	TI(0x1001040, 0, 56, COUNTER),
+	TI(0x1001018, 0, 56, COUNTER),
+	TI(0x1001030, 0, 56, COUNTER),
+	TI(0x1001020, 0, 56, COUNTER),
+	TI(0x1001028, 0, 56, COUNTER),
+	TI(0x1001038, 0, 56, COUNTER),
+	TI(0x1001010, 0, 56, COUNTER),
+	TI(0x1002138, 0, 56, COUNTER),
+	TI(0x1002140, 0, 56, COUNTER),
+	TI(0x1002148, 0, 56, COUNTER),
+	TI(0x1002150, 0, 56, COUNTER),
+	TI(0x1002158, 0, 56, COUNTER),
+	TI(0x1002160, 0, 56, COUNTER),
+	TI(0x1002168, 0, 56, COUNTER),
+	TI(0x1002170, 0, 56, COUNTER),
+	TI(0x1002178, 0, 56, COUNTER),
+	TI(0x1002180, 0, 56, COUNTER),
+	TI(0x1002188, 0, 56, COUNTER),
+	TI(0x1002190, 0, 56, COUNTER),
+	TI(0x1002120, 0, 56, COUNTER),
+	TI(0x1002100, 0, 56, COUNTER),
+	TI(0x1002128, 0, 56, COUNTER),
+	TI(0x1002108, 0, 56, COUNTER),
+	TI(0x1002130, 0, 56, COUNTER),
+	TI(0x10023e8, 0, 56, COUNTER),
+	TI(0x10023f8, 0, 56, COUNTER),
+	TI(0x1002380, 0, 56, COUNTER),
+	TI(0x1002388, 0, 56, COUNTER),
+	TI(0x1002390, 0, 56, COUNTER),
+	TI(0x1002398, 0, 56, COUNTER),
+	TI(0x10023a0, 0, 56, COUNTER),
+	TI(0x10023a8, 0, 56, COUNTER),
+	TI(0x10023b0, 0, 56, COUNTER),
+	TI(0x10023b8, 0, 56, COUNTER),
+	TI(0x1002110, 0, 56, COUNTER),
+	TI(0x1002118, 0, 56, COUNTER),
+	TI(0x1002010, 0, 56, COUNTER),
+	TI(0x10023e0, 0, 56, COUNTER),
+	TI(0x10023f0, 0, 56, COUNTER),
+	TI(0x1002008, 0, 56, COUNTER),
+	TI(0x9870900, 0, 56, COUNTER),
+	TI(0x98708f0, 0, 56, COUNTER),
+	TI(0x9870958, 0, 56, COUNTER),
+	TI(0x98708c8, 0, 56, COUNTER),
+	TI(0x98708d0, 0, 56, COUNTER),
+	TI(0x98708d8, 0, 56, COUNTER),
+	TI(0x98708a0, 0, 56, COUNTER),
+	TI(0x98708a8, 0, 56, COUNTER),
+	TI(0x98708b0, 0, 56, COUNTER),
+	TI(0x98708e0, 0, 56, COUNTER),
+	TI(0x9870850, 0, 56, COUNTER),
+	TI(0x9870858, 0, 56, COUNTER),
+	TI(0x9870870, 0, 56, COUNTER),
+	TI(0x9870878, 0, 56, COUNTER),
+	TI(0x9870840, 0, 56, COUNTER),
+	TI(0x9870848, 0, 56, COUNTER),
+	TI(0x9870880, 0, 56, COUNTER),
+	TI(0x9870888, 0, 56, COUNTER),
+	TI(0x9870860, 0, 56, COUNTER),
+	TI(0x9870868, 0, 56, COUNTER),
+	TI(0x98708b8, 0, 56, COUNTER),
+	TI(0x98708c0, 0, 56, COUNTER),
+	TI(0x98708e8, 0, 56, COUNTER),
+	TI(0x9870898, 0, 56, COUNTER),
+	TI(0x9870890, 0, 56, COUNTER),
+	TI(0x9870920, 0, 56, COUNTER),
+	TI(0x9870928, 0, 56, COUNTER),
+	TI(0x9870908, 0, 56, COUNTER),
+	TI(0x9870918, 0, 56, COUNTER),
+	TI(0x9870930, 0, 56, COUNTER),
+	TI(0x9870948, 0, 56, COUNTER),
+	TI(0x9870938, 0, 56, COUNTER),
+	TI(0x9870940, 0, 56, COUNTER),
+	TI(0x9870950, 0, 56, COUNTER),
+	TI(0x9870910, 0, 56, COUNTER),
+	TI(0x98708f8, 0, 56, COUNTER),
+	TI(0x98709f0, 0, 56, COUNTER),
+	TI(0x98709d8, 0, 56, COUNTER),
+	TI(0x98709e0, 0, 56, COUNTER),
+	TI(0x98709e8, 0, 56, COUNTER),
+	TI(0x9870a00, 0, 56, COUNTER),
+	TI(0x9870a08, 0, 56, COUNTER),
+	TI(0x98709f8, 0, 56, COUNTER),
+	TI(0x98709b8, 0, 56, COUNTER),
+	TI(0x98709c0, 0, 56, COUNTER),
+	TI(0x98709c8, 0, 56, COUNTER),
+	TI(0x98709b0, 0, 56, COUNTER),
+	TI(0x98709a0, 0, 56, COUNTER),
+	TI(0x9870a18, 0, 56, COUNTER),
+	TI(0x9870a10, 0, 56, COUNTER),
+	TI(0x98709d0, 0, 56, COUNTER),
+	TI(0x9870998, 0, 56, COUNTER),
+	TI(0x9870988, 0, 56, COUNTER),
+	TI(0x9870990, 0, 56, COUNTER),
+	TI(0x9870980, 0, 56, COUNTER),
+	TI(0x98709a8, 0, 56, COUNTER),
+	TI(0x9870548, 0, 56, COUNTER),
+	TI(0x9870528, 0, 56, COUNTER),
+	TI(0x9870568, 0, 56, COUNTER),
+	TI(0x9870538, 0, 56, COUNTER),
+	TI(0x9870540, 0, 56, COUNTER),
+	TI(0x9870530, 0, 56, COUNTER),
+	TI(0x9870500, 0, 56, COUNTER),
+	TI(0x9870508, 0, 56, COUNTER),
+	TI(0x9870558, 0, 56, COUNTER),
+	TI(0x9870560, 0, 56, COUNTER),
+	TI(0x9870700, 0, 56, COUNTER),
+	TI(0x9870708, 0, 56, COUNTER),
+	TI(0x9870710, 0, 56, COUNTER),
+	TI(0x9870718, 0, 56, COUNTER),
+	TI(0x9870720, 0, 56, COUNTER),
+	TI(0x9870728, 0, 56, COUNTER),
+	TI(0x9870730, 0, 56, COUNTER),
+	TI(0x9870738, 0, 56, COUNTER),
+	TI(0x9870520, 0, 56, COUNTER),
+	TI(0x9870550, 0, 56, COUNTER),
+	TI(0x9870640, 0, 56, COUNTER),
+	TI(0x9870590, 0, 56, COUNTER),
+	TI(0x9870598, 0, 56, COUNTER),
+	TI(0x9870628, 0, 56, COUNTER),
+	TI(0x9870610, 0, 56, COUNTER),
+	TI(0x9870618, 0, 56, COUNTER),
+	TI(0x9870620, 0, 56, COUNTER),
+	TI(0x9870630, 0, 56, COUNTER),
+	TI(0x9870638, 0, 56, COUNTER),
+	TI(0x98705d8, 0, 56, COUNTER),
+	TI(0x98705c8, 0, 56, COUNTER),
+	TI(0x98705a8, 0, 56, COUNTER),
+	TI(0x9870608, 0, 56, COUNTER),
+	TI(0x98705f8, 0, 56, COUNTER),
+	TI(0x9870600, 0, 56, COUNTER),
+	TI(0x98705e0, 0, 56, COUNTER),
+	TI(0x98705d0, 0, 56, COUNTER),
+	TI(0x98705c0, 0, 56, COUNTER),
+	TI(0x98705f0, 0, 56, COUNTER),
+	TI(0x98705b0, 0, 56, COUNTER),
+	TI(0x98705b8, 0, 56, COUNTER),
+	TI(0x98705a0, 0, 56, COUNTER),
+	TI(0x9870648, 0, 56, COUNTER),
+	TI(0x9870650, 0, 56, COUNTER),
+	TI(0x9870588, 0, 56, COUNTER),
+	TI(0x9870580, 0, 56, COUNTER),
+	TI(0x98705e8, 0, 56, COUNTER),
+	TI(0x9870740, 0, 56, COUNTER),
+	TI(0x9870748, 0, 56, COUNTER),
+	TI(0x9870750, 0, 56, COUNTER),
+	TI(0x9870758, 0, 56, COUNTER),
+	TI(0x9870760, 0, 56, COUNTER),
+	TI(0x9870768, 0, 56, COUNTER),
+	TI(0x9870770, 0, 56, COUNTER),
+	TI(0x9870778, 0, 56, COUNTER),
+	TI(0x9870780, 0, 56, COUNTER),
+	TI(0x9870788, 0, 56, COUNTER),
+	TI(0x9870790, 0, 56, COUNTER),
+	TI(0x9870798, 0, 56, COUNTER),
+	TI(0x98707a0, 0, 56, COUNTER),
+	TI(0x98707a8, 0, 56, COUNTER),
+	TI(0x98707b0, 0, 56, COUNTER),
+	TI(0x98707b8, 0, 56, COUNTER),
+	TI(0x98707c0, 0, 56, COUNTER),
+	TI(0x98707c8, 0, 56, COUNTER),
+	TI(0x98707d0, 0, 56, COUNTER),
+	TI(0x98707d8, 0, 56, COUNTER),
+	TI(0x98707e0, 0, 56, COUNTER),
+	TI(0x98707e8, 0, 56, COUNTER),
+	TI(0x98707f0, 0, 56, COUNTER),
+	TI(0x98707f8, 0, 56, COUNTER),
+	TI(0x9870800, 0, 56, COUNTER),
+	TI(0x9870808, 0, 56, COUNTER),
+	TI(0x9870810, 0, 56, COUNTER),
+	TI(0x9870818, 0, 56, COUNTER),
+	TI(0x9870820, 0, 56, COUNTER),
+	TI(0x9870828, 0, 56, COUNTER),
+	TI(0x9870830, 0, 56, COUNTER),
+	TI(0x9870838, 0, 56, COUNTER),
+	TI(0x9870040, 0, 56, COUNTER),
+	TI(0x9870320, 0, 56, COUNTER),
+	TI(0x9870328, 0, 56, COUNTER),
+	TI(0x9870330, 0, 56, COUNTER),
+	TI(0x9870338, 0, 56, COUNTER),
+	TI(0x9870340, 0, 56, COUNTER),
+	TI(0x9870348, 0, 56, COUNTER),
+	TI(0x9870350, 0, 56, COUNTER),
+	TI(0x9870358, 0, 56, COUNTER),
+	TI(0x9800448, 4, 16, COUNTER),
+	TI(0x9800a00, 32, 15, UGAUGE),
+	TI(0x9800a08, 32, 15, UGAUGE),
+	TI(0x9800a10, 32, 15, UGAUGE),
+	TI(0x9800a18, 32, 15, UGAUGE),
+	TI(0x9800a00, 0, 15, UGAUGE),
+	TI(0x9800a08, 0, 15, UGAUGE),
+	TI(0x9800a10, 0, 15, UGAUGE),
+	TI(0x9800a18, 0, 15, UGAUGE),
+	TI(0x9800a00, 48, 15, UGAUGE),
+	TI(0x9800a08, 48, 15, UGAUGE),
+	TI(0x9800a10, 48, 15, UGAUGE),
+	TI(0x9800a18, 48, 15, UGAUGE),
+	TI(0x9800a00, 16, 15, UGAUGE),
+	TI(0x9800a08, 16, 15, UGAUGE),
+	TI(0x9800a10, 16, 15, UGAUGE),
+	TI(0x9800a18, 16, 15, UGAUGE),
+	TI(0x98701f8, 0, 56, COUNTER),
+	TI(0x98701f0, 0, 56, COUNTER),
+	TI(0x98701e8, 0, 56, COUNTER),
+	TI(0x98701c0, 0, 56, COUNTER),
+	TI(0x98701c8, 0, 56, COUNTER),
+	TI(0x98701d0, 0, 56, COUNTER),
+	TI(0x98701d8, 0, 56, COUNTER),
+	TI(0x98701e0, 0, 56, COUNTER),
+	TI(0x98700d0, 0, 56, COUNTER),
+	TI(0x98700b8, 0, 56, COUNTER),
+	TI(0x9870078, 0, 56, COUNTER),
+	TI(0x98700c8, 0, 56, COUNTER),
+	TI(0x98700c0, 0, 56, COUNTER),
+	TI(0x98700b0, 0, 56, COUNTER),
+	TI(0x98700a0, 0, 56, COUNTER),
+	TI(0x9870110, 0, 56, COUNTER),
+	TI(0x98700d8, 0, 56, COUNTER),
+	TI(0x98700e0, 0, 56, COUNTER),
+	TI(0x98700e8, 0, 56, COUNTER),
+	TI(0x98700a8, 0, 56, COUNTER),
+	TI(0x9870090, 0, 56, COUNTER),
+	TI(0x9870080, 0, 56, COUNTER),
+	TI(0x9870098, 0, 56, COUNTER),
+	TI(0x9870088, 0, 56, COUNTER),
+	TI(0x9870108, 0, 56, COUNTER),
+	TI(0x9870118, 0, 56, COUNTER),
+	TI(0x98700f0, 0, 56, COUNTER),
+	TI(0x98700f8, 0, 56, COUNTER),
+	TI(0x9870100, 0, 56, COUNTER),
+	TI(0x9870168, 0, 56, COUNTER),
+	TI(0x9870178, 0, 56, COUNTER),
+	TI(0x9870158, 0, 56, COUNTER),
+	TI(0x9870190, 0, 56, COUNTER),
+	TI(0x9870148, 0, 56, COUNTER),
+	TI(0x9870188, 0, 56, COUNTER),
+	TI(0x9870180, 0, 56, COUNTER),
+	TI(0x98701a0, 0, 56, COUNTER),
+	TI(0x9870198, 0, 56, COUNTER),
+	TI(0x9870008, 0, 56, COUNTER),
+	TI(0x9870048, 0, 56, COUNTER),
+	TI(0x9870038, 0, 56, COUNTER),
+	TI(0x9870010, 0, 56, COUNTER),
+	TI(0x9870018, 0, 56, COUNTER),
+	TI(0x98702a0, 0, 56, COUNTER),
+	TI(0x98702a8, 0, 56, COUNTER),
+	TI(0x98702b0, 0, 56, COUNTER),
+	TI(0x98702b8, 0, 56, COUNTER),
+	TI(0x98702e0, 0, 56, COUNTER),
+	TI(0x98702e8, 0, 56, COUNTER),
+	TI(0x98702f0, 0, 56, COUNTER),
+	TI(0x98702f8, 0, 56, COUNTER),
+	TI(0x98702c0, 0, 56, COUNTER),
+	TI(0x98702c8, 0, 56, COUNTER),
+	TI(0x98702d0, 0, 56, COUNTER),
+	TI(0x98702d8, 0, 56, COUNTER),
+	TI(0x9870300, 0, 56, COUNTER),
+	TI(0x9870308, 0, 56, COUNTER),
+	TI(0x9870310, 0, 56, COUNTER),
+	TI(0x9870318, 0, 56, COUNTER),
+	TI(0x9870240, 0, 56, COUNTER),
+	TI(0x9870248, 0, 56, COUNTER),
+	TI(0x9870250, 0, 56, COUNTER),
+	TI(0x9870258, 0, 56, COUNTER),
+	TI(0x9870260, 0, 56, COUNTER),
+	TI(0x9870268, 0, 56, COUNTER),
+	TI(0x9870270, 0, 56, COUNTER),
+	TI(0x9870278, 0, 56, COUNTER),
+	TI(0x9870280, 0, 56, COUNTER),
+	TI(0x9870288, 0, 56, COUNTER),
+	TI(0x9870290, 0, 56, COUNTER),
+	TI(0x9870298, 0, 56, COUNTER),
+	TI(0x9870440, 0, 56, COUNTER),
+	TI(0x9870448, 0, 56, COUNTER),
+	TI(0x9870450, 0, 56, COUNTER),
+	TI(0x9870458, 0, 56, COUNTER),
+	TI(0x98701a8, 0, 56, COUNTER),
+	TI(0x98701b0, 0, 56, COUNTER),
+	TI(0x9870170, 0, 56, COUNTER),
+	TI(0x98701b8, 0, 56, COUNTER),
+	TI(0x9870028, 0, 56, COUNTER),
+	TI(0x9870030, 0, 56, COUNTER),
+	TI(0x9870400, 0, 56, COUNTER),
+	TI(0x9870408, 0, 56, COUNTER),
+	TI(0x9870410, 0, 56, COUNTER),
+	TI(0x9870418, 0, 56, COUNTER),
+	TI(0x9870420, 0, 56, COUNTER),
+	TI(0x9870428, 0, 56, COUNTER),
+	TI(0x9870430, 0, 56, COUNTER),
+	TI(0x9870438, 0, 56, COUNTER),
+	TI(0x9870200, 0, 56, COUNTER),
+	TI(0x9870218, 0, 56, COUNTER),
+	TI(0x9870228, 0, 56, COUNTER),
+	TI(0x9870220, 0, 56, COUNTER),
+	TI(0x9870210, 0, 56, COUNTER),
+	TI(0x98703a0, 0, 56, COUNTER),
+	TI(0x98703a8, 0, 56, COUNTER),
+	TI(0x98703b0, 0, 56, COUNTER),
+	TI(0x98703b8, 0, 56, COUNTER),
+	TI(0x98703c0, 0, 56, COUNTER),
+	TI(0x98703c8, 0, 56, COUNTER),
+	TI(0x98703d0, 0, 56, COUNTER),
+	TI(0x98703d8, 0, 56, COUNTER),
+	TI(0x98703e0, 0, 56, COUNTER),
+	TI(0x98703e8, 0, 56, COUNTER),
+	TI(0x98703f0, 0, 56, COUNTER),
+	TI(0x98703f8, 0, 56, COUNTER),
+	TI(0x9870208, 0, 56, COUNTER),
+	TI(0x9870360, 0, 56, COUNTER),
+	TI(0x9870368, 0, 56, COUNTER),
+	TI(0x9870370, 0, 56, COUNTER),
+	TI(0x9870378, 0, 56, COUNTER),
+	TI(0x9870380, 0, 56, COUNTER),
+	TI(0x9870388, 0, 56, COUNTER),
+	TI(0x9870390, 0, 56, COUNTER),
+	TI(0x9870398, 0, 56, COUNTER),
+	TI(0x9803120, 0, 56, COUNTER),
+	TI(0x9803128, 0, 56, COUNTER),
+	TI(0x9803130, 0, 56, COUNTER),
+	TI(0x9803138, 0, 56, COUNTER),
+	TI(0x9803220, 0, 15, UGAUGE),
+	TI(0x9803228, 0, 15, UGAUGE),
+	TI(0x9803230, 0, 15, UGAUGE),
+	TI(0x9803238, 0, 15, UGAUGE),
+	TI(0x9803220, 16, 12, UGAUGE),
+	TI(0x9803228, 16, 12, UGAUGE),
+	TI(0x9803230, 16, 12, UGAUGE),
+	TI(0x9803238, 16, 12, UGAUGE),
+	TI(0x9803000, 0, 48, COUNTER),
+	TI(0x9803008, 0, 48, COUNTER),
+	TI(0x9803010, 0, 48, COUNTER),
+	TI(0x9803018, 0, 48, COUNTER),
+	TI(0x9803000, 60, 4, UGAUGE),
+	TI(0x9803008, 60, 4, UGAUGE),
+	TI(0x9803010, 60, 4, UGAUGE),
+	TI(0x9803018, 60, 4, UGAUGE),
+	TI(0x9803020, 0, 52, COUNTER),
+	TI(0x9803028, 0, 52, COUNTER),
+	TI(0x9803030, 0, 52, COUNTER),
+	TI(0x9803038, 0, 52, COUNTER),
+	TI(0x9803020, 52, 12, UGAUGE),
+	TI(0x9803028, 52, 12, UGAUGE),
+	TI(0x9803030, 52, 12, UGAUGE),
+	TI(0x9803038, 52, 12, UGAUGE),
+	TI(0x9803100, 0, 56, COUNTER),
+	TI(0x9803108, 0, 56, COUNTER),
+	TI(0x9803110, 0, 56, COUNTER),
+	TI(0x9803118, 0, 56, COUNTER),
+	TI(0x9803200, 0, 15, UGAUGE),
+	TI(0x9803208, 0, 15, UGAUGE),
+	TI(0x9803210, 0, 15, UGAUGE),
+	TI(0x9803218, 0, 15, UGAUGE),
+	TI(0x9803200, 16, 12, UGAUGE),
+	TI(0x9803208, 16, 12, UGAUGE),
+	TI(0x9803210, 16, 12, UGAUGE),
+	TI(0x9803218, 16, 12, UGAUGE),
+	TI(0x9800800, 0, 15, UGAUGE),
+	TI(0x9800808, 0, 15, UGAUGE),
+	TI(0x9800810, 0, 15, UGAUGE),
+	TI(0x9800818, 0, 15, UGAUGE),
+	TI(0x9800820, 0, 15, UGAUGE),
+	TI(0x9800828, 0, 15, UGAUGE),
+	TI(0x9800830, 0, 15, UGAUGE),
+	TI(0x9800838, 0, 15, UGAUGE),
+	TI(0x9800840, 0, 15, UGAUGE),
+	TI(0x9800848, 0, 15, UGAUGE),
+	TI(0x9800850, 0, 15, UGAUGE),
+	TI(0x9800858, 0, 15, UGAUGE),
+	TI(0x9800860, 0, 15, UGAUGE),
+	TI(0x9800868, 0, 15, UGAUGE),
+	TI(0x9800870, 0, 15, UGAUGE),
+	TI(0x9800878, 0, 15, UGAUGE),
+	TI(0x9800880, 0, 15, UGAUGE),
+	TI(0x9800888, 0, 15, UGAUGE),
+	TI(0x9800890, 0, 15, UGAUGE),
+	TI(0x9800898, 0, 15, UGAUGE),
+	TI(0x98008a0, 0, 15, UGAUGE),
+	TI(0x98008a8, 0, 15, UGAUGE),
+	TI(0x98008b0, 0, 15, UGAUGE),
+	TI(0x98008b8, 0, 15, UGAUGE),
+	TI(0x98008c0, 0, 15, UGAUGE),
+	TI(0x98008c8, 0, 15, UGAUGE),
+	TI(0x98008d0, 0, 15, UGAUGE),
+	TI(0x98008d8, 0, 15, UGAUGE),
+	TI(0x98008e0, 0, 15, UGAUGE),
+	TI(0x98008e8, 0, 15, UGAUGE),
+	TI(0x98008f0, 0, 15, UGAUGE),
+	TI(0x98008f8, 0, 15, UGAUGE),
+	TI(0x9800900, 0, 15, UGAUGE),
+	TI(0x9800908, 0, 15, UGAUGE),
+	TI(0x9800910, 0, 15, UGAUGE),
+	TI(0x9800918, 0, 15, UGAUGE),
+	TI(0x9800920, 0, 15, UGAUGE),
+	TI(0x9800928, 0, 15, UGAUGE),
+	TI(0x9800930, 0, 15, UGAUGE),
+	TI(0x9800938, 0, 15, UGAUGE),
+	TI(0x9800940, 0, 15, UGAUGE),
+	TI(0x9800948, 0, 15, UGAUGE),
+	TI(0x9800950, 0, 15, UGAUGE),
+	TI(0x9800958, 0, 15, UGAUGE),
+	TI(0x9800960, 0, 15, UGAUGE),
+	TI(0x9800968, 0, 15, UGAUGE),
+	TI(0x9800970, 0, 15, UGAUGE),
+	TI(0x9800978, 0, 15, UGAUGE),
+	TI(0x9800980, 0, 15, UGAUGE),
+	TI(0x9800988, 0, 15, UGAUGE),
+	TI(0x9800990, 0, 15, UGAUGE),
+	TI(0x9800998, 0, 15, UGAUGE),
+	TI(0x98009a0, 0, 15, UGAUGE),
+	TI(0x98009a8, 0, 15, UGAUGE),
+	TI(0x98009b0, 0, 15, UGAUGE),
+	TI(0x98009b8, 0, 15, UGAUGE),
+	TI(0x98009c0, 0, 15, UGAUGE),
+	TI(0x98009c8, 0, 15, UGAUGE),
+	TI(0x98009d0, 0, 15, UGAUGE),
+	TI(0x98009d8, 0, 15, UGAUGE),
+	TI(0x98009e0, 0, 15, UGAUGE),
+	TI(0x98009e8, 0, 15, UGAUGE),
+	TI(0x98009f0, 0, 15, UGAUGE),
+	TI(0x98009f8, 0, 15, UGAUGE),
+	TI(0x9870000, 0, 56, COUNTER),
+	TI(0x9870460, 0, 56, COUNTER),
+	TI(0x9870468, 0, 56, COUNTER),
+	TI(0x9870470, 0, 56, COUNTER),
+	TI(0x9870478, 0, 56, COUNTER),
+	TI(0x9870230, 0, 56, COUNTER),
+	TI(0x9870238, 0, 56, COUNTER),
+	TI(0x10004010, 4, 16, COUNTER),
+	TI(0x10020170, 0, 56, COUNTER),
+	TI(0x10020178, 0, 56, COUNTER),
+	TI(0x10020180, 0, 56, COUNTER),
+	TI(0x10020188, 0, 56, COUNTER),
+	TI(0x10020150, 0, 56, COUNTER),
+	TI(0x10020158, 0, 56, COUNTER),
+	TI(0x10020160, 0, 56, COUNTER),
+	TI(0x10020168, 0, 56, COUNTER),
+	TI(0x100200f0, 0, 56, COUNTER),
+	TI(0x100200f8, 0, 56, COUNTER),
+	TI(0x10020130, 0, 56, COUNTER),
+	TI(0x10020138, 0, 56, COUNTER),
+	TI(0x10020090, 0, 56, COUNTER),
+	TI(0x10020098, 0, 56, COUNTER),
+	TI(0x100200a0, 0, 56, COUNTER),
+	TI(0x10020048, 0, 56, COUNTER),
+	TI(0x10020050, 0, 56, COUNTER),
+	TI(0x10020058, 0, 56, COUNTER),
+	TI(0x10020078, 0, 56, COUNTER),
+	TI(0x10020080, 0, 56, COUNTER),
+	TI(0x10020088, 0, 56, COUNTER),
+	TI(0x10020018, 0, 56, COUNTER),
+	TI(0x10020020, 0, 56, COUNTER),
+	TI(0x10020028, 0, 56, COUNTER),
+	TI(0x100200a8, 0, 56, COUNTER),
+	TI(0x100200b0, 0, 56, COUNTER),
+	TI(0x100200b8, 0, 56, COUNTER),
+	TI(0x10020000, 0, 56, COUNTER),
+	TI(0x10020008, 0, 56, COUNTER),
+	TI(0x10020010, 0, 56, COUNTER),
+	TI(0x10020060, 0, 56, COUNTER),
+	TI(0x10020068, 0, 56, COUNTER),
+	TI(0x10020070, 0, 56, COUNTER),
+	TI(0x10020030, 0, 56, COUNTER),
+	TI(0x10020038, 0, 56, COUNTER),
+	TI(0x10020040, 0, 56, COUNTER),
+	TI(0x10020100, 0, 56, COUNTER),
+	TI(0x10020108, 0, 56, COUNTER),
+	TI(0x10020140, 0, 56, COUNTER),
+	TI(0x10020148, 0, 56, COUNTER),
+	TI(0x100200e0, 0, 56, COUNTER),
+	TI(0x100200e8, 0, 56, COUNTER),
+	TI(0x10020120, 0, 56, COUNTER),
+	TI(0x10020128, 0, 56, COUNTER),
+	TI(0x100200c8, 0, 56, COUNTER),
+	TI(0x100200c0, 0, 56, COUNTER),
+	TI(0x100200d0, 0, 56, COUNTER),
+	TI(0x100200d8, 0, 56, COUNTER),
+	TI(0x10020110, 0, 56, COUNTER),
+	TI(0x10020118, 0, 56, COUNTER),
+	TI(0x9870cd0, 0, 56, COUNTER),
+	TI(0x9870d40, 0, 56, COUNTER),
+	TI(0x9870cc0, 0, 56, COUNTER),
+	TI(0x9870cc8, 0, 56, COUNTER),
+	TI(0x9870cd8, 0, 56, COUNTER),
+	TI(0x9870cf8, 0, 56, COUNTER),
+	TI(0x9870ce0, 0, 56, COUNTER),
+	TI(0x9870ce8, 0, 56, COUNTER),
+	TI(0x9870cf0, 0, 56, COUNTER),
+	TI(0xa010018, 0, 12, UGAUGE),
+	TI(0x1002b80, 0, 56, COUNTER),
+	TI(0x10027a0, 0, 56, COUNTER),
+	TI(0x1002798, 0, 56, COUNTER),
+	TI(0x10027a8, 0, 56, COUNTER),
+	TI(0x10027b8, 0, 56, COUNTER),
+	TI(0x10027c8, 0, 56, COUNTER),
+	TI(0x10027c0, 0, 56, COUNTER),
+	TI(0x10027b0, 0, 56, COUNTER),
+	TI(0x1002a60, 0, 56, COUNTER),
+	TI(0x1002a68, 0, 56, COUNTER),
+	TI(0x1002a70, 0, 56, COUNTER),
+	TI(0x1002a78, 0, 56, COUNTER),
+	TI(0x1002b88, 0, 56, COUNTER),
+	TI(0x1002b90, 0, 56, COUNTER),
+	TI(0x1002b98, 0, 56, COUNTER),
+	TI(0x1002ba0, 0, 56, COUNTER),
+	TI(0x1002ba8, 0, 56, COUNTER),
+	TI(0x1002bb0, 0, 56, COUNTER),
+	TI(0x1002bb8, 0, 56, COUNTER),
+	TI(0x1002bc0, 0, 56, COUNTER),
+	TI(0x1002bc8, 0, 56, COUNTER),
+	TI(0x1002bd0, 0, 56, COUNTER),
+	TI(0x1002bd8, 0, 56, COUNTER),
+	TI(0x1002be0, 0, 56, COUNTER),
+	TI(0x1002be8, 0, 56, COUNTER),
+	TI(0x1002bf0, 0, 56, COUNTER),
+	TI(0x1002bf8, 0, 56, COUNTER),
+	TI(0x1002c00, 0, 56, COUNTER),
+	TI(0x1002c08, 0, 56, COUNTER),
+	TI(0x1002c10, 0, 56, COUNTER),
+	TI(0x1002c18, 0, 56, COUNTER),
+	TI(0x1002c20, 0, 56, COUNTER),
+	TI(0x1002c28, 0, 56, COUNTER),
+	TI(0x1002c30, 0, 56, COUNTER),
+	TI(0x1002c38, 0, 56, COUNTER),
+	TI(0x1002c40, 0, 56, COUNTER),
+	TI(0x1002c48, 0, 56, COUNTER),
+	TI(0x1002c50, 0, 56, COUNTER),
+	TI(0x1002c58, 0, 56, COUNTER),
+	TI(0x1002c60, 0, 56, COUNTER),
+	TI(0x1002c68, 0, 56, COUNTER),
+	TI(0x1002c70, 0, 56, COUNTER),
+	TI(0x1002c78, 0, 56, COUNTER),
+	TI(0x1002c80, 0, 56, COUNTER),
+	TI(0x1002c88, 0, 56, COUNTER),
+	TI(0x1002c90, 0, 56, COUNTER),
+	TI(0x1002c98, 0, 56, COUNTER),
+	TI(0x1002ca0, 0, 56, COUNTER),
+	TI(0x1002ca8, 0, 56, COUNTER),
+	TI(0x1002cb0, 0, 56, COUNTER),
+	TI(0x1002cb8, 0, 56, COUNTER),
+	TI(0x1002cc0, 0, 56, COUNTER),
+	TI(0x1002cc8, 0, 56, COUNTER),
+	TI(0x1002cd0, 0, 56, COUNTER),
+	TI(0x1002cd8, 0, 56, COUNTER),
+	TI(0x1002ce0, 0, 56, COUNTER),
+	TI(0x1002ce8, 0, 56, COUNTER),
+	TI(0x1002cf0, 0, 56, COUNTER),
+	TI(0x1002cf8, 0, 56, COUNTER),
+	TI(0x1002d00, 0, 56, COUNTER),
+	TI(0x1002d08, 0, 56, COUNTER),
+	TI(0x1002d10, 0, 56, COUNTER),
+	TI(0x1002d18, 0, 56, COUNTER),
+	TI(0x1002d20, 0, 56, COUNTER),
+	TI(0x1002d28, 0, 56, COUNTER),
+	TI(0x1002d30, 0, 56, COUNTER),
+	TI(0x1002d38, 0, 56, COUNTER),
+	TI(0x1002d40, 0, 56, COUNTER),
+	TI(0x1002d48, 0, 56, COUNTER),
+	TI(0x1002d50, 0, 56, COUNTER),
+	TI(0x1002d58, 0, 56, COUNTER),
+	TI(0x1002d60, 0, 56, COUNTER),
+	TI(0x1002d68, 0, 56, COUNTER),
+	TI(0x1002d70, 0, 56, COUNTER),
+	TI(0x1002d78, 0, 56, COUNTER),
+	TI(0x1002d80, 0, 56, COUNTER),
+	TI(0x1002d88, 0, 56, COUNTER),
+	TI(0x1002d90, 0, 56, COUNTER),
+	TI(0x1002d98, 0, 56, COUNTER),
+	TI(0x1002da0, 0, 56, COUNTER),
+	TI(0x1002da8, 0, 56, COUNTER),
+	TI(0x1002db0, 0, 56, COUNTER),
+	TI(0x1002db8, 0, 56, COUNTER),
+	TI(0x1002dc0, 0, 56, COUNTER),
+	TI(0x1002dc8, 0, 56, COUNTER),
+	TI(0x1002dd0, 0, 56, COUNTER),
+	TI(0x1002dd8, 0, 56, COUNTER),
+	TI(0x1002de0, 0, 56, COUNTER),
+	TI(0x1002de8, 0, 56, COUNTER),
+	TI(0x1002df0, 0, 56, COUNTER),
+	TI(0x1002df8, 0, 56, COUNTER),
+	TI(0x1002e00, 0, 56, COUNTER),
+	TI(0x1002e08, 0, 56, COUNTER),
+	TI(0x1002e10, 0, 56, COUNTER),
+	TI(0x1002e18, 0, 56, COUNTER),
+	TI(0x1002e20, 0, 56, COUNTER),
+	TI(0x1002e28, 0, 56, COUNTER),
+	TI(0x1002e30, 0, 56, COUNTER),
+	TI(0x1002e38, 0, 56, COUNTER),
+	TI(0x1002e40, 0, 56, COUNTER),
+	TI(0x1002e48, 0, 56, COUNTER),
+	TI(0x1002e50, 0, 56, COUNTER),
+	TI(0x1002e58, 0, 56, COUNTER),
+	TI(0x1002e60, 0, 56, COUNTER),
+	TI(0x1002e68, 0, 56, COUNTER),
+	TI(0x1002e70, 0, 56, COUNTER),
+	TI(0x1002e78, 0, 56, COUNTER),
+	TI(0x1002e80, 0, 56, COUNTER),
+	TI(0x1002788, 0, 56, COUNTER),
+	TI(0x1002790, 0, 56, COUNTER),
+	TI(0x1002b78, 0, 56, COUNTER),
+	TI(0x1002ee8, 0, 56, COUNTER),
+	TI(0x1002ef0, 0, 56, COUNTER),
+	TI(0x1002ef8, 0, 56, COUNTER),
+	TI(0x1002f00, 0, 56, COUNTER),
+	TI(0x1002ec0, 0, 56, COUNTER),
+	TI(0x1002ed0, 0, 56, COUNTER),
+	TI(0x1002ec8, 0, 56, COUNTER),
+	TI(0x1002ed8, 0, 56, COUNTER),
+	TI(0x1002eb0, 0, 56, COUNTER),
+	TI(0x1002eb8, 0, 56, COUNTER),
+	TI(0x1002ea8, 0, 56, COUNTER),
+	TI(0x1002e90, 0, 56, COUNTER),
+	TI(0x1002ea0, 0, 56, COUNTER),
+	TI(0x1002e98, 0, 56, COUNTER),
+	TI(0x1002e88, 0, 56, COUNTER),
+	TI(0x1002ee0, 0, 56, COUNTER),
+	TI(0x1002f68, 0, 56, COUNTER),
+	TI(0x1002f70, 0, 56, COUNTER),
+	TI(0x1002f78, 0, 56, COUNTER),
+	TI(0x1002f80, 0, 56, COUNTER),
+	TI(0x1002f40, 0, 56, COUNTER),
+	TI(0x1002f50, 0, 56, COUNTER),
+	TI(0x1002f48, 0, 56, COUNTER),
+	TI(0x1002f58, 0, 56, COUNTER),
+	TI(0x1002f30, 0, 56, COUNTER),
+	TI(0x1002f38, 0, 56, COUNTER),
+	TI(0x1002f28, 0, 56, COUNTER),
+	TI(0x1002f10, 0, 56, COUNTER),
+	TI(0x1002f20, 0, 56, COUNTER),
+	TI(0x1002f18, 0, 56, COUNTER),
+	TI(0x1002f08, 0, 56, COUNTER),
+	TI(0x1002f60, 0, 56, COUNTER),
+	TI(0x1002ad0, 0, 56, COUNTER),
+	TI(0x1002ad8, 0, 56, COUNTER),
+	TI(0x1002ae0, 0, 56, COUNTER),
+	TI(0x1002ae8, 0, 56, COUNTER),
+	TI(0x1002af0, 0, 56, COUNTER),
+	TI(0x1002af8, 0, 56, COUNTER),
+	TI(0x1002b00, 0, 56, COUNTER),
+	TI(0x1002b08, 0, 56, COUNTER),
+	TI(0x1002b10, 0, 56, COUNTER),
+	TI(0x1002b18, 0, 56, COUNTER),
+	TI(0x1002b70, 0, 56, COUNTER),
+	TI(0x1002a80, 0, 56, COUNTER),
+	TI(0x1002a88, 0, 56, COUNTER),
+	TI(0x1002a90, 0, 56, COUNTER),
+	TI(0x1002a98, 0, 56, COUNTER),
+	TI(0x1002aa0, 0, 56, COUNTER),
+	TI(0x1002aa8, 0, 56, COUNTER),
+	TI(0x1002ab0, 0, 56, COUNTER),
+	TI(0x1002ab8, 0, 56, COUNTER),
+	TI(0x1002ac0, 0, 56, COUNTER),
+	TI(0x1002ac8, 0, 56, COUNTER),
+	TI(0x1002b20, 0, 56, COUNTER),
+	TI(0x1002b28, 0, 56, COUNTER),
+	TI(0x1002b30, 0, 56, COUNTER),
+	TI(0x1002b38, 0, 56, COUNTER),
+	TI(0x1002b40, 0, 56, COUNTER),
+	TI(0x1002b48, 0, 56, COUNTER),
+	TI(0x1002b50, 0, 56, COUNTER),
+	TI(0x1002b58, 0, 56, COUNTER),
+	TI(0x1002b60, 0, 56, COUNTER),
+	TI(0x1002b68, 0, 56, COUNTER),
+	TI(0x1002a50, 0, 56, COUNTER),
+	TI(0x1002a48, 0, 56, COUNTER),
+	TI(0x10029b8, 0, 56, COUNTER),
+	TI(0x10029c0, 0, 56, COUNTER),
+	TI(0x10029c8, 0, 56, COUNTER),
+	TI(0x10029d0, 0, 56, COUNTER),
+	TI(0x10029d8, 0, 56, COUNTER),
+	TI(0x10029e0, 0, 56, COUNTER),
+	TI(0x10029e8, 0, 56, COUNTER),
+	TI(0x10029f0, 0, 56, COUNTER),
+	TI(0x1002a18, 0, 56, COUNTER),
+	TI(0x1002a20, 0, 56, COUNTER),
+	TI(0x1002a28, 0, 56, COUNTER),
+	TI(0x1002a30, 0, 56, COUNTER),
+	TI(0x10029f8, 0, 56, COUNTER),
+	TI(0x1002a00, 0, 56, COUNTER),
+	TI(0x1002a08, 0, 56, COUNTER),
+	TI(0x1002a10, 0, 56, COUNTER),
+	TI(0x1002a38, 0, 56, COUNTER),
+	TI(0x10029a8, 0, 56, COUNTER),
+	TI(0x1002958, 0, 56, COUNTER),
+	TI(0x1002960, 0, 56, COUNTER),
+	TI(0x1002968, 0, 56, COUNTER),
+	TI(0x1002970, 0, 56, COUNTER),
+	TI(0x1002978, 0, 56, COUNTER),
+	TI(0x1002980, 0, 56, COUNTER),
+	TI(0x1002988, 0, 56, COUNTER),
+	TI(0x1002990, 0, 56, COUNTER),
+	TI(0x1002998, 0, 56, COUNTER),
+	TI(0x10029a0, 0, 56, COUNTER),
+	TI(0x1002a40, 0, 56, COUNTER),
+	TI(0x10029b0, 0, 56, COUNTER),
+	TI(0x1002828, 0, 56, COUNTER),
+	TI(0x1002830, 0, 56, COUNTER),
+	TI(0x1002838, 0, 56, COUNTER),
+	TI(0x1002840, 0, 56, COUNTER),
+	TI(0x1002848, 0, 56, COUNTER),
+	TI(0x1002850, 0, 56, COUNTER),
+	TI(0x1002858, 0, 56, COUNTER),
+	TI(0x1002860, 0, 56, COUNTER),
+	TI(0x1002868, 0, 56, COUNTER),
+	TI(0x1002870, 0, 56, COUNTER),
+	TI(0x1002930, 0, 56, COUNTER),
+	TI(0x10027d8, 0, 56, COUNTER),
+	TI(0x10027e0, 0, 56, COUNTER),
+	TI(0x10027e8, 0, 56, COUNTER),
+	TI(0x10027f0, 0, 56, COUNTER),
+	TI(0x10027f8, 0, 56, COUNTER),
+	TI(0x1002800, 0, 56, COUNTER),
+	TI(0x1002808, 0, 56, COUNTER),
+	TI(0x1002810, 0, 56, COUNTER),
+	TI(0x1002818, 0, 56, COUNTER),
+	TI(0x1002820, 0, 56, COUNTER),
+	TI(0x1002928, 0, 56, COUNTER),
+	TI(0x10028c8, 0, 56, COUNTER),
+	TI(0x10028d0, 0, 56, COUNTER),
+	TI(0x10028d8, 0, 56, COUNTER),
+	TI(0x10028e0, 0, 56, COUNTER),
+	TI(0x10028e8, 0, 56, COUNTER),
+	TI(0x10028f0, 0, 56, COUNTER),
+	TI(0x10028f8, 0, 56, COUNTER),
+	TI(0x1002900, 0, 56, COUNTER),
+	TI(0x1002908, 0, 56, COUNTER),
+	TI(0x1002910, 0, 56, COUNTER),
+	TI(0x1002878, 0, 56, COUNTER),
+	TI(0x1002880, 0, 56, COUNTER),
+	TI(0x1002888, 0, 56, COUNTER),
+	TI(0x1002890, 0, 56, COUNTER),
+	TI(0x1002898, 0, 56, COUNTER),
+	TI(0x10028a0, 0, 56, COUNTER),
+	TI(0x10028a8, 0, 56, COUNTER),
+	TI(0x10028b0, 0, 56, COUNTER),
+	TI(0x10028b8, 0, 56, COUNTER),
+	TI(0x10028c0, 0, 56, COUNTER),
+	TI(0x1002920, 0, 56, COUNTER),
+	TI(0x1002918, 0, 56, COUNTER),
+	TI(0x1002938, 0, 56, COUNTER),
+	TI(0x1002940, 0, 56, COUNTER),
+	TI(0x1002948, 0, 56, COUNTER),
+	TI(0x1002950, 0, 56, COUNTER),
+	TI(0xa803400, 32, 11, UGAUGE),
+	TI(0xa803408, 32, 11, UGAUGE),
+	TI(0xa803410, 32, 11, UGAUGE),
+	TI(0xa803418, 32, 11, UGAUGE),
+	TI(0xa803420, 32, 11, UGAUGE),
+	TI(0xa803428, 32, 11, UGAUGE),
+	TI(0xa803430, 32, 11, UGAUGE),
+	TI(0xa803438, 32, 11, UGAUGE),
+	TI(0xa803440, 32, 11, UGAUGE),
+	TI(0xa803448, 32, 11, UGAUGE),
+	TI(0xa803400, 0, 11, UGAUGE),
+	TI(0xa803408, 0, 11, UGAUGE),
+	TI(0xa803410, 0, 11, UGAUGE),
+	TI(0xa803418, 0, 11, UGAUGE),
+	TI(0xa803420, 0, 11, UGAUGE),
+	TI(0xa803428, 0, 11, UGAUGE),
+	TI(0xa803430, 0, 11, UGAUGE),
+	TI(0xa803438, 0, 11, UGAUGE),
+	TI(0xa803440, 0, 11, UGAUGE),
+	TI(0xa803448, 0, 11, UGAUGE),
+	TI(0xa803400, 16, 11, UGAUGE),
+	TI(0xa803408, 16, 11, UGAUGE),
+	TI(0xa803410, 16, 11, UGAUGE),
+	TI(0xa803418, 16, 11, UGAUGE),
+	TI(0xa803420, 16, 11, UGAUGE),
+	TI(0xa803428, 16, 11, UGAUGE),
+	TI(0xa803430, 16, 11, UGAUGE),
+	TI(0xa803438, 16, 11, UGAUGE),
+	TI(0xa803440, 16, 11, UGAUGE),
+	TI(0xa803448, 16, 11, UGAUGE),
+	TI(0xa803000, 32, 11, UGAUGE),
+	TI(0xa803008, 32, 11, UGAUGE),
+	TI(0xa803010, 32, 11, UGAUGE),
+	TI(0xa803018, 32, 11, UGAUGE),
+	TI(0xa803020, 32, 11, UGAUGE),
+	TI(0xa803028, 32, 11, UGAUGE),
+	TI(0xa803030, 32, 11, UGAUGE),
+	TI(0xa803038, 32, 11, UGAUGE),
+	TI(0xa803040, 32, 11, UGAUGE),
+	TI(0xa803048, 32, 11, UGAUGE),
+	TI(0xa803050, 32, 11, UGAUGE),
+	TI(0xa803058, 32, 11, UGAUGE),
+	TI(0xa803060, 32, 11, UGAUGE),
+	TI(0xa803068, 32, 11, UGAUGE),
+	TI(0xa803070, 32, 11, UGAUGE),
+	TI(0xa803078, 32, 11, UGAUGE),
+	TI(0xa803080, 32, 11, UGAUGE),
+	TI(0xa803088, 32, 11, UGAUGE),
+	TI(0xa803090, 32, 11, UGAUGE),
+	TI(0xa803098, 32, 11, UGAUGE),
+	TI(0xa8030a0, 32, 11, UGAUGE),
+	TI(0xa8030a8, 32, 11, UGAUGE),
+	TI(0xa8030b0, 32, 11, UGAUGE),
+	TI(0xa8030b8, 32, 11, UGAUGE),
+	TI(0xa8030c0, 32, 11, UGAUGE),
+	TI(0xa8030c8, 32, 11, UGAUGE),
+	TI(0xa8030d0, 32, 11, UGAUGE),
+	TI(0xa8030d8, 32, 11, UGAUGE),
+	TI(0xa8030e0, 32, 11, UGAUGE),
+	TI(0xa8030e8, 32, 11, UGAUGE),
+	TI(0xa8030f0, 32, 11, UGAUGE),
+	TI(0xa8030f8, 32, 11, UGAUGE),
+	TI(0xa803100, 32, 11, UGAUGE),
+	TI(0xa803108, 32, 11, UGAUGE),
+	TI(0xa803110, 32, 11, UGAUGE),
+	TI(0xa803118, 32, 11, UGAUGE),
+	TI(0xa803120, 32, 11, UGAUGE),
+	TI(0xa803128, 32, 11, UGAUGE),
+	TI(0xa803130, 32, 11, UGAUGE),
+	TI(0xa803138, 32, 11, UGAUGE),
+	TI(0xa803140, 32, 11, UGAUGE),
+	TI(0xa803148, 32, 11, UGAUGE),
+	TI(0xa803150, 32, 11, UGAUGE),
+	TI(0xa803158, 32, 11, UGAUGE),
+	TI(0xa803160, 32, 11, UGAUGE),
+	TI(0xa803168, 32, 11, UGAUGE),
+	TI(0xa803170, 32, 11, UGAUGE),
+	TI(0xa803178, 32, 11, UGAUGE),
+	TI(0xa803180, 32, 11, UGAUGE),
+	TI(0xa803188, 32, 11, UGAUGE),
+	TI(0xa803190, 32, 11, UGAUGE),
+	TI(0xa803198, 32, 11, UGAUGE),
+	TI(0xa8031a0, 32, 11, UGAUGE),
+	TI(0xa8031a8, 32, 11, UGAUGE),
+	TI(0xa8031b0, 32, 11, UGAUGE),
+	TI(0xa8031b8, 32, 11, UGAUGE),
+	TI(0xa8031c0, 32, 11, UGAUGE),
+	TI(0xa8031c8, 32, 11, UGAUGE),
+	TI(0xa8031d0, 32, 11, UGAUGE),
+	TI(0xa8031d8, 32, 11, UGAUGE),
+	TI(0xa8031e0, 32, 11, UGAUGE),
+	TI(0xa8031e8, 32, 11, UGAUGE),
+	TI(0xa8031f0, 32, 11, UGAUGE),
+	TI(0xa8031f8, 32, 11, UGAUGE),
+	TI(0xa803200, 32, 11, UGAUGE),
+	TI(0xa803208, 32, 11, UGAUGE),
+	TI(0xa803210, 32, 11, UGAUGE),
+	TI(0xa803218, 32, 11, UGAUGE),
+	TI(0xa803220, 32, 11, UGAUGE),
+	TI(0xa803228, 32, 11, UGAUGE),
+	TI(0xa803230, 32, 11, UGAUGE),
+	TI(0xa803238, 32, 11, UGAUGE),
+	TI(0xa803240, 32, 11, UGAUGE),
+	TI(0xa803248, 32, 11, UGAUGE),
+	TI(0xa803250, 32, 11, UGAUGE),
+	TI(0xa803258, 32, 11, UGAUGE),
+	TI(0xa803260, 32, 11, UGAUGE),
+	TI(0xa803268, 32, 11, UGAUGE),
+	TI(0xa803270, 32, 11, UGAUGE),
+	TI(0xa803278, 32, 11, UGAUGE),
+	TI(0xa803280, 32, 11, UGAUGE),
+	TI(0xa803288, 32, 11, UGAUGE),
+	TI(0xa803290, 32, 11, UGAUGE),
+	TI(0xa803298, 32, 11, UGAUGE),
+	TI(0xa8032a0, 32, 11, UGAUGE),
+	TI(0xa8032a8, 32, 11, UGAUGE),
+	TI(0xa8032b0, 32, 11, UGAUGE),
+	TI(0xa8032b8, 32, 11, UGAUGE),
+	TI(0xa8032c0, 32, 11, UGAUGE),
+	TI(0xa8032c8, 32, 11, UGAUGE),
+	TI(0xa8032d0, 32, 11, UGAUGE),
+	TI(0xa8032d8, 32, 11, UGAUGE),
+	TI(0xa8032e0, 32, 11, UGAUGE),
+	TI(0xa8032e8, 32, 11, UGAUGE),
+	TI(0xa8032f0, 32, 11, UGAUGE),
+	TI(0xa8032f8, 32, 11, UGAUGE),
+	TI(0xa803000, 0, 11, UGAUGE),
+	TI(0xa803008, 0, 11, UGAUGE),
+	TI(0xa803010, 0, 11, UGAUGE),
+	TI(0xa803018, 0, 11, UGAUGE),
+	TI(0xa803020, 0, 11, UGAUGE),
+	TI(0xa803028, 0, 11, UGAUGE),
+	TI(0xa803030, 0, 11, UGAUGE),
+	TI(0xa803038, 0, 11, UGAUGE),
+	TI(0xa803040, 0, 11, UGAUGE),
+	TI(0xa803048, 0, 11, UGAUGE),
+	TI(0xa803050, 0, 11, UGAUGE),
+	TI(0xa803058, 0, 11, UGAUGE),
+	TI(0xa803060, 0, 11, UGAUGE),
+	TI(0xa803068, 0, 11, UGAUGE),
+	TI(0xa803070, 0, 11, UGAUGE),
+	TI(0xa803078, 0, 11, UGAUGE),
+	TI(0xa803080, 0, 11, UGAUGE),
+	TI(0xa803088, 0, 11, UGAUGE),
+	TI(0xa803090, 0, 11, UGAUGE),
+	TI(0xa803098, 0, 11, UGAUGE),
+	TI(0xa8030a0, 0, 11, UGAUGE),
+	TI(0xa8030a8, 0, 11, UGAUGE),
+	TI(0xa8030b0, 0, 11, UGAUGE),
+	TI(0xa8030b8, 0, 11, UGAUGE),
+	TI(0xa8030c0, 0, 11, UGAUGE),
+	TI(0xa8030c8, 0, 11, UGAUGE),
+	TI(0xa8030d0, 0, 11, UGAUGE),
+	TI(0xa8030d8, 0, 11, UGAUGE),
+	TI(0xa8030e0, 0, 11, UGAUGE),
+	TI(0xa8030e8, 0, 11, UGAUGE),
+	TI(0xa8030f0, 0, 11, UGAUGE),
+	TI(0xa8030f8, 0, 11, UGAUGE),
+	TI(0xa803100, 0, 11, UGAUGE),
+	TI(0xa803108, 0, 11, UGAUGE),
+	TI(0xa803110, 0, 11, UGAUGE),
+	TI(0xa803118, 0, 11, UGAUGE),
+	TI(0xa803120, 0, 11, UGAUGE),
+	TI(0xa803128, 0, 11, UGAUGE),
+	TI(0xa803130, 0, 11, UGAUGE),
+	TI(0xa803138, 0, 11, UGAUGE),
+	TI(0xa803140, 0, 11, UGAUGE),
+	TI(0xa803148, 0, 11, UGAUGE),
+	TI(0xa803150, 0, 11, UGAUGE),
+	TI(0xa803158, 0, 11, UGAUGE),
+	TI(0xa803160, 0, 11, UGAUGE),
+	TI(0xa803168, 0, 11, UGAUGE),
+	TI(0xa803170, 0, 11, UGAUGE),
+	TI(0xa803178, 0, 11, UGAUGE),
+	TI(0xa803180, 0, 11, UGAUGE),
+	TI(0xa803188, 0, 11, UGAUGE),
+	TI(0xa803190, 0, 11, UGAUGE),
+	TI(0xa803198, 0, 11, UGAUGE),
+	TI(0xa8031a0, 0, 11, UGAUGE),
+	TI(0xa8031a8, 0, 11, UGAUGE),
+	TI(0xa8031b0, 0, 11, UGAUGE),
+	TI(0xa8031b8, 0, 11, UGAUGE),
+	TI(0xa8031c0, 0, 11, UGAUGE),
+	TI(0xa8031c8, 0, 11, UGAUGE),
+	TI(0xa8031d0, 0, 11, UGAUGE),
+	TI(0xa8031d8, 0, 11, UGAUGE),
+	TI(0xa8031e0, 0, 11, UGAUGE),
+	TI(0xa8031e8, 0, 11, UGAUGE),
+	TI(0xa8031f0, 0, 11, UGAUGE),
+	TI(0xa8031f8, 0, 11, UGAUGE),
+	TI(0xa803200, 0, 11, UGAUGE),
+	TI(0xa803208, 0, 11, UGAUGE),
+	TI(0xa803210, 0, 11, UGAUGE),
+	TI(0xa803218, 0, 11, UGAUGE),
+	TI(0xa803220, 0, 11, UGAUGE),
+	TI(0xa803228, 0, 11, UGAUGE),
+	TI(0xa803230, 0, 11, UGAUGE),
+	TI(0xa803238, 0, 11, UGAUGE),
+	TI(0xa803240, 0, 11, UGAUGE),
+	TI(0xa803248, 0, 11, UGAUGE),
+	TI(0xa803250, 0, 11, UGAUGE),
+	TI(0xa803258, 0, 11, UGAUGE),
+	TI(0xa803260, 0, 11, UGAUGE),
+	TI(0xa803268, 0, 11, UGAUGE),
+	TI(0xa803270, 0, 11, UGAUGE),
+	TI(0xa803278, 0, 11, UGAUGE),
+	TI(0xa803280, 0, 11, UGAUGE),
+	TI(0xa803288, 0, 11, UGAUGE),
+	TI(0xa803290, 0, 11, UGAUGE),
+	TI(0xa803298, 0, 11, UGAUGE),
+	TI(0xa8032a0, 0, 11, UGAUGE),
+	TI(0xa8032a8, 0, 11, UGAUGE),
+	TI(0xa8032b0, 0, 11, UGAUGE),
+	TI(0xa8032b8, 0, 11, UGAUGE),
+	TI(0xa8032c0, 0, 11, UGAUGE),
+	TI(0xa8032c8, 0, 11, UGAUGE),
+	TI(0xa8032d0, 0, 11, UGAUGE),
+	TI(0xa8032d8, 0, 11, UGAUGE),
+	TI(0xa8032e0, 0, 11, UGAUGE),
+	TI(0xa8032e8, 0, 11, UGAUGE),
+	TI(0xa8032f0, 0, 11, UGAUGE),
+	TI(0xa8032f8, 0, 11, UGAUGE),
+	TI(0x9870c98, 0, 56, COUNTER),
+	TI(0x9870c90, 0, 56, COUNTER),
+	TI(0x9870c68, 0, 56, COUNTER),
+	TI(0x9870c60, 0, 56, COUNTER),
+	TI(0x9870c70, 0, 56, COUNTER),
+	TI(0x9870c80, 0, 56, COUNTER),
+	TI(0x9870c78, 0, 56, COUNTER),
+	TI(0x9870c88, 0, 56, COUNTER),
+	TI(0x9870c48, 0, 56, COUNTER),
+	TI(0x9870c58, 0, 56, COUNTER),
+	TI(0x9870c40, 0, 56, COUNTER),
+	TI(0x9870c50, 0, 56, COUNTER),
+	TI(0x9001008, 8, 6, UGAUGE),
+	TI(0x9001008, 0, 6, UGAUGE),
+	TI(0x9870b48, 0, 56, COUNTER),
+	TI(0x9870be8, 0, 56, COUNTER),
+	TI(0x9870ba8, 0, 56, COUNTER),
+	TI(0x9870b38, 0, 56, COUNTER),
+	TI(0x9870be0, 0, 56, COUNTER),
+	TI(0x9870ba0, 0, 56, COUNTER),
+	TI(0x9870b30, 0, 56, COUNTER),
+	TI(0x9870b40, 0, 56, COUNTER),
+	TI(0x9870ad8, 0, 56, COUNTER),
+	TI(0x9870bb8, 0, 56, COUNTER),
+	TI(0x9870b78, 0, 56, COUNTER),
+	TI(0x9870ac8, 0, 56, COUNTER),
+	TI(0x9870bb0, 0, 56, COUNTER),
+	TI(0x9870b70, 0, 56, COUNTER),
+	TI(0x9870ac0, 0, 56, COUNTER),
+	TI(0x9870ad0, 0, 56, COUNTER),
+	TI(0x9870af0, 0, 56, COUNTER),
+	TI(0x9870bc0, 0, 56, COUNTER),
+	TI(0x9870b80, 0, 56, COUNTER),
+	TI(0x9870ae0, 0, 56, COUNTER),
+	TI(0x9870ae8, 0, 56, COUNTER),
+	TI(0x9870b10, 0, 56, COUNTER),
+	TI(0x9870bd0, 0, 56, COUNTER),
+	TI(0x9870b90, 0, 56, COUNTER),
+	TI(0x9870b00, 0, 56, COUNTER),
+	TI(0x9870bc8, 0, 56, COUNTER),
+	TI(0x9870b88, 0, 56, COUNTER),
+	TI(0x9870af8, 0, 56, COUNTER),
+	TI(0x9870b08, 0, 56, COUNTER),
+	TI(0x9870b28, 0, 56, COUNTER),
+	TI(0x9870bd8, 0, 56, COUNTER),
+	TI(0x9870b98, 0, 56, COUNTER),
+	TI(0x9870b18, 0, 56, COUNTER),
+	TI(0x9870b20, 0, 56, COUNTER),
+	TI(0x9870b68, 0, 56, COUNTER),
+	TI(0x9870b58, 0, 56, COUNTER),
+	TI(0x9870b60, 0, 56, COUNTER),
+	TI(0x9870b50, 0, 56, COUNTER),
+	TI(0x100698, 0, 56, COUNTER),
+	TI(0x1006b0, 0, 56, COUNTER),
+	TI(0x1006a0, 0, 56, COUNTER),
+	TI(0x100688, 0, 56, COUNTER),
+	TI(0x100728, 0, 56, COUNTER),
+	TI(0x100690, 0, 56, COUNTER),
+	TI(0x100720, 0, 56, COUNTER),
+	TI(0x1007d8, 0, 56, COUNTER),
+	TI(0x100680, 0, 56, COUNTER),
+	TI(0x100660, 0, 56, COUNTER),
+	TI(0x100668, 0, 56, COUNTER),
+	TI(0x1006e8, 0, 56, COUNTER),
+	TI(0x1006e0, 0, 56, COUNTER),
+	TI(0x100628, 0, 56, COUNTER),
+	TI(0x100900, 0, 56, COUNTER),
+	TI(0x100908, 0, 56, COUNTER),
+	TI(0x100910, 0, 56, COUNTER),
+	TI(0x100918, 0, 56, COUNTER),
+	TI(0x100920, 0, 56, COUNTER),
+	TI(0x100928, 0, 56, COUNTER),
+	TI(0x100930, 0, 56, COUNTER),
+	TI(0x100938, 0, 56, COUNTER),
+	TI(0x100940, 0, 56, COUNTER),
+	TI(0x100948, 0, 56, COUNTER),
+	TI(0x100950, 0, 56, COUNTER),
+	TI(0x100958, 0, 56, COUNTER),
+	TI(0x100960, 0, 56, COUNTER),
+	TI(0x100968, 0, 56, COUNTER),
+	TI(0x100970, 0, 56, COUNTER),
+	TI(0x100978, 0, 56, COUNTER),
+	TI(0x100648, 0, 56, COUNTER),
+	TI(0x100650, 0, 56, COUNTER),
+	TI(0x100658, 0, 56, COUNTER),
+	TI(0x100600, 0, 56, COUNTER),
+	TI(0x100608, 0, 56, COUNTER),
+	TI(0x100670, 0, 56, COUNTER),
+	TI(0x1006d0, 0, 56, COUNTER),
+	TI(0x1006c0, 0, 56, COUNTER),
+	TI(0x1006b8, 0, 56, COUNTER),
+	TI(0x1006c8, 0, 56, COUNTER),
+	TI(0x100630, 0, 56, COUNTER),
+	TI(0x100798, 0, 56, COUNTER),
+	TI(0x1007a0, 0, 56, COUNTER),
+	TI(0x100788, 0, 56, COUNTER),
+	TI(0x100790, 0, 56, COUNTER),
+	TI(0x100778, 0, 56, COUNTER),
+	TI(0x100780, 0, 56, COUNTER),
+	TI(0x1007a8, 0, 56, COUNTER),
+	TI(0x1007b8, 0, 56, COUNTER),
+	TI(0x1007b0, 0, 56, COUNTER),
+	TI(0x1007c0, 0, 56, COUNTER),
+	TI(0xb00130, 32, 12, UGAUGE),
+	TI(0xb00130, 0, 12, UGAUGE),
+	TI(0xb00100, 32, 13, UGAUGE),
+	TI(0xb00100, 0, 13, UGAUGE),
+	TI(0xb00118, 32, 9, UGAUGE),
+	TI(0xb00118, 0, 9, UGAUGE),
+	TI(0xb00110, 32, 12, UGAUGE),
+	TI(0xb00110, 0, 12, UGAUGE),
+	TI(0xb00128, 32, 12, UGAUGE),
+	TI(0xb00128, 0, 12, UGAUGE),
+	TI(0xb00108, 32, 14, UGAUGE),
+	TI(0xb00108, 0, 14, UGAUGE),
+	TI(0xb00120, 32, 14, UGAUGE),
+	TI(0xb00120, 0, 14, UGAUGE),
+	TI(0x100638, 0, 56, COUNTER),
+	TI(0x100740, 0, 56, COUNTER),
+	TI(0x100738, 0, 56, COUNTER),
+	TI(0x100748, 0, 56, COUNTER),
+	TI(0x100620, 0, 56, COUNTER),
+	TI(0x100610, 0, 56, COUNTER),
+	TI(0x100800, 0, 56, COUNTER),
+	TI(0x100808, 0, 56, COUNTER),
+	TI(0x100810, 0, 56, COUNTER),
+	TI(0x100818, 0, 56, COUNTER),
+	TI(0x100820, 0, 56, COUNTER),
+	TI(0x100828, 0, 56, COUNTER),
+	TI(0x100830, 0, 56, COUNTER),
+	TI(0x100838, 0, 56, COUNTER),
+	TI(0x100840, 0, 56, COUNTER),
+	TI(0x100848, 0, 56, COUNTER),
+	TI(0x100850, 0, 56, COUNTER),
+	TI(0x100858, 0, 56, COUNTER),
+	TI(0x100860, 0, 56, COUNTER),
+	TI(0x100868, 0, 56, COUNTER),
+	TI(0x100870, 0, 56, COUNTER),
+	TI(0x100878, 0, 56, COUNTER),
+	TI(0x100880, 0, 56, COUNTER),
+	TI(0x100888, 0, 56, COUNTER),
+	TI(0x100890, 0, 56, COUNTER),
+	TI(0x100898, 0, 56, COUNTER),
+	TI(0x1008a0, 0, 56, COUNTER),
+	TI(0x1008a8, 0, 56, COUNTER),
+	TI(0x1008b0, 0, 56, COUNTER),
+	TI(0x1008b8, 0, 56, COUNTER),
+	TI(0x1008c0, 0, 56, COUNTER),
+	TI(0x1008c8, 0, 56, COUNTER),
+	TI(0x1008d0, 0, 56, COUNTER),
+	TI(0x1008d8, 0, 56, COUNTER),
+	TI(0x1008e0, 0, 56, COUNTER),
+	TI(0x1008e8, 0, 56, COUNTER),
+	TI(0x1008f0, 0, 56, COUNTER),
+	TI(0x1008f8, 0, 56, COUNTER),
+	TI(0x1006a8, 0, 56, COUNTER),
+	TI(0x1007e0, 0, 56, COUNTER),
+	TI(0x100618, 0, 56, COUNTER),
+	TI(0x1006d8, 0, 56, COUNTER),
+	TI(0x100640, 0, 56, COUNTER),
+	TI(0x100718, 0, 56, COUNTER),
+	TI(0x100708, 0, 56, COUNTER),
+	TI(0x100710, 0, 56, COUNTER),
+	TI(0x100768, 0, 56, COUNTER),
+	TI(0x100770, 0, 56, COUNTER),
+	TI(0x100758, 0, 56, COUNTER),
+	TI(0x100760, 0, 56, COUNTER),
+	TI(0x100750, 0, 56, COUNTER),
+	TI(0x1007c8, 0, 56, COUNTER),
+	TI(0x1006f8, 0, 56, COUNTER),
+	TI(0x1006f0, 0, 56, COUNTER),
+	TI(0x100700, 0, 56, COUNTER),
+	TI(0x1007d0, 0, 56, COUNTER),
+	TI(0x100678, 0, 56, COUNTER),
+	TI(0x1007e8, 0, 56, COUNTER),
+	TI(0x100730, 0, 56, COUNTER),
+	TI(0x100203b8, 0, 56, COUNTER),
+	TI(0x100203c0, 0, 56, COUNTER),
+	TI(0x100203d0, 0, 56, COUNTER),
+	TI(0x100203c8, 0, 56, COUNTER),
+	TI(0x100203e0, 0, 56, COUNTER),
+	TI(0x100203f0, 0, 56, COUNTER),
+	TI(0x100203f8, 0, 56, COUNTER),
+	TI(0x100203e8, 0, 56, COUNTER),
+	TI(0x100203d8, 0, 56, COUNTER),
+	TI(0x11005000, 4, 16, COUNTER),
+	TI(0x110061d8, 0, 56, COUNTER),
+	TI(0x110061d0, 0, 56, COUNTER),
+	TI(0x110061c0, 0, 56, COUNTER),
+	TI(0x110061c8, 0, 56, COUNTER),
+	TI(0x110061e0, 0, 56, COUNTER),
+	TI(0x110061e8, 0, 56, COUNTER),
+	TI(0x11006178, 0, 56, COUNTER),
+	TI(0x11006170, 0, 56, COUNTER),
+	TI(0x11006160, 0, 56, COUNTER),
+	TI(0x11006168, 0, 56, COUNTER),
+	TI(0x11006158, 0, 56, COUNTER),
+	TI(0x11006150, 0, 56, COUNTER),
+	TI(0x11006140, 0, 56, COUNTER),
+	TI(0x11006148, 0, 56, COUNTER),
+	TI(0x11006180, 0, 56, COUNTER),
+	TI(0x11006188, 0, 56, COUNTER),
+	TI(0x110061b0, 0, 56, COUNTER),
+	TI(0x110061b8, 0, 56, COUNTER),
+	TI(0x11006190, 0, 56, COUNTER),
+	TI(0x11006198, 0, 56, COUNTER),
+	TI(0x11006068, 0, 56, COUNTER),
+	TI(0x11006060, 0, 56, COUNTER),
+	TI(0x11006050, 0, 56, COUNTER),
+	TI(0x11006058, 0, 56, COUNTER),
+	TI(0x11006030, 0, 56, COUNTER),
+	TI(0x11006038, 0, 56, COUNTER),
+	TI(0x11006048, 0, 56, COUNTER),
+	TI(0x11006040, 0, 56, COUNTER),
+	TI(0x11006010, 0, 56, COUNTER),
+	TI(0x11006018, 0, 56, COUNTER),
+	TI(0x11006020, 0, 56, COUNTER),
+	TI(0x11006008, 0, 56, COUNTER),
+	TI(0x11006000, 0, 56, COUNTER),
+	TI(0x11006028, 0, 56, COUNTER),
+	TI(0x11006118, 0, 56, COUNTER),
+	TI(0x11006110, 0, 56, COUNTER),
+	TI(0x11006108, 0, 56, COUNTER),
+	TI(0x11006120, 0, 56, COUNTER),
+	TI(0x11006090, 0, 56, COUNTER),
+	TI(0x11006088, 0, 56, COUNTER),
+	TI(0x110060f0, 0, 56, COUNTER),
+	TI(0x110060e8, 0, 56, COUNTER),
+	TI(0x11006098, 0, 56, COUNTER),
+	TI(0x11006100, 0, 56, COUNTER),
+	TI(0x110060f8, 0, 56, COUNTER),
+	TI(0x110061a0, 0, 56, COUNTER),
+	TI(0x110061a8, 0, 56, COUNTER),
+	TI(0x11006080, 0, 56, COUNTER),
+	TI(0x110060d8, 0, 56, COUNTER),
+	TI(0x110060d0, 0, 56, COUNTER),
+	TI(0x110060c8, 0, 56, COUNTER),
+	TI(0x110060c0, 0, 56, COUNTER),
+	TI(0x110060e0, 0, 56, COUNTER),
+	TI(0x11006128, 0, 56, COUNTER),
+	TI(0x11006130, 0, 56, COUNTER),
+	TI(0x11006138, 0, 56, COUNTER),
+	TI(0x110060b0, 0, 56, COUNTER),
+	TI(0x110060b8, 0, 56, COUNTER),
+	TI(0x110060a0, 0, 56, COUNTER),
+	TI(0x110060a8, 0, 56, COUNTER),
+	TI(0x11006078, 0, 56, COUNTER),
+	TI(0x11006070, 0, 56, COUNTER),
+	TI(0x10020268, 0, 56, COUNTER),
+	TI(0x10020280, 0, 56, COUNTER),
+	TI(0x10020290, 0, 56, COUNTER),
+	TI(0x10020288, 0, 56, COUNTER),
+	TI(0x10020260, 0, 56, COUNTER),
+	TI(0x10020270, 0, 56, COUNTER),
+	TI(0x10020278, 0, 56, COUNTER),
+	TI(0x10020238, 0, 56, COUNTER),
+	TI(0x10020240, 0, 56, COUNTER),
+	TI(0x10020210, 0, 56, COUNTER),
+	TI(0x10020208, 0, 56, COUNTER),
+	TI(0x10020228, 0, 56, COUNTER),
+	TI(0x10020220, 0, 56, COUNTER),
+	TI(0x10020230, 0, 56, COUNTER),
+	TI(0x10020218, 0, 56, COUNTER),
+	TI(0x10020200, 0, 56, COUNTER),
+	TI(0x10020250, 0, 56, COUNTER),
+	TI(0x10020248, 0, 56, COUNTER),
+	TI(0x10020258, 0, 56, COUNTER),
+	TI(0x100202e0, 0, 56, COUNTER),
+	TI(0x100202e8, 0, 56, COUNTER),
+	TI(0x100202d8, 0, 56, COUNTER),
+	TI(0x100202d0, 0, 56, COUNTER),
+	TI(0x100202c0, 0, 56, COUNTER),
+	TI(0x100202c8, 0, 56, COUNTER),
+	TI(0x100202a8, 0, 56, COUNTER),
+	TI(0x100202b0, 0, 56, COUNTER),
+	TI(0x100202a0, 0, 56, COUNTER),
+	TI(0x100202b8, 0, 56, COUNTER),
+	TI(0x10020298, 0, 56, COUNTER),
+	TI(0x100202f0, 0, 56, COUNTER),
+	TI(0x100202f8, 0, 56, COUNTER),
+	TI(0x10020380, 0, 56, COUNTER),
+	TI(0x10020388, 0, 56, COUNTER),
+	TI(0x10020350, 0, 56, COUNTER),
+	TI(0x10020370, 0, 56, COUNTER),
+	TI(0x10020378, 0, 56, COUNTER),
+	TI(0x10020358, 0, 56, COUNTER),
+	TI(0x10020328, 0, 56, COUNTER),
+	TI(0x10020360, 0, 56, COUNTER),
+	TI(0x10020368, 0, 56, COUNTER),
+	TI(0x10020340, 0, 56, COUNTER),
+	TI(0x10020330, 0, 56, COUNTER),
+	TI(0x10020320, 0, 56, COUNTER),
+	TI(0x10020318, 0, 56, COUNTER),
+	TI(0x10020348, 0, 56, COUNTER),
+	TI(0x10020308, 0, 56, COUNTER),
+	TI(0x10020300, 0, 56, COUNTER),
+	TI(0x10020310, 0, 56, COUNTER),
+	TI(0x10020338, 0, 56, COUNTER),
+	TI(0x9870a78, 0, 56, COUNTER),
+	TI(0x9870a80, 0, 56, COUNTER),
+	TI(0x9870a48, 0, 56, COUNTER),
+	TI(0x9870a50, 0, 56, COUNTER),
+	TI(0x9870a58, 0, 56, COUNTER),
+	TI(0x9870a60, 0, 56, COUNTER),
+	TI(0x9870a68, 0, 56, COUNTER),
+	TI(0x9870a70, 0, 56, COUNTER),
+	TI(0x9870a40, 0, 56, COUNTER),
+	TI(0x100450, 0, 56, COUNTER),
+	TI(0x100420, 0, 56, COUNTER),
+	TI(0x100428, 0, 56, COUNTER),
+	TI(0x1004e0, 0, 56, COUNTER),
+	TI(0x1004e8, 0, 56, COUNTER),
+	TI(0x1004f0, 0, 56, COUNTER),
+	TI(0x1004f8, 0, 56, COUNTER),
+	TI(0x100500, 0, 56, COUNTER),
+	TI(0x100508, 0, 56, COUNTER),
+	TI(0x100510, 0, 56, COUNTER),
+	TI(0x100518, 0, 56, COUNTER),
+	TI(0x100520, 0, 56, COUNTER),
+	TI(0x100528, 0, 56, COUNTER),
+	TI(0x100530, 0, 56, COUNTER),
+	TI(0x100538, 0, 56, COUNTER),
+	TI(0x100540, 0, 56, COUNTER),
+	TI(0x100548, 0, 56, COUNTER),
+	TI(0x100550, 0, 56, COUNTER),
+	TI(0x100558, 0, 56, COUNTER),
+	TI(0x100408, 0, 56, COUNTER),
+	TI(0x100448, 0, 56, COUNTER),
+	TI(0x100498, 0, 56, COUNTER),
+	TI(0x100490, 0, 56, COUNTER),
+	TI(0x1004c0, 0, 56, COUNTER),
+	TI(0x1004c8, 0, 56, COUNTER),
+	TI(0x1004d0, 0, 56, COUNTER),
+	TI(0x1004d8, 0, 56, COUNTER),
+	TI(0x1004a0, 0, 56, COUNTER),
+	TI(0x1004a8, 0, 56, COUNTER),
+	TI(0x1004b0, 0, 56, COUNTER),
+	TI(0x1004b8, 0, 56, COUNTER),
+	TI(0x100400, 0, 56, COUNTER),
+	TI(0x100430, 0, 56, COUNTER),
+	TI(0x100440, 0, 56, COUNTER),
+	TI(0x100438, 0, 56, COUNTER),
+};
+
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cass_trace.h b/drivers/net/ethernet/hpe/ss1/cass_trace.h
new file mode 100644
index 000000000000..34aa601cb57a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_trace.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019 Hewlett Packard Enterprise Development LP */
+
+/* Cassini Kernel Trace Event Definition */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM cass
+
+#if !defined(_CASS_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _CASS_TRACE_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(
+	cass_err,
+	TP_PROTO(unsigned int csr_flag, unsigned int bit,
+		 unsigned long seconds, unsigned long nanoseconds,
+		 const struct flg_err_info *flg_info,
+		 struct err_info *err_info,
+		 u64 *cntrs_val),
+	TP_ARGS(csr_flag, bit, seconds, nanoseconds, flg_info,
+		err_info, cntrs_val),
+	TP_STRUCT__entry(
+		__field(unsigned int, csr_flag)
+		__field(unsigned int, bit)
+		__field(unsigned long, seconds)
+		__field(unsigned long, nanoseconds)
+		__field(enum c_error_class, ec)
+		__dynamic_array(u64, err_info_data_0, err_info[0].count)
+		__dynamic_array(u64, err_info_data_1, err_info[1].count)
+		__dynamic_array(u64, err_info_data_2, err_info[2].count)
+		__array(u64, cntrs_val, C_MAX_CSR_CNTRS)
+	),
+	TP_fast_assign(
+		__entry->csr_flag = csr_flag;
+		__entry->bit = bit;
+		__entry->seconds = seconds;
+		__entry->nanoseconds = nanoseconds;
+		__entry->ec = flg_info->ec;
+		memcpy(__get_dynamic_array(err_info_data_0), err_info[0].data,
+		       err_info[0].count * sizeof(u64));
+		memcpy(__get_dynamic_array(err_info_data_1), err_info[1].data,
+		       err_info[1].count * sizeof(u64));
+		memcpy(__get_dynamic_array(err_info_data_2), err_info[2].data,
+		       err_info[2].count * sizeof(u64));
+		memcpy(__entry->cntrs_val, cntrs_val,
+		       C_MAX_CSR_CNTRS * sizeof(u64));
+	),
+	TP_printk("csr_flag: %u, bit: %u, ec: %u",
+		  __entry->csr_flag, __entry->bit, __entry->ec)
+);
+
+#endif /* _CASS_TRACE_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE cass_trace
+
+#include <trace/define_trace.h>
diff --git a/drivers/net/ethernet/hpe/ss1/cass_vf.h b/drivers/net/ethernet/hpe/ss1/cass_vf.h
new file mode 100644
index 000000000000..f204767c33fb
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_vf.h
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CASS_VF_H
+#define _CASS_VF_H
+
+/* VF private structures */
+struct cxi_lni_priv_vf {
+	/* Matching fields in cxi_lni_priv */
+	struct cxi_dev *dev;
+	struct cxi_lni lni;
+	/* VF only fields */
+	int phys_lac; /* Physical LAC associated with this LNI */
+};
+
+struct cxi_domain_priv_vf {
+	/* Matching fields in cxi_domain_priv */
+	struct cxi_domain domain;
+	struct cxi_lni_priv *lni_priv;
+};
+
+struct cxi_cp_priv_vf {
+	/* Matching fields in cxi_cp_priv */
+	struct cxi_dev *dev;
+	struct cxi_cp cp;
+	/* VF only fields */
+	unsigned int cp_hndl;
+};
+
+struct cxi_cq_priv_vf {
+	/* Matching fields in cxi_cq_priv */
+	struct cxi_lni_priv *lni_priv;
+	struct cxi_cq cass_cq;
+	size_t cmds_len;
+	size_t cmds_order;
+	struct page **pages;
+	struct page *cmds_pages;
+	void *cmds;
+	dma_addr_t cmds_dma_addr;
+	void __iomem *cq_mmio;
+	u32 flags;
+	struct cxi_md_priv *md_priv;
+};
+
+struct cxi_md_priv_vf {
+	/* Matching fields in cxi_md_priv */
+	struct cxi_lni_priv *lni_priv;
+	struct device *device;
+	struct cxi_md md;
+	struct sg_table *sgt;        /* Scatter-gather table for DMA mapping */
+	struct page **pages;         /* Array of pinned pages */
+	u32 flags;                   /* Mapping flags */
+	/* VF only fields */
+	int npages;                  /* Number of pinned pages */
+};
+
+int cass_vf_get_token(struct cxi_dev *cdev, int vf_idx, unsigned int *token);
+
+#endif /* CASS_VF_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_vf_notif.h b/drivers/net/ethernet/hpe/ss1/cass_vf_notif.h
new file mode 100644
index 000000000000..eb45ffa0fa91
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_vf_notif.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#ifndef	_CASS_VF_NOTIF_H
+#define	_CASS_VF_NOTIF_H
+
+enum cass_vf_notif_ops {
+	CASS_VF_NOTIF_OP_INVALID = 0,
+	CASS_VF_NOTIF_OP_PING,
+	CASS_VF_NOTIF_OP_MAX,
+};
+
+struct cass_vf_notif_common {
+	enum cass_vf_notif_ops op;
+};
+
+struct cass_vf_notif_ping {
+	enum cass_vf_notif_ops op;
+};
+
+struct cass_vf_notif_info {
+	unsigned int req_size;
+	const char *name;
+	int (*handler)(struct cass_dev *hw, const void *cmd_in,
+		       void *resp, size_t *resp_len);
+};
+
+int dispatch_vf_notif(struct cass_dev *hw, const void *req, size_t req_len,
+		      void *rsp, size_t *rsp_len);
+
+#endif	/* _CASS_VF_NOTIF_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cuc_cxi.h b/drivers/net/ethernet/hpe/ss1/cuc_cxi.h
new file mode 100644
index 000000000000..f295064407e9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cuc_cxi.h
@@ -0,0 +1,370 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright 2021-2024 Hewlett Packard Enterprise Development LP */
+
+/* This file defines a set of commands and  request and response packet formats for
+ * communicating with the Cassini uC over USB, SMBus, or the HSN.
+ */
+
+#ifndef CUC_CXI_H
+#define CUC_CXI_H
+
+#define CUC_DATA_BYTES  253
+
+// I2C reads and writes to QSFP use a bus number of 0xFF because
+// // the actual bus number may not be known by the requester
+#define QSFP_I2C_BUS_REDIRECT      0xFF
+
+/**
+ * struct cuc_pkt - Cassini uC Packet Format
+ *
+ * This common packet format can be used to communicate with the uC across different
+ * physical interfaces (USB, SMBus, HSN). The SMBus interface is the lowest
+ * common denominator so this is pretty much modeled after the block read/write
+ * functions. We'll leave integrity checks to the physical interfaces.
+ */
+struct cuc_pkt {
+	u8 cmd;                   /* The command to be sent */
+	u8 count;                 /* The number of bytes to follow (including 'type') */
+	u8 type;                  /* Packet type */
+	u8 data[CUC_DATA_BYTES];  /* Data to be sent */
+} __packed;
+
+enum {
+	CUC_CMD_PING = 0,                       /* Perform a simple ping to the uC firmware */
+	CUC_CMD_BOARD_INFO = 1,                 /* Get board identification info */
+	CUC_CMD_I2C_READ = 2,                   /* Read an i2c device on the Cassini uC */
+	CUC_CMD_I2C_WRITE = 3,                  /* Write an i2c device on the Cassini uC */
+	CUC_CMD_GET_LOG = 12,                   /* Get a log message from the uC */
+	CUC_CMD_GET_FRU = 25,                   /* Get the FRU information for the device */
+	CUC_CMD_SET_FAN_PWM = 26,               /* Set fan to fixed speed w/ given PWM duty cycle */
+	CUC_CMD_GET_FAN_RPM = 27,               /* Get the latest fan RPM value */
+	CUC_CMD_GET_MAC = 29,                   /* Get MAC addresses */
+	CUC_CMD_QSFP_READ = 31,                 /* Do a QSFP/AOC I2C Read */
+	CUC_CMD_QSFP_WRITE = 32,                /* Do a QSFP/AOC I2C Write */
+	CUC_CMD_QSFP_RESET = 33,                /* Do a QSFP/AOC module reset */
+	CUC_CMD_GET_INTR = 34,                  /* Get Interrupt Status and Enable bits for a NIC */
+	CUC_CMD_CLEAR_ISR = 35,                 /* Clear Interrupt Status bits for a NIC */
+	CUC_CMD_UPDATE_IER = 36,                /* Set/Clear Interrupt Enable bits for a NIC */
+	CUC_CMD_PLDM = 39,                      /* Generic entry point for PLDM transaction */
+	CUC_CMD_FIRMWARE_UPDATE_START = 46,     /* Update firmware */
+	CUC_CMD_FIRMWARE_VERSION = 51,          /* Get the version of a firmware component */
+	CUC_CMD_FIRMWARE_UPDATE_DOWNLOAD = 52,  /* Download the firmware */
+	CUC_CMD_FIRMWARE_UPDATE_STATUS = 53,    /* Get status of firmware update */
+	CUC_CMD_RESET = 54,                     /* Reset the uC */
+	CUC_CMD_SET_LED = 58,                   /* Control the blink pattern (state) of an LED */
+	CUC_CMD_GET_NIC_ID = 60,                /* Get the NIC ID associated with this interface */
+	CUC_CMD_GET_TIMINGS = 61,               /* Get the power-on and initialization timings in usec */
+};
+
+enum {
+	CUC_TYPE_REQ,          /* Request packet */
+	CUC_TYPE_RSP_SUCCESS,  /* Success response packet */
+	CUC_TYPE_RSP_ERROR,    /* Error response packet */
+	CUC_TYPE_RSP_PLDM,     /* PLDM response packet */
+};
+
+struct cuc_error_rsp_data {
+	u8 error;  /* The POSIX errno that best describes the error */
+};
+
+enum {
+	CUC_BOARD_TYPE_UNKNOWN = -1,
+	CUC_BOARD_TYPE_SAWTOOTH = 0,
+	CUC_BOARD_TYPE_BRAZOS = 1,
+	CUC_BOARD_TYPE_WASHINGTON = 2,
+	CUC_BOARD_TYPE_KENNEBEC = 3,
+	CUC_BOARD_TYPE_PANGANI = 4,
+	CUC_BOARD_TYPE_SOUHEGAN = 5,
+};
+
+#define is_cas1_board_type(bt) ((bt == CUC_BOARD_TYPE_SAWTOOTH) || \
+								 (bt == CUC_BOARD_TYPE_BRAZOS))
+#define is_cas2_board_type(bt) ((bt == CUC_BOARD_TYPE_WASHINGTON) || \
+								 (bt == CUC_BOARD_TYPE_KENNEBEC) || \
+								 (bt == CUC_BOARD_TYPE_PANGANI) || \
+								 (bt == CUC_BOARD_TYPE_SOUHEGAN))
+struct cuc_board_info_rsp {
+	u8 board_type;
+	u8 board_rev;
+} __packed;
+
+struct cuc_i2c_read_req {
+	u8 bus;        /* The i2c bus number */
+	u8 addr;       /* The 7-bit i2c slave address */
+	u8 type;       /* Transaction type (current/random8/random16 read) */
+	u8 count;      /* Number of bytes to read/write */
+	u16 offset;    /* Offset in slave device to read from (if random) */
+} __attribute__((packed));
+
+struct cuc_i2c_write_req {
+	u8 bus;        /* The i2c bus number */
+	u8 addr;       /* The 7-bit i2c slave address */
+	u8 count;      /* Number of bytes to write */
+	u8 buf[0];
+} __attribute__((packed));
+
+struct cuc_set_fan_pwm_req_data {
+	/* PWM duty cycle value to set
+	 * 0- 100: Set to manual speed control
+	 * 255: Set to auto speed control
+	 */
+	u8 percent;
+} __packed;
+
+struct cuc_get_fan_rpm_rsp_data {
+	u32 rpm;     /* Measured fan speed in RPM */
+	u8 percent;  /* Current value of PWM duty cycle percent */
+	u8 is_auto;  /* Non-zero indicates auto speed control is active */
+} __packed;
+
+/* This is a special value that can be passed in the "nic" field of the
+ * cuc_mac_req_data structure to indicate to the uC that we want to get the
+ * MAC of the NIC that made the request
+ */
+#define CUC_MAC_THIS_NIC  0xFF
+
+struct cuc_mac_req_data {
+	u8 nic;  /* The NIC whose MAC addresses we want */
+} __packed;
+
+struct cuc_mac_rsp_data {
+	u8 nic;         /* The NIC */
+	u8 nic_mac[6];  /* The NIC MAC address */
+	u8 uc_mac[6];   /* The uC MAC address */
+} __packed;
+
+struct cuc_qsfp_read_req_data {
+	u8 nic;    /* Which NIC QSFP device to read */
+	u8 page;   /* Page select for reading */
+	u8 addr;   /* Start address for reading */
+	u8 count;  /* Number of bytes to read */
+} __packed;
+
+struct cuc_qsfp_read_rsp_data {
+	u8 data[0];
+} __packed;
+
+struct cuc_qsfp_write_req_data {
+	u8 nic;      /* Which NIC QSFP device to write */
+	u8 page;     /* Page select for writing */
+	u8 addr;     /* Start address for writing */
+	u8 count;    /* Number of bytes to write */
+	u8 data[];   /* Data to be written */
+} __packed;
+
+struct cuc_qsfp_reset_req_data {
+	u8 nic;  /* Which NIC QSFP device to reset */
+} __packed;
+
+/* These are Interrupt Masks for interrupt sources that cause UC_ATTENTION[1] to be set in
+ * C_PI_ERR_FLG. Some of these interrupt sources are related to the ASIC power-off condition, in
+ * which case it won't be possible to generate the UC_ATTENTION[1] interrupt, but the interrupt
+ * status and mask values are still valid and maintained via the CasuC/CUC interface.
+ */
+/* Bits 0 through 7 are reserved for uC and board-related interrupts */
+#define ATT1_UC_RESET                   BIT(0)
+#define ATT1_SENSOR_ALERT               BIT(1)
+#define ATT1_FAN_FAIL                   BIT(2)
+/* Bits 8 through 15 are reserved for asic-related interrupts */
+#define ATT1_ASIC_PWR_UP_DONE           BIT(8)
+#define ATT1_ASIC_PWR_FAIL              BIT(9)
+#define ATT1_ASIC_EPO_TEMPERATURE       BIT(10)
+/* Bits 16 through 23 are reserved for qsfp-related interrupts */
+#define ATT1_QSFP_POWER_FAIL            BIT(16)
+#define ATT1_QSFP_INSERT                BIT(17)
+#define ATT1_QSFP_REMOVE                BIT(18)
+#define ATT1_QSFP_INT                   BIT(19)
+#define ATT1_QSFP_EPO_TEMPERATURE       BIT(20)
+#define ATT1_QSFP_BAD_CABLE             BIT(21)
+/* Bits 24 through 31 are reserved for other future use */
+#define ATT1_ALL_INTERRUPTS             (0xFFFFFFFF)
+
+/* Most ATT1 interrupts are clearable by the host. Others are hardware-based and self-clearing */
+#define HOST_CLEARED_ATT1_INTERRUPTS  (ATT1_ALL_INTERRUPTS & ~(ATT1_QSFP_INT))
+
+struct cuc_get_intr_req_data {
+	u8 nic;  /* The NIC whose interrupts are being requested */
+} __packed;
+
+struct cuc_get_intr_rsp_data {
+	u32 isr;  /* Interrupt status register */
+	u32 ier;  /* Interrupt enable register */
+} __packed;
+
+struct cuc_clear_isr_req_data {
+	u8 nic;              /* The NIC whose interrupts are being cleared */
+	u32 isr_clear_bits;  /* Interrupt status bits to clear */
+} __packed;
+
+struct cuc_update_ier_req_data {
+	u8 nic;              /* The NIC whose interrupt enables are being updated */
+	u32 ier_set_bits;    /* Interrupt bits to enable */
+	u32 ier_clear_bits;  /* Interrupt bits to disable */
+} __packed;
+
+/* Two copies of the firmware are stored for each NIC, an active copy and a recovery copy */
+enum {
+	FW_SLOT_0,
+	FW_SLOT_ACTIVE = FW_SLOT_0,
+	FW_SLOT_1,
+	FW_SLOT_RECOVERY = FW_SLOT_1,
+	FW_SLOT_MAX
+};
+
+struct cuc_firmware_update_start_req {
+	u8 nic;    /* The NIC whose firmware is to be updated */
+	u32 size;  /* The size of the new firmware */
+	u8 slot;   /* The firmware slot to update */
+} __packed;
+
+/* The firmware (aka QSPI_BLOB) is composed of multiple, separately versioned components
+ * Not all of these targets are included in each blob. Blob contents are HW-specific. */
+enum casuc_fw_target {
+	FW_UC_APPLICATION,
+	FW_UC_BOOTLOADER,
+	FW_QSPI_BLOB,
+	FW_OPROM,
+	FW_CSR1,
+	FW_CSR2,
+	FW_SRDS,
+	FW_ISL68124_SAW,
+	FW_ISL68124_BRZ,
+	FW_IR38060_QSFP_BRZ,
+	FW_IR38060 = FW_IR38060_QSFP_BRZ,
+	/* Start of CAS2-specific entries */
+	FW_TDA38740_WAS,
+	FW_IR38060_WAS,
+	FW_IR38063_WAS,
+	FW_TDA38740_KEN,
+	FW_IR38060_KEN,
+	FW_IR38063_KEN,
+	FW_RESERVED, /* deprecated - FW_IR38060_QSFP_KEN */
+	FW_MFPGA_WAS,
+	FW_TDA38740_SOU,
+	FW_IR38063_0_SOU,
+	FW_IR38063_1_SOU,
+	FW_IR38063_2_SOU,
+	FW_MFPGA_SOU,
+	FW_NUM_ENTRIES
+};
+
+#define CAS1_BLOB_FW_TARGETS	FW_UC_APPLICATION, \
+								FW_UC_BOOTLOADER, \
+								FW_QSPI_BLOB, \
+								FW_OPROM, \
+								FW_CSR1, \
+								FW_CSR2, \
+								FW_SRDS, \
+								FW_ISL68124_SAW, \
+								FW_ISL68124_BRZ, \
+								FW_IR38060_QSFP_BRZ
+
+#define CAS2_BLOB_FW_TARGETS	FW_UC_APPLICATION, \
+								FW_UC_BOOTLOADER, \
+								FW_QSPI_BLOB, \
+								FW_OPROM, \
+								FW_CSR1, \
+								FW_CSR2, \
+								FW_SRDS, \
+								FW_TDA38740_WAS, \
+								FW_IR38060_WAS, \
+								FW_IR38063_WAS, \
+								FW_TDA38740_KEN, \
+								FW_IR38060_KEN, \
+								FW_IR38063_KEN, \
+								FW_MFPGA_WAS, \
+								FW_TDA38740_SOU, \
+								FW_IR38063_0_SOU, \
+								FW_IR38063_1_SOU, \
+								FW_IR38063_2_SOU, \
+								FW_MFPGA_SOU
+
+struct cuc_get_firmware_version_req {
+	u8 fw_target;   /* The component whose version is being requested */
+	u8 nic;         /* The NIC whose firmware version is being requested */
+	u8 from_flash;  /* 0 = Get the running version, 1 = Get the stored version */
+	u8 slot;        /* The slot to get the version from, when getting stored version */
+} __packed;
+
+struct cuc_firmware_update_download_req {
+	u8 data[0];
+} __packed;
+
+enum {
+	FWU_STATUS_STARTED,             /* The firmware update has been started */
+	FWU_STATUS_DOWNLOADING,         /* The firmware is being downloaded */
+	FWU_STATUS_VERIFYING_SIGNATURE, /* The firmware signature is being validated */
+	FWU_STATUS_VALIDATING_IMAGE,    /* The firmware is being validated */
+	FWU_STATUS_FLASHING,            /* The firmware is being flashed */
+	FWU_STATUS_VERIFYING_FLASH,     /* The firmware flash is being verified */
+	FWU_STATUS_IDLE = 0x80,
+	FWU_STATUS_SUCCESS,             /* The firmware update succeeded */
+	FWU_STATUS_FAILED,              /* The firmware update failed */
+	FWU_STATUS_FAILED_DOWNLOAD,     /* The firmware download failed */
+	FWU_STATUS_FAILED_BAD_SIGN,     /* The firmware signature was incorrect */
+	FWU_STATUS_FAILED_VALIDATION,   /* Failure validating image before flashing */
+	FWU_STATUS_FAILED_FLASH,        /* Failure during flash */
+	FWU_STATUS_FAILED_VERIFICATION, /* Failure verifying image in flash */
+	FWU_STATUS_FAILED_INVALID_SLOT, /* The firmware slot is not valid */
+};
+
+struct cuc_firmware_update_status_rsp {
+	u8 status;  /* Status of the firmware update state-machine */
+} __packed;
+
+enum casuc_leds {
+	LED_LINK_STATUS = 0,
+	LED_OCP_LINK_STATUS = 1,
+	LED_OCP_ACTIVITY_STATUS = 2,
+};
+
+/* GRN represents the nominal color and YEL represents the alternate color. Slow blinking
+ * frequency is 1Hz, fast is 2Hz.
+ */
+enum casuc_led_states {
+	LED_OFF = 0,
+	LED_ON_GRN = 1,
+	LED_SLOW_GRN = 2,
+	LED_FAST_GRN = 3,
+	LED_ON_YEL = 4,
+	LED_SLOW_YEL = 5,
+	LED_FAST_YEL = 6,
+	LED_SLOW_GRN_YEL = 7,
+	LED_FAST_GRN_YEL = 8,
+};
+
+struct cuc_set_led_req {
+	u8 nic;    /* The NIC whose LED state is to be set */
+	u8 led;    /* The LED whose state is to be set */
+	u8 state;  /* The state to set */
+} __packed;
+
+struct cuc_get_nic_id_rsp {
+	u8 nic;  /* The requested NIC ID */
+} __packed;
+
+enum cuc_timing_entries {
+    TIMING_UC_APPLICATION_STARTED,
+    TIMING_UC_PIN_INIT_COMPLETE,
+    TIMING_UC_FW_INIT_COMPLETE,
+    TIMING_EN_CLKS_UC_ASSERTED,
+    TIMING_12V_PG,
+    TIMING_PG_CASSINI_ASSERTED,
+    TIMING_RST_PON_NIC_N_DEASSERTED,
+    TIMING_VID_STABLE_ASSERTED,
+    TIMING_PERST_NIC_0_N_DEASSERTED,
+    TIMING_PERST_NIC_1_N_DEASSERTED,
+    TIMING_JTAG_TRST_N_DEASSERTED,
+    TIMING_UC_CASSINI_RDY_NIC_0,
+    TIMING_UC_CASSINI_RDY_NIC_1,
+    TIMING_PCIE_LINK_UP_NIC_0,
+    TIMING_PCIE_LINK_UP_NIC_1,
+    TIMING_UPTIME,
+    TIMING_NUM_ENTRIES
+};
+
+struct cuc_get_timings_rsp {
+    u64 entries_us[TIMING_NUM_ENTRIES];
+} __attribute__((packed));
+
+#endif /* CUC_CXI_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.h b/drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.h
new file mode 100644
index 000000000000..954ee81e92eb
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_AC_ENTRY_LIST_H_
+#define _CXI_AC_ENTRY_LIST_H_
+
+/* Access Control Entries */
+
+#define AC_ENTRY_GFP_OPTS            (GFP_KERNEL)
+
+#define AC_ENTRY_ID_MIN              (1)
+#define AC_ENTRY_ID_MAX              (INT_MAX)
+#define AC_ENTRY_ID_LIMITS           (XA_LIMIT(AC_ENTRY_ID_MIN, \
+					       AC_ENTRY_ID_MAX))
+#define AC_ENTRY_ID_XARRAY_FLAGS     (XA_FLAGS_ALLOC1)
+#define AC_ENTRY_UID_XARRAY_FLAGS    (0)
+#define AC_ENTRY_GID_XARRAY_FLAGS    (0)
+#define AC_ENTRY_NETNS_XARRAY_FLAGS  (0)
+
+#endif /* _CXI_AC_ENTRY_LIST_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_aux_dev.h b/drivers/net/ethernet/hpe/ss1/cxi_aux_dev.h
new file mode 100644
index 000000000000..1eaf47550f5b
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_aux_dev.h
@@ -0,0 +1,14 @@
+
+/* SPDX-License-Identifier: GPL-2.0*/
+/* Copyright 2020-2024,2025 Hewlett Packard Enterprise Development LP */
+#ifndef __CXI_AUX_DEV_H__
+#define __CXI_AUX_DEV_H__
+#include <linux/device.h>
+#include <linux/pci.h>
+
+int cxi_ib_add_adev(struct pci_dev *pdev, struct cass_dev *hw, int cxi_num);
+void cxi_ib_remove_adev(struct cass_dev *hw);
+void cxi_release_aux_dev(struct device *dev);
+u8 *cxi_get_mac_addr(struct cxi_dev *dev);
+
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_config.h b/drivers/net/ethernet/hpe/ss1/cxi_config.h
new file mode 100644
index 000000000000..dd3bf6ea8df5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_config.h
@@ -0,0 +1,234 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_CONFIGFS_MGMT_H
+#define _CXI_CONFIGFS_MGMT_H
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/configfs.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/ctype.h>
+
+#include "cass_core.h"
+
+#define PE_LE_MAX (C_LPE_STS_LIST_ENTRIES_ENTRIES / C_PE_COUNT)
+#define CONFIGFS_DIR_LEN 64
+#define CONFIGFS_RES_TYPE_LEN 16
+
+struct cxi_cfg_group_item {
+	struct config_group group;
+	struct cxi_cfg_rgroup_dir *rgp_dir;
+	struct cxi_cfg_rx_prof_dir *rx_prof_dir;
+	struct cxi_cfg_tx_prof_dir *tx_prof_dir;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup_dir {
+	struct cxi_dev *cdev;
+	struct cxi_rgroup *rgroup;
+	struct config_group group;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup {
+	struct cxi_dev *cdev;
+	struct cxi_rgroup *rgroup;
+	struct cxi_cfg_rgroup_attr *rgp_attr;
+	struct cxi_cfg_rgroup_res *rgp_res;
+	struct cxi_cfg_rgroup_state *rgp_state;
+	struct cxi_cfg_rgroup_ac_entry *ac_entry;
+	struct config_group group;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup_ac_entry {
+	struct config_group group;
+	struct cxi_rgroup *rgroup;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup_ac_entry_sub {
+	struct config_group group;
+	struct config_item item;
+	struct cxi_rgroup *rgroup;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	unsigned int id;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup_attr {
+	struct config_group group;
+	struct config_item item;
+	struct cxi_dev *cdev;
+	struct cxi_rgroup *rgroup;
+	char name[CONFIGFS_DIR_LEN];
+	int c_p_id;
+};
+
+struct cxi_cfg_rgroup_res {
+	struct cxi_dev *cdev;
+	struct cxi_rgroup *rgroup;
+	struct config_group group;
+	struct cxi_svc_desc *desc;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup_state {
+	struct config_group group;
+	struct config_item item;
+	struct cxi_dev *cdev;
+	struct cxi_rgroup *rgroup;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rgroup_res_type {
+	struct config_group group;
+	struct config_item item;
+	struct config_group *parent_group;
+	struct cxi_rgroup *rgroup;
+	struct cxi_dev *cdev;
+	unsigned int id;
+	char name[CONFIGFS_DIR_LEN];
+	char res_type[CONFIGFS_RES_TYPE_LEN];
+	int reserved;
+	int max;
+	int in_use;
+};
+
+struct cxi_cfg_tx_prof_dir {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_tx_prof_state {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_tx_profile *tx_profile;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_tx_prof_ac_entry {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_tx_profile *tx_profile;
+	bool enable;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	unsigned int id;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_tx_prof_ac_entry_sub {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_tx_profile *tx_profile;
+	bool enable;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	unsigned int id;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_tx_prof_attr {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_tx_profile *tx_profile;
+	u16 match;
+	u16 ignore;
+	char tx_attr_name[CXI_VNI_NAME_LEN];
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_tx_prof_tc {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_tx_profile *tx_profile;
+	bool dedicated;
+	bool low_latency;
+	bool bulk_data;
+	bool best_effort;
+	bool eth;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_tx_prof {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	unsigned int id;
+	struct cxi_tx_profile *tx_profile;
+	struct cxi_cfg_tx_prof_ac_entry *tx_prof_ac_entry;
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	struct cxi_cfg_tx_prof_state *tx_prof_state;
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rx_prof_dir {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rx_prof {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	unsigned int id;
+	struct cxi_rx_profile *rx_profile;
+	struct cxi_cfg_rx_prof_ac_entry *rx_prof_ac_entry;
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+	struct cxi_cfg_rx_prof_state *rx_prof_state;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rx_prof_state {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_rx_profile *rx_profile;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rx_prof_ac_entry {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_rx_profile *rx_profile;
+	bool enable;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	unsigned int id;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rx_prof_ac_entry_sub {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_rx_profile *rx_profile;
+	bool enable;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	unsigned int id;
+	char name[CONFIGFS_DIR_LEN];
+};
+
+struct cxi_cfg_rx_prof_attr {
+	struct config_group group;
+	struct cxi_dev *cdev;
+	struct cxi_rx_profile *rx_profile;
+	u16 match;
+	u16 ignore;
+	char rx_attr_name[CXI_VNI_NAME_LEN];
+	char name[CONFIGFS_DIR_LEN];
+};
+
+int cxi_configfs_subsys_init(void);
+void cxi_configfs_cleanup(struct cass_dev *hw);
+int cxi_configfs_device_init(struct cass_dev *hw);
+void cxi_configfs_fini(void);
+void cxi_configfs_exit(void);
+
+#endif /* _CXI_CONFIGFS_MGMT_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_configuration.h b/drivers/net/ethernet/hpe/ss1/cxi_configuration.h
new file mode 100644
index 000000000000..4458bb6078a8
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_configuration.h
@@ -0,0 +1,332 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_CONFIGURATION_H_
+#define _CXI_CONFIGURATION_H_
+
+/* Parameter for use with the 'by_user' retrieve functions */
+#define CXI_AC_ANY (CXI_AC_UID | CXI_AC_GID | CXI_AC_OPEN | CXI_AC_NETNS)
+
+#define AC_TYPE(type) \
+	ac_type == CXI_AC_UID ? "uid" : \
+	ac_type == CXI_AC_GID ? "gid" : \
+	ac_type == CXI_AC_NETNS ? "netns" : \
+	ac_type == CXI_AC_OPEN ? "open" : ""
+
+void cxi_ac_entry_list_init(struct cxi_ac_entry_list *list);
+
+void cxi_ac_entry_list_purge(struct cxi_ac_entry_list *list);
+
+void cxi_ac_entry_list_destroy(struct cxi_ac_entry_list *list);
+
+bool cxi_ac_entry_list_empty(struct cxi_ac_entry_list *list);
+
+int cxi_ac_entry_list_insert(struct cxi_ac_entry_list *list,
+			     enum cxi_ac_type ac_type,
+			     const union cxi_ac_data *ac_data,
+			     unsigned int *id);
+
+int cxi_ac_entry_list_delete(struct cxi_ac_entry_list *list,
+			     unsigned int id);
+
+int cxi_ac_entry_list_retrieve_by_id(struct cxi_ac_entry_list *list,
+				     unsigned int id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *data);
+
+int cxi_ac_entry_list_retrieve_by_data(struct cxi_ac_entry_list *list,
+				       enum cxi_ac_type ac_type,
+				       const union cxi_ac_data *ac_data,
+				       unsigned int *id);
+
+int cxi_ac_entry_list_retrieve_by_user(struct cxi_ac_entry_list *list,
+				       uid_t uid,
+				       gid_t gid,
+				       unsigned int netns,
+				       cxi_ac_typeset_t desired_types,
+				       unsigned int *id);
+
+int cxi_ac_entry_list_retrieve_netns(struct cxi_ac_entry_list *list,
+				     union cxi_ac_data *ac_data);
+
+int cxi_ac_entry_list_get_ids(struct cxi_ac_entry_list *list,
+			      size_t max_ids,
+			      unsigned int *ids,
+			      size_t *num_ids);
+
+/* Common list for RX and TX Profiles */
+struct cxi_rxtx_profile_list {
+	struct xarray    xarray;
+	struct xa_limit  *limits;
+	gfp_t            flags;
+	gfp_t            gfp_opts;
+};
+
+int tx_profile_find_inc_refcount(struct cxi_dev *dev,
+				 unsigned int tx_profile_id,
+				 struct cxi_tx_profile **tx_profile);
+void cxi_rx_profile_remove_ac_entries(struct cxi_rx_profile *rx_profile);
+
+int cxi_rx_profile_release(struct cxi_dev *dev,
+			   unsigned int rx_profile_id);
+int cxi_rx_profile_revoke(struct cxi_dev *dev,
+			  unsigned int rx_profile_id);
+
+struct cxi_rx_profile *cxi_dev_find_rx_profile(struct cxi_dev *dev,
+					       u16 vni);
+struct cxi_rx_profile *cxi_dev_get_rx_profile(struct cxi_dev *dev,
+					      unsigned int vni);
+void cxi_rx_profile_update_pid_table(struct cxi_rx_profile *rx_profile, int pid,
+				     int count, bool set);
+void cxi_rx_profile_andnot_pid_table(struct cxi_reserved_pids *pids,
+				     int len);
+int cxi_rx_profile_alloc_pid(struct cxi_lni_priv *lni_priv,
+			     struct cxi_rx_profile *rx_profile,
+			     int pid, int vni, int count, bool reserve);
+
+int cxi_rx_profile_remove_ac_entry(struct cxi_rx_profile *rx_profile,
+				   unsigned int ac_entry_id);
+int cxi_rx_profile_get_ac_entry_ids(struct cxi_rx_profile *rx_profile,
+				    size_t max_ids,
+				    unsigned int *ac_entry_ids,
+				    size_t *num_ids);
+
+int cxi_rx_profile_get_ac_entry_data(struct cxi_rx_profile *rx_profile,
+				     unsigned int ac_entry_id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *ac_data);
+int cxi_rx_profile_get_ac_entry_id_by_data(struct cxi_rx_profile *rx_profile,
+					   enum cxi_ac_type ac_type,
+					   const union cxi_ac_data *ac_data,
+					   unsigned int *ac_entry_id);
+int cxi_rx_profile_get_ac_entry_id_by_user(struct cxi_rx_profile *rx_profile,
+					   uid_t uid,
+					   gid_t gid,
+					   unsigned int netns,
+					   cxi_ac_typeset_t desired_types,
+					   unsigned int *ac_entry_id);
+void cxi_rx_profile_print(struct seq_file *s);
+
+void cxi_dev_init_eth_tx_profile(struct cass_dev *hw);
+void cxi_eth_tx_profile_cleanup(struct cass_dev *hw);
+struct cxi_tx_profile *cxi_dev_get_eth_tx_profile(struct cxi_dev *dev);
+
+struct cxi_tx_profile *cxi_dev_find_tx_profile(struct cxi_dev *dev,
+					       u16 vni);
+bool cxi_tx_profile_valid_tc(struct cxi_tx_profile *tx_profile,
+			     unsigned int tc);
+
+int cxi_tx_profile_release(struct cxi_dev *dev,
+			   unsigned int tx_profile_id);
+int cxi_tx_profile_revoke(struct cxi_dev *dev,
+			  unsigned int tx_profile_id);
+
+int cxi_tx_profile_get_info(struct cxi_dev *dev,
+			    struct cxi_tx_profile *tx_profile,
+			    struct cxi_tx_attr *tx_attr,
+			    struct cxi_rxtx_profile_state *state);
+
+int cxi_tx_profile_remove_ac_entry(struct cxi_tx_profile *tx_profile,
+				   unsigned int ac_entry_id);
+int cxi_tx_profile_get_ac_entry_ids(struct cxi_tx_profile *tx_profile,
+				    size_t max_ids,
+				    unsigned int *ac_entry_ids,
+				    size_t *num_ids);
+
+int cxi_tx_profile_get_ac_entry_data(struct cxi_tx_profile *tx_profile,
+				     unsigned int ac_entry_id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *ac_data);
+int cxi_tx_profile_get_ac_entry_id_by_data(struct cxi_tx_profile *tx_profile,
+					   enum cxi_ac_type ac_type,
+					   const union cxi_ac_data *ac_data,
+					   unsigned int *ac_entry_id);
+int cxi_tx_profile_get_ac_entry_id_by_user(struct cxi_tx_profile *tx_profile,
+					   uid_t uid,
+					   gid_t gid,
+					   unsigned int netns,
+					   cxi_ac_typeset_t desired_types,
+					   unsigned int *ac_entry_id);
+void cxi_tx_profile_print(struct seq_file *s);
+
+enum cxi_profile_type {
+	CXI_PROF_RX = 1,
+	CXI_PROF_TX
+};
+
+bool cxi_valid_vni(struct cxi_dev *dev, enum cxi_profile_type type,
+		   unsigned int vni);
+
+/* Resource Group Entries */
+
+struct cxi_rgroup;
+
+struct cxi_rgroup_list {
+	struct xarray    xarray;
+};
+
+static const char * const cxi_resource_type_strs[] = {
+	[CXI_RESOURCE_PTLTE] = "ptlte",
+	[CXI_RESOURCE_TXQ] = "txq",
+	[CXI_RESOURCE_TGQ] = "tgq",
+	[CXI_RESOURCE_EQ] = "eq",
+	[CXI_RESOURCE_CT] = "ct",
+	[CXI_RESOURCE_PE0_LE] = "pe0_le",
+	[CXI_RESOURCE_PE1_LE] = "pe1_le",
+	[CXI_RESOURCE_PE2_LE] = "pe2_le",
+	[CXI_RESOURCE_PE3_LE] = "pe3_le",
+	[CXI_RESOURCE_TLE] = "tle",
+	[CXI_RESOURCE_AC] = "ac",
+};
+
+static inline
+const char *cxi_resource_type_to_str(enum cxi_resource_type type)
+{
+	if (type >= CXI_RESOURCE_PTLTE && type < CXI_RESOURCE_MAX)
+		return cxi_resource_type_strs[type];
+
+	return "(invalid)";
+}
+
+struct cxi_resource_use {
+	size_t     reserved;
+	size_t     shared;
+	size_t     shared_use;
+	size_t     in_use;
+	size_t     max;
+};
+
+struct cxi_resource_entry {
+	struct cxi_rgroup          *rgroup;
+	enum cxi_resource_type     type;
+	struct cxi_resource_limits limits;
+};
+
+struct cxi_resource_entry_list {
+	struct cxi_rgroup   *rgroup;
+	struct xarray       xarray;
+};
+
+struct cxi_rgroup_pools {
+	int            le_pool_id[C_PE_COUNT];
+	int            tle_pool_id;
+};
+
+/* Resource Group */
+
+struct cxi_rgroup_attr;
+struct cxi_rgroup_state;
+
+bool cxi_rgroup_valid_user(struct cxi_rgroup *rgroup);
+
+void cxi_dev_lock_rgroup_list(struct cass_dev *hw);
+void cxi_dev_unlock_rgroup_list(struct cass_dev *hw);
+
+void cxi_rgroup_get_info(struct cxi_rgroup *rgroup,
+			 struct cxi_rgroup_attr *attr,
+			struct cxi_rgroup_state *state);
+
+int cxi_rgroup_delete_resource(struct cxi_rgroup *rgroup,
+			       enum cxi_resource_type resource_type);
+
+int cxi_rgroup_get_resource(struct cxi_rgroup *rgroup,
+			    enum cxi_resource_type resource_type,
+			    struct cxi_resource_limits *limits);
+
+int cxi_rgroup_get_resource_entry(struct cxi_rgroup *rgroup,
+				  enum cxi_resource_type type,
+				  struct cxi_resource_entry **entry);
+
+int cxi_rgroup_get_resource_types(struct cxi_rgroup *rgroup,
+				  size_t max_resources,
+				  enum cxi_resource_type *resource_types,
+				  size_t *num_resources);
+
+int cxi_rgroup_alloc_resource(struct cxi_rgroup *rgroup,
+			      enum cxi_resource_type type);
+void cxi_rgroup_free_resource(struct cxi_rgroup *rgroup,
+			      enum cxi_resource_type type);
+
+int cxi_rgroup_delete_ac_entry(struct cxi_rgroup *rgroup,
+			       unsigned int ac_entry_id);
+
+int cxi_rgroup_get_ac_entry_ids(struct cxi_rgroup *rgroup,
+				size_t max_ids,
+				unsigned int *ids,
+				size_t *num_ids);
+
+int cxi_rgroup_get_ac_entry_data(struct cxi_rgroup *rgroup,
+				 unsigned int ac_entry_id,
+				 enum cxi_ac_type *type,
+				 union cxi_ac_data *ac_data);
+
+int cxi_rgroup_get_ac_entry_id_by_data(struct cxi_rgroup *rgroup,
+				       enum cxi_ac_type type,
+				       const union cxi_ac_data *ac_data,
+				       unsigned int *ac_entry_id);
+
+int cxi_rgroup_get_ac_entry_by_user(struct cxi_rgroup *rgroup,
+				    uid_t uid,
+				    gid_t gid,
+				    unsigned int netns,
+				    cxi_ac_typeset_t desired_types,
+				    unsigned int *ac_entry_id);
+
+void cxi_rgroup_inc_refcount(struct cxi_rgroup *rgroup);
+
+void cxi_rgroup_print_ac_entry_info(struct cxi_rgroup *rgroup,
+				    struct seq_file *s);
+
+int cxi_dev_find_rgroup_inc_refcount(struct cxi_dev *dev,
+				     unsigned int id,
+				     struct cxi_rgroup **rgroup);
+
+unsigned int cxi_dev_get_rgroup_count(struct cxi_dev *dev);
+
+int cxi_dev_get_rgroup_ids(struct cxi_dev *dev,
+			   size_t max_ids,
+			   unsigned int *rgroup_ids,
+			   size_t *num_ids);
+
+int cxi_dev_rgroup_get_resource(struct cxi_dev *dev,
+				unsigned int rgroup_id,
+				enum cxi_resource_type resource_type,
+				struct cxi_resource_limits *limits);
+
+int cxi_dev_rgroup_get_resource_types(struct cxi_dev *dev,
+				      unsigned int rgroup_id,
+				      size_t max_types,
+				      enum cxi_resource_type *resource_types,
+				      size_t *num_types);
+
+int cxi_dev_rgroup_delete_ac_entry(struct cxi_dev *dev,
+				   unsigned int rgroup_id,
+				   unsigned int ac_entry_id);
+
+int cxi_dev_rgroup_get_ac_entry_ids(struct cxi_dev *dev,
+				    unsigned int rgroup_id,
+				    size_t max_ids,
+				    unsigned int *ac_entry_ids,
+				    size_t *num_ids);
+
+int cxi_dev_rgroup_get_ac_entry_data(struct cxi_dev *dev,
+				     unsigned int rgroup_id,
+				     unsigned int ac_entry_id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *ac_data);
+
+int cxi_dev_rgroup_get_ac_entry_id_by_data(struct cxi_dev *dev,
+					   unsigned int rgroup_id,
+					   enum cxi_ac_type ac_type,
+					   union cxi_ac_data *ac_data,
+					   unsigned int *ac_entry_id);
+
+int cxi_dev_rgroup_get_ac_entry_id_by_user(struct cxi_dev *dev,
+					   unsigned int rgroup_id,
+					   uid_t uid,
+					   gid_t gid,
+					   unsigned int netns,
+					   cxi_ac_typeset_t desired_types,
+					   unsigned int *ac_entry_id);
+
+#endif /* _CXI_CONFIGURATION_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_core.h b/drivers/net/ethernet/hpe/ss1/cxi_core.h
new file mode 100644
index 000000000000..471cc9b3b393
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_core.h
@@ -0,0 +1,434 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2022-2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_CORE_H
+#define _CXI_CORE_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/hmm.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/refcount.h>
+#include <linux/mmu_notifier.h>
+
+#define DFA_EP_BITS 17
+#define MAX_PID_BITS 9
+#define MIN_PID_BITS (MAX_PID_BITS - 3)
+#define XSTR(x) STR(x)
+#define STR(x) #x
+
+#define HAVE_GET_SINGLETON
+
+#define HAVE_IOVA_INIT_RCACHES
+
+#define dev_emerg_always(dev, fmt, ...)	  dev_emerg(dev, fmt, ##__VA_ARGS__)
+#define dev_alert_always(dev, fmt, ...)	  dev_alert(dev, fmt, ##__VA_ARGS__)
+#define dev_crit_always(dev, fmt, ...)	  dev_crit(dev, fmt, ##__VA_ARGS__)
+#define dev_err_always(dev, fmt, ...)	  dev_err(dev, fmt, ##__VA_ARGS__)
+#define dev_warn_always(dev, fmt, ...)	  dev_warn(dev, fmt, ##__VA_ARGS__)
+#define dev_notice_always(dev, fmt, ...)  dev_notice(dev, fmt, ##__VA_ARGS__)
+#define dev_info_always(dev, fmt, ...)	  dev_info(dev, fmt, ##__VA_ARGS__)
+#define dev_dbg_always(dev, fmt, ...)	  dev_dbg(dev, fmt, ##__VA_ARGS__)
+
+/*
+ * This is the main or core cassini cxi logging macro.	It is not intended to
+ * be used directly anywhere except the cxidev_*() macros.  The whole purpose
+ * behind this logging is to use '"%s: " fmt' and '"%s/%s: " fmt' to take
+ * advantage of C string constant concatenation to add common information to
+ * the logged cassini cxi messages.
+ */
+#define _cxi_log(freq, severity, cdev, fmt, ...)			\
+	dev_##severity##_##freq(&(cdev)->pdev->dev,		\
+				"%s[%s] " fmt,				\
+				(cdev)->name, (cdev)->eth_name,		\
+				##__VA_ARGS__)
+
+/*
+ * the cassini log equivalent of dev_*() log
+ */
+#define cxidev_emerg(cdev, fmt, ...)\
+		_cxi_log(always, emerg, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_alert(cdev, fmt, ...)\
+		_cxi_log(always, alert, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_crit(cdev, fmt, ...)\
+		_cxi_log(always, crit, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_err(cdev, fmt, ...)\
+		_cxi_log(always, err, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_warn(cdev, fmt, ...)\
+		_cxi_log(always, warn, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_notice(cdev, fmt, ...)\
+		_cxi_log(always, notice, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_info(cdev, fmt, ...)\
+		_cxi_log(always, info, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_dbg(cdev, fmt, ...)\
+		_cxi_log(always, dbg, cdev, fmt, ##__VA_ARGS__)
+
+#define cxidev_WARN(cdev, fmt, ...)\
+		dev_WARN(&(cdev)->cdev.pdev->dev,			\
+			 "%s[%s]: " fmt, (cdev)->cdev.name,	\
+			 (cdev)->cdev.eth_name,			\
+			 ##__VA_ARGS__)
+
+/*
+ * the cassini log equivalent of dev_*_once()
+ */
+#define cxidev_emerg_once(cdev, fmt, ...)\
+		_cxi_log(once, emerg, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_alert_once(cdev, fmt, ...)\
+		_cxi_log(once, alert, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_crit_once(cdev, fmt, ...)\
+		_cxi_log(once, crit, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_err_once(cdev, fmt, ...)\
+		_cxi_log(once, err, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_warn_once(cdev, fmt, ...)\
+		_cxi_log(once, warn, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_notice_once(cdev, fmt, ...)\
+		_cxi_log(once, notice, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_info_once(cdev, fmt, ...)\
+		_cxi_log(once, info, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_dbg_once(cdev, fmt, ...)\
+		_cxi_log(once, dbg, cdev, fmt, ##__VA_ARGS__)
+
+#define cxidev_WARN_ONCE(cdev, condition, fmt, ...)\
+		dev_WARN_ONCE(&(cdev)->pdev->dev, (condition),	\
+			      "%s[%s]: " fmt, (cdev)->name,		\
+			      (cdev)->eth_name,			\
+			      ##__VA_ARGS__)
+
+/*
+ * the cassini log equivalent of dev_*_ratelimited()
+ */
+#define cxidev_emerg_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, emerg, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_alert_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, alert, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_crit_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, crit, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_err_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, err, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_warn_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, warn, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_notice_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, notice, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_info_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, info, cdev, fmt, ##__VA_ARGS__)
+#define cxidev_dbg_ratelimited(cdev, fmt, ...)\
+		_cxi_log(ratelimited, dbg, cdev, fmt, ##__VA_ARGS__)
+
+extern unsigned int pid_bits;
+extern unsigned int system_type_identifier;
+extern unsigned int min_free_shift;
+extern unsigned int vni_matching;
+extern unsigned int tg_threshold[4];
+extern int untagged_eth_pcp;
+extern bool switch_connected;
+
+extern atomic_t cxi_num;
+extern struct class cxi_class;
+extern struct dentry *cxi_debug_dir;
+
+extern int hw_register(void);
+extern void hw_unregister(void);
+extern int cxi_configfs_subsys_init(void);
+extern void cxi_configfs_exit(void);
+
+void cxi_add_device(struct cxi_dev *cdev);
+void cxi_remove_device(struct cxi_dev *cdev);
+void cxi_send_async_event(struct cxi_dev *cdev, enum cxi_async_event event);
+void cxi_apply_for_all(void (*callback)(struct cxi_dev *dev, void *p),
+		       void *p);
+
+#define CXI_DEFAULT_LNIS_PER_RGID 1
+
+/* Service */
+struct cxi_svc_priv {
+	struct list_head list;
+	struct cxi_svc_desc svc_desc;
+	struct cxi_rgroup *rgroup;
+	struct cxi_rx_profile *rx_profile[CXI_SVC_MAX_VNIS];
+	struct cxi_tx_profile *tx_profile[CXI_SVC_MAX_VNIS];
+};
+
+/* Logical Network Interface */
+struct cxi_lni_priv {
+	struct cxi_dev *dev;
+	DECLARE_BITMAP(leased_pids, 1 << MAX_PID_BITS);
+	/* User LNI object. */
+	struct cxi_lni lni;
+
+	struct list_head list;
+	/* Users of this LNI. */
+	refcount_t refcount;
+
+	/* Service associated with this LNI. */
+	struct cxi_rgroup *rgroup;
+
+	/* Keep track of associated resources. TODO: keep as that may
+	 * help debugging, but should be removed eventually.
+	 */
+	struct list_head domain_list;
+	struct list_head eq_list;
+	struct list_head cq_list;
+	struct list_head pt_list;
+	struct list_head ac_list;
+	struct list_head ct_list;
+	struct list_head reserved_pids;
+	spinlock_t res_lock;
+	struct mutex ac_list_mutex;
+
+	struct ida lac_table;
+	atomic_t lpe_pe_num;
+
+	struct dentry *debug_dir;
+	struct dentry *cq_dir;
+	struct dentry *pt_dir;
+	struct dentry *eq_dir;
+	struct dentry *ct_dir;
+	struct dentry *ac_dir;
+
+	/* Pending resources to cleanup. Use res_lock to serialize. */
+	struct list_head pt_cleanups_list;
+	struct list_head cq_cleanups_list;
+	struct list_head eq_cleanups_list;
+	struct list_head ct_cleanups_list;
+
+	u32 pid;
+
+	/* Physical AC associated with the LNI. Should be ATU_PHYS_AC for LNIs
+	 * belonging to the PF, or the VF's physical AC for VFs.
+	 */
+	unsigned int phys_ac;
+
+	/* If this LNI belongs to a VF, then vf_en will be true and the VF number
+	 * will be in vf_num.
+	 */
+	bool is_vf;
+	u8 vf_num;
+};
+
+#include "cass_p2p.h" /* Pick up cxi_p2p_fini(), needs to be after the
+		       * definition of cxi_lni_priv */
+struct cass_vni;
+
+struct cxi_reserved_pids {
+	struct list_head entry;
+	struct cxi_rx_profile *rx_profile;
+	DECLARE_BITMAP(table, 1 << MAX_PID_BITS);
+};
+
+struct ct_wb_desc {
+	struct page *page;
+	dma_addr_t wb_dma_addr;
+	struct cxi_md_priv *md_priv;
+	bool is_map_page;
+};
+
+struct cxi_ct_priv {
+	struct list_head entry;
+	struct cxi_lni_priv *lni_priv;
+	struct dentry *debug_dir;
+	struct dentry *lni_dir;
+	struct ct_wb_desc wb_desc;
+	struct cxi_ct ct;
+	bool is_user;
+
+	/* Doorbell MMIO address */
+	void __iomem *ct_mmio;
+};
+
+struct cxi_domain_priv {
+	struct cxi_domain domain;
+	struct cxi_lni_priv *lni_priv;
+	struct list_head list;
+	struct dentry *debug_dir;
+	struct rb_node node;	/* attach to domain_tree */
+	struct cxi_rx_profile *rx_profile;
+
+	/* Users of this domain */
+	refcount_t refcount;
+};
+
+struct cxi_md_priv {
+	struct cxi_lni_priv *lni_priv;
+	struct device *device;
+	struct cxi_md md;
+	struct page **pages;
+	struct sg_table *sgt;
+	u32 flags;
+
+	struct list_head md_entry; /* entry in a CAC md_list */
+	struct cass_ac *cac;
+
+	struct sg_table *dmabuf_sgt;
+
+	/* DMA buffer file descriptor. This is passed in by user-space. */
+	int dmabuf_fd;
+
+	/* Offset into the DMA buffer where PFN mapping should begin. */
+	unsigned long dmabuf_offset;
+
+	/* User request DMA buffer len. This should not be aligned. */
+	unsigned long dmabuf_length;
+
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *dmabuf_attach;
+
+	/* Users of this MD */
+	refcount_t refcount;
+
+	/* Original length of the MD */
+	size_t olen;
+
+	/* Need to lock when initially mirroring page tables */
+	bool need_lock;
+	/* SG table is owned by an external user (e.g. kfabric) */
+	bool external_sgt_owner;
+	struct mmu_interval_notifier mn_sub;
+	/* GPU direct info */
+	void *p2p_info;
+	bool cleanup_done;
+};
+
+struct cxi_cp_priv {
+	struct cxi_dev *dev;
+	struct cxi_cp cp;
+	struct cass_cp *cass_cp;
+	refcount_t refcount;
+	unsigned int rgid;
+	unsigned int lni_id;
+};
+
+/* EQ buffer description */
+struct eq_buf_desc {
+	const struct cxi_md *md; /* Virtual buffer MD. */
+	void *events;
+	size_t events_len;
+
+	struct page **pages;
+
+	dma_addr_t dma_addr; /* DMA buffer address. */
+};
+
+struct cxi_eq_priv {
+	struct cxi_lni_priv *lni_priv;
+	struct list_head list;
+	struct dentry *debug_file;
+	struct dentry *lni_dir;
+
+	bool reused;
+
+	/* Users of this EQ */
+	refcount_t refcount;
+
+	/* EQ buffer description */
+	struct eq_buf_desc active;
+
+	/* Doorbell MMIO address */
+	void __iomem *eq_mmio;
+
+	/* Current EQ descriptor state */
+	union c_ee_cfg_eq_descriptor cfg;
+
+	/* Copy of the creation attributes */
+	struct cxi_eq_attr attr;
+
+	/* Public event queue */
+	struct cxi_eq eq;
+
+	/* Interrupt vectors, and callbacks */
+	struct cass_irq *event_msi_irq;
+	void (*event_cb)(void *context);
+	void *event_cb_data;
+	struct notifier_block event_nb;
+
+	struct cass_irq *status_msi_irq;
+	void (*status_cb)(void *context);
+	void *status_cb_data;
+	struct notifier_block status_nb;
+
+	/* Number of slots in queue. */
+	size_t queue_size;
+
+	/* Resize buffer attributes */
+	struct mutex resize_mutex;
+	bool resized;
+	struct eq_buf_desc resize;
+};
+
+struct cxi_cq_priv {
+	struct cxi_lni_priv *lni_priv;
+	struct cxi_cq cass_cq;
+
+	/* DMA mapped CQ */
+	size_t cmds_len;
+	size_t cmds_order;
+	struct page **pages;
+	struct page *cmds_pages;
+	void *cmds;
+	dma_addr_t cmds_dma_addr;
+
+	/* Doorbell MMIO address */
+	void __iomem *cq_mmio;
+
+	u32 flags;
+	struct cxi_md_priv *md_priv;
+
+	struct list_head list;
+	struct dentry *debug_dir;
+	struct dentry *lni_dir;
+
+	/* EQ for error reporting. May be NULL. */
+	struct cxi_eq_priv *eq;
+};
+
+struct cxi_pte_priv {
+	struct cxi_lni_priv *lni_priv;
+	struct list_head list;
+	struct dentry *debug_dir;
+	struct dentry *lni_dir;
+
+	struct cxi_pte pte;
+
+	struct cxi_eq_priv *eq;
+
+	/* Users of this portal table entries. */
+	refcount_t refcount;
+
+	/* Pte is flow control enabled. */
+	bool fc_enabled;
+	bool plec_enabled;
+
+	/* pt_n -> mcast_id mapping */
+	unsigned int mcast_n;
+
+	/* Keep track of used MST entries when releasing the PTe. The
+	 * PTe can only be released when all MSTs attached to it have
+	 * been recycled.
+	 */
+	DECLARE_BITMAP(mst_rc_update, C_MST_DBG_MST_TABLE_ENTRIES);
+
+	int pe_num;
+	int le_pool;
+};
+
+void cxi_free_resource(struct cxi_dev *dev, struct cxi_svc_priv *svc_priv,
+		       enum cxi_rsrc_type type);
+int cxi_alloc_resource(struct cxi_dev *dev, struct cxi_svc_priv *svc_priv,
+		       enum cxi_rsrc_type type);
+unsigned int cxi_lni_get_pe_num(struct cxi_lni_priv *lni);
+
+
+void cxi_domain_lni_cleanup(struct cxi_lni_priv *lni_priv);
+
+int nvidia_p2p_init(void);
+void nvidia_p2p_fini(void);
+
+int amd_p2p_init(void);
+void amd_p2p_fini(void);
+
+int cxi_dma_buf_init(void);
+void cxi_dma_buf_fini(void);
+
+#include "cxi_configuration.h"
+
+#endif	/* _CXI_CORE_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth.h b/drivers/net/ethernet/hpe/ss1/cxi_eth.h
new file mode 100644
index 000000000000..84590ef58ebf
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_eth.h
@@ -0,0 +1,352 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cassini ethernet driver
+ * Copyright 2018-2020,2022 Hewlett Packard Enterprise Development LP
+ */
+
+#ifndef __CXI_ETH_H__
+#define __CXI_ETH_H__
+#include <linux/hpe/cxi/cxi.h>
+#include <uapi/ethernet/cassini_user_defs.h>
+#include <linux/ethtool.h>
+#include <linux/net_tstamp.h>
+#include <linux/netlink.h>
+
+#include "cxi_ethtool.h"
+#include "cxi_core.h"
+
+#define NETIF_NAPI_ADD netif_napi_add
+#define NETIF_NAPI_ADD_TX netif_napi_add_tx
+
+#define CXI_ETH_1_MB (1024 * 1024)
+#define CXI_ETH_1_GB (CXI_ETH_1_MB * 1024)
+
+#define SMALL_PKTS_BUF_COUNT_MIN 1U
+#define SMALL_PKTS_BUF_COUNT_MAX (16 * 1024U)
+
+#define LARGE_PKTS_BUF_COUNT_MIN 1U
+#define LARGE_PKTS_BUF_COUNT_MAX 10000U
+
+#define TX_QUEUE_LEN_DEFAULT 1000
+
+#define MAX_LE_LIMIT 16384
+
+/* Align max TX queues to max RX queues. */
+#define CXI_ETH_MAX_TX_QUEUES CXI_ETH_MAX_RSS_QUEUES
+
+/* 4.12 kernels do not define these.
+ * TODO: remove eventually
+ */
+#define SPEED_400000       400000
+#define SPEED_200000       200000
+#define ETHTOOL_LINK_MODE_50000baseKR_Full_BIT   52
+#define	ETHTOOL_LINK_MODE_100000baseCR2_Full_BIT 59
+#define	ETHTOOL_LINK_MODE_200000baseCR4_Full_BIT 66
+
+/* Cassini 1 & 2 support up to 5 segments */
+#define C_MAX_ETH_FRAGS 5
+#define MAX_CB_LEN 3
+
+/* Private DMA registration data stored in the SKB cb */
+struct cb_data {
+	u8 num_frags;
+	u16 dma_len[MAX_CB_LEN]; /* alas, not enough room for C_MAX_ETH_FRAGS */
+	dma_addr_t dma_addr[C_MAX_ETH_FRAGS];
+};
+
+static inline void cxi_force_icrc_check(struct sk_buff *skb)
+{
+#ifdef SKBTX_ZEROCOPY_FRAG
+	skb_shinfo(skb)->__unused |= BIT(1);
+#else
+	skb_shinfo(skb)->flags |= BIT(6);
+#endif
+}
+
+static inline void cxi_skb_icrc_gone(struct sk_buff *skb)
+{
+#ifdef SKBTX_ZEROCOPY_FRAG
+	skb_shinfo(skb)->__unused |= BIT(0);
+#else
+	skb_shinfo(skb)->flags |= BIT(7);
+#endif
+}
+
+/* An RX buffer. It can end-up on the request or priority list. */
+struct rx_buffer {
+	struct list_head buf_list;
+
+	unsigned int id;
+
+	size_t data_size;
+
+	enum c_ptl_list ptl_list; /* PRIORITY or REQUEST */
+
+	union {
+		struct {
+			/* Valid only if list is PRIORITY */
+			struct page *page;
+			dma_addr_t mapping;
+			size_t cur_offset;
+			unsigned int posted_count;
+		};
+		struct {
+			/* Valid only if list is REQUEST */
+			struct cxi_md *md;
+			u8 *data;
+		};
+	};
+};
+
+struct tx_queue {
+	struct cxi_eth *dev;
+	struct cxi_eq_attr eq_attr;
+	struct cxi_md *eq_md;
+	struct cxi_eq *eq;
+	struct cxi_cq *eth1_cq;
+	struct cxi_cq *eth2_cq; /* Initialized conditionally */
+	struct cxi_cq *shared_cq;
+	struct cxi_cq *untagged_cq; /* Points to one of the above CQs */
+	struct napi_struct napi;
+
+	/* It is possible for start_xmit to get a lot of small packets
+	 * that fill up the TX queue, in which case
+	 * netif_tx_stop_queue() would be called. However since IDC
+	 * packets do not generate an interrupt, the send queue may
+	 * never be awaken again. Protect against that by forcing a
+	 * DMA instead of IDC every 'force_dma_interval' contiguous
+	 * IDC requests.
+	 */
+	int force_dma;
+	int force_dma_interval;
+
+	/* Associated netdev TX queue. */
+	unsigned int id;
+
+	/* NUMA node and CPU TX queue should be bound to. */
+	unsigned int node;
+	unsigned int cpu;
+
+	/* Each DMA op can use up to an EQ slot (16 or 32 bytes event,
+	 * plus padding). If too many DMA operations are in flight,
+	 * the EQ might get overrun. Pause the EQ in that case.
+	 */
+	atomic_t dma_eq_cdt;
+
+	struct {
+		u64 polling;
+		u64 stopped;	/* netif queue stopped by driver, CQ almost full */
+		u64 stopped_eq;	/* netif queue stopped by driver, EQ almost full */
+		u64 restarted;	/* netif queue restarted by driver */
+		u64 tx_busy;	/* returned NETDEV_TX_BUSY */
+		u64 idc;
+		u64 idc_bytes;
+		u64 dma;
+		u64 dma_bytes;
+		u64 dma_forced;
+	} stats;
+};
+
+#define NB_BUCKETS 23
+struct bucket {
+	u64 min_ts;
+	u64 max_ts;
+	u64 b[NB_BUCKETS];
+};
+
+struct rx_queue {
+	struct cxi_eth *dev;
+	void *eq_buf;
+	size_t eq_buf_size;
+	struct cxi_md *eq_md;
+	struct cxi_eq *eq;
+	struct cxi_pte *pt;
+	struct napi_struct napi;
+
+	struct cxi_cq *cq_tgt_prio;
+
+	/* Pool of receive buffers. Buffers start on the rx_ready
+	 * list, where they wait to be appended to a portal. When a
+	 * buffer is appended, it moves to the rx_in_use
+	 * list. Eventually the buffer is unlinked by Cassini (usually
+	 * after it becomes full) and reused again by the driver once
+	 * all its data has been consumed.
+	 *
+	 * The buffers on the request list are for "small" packets,
+	 * while the buffers on the priority list are for large
+	 * packets.
+	 */
+	struct list_head rx_unallocated;
+	struct list_head rx_ready; /* allocated but not appended */
+	struct list_head rx_in_use; /* appended or unlinked */
+
+	unsigned int rx_bufs_count;
+	struct rx_buffer *rx_bufs;
+
+	/* Segmented packet reassembly state */
+	enum { FRAG_NONE, FRAG_MORE, FRAG_DROP } frag_state;
+	u64 pkt_cnt;
+	u8 next_seg_cnt;
+
+	unsigned int last_bad_frag_drop_rc;
+
+	struct {
+		u64 append_prio;
+		u64 append_req;
+		u64 append_failed;
+		u64 unlinked_prio;
+		u64 unlinked_req;
+	} stats;
+
+	/* Associated netdev RX queue. */
+	unsigned int id;
+
+	/* NUMA node and CPU RX queue should be bound to. */
+	unsigned int node;
+	unsigned int cpu;
+
+	/* Debug code. Should be removed eventually. Measure the time
+	 * between a napi schedule call, and the call to rx_eq_cb() to
+	 * process the queue.
+	 */
+	ktime_t time_napi_schedule;
+	struct bucket eth_napi_schedule;
+
+	/* Number of times an page should be posted to the priority queue. */
+	unsigned int page_chunks;
+};
+
+/* A queue only for PTP packets. Cassini ERRATA-3258. */
+#define PTP_RX_Q max_rss_queues
+
+struct cxi_eth {
+	struct list_head dev_list;
+	struct cxi_dev *cxi_dev;
+	bool is_c2;
+
+	struct net_device *ndev;
+
+	struct dentry *debug;
+
+	bool is_active;
+
+	int svc_id;
+	u32 min_free;
+	u64 mac_addr;
+
+	/* Cassini ERRATA-3258 for PTP. Cassini 1/1.1 doesn't set the timestamp
+	 * bit. Instead we have a separate portal entry that will only
+	 * get the PTP packets with the special MAC address. If
+	 * ptp_ts_enabled is true then these packets will have a
+	 * timestamp, except for a very short window.
+	 */
+	bool ptp_ts_enabled;
+	u64 ptp_mac_addr;
+	struct sk_buff *tstamp_skb;
+
+	unsigned int phys_lac;
+
+	bool eth2_active;
+	int eth1_pcp;
+	int eth2_pcp;
+
+	struct cxi_lni *lni;
+	struct cxi_cp *eth1_cp;
+	struct cxi_cp *eth2_cp;
+	struct cxi_cp *shared_cp;
+
+	/* Shared CQ with every RX channel for their target request
+	 * list. As posted buffers are big, operations on this CQ will
+	 * be few and far between.
+	 */
+	spinlock_t cq_tgt_req_lock;
+	struct cxi_cq *cq_tgt_req;
+
+	/* Event queue used for CQ errors. */
+	struct cxi_eq *err_eq;
+	struct cxi_eq_attr err_eq_attr;
+
+	/* TX queues/rings. TXQ zero remains allocated for the duration of the
+	 * Ethernet interface remaining open. TXQs greater than zero are
+	 * allocated/deallocated base on number of configured TX queues.
+	 */
+	struct tx_queue *txqs;
+	unsigned int cur_txqs;
+
+	/* RX queues/rings. RXQ zero is the default/catch-all RX queue and
+	 * remains allocated for the duration of the Ethernet interface
+	 * remaining open. RXQs greater than zero and allocated/deallocated
+	 * based on number of configured RX queues.
+	 */
+	struct rx_queue *rxqs;
+
+	/* Number of RX buffers */
+	unsigned int num_prio_buffers;
+	unsigned int num_req_buffers;
+
+	struct ethtool_ringparam ringparam;
+	struct kernel_ethtool_ringparam kernel_ring;
+
+	struct cxi_eth_res res;
+	struct cxi_eth_info eth_info;
+
+	/* ethtool private flags (CXI_ETH_PF_...) */
+	u32 priv_flags;
+
+	/* Timestamp config copy */
+	struct hwtstamp_config tstamp_config;
+};
+
+extern unsigned int rss_indir_size;
+extern unsigned int max_rss_queues;
+extern unsigned int max_tx_queues;
+extern unsigned int small_pkts_buf_size;
+extern unsigned int idc_dma_threshold;
+extern unsigned int lpe_cdt_thresh_id;
+extern unsigned long rx_repost_retry_jiffies;
+extern unsigned int small_pkts_buf_count;
+extern unsigned int large_pkts_buf_count;
+extern unsigned int buffer_threshold;
+
+#define CXI_ETH_MAX_MTU 9000
+#define CXI_ETH_TX_TIMEOUT (5 * HZ)
+
+/* Compute an approximative number of packets that can be contained in
+ * the small buffers. Since each segment cannot be larger that the
+ * buffer_threshold, use that as a base.
+ */
+static inline u32 num_small_packets(u32 buf_count)
+{
+	return buf_count * (small_pkts_buf_size / buffer_threshold);
+}
+
+size_t get_rxq_eq_buf_size(struct cxi_eth *dev);
+void hw_cleanup(struct cxi_eth *dev);
+int hw_setup(struct cxi_eth *dev);
+
+/* Netdev methods */
+int cxi_eth_open(struct net_device *ndev);
+int cxi_eth_close(struct net_device *ndev);
+netdev_tx_t cxi_eth_start_xmit(struct sk_buff *skb, struct net_device *dev);
+int cxi_eth_mac_addr(struct net_device *dev, void *p);
+void cxi_eth_set_rx_mode(struct net_device *dev);
+int cxi_change_mtu(struct net_device *netdev, int new_mtu);
+void disable_rx_queue(struct rx_queue *rx);
+void free_rx_queue(struct rx_queue *rx);
+int alloc_rx_queue(struct cxi_eth *dev, unsigned int id);
+void enable_rx_queue(struct rx_queue *rx);
+int post_rx_buffers(struct rx_queue *rx, gfp_t gfp);
+int alloc_tx_queue(struct cxi_eth *dev, unsigned int id);
+void free_tx_queue(struct tx_queue *tx);
+void enable_tx_queue(struct tx_queue *tx);
+void disable_tx_queue(struct tx_queue *tx);
+int cxi_set_rx_channels(struct cxi_eth *dev, unsigned int num_rx_channels);
+int cxi_set_tx_channels(struct cxi_eth *dev, unsigned int num_tx_channels);
+int cxi_eth_hwtstamp_get(struct net_device *ndev,
+			 struct kernel_hwtstamp_config *config);
+int cxi_eth_hwtstamp_set(struct net_device *ndev,
+			 struct kernel_hwtstamp_config *config,
+			 struct netlink_ext_ack *extack);
+
+extern const struct ethtool_ops cxi_eth_ethtool_ops;
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.h b/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.h
new file mode 100644
index 000000000000..03b6e38b2e96
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2018 Hewlett Packard Enterprise Development LP */
+/* cxi-eth debug fs*/
+
+#ifndef __CXI_ETH_DEBUGFS_H__
+#define __CXI_ETH_DEBUGFS_H__
+#include <linux/debugfs.h>
+#include <linux/netdevice.h>
+
+#ifdef CONFIG_DEBUG_FS
+void device_debugfs_create(char *name, struct cxi_eth *dev,
+			   struct dentry *cxieth_debug_dir);
+struct dentry *device_eth_debugfs_init(void);
+
+#else
+static inline void device_debugfs_create(char *name, struct cxi_eth *dev,
+					 struct dentry *cxieth_debug_dir)
+{
+}
+
+static inline struct dentry *device_eth_debugfs_init(void)
+{
+	return NULL;
+}
+#endif
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_ethtool.h b/drivers/net/ethernet/hpe/ss1/cxi_ethtool.h
new file mode 100644
index 000000000000..481c5a5e3741
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_ethtool.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2018-2020,2022,2024,2026 Hewlett Packard Enterprise Development LP */
+
+/* ethtool private flags for the Cassini Ethernet driver */
+#define CXI_ETH_PF_INTERNAL_LOOPBACK         BIT(0)  /* internal loopback, tx to rx */
+#define CXI_ETH_PF_EXTERNAL_LOOPBACK         BIT(1)  /* external loopback, rx to tx */
+#define CXI_ETH_PF_LLR                       BIT(2)
+#define CXI_ETH_PF_PRECODING                 BIT(3)
+#define CXI_ETH_PF_IFG_HPC                   BIT(4)
+#define CXI_ETH_PF_ROCE_OPT                  BIT(5)  /* RoCE Cassini Optimizations */
+#define CXI_ETH_PF_IGNORE_ALIGN              BIT(6)  /* ignore align interrupt */
+#define CXI_ETH_PF_PML_REC                   BIT(7)  /* control pml recovery */
+#define CXI_ETH_PF_LINKTRAIN                 BIT(8)  /* link training */
+#define CXI_ETH_PF_REMOTE_FAULT_RECOVERY     BIT(9)  /* enable pml recovery for remote faults */
+#define CXI_ETH_PF_USE_UNSUPPORTED_CABLE     BIT(10) /* allow link up with unsupported cable */
+#define CXI_ETH_PF_FEC_MONITOR               BIT(11) /* Turn FEC Monitor on/off */
+#define CXI_ETH_PF_ALD                       BIT(12) /* control auto lane degrade */
+#define CXI_ETH_PF_IGNORE_MEDIA_ERROR        BIT(13) /* ignore media error */
+#define CXI_ETH_PF_USE_SUPPORTED_SS200_CABLE BIT(14) /* allow link up with supported ss200 cable */
+#define CXI_ETH_PF_LOS_LOL_HIDE              BIT(15) /* hide LOS/LOL down and link up fail cause */
+#define CXI_ETH_PF_R1_LINK_PARTNER           BIT(16) /* R1 link partner */
+
+#define PRIV_FLAGS_COUNT 17
+
+#define LOOPBACK_MODE (CXI_ETH_PF_INTERNAL_LOOPBACK | CXI_ETH_PF_EXTERNAL_LOOPBACK)
+#define LINK_DEBUG_FLAGS (CXI_ETH_PF_IGNORE_ALIGN | CXI_ETH_PF_REMOTE_FAULT_RECOVERY)
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_ethtool_names.h b/drivers/net/ethernet/hpe/ss1/cxi_ethtool_names.h
new file mode 100644
index 000000000000..fd0b90e90c6a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_ethtool_names.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause */
+/*
+ * Copyright 2024 Hewlett Packard Enterprise Development LP
+ */
+
+#ifndef __CXI_ETHTOOL_NAMES_H
+#define __CXI_ETHTOOL_NAMES_H
+
+/* stats returned via .get_ethtool_stats()  */
+#define CXI_GLOBAL_STATS_LEN    ARRAY_SIZE(cxi_get_ethtool_stats_set)
+/* Telemetry item IDs */
+static const unsigned int cxi_get_ethtool_stats_set[] = {
+	586,	/* hni_rx_ok_ieee */
+	567,	/* hni_rx_bad_ieee */
+	637,	/* hni_tx_ok_ieee */
+	651,	/* hni_tx_poisoned_ieee */
+	590,	/* hni_rx_ok_opt */
+	568,	/* hni_rx_bad_opt */
+	639,	/* hni_tx_ok_opt */
+	652,	/* hni_tx_poisoned_opt */
+	507,	/* hni_pcs_corrected_cw */
+	542,	/* hni_pcs_uncorrected_cw */
+	539,	/* hni_pcs_good_cw */
+	543,	/* hni_pfc_fifo_oflw_cntr_0 */
+	544,	/* hni_pfc_fifo_oflw_cntr_1 */
+	545,	/* hni_pfc_fifo_oflw_cntr_2 */
+	546,	/* hni_pfc_fifo_oflw_cntr_3 */
+	547,	/* hni_pfc_fifo_oflw_cntr_4 */
+	548,	/* hni_pfc_fifo_oflw_cntr_5 */
+	549,	/* hni_pfc_fifo_oflw_cntr_6 */
+	550,	/* hni_pfc_fifo_oflw_cntr_7 */
+	758,	/* ixe_rx_udp_pkt */
+	757,	/* ixe_rx_tcp_pkt */
+	734,	/* ixe_rx_ipv4_pkt */
+	735,	/* ixe_rx_ipv6_pkt */
+	754,	/* ixe_rx_roce_pkt */
+	744,	/* ixe_rx_ptl_gen_pkt */
+	752,	/* ixe_rx_ptl_sml_pkt */
+	753,	/* ixe_rx_ptl_unrestricted_pkt */
+	750,	/* ixe_rx_ptl_smallmsg_pkt */
+	743,	/* ixe_rx_ptl_continuation_pkt */
+	749,	/* ixe_rx_ptl_restricted_pkt */
+	742,	/* ixe_rx_ptl_connmgmt_pkt */
+	748,	/* ixe_rx_ptl_response_pkt */
+	759,	/* ixe_rx_unrecognized_pkt */
+	751,	/* ixe_rx_ptl_sml_amo_pkt */
+	746,	/* ixe_rx_ptl_msgs */
+	747,	/* ixe_rx_ptl_multi_msgs */
+	745,	/* ixe_rx_ptl_mr_msgs */
+	737,	/* ixe_rx_pkt_drop_pct */
+	738,	/* ixe_rx_pkt_drop_rmu_norsp */
+	739,	/* ixe_rx_pkt_drop_rmu_wrsp */
+	736,	/* ixe_rx_pkt_drop_ixe_parser */
+	740,	/* ixe_rx_pkt_ipv4_options */
+	741,	/* ixe_rx_pkt_ipv6_options */
+	733,	/* ixe_rx_eth_seg */
+	755,	/* ixe_rx_roce_seg */
+	756,	/* ixe_rx_roce_spseg */
+};
+
+static const char cxi_get_ethtool_stats_name[CXI_GLOBAL_STATS_LEN][ETH_GSTRING_LEN] = {
+	"rx_ok_ieee",
+	"rx_bad_ieee",
+	"tx_ok_ieee",
+	"tx_poisoned_ieee",
+	"rx_ok_opt",
+	"rx_bad_opt",
+	"tx_ok_opt",
+	"tx_poisoned_opt",
+	"corrected_cw",
+	"uncorrected_cw",
+	"good_cw",
+	"fifo_oflw_cntr_0",
+	"fifo_oflw_cntr_1",
+	"fifo_oflw_cntr_2",
+	"fifo_oflw_cntr_3",
+	"fifo_oflw_cntr_4",
+	"fifo_oflw_cntr_5",
+	"fifo_oflw_cntr_6",
+	"fifo_oflw_cntr_7",
+	"rx_udp_pkt",
+	"rx_tcp_pkt",
+	"rx_ipv4_pkt",
+	"rx_ipv6_pkt",
+	"rx_roce_pkt",
+	"rx_ptl_gen_pkt",
+	"rx_ptl_sml_pkt",
+	"rx_ptl_unrestricted_pkt",
+	"rx_ptl_smallmsg_pkt",
+	"rx_ptl_continuation_pkt",
+	"rx_ptl_restricted_pkt",
+	"rx_ptl_connmgmt_pkt",
+	"rx_ptl_response_pkt",
+	"rx_unrecognized_pkt",
+	"rx_ptl_sml_amo_pkt",
+	"rx_ptl_msgs",
+	"rx_ptl_multi_msgs",
+	"rx_ptl_mr_msgs",
+	"rx_pkt_drop_pct",
+	"rx_pkt_drop_rmu_norsp",
+	"rx_pkt_drop_rmu_wrsp",
+	"rx_pkt_drop_ixe_parser",
+	"rx_pkt_ipv4_options",
+	"rx_pkt_ipv6_options",
+	"rx_eth_seg",
+	"rx_roce_seg",
+	"rx_roce_spseg",
+};
+
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_internal.h b/drivers/net/ethernet/hpe/ss1/cxi_internal.h
new file mode 100644
index 000000000000..5768a26aa804
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_internal.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_INTERNAL_H
+#define _CXI_INTERNAL_H
+
+#include <linux/hpe/cxi/cxi.h>
+
+struct cxi_ct *cxi_ct_alloc_internal(struct cxi_lni *lni,
+				     struct c_ct_writeback *wb, bool is_user,
+				     dma_addr_t wb_dma_addr);
+int cxi_ct_wb_update_internal(struct cxi_ct *ct, struct c_ct_writeback *wb,
+			      dma_addr_t wb_dma_addr);
+
+struct cxi_lni *cxi_lni_alloc_internal(struct cxi_dev *dev, unsigned int svc_id,
+				       bool vf_en, u8 vf_num);
+int cxi_lni_pid_alloc(struct cxi_lni *lni);
+void cxi_lni_pid_free(struct cxi_lni *lni, unsigned int pid);
+
+struct cxi_eq *cxi_eq_alloc_internal(struct cxi_lni *lni, const struct cxi_md *md,
+				     const struct cxi_eq_attr *attr,
+				     void (*event_cb)(void *cb_data),
+				     void *event_cb_data,
+				     void (*status_cb)(void *cb_data),
+				     void *status_cb_data, dma_addr_t dma_addr,
+				     int event_irq_idx, int status_irq_idx);
+int cxi_eq_resize_internal(struct cxi_eq *evtq, void *queue,
+			   size_t queue_len, struct cxi_md *queue_md,
+			   dma_addr_t dma_addr);
+
+struct cxi_cq *cxi_cq_alloc_buf_internal(struct cxi_lni *lni, struct cxi_eq *evtq,
+					 const struct cxi_cq_alloc_opts_buf *opts_b,
+					 int numa_node, dma_addr_t cmds_dma_addr,
+					 size_t cmds_len);
+
+struct cxi_rmu_eth *cxi_rmu_eth_alloc_internal(struct cxi_dev *cdev, bool vf_en,
+					       u8 vf_num);
+
+#endif /* _CXI_INTERNAL_H */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_link.h b/drivers/net/ethernet/hpe/ss1/cxi_link.h
new file mode 100644
index 000000000000..e015248fe7aa
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_link.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2023,2024,2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_LINK_H
+#define _CXI_LINK_H
+
+struct cxi_dev;
+struct cass_dev;
+
+/**
+ * struct cxi_link_info - Attributes for link configuration
+ *
+ * @flags: CXI private flags (CXI_ETH_PF_xxx)
+ * @speed: ethtool speed setting (SPEED_xxx)
+ * @autoneg: ethtool autonegotiation setting (AUTONEG_ENABLE / AUTONEG_DISABLE)
+ * @port_type: ethtool; port type (PORT_FIBRE, PORT_DA, ...)
+ * @fec_type: ethtool; fec (ETHTOOL_FEC_OFF, ETHTOOL_FEC_RS, ...)
+ *
+ * These attributes must be configured for a link.
+ * Different setting will be required for fabric or Ethernet links
+ */
+struct cxi_link_info {
+	u32 flags;		/* or'ed CXI_ETH_PF_xxx */
+	int speed;		/* SPEED_xxx */
+	u32 autoneg;		/* AUTONEG_ENABLE / AUTONEG_DISABLE */
+	u32 port_type;		/* PORT_FIBRE, PORT_DA, ... */
+	u32 fec_type;           /* ETHTOOL_FEC_OFF, ETHTOOL_FEC_RS, ... */
+};
+
+void cxi_link_mode_get(struct cxi_dev *cxi_dev, struct cxi_link_info *link_info);
+void cxi_link_mode_set(struct cxi_dev *cxi_dev, const struct cxi_link_info *link_info);
+void cxi_link_flags_get(struct cxi_dev *cxi_dev, u32 *flags);
+void cxi_link_flags_set(struct cxi_dev *cxi_dev, u32 clr_flags, u32 set_flags);
+u32 cxi_link_flags_supported(struct cxi_dev *cxi_dev);
+void cxi_link_use_unsupported_cable(struct cxi_dev *cxi_dev, bool use);
+void cxi_link_use_supported_ss200_cable(struct cxi_dev *cxi_dev, bool use);
+void cxi_link_ignore_media_error(struct cxi_dev *cxi_dev, bool ignore);
+void cxi_link_auto_lane_degrade(struct cxi_dev *cxi_dev, bool enable);
+void cxi_pml_recovery_set(struct cxi_dev *cxi_dev, bool set);
+void cxi_link_los_lol_hide(struct cxi_dev *cxi_dev, bool enable);
+
+struct cxi_link_ops {
+	int (*init)(struct cass_dev *hw);
+	int (*link_start)(struct cass_dev *hw);
+	int (*link_fini)(struct cass_dev *hw);
+	void (*mode_get)(struct cass_dev *hw, struct cxi_link_info *link_info);
+	void (*mode_set)(struct cass_dev *hw, const struct cxi_link_info *link_info);
+	void (*flags_get)(struct cass_dev *hw, u32 *flags);
+	void (*flags_set)(struct cass_dev *hw, u32 clr_flags, u32 set_flags);
+	u32  flags_supported;	/* CXI_ETH_PF_xxx handled by flags_set */
+	int  (*link_up)(struct cass_dev *hw);
+	int  (*link_down)(struct cass_dev *hw);
+	bool (*is_pcs_aligned)(struct cass_dev *hw);
+	int  (*media_config)(struct cass_dev *hw, void *attr);
+	int  (*media_unconfig)(struct cass_dev *hw);
+	int  (*link_config)(struct cass_dev *hw);
+	int  (*link_reset)(struct cass_dev *hw);
+	void (*link_exit)(struct cass_dev *hw);
+	void (*pml_recovery_set)(struct cass_dev *hw, bool set);
+	bool (*is_link_up)(struct cass_dev *hw);
+	int (*eth_name_set)(struct cass_dev *hw, const char *name);
+};
+
+void cxi_set_link_ops(struct cass_dev *hw);
+#endif
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.h b/drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.h
new file mode 100644
index 000000000000..be97faeae3c3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Cassini QoS Profiles
+ * Copyright 2023 Hewlett Packard Enterprise Development LP
+ */
+
+#define CXI_MAX_RDMA_TCS 4
+#define PCP_COUNT 8U
+#define CXI_ETH_TC_MAX (CXI_ETH_TC2 + 1)
+
+struct cass_tc_oxe_settings {
+	unsigned int spt_rsvd;
+	unsigned int smt_rsvd;
+	unsigned int sct_rsvd;
+	unsigned int srb_rsvd;
+	unsigned int pbuf_rsvd;
+	unsigned int assured_percent;
+	unsigned int ceiling_percent;
+	unsigned int bucket_limit;
+	unsigned int leaf_request_priority;
+	unsigned int leaf_response_priority;
+	unsigned int branch_priority;
+	unsigned int mfs_index;
+};
+
+struct cass_tc_dscp_pcp_settings {
+	/* Required request and response PCP and DSCP for all traffic classes
+	 * and traffic class types.
+	 */
+	unsigned int req_pcp;
+	unsigned int rsp_pcp;
+	unsigned int res_rsp_dscp;
+	unsigned int unres_rsp_dscp;
+
+	/* Restricted request DSCP used for CXI_TC_TYPE_DEFAULT and
+	 * CXI_TC_TYPE_RESTRICTED traffic class types.
+	 */
+	unsigned int res_req_dscp;
+
+	/* Unrestricted request DSCP used for CXI_TC_TYPE_DEFAULT and
+	 * CXI_TC_TYPE_HRP traffic class types.
+	 */
+	unsigned int unres_req_dscp;
+
+	/* Restricted request DSCP used only for CXI_TC_TYPE_HRP traffic class
+	 * type. -1 disables the CXI_TC_TYPE_HRP traffic class type for a given
+	 * traffic class.
+	 */
+	int hrp_res_req_dscp;
+
+	/* Restricted request DSCP used only for CXI_TC_TYPE_COLL_LEAF
+	 * traffic class type. -1 disables the CXI_TC_TYPE COLL_LEAF for a
+	 * given traffic class.
+	 */
+	int coll_leaf_res_req_dscp;
+
+	/* Unrestricted request DSCP used only for CXI_TC_TYPE_RESTRICTED
+	 * traffic class type. -1 disables the CXI_TC_TYPE_RESTRICTED traffic
+	 * class type for a given traffic class.
+	 */
+	int restricted_unres_req_dscp;
+};
+
+struct cass_tc_cq_settings {
+	unsigned int dynamic_fq_count;
+	unsigned int static_fq_count;
+	unsigned int fq_buf_reserved;
+	unsigned int pfq_high_thresh;
+};
+
+struct cass_tc_ixe_settings {
+	unsigned int fq_count;
+};
+
+struct cass_tc_lpe_settings {
+	unsigned int fq_count;
+};
+
+struct cass_tc_pct_settings {
+	unsigned int trs_rsvd;
+	unsigned int mst_rsvd;
+	unsigned int tct_rsvd;
+};
+
+struct cass_tc_hni_settings {
+	unsigned int pbuf_rsvd;
+	unsigned int mfs;
+};
+
+enum cxi_qos_profile {
+	CXI_QOS_HPC = 1, /* Leave 0 as Invalid to catch errors */
+	CXI_QOS_LL_BE_BD_ET,
+	CXI_QOS_LL_BE_BD_ET1_ET2,
+	CXI_QOS_NUM_PROF
+};
+
+struct cass_tc_eth_settings {
+	unsigned int pcp;
+	bool tc_pcps[8]; /* Used only by ETH_SHARED */
+};
+
+struct cxi_tc {
+	enum cxi_traffic_class tc;
+	struct kobject kobj;
+	unsigned int default_ocuset;
+	unsigned int default_cq_tc;
+	unsigned int restricted_ocuset;
+	unsigned int restricted_cq_tc;
+	unsigned int branch;
+	unsigned int leaf[2]; /* assumes always 2 leaves per TC */
+	unsigned int req_bc;
+
+	/* RDMA Only Settings */
+	struct cass_tc_dscp_pcp_settings dscp_pcp_settings;
+	struct cass_tc_ixe_settings ixe_settings;
+	struct cass_tc_lpe_settings lpe_settings;
+	struct cass_tc_pct_settings pct_settings;
+
+	/* Settings for RDMA + "Global" Ethernet */
+	struct cass_tc_oxe_settings oxe_settings;
+	struct cass_tc_cq_settings cq_settings;
+	struct cass_tc_hni_settings hni_settings;
+
+	/* Eth only settings */
+	struct cass_tc_eth_settings eth_settings;
+};
+
+struct qos_profile {
+	struct mutex mutex;
+	bool tcs_active[CXI_ETH_TC_MAX];
+	unsigned int pct_control_pcp;
+	unsigned int pct_control_res_rsp_dscp;
+	unsigned int pct_control_unres_rsp_dscp;
+	unsigned int tc_restricted_oxe_req_bc;
+	unsigned int untagged_eth_pcp;
+	struct cxi_tc tcs[CXI_ETH_TC_MAX];
+};
+
+extern struct qos_profile profiles[];
+int tc_cfg_show(struct seq_file *s, void *unused);
+
+/* Check if a TC is an ethernet TC. Excludes the general CXI_ETH class */
+static inline bool is_eth_tc(unsigned int tc)
+{
+	return (tc > CXI_TC_ETH && tc < CXI_ETH_TC_MAX);
+}
+
+void cxi_qos_calculate_limits(struct qos_profile *qos, bool is_c2);
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rgroup.h b/drivers/net/ethernet/hpe/ss1/cxi_rgroup.h
new file mode 100644
index 000000000000..ae903ad466e6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rgroup.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+/* TODO: are these really part of the uapi? */
+
+#ifndef _CXI_RGROUP_H_
+#define _CXI_RGROUP_H_
+
+#include <linux/xarray.h>
+#include "cass_core.h"
+
+/* Resource Groups contigurables */
+
+#define RGROUP_GFP_OPTS              (GFP_KERNEL)
+#define RGROUP_ID_MIN                (CXI_DEFAULT_SVC_ID)
+#define RGROUP_ID_MAX                (INT_MAX)
+#define RGROUP_ID_LIMITS             (XA_LIMIT(RGROUP_ID_MIN, \
+					       RGROUP_ID_MAX))
+#define RGROUP_XARRAY_FLAGS          (XA_FLAGS_ALLOC1)
+
+/* Resource Entries */
+
+#define RESOURCE_ENTRY_GFP_OPTS      (GFP_KERNEL)
+#define RESOURCE_ENTRY_ID_MIN        (0)
+#define RESOURCE_ENTRY_ID_MAX        (INT_MAX)
+#define RESOURCE_ENTRY_ID_LIMITS     (XA_LIMIT(RESOURCE_ENTRY_ID_MIN, \
+					       RESOURCE_ENTRY_ID_MAX))
+#define RESOURCE_ENTRY_XARRAY_FLAGS  (XA_FLAGS_ALLOC)
+
+struct cxi_rgroup_attr {
+	unsigned int   id;
+	unsigned int   cntr_pool_id;
+	unsigned int   lnis_per_rgid;
+	bool           system_service;
+	char           name[50];
+};
+
+struct cxi_rgroup_state {
+	bool           enabled;
+	refcount_t     refcount;
+};
+
+struct cxi_rgroup {
+	unsigned int                   id;
+	struct cass_dev                *hw;
+	struct cxi_rgroup_attr         attr;
+	struct cxi_rgroup_state        state;
+	struct cxi_resource_entry_list resource_entry_list;
+	struct cxi_ac_entry_list       ac_entry_list;
+	struct cxi_rgroup_pools        pools;
+};
+
+void cxi_dev_rgroup_init(struct cxi_dev *dev);
+void cxi_dev_rgroup_fini(struct cxi_dev *dev);
+
+/**
+ * for_each_rgroup() - Iterate over rgroup_list
+ *
+ * @list: rgroup list
+ * @index: index of @entry
+ * @entry: rgroup retrieved from array
+ *
+ * Return: first non-zero return value of operator or 0
+ */
+#define for_each_rgroup(index, entry) \
+	xa_for_each(&hw->rgroup_list.xarray, index, entry)
+
+#endif /* _CXI_RGROUP_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.h b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.h
new file mode 100644
index 000000000000..250d765b4b67
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2024 Hewlett Packard Enterprise Development LP */
+
+/** Common parts of RX and TX Profiles
+ *
+ * These functions should only be used to implement RX and TX profile
+ * functions.
+ */
+
+#ifndef _CXI_RXTX_PROFILE_H_
+#define _CXI_RXTX_PROFILE_H_
+
+#define DEF_RMU_INDEX (-1)
+
+void cxi_rxtx_profile_init(struct cxi_rxtx_profile *rxtx_profile,
+			   struct cass_dev *hw,
+			   const struct cxi_rxtx_vni_attr *vni_attr);
+
+void cxi_rxtx_profile_destroy(struct cxi_rxtx_profile *rxtx_profile);
+
+int cxi_rxtx_profile_find_inc_refcount(struct cxi_rxtx_profile_list *list,
+				       unsigned int profile_id,
+				       struct cxi_rxtx_profile **rxtx_profile);
+
+int cxi_rxtx_profile_test_insert(struct cxi_rxtx_profile_list *list,
+				 struct cxi_rxtx_profile *rxtx_profile,
+				 unsigned int *id,
+				 int (*test_func)(const struct cxi_rxtx_profile *p1,
+						  const struct cxi_rxtx_profile *p2));
+
+void cxi_rxtx_profile_release(struct cxi_rxtx_profile *rxtx_profile);
+void cxi_rxtx_profile_revoke(struct cxi_rxtx_profile *rxtx_profile);
+
+void cxi_rxtx_profile_get_info(struct cxi_rxtx_profile *rxtx_profile,
+			       struct cxi_rxtx_vni_attr *vni_attr,
+			       struct cxi_rxtx_profile_state *state);
+
+int cxi_rxtx_profile_add_ac_entry(struct cxi_rxtx_profile *rxtx_profile,
+				  enum cxi_ac_type ac_type,
+				  union cxi_ac_data *ac_data,
+				  unsigned int *ac_entry_id);
+
+int cxi_rxtx_profile_remove_ac_entry(struct cxi_rxtx_profile *rxtx_profile,
+				     unsigned int ac_entry_id);
+
+int cxi_rxtx_profile_get_ac_entry_ids(struct cxi_rxtx_profile *rxtx_profile,
+				      size_t max_ids,
+				      unsigned int *ac_entry_ids,
+				      size_t *num_ids);
+
+int cxi_rxtx_profile_get_ac_entry_data(struct cxi_rxtx_profile *rxtx_profile,
+				       unsigned int ac_entry_id,
+				       enum cxi_ac_type *ac_type,
+				       union cxi_ac_data *ac_data);
+
+int cxi_rxtx_profile_get_ac_entry_id_by_data(struct cxi_rxtx_profile *rxtx_profile,
+					     enum cxi_ac_type ac_type,
+					     const union cxi_ac_data *ac_data,
+					     unsigned int *ac_entry_id);
+
+int cxi_rxtx_profile_get_ac_entry_id_by_user(struct cxi_rxtx_profile *rxtx_profile,
+					     uid_t uid,
+					     gid_t gid,
+					     unsigned int netns,
+					     cxi_ac_typeset_t desired_types,
+					     unsigned int *ac_entry_id);
+
+void cxi_tx_profile_list_destroy(struct cass_dev *cdev);
+
+int vni_overlap_test(struct cxi_rxtx_profile *profile1,
+		     void *user_arg);
+bool unique_vni_space(struct cass_dev *hw,
+		      struct cxi_rxtx_profile_list *list,
+		      const struct cxi_rxtx_vni_attr *attr);
+
+__maybe_unused
+static struct cxi_rx_profile *co_rx_profile(struct cxi_rxtx_profile *profile)
+{
+	return container_of(profile, struct cxi_rx_profile, profile_common);
+}
+
+__maybe_unused
+static struct cxi_tx_profile *co_tx_profile(struct cxi_rxtx_profile *profile)
+{
+	return container_of(profile, struct cxi_tx_profile, profile_common);
+}
+
+/**
+ * vni_well_formed() - determine if any of the match bits
+ *                     are also in the ignore mask.
+ *
+ * @attr: pointer to the VNI attributes
+ *
+ * Return: whether we consider this set of attributes good.
+ */
+static inline bool vni_well_formed(const struct cxi_rxtx_vni_attr *attr)
+{
+	return !(attr->match & attr->ignore);
+}
+
+/**
+ * zero_vni() - Check for the zero vni which is invalid
+ *              Used for allocating an rx profile with unknown attributes
+ *              which will be updated later.
+ *
+ * @attr: pointer to the VNI attributes
+ *
+ * Return: The match value is the default (invalid) value of 0.
+ */
+static inline bool zero_vni(const struct cxi_rxtx_vni_attr *attr)
+{
+	return !attr->match;
+}
+
+/**
+ * vni_overlap() - determine if 2 vni specifications share
+ *                 any VNI space.
+ *
+ * @attr1: pointer to a VNI attribute
+ * @attr2: pointer to second VNI attribute
+ *
+ * Return: true if any VNI satisfies both specifications.
+ */
+static inline bool vni_overlap(const struct cxi_rxtx_vni_attr *attr1,
+			       const struct cxi_rxtx_vni_attr *attr2)
+{
+	u16 ignore = attr1->ignore | attr2->ignore;
+
+	if ((attr1->match & ~ignore) != (attr2->match & ~ignore))
+		return false;
+
+	return true;
+}
+
+#endif /* _CXI_RXTX_PROFILE_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.h b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.h
new file mode 100644
index 000000000000..45faf343b283
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2023 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_RXTX_PROFILE_LIST_H_
+#define _CXI_RXTX_PROFILE_LIST_H_
+
+#include <linux/xarray.h>
+
+#define RX_PROFILE_ID_MIN        (1)
+#define RX_PROFILE_ID_MAX        (UINT_MAX)
+#define RX_PROFILE_XARRAY_FLAGS  (XA_FLAGS_ALLOC1)
+#define RX_PROFILE_GFP_OPTS      (GFP_KERNEL)
+
+#define TX_PROFILE_ID_MIN        (1)
+#define TX_PROFILE_ID_MAX        (UINT_MAX)
+#define TX_PROFILE_XARRAY_FLAGS  (XA_FLAGS_ALLOC1)
+#define TX_PROFILE_GFP_OPTS      (GFP_KERNEL)
+
+struct cxi_rxtx_profile;
+
+void cxi_rxtx_profile_list_init(struct cxi_rxtx_profile_list *list,
+				struct xa_limit *limits,
+				gfp_t flags,
+				gfp_t gfp_opts);
+
+void cxi_rxtx_profile_list_destroy(struct cxi_rxtx_profile_list *list,
+				   void (*cleanup)(struct cxi_rxtx_profile *rxtx_profile,
+						   void *user_args),
+				   void *user_args);
+
+void cxi_rxtx_profile_list_lock(struct cxi_rxtx_profile_list *list);
+void cxi_rxtx_profile_list_unlock(struct cxi_rxtx_profile_list *list);
+
+int cxi_rxtx_profile_list_iterate(struct cxi_rxtx_profile_list *list,
+				  int (*operator)(struct cxi_rxtx_profile *rxtx_profile,
+						void *user_arg),
+				void *user_arg);
+
+int cxi_rxtx_profile_list_insert(struct cxi_rxtx_profile_list *list,
+				 struct cxi_rxtx_profile *rxtx_profile,
+				 unsigned int *rxtx_profile_id);
+int cxi_rxtx_profile_list_remove(struct cxi_rxtx_profile_list *list,
+				 unsigned int rxtx_profile_id);
+int cxi_rxtx_profile_list_retrieve(struct cxi_rxtx_profile_list *list,
+				   unsigned int id,
+				   struct cxi_rxtx_profile **rxtx_profile);
+
+int cxi_rxtx_profile_list_get_ids(struct cxi_rxtx_profile_list *list,
+				  size_t max_ids,
+				  unsigned int *ids,
+				  size_t *num_ids);
+
+#endif /* _CXI_RXTX_PROFILE_LIST_H_ */
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_vf_cmd.h b/drivers/net/ethernet/hpe/ss1/cxi_vf_cmd.h
new file mode 100644
index 000000000000..cc82e2b1a40a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_vf_cmd.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _CXI_VF_CMD_H
+#define _CXI_VF_CMD_H
+
+#include <linux/hpe/cxi/cxi.h>
+
+struct cxi_lni_alloc_resp_vf {
+	struct cxi_lni_alloc_resp base;
+	unsigned int rgid;
+};
+
+struct cxi_svc_list_get_resp_vf {
+	struct cxi_svc_list_get_resp base;
+	struct cxi_svc_desc svc_list[];
+};
+
+struct cxi_svc_rsrc_list_get_resp_vf {
+	struct cxi_svc_rsrc_list_get_resp base;
+	struct cxi_rsrc_use rsrc_list[];
+};
+
+struct cxi_ct_alloc_cmd_vf {
+	struct cxi_ct_alloc_cmd base;
+	u64 wb_dma_addr;
+};
+
+struct cxi_ct_wb_update_cmd_vf {
+	struct cxi_ct_wb_update_cmd base;
+	u64 wb_dma_addr;
+};
+
+struct cxi_cq_alloc_buf_cmd_vf {
+	struct cxi_cq_alloc_buf_cmd base;
+	u64 dma_addr;
+	size_t cmds_len;
+};
+
+struct cxi_eq_alloc_cmd_vf {
+	struct cxi_eq_alloc_cmd base;
+	u64 dma_addr;
+	int event_irq_idx;
+	int status_irq_idx;
+};
+
+struct cxi_eq_resize_cmd_vf {
+	struct cxi_eq_resize_cmd base;
+	u64 dma_addr;
+};
+
+#endif /* _CXI_VF_CMD_H */
diff --git a/drivers/net/ethernet/hpe/ss1/pldm_cxi.h b/drivers/net/ethernet/hpe/ss1/pldm_cxi.h
new file mode 100644
index 000000000000..794c59ebcf98
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/pldm_cxi.h
@@ -0,0 +1,374 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright 2021 Hewlett Packard Enterprise Development LP */
+
+/* This file contains Platform Level Data Model (PLDM) definitions
+ * necessary to read numeric sensors and parse FRU record data from
+ * the Cassini uC PLDM subsystem.
+ *
+ * More information can be found in the following DMTF documents
+ * (https://www.dmtf.org):
+ * DSP0240 v1.0.0: PLDM Base Specification
+ * DSP0245 v1.3.0: PLDM IDs and Codes Specification
+ * DSP0248 v1.2.0: PLDM for Platform Monitoring and Control Specification
+ * DSP0257 v1.0.0: PLDM for FRU Data Specification
+ */
+
+#ifndef PLDM_CXI_H
+#define PLDM_CXI_H
+
+#define C_MASK(XVAL, XBIT) XVAL##_MASK = (1 << XBIT)
+#define C_ENUM(XNAME, XVAL) XNAME = XVAL
+
+#define PLDM_THRESHOLD_LIST \
+    C(PLDM_THRESHOLD_UPPER_WARNING, 0), \
+    C(PLDM_THRESHOLD_UPPER_CRITICAL, 1), \
+    C(PLDM_THRESHOLD_UPPER_FATAL, 2), \
+    C(PLDM_THRESHOLD_LOWER_WARNING, 3), \
+    C(PLDM_THRESHOLD_LOWER_CRITICAL, 4), \
+    C(PLDM_THRESHOLD_LOWER_FATAL, 5)
+
+#define C C_ENUM
+enum pldm_threshold {
+    PLDM_THRESHOLD_LIST,
+    PLDM_THRESHOLD_COUNT
+};
+
+#undef C
+
+#define C C_MASK
+enum {
+    PLDM_THRESHOLD_LIST
+};
+
+#undef C
+
+/* Generic PLDM Message Fields (DSP0240 Figure 1) */
+struct pldm_hdr {
+	u8 instance_id:5;
+	u8 rsvd:1;
+	u8 d:1;
+	u8 rq:1;
+
+	u8 pldm_type:6;
+	u8 hdr_ver:2;
+
+	u8 pldm_command_code;
+	u8 payload[0];
+} __packed;
+
+/* PLDM Type Codes (DSP0245 Table 1) */
+enum pldm_type_code {
+	PLDM_TYPE_MESSAGING_CONTROL_AND_DISCOVERY = 0,
+	PLDM_TYPE_SMBIOS,
+	PLDM_TYPE_PLATFORM_MONITORING_AND_CONTROL,
+	PLDM_TYPE_BIOS_CONTROL_AND_CONFIGURATION,
+	PLDM_TYPE_FRU_DATA,
+	PLDM_TYPE_FIRMWARE_UPDATE,
+	PLDM_TYPE_REDFISH_DEVICE,
+	PLDM_TYPE_OEM = 0x3F,
+	PLDM_TYPE_COUNT
+};
+
+/* Generic PLDM Completion Codes (DSP0240 Table 4) */
+enum pldm_completion_code {
+	PLDM_SUCCESS = 0,
+	PLDM_ERROR = 1,
+	PLDM_ERROR_INVALID_DATA = 2,
+	PLDM_ERROR_INVALID_LENGTH = 3,
+	PLDM_ERROR_NOT_READY = 4,
+	PLDM_ERROR_UNSUPPORTED_CMD = 5,
+	PLDM_ERROR_INVALID_PLDM_TYPE = 6,
+	PLDM_ERROR_COMMAND_SPECIFIC_START = 0x80,
+	PLDM_ERROR_COMMAND_SPECIFIC_END = 0xFF
+};
+
+/* PLDM Command Numbers (DSP0248 Table 107) */
+enum pldm_platform_cmd {
+	PLDM_CMD_GET_SENSOR_READING = 0x11,
+	PLDM_CMD_GET_PDR = 0x51
+};
+
+enum pldm_sensor_opstate {
+    PLDM_OPSTATE_ENABLED = 0,
+    PLDM_OPSTATE_DISABLED = 1,
+    PLDM_OPSTATE_UNAVAILABLE = 2,
+    PLDM_OPSTATE_STATUS_UNKNOWN = 3,
+    PLDM_OPSTATE_FAILED = 4,
+    PLDM_OPSTATE_INITIALIZING = 5,
+    PLDM_OPSTATE_SHUTTING_DOWN = 6,
+    PLDM_OPSTATE_IN_TEST = 7
+};
+
+/* PLDM Sensor Units (Table 62 of DSP0248) */
+enum sensor_unit {
+    PLDM_UNIT_NONE = 0,
+    PLDM_UNIT_DEGREES_C = 2,
+    PLDM_UNIT_VOLTS = 5,
+    PLDM_UNIT_AMPS = 6,
+    PLDM_UNIT_WATTS = 7,
+};
+
+enum unit_modifier {
+    PLDM_MODIFIER_NANO = -9,
+    PLDM_MODIFIER_MICRO = -6,
+    PLDM_MODIFIER_MILLI = -3,
+    PLDM_MODIFIER_CENTI = -2,
+    PLDM_MODIFIER_DECI = -1,
+    PLDM_MODIFIER_NONE = 0,
+    PLDM_MODIFIER_KILO = 3,
+};
+
+/* GetSensorReading presentReading variable types (DSP0248 Table 30) */
+union sensor_value {
+	s8 value_SINT8;
+	u8 value_UINT8;
+	s16 value_SINT16;
+	u16 value_UINT16;
+	s32 value_SINT32;
+	u32 value_UINT32;
+};
+
+/* GetSensorReading Command Request Format (DSP0248 Table 30) */
+struct get_sensor_reading_req {
+	struct pldm_hdr hdr;
+	u16 sensor_id;
+	u8 rearm_event_status;
+} __packed;
+
+/* GetSensorReading Command Response Format (DSP0248 Table 30) */
+struct get_sensor_reading_rsp {
+	struct pldm_hdr hdr;
+	u8 completion_code;
+	u8 sensor_data_size;
+	u8 sensor_operational_state;
+	u8 sensor_event_message_enable;
+	u8 present_state;
+	u8 previous_state;
+	u8 event_state;
+	union sensor_value present_reading;
+} __packed;
+
+/* GetPDR Command Request Format (DSP0248 Table 68) */
+struct get_pdr_req {
+	struct pldm_hdr hdr;
+	u32 record_handle;
+	u32 data_transfer_handle;
+	u8 transfer_operation_flag;
+	u16 request_count;
+	u16 record_change_number;
+} __packed;
+
+/* GetPDR Command Response Format (DSP0248 Table 68) */
+struct get_pdr_rsp {
+	struct pldm_hdr hdr;
+	u8 completion_code;
+	u32 next_record_handle;
+	u32 next_data_transfer_handle;
+	u8 transfer_flag;
+	u16 response_count;
+	u8 record_data[];
+} __packed;
+
+/* GetPDR transferOperationFlag values (DSP0248 Table 68) */
+enum pldm_transfer_op {
+	PLDM_XFER_OP_GET_NEXT_PART = 0,
+	PLDM_XFER_OP_GET_FIRST_PART = 1
+};
+
+/* Common PDR Header Format (DSP0248 Table 75) */
+struct pdr_hdr {
+	u32 record_handle;
+	u8 pdr_header_version;
+	u8 pdr_type;
+	u16 record_change_number;
+	u16 data_length;
+	u8 data[0];
+} __packed;
+
+/* PDR Type Values (DSP0248 Table 76) */
+enum pdr_type {
+	PLDM_PDR_TERMINUS_LOCATOR = 1,
+	PLDM_PDR_NUMERIC_SENSOR = 2,
+	PLDM_PDR_STATE_SENSOR = 4,
+	PLDM_PDR_SENSOR_AUXILIARY_NAMES = 6,
+	PLDM_PDR_STATE_EFFECTER = 11,
+	PLDM_PDR_EFFECTER_AUXILIARY_NAMES = 13,
+	PLDM_PDR_ENTITY_ASSOCIATION = 15,
+	PLDM_PDR_ENTITY_AUXILIARY_NAMES = 16,
+	PLDM_PDR_FRU_RECORD_SET = 20,
+	PLDM_PDR_OEM = 127
+};
+
+/* Numeric Sensor PDR sensorDataSize values (DSP0248 Table 78) */
+enum pldm_data_size {
+	PLDM_DATA_SIZE_UINT8,
+	PLDM_DATA_SIZE_SINT8,
+	PLDM_DATA_SIZE_UINT16,
+	PLDM_DATA_SIZE_SINT16,
+	PLDM_DATA_SIZE_UINT32,
+	PLDM_DATA_SIZE_SINT32,
+};
+
+/* The Numeric Sensor PDR has variably sized fields depending on the size of the sensor reading.
+ * To keep the structure packing as simple as possible, unions are used for everything downstream
+ * of the first variably sized field. These sensor size dependent structs are only defined for a
+ * given size (not signedness). They include all Numeric Sensor PDR fields from 'hysteresis' to
+ * 'fatal_low' (DSP0248 Table 78)
+ */
+struct numeric_sensor_ssd8 {
+	u8 hysteresis;
+	u8 supported_thresholds;
+	u8 threshold_and_hysteresis_volatility;
+	float state_transition_interval;
+	float update_interval;
+	u8 max_readable;
+	u8 min_readable;
+	u8 range_field_format;
+	u8 range_field_support;
+	u8 nominal_value;
+	u8 normal_max;
+	u8 normal_min;
+	u8 warning_high;
+	u8 warning_low;
+	u8 critical_high;
+	u8 critical_low;
+	u8 fatal_high;
+	u8 fatal_low;
+} __packed;
+
+struct numeric_sensor_ssd16 {
+	u16 hysteresis;
+	u8 supported_thresholds;
+	u8 threshold_and_hysteresis_volatility;
+	float state_transition_interval;
+	float update_interval;
+	u16 max_readable;
+	u16 min_readable;
+	u8 range_field_format;
+	u8 range_field_support;
+	u16 nominal_value;
+	u16 normal_max;
+	u16 normal_min;
+	u16 warning_high;
+	u16 warning_low;
+	u16 critical_high;
+	u16 critical_low;
+	u16 fatal_high;
+	u16 fatal_low;
+} __packed;
+
+struct numeric_sensor_ssd32 {
+	u32 hysteresis;
+	u8 supported_thresholds;
+	u8 threshold_and_hysteresis_volatility;
+	float state_transition_interval;
+	float update_interval;
+	u32 max_readable;
+	u32 min_readable;
+	u8 range_field_format;
+	u8 range_field_support;
+	u32 nominal_value;
+	u32 normal_max;
+	u32 normal_min;
+	u32 warning_high;
+	u32 warning_low;
+	u32 critical_high;
+	u32 critical_low;
+	u32 fatal_high;
+	u32 fatal_low;
+} __packed;
+
+/* Numeric Sensor PDR Format (DSP0248 Table 78) */
+struct numeric_sensor_pdr {
+	struct pdr_hdr hdr;
+	u16 pldm_terminus_handle;
+	u16 sensor_id;
+	union {
+		struct {
+			u16 entity_type_entity_id :15;
+			u16 entity_type_logical   :1;
+		};
+		u16 entity_type;
+	};
+	u16 entity_instance_number;
+	u16 container_id;
+	u8 sensor_init;
+	u8 sensor_auxiliary_names_pdr;
+	u8 base_unit;
+	s8 unit_modifier;
+	u8 rate_unit;
+	u8 base_oem_unit_handle;
+	u8 aux_unit;
+	s8 aux_unit_modifier;
+	u8 aux_rate_unit;
+	u8 rel;
+	u8 aux_oem_unit_handle;
+	u8 is_linear;
+	u8 sensor_data_size;
+	float resolution;
+	float offset;
+	u16 accuracy;
+	u8 plus_tolerance;
+	u8 minus_tolerance;
+	union {
+		struct numeric_sensor_ssd8 ssd8;
+		struct numeric_sensor_ssd16 ssd16;
+		struct numeric_sensor_ssd32 ssd32;
+	} ssd;
+} __packed;
+
+#define AUX_NAME_MAX  33
+
+/* Sensor Auxiliary Names PDR Format (DSP0248 Table 83) */
+struct aux_name_pdr {
+	struct pdr_hdr hdr;
+	u16 pldm_terminus_handle;
+	u16 sensor_id;
+	u8 sensor_count;
+	u8 name_string_count;           /* Currently hard-coded to a single name */
+	u8 name_language_tag[3];        /* Currently hard-coded to "en" only */
+	u16 sensor_name[AUX_NAME_MAX];
+} __packed;
+
+/* PLDM FRU Field TLV (DSP0257 Table 2) */
+struct pldm_fru_field {
+	u8 field_type;
+	u8 length;
+	u8 value[];
+} __packed;
+
+/* PLDM FRU Record Data Format (DSP0257 Table 2) */
+struct pldm_fru_record {
+	u16 record_set_id;
+	u8 record_type;
+	u8 num_fields;
+	u8 field_encoding;
+	u8 field_data[];
+} __packed;
+
+/* FRU Record Types (DSP0257 Table 4) */
+enum pldm_fru_record_type {
+	PLDM_FRU_RECORD_GENERAL = 1,
+	PLDM_FRU_RECORD_OEM = 254
+};
+
+/* General FRU Record Field Types (DSP0257 Table 5) */
+enum pldm_fru_field_type {
+	PLDM_FRU_FIELD_CHASSIS_TYPE = 1,
+	PLDM_FRU_FIELD_MODEL = 2,
+	PLDM_FRU_FIELD_PART_NUMBER = 3,
+	PLDM_FRU_FIELD_SERIAL_NUMBER = 4,
+	PLDM_FRU_FIELD_MANUFACTURER = 5,
+	PLDM_FRU_FIELD_MANUFACTURE_DATE = 6,
+	PLDM_FRU_FIELD_VENDOR = 7,
+	PLDM_FRU_FIELD_NAME = 8,
+	PLDM_FRU_FIELD_SKU = 9,
+	PLDM_FRU_FIELD_VERSION = 10,
+	PLDM_FRU_FIELD_ASSET_TAG = 11,
+	PLDM_FRU_FIELD_DESCRIPTION = 12,
+	PLDM_FRU_FIELD_ENGINEERING_CHANGE_LEVEL = 13,
+	PLDM_FRU_FIELD_OTHER = 14,
+	PLDM_FRU_FIELD_VENDOR_IANA = 15
+};
+
+#endif /* PLDM_CXI_H */

-- 
2.56.0

