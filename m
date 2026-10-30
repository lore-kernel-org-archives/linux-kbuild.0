Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394049;
	b=jqpqa0Zn7KWcQcl9WMpI37GIFGUYqDOqM9xq5nag039yJTqBLGz1dY6TN5oywslXl2kT
	 Tw2pA5I9XpuLnFhsp3HesHkvlgkjnusvj9pEsrdFv+dY9MHKUJECdgbFqdA11v5doKMHu
	 jZTunUDJW199iuFiECwFrQdVOkK4KIw0aKDfgbaslydzQu/C4UeAIWrHfKReOXDahzAx0
	 xWgJ1Cy9G91CsgDDu20LvlPbTu9qNnPoJcdUik264YFgkZCwrGz3EBMQk7z17zJbTog1f
	 h+CfCt1i8plBdcRrKFTCPtYwTtYFEUN+Z0PpASoZ3uGQrHdSQIveEyrmOksGYVIHDjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394049;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZNwww+rrbVlRLzjXkpkFtW+gYK6xLQIkg0SZltlW7Ak=;
	b=0gGf4pWF6h2W3dolpzkSC/TA7NwULG8wBnAZoYwZ7kp+ItPZqXD6BNlrU42ZzXooATmL
	 l7bTLRIJDqePERfKAqP06uyU+zadDzr4GsojDz3WvgRomVgWg7FWGo451PIS7dTU+Mj4d
	 NIP0Qt5DopEVSlkdVK0fe8epeMFRxof4Sc7mG2rZwAaD9VNG68SX1VCI9b8j+4Qb6ENNU
	 Bmxk0BAzKaAxWR/RXsnTGDMjiOvhj/4whIb9QJFtvWIZI1F3nzzTOfKcP6Hdy3AdzdOga
	 oyuY5zcp3+4yjPAOzknYRfNT+nnE9O/NRSqxso+bLf/K1wjlmjDA5n5qTEvcQfIUgDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=hbgV52Ya;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC799606A32A;
	Fri, 30 Oct 2026 21:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC799606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=hbgV52Ya
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvXfl362941;
	Fri, 30 Oct 2026 21:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=ZN
	www+rrbVlRLzjXkpkFtW+gYK6xLQIkg0SZltlW7Ak=; b=hbgV52Ya/G51BFk2ue
	1KJewl82WYvQGBupp7eWpCR0UHEgt3DHVzlxKSSnUZs3oC4+SAZBF9MeQeE7ASRz
	oCgtD3Ce6ZvN78rzXk9K4jpqmR9QgqGMcLc7DFKa9gy5voqyj/vag8K0oEDxLbC8
	VweBlp+93QAszNce/BQse1oxuwhpo90aPIv0XbxulGAE6MGPa+RTmJ+4JDH3pOSA
	qcUxq52B0JJZ4RtOf4RH1CCCUnP+yPYPMWtoT1qdY2gRUUGcX1fGf6h7Bw2996SJ
	BDbVGxFSzffKz+GLPWzJEDMJ0pvVu4JKyY2lr4NvEjCn6aoB5VpWuUSwF8B4g6nC
	SL6g==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmx6fbm3e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:19 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id AF52E147BE;
	Fri, 30 Oct 2026 21:00:18 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:18 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:17 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:17 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:00:17 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3B8rsOcnSVAewdCJQCRHzh3CAKUnPuRz2lGpctyz9C32MQBNxgl7TWiwAFefgbVWM8jipruEnIn+xXOTrTfHADCQNT9IUEz0H19XLAOi05kJ9wpUgY5akIu2vbC707WpUZWWRGjbZ8lz22WFTk2hmCXn5MHtS08QoJdyM/IWlGgByhCPEvTuZAqHAF3HM92ePMn5n+xt1ek+3p6apAFt3tsEiwI6Z8/PIvVsXr6U1m8n5uuma1NTRi3n9Lt9w2BwLzTAeq1/xOon2co2RQChwkUo7eoVlXgMu7RALuHndKxuMnyo5P/rEW73BYR2VX4xJ0pqBuwcGZCGTW7IFlzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNwww+rrbVlRLzjXkpkFtW+gYK6xLQIkg0SZltlW7Ak=;
 b=X3JrqWB1d2Vq4ShskkjgiwikBlJ0qM4VT3ebuDOS79RojS5Nh2iao+271EYgKzCeo+EpO9Uwi5rFa6wY8TZv55ODca3aJpAs3dKKWGoURP5e16vm2pmJRLWhnsjAmvZnkvn5msgnsnmkOklfYL78e6ssSX0buP5X07j9TNGe+/wtM6B7Ks56E1n0LPjJHksjfJTqihvASr7Ss7ozEXH6Ti+QUvk354hchPMfKSk9O0Crsp0RJXeul9r1pyAwsE8Air7hDps4aH5B6IxPdAfwAg0XufOU//5uOj0Y0uktMxu4RewFcBpP8VurPP0hbtCHbVBd3Pe6d5V6Cjss6WqG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:14 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:14 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:03 -0700
Subject: [PATCH 07/23] net: hpe: sbl: add the SBM serial bus layer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-7-8c2c391cc283@hpe.com>
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
        <linux-kbuild@vger.kernel.org>, Doug Ledford <doug.ledford@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: CH2PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:610:59::12) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 9b2054da-49fe-498a-e7ef-08df36c8cb2e
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: qck3sbWtuSLnz51WGFv0FzEWYE2n8TnoCYlYnn1PNsiClXuz4fqKGqvLP2DCkgItNfATkoLtVR/SEQkHtvbN5HZsHPyZHVHA1zTFuzuG1ceOMQWEIfmVyuENNwii0Y1uGYk7kGJs6C/F5F0Azf3aNkskiDcv4hbhbjs/MHH/7tCBLz6A70jiaL8NlZg8bjzHga7LcoeO/QVRJNNyB3VkWeBtKFYYjpvqd3X7np+zPgioz+PHIgT3as35OCLSLvK4TSRixQK5xU94v9uAmtJcIymsITZ7HjG3K6aksbUC+2fqeEP/c91VqKXDI9sVqD7qKogPxyKviKFZZU18RJvHRcnelYBtrx0VmYqaqi7RltBBffwTdsc7V3YrkAgIWmS3dSxi48tGfO8t+XYYYmy2ytJJ0Q9kCXXzDMpzshxaU0gw3XK9fVyC8rKyI5b+mIi4j7lIjevfUwikPoISiBgklgSBWMehM2Q6HOlPsxXM9LjBszR8L9dVOd2OiyUIIQXyWn5T2/agMaX4Bnxw56+/0tffzbmQyoQvMutQApl5Zg8ahgejc+GTC/WX9RFOd53Rm7zyQMpIvPeb1TuUH05lXhEKPNikOQmkKkZ28R8TPH9+82mqABgPXmQElPEpVQg3xUAWjHciSmcxsyn7VrWJBtoCV2hQol4V96btUBzugi04yiCsNvBy+BFGttYX0hnc8ywx1sThudqn4xlKlFtOUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGVyKzlVVWVSSFBWbjB0LzR2cDYzMHRpS241VS92VjJsYUZpQ0k0a0ZxWXoz?=
 =?utf-8?B?UGR3UWZzMmE0aXYxdGZNb1FybGR0M0szNmJkK0lQOWY3SHk4NU1ZQnNZSTlp?=
 =?utf-8?B?eG9zbnNiVFdTK3NnMnlJM1lsM3NrNjRpRCs0YlAxSTVBRldRSDlZeVljZ1dW?=
 =?utf-8?B?KysyQlp1MitEQTdIaCtKY2xqRGJSVDNwcFBHTTBlMnJ6NXM4UjVMazcrZUN3?=
 =?utf-8?B?L1dHYkhLdVUwZXpIS0swN09oR1lVK1F4cGtlbjlLTTFGaXlPVnRtZzQzUHlk?=
 =?utf-8?B?OUlSaFNYTlE0aTVTdHJVVHNpa0MrMUdEdzk3eWZPdjlqeVp4eWVUc3o5ZmUr?=
 =?utf-8?B?d0Uvb1dBZ0NpejdYcUVQUE1VbHJMVnhvSzc1bXBuK29obGJEYnByd29kWnpv?=
 =?utf-8?B?MWNDQ0NQc3VRRkdvQy9oZXRqYWdsbWNwOWtUdlcyRVpDY01ES3BycEhVOW1U?=
 =?utf-8?B?aG9QU05MdkFmdUN2ZzZWTUczRlF6WHp2cWZCVzJGcnZqMnB2SE1vVysrS0pH?=
 =?utf-8?B?Nk9lL2wyZm12V1paWHcvTGJTT0dDZndna3p6cVhxbjlPRVdJbTIyZy8zd00z?=
 =?utf-8?B?dEdsTzY1bEVxeHQrR3JreWVpNWZVeW01L0g5MVgyUzg1WUxhbHVRN2s4dnRh?=
 =?utf-8?B?Q0lsQ1RmeXdva3ZaODN4R2Qwc0hvZUNidVErMXdNeGIxMFVZcDd1RXl6d2Vi?=
 =?utf-8?B?VmpUeTVsUGc4cXlrY01xVCtrM2JCbVI2TUdORDRrV0k4UHBTNWtHWFVTN2tR?=
 =?utf-8?B?S01OSGM5UGFBbWNzN2E2RGxsbkNMQmxBaW96NnFyTFlPdXJOTUt6QUg1bERi?=
 =?utf-8?B?Tm1TTzd2MlNVM3JLcSt3QW83czYvQ2psYXRwQm1qbUEveCt0R3BFY0graWFo?=
 =?utf-8?B?bUhNMEdKWHFxdmdYV1IrYU1HTmFFSzN2QWdRb3J1WEZqNFN4K2ZBUGhIN3U2?=
 =?utf-8?B?bzR6WXB6NEg5YTYreUl0MEk4YnlYaEw5QWVjRVNBMGswbGp4Wk5EQWlmVmRh?=
 =?utf-8?B?bTMyWm5ZaEROQThheURkZ0JtSUYxY3NSbS94TENkQlVSLy9XTGtQYTZIY2VT?=
 =?utf-8?B?UmlzaUJHMVFSRnJKSE9kUUdZSEluVGpoZHIyak1ZZTE3THNRaTVla2t0K3Jp?=
 =?utf-8?B?Z0RLQ3NQa2JwcElMMVlBR0Z6Z0ZwV0NSTXIzR2tMQWRxazRudmdmOEhsZmts?=
 =?utf-8?B?NjV1d3NsekY3YmxzaU5uMStOaWxUQzdzYTBsR0xDWGthdVR2SnU3RGR1dExR?=
 =?utf-8?B?am1qTzR5LzlqYk1XWG1IS2ZOd1ZnY2s4UDUzU2xRRUIxZ2hhNGJyQngyZlR0?=
 =?utf-8?B?dWpYUnV4VmZjWVM3MGh6dFlTcXpnTVdSVHBPbnpXeEp5Qk9jdUxiTDhMUGgy?=
 =?utf-8?B?eUNDVDFqNXd1RC9DbFZ1Z1RhbHRnUHRrKzJBN1RpOHJidklOam1MRkhDM0Rz?=
 =?utf-8?B?dTc2amE3UWI1b2QrdDRnM21FTGVQQUp0eU9CbnA2VWE2a2JUVmFiMjhaVHBl?=
 =?utf-8?B?RUE2YlYvNHFjbzhTUFZtK2RFTStzS04wWmVhb0JxRlVlclBldVNjellwd3Zz?=
 =?utf-8?B?dXF2T2VEWVg4MHFieVdMbmNzd2tER0NPVlpKdFJ1SnJCcEJaMURZWkluRWNF?=
 =?utf-8?B?Nk9MbUc2eUd0ajlrSTJWeDY0VzI2V0pFc1QraHRUYk5sVEVmcTlmNUZiUUV0?=
 =?utf-8?B?NDVTOE1TaXJZKzY4WHJaN1dJR2ltMURMSklmMG5nekxHR294d3pGQzRMNmt4?=
 =?utf-8?B?ZnZQM1JEMGJRQmJjQ05oei9GWTBkWW9makg1RDZmQkFyeHJUSWRpR2p0WU5o?=
 =?utf-8?B?UFVoRlBXWW90ZHg0aHVHUENSNjVhc21CNnZUZmEzTjZTdFFEWnBSWThaTkRC?=
 =?utf-8?B?d2tzSXBkQm5hamVwUFJ0LzVMQWIrdlJIU3J3cWU3SWsya2NFdkNyR2poaFkz?=
 =?utf-8?B?TTh0U1BMQmFOenE5NkNvRTk4WS9FUVRhMmxvclJrd1dzaGtvd2NKZnRBUWx6?=
 =?utf-8?B?OWxJU1lzaWVQMHRlWGlFQmRmSHluRmNCTDN2Tm1wanFaL3dKSG8wNEw0VnlQ?=
 =?utf-8?B?aG1Cc015dVU5emxTMXVIQ3I3SWxoZm92NG9PdEhqWXlKYjloTkRqazZaaCtl?=
 =?utf-8?B?UnpYckJZRjY4NmxMU1hCejVhcGJ4UGlFdzk2d296ZDVmaDhzOGh5djRnaVB4?=
 =?utf-8?B?Vmkrd2RlZFpTYm1rZk9BeG9OeHF0M2x5cVRIZ3ZXeE1MVFdMTHlleTNwSDkr?=
 =?utf-8?B?ZE45emdlckRGM2RiKzNtcE9ySHhQdlVydExPWENnemFtOFprZlU1R1k5Um9V?=
 =?utf-8?B?ZXRUMGpod1FMSFZ4NEJJMzhaMVp5KzRXbkpZZi9EN1FEYXEzYkhkZz09?=
X-Exchange-RoutingPolicyChecked: Lt3nX2nvBI8SSb0BwQXpgymXy+5AuE2lxXU+SdzuObciStdf4TBzFy4yYDyf+UaDv2ImmVJQtQwpXyB1LgJXqNKqKiU3hfNrR92TPkJ0HF7zFzRm6B4Mx/DAo2aHpsYQ88lLwwGKQNU33LFghR/sRD9UmFt1PgJbi8Yg0AoJ9u+DShBgpCw7nO06GJKY9qMpjyLAZGOCXfPY3cvcP7d5GD7UIWs5VyFnv2YjRY/JC5p+GKMXL6ibTuWm8v4b2B7QkotBrAVslYAnfRctAucgTrPRoR4OYCLt/mtB/zeo/OEsh3kQMfJZAiEYSgUxlgRGAUKFXCcfTXlFURZUydFTNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2054da-49fe-498a-e7ef-08df36c8cb2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:14.3044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dccEakMnT3FiX3I0VoYCJsi/2spsKjA8+n6Wc18x2/524pqF/6g6GvJ906EwbAuBMft9Syk+hCIiIdkCWDyzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXzdGtr5Z09g1/
 oz30qJWZYjrXMYnvEJXh/8G4i+n72J9bITSLhVTjGgYwc5V8xSj0SCSpLcIV0YMuLrZPTcSMM6m
 uoVkdoekhVWeRE9TFSKf1LctG+cioJIPA/5/sPf5msOogcsakOuPJI2fll+Y9x1ZwcU3N6tdtlR
 TnJPssXwXhb4adjRWM43cBq0pc5Iqmaky5ZnpvwISoSPuC4CyO7H+PG7g0hroxBuE1UJBTCXOT+
 09WOIbLFD85xvb5p/jQfwhVRluPIBrhtV0XuxNFCrTq90jDaL3vo78vRDQqt7FUYGXmYnbLc0D5
 /EDwkApXsjXES+OF/2C1y8gvlYGsb/pOVgmzTF7gBGo7L6dE8AdG9nqHVzw1wYEKf+PP2ky5ENB
 HEHb4ozHKecAPH6ewYBO7oKMevE1QxhOkP2qO6pQl9bma1hjGoW7141mZraH84EU4bHwjn9S6FG
 D2OZqjxvWk2dFvQu8ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX/MA3KsPnPpbR
 wxC/Ut1EvjtkD21NJxuhk9DNCFOylzbvzArvuFX+fLCg61Dgdueea+QhHe06f/2nRI5w72mWJvz
 U/r/8tQkcqf1v7CSlGW5IUm5rL/BcDA=
X-Proofpoint-GUID: p7QDeCxkst3t4GBsCuDWYfMcEYZUVYAD
X-Proofpoint-ORIG-GUID: p7QDeCxkst3t4GBsCuDWYfMcEYZUVYAD
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6ae50563 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=NCWKwCw8Xy9Og0ibBRsL:22 a=MvuuwTCpAAAA:8 a=fGMkU8j19cbUKg6FXhUA:9
 a=QEXdDO2ut3YA:10
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the SBM (serial bus master) layer used to reach SerDes and PMI
registers, and its NIC specific SerDes accessors.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: BLOCK_COMMENT_STYLE (2), LONG_LINE_STRING (2), LONG_LINE (1),
  TYPO_SPELLING (1)
- CHECK: UNNECESSARY_PARENTHESES (16), BRACES (3), COMPARISON_TO_NULL
  (1)

Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c     | 1114 +++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes_nic.c |  138 +++
 2 files changed, 1252 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c
new file mode 100644
index 000000000000..1d1c4d01e159
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c
@@ -0,0 +1,1114 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP. All Rights Reserved. */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+
+#include <uapi/ethernet/sbl_sbm_constants.h>
+
+#include "sbl_sbm_serdes.h"
+#include "sbl_serdes_map.h"
+#include "sbl_sbm.h"
+
+static void
+sbus_reg_addr_to_string(u32 sbus_addr, u8 reg_addr, char *reg_addr_str)
+{
+	if (is_sbm_spico_addr(sbus_addr)) {
+		switch (reg_addr) {
+		case SPICO_SBR_ADDR_SRAM_BIST:
+			sprintf(reg_addr_str, "SRAM_BIST");
+			break;
+		case SPICO_SBR_ADDR_CTL:
+			sprintf(reg_addr_str, "CTL");
+			break;
+		case SPICO_SBR_ADDR_DMEM_IN:
+			sprintf(reg_addr_str, "DMEM_IN");
+			break;
+		case SPICO_SBR_ADDR_IMEM:
+			sprintf(reg_addr_str, "IMEM");
+			break;
+		case SPICO_SBR_ADDR_DMEM:
+			sprintf(reg_addr_str, "DMEM");
+			break;
+		case SPICO_SBR_ADDR_STEP_BP:
+			sprintf(reg_addr_str, "STEP_BP");
+			break;
+		case SPICO_SBR_ADDR_BP_ADDR:
+			sprintf(reg_addr_str, "BP_ADDR");
+			break;
+		case SPICO_SBR_ADDR_INTR:
+			sprintf(reg_addr_str, "INTR");
+			break;
+		case SPICO_SBR_ADDR_DMEM_OUT:
+			sprintf(reg_addr_str, "DMEM_OUT");
+			break;
+		case SPICO_SBR_ADDR_RDATA:
+			sprintf(reg_addr_str, "RDATA");
+			break;
+		case SPICO_SBR_ADDR_PC:
+			sprintf(reg_addr_str, "PC");
+			break;
+		case SPICO_SBR_ADDR_PC_OVERRIDE:
+			sprintf(reg_addr_str, "PC_OVERRIDE");
+			break;
+		case SPICO_SBR_ADDR_FLAG:
+			sprintf(reg_addr_str, "FLAG");
+			break;
+		case SPICO_SBR_ADDR_OP:
+			sprintf(reg_addr_str, "OP");
+			break;
+		case SPICO_SBR_ADDR_SP_EC:
+			sprintf(reg_addr_str, "SP_EC");
+			break;
+		case SPICO_SBR_ADDR_STATE:
+			sprintf(reg_addr_str, "STATE");
+			break;
+		case SPICO_SBR_ADDR_RESULT:
+			sprintf(reg_addr_str, "RESULT");
+			break;
+		case SPICO_SBR_ADDR_A_B_REG:
+			sprintf(reg_addr_str, "A_B_REG");
+			break;
+		case SPICO_SBR_ADDR_IMEM_BURST_DATA:
+			sprintf(reg_addr_str, "IMEM_BURST_DATA");
+			break;
+		case SPICO_SBR_ADDR_IMEM_BURST_ADDR:
+			sprintf(reg_addr_str, "IMEM_BURST_ADDR");
+			break;
+		case SPICO_SBR_ADDR_ECC:
+			sprintf(reg_addr_str, "ECC");
+			break;
+		case SPICO_SBR_ADDR_UNNAMED_0:
+			sprintf(reg_addr_str, "UNNAMED_0");
+			break;
+		case SPICO_SBR_ADDR_UNNAMED_1:
+			sprintf(reg_addr_str, "UNNAMED_1");
+			break;
+		case SPICO_SBR_ADDR_UNNAMED_2:
+			sprintf(reg_addr_str, "UNNAMED_2");
+			break;
+		case SPICO_SBR_ADDR_UNNAMED_3:
+			sprintf(reg_addr_str, "UNNAMED_3");
+			break;
+		case SPICO_SBR_ADDR_UNNAMED_4:
+			sprintf(reg_addr_str, "UNNAMED_4");
+			break;
+		default:
+			sprintf(reg_addr_str, "SPICO_SBR_UNKNOWN");
+			break;
+		}
+	} else if (is_sbm_crm_addr(sbus_addr)) {
+		switch (reg_addr) {
+		case SBM_CRM_ADDR_CISM0:
+			sprintf(reg_addr_str, "CISM0");
+			break;
+		case SBM_CRM_ADDR_CISM1:
+			sprintf(reg_addr_str, "CISM1");
+			break;
+		case SBM_CRM_ADDR_LAST_ADDR:
+			sprintf(reg_addr_str, "LAST_ADDR");
+			break;
+		case SBM_CRM_ADDR_CLK_DIV:
+			sprintf(reg_addr_str, "CLK_DIV");
+			break;
+		case SBM_CRM_ADDR_CLK_DIV_RST:
+			sprintf(reg_addr_str, "CLK_DIV_RST");
+			break;
+		case SBM_CRM_ADDR_CLK_DIV_RST_P0:
+			sprintf(reg_addr_str, "CLK_DIV_RST_P0");
+			break;
+		case SBM_CRM_ADDR_CLK_DIV_RST_P1:
+			sprintf(reg_addr_str, "CLK_DIV_RST_P1");
+			break;
+		case SBM_CRM_ADDR_CISM_RX_ADDR:
+			sprintf(reg_addr_str, "CISM_RX_ADDR");
+			break;
+		case SBM_CRM_ADDR_CISM_CMD1:
+			sprintf(reg_addr_str, "CISM_CMD1");
+			break;
+		case SBM_CRM_ADDR_CISM_DATA_ADDR1:
+			sprintf(reg_addr_str, "CISM_DATA_ADDR1");
+			break;
+		case SBM_CRM_ADDR_CISM_DATA_WORD1:
+			sprintf(reg_addr_str, "CISM_DATA_WORD1");
+			break;
+		case SBM_CRM_ADDR_CISM_CMD2:
+			sprintf(reg_addr_str, "CISM_CMD2");
+			break;
+		case SBM_CRM_ADDR_CISM_DATA_ADDR2:
+			sprintf(reg_addr_str, "CISM_DATA_ADDR2");
+			break;
+		case SBM_CRM_ADDR_CISM_DATA_WORD2:
+			sprintf(reg_addr_str, "CISM_DATA_WORD2");
+			break;
+		case SBM_CRM_ADDR_DATA_OUT_SEL:
+			sprintf(reg_addr_str, "DATA_OUT_SEL");
+			break;
+		case SBM_CRM_ADDR_BIST:
+			sprintf(reg_addr_str, "BIST");
+			break;
+		case SBM_CRM_ADDR_ROM_EN:
+			sprintf(reg_addr_str, "ROM_EN");
+			break;
+		case SBM_CRM_ADDR_ROM_FAILED_ADDR:
+			sprintf(reg_addr_str, "ROM_FAILED_ADDR");
+			break;
+		case SBM_CRM_ADDR_ROM_DATA_VAL_CNT:
+			sprintf(reg_addr_str, "ROM_DATA_VAL_CNT");
+			break;
+		case SBM_CRM_ADDR_ROM_ACK:
+			sprintf(reg_addr_str, "ROM_ACK");
+			break;
+		case SBM_CRM_ADDR_ROM_STOP_ADDR:
+			sprintf(reg_addr_str, "ROM_STOP_ADDR");
+			break;
+		case SBM_CRM_ADDR_ROM_OUTPUT:
+			sprintf(reg_addr_str, "ROM_OUTPUT");
+			break;
+		case SBM_CRM_ADDR_ROM_DATA0:
+			sprintf(reg_addr_str, "ROM_DATA0");
+			break;
+		case SBM_CRM_ADDR_ROM_DATA1:
+			sprintf(reg_addr_str, "ROM_DATA1");
+			break;
+		case SBM_CRM_ADDR_CLK_HALT:
+			sprintf(reg_addr_str, "CLK_HALT");
+			break;
+		case SBM_CRM_ADDR_GEN_WRITE:
+			sprintf(reg_addr_str, "GEN_WRITE");
+			break;
+		case SBM_CRM_ADDR_GEN_READ:
+			sprintf(reg_addr_str, "GEN_READ");
+			break;
+		case SBM_CRM_ADDR_GEN_WRITE_P0:
+			sprintf(reg_addr_str, "GEN_WRITE_P0");
+			break;
+		case SBM_CRM_ADDR_GEN_WRITE_P1:
+			sprintf(reg_addr_str, "GEN_WRITE_P1");
+			break;
+		case SBM_CRM_ADDR_GEN_WRITE_P2:
+			sprintf(reg_addr_str, "GEN_WRITE_P2");
+			break;
+		case SBM_CRM_ADDR_GEN_WRITE_P3:
+			sprintf(reg_addr_str, "GEN_WRITE_P3");
+			break;
+		case SBM_CRM_ADDR_GEN_READ_P0:
+			sprintf(reg_addr_str, "GEN_READ_P0");
+			break;
+		case SBM_CRM_ADDR_GEN_READ_P1:
+			sprintf(reg_addr_str, "GEN_READ_P1");
+			break;
+		case SBM_CRM_ADDR_GEN_READ_P2:
+			sprintf(reg_addr_str, "GEN_READ_P2");
+			break;
+		case SBM_CRM_ADDR_GEN_READ_P3:
+			sprintf(reg_addr_str, "GEN_READ_P3");
+			break;
+		case SBM_CRM_ADDR_SBUS_ID:
+			sprintf(reg_addr_str, "SBUS_ID");
+			break;
+		case SBM_CRM_ADDR_IP_IDCODE:
+			sprintf(reg_addr_str, "IP_IDCODE");
+			break;
+		default:
+			sprintf(reg_addr_str, "SBM_CRM_UNKNOWN");
+			break;
+		}
+	} else if (is_cm4_serdes_addr(sbus_addr)) {
+		switch (reg_addr) {
+		case SPICO_SERDES_ADDR_IMEM:
+			sprintf(reg_addr_str, "IMEM");
+			break;
+		case SPICO_SERDES_ADDR_INTR0:
+			sprintf(reg_addr_str, "INTR0");
+			break;
+		case SPICO_SERDES_ADDR_INTR1:
+			sprintf(reg_addr_str, "INTR1");
+			break;
+		case SPICO_SERDES_ADDR_RESET_EN:
+			sprintf(reg_addr_str, "RESET_EN");
+			break;
+		case SPICO_SERDES_ADDR_INTR_DIS:
+			sprintf(reg_addr_str, "INTR_DIS");
+			break;
+		case SPICO_SERDES_ADDR_BIST:
+			sprintf(reg_addr_str, "BIST");
+			break;
+		case SPICO_SERDES_ADDR_IMEM_BURST:
+			sprintf(reg_addr_str, "IMEM_BURST");
+			break;
+		case SPICO_SERDES_ADDR_ECC:
+			sprintf(reg_addr_str, "ECC");
+			break;
+		case SPICO_SERDES_ADDR_ECCLOG:
+			sprintf(reg_addr_str, "ECCLOG");
+			break;
+		case SPICO_SERDES_ADDR_BCAST:
+			sprintf(reg_addr_str, "BCAST");
+			break;
+		case SPICO_SERDES_ADDR_IP_IDCODE:
+			sprintf(reg_addr_str, "IP_IDCODE");
+			break;
+		default:
+			sprintf(reg_addr_str, "UNKNOWN");
+			break;
+		}
+	} else {
+		sprintf(reg_addr_str, "UNKNOWN");
+	}
+}
+
+static void
+sbus_cmd_to_string(u8 command, char *cmd_str)
+{
+	char str0[SBL_MAX_STR_LEN], str1[SBL_MAX_STR_LEN], str2[SBL_MAX_STR_LEN];
+
+	switch (command & SBUS_CMD_MODE_MASK) {
+	case SBUS_CMD_MODE_CTLR:
+		sprintf(str0, "CM_CTLR");
+		break;
+	case SBUS_CMD_MODE_RCVR:
+		sprintf(str0, "CM_RCVR");
+		break;
+	default:
+		sprintf(str0, "CM_UNKNOWN");
+		break;
+	}
+	switch (command & SBUS_IFACE_DST_MASK) {
+	case SBUS_IFACE_DST_TAP:
+		sprintf(str1, "ID_TAP");
+		break;
+	case SBUS_IFACE_DST_CORE:
+		sprintf(str1, "ID_CORE");
+		break;
+	case SBUS_IFACE_DST_SPICO:
+		sprintf(str1, "ID_SPICO");
+		break;
+	case SBUS_IFACE_DST_SPARE:
+		sprintf(str1, "ID_SPARE");
+		break;
+	default:
+		sprintf(str1, "ID_UNKNOWN");
+		break;
+	}
+	switch (command & SBUS_CMD_MASK) {
+	case SBUS_CMD_RESET:
+		sprintf(str2, "CMD_RESET");
+		break;
+	case SBUS_CMD_WRITE:
+		sprintf(str2, "CMD_WRITE");
+		break;
+	case SBUS_CMD_READ:
+		sprintf(str2, "CMD_READ");
+		break;
+	case SBUS_CMD_READ_RESULT:
+		sprintf(str2, "CMD_READ_RESULT");
+		break;
+	default:
+		sprintf(str2, "CMD_UNKNOWN");
+		break;
+	}
+	sprintf(cmd_str, "%s:%s:%s", str0, str1, str2);
+}
+
+static void
+sbus_result_code_to_string(u8 result_code, char *rc_string)
+{
+	switch (result_code) {
+	case SBUS_RC_RESET:
+		sprintf(rc_string, "RESET");
+		break;
+	case SBUS_RC_WRITE_COMPLETE:
+		sprintf(rc_string, "WRITE_COMPLETE");
+		break;
+	case SBUS_RC_WRITE_FAILED:
+		sprintf(rc_string, "WRITE_FAILED");
+		break;
+	case SBUS_RC_READ_ALL_COMPLETE:
+		sprintf(rc_string, "READ_ALL_COMPLETE");
+		break;
+	case SBUS_RC_READ_COMPLETE:
+		sprintf(rc_string, "READ_COMPLETE");
+		break;
+	case SBUS_RC_READ_FAILED:
+		sprintf(rc_string, "READ_FAILED");
+		break;
+	case SBUS_RC_CMD_ISSUE_DONE:
+		sprintf(rc_string, "CMD_ISSUE_DONE");
+		break;
+	case SBUS_RC_MODE_CHANGE_COMPLETE:
+		sprintf(rc_string, "MODE_CHANGE_COMPLETE");
+		break;
+	default:
+		sprintf(rc_string, "UNKNOWN");
+		break;
+	}
+}
+
+static void
+spico_interrupt_to_string(u32 sbus_addr, u16 interrupt, char *intr_str)
+{
+	if (is_sbm_spico_addr(sbus_addr)) {
+		switch (interrupt) {
+		case SPICO_INT_SBMS_REV_ID:
+			sprintf(intr_str, "SBMS_REV_ID");
+			break;
+		case SPICO_INT_SBMS_BUILD_ID:
+			sprintf(intr_str, "SBMS_BUILD_ID");
+			break;
+		case SPICO_INT_SBMS_DO_CRC:
+			sprintf(intr_str, "SBMS_DO_CRC");
+			break;
+		case SPICO_INT_SBMS_READ_DMEM_VAL:
+			sprintf(intr_str, "SBMS_READ_DMEM_VAL");
+			break;
+		case SPICO_INT_SBMS_DO_XDMEM_CRC:
+			sprintf(intr_str, "SBMS_DO_XDMEM_CRC");
+			break;
+		case SPICO_INT_SBMS_GET_PMRO_DATA:
+			sprintf(intr_str, "SBMS_GET_PMRO_DATA");
+			break;
+		case SPICO_INT_SBMS_GET_TEMP_DATA:
+			sprintf(intr_str, "SBMS_GET_TEMP_DATA");
+			break;
+		case SPICO_INT_SBMS_GET_VOLT_DATA:
+			sprintf(intr_str, "SBMS_GET_VOLT_DATA");
+			break;
+		case SPICO_INT_SBMS_IMEM_CRC_CHECK:
+			sprintf(intr_str, "SBMS_IMEM_CRC_CHECK");
+			break;
+		case SPICO_INT_SBMS_IMEM_SWP_SA:
+			sprintf(intr_str, "SBMS_IMEM_SWP_SA");
+			break;
+		case SPICO_INT_SBMS_PCIE3_SWP:
+			sprintf(intr_str, "SBMS_PCIE3_SWP");
+			break;
+		case SPICO_INT_SBMS_DRMON_SETUP:
+			sprintf(intr_str, "SBMS_DRMON_SETUP");
+			break;
+		case SPICO_INT_SBMS_TEMP_SETUP:
+			sprintf(intr_str, "SBMS_TEMP_SETUP");
+			break;
+		case SPICO_INT_SBMS_RR_PCAL:
+			sprintf(intr_str, "SBMS_RR_PCAL");
+			break;
+		default:
+			if ((interrupt >= SPICO_INT_SBMS_DDR_HMB_FIRST) &&
+			    (interrupt <= SPICO_INT_SBMS_DDR_HMB_LAST)) {
+				sprintf(intr_str, "SBMS_DDR_HMB");
+			} else {
+				sprintf(intr_str, "SBMS_UNKNOWN");
+			}
+			break;
+		}
+	} else if (is_cm4_serdes_addr(sbus_addr)) {
+		switch (interrupt) {
+		case SPICO_INT_CM4_REV_ID:
+			sprintf(intr_str, "CM4_REV_ID");
+			break;
+		case SPICO_INT_CM4_SERDES_EN:
+			sprintf(intr_str, "CM4_SERDES_EN");
+			break;
+		case SPICO_INT_CM4_PRBS_CTRL:
+			sprintf(intr_str, "CM4_PRBS_CTRL");
+			break;
+		case SPICO_INT_CM4_COMPARE_CTRL:
+			sprintf(intr_str, "CM4_COMPARE_CTRL");
+			break;
+		case SPICO_INT_CM4_PMD_CTRL:
+			sprintf(intr_str, "CM4_PMD_CTRL");
+			break;
+		case SPICO_INT_CM4_TX_BAUD:
+			sprintf(intr_str, "CM4_TX_BAUD");
+			break;
+		case SPICO_INT_CM4_RX_BAUD:
+			sprintf(intr_str, "CM4_RX_BAUD");
+			break;
+		case SPICO_INT_CM4_AN_CONFIG:
+			sprintf(intr_str, "CM4_AN_CONFIG");
+			break;
+		case SPICO_INT_CM4_LOOPBACK:
+			sprintf(intr_str, "CM4_LOOPBACK");
+			break;
+		case SPICO_INT_CM4_DFE_CTRL:
+			sprintf(intr_str, "CM4_DFE_CTRL");
+			break;
+		case SPICO_INT_CM4_TX_PHASE_CAL:
+			sprintf(intr_str, "CM4_TX_PHASE_CAL");
+			break;
+		case SPICO_INT_CM4_BIT_SLIP:
+			sprintf(intr_str, "CM4_BIT_SLIP");
+			break;
+		case SPICO_INT_CM4_TX_PHASE_SLIP:
+			sprintf(intr_str, "CM4_TX_PHASE_SLIP");
+			break;
+		case SPICO_INT_CM4_RX_PHASE_SLIP:
+			sprintf(intr_str, "CM4_RX_PHASE_SLIP");
+			break;
+		case SPICO_INT_CM4_PCIE_PD:
+			sprintf(intr_str, "CM4_PCIE_PD");
+			break;
+		case SPICO_INT_CM4_PLL_RECAL:
+			sprintf(intr_str, "CM4_PLL_RECAL");
+			break;
+		case SPICO_INT_CM4_SAS_APTA_CTRL:
+			sprintf(intr_str, "CM4_SAS_APTA_CTRL");
+			break;
+		case SPICO_INT_CM4_POLARITY_CTRL:
+			sprintf(intr_str, "CM4_POLARITY_CTRL");
+			break;
+		case SPICO_INT_CM4_WIDTH_MODE:
+			sprintf(intr_str, "CM4_WIDTH_MODE");
+			break;
+		case SPICO_INT_CM4_TXEQ_LOAD:
+			sprintf(intr_str, "CM4_TXEQ_LOAD");
+			break;
+		case SPICO_INT_CM4_ERROR_RST:
+			sprintf(intr_str, "CM4_ERROR_RST");
+			break;
+		case SPICO_INT_CM4_BIG_REG_SEL:
+			sprintf(intr_str, "CM4_BIG_REG_SEL");
+			break;
+		case SPICO_INT_CM4_BIG_REG_WR:
+			sprintf(intr_str, "CM4_BIG_REG_WR");
+			break;
+		case SPICO_INT_CM4_BIG_REG_RD:
+			sprintf(intr_str, "CM4_BIG_REG_RD");
+			break;
+		case SPICO_INT_CM4_ERR_INJECT:
+			sprintf(intr_str, "CM4_ERR_INJECT");
+			break;
+		case SPICO_INT_CM4_DO_DATA_CAP:
+			sprintf(intr_str, "CM4_DO_DATA_CAP");
+			break;
+		case SPICO_INT_CM4_WAIT_TTD:
+			sprintf(intr_str, "CM4_WAIT_TTD");
+			break;
+		case SPICO_INT_CM4_ERR_STS:
+			sprintf(intr_str, "CM4_ERR_STS");
+			break;
+		case SPICO_INT_CM4_ERR_TIMER_STS:
+			sprintf(intr_str, "CM4_ERR_TIMER_STS");
+			break;
+		case SPICO_INT_CM4_PCIE_SLICES:
+			sprintf(intr_str, "CM4_PCIE_SLICES");
+			break;
+		case SPICO_INT_CM4_PCIE3_RX_EQ:
+			sprintf(intr_str, "CM4_PCIE3_RX_EQ");
+			break;
+		case SPICO_INT_CM4_SET_RX_EQ:
+			sprintf(intr_str, "CM4_SET_RX_EQ");
+			break;
+		case SPICO_INT_CM4_GET_RX_EQ:
+			sprintf(intr_str, "CM4_GET_RX_EQ");
+			break;
+		case SPICO_INT_CM4_CORE_TO_CNTL_EN:
+			sprintf(intr_str, "CM4_CORE_TO_CNTL_EN");
+			break;
+		case SPICO_INT_CM4_AN_DME_PAGE:
+			sprintf(intr_str, "CM4_AN_DME_PAGE");
+			break;
+		case SPICO_INT_CM4_INT_RX_TERM:
+			sprintf(intr_str, "CM4_INT_RX_TERM");
+			break;
+		case SPICO_INT_CM4_HAL_READ:
+			sprintf(intr_str, "CM4_HAL_READ");
+			break;
+		case SPICO_INT_CM4_HAL_WRITE:
+			sprintf(intr_str, "CM4_HAL_WRITE");
+			break;
+		case SPICO_INT_CM4_HAL_CALL:
+			sprintf(intr_str, "CM4_HAL_CALL");
+			break;
+		case SPICO_INT_CM4_SPICO_CLK_SWP:
+			sprintf(intr_str, "CM4_SPICO_CLK_SWP");
+			break;
+		case SPICO_INT_CM4_PCIE3_TX_MRG1:
+			sprintf(intr_str, "CM4_PCIE3_TX_MRG1");
+			break;
+		case SPICO_INT_CM4_PCIE3_TX_MRG2:
+			sprintf(intr_str, "CM4_PCIE3_TX_MRG2");
+			break;
+		case SPICO_INT_CM4_PCIE3_TX_MRG3:
+			sprintf(intr_str, "CM4_PCIE3_TX_MRG3");
+			break;
+		case SPICO_INT_CM4_PCIE3_TX_MRG4:
+			sprintf(intr_str, "CM4_PCIE3_TX_MRG4");
+			break;
+		case SPICO_INT_CM4_PCIE3_TX_MRG5:
+			sprintf(intr_str, "CM4_PCIE3_TX_MRG5");
+			break;
+		case SPICO_INT_CM4_PROC_RESET:
+			sprintf(intr_str, "CM4_PROC_RESET");
+			break;
+		case SPICO_INT_CM4_PCIE_SWP_SETUP:
+			sprintf(intr_str, "CM4_PCIE_SWP_SETUP");
+			break;
+		case SPICO_INT_CM4_IP_STAT_INFO:
+			sprintf(intr_str, "CM4_IP_STAT_INFO");
+			break;
+		case SPICO_INT_CM4_CRC:
+			sprintf(intr_str, "CM4_CRC");
+			break;
+		case SPICO_INT_CM4_PMD_CONFIG:
+			sprintf(intr_str, "CM4_PMD_CONFIG");
+			break;
+		case SPICO_INT_CM4_BUILD_ID:
+			sprintf(intr_str, "CM4_BUILD_ID");
+			break;
+		case SPICO_INT_CM4_O_CORE_STS_15_0:
+			sprintf(intr_str, "CM4_O_CORE_STS_15_0");
+			break;
+		case SPICO_INT_CM4_O_CORE_STS_31_16:
+			sprintf(intr_str, "CM4_O_CORE_STS_31_16");
+			break;
+		default:
+			if (interrupt & SPICO_INT_CM4_MEM_READ) {
+				sprintf(intr_str, "CM4_MEM_READ_0x%03X",
+					interrupt & ~SPICO_INT_CM4_MEM_READ);
+			} else if (interrupt & SPICO_INT_CM4_MEM_WRITE) {
+				sprintf(intr_str, "CM4_MEM_WRITE_0x%03X",
+					interrupt & ~SPICO_INT_CM4_MEM_WRITE);
+			} else {
+				sprintf(intr_str, "CM4_UNKNOWN");
+			}
+			break;
+		}
+	} else {
+		sprintf(intr_str, "UNKNOWN");
+	}
+}
+
+static void sbus_msg_print(void *inst, int severity, const char *message)
+{
+	struct sbl_inst *sbl = inst;
+
+	if (!sbl || !message)
+		return;
+	if (severity >= LEVEL_ERR)
+		SBL_ERR(sbl->dev, "%s", message);
+	else if (severity >= LEVEL_WARN)
+		SBL_WARN(sbl->dev, "%s", message);
+	else if (severity >= LEVEL_INFO)
+		SBL_INFO(sbl->dev, "%s", message);
+	else
+		SBL_TRACE1(sbl->dev, "%s", message);
+}
+
+static void sbus_msg(void *inst, u32 sbus_addr, u32 req_data,
+		     u8 reg_addr, u8 command, u32 rsp_data,
+		u8 result_code, u8 overrun, int timeout,
+		u32 flags, int rc, int severity)
+{
+	struct sbl_inst *sbl = inst;
+	char sbus_addr_str[SBL_HALF_MAX_STR_LEN];
+	char reg_addr_str[SBL_HALF_MAX_STR_LEN];
+	char cmd_str[SBL_HALF_MAX_STR_LEN];
+	char rc_str[SBL_HALF_MAX_STR_LEN];
+	char message[SBL_MAX_STR_LEN];
+
+	if (!sbl)
+		return;
+
+	sbus_addr_to_string(sbus_addr, sbus_addr_str);
+	sbus_reg_addr_to_string(sbus_addr, reg_addr, reg_addr_str);
+	sbus_cmd_to_string(command, cmd_str);
+	sbus_result_code_to_string(result_code, rc_str);
+
+	snprintf(message, SBL_MAX_STR_LEN, "SBUS_OP: addr:0x%03x(%-20s) req_data:0x%08x reg_addr:0x%04x(%-15s)",
+		 sbus_addr, sbus_addr_str, req_data, reg_addr, reg_addr_str);
+	sbus_msg_print(inst, severity, message);
+
+	snprintf(message, SBL_MAX_STR_LEN, "SBUS_OP: command:0x%02x(%-24s), rsp_data:0x%08x result_code:0x%01x(%-14s)",
+		 command, cmd_str, rsp_data, result_code, rc_str);
+	sbus_msg_print(inst, severity, message);
+
+	snprintf(message, SBL_MAX_STR_LEN, "SBUS_OP: overrun:%d timeout:0x%04x flags:0x%04x rc:%d",
+		 overrun, timeout, flags, rc);
+	sbus_msg_print(inst, severity, message);
+}
+
+/**
+ * sbl_sbus_wr() - Write to sbus
+ * @inst: Generic pointer used by various frameworks
+ * @sbus_addr: address describing a serdes ring and rxaddr
+ * @reg_addr: target sbus register address
+ * @sbus_data: target sbus data
+ *
+ * Convenience function to issue an SBus op and check the result_code
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_sbus_wr(void *inst, u32 sbus_addr, u8 reg_addr,
+		u32 sbus_data)
+{
+	struct sbl_inst *sbl = inst;
+	u32 unused;
+
+	return sbl_sbus_op_aux(sbl, sbus_addr, reg_addr, SBUS_IFACE_DST_CORE |
+			       SBUS_CMD_WRITE, sbus_data, &unused);
+}
+EXPORT_SYMBOL(sbl_sbus_wr);
+
+/**
+ * sbl_sbus_rd() - Read from sbus
+ * @inst: Generic pointer used by various frameworks
+ * @sbus_addr: address describing a serdes ring and rxaddr
+ * @reg_addr: target sbus register address
+ * @result: location to store result of command
+ *
+ * Convenience function to issue an SBus op and check the result_code
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_sbus_rd(void *inst, u32 sbus_addr, u8 reg_addr,
+		u32 *result)
+{
+	struct sbl_inst *sbl = inst;
+
+	return sbl_sbus_op_aux(sbl, sbus_addr, reg_addr, SBUS_IFACE_DST_CORE |
+			       SBUS_CMD_READ, 0, result);
+}
+EXPORT_SYMBOL(sbl_sbus_rd);
+
+int sbl_serdes_mem_rd(void *inst, u32 port_num, u32 serdes,
+		      u32 addr, u16 *data)
+{
+	struct sbl_inst *sbl = inst;
+	int err;
+
+	SBL_TRACE2(sbl->dev, "p%ds%d: addr:0x%x", port_num, serdes, addr);
+	addr &= SPICO_INT_MEM_READ_ADDR_MASK;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_MEM_READ | addr,
+					SPICO_INT_DATA_NONE, data,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	SBL_TRACE2(sbl->dev, "p%ds%d: addr:0x%x data:0x%x", port_num, serdes, addr, *data);
+
+	return 0;
+}
+
+int sbl_serdes_mem_wr(void *inst, u32 port_num, u32 serdes,
+		      u32 addr, u16 data)
+{
+	struct sbl_inst *sbl = inst;
+	int err;
+
+	SBL_TRACE2(sbl->dev, "p%ds%d: addr:0x%x", port_num, serdes, addr);
+	addr &= SPICO_INT_MEM_READ_ADDR_MASK;
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_MEM_WRITE | addr,
+					data, NULL, SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	SBL_TRACE2(sbl->dev, "p%ds%d: addr:0x%x data:0x%x", port_num, serdes, addr,
+		   data);
+
+	return 0;
+}
+
+int sbl_serdes_mem_rmw(void *inst, u32 port_num, u32 serdes,
+		       u32 addr, u16 data, u16 mask)
+{
+	struct sbl_inst *sbl = inst;
+	int err;
+	u16 rdata, wdata;
+
+	SBL_TRACE2(sbl->dev, "p%ds%d: addr:0x%x data:0x%x mask:0x%x", port_num,
+		   serdes, addr, data, mask);
+	err = sbl_serdes_mem_rd(sbl, port_num, serdes, addr, &rdata);
+	if (err)
+		return err;
+
+	wdata = (rdata & ~mask) | (data & mask);
+	err = sbl_serdes_mem_wr(sbl, port_num, serdes, addr, wdata);
+	if (err)
+		return err;
+
+	SBL_TRACE2(sbl->dev, "p%ds%d: addr:0x%x rmw_data:0x%x", port_num, serdes,
+		   addr, wdata);
+
+	return 0;
+}
+
+int sbl_spico_burst_upload(void *inst, u32 sbus, u32 reg,
+			   size_t fw_size, const u8 *fw_data)
+{
+	struct sbl_inst *sbl = inst;
+	int err;
+	size_t byte;
+
+	if (!fw_data || !fw_size || fw_size % 2) {
+		SBL_ERR(sbl->dev,
+			"Bad firmware for sbus:0x%02x reg:0x%x fw->size:%zd!",
+			sbus, reg, fw_size);
+		return -EINVAL;
+	}
+
+	SBL_TRACE1(sbl->dev, "sbus:0x%02x reg:0x%x fw->size:%zd", sbus, reg,
+		   fw_size);
+	for (byte = 0; fw_size - byte >= 6; byte += 6) {
+		err = sbl_sbus_wr(sbl, sbus, reg, SPICO_SBR_DATA_BE_012 |
+				       (fw_data[byte + 0] << 8 | fw_data[byte + 1]) <<
+				       SPICO_SBR_DATA_W0_OFFSET |
+				       (fw_data[byte + 2] << 8 | fw_data[byte + 3]) <<
+				       SPICO_SBR_DATA_W1_OFFSET |
+				       (fw_data[byte + 4] << 8 | fw_data[byte + 5]) <<
+				       SPICO_SBR_DATA_W2_OFFSET);
+		if (err)
+			return err;
+
+	}
+	if (fw_size - byte == 4) {
+		err = sbl_sbus_wr(sbl, sbus, reg, SPICO_SBR_DATA_BE_01 |
+				       (fw_data[byte + 0] << 8 | fw_data[byte + 1]) <<
+				       SPICO_SBR_DATA_W0_OFFSET |
+				       (fw_data[byte + 2] << 8 | fw_data[byte + 3]) <<
+				       SPICO_SBR_DATA_W1_OFFSET);
+		if (err)
+			return err;
+
+	} else if (fw_size - byte == 2) {
+		err = sbl_sbus_wr(sbl, sbus, reg, SPICO_SBR_DATA_BE_0 |
+				       (fw_data[byte + 0] << 8 | fw_data[byte + 1]) <<
+				       SPICO_SBR_DATA_W0_OFFSET);
+		if (err)
+			return err;
+
+	}
+	return 0;
+}
+
+int sbl_sbus_op_aux(void *inst, u32 sbus_addr, u8 reg_addr,
+		    u8 command, u32 sbus_data, u32 *result)
+{
+	struct sbl_inst *sbl = inst;
+	u8 result_code = 0, overrun = 0;
+	int err = -1;
+	int retry_cnt = 0;
+	int retry_limit = 5;
+	u32 sbus_ring = SBUS_RING(sbus_addr);
+	u32 rx_addr = SBUS_RX_ADDR(sbus_addr);
+	bool valid_result = false;
+	int sbus_op_timeout_ms = sbl_sbm_get_sbus_op_timeout_ms(sbl);
+	int sbus_op_flags = sbl_sbm_get_sbus_op_flags(sbl);
+	void *accessor = sbl;
+
+	if (!sbl->is_hw) {
+		*result = 0;
+		return 0;
+	}
+	/* Safety check */
+	if (!mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring))) {
+		sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
+			 0, result_code, overrun, sbus_op_timeout_ms,
+			 sbus_op_flags, err, LEVEL_WARN);
+		WARN(1, "%s: Unlocked SBUS ring %d!", __func__, sbus_ring);
+	}
+
+	/* Perform SBus operation */
+	while (retry_cnt++ < retry_limit) {
+		err = sbl_sbm_sbus_op(accessor, sbus_ring, sbus_data,
+				      reg_addr, rx_addr, command, result,
+					     &result_code, &overrun,
+					     sbus_op_timeout_ms,
+					     sbus_op_flags);
+		if (err) {
+			sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
+				 0, result_code, overrun, sbus_op_timeout_ms,
+				 sbus_op_flags, err, LEVEL_WARN);
+		}
+		if (err || overrun) {
+			SBL_INFO(sbl->dev, "Resetting SBUS ring %d!", sbus_ring);
+			err = sbl_sbm_sbus_op_reset(sbl, sbus_ring);
+			if (err) {
+				SBL_WARN(sbl->dev,
+					 "sbl_sbm_sbus_op_reset failed! sbus_ring:%d rc:%d",
+					 sbus_ring, err);
+				return err;
+			}
+		} else {
+			break;
+		}
+	}
+
+	/* Validate results */
+	if (err || overrun) {
+		SBL_WARN(sbl->dev, "roshms_sbus_op failed!");
+		return -EIO;
+	}
+	switch (command & 0x3) {
+	case SBUS_CMD_RESET:
+		if (result_code == SBUS_RC_RESET)
+			valid_result = true;
+
+		break;
+	case SBUS_CMD_WRITE:
+		if (result_code == SBUS_RC_WRITE_COMPLETE)
+			valid_result = true;
+
+		break;
+	case SBUS_CMD_READ:
+		if (result_code == SBUS_RC_READ_COMPLETE)
+			valid_result = true;
+
+		break;
+	case SBUS_CMD_READ_RESULT:
+		if (result_code == SBUS_RC_READ_ALL_COMPLETE)
+			valid_result = true;
+
+		break;
+	}
+
+	if (!valid_result) {
+		SBL_WARN(sbl->dev, "Unexpected result code (%d) 0x%x!",
+			 result_code, command);
+		sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
+			 *result, result_code, overrun, sbus_op_timeout_ms,
+				sbus_op_flags, err, LEVEL_WARN);
+		return -ENOMSG;
+	}
+	sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
+		 *result, result_code, overrun, sbus_op_timeout_ms,
+			sbus_op_flags, err, LEVEL_DBG);
+
+	return 0;
+}
+
+/**
+ * sbl_sbm_spico_int() - spico intilization
+ * @inst: Generic pointer used by various framework
+ * @sbus_addr: address describing a serdes ring and rxaddr
+ * @code: interrupt command
+ * @data: interrupt data
+ * @result: location to store result of interrupt
+ *
+ * Write an interrupt request to a target SBM Spico
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_sbm_spico_int(void *inst, u32 sbus_addr, int code, int data,
+		      u32 *result)
+{
+	struct sbl_inst *sbl = inst;
+	int err;
+	u32 intr_out;
+	u32 intr_in;
+	char intr_str[SBL_MAX_STR_LEN];
+	int sbus_int_timeout = sbl_sbm_get_sbus_int_timeout(sbl);
+	int sbus_int_poll_interval = sbl_sbm_get_sbus_int_poll_interval(sbl);
+	unsigned long last_jiffy;
+	u32 sbus_ring = SBUS_RING(sbus_addr);
+
+	if (!sbl->is_hw) {
+		*result = 0;
+		return 0;
+	}
+	/* Safety check */
+	if (!mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring))) {
+		SBL_WARN(sbl->dev, "%s: Unlocked SBUS ring %d!", __func__, sbus_ring);
+		WARN(1, "sbl_sbus_op_aux: Unlocked SBUS ring %d!", sbus_ring);
+	}
+
+	spico_interrupt_to_string(sbus_addr, code, intr_str);
+
+	/* Inject the interrupt via SBus writes */
+	intr_in = ((data & SBMS_INTERRUPT_DATA_MASK) << SBMS_INTERRUPT_DATA_OFFSET) |
+		((code & SBMS_INTERRUPT_CODE_MASK) << SBMS_INTERRUPT_CODE_OFFSET);
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_DMEM_IN, intr_in);
+	if (err)
+		return err;
+
+	err = sbl_sbus_rd(sbl, sbus_addr, SPICO_SBR_ADDR_INTR, &intr_out);
+	if (err)
+		return err;
+
+	intr_out |= SBMS_INTERRUPT_STATUS_OK;
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_INTR, intr_out);
+	if (err)
+		return err;
+
+	intr_out ^= SBMS_INTERRUPT_STATUS_OK;
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_INTR, intr_out);
+	if (err)
+		return err;
+
+	/* Poll for interrupt completion */
+	last_jiffy = jiffies + msecs_to_jiffies(1000 * sbus_int_timeout);
+	do {
+		err = sbl_sbus_rd(sbl, sbus_addr, SPICO_SBR_ADDR_DMEM_OUT,
+				  &intr_out);
+		if (err)
+			return err;
+
+		/* Check in progress bit */
+		if ((intr_out & SBMS_INTERRUPT_IN_PROGRESSS_MASK) == 0)
+			break;
+
+		msleep(sbus_int_poll_interval);
+	} while (time_is_after_jiffies(last_jiffy));
+	if (intr_out & SBMS_INTERRUPT_IN_PROGRESSS_MASK) {
+		SBL_ERR(sbl->dev,
+			"SBM_INT: sbus_addr:0x%03x int:0x%x(%s) data:0x%x timed out (timeout:%ds)!",
+			sbus_addr, code, intr_str, data, sbus_int_timeout);
+		return -ETIME;
+	}
+
+	/* Reread to ensure result is valid */
+	err = sbl_sbus_rd(sbl, sbus_addr, SPICO_SBR_ADDR_DMEM_OUT,
+			  &intr_out);
+	if (err) {
+		SBL_ERR(sbl->dev,
+			"SBM_INT: sbus_addr:0x%03x int:0x%x(%s) data:0x%x failed!",
+			sbus_addr, code, intr_str, data);
+		return err;
+	}
+
+	/* Extract interrupt result */
+	if ((intr_out & SBMS_INTERRUPT_STATUS_MASK) == 1) {
+		*result = (intr_out & SBMS_INTERRUPT_DATA_MASK) >>
+			SBMS_INTERRUPT_DATA_OFFSET;
+	} else {
+		SBL_ERR(sbl->dev,
+			"SBM_INT: sbus_addr:0x%03x int:0x%x(%s) data:0x%x Failed with status 0x%x!",
+			sbus_addr, code, intr_str, data, (intr_out & SBMS_INTERRUPT_STATUS_MASK));
+		return -EBADE;
+	}
+
+	SBL_TRACE1(sbl->dev,
+		   "SBM_INT: sbus_addr:0x%03x int:0x%x(%s) data:0x%x -> 0x%x",
+		sbus_addr, code, intr_str, data, *result);
+	return 0;
+}
+EXPORT_SYMBOL(sbl_sbm_spico_int);
+
+/* Returns a SBUS master address based on a ring number */
+static int sbl_chip_ring_sbus_to_port_serdes(void *inst, int chip,
+					     int ring, int sbus,
+					     int *port_out, int *serdes_out)
+{
+	struct sbl_inst *sbl = inst;
+	int port, serdes;
+
+	for (port = 0; port < sbl->switch_info->num_ports; ++port) {
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (chip != sbl->switch_info->ports[port].serdes[serdes].device)
+				continue;
+
+			if (ring != sbl->switch_info->ports[port].serdes[serdes].sbus_ring)
+				continue;
+
+			if (sbus != sbl->switch_info->ports[port].serdes[serdes].rx_addr)
+				continue;
+
+			*port_out = port;
+			*serdes_out = serdes;
+			return 0;
+		}
+	}
+
+	SBL_WARN(sbl->dev,
+		 "Unable to determine port/serdes for chip %d ring %d sbus %d",
+		 chip, ring, sbus);
+	return -1;
+}
+
+int sbl_serdes_spico_int2(void *inst, u32 sbus_addr,
+			  int code, int data, u16 *result, u8 result_action)
+{
+	struct sbl_inst *sbl = inst;
+	int port_num, serdes;
+
+	if (sbl_chip_ring_sbus_to_port_serdes(sbl, 0,
+					      SBUS_RING(sbus_addr),
+						SBUS_RX_ADDR(sbus_addr),
+						&port_num, &serdes)) {
+		SBL_ERR(sbl->dev,
+			"Failed converting %d:%d:%d to port/serdes!",
+				0, SBUS_RING(sbus_addr), SBUS_RX_ADDR(sbus_addr));
+	return -1;
+	}
+
+	return sbl_serdes_spico_int(sbl, port_num, serdes, code, data, result,
+				    result_action);
+}
+
+/**
+ * sbl_serdes_spico_int() - serdes spico initilization
+ * @inst: Generic pointer used by various frameworks
+ * @port_num: port number
+ * @serdes: address list describing SerDes lanes
+ * @code: interrupt command
+ * @data: interrupt data
+ * @result: pointer to store result in
+ * @result_action: ignore the interrupt result, store it to the result
+ *                 pointer, or validate it matches code
+ *
+ * Write an interrupt request to a set of SerDes Spicos
+ *
+ * Return: 0 if all results are the same, else -1
+ */
+int sbl_serdes_spico_int(void *inst, u32 port_num, u32 serdes,
+			 int code, int data, u16 *result, u8 result_action)
+{
+	struct sbl_inst *sbl = inst;
+	int err;
+	char intr_str[SBL_MAX_STR_LEN];
+	u16 result_out = 0;
+	u16 *p_result;
+	u32 sbus_addr;
+	int serdes_op_timeout_ms = sbl_sbm_get_serdes_op_timeout_ms(sbl);
+	int serdes_op_flags = sbl_sbm_get_serdes_op_flags(sbl);
+	void *accessor = sbl;
+
+	if ((result_action == SPICO_INT_RETURN_RESULT) && (result == NULL)) {
+		SBL_ERR(sbl->dev, "result pointer was NULL!");
+		return -1;
+	}
+	if (result_action != SPICO_INT_RETURN_RESULT)
+		p_result = &result_out;
+	else
+		p_result = result;
+
+	if (!sbl->is_hw) {
+		*p_result = code;
+		return 0;
+	}
+	/* Make a fake SerDes sbus_addr so spico_interrupt_to_string gives us the
+	   right debug string. This function is only called for CM4 SerDes, so this
+	   will always give the correct string. */
+	sbl_sbus_addr_get(&sbus_addr);
+	spico_interrupt_to_string(sbus_addr, code, intr_str);
+
+	err = sbl_sbm_pml_serdes_op(accessor, port_num, serdes, code,
+				    data, p_result, serdes_op_timeout_ms,
+					   serdes_op_flags);
+	if (err) {
+		SBL_ERR(sbl->dev,
+			"SERDES_INT: p%ds%d sbl_serdes_op failed! (rc:%d) int:0x%02x(%s) data:0x%04x",
+				port_num, serdes, err, code, intr_str, data);
+		return err;
+	}
+	SBL_TRACE1(sbl->dev,
+		   "SERDES_INT: p%ds%d int:0x%02x(%s) data:0x%04x -> 0x%04x",
+			port_num, serdes, code, intr_str, data, *p_result);
+
+	if ((result_action == SPICO_INT_VALIDATE_RESULT) &&
+	    ((*p_result & SPICO_INT_RESULT_CODE_MASK) != code)) {
+		SBL_ERR(sbl->dev,
+			"SERDES_INT: p%ds%d int:0x%02x(%s) data:0x%04x -> 0x%04x Unexpected result! Expected 0x%04x!",
+			port_num, serdes, code, intr_str, data, *p_result & SPICO_INT_RESULT_CODE_MASK, code);
+		return -EBADE;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_spico_int);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes_nic.c
new file mode 100644
index 000000000000..a49dc39cc37d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes_nic.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP. All Rights Reserved. */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+
+#include <uapi/ethernet/sbl_sbm_constants.h>
+
+#include "sbl_sbm_serdes.h"
+#include "sbl_serdes_map.h"
+
+bool is_cm4_serdes_addr(u32 sbus_addr)
+{
+	u8 ring     = SBUS_RING(sbus_addr);
+	u16 rx_addr = SBUS_RX_ADDR(sbus_addr);
+
+	if (((ring == 0 || ring == 1) &&
+	     ((rx_addr >= SBUS_RINGX_CM4_SERDES_FIRST) &&
+	      (rx_addr <= SBUS_RINGX_CM4_SERDES_LAST))) ||
+	    (rx_addr == SBUS_BCAST_CM4_SERDES_SPICO)) {
+		return true;
+	}
+	return false;
+}
+
+bool is_pcie_serdes_addr(u32 sbus_addr)
+{
+	u8 ring     = SBUS_RING(sbus_addr);
+	u16 rx_addr = SBUS_RX_ADDR(sbus_addr);
+
+	if ((ring == 0 || ring == 1) &&
+	    ((rx_addr >= SBUS_RINGX_PCIE_SERDES_SPICO_FIRST) &&
+	      (rx_addr <= SBUS_RINGX_PCIE_SERDES_SPICO_LAST) &&
+	      ((rx_addr & 0x1) == SBUS_RINGX_PCIE_SERDES_SPICO_LSB))) {
+		return true;
+	}
+	return false;
+}
+
+bool is_pcie_serdes_pcs_addr(u32 sbus_addr)
+{
+	u8 ring     = SBUS_RING(sbus_addr);
+	u16 rx_addr = SBUS_RX_ADDR(sbus_addr);
+
+	if ((ring == 0 || ring == 1) &&
+	    ((rx_addr >= SBUS_RINGX_PCIE_SERDES_PCS_FIRST) &&
+	      (rx_addr <= SBUS_RINGX_PCIE_SERDES_PCS_LAST) &&
+	      ((rx_addr & 0x1) == SBUS_RINGX_PCIE_SERDES_PCS_LSB))) {
+		return true;
+	}
+	return false;
+}
+
+bool is_sbm_crm_addr(u32 sbus_addr)
+{
+	u8 ring     = SBUS_RING(sbus_addr);
+	u16 rx_addr = SBUS_RX_ADDR(sbus_addr);
+
+	if (((ring == 0 || ring == 1) && (rx_addr == SBUS_RINGX_SBM)) ||
+	    (rx_addr == SBUS_BCAST_SBM)) {
+
+		return true;
+	}
+	return false;
+}
+
+bool is_sbm_spico_addr(u32 sbus_addr)
+{
+	u8 ring     = SBUS_RING(sbus_addr);
+	u16 rx_addr = SBUS_RX_ADDR(sbus_addr);
+
+	if (((ring == 0 || ring == 1) && (rx_addr == SBUS_RINGX_SBM_SPICO)) ||
+	    (rx_addr == SBUS_BCAST_SBM_SPICO)) {
+		return true;
+	}
+	return false;
+}
+
+void
+sbus_addr_to_string(u32 sbus_addr, char *data_str)
+{
+	u8 ring     = SBUS_RING(sbus_addr);
+	u16 rx_addr = SBUS_RX_ADDR(sbus_addr);
+
+	/* Valid for any sbus master */
+	if (rx_addr == SBUS_BCAST_PCIE_SERDES_SPICO) {
+		sprintf(data_str, "PCIE_SERDES_SPICO(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_PCIE_SERDES_PCS) {
+		sprintf(data_str, "PCIE_SERDES_PCS(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_CM4_SERDES_SPICO) {
+		sprintf(data_str, "CM4_SERDES_SPICO(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_SBM_SPICO) {
+		sprintf(data_str, "SBM_SPICO(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_SBM) {
+		sprintf(data_str, "SBM(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_PLL) {
+		sprintf(data_str, "PLL(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_PMRO) {
+		sprintf(data_str, "PMRO(BROADCAST)");
+	} else if (rx_addr == SBUS_BCAST_THERMVOLT) {
+		sprintf(data_str, "THERMVOLT(BROADCAST)");
+    /* Valid for Cassini - rings 0 and 1 are the same */
+	} else if (ring == 0 || ring == 1) {
+		if (rx_addr == SBUS_RINGX_PCIE_PLL0)
+			sprintf(data_str, "PCIE_PLL0");
+		else if (rx_addr == SBUS_RINGX_PCIE_PLL1)
+			sprintf(data_str, "PCIE_PLL1");
+		else if (rx_addr == SBUS_RINGX_PCIE_PLL2)
+			sprintf(data_str, "PCIE_PLL2");
+		else if (rx_addr == SBUS_RINGX_CORE_PLL)
+			sprintf(data_str, "CORE_PLL");
+		else if (rx_addr == SBUS_RINGX_PMRO0)
+			sprintf(data_str, "PMRO0");
+		else if (rx_addr == SBUS_RINGX_PMRO1)
+			sprintf(data_str, "PMRO1");
+		else if (is_pcie_serdes_addr(sbus_addr))
+			sprintf(data_str, "PCIE_SERDES_SPICO");
+		else if (is_pcie_serdes_pcs_addr(sbus_addr))
+			sprintf(data_str, "PCIE_SERDES_PCS0");
+		else if (rx_addr == SBUS_RINGX_SBM)
+			sprintf(data_str, "SBM");
+		else if (rx_addr == SBUS_RINGX_SBM_SPICO)
+			sprintf(data_str, "SBM_SPICO");
+		else if (is_cm4_serdes_addr(sbus_addr))
+			sprintf(data_str, "CM4_SERDES");
+		else
+			sprintf(data_str, "UNKNOWN");
+	} else {
+		sprintf(data_str, "UNKNOWN");
+	}
+}
+
+void sbl_sbus_addr_get(u32 *sbus_addr)
+{
+	*sbus_addr = SBUS_ADDR(0, SBUS_RINGX_CM4_SERDES_FIRST);
+}

-- 
2.56.0

