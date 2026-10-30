Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394111;
	b=02tXZa6hO7C6nIBq0M60V0IwMB94mhxLQU6BJPeh6hBDV2rjJE548evSHksi+cjlWr4X
	 kMQcsGWMLlYAr6kl4+fWv55ygFbc8kzcevkRZHvU/eMkhJuL8i1z6KwmFcVWRbZREs9qp
	 ZHxVcjTrZ+S+ZX8RHms3mMuB5WCz4dRdLAM5LTClUtvcNN7uYn83r9wIf8EvhGOis/VJD
	 PW3NW8qEUK90TR7ReEsAd0/lqqkP9y8jQ3As1P8I7rqHHe8de6FvJT5v4wrTLxmmLvfLI
	 2VAb6eejf+/l6E1YKBfJ2W4JDgTywPEzxApTHSUjLLbwHEY4jGlMBilkuWML3+9u9WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394111;
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
	bh=qkPNtR/Hj9ATYMaL/uor6Zj1jlWkOWDjcpR7kKbZsY4=;
	b=hfYm3TQxUuJatGr1pX28J3HhBi2jAUqstghlXZlPusuRAfZRdJOMndbqK3gMQ0ViFkYu
	 wyW6Q3u0VexIcGE9S9mzPQUNG/GGbhlYO/+2IGs6Eu2yvluPkoIvj35dX20q8e+iHellg
	 vxGGTKNUzMXXdZYFvKSz+E3RsCMFGuXk42UT8K3GmxlQ1/hpAPmx5RAS3WpFhv2c3hmeQ
	 aWfDruY5vbJ8m300OYTFl3YTODHxrXlUoPXtpNB0pvHgkpgCMzA+CDggxRJr+CbpJMPRS
	 UULEOuA8UwYsqAAIC/FDnK6ECtCmYnbpdcCbRlasRqoL7kBnIfK309BIi2aFtl1TpEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=n311LceX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F42606A338;
	Fri, 30 Oct 2026 21:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F42606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=n311LceX
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHxiMm3237840;
	Fri, 30 Oct 2026 21:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=qk
	PNtR/Hj9ATYMaL/uor6Zj1jlWkOWDjcpR7kKbZsY4=; b=n311LceXVuco93XpQh
	oEjJKPBXGa9Ue2HfGwtz93alqZivP2HxiCfHQyCEkmF0WOOyO/ncb+fnYTDuK39b
	tha/wJPmyaf3WC1XJE1PHSBqijt5Gg5YC3sJbBwsh1LcRTaB95Q+uBFQSyZWeJrx
	Bd2D0OUJFngmKfUtOEYSolPofW7c2U8ElidQfKLb1RA40aJA0JIuKs1hjphqbqxM
	jlZsGyzOyybRuknf5NWTNnA0n3VlFXM7vjpV4JYznJj04s5ZFJ94AG/d55YQAeyG
	p9C/oM5DK793o680YEMy59ZNkwVf+eaLPbV5/x0ZWOfkLSE3ymVmWUjjtgEFo4ww
	ezIQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmw2jvkyg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:12 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 07076147AC;
	Fri, 30 Oct 2026 21:01:12 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:11 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:11 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:11 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIX1FZj9NTmV1I2YBPHChJgppURiGYAv1FMHA2RlY5dmHge2Ut7w8u3PyOP4rxip2zei+R42Bfvqd5Bzm+3v2/PzpznZV0e2B8X43Pc0dkucX3RnMAyeS7/4HavRkM3U1VSKZGU/+moBev/wcHJeNkvF2nwhYwcYlFJx1h1q/zJhX38uwR56fZ4Nl1YuVr96FwU/7NF0Ceko9IdNOSSjXk2wVuWHmO4sHea+VI+s2Hc1oaC2w2e7rkOm2juczrZ4TcV8MYOkgCXLEku0dAuSLCiaC7YzeXMVXF4CPdoLC3cWaDUbkdlbzjHeiLCzgKyfXFw4OXdh9UyX6TwR0/VagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkPNtR/Hj9ATYMaL/uor6Zj1jlWkOWDjcpR7kKbZsY4=;
 b=pgIl/GQqo5pbVqQrtmlrddx6Y8P+VyC6EYXbcOgxiOkzA1r3uquehmFBR6bNZ2cDQSuUnomHmj+PZlh2c9M1rf7xneFz4CLN2+XVWL88HfCfucjfsUU6RnEjtXFPCNvo9+EBeSuCKmPmjFsYDQ3HshLGnTDmsQDnVZoOBtFNFcBpPcnhPvIpUtNOHsOMOuhQt0K6nfHbGd6eCaF1p+DAlXxwIh4aUCbPfwQYF6xlxLdKH+P3gfYy3LunFCLdzexfBdi0RNHz3DnwCUH6A5gtK2cf13JAyZ1oZaXhMaNYv8pwTYaEmydaZJKb00dM4zd2za19FY7qwM3unPzSv+b91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:01:09 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:01:09 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:16 -0700
Subject: [PATCH 20/23] net: hpe: ss1: add the CXI core interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-20-8c2c391cc283@hpe.com>
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
        Mamila Santosh <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SA1PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::9) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 94a26630-d119-40ad-d716-08df36c8ebad
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|921020|56012099006|5023799004|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022075727099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 2Uvw4TLtVk5ezVpsZDuegVTKe0YLmceP+Df569ve07knc/t++ZOQO+JhW+rSFJed8C6iH5W//VCwXVVd9o9UKXqwJDHiuxR50j1yteC/RXrw/8uxwmFCMP8UWCaWFSR9RSFN2IsjHFTFjxmsdknOYqg6fdmDSfCtd1zAnfqtPi1aHunlPDUh3eVhem2PZKvNSBsk4NVkW44h+RxA9ZqRPmN9KZie9+v7aOIRYUOkr+YdOroZEUSgbSDLVV2DQ+y2IVCrQFHtlDFGAEyN0AEciLjZimo0N8gEC6Oo+rYLmvsvpGoVb9HkboUzxVEW1bS+c0kryw+urOvO14rcLhnma/KG0oskER9gPRUCLphOsMwusmp3cNbSxlt4LbhoAvQDyFMDSPOnipmLC1WGz25tRT5iM+ktqe/9bprtKNr+MWf39z1HcJsSttOmvXSRMlQQp+JRF0tRGQ4sh2/OQFOwbYWaeweVeGWocPTTH69s+5q6LZsnmCALTaDRXfx+QVBzsOrikO65458x+ztHO0sT7b2+BxQ1JQJqlIkCOrwiuoQQfyVxgMe7aeuRcjun/KC+4gCk/LrVf4W6tlSuqjGBVtefFV1DZlr5jTyf81avpvuPY7S94r8TUhPyaH/rIi2rhvqSdOkqsdlPcUFb1CjUI4nnFnwfgokcDo6MRbt66LbhdLm7as9r3di5a3dJG7OY2n6dgGkXqyUi08Sd19U4kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(5023799004)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpweVduN1JkVzhLMmhNa2VuM09sd3dXK0lGaldrVW1rSVphRm9HTGZPclMr?=
 =?utf-8?B?ekxEcjhYNG5sMnBIVC8xNC92UEQ3U2lUOTYrYWN1bElidWlYYUhnamRYQjc3?=
 =?utf-8?B?L1RsVE5zRGZhOFdZUmNqTFAreEZuR0ZwemJuSjk5MHhIRGFjVnBZSHVtQVRU?=
 =?utf-8?B?VGN6d014QTV3MWtKcndFSXk1S3M5YlQzaWFpS3JmOG0rNjVvb3JXWHRtNVF1?=
 =?utf-8?B?N2N4aFhtSDRsa1laTnpFOWxjVUVlNmhSckdyc1hvQ1IzUlhGRXlmanhNN1Fi?=
 =?utf-8?B?RUJMSHB4SmFHOTZDV3Q4K0VVTE9ZK3VrWmtLUzEyVkNXVEd4VVFsaUxRL0dQ?=
 =?utf-8?B?OXU2WEZFRmRsWmtNdGdxV29pa1JrcDgxT3VtdzVqOHNrVElzc1plYkoxVE1h?=
 =?utf-8?B?QzF6RW9oSnVkOHZmQmNtREZ2UUpzNGcxN3Q4UEZqYVhyS2prRlhsSzdaeTg2?=
 =?utf-8?B?NXBLRjYxcThZRGtpOEZzd01GNGdqTFdySmp1ckVGeXpyelBKKzJFSUR6Y0hy?=
 =?utf-8?B?WnJYbzlNTlFiRmZSbWcxQytJMGlOMTZ4VTg5aXBaSkdzTFY3MEFpODZjN2xP?=
 =?utf-8?B?SGFjSndOZnp2dHNkc1VENmFMUTJFc2tpVlIvamZxRWhOWXBpU1V0R2l4Nm1L?=
 =?utf-8?B?MytsSzF2K1daTXFxM0p3WTlEWjM2TmI0RXNzQmlRZTdlNUwzbEkzSjl6RWNI?=
 =?utf-8?B?TVhEbTN1c3gvQTdCMndtT3lSd0N0TU02MExyWGhyQ0k1enZnU1l1c1dKejFj?=
 =?utf-8?B?dDRIajJwSFNTRGFzeXNSd0JSRW5jMTEvb3VvZFdUbUhPcmhoY0FpVTJGS3dT?=
 =?utf-8?B?L0UzYWdoY3dpSldtR0RXcHN4UGEvSThSVXJpV2ttbDdCNmZ5Vkp0NTdXVFRh?=
 =?utf-8?B?R0YrYTI1dHoycHpEZ2lRQTB4bWg5dG5TMVo5c200TVl4elJWRHd1LzgyQjVU?=
 =?utf-8?B?THBRVnJPNkZ3WkdtYythLzNtNzY4a1Q3NExRQ1V5NGVlaVYxV1hnUjV2TUdn?=
 =?utf-8?B?R1R4U05vdTBHT0V6QTZxZC9EZVdUSFZsem5wSGY0RUJPSC92YWxJdVpSQkNr?=
 =?utf-8?B?dHBKSEFkbjlXaTQ3NFRLcElLTTlXUFo4enN2SzgreE5tZFQ4OCtXZGMwRXVw?=
 =?utf-8?B?eTlVWGJRcXQrY2tpN2VpZEhHY0F4cVhwUkh0dUFUWDV6UlFlQ0FKeUdvUGt4?=
 =?utf-8?B?OWxiTC9BZi9aRUhsSzZ4VjZKemhtQjRXMDhiY2lUb0ZnUDBNMWY5ZDZ0alFk?=
 =?utf-8?B?Vk9BcnRlQjM4RGUzWmprVEo5Z2VlSExJMUNKaXN2N3MrbXZnR2pxTUhxd2tn?=
 =?utf-8?B?ZE56TUduN1B4TTk4NTFmRy9CM2xYVG5nMnRHL00wUGc2YTkwRG16MWlvZndB?=
 =?utf-8?B?cU91d0JHWmpTc2tselVWZ3J2WVNNVzBzbmpEWDNYa2RXTUx6bEZqSGQzUUlv?=
 =?utf-8?B?M084SGZuZkJ3dU1GVUJNcVdHbzFjRVdpcnRzYmYvRW56b0NLbUlLNUp6dWpS?=
 =?utf-8?B?WHpvVnQ4SXNseS8zRXRVQkdnQW0rQVRpa3R6WXJpRWl3QUc4Q2lLMjhJbmUy?=
 =?utf-8?B?NWxGZHcvM3NXOHFFYWwyL0l3MTZibEJBTG9lWFppb1NOTENMaXcvT0N0ZTFU?=
 =?utf-8?B?N0wrS0ZxdXZUYmFkT3BPbFBJU0VxTFp2NDhwM0RTM1FGUUhRYTVQRHQ1WWFa?=
 =?utf-8?B?NjFEUEFtb3U0RGVoUHlpZFV2aW9Td3dDUllhdkREZ0Z1VFJqNnNXY0xPa3Jw?=
 =?utf-8?B?TUZFUG1zejNnWjdRZUlveTczU053b2VxNFRGc3NBTmtRR1pKNHZicFdUdTFU?=
 =?utf-8?B?Y1RXL3J2TmZjUXk1dWF3bms2Q3hUcDdvYVFKTGxlVU1sS3NFNXNVOURMam5Z?=
 =?utf-8?B?THoyTFJNVTZLU3dKd1o4RkdVRnJaNmtQSVU2dmJoSHVWZkhuaW00MnRTTlM2?=
 =?utf-8?B?bUw1YTlINFp3VXBrQk9hSndaendYd2lCeEdJaEZFY2tiVDhXZGFLdGNhNFBl?=
 =?utf-8?B?RmJZMTRqcE1QMWxnNnovS04zSUJSaklvY2c4M1pzeFo3YmtxcFY5b2JNb1RO?=
 =?utf-8?B?M29DeHliRHhsd2YyNWNuU2hITjdBMGl2MUFZcWYxUXBzNlVCaEoxNDhpNEJS?=
 =?utf-8?B?Y0FFR09MMVRpdm1KcC9yWXFZVm1idVFta3V6T3FrcityNlNheHJmblpSTjFF?=
 =?utf-8?B?OVBZaDY1RlhjOGptTnhFQ0JtdjJYcHZSd3NUQU1oYUVwSFZzK1h6aXBDNWti?=
 =?utf-8?B?K2lpcFhuWlFGYVBhYmdsbmJOS1dGZVZ2TDhnNi9WcVR6VjRucjhQMFhndFlk?=
 =?utf-8?B?RWlOWmkvektNK3grR3VnUTk0OUNOdTVKTmo2b3RqM2x1NmxYcjA1dz09?=
X-Exchange-RoutingPolicyChecked: t66B3Y3/XNQ1zAuvEXLmJ0itInBSWmxZJuZjHMn9e46qm+oM+aXknjhUufjkMe8cyNlhq/PWRlN2+dt2ewchV1tyOK35T0K70JQXkCh/UkPp2jkjIQ2WlUkZgeIVrvZDFv/wwM4U7duOtsJ/IRN1h5Pq47RsUn2oEYJeBC1gwBBkrhMfWq9ikNdt2cuIf7FmyFo7Pa333KuMpqRYlp1slqSrL0lTka4Qfs3y1m5nky6E9AP+wHo5cYR6zugPS0SnEKED2boybNl94zl7JotgFE2r9IHmFKjnvOVifhj4R0M2gXn4/7hjHLyK/QOoyix81agX3MYU8zu08YgxKx37Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a26630-d119-40ad-d716-08df36c8ebad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:01:09.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9eibrA1FXiA73E5qK9LPlk6qMAJgni/WBAQf1KW1pXT1zt6oDPxLbl1g5oiP1O4DSrvtXRAudLPPvSRNYjN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX5JBIu3RZnYx1
 hvnkZkDgQFklpZeTqE9fmb+caikuvtdZQu7morMzXy7bwMBwW/GFO+wPBrvBosFbDICwWXyz5/s
 QB8evpYIAi6Isz5SpvTyV5QOmamAjrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXyGSpLSWur1Hr
 iPE8mXT1Hu3d/LwKYc41FxeNA6hgdXZcBVuW/YOWh1A5Uaduack+ZRdSeCpNIuykwj52yrpHHlo
 TLDQVZwY1ab/L76ODc1TY66HBrbevfDH1vDbAdQO1H+qKOfkax5Y60ZmRHehzCRLgs1Tpe4uMfT
 gftejr73jxETXXCw6T4CCZHRDrHmJYseIEyAttSWb7V0m7doDQMdXwi1FnYr9qhJqv1JVqvZo6y
 1Z7+eiVriE7VdrCdl5CmC4MATIkFDPR/jZHnA3jRzV8JYTagNnOIBQ1ohI/Ys1RE3DiRhscnJ/d
 DpzyQv5myUY4DZKOxjVXFWFxw2GedNBir3BJF+y1mf2r2VHtzAgTRNTwOtygnoKD25Ob+GnR8tR
 J7BEewJO6QK8yXRHT54w4AjVJqF7Cx6znVX1HNYBkIIr+uNtujOTIHkDdMENmRvO19Z1gWicohe
 wU+ba9Oh/UF15hzB0iQ==
X-Authority-Analysis: v=2.4 cv=QOn91QLL c=1 sm=1 tr=0 ts=6ae50598 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=qlAOoxw2B8ks3BlJBSEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: d6pt5c94Fgq6bTfRCpXA0zB6WlC9RLbn
X-Proofpoint-ORIG-GUID: d6pt5c94Fgq6bTfRCpXA0zB6WlC9RLbn
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the CXI core interface: client registration, the auxiliary device
used by the RDMA driver, link control and the configuration tables.

Known limitation, deferred to V2: this patch carries SR-IOV
virtual-function code (VF-to-PF mailbox requests, mailbox opcodes or VF
resource handling) from an older, incomplete version of the Cassini
SR-IOV support. V2 of this series will include the updated SR-IOV
implementation, so issues in the VF paths should be ignored for now.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: ALLOC_WITH_SIZEOF (23), LONG_LINE (4), SPDX_LICENSE_TAG (4),
  BLOCK_COMMENT_STYLE (1), BRACES (1), MACRO_WITH_FLOW_CONTROL (1),
  MODULE_LICENSE (1)
- CHECK: ALLOC_SIZEOF_STRUCT (2)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cxi_aux_dev.c |  137 ++
 drivers/net/ethernet/hpe/ss1/cxi_config.c  | 2990 ++++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cxi_core.c    |  281 +++
 drivers/net/ethernet/hpe/ss1/cxi_link.c    |  227 +++
 4 files changed, 3635 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cxi_aux_dev.c b/drivers/net/ethernet/hpe/ss1/cxi_aux_dev.c
new file mode 100644
index 000000000000..74f20e156d5e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_aux_dev.c
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0*/
+/* Copyright 2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/pci.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/hpe/cxi/driver.h>
+#include <linux/hpe/cxi/cxi_prov_hw.h>
+#include "cass_core.h"
+#include "cxi_aux_dev.h"
+#include "cxi_internal.h"
+
+void cxi_release_aux_dev(struct device *dev)
+{
+	struct cxi_adev *cadev = container_of(dev, struct cxi_adev, adev.dev);
+
+	kfree(cadev);
+}
+
+/* Stop publishing the auxiliary device and wait for anyone using it. */
+static void cxi_ib_unpublish_adev(struct cass_dev *hw)
+{
+	mutex_lock(&hw->cxi_adev_lock);
+	hw->cxi_adev = NULL;
+	mutex_unlock(&hw->cxi_adev_lock);
+}
+
+void cxi_ib_remove_adev(struct cass_dev *hw)
+{
+	struct cxi_adev *cadev;
+
+	/*
+	 * Unpublish first. A NID change in progress holds the lock, so once
+	 * this returns nothing can still be using the device, and nothing new
+	 * can find it.
+	 */
+	mutex_lock(&hw->cxi_adev_lock);
+	cadev = hw->cxi_adev;
+	hw->cxi_adev = NULL;
+	mutex_unlock(&hw->cxi_adev_lock);
+
+	if (!cadev)
+		return;
+
+	auxiliary_device_delete(&cadev->adev);
+	auxiliary_device_uninit(&cadev->adev);
+}
+
+u8 *cxi_get_mac_addr(struct cxi_dev *dev)
+{
+	return dev->mac_addr;
+}
+
+int cxi_ib_add_adev(struct pci_dev *pdev, struct cass_dev *hw, int cxi_num)
+{
+	struct auxiliary_device *adev;
+	struct cxi_adev *cadev;
+	int rc;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->dev = &pdev->dev;
+	cadev->pdev = pdev;
+	cadev->cxi_dev = &hw->cdev;
+	BLOCKING_INIT_NOTIFIER_HEAD(&cadev->nid_notifier);
+	cadev->lni_alloc = cxi_lni_alloc;
+	cadev->svc_enable = cxi_svc_enable;
+	cadev->svc_set_vni_range = cxi_svc_set_vni_range;
+	cadev->svc_get_vni_range = cxi_svc_get_vni_range;
+	cadev->tc_cfg = cxi_tc_cfg;
+	cadev->pid_alloc = cxi_lni_pid_alloc;
+	cadev->pid_free = cxi_lni_pid_free;
+	cadev->lni_free  = cxi_lni_free;
+	cadev->query_device = NULL; /* optional */
+	cadev->cxi_map  = cxi_map;
+	cadev->dev_info_get = cxi_dev_info_get;
+	cadev->is_link_up   = cxi_is_link_up;
+	cadev->svc_get = cxi_svc_get;
+	cadev->svc_rsrc_get = cxi_svc_rsrc_get;
+	cadev->svc_alloc = cxi_svc_alloc;
+	cadev->svc_destroy = cxi_svc_destroy;
+	cadev->job_tc_bind = cxi_job_tc_bind;
+	cadev->tc_clear = cxi_tc_clear;
+	cadev->tc_list = cxi_tc_list;
+	cadev->domain_reserve = cxi_domain_reserve;
+	cadev->domain_alloc = cxi_domain_alloc;
+	cadev->domain_free = cxi_domain_free;
+	cadev->cp_alloc = cxi_cp_alloc;
+	cadev->cp_free = cxi_cp_free;
+	cadev->cq_alloc = cxi_cq_alloc;
+	cadev->cq_free = cxi_cq_free;
+	cadev->cxi_pte_alloc = cxi_pte_alloc;
+	cadev->cq_user_info = cxi_cq_user_info;
+	cadev->eq_alloc = cxi_eq_alloc;
+	cadev->eq_free = cxi_eq_free;
+	cadev->eq_get_event = cxi_eq_get_event;
+	cadev->eq_next_event = cxi_eq_next_event;
+	cadev->cxi_unmap = cxi_unmap;
+	cadev->cxi_pte_free = cxi_pte_free;
+	cadev->ct_alloc = cxi_ct_alloc;
+	cadev->ct_free  = cxi_ct_free;
+	cadev->clear_md = cxi_clear_md;
+	cadev->eq_user_info = cxi_eq_user_info;
+	cadev->ct_user_info = cxi_ct_user_info;
+	cadev->pte_map = cxi_pte_map;
+	cadev->pte_unmap = cxi_pte_unmap;
+	cadev->get_mac_addr = cxi_get_mac_addr;
+
+	adev = &cadev->adev;
+	adev->name = "rdma";
+	adev->id = cxi_num;
+	adev->dev.parent = &pdev->dev;
+	adev->dev.release = cxi_release_aux_dev;
+
+	mutex_lock(&hw->cxi_adev_lock);
+	hw->cxi_adev = cadev;
+	mutex_unlock(&hw->cxi_adev_lock);
+
+	rc = auxiliary_device_init(adev);
+	if (rc) {
+		cxi_ib_unpublish_adev(hw);
+		kfree(cadev);
+		return rc;
+	}
+
+	rc = auxiliary_device_add(adev);
+	if (rc) {
+		cxi_ib_unpublish_adev(hw);
+		auxiliary_device_uninit(adev);	/* release() frees cadev */
+		return rc;
+	}
+
+	return 0;
+}
+
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_config.c b/drivers/net/ethernet/hpe/ss1/cxi_config.c
new file mode 100644
index 000000000000..dd604753daee
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_config.c
@@ -0,0 +1,2990 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+/*
+ * Configuration and Management of rgroup/rx profile/tx profile using
+ * configfs Filesystem Interface
+ */
+
+#include "cxi_config.h"
+
+struct cxi_cfg_teardown_marker {
+	struct list_head list;
+	struct config_item *item;
+};
+
+static LIST_HEAD(cxi_cfg_teardown_markers);
+static DEFINE_SPINLOCK(cxi_cfg_teardown_lock);
+
+static void cxi_cfg_drop_item_ref(struct config_item *item)
+{
+	struct cxi_cfg_teardown_marker *marker;
+	unsigned long flags;
+	bool teardown_owns_ref = false;
+
+	spin_lock_irqsave(&cxi_cfg_teardown_lock, flags);
+	list_for_each_entry(marker, &cxi_cfg_teardown_markers, list) {
+		if (marker->item == item) {
+			teardown_owns_ref = true;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&cxi_cfg_teardown_lock, flags);
+
+	if (!teardown_owns_ref)
+		config_item_put(item);
+}
+
+static enum cxi_resource_type cxi_resource_str_to_type(const char *name)
+{
+	int i;
+
+	for (i = CXI_RESOURCE_PTLTE; i < CXI_RESOURCE_MAX; i++) {
+		if (strcmp(name, cxi_resource_type_strs[i]) == 0)
+			return i;
+	}
+
+	return CXI_RESOURCE_MAX;
+}
+
+static struct config_group *get_parent_config_group(struct config_group *child_group)
+{
+	struct config_group *parent_config_group;
+
+	if (!child_group->cg_item.ci_parent)
+		return NULL;
+
+	parent_config_group = container_of(child_group->cg_item.ci_parent,
+					   struct config_group,
+					   cg_item);
+
+	return parent_config_group;
+}
+
+static const int resource_max[CXI_RESOURCE_MAX] = {
+	[CXI_RESOURCE_PTLTE] = C_NUM_PTLTES,
+	[CXI_RESOURCE_TXQ] = C_NUM_TRANSMIT_CQS,
+	[CXI_RESOURCE_TGQ] = C_NUM_TARGET_CQS,
+	[CXI_RESOURCE_EQ] = EQS_AVAIL,
+	[CXI_RESOURCE_CT] = CTS_AVAIL,
+	[CXI_RESOURCE_PE0_LE] = PE_LE_MAX,
+	[CXI_RESOURCE_PE1_LE] = PE_LE_MAX,
+	[CXI_RESOURCE_PE2_LE] = PE_LE_MAX,
+	[CXI_RESOURCE_PE3_LE] = PE_LE_MAX,
+	[CXI_RESOURCE_TLE] = 0,
+	[CXI_RESOURCE_AC] = ACS_AVAIL,
+};
+
+static struct cxi_cfg_rgroup_ac_entry_sub *to_cxi_cfg_rgroup_ac_entry_sub(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rgroup_ac_entry_sub, group);
+}
+
+static ssize_t cxi_cfg_rgroup_ac_entry_sub_type_show(struct config_item *item,
+						     char *page)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+	int rc;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	ac_entry_sub = to_cxi_cfg_rgroup_ac_entry_sub(item);
+
+	rc = cxi_rgroup_get_ac_entry_data(ac_entry_sub->rgroup,
+					  ac_entry_sub->id,
+					  &ac_type,
+					  &ac_data);
+	if (rc)
+		return rc;
+
+	return sprintf(page, "%d\n", ac_type);
+}
+
+static ssize_t cxi_cfg_rgroup_ac_entry_sub_type_store(struct config_item *item,
+						      const char *page,
+						      size_t count)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+	int rc;
+	enum cxi_ac_type ac_type_val;
+	union cxi_ac_data ac_data_t = {};
+	unsigned int ac_entry_id;
+
+	ac_entry_sub = to_cxi_cfg_rgroup_ac_entry_sub(item);
+	if (!ac_entry_sub->rgroup) {
+		pr_debug("Unable to get rgroup reference\n");
+		return -EINVAL;
+	}
+
+	rc = kstrtouint(page, 0, (unsigned int *)&ac_type_val);
+	if (rc)
+		return rc;
+
+	if (ac_type_val == CXI_AC_UID)
+		ac_data_t.uid = ac_entry_sub->ac_data.uid;
+	else if (ac_type_val == CXI_AC_GID)
+		ac_data_t.gid = ac_entry_sub->ac_data.gid;
+	else if (ac_type_val == CXI_AC_NETNS)
+		ac_data_t.netns = ac_entry_sub->ac_data.netns;
+	else if (ac_type_val == CXI_AC_OPEN)
+		pr_debug("Setting type to CXI_AC_OPEN\n");
+	else
+		return -EINVAL;
+
+	rc = cxi_rgroup_add_ac_entry(ac_entry_sub->rgroup,
+				     ac_type_val,
+				     &ac_data_t,
+				     &ac_entry_id);
+	if (rc < 0) {
+		pr_debug("Unable to add ac entry to resource group: err val %d\n", rc);
+		return rc;
+	}
+
+	ac_entry_sub->ac_type = ac_type_val;
+	ac_entry_sub->id = ac_entry_id;
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rgroup_ac_entry_sub_data_show(struct config_item *item,
+						     char *page)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	int rc;
+
+	ac_entry_sub = to_cxi_cfg_rgroup_ac_entry_sub(item);
+
+	rc = cxi_rgroup_get_ac_entry_data(ac_entry_sub->rgroup,
+					  ac_entry_sub->id,
+					  &ac_type,
+					  &ac_data);
+	if (rc)
+		return rc;
+
+	if (ac_type == CXI_AC_UID)
+		return sprintf(page, "%d\n", ac_data.uid);
+	else if (ac_type == CXI_AC_GID)
+		return sprintf(page, "%d\n", ac_data.gid);
+	else if (ac_type == CXI_AC_NETNS)
+		return sprintf(page, "%d\n", ac_data.netns);
+	else if (ac_type == CXI_AC_OPEN)
+		return sprintf(page, "%d\n", CXI_AC_OPEN);
+
+	return -EINVAL;
+}
+
+static ssize_t cxi_cfg_rgroup_ac_entry_sub_data_store(struct config_item *item,
+						      const char *page,
+						      size_t count)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+	int rc;
+	unsigned int ac_data_val;
+
+	ac_entry_sub = to_cxi_cfg_rgroup_ac_entry_sub(item);
+
+	rc = kstrtouint(page, 0, &ac_data_val);
+	if (rc)
+		return rc;
+
+	if (ac_entry_sub->ac_type == CXI_AC_UID) {
+		ac_entry_sub->ac_data.uid = ac_data_val;
+		return count;
+	} else if (ac_entry_sub->ac_type == CXI_AC_GID) {
+		ac_entry_sub->ac_data.gid = ac_data_val;
+		return count;
+	} else if (ac_entry_sub->ac_type == CXI_AC_NETNS) {
+		ac_entry_sub->ac_data.netns = ac_data_val;
+		return count;
+	}
+
+	return -EINVAL;
+}
+
+static void cxi_cfg_rgroup_ac_entry_sub_free(struct config_item *item)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+
+	ac_entry_sub = container_of(item, struct cxi_cfg_rgroup_ac_entry_sub,
+				    group.cg_item);
+	kfree(ac_entry_sub);
+}
+
+CONFIGFS_ATTR(cxi_cfg_rgroup_ac_entry_sub_, type);
+CONFIGFS_ATTR(cxi_cfg_rgroup_ac_entry_sub_, data);
+
+static struct configfs_attribute *cxi_cfg_rgroup_ac_entry_sub_attrs[] = {
+	&cxi_cfg_rgroup_ac_entry_sub_attr_type,
+	&cxi_cfg_rgroup_ac_entry_sub_attr_data,
+	NULL,
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_ac_entry_sub_item_ops = {
+	.release     = cxi_cfg_rgroup_ac_entry_sub_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_ac_entry_sub_type = {
+	.ct_attrs       = cxi_cfg_rgroup_ac_entry_sub_attrs,
+	.ct_item_ops    = &cxi_cfg_rgroup_ac_entry_sub_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup_ac_entry_sub *alloc_dev_rgroup_ac_entry_sub(const char *name)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_dir_sub;
+
+	ac_entry_dir_sub = kzalloc(sizeof(*ac_entry_dir_sub),
+				   GFP_KERNEL);
+	if (!ac_entry_dir_sub)
+		return NULL;
+
+	strscpy(ac_entry_dir_sub->name, name, sizeof(ac_entry_dir_sub->name));
+
+	config_group_init_type_name(&ac_entry_dir_sub->group,
+				    ac_entry_dir_sub->name,
+				    &cxi_cfg_rgroup_ac_entry_sub_type);
+
+	return ac_entry_dir_sub;
+}
+
+static struct
+config_group *cxi_cfg_rgroup_ac_entry_make_group(struct config_group *group,
+						 const char *name)
+{
+	struct cxi_cfg_rgroup_ac_entry *ac_entry;
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+
+	if (strlen(name) > CONFIGFS_DIR_LEN - 1)
+		return ERR_PTR(-EINVAL);
+
+	ac_entry = container_of(group, struct cxi_cfg_rgroup_ac_entry, group);
+
+	ac_entry_sub = alloc_dev_rgroup_ac_entry_sub(name);
+	if (!ac_entry_sub) {
+		pr_debug("Failed to alloc memory for configfs ac entry");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ac_entry_sub->rgroup = ac_entry->rgroup;
+	ac_entry_sub->ac_type = CXI_AC_UID;
+	ac_entry_sub->ac_data.uid = 0;
+
+	return &ac_entry_sub->group;
+}
+
+static void
+cxi_cfg_rgroup_ac_entry_drop_item(struct config_group *group,
+				  struct config_item *item)
+{
+	struct cxi_cfg_rgroup_ac_entry_sub *ac_entry_sub;
+	unsigned int ac_entry_id;
+	int rc;
+
+	ac_entry_sub = container_of(item, struct cxi_cfg_rgroup_ac_entry_sub, group.cg_item);
+
+	if (ac_entry_sub->ac_type == CXI_AC_UID) {
+		rc = cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
+							CXI_AC_UID,
+							&ac_entry_sub->ac_data,
+							&ac_entry_id);
+
+		pr_debug("Getting an entry info rc = %d\n", rc);
+	} else if (ac_entry_sub->ac_type == CXI_AC_GID) {
+		rc = cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
+							CXI_AC_GID,
+							&ac_entry_sub->ac_data,
+							&ac_entry_id);
+
+		pr_debug("Getting an entry info rc = %d\n", rc);
+	} else if (ac_entry_sub->ac_type == CXI_AC_NETNS) {
+		rc = cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
+							CXI_AC_NETNS,
+							&ac_entry_sub->ac_data,
+							&ac_entry_id);
+		pr_debug("Getting an entry info rc = %d\n", rc);
+	} else {
+		rc = cxi_rgroup_get_ac_entry_id_by_data(ac_entry_sub->rgroup,
+							CXI_AC_OPEN,
+							NULL,
+							&ac_entry_id);
+		pr_debug("Getting an entry info rc = %d\n", rc);
+	}
+
+	if (!rc)
+		cxi_rgroup_delete_ac_entry(ac_entry_sub->rgroup,
+					   ac_entry_id);
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rgroup_ac_entry_free(struct config_item *item)
+{
+	struct cxi_cfg_rgroup_ac_entry *ac_entry;
+
+	ac_entry = container_of(item, struct cxi_cfg_rgroup_ac_entry,
+				group.cg_item);
+
+	kfree(ac_entry);
+}
+
+static struct configfs_group_operations cxi_cfg_rgroup_ac_entry_ops = {
+	.make_group     = cxi_cfg_rgroup_ac_entry_make_group,
+	.drop_item      = cxi_cfg_rgroup_ac_entry_drop_item
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_ac_entry_item_ops = {
+	.release     = cxi_cfg_rgroup_ac_entry_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_ac_entry_type = {
+	.ct_group_ops   = &cxi_cfg_rgroup_ac_entry_ops,
+	.ct_item_ops    = &cxi_cfg_rgroup_ac_entry_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup_res_type *to_cxi_cfg_rgroup_res_type(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rgroup_res_type, group);
+}
+
+static ssize_t cxi_cfg_rgroup_res_type_max_show(struct config_item *item,
+						char *page)
+{
+	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
+	struct cxi_resource_entry *entry;
+	int rc;
+
+	rgroup_res_type = to_cxi_cfg_rgroup_res_type(item);
+	rc = cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
+					   cxi_resource_str_to_type(rgroup_res_type->name),
+					   &entry);
+	if (rc != 0) {
+		pr_debug("Error: Resource entry not yet created for the resource type\n");
+		pr_debug("Error: Set the max file first and then the reserved file to create the resource type\n");
+		return -EINVAL;
+	}
+
+	return sprintf(page, "%ld\n", entry->limits.max);
+}
+
+static ssize_t cxi_cfg_rgroup_res_type_max_store(struct config_item *item,
+						 const char *page,
+						 size_t count)
+{
+	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
+	struct cxi_resource_entry *entry;
+	int rc;
+
+	rgroup_res_type = to_cxi_cfg_rgroup_res_type(item);
+
+	rc = cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
+					   cxi_resource_str_to_type(rgroup_res_type->name),
+					   &entry);
+	if (rc == 0) {
+		pr_debug("Error: Given resource type has already been added\n");
+		return -EINVAL;
+	}
+
+	rc = kstrtoint(page, 0, &rgroup_res_type->max);
+	if (rc)
+		return rc;
+
+	pr_debug("resource max value set to: %d\n", rgroup_res_type->max);
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rgroup_res_type_reserved_show(struct config_item *item,
+						     char *page)
+{
+	int rc;
+	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
+	struct cxi_resource_entry *entry;
+
+	rgroup_res_type = to_cxi_cfg_rgroup_res_type(item);
+
+	rc = cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
+					   cxi_resource_str_to_type(rgroup_res_type->name),
+					   &entry);
+	if (rc != 0) {
+		pr_debug("Error: Resource entry not found for the resource type\n");
+		return -EINVAL;
+	}
+
+	return sprintf(page, "%ld\n", entry->limits.reserved);
+}
+
+static ssize_t cxi_cfg_rgroup_res_type_reserved_store(struct config_item *item,
+						      const char *page,
+						      size_t count)
+{
+	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
+	int rc;
+	enum cxi_resource_type e_type;
+	struct cxi_resource_limits limits = {};
+
+	rgroup_res_type = to_cxi_cfg_rgroup_res_type(item);
+
+	rc = kstrtoint(page, 0, &rgroup_res_type->reserved);
+	if (rc)
+		return rc;
+
+	e_type = cxi_resource_str_to_type(rgroup_res_type->name);
+
+	limits.max = rgroup_res_type->max;
+	limits.reserved = rgroup_res_type->reserved;
+
+	rc = cxi_rgroup_add_resource(rgroup_res_type->rgroup, e_type, &limits);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rgroup_res_type_in_use_show(struct config_item *item,
+						   char *page)
+{
+	struct cxi_cfg_rgroup_res_type *rgroup_res_type;
+	struct cxi_resource_entry *entry;
+	int rc;
+
+	rgroup_res_type = to_cxi_cfg_rgroup_res_type(item);
+
+	rc = cxi_rgroup_get_resource_entry(rgroup_res_type->rgroup,
+					   cxi_resource_str_to_type(rgroup_res_type->name),
+					   &entry);
+	if (rc != 0) {
+		pr_debug("Error: Given resource type has not yet been added\n");
+		return -EINVAL;
+	}
+
+	return sprintf(page, "%ld\n", entry->limits.in_use);
+}
+
+static void cxi_cfg_rgroup_res_type_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rgroup_res_type, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_rgroup_res_type_, reserved);
+CONFIGFS_ATTR(cxi_cfg_rgroup_res_type_, max);
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_res_type_, in_use);
+
+static struct configfs_attribute *cxi_cfg_rgroup_res_type_attrs[] = {
+	&cxi_cfg_rgroup_res_type_attr_reserved,
+	&cxi_cfg_rgroup_res_type_attr_max,
+	&cxi_cfg_rgroup_res_type_attr_in_use,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_res_type_item_ops = {
+	.release     = cxi_cfg_rgroup_res_type_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_res_type_type = {
+	.ct_attrs       = cxi_cfg_rgroup_res_type_attrs,
+	.ct_item_ops    = &cxi_cfg_rgroup_res_type_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup_res_type *alloc_dev_rgroup_res_type(const char *name)
+{
+	struct cxi_cfg_rgroup_res_type *dev_dir;
+
+	dev_dir = kzalloc(sizeof(*dev_dir), GFP_KERNEL);
+	if (!dev_dir)
+		return NULL;
+
+	strscpy(dev_dir->name, name, sizeof(dev_dir->name));
+
+	config_group_init_type_name(&dev_dir->group,
+				    dev_dir->name,
+				    &cxi_cfg_rgroup_res_type_type);
+
+	return dev_dir;
+}
+
+static struct
+config_group *cxi_cfg_rgroup_res_make_group(struct config_group *group,
+					    const char *name)
+{
+	struct cxi_cfg_rgroup_res_type *res_type;
+	struct cxi_cfg_rgroup_res *res;
+	enum cxi_resource_type e_type;
+
+	e_type = cxi_resource_str_to_type(name);
+	if (e_type == CXI_RESOURCE_MAX) {
+		pr_debug("Unknown resource name %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	res_type = alloc_dev_rgroup_res_type(name);
+	if (!res_type) {
+		pr_debug("Failed to alloc memory for configfs resource types");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	res = container_of(group, struct cxi_cfg_rgroup_res, group);
+	if (!res) {
+		pr_debug("No parent resource group found\n");
+		kfree(res_type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	res_type->max = resource_max[e_type];
+	res_type->reserved = 0;
+	res_type->rgroup = res->rgroup;
+
+	return &res_type->group;
+}
+
+static void
+cxi_cfg_rgroup_res_drop_item(struct config_group *group,
+			     struct config_item *item)
+{
+	struct config_group *parent_group;
+	int rc;
+	struct cxi_cfg_rgroup *rgp;
+	struct cxi_cfg_rgroup_res_type *res_type;
+
+	parent_group = get_parent_config_group(group);
+
+	rgp = container_of(parent_group, struct cxi_cfg_rgroup, group);
+
+	res_type = container_of(to_config_group(item),
+				struct cxi_cfg_rgroup_res_type,
+				group);
+
+	/*
+	 * For accidental deletion of a configfs resource type directory which is
+	 * enabled. In the future a different approach will be taken to handle
+	 * accidental deletion by user
+	 */
+	if (cxi_rgroup_is_enabled(rgp->rgroup))
+		cxi_rgroup_disable(rgp->rgroup);
+
+	rc = cxi_rgroup_delete_resource(res_type->rgroup,
+					cxi_resource_str_to_type(item->ci_name));
+
+	pr_debug("Resource group resource deletion rc = %d\n", rc);
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rgroup_res_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rgroup_res, group.cg_item));
+}
+
+static struct configfs_group_operations cxi_cfg_rgroup_res_ops = {
+	.make_group     = cxi_cfg_rgroup_res_make_group,
+	.drop_item      = cxi_cfg_rgroup_res_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_res_item_ops = {
+	.release     = cxi_cfg_rgroup_res_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_res_type = {
+	.ct_group_ops   = &cxi_cfg_rgroup_res_ops,
+	.ct_item_ops    = &cxi_cfg_rgroup_res_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup_attr *to_cxi_cfg_rgroup_attr(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rgroup_attr, group);
+}
+
+static ssize_t cxi_cfg_rgroup_attr_name_show(struct config_item *item,
+					     char *page)
+{
+	struct cxi_cfg_rgroup_attr *rgroup_attr;
+
+	rgroup_attr = to_cxi_cfg_rgroup_attr(item);
+
+	return sprintf(page, "%s\n", cxi_rgroup_name(rgroup_attr->rgroup));
+}
+
+static ssize_t cxi_cfg_rgroup_attr_cntr_pool_id_show(struct config_item *item,
+						     char *page)
+{
+	struct cxi_cfg_rgroup_attr *rgroup_attr;
+
+	rgroup_attr = to_cxi_cfg_rgroup_attr(item);
+
+	return sprintf(page, "%u\n",
+		       cxi_rgroup_cntr_pool_id(rgroup_attr->rgroup));
+}
+
+static ssize_t cxi_cfg_rgroup_attr_system_service_show(struct config_item *item,
+						       char *page)
+{
+	struct cxi_cfg_rgroup_attr *rgroup_attr;
+
+	rgroup_attr = to_cxi_cfg_rgroup_attr(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 cxi_rgroup_system_service(rgroup_attr->rgroup) ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_rgroup_attr_lnis_per_rgid_show(struct config_item *item,
+						      char *page)
+{
+	struct cxi_cfg_rgroup_attr *rgroup_attr;
+
+	rgroup_attr = to_cxi_cfg_rgroup_attr(item);
+
+	return sprintf(page, "%d\n", cxi_rgroup_lnis_per_rgid(rgroup_attr->rgroup));
+}
+
+static void cxi_cfg_rgroup_attr_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rgroup_attr, group.cg_item));
+}
+
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_attr_, name);
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_attr_, cntr_pool_id);
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_attr_, system_service);
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_attr_, lnis_per_rgid);
+
+static struct configfs_attribute *cxi_cfg_rgroup_attr_attrs[] = {
+	&cxi_cfg_rgroup_attr_attr_name,
+	&cxi_cfg_rgroup_attr_attr_cntr_pool_id,
+	&cxi_cfg_rgroup_attr_attr_system_service,
+	&cxi_cfg_rgroup_attr_attr_lnis_per_rgid,
+	NULL,
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_attr_item_ops = {
+	.release     = cxi_cfg_rgroup_attr_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_attr_type = {
+	.ct_attrs       = cxi_cfg_rgroup_attr_attrs,
+	.ct_item_ops    = &cxi_cfg_rgroup_attr_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup_state *to_cxi_cfg_rgroup_state(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rgroup_state, group);
+}
+
+static ssize_t cxi_cfg_rgroup_state_enabled_show(struct config_item *item,
+						 char *page)
+{
+	struct cxi_cfg_rgroup_state *rgroup_state;
+
+	rgroup_state = to_cxi_cfg_rgroup_state(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 cxi_rgroup_is_enabled(rgroup_state->rgroup) ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_rgroup_state_enabled_store(struct config_item *item,
+						  const char *page,
+						  size_t count)
+{
+	struct cxi_cfg_rgroup_state *rgroup_state;
+	bool b_val;
+
+	if (kstrtobool(page, &b_val))
+		return -EINVAL;
+
+	rgroup_state = to_cxi_cfg_rgroup_state(item);
+
+	if (b_val) {
+		cxi_rgroup_enable(rgroup_state->rgroup);
+	} else {
+		cxi_rgroup_disable(rgroup_state->rgroup);
+	}
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rgroup_state_refcount_show(struct config_item *item,
+						  char *page)
+{
+	struct cxi_cfg_rgroup_state *rgroup_state;
+
+	rgroup_state = to_cxi_cfg_rgroup_state(item);
+
+	return sprintf(page, "%d\n", cxi_rgroup_refcount(rgroup_state->rgroup));
+}
+
+static void cxi_cfg_rgroup_state_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rgroup_state, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_rgroup_state_, enabled);
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_state_, refcount);
+
+static struct configfs_attribute *cxi_cfg_rgroup_state_attrs[] = {
+	&cxi_cfg_rgroup_state_attr_enabled,
+	&cxi_cfg_rgroup_state_attr_refcount,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_state_item_ops = {
+	.release     = cxi_cfg_rgroup_state_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_state_type = {
+	.ct_attrs       = cxi_cfg_rgroup_state_attrs,
+	.ct_item_ops    = &cxi_cfg_rgroup_state_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup_ac_entry *alloc_dev_rgroup_ac_entry(const char *name)
+{
+	struct cxi_cfg_rgroup_ac_entry *ac_entry_dir;
+
+	ac_entry_dir = kzalloc(sizeof(*ac_entry_dir),
+			       GFP_KERNEL);
+	if (!ac_entry_dir)
+		return NULL;
+
+	strscpy(ac_entry_dir->name, name, sizeof(ac_entry_dir->name));
+
+	config_group_init_type_name(&ac_entry_dir->group,
+				    ac_entry_dir->name,
+				    &cxi_cfg_rgroup_ac_entry_type);
+
+	return ac_entry_dir;
+}
+
+static struct cxi_cfg_rgroup_res *alloc_dev_rgroup_res(const char *name)
+{
+	struct cxi_cfg_rgroup_res *p_res;
+
+	p_res = kzalloc(sizeof(*p_res), GFP_KERNEL);
+	if (!p_res)
+		return NULL;
+
+	strscpy(p_res->name, name, sizeof(p_res->name));
+
+	config_group_init_type_name(&p_res->group,
+				    p_res->name,
+				    &cxi_cfg_rgroup_res_type);
+
+	return p_res;
+}
+
+static struct cxi_cfg_rgroup_state *alloc_dev_rgroup_state(const char *name)
+{
+	struct cxi_cfg_rgroup_state *rgp_st;
+
+	rgp_st = kzalloc(sizeof(*rgp_st), GFP_KERNEL);
+	if (!rgp_st)
+		return NULL;
+
+	strscpy(rgp_st->name, name, sizeof(rgp_st->name));
+
+	config_group_init_type_name(&rgp_st->group,
+				    rgp_st->name,
+				    &cxi_cfg_rgroup_state_type);
+
+	return rgp_st;
+}
+
+static struct cxi_cfg_rgroup_attr *alloc_dev_rgroup_attr(const char *name)
+{
+	struct cxi_cfg_rgroup_attr *p_attr;
+
+	p_attr = kzalloc(sizeof(*p_attr), GFP_KERNEL);
+	if (!p_attr)
+		return NULL;
+
+	strscpy(p_attr->name, name, sizeof(p_attr->name));
+
+	config_group_init_type_name(&p_attr->group,
+				    p_attr->name,
+				    &cxi_cfg_rgroup_attr_type);
+
+	return p_attr;
+}
+
+static struct
+config_group *cxi_cfg_rgroup_make_group(struct config_group *group,
+					const char *name)
+{
+	struct cxi_cfg_rgroup *rgp = container_of(group,
+						  struct cxi_cfg_rgroup,
+						  group);
+	struct cxi_cfg_rgroup_state *rgp_state;
+	struct cxi_cfg_rgroup_attr *rgp_attr;
+	struct cxi_cfg_rgroup_ac_entry *ac_entry;
+	struct cxi_cfg_rgroup_res *rgp_res;
+
+	if (strncmp(name, "resources", sizeof("resources") - 1) == 0) {
+		rgp_res = alloc_dev_rgroup_res("resources");
+		if (!rgp_res) {
+			pr_debug("unable to alloc rgroup resources");
+			return ERR_PTR(-EINVAL);
+		}
+		rgp_res->rgroup = rgp->rgroup;
+		rgp->rgp_res = rgp_res;
+		rgp->rgp_res->cdev = rgp->cdev;
+
+		return &rgp->rgp_res->group;
+	}
+
+	if (strncmp(name, "attr", sizeof("attr") - 1) == 0) {
+		rgp_attr = alloc_dev_rgroup_attr("attr");
+		if (!rgp_attr) {
+			pr_debug("unable to alloc rgroup attr");
+			return ERR_PTR(-EINVAL);
+		}
+
+		rgp_attr->rgroup = rgp->rgroup;
+		rgp->rgp_attr = rgp_attr;
+		rgp->rgp_attr->cdev = rgp->cdev;
+
+		return &rgp->rgp_attr->group;
+	}
+
+	if (strncmp(name, "state", sizeof("state") - 1) == 0) {
+		rgp_state = alloc_dev_rgroup_state("state");
+		if (!rgp_state) {
+			pr_debug("unable to alloc rgroup state");
+			return ERR_PTR(-EINVAL);
+		}
+		rgp_state->rgroup = rgp->rgroup;
+		rgp->rgp_state = rgp_state;
+		rgp->rgp_state->cdev = rgp->cdev;
+
+		return &rgp->rgp_state->group;
+	}
+
+	if (strncmp(name, "ac-entry", sizeof("ac-entry") - 1) == 0) {
+		ac_entry = alloc_dev_rgroup_ac_entry("ac-entry");
+		if (!ac_entry) {
+			pr_debug("unable to alloc rgroup ac-entry");
+			return ERR_PTR(-EINVAL);
+		}
+		ac_entry->rgroup = rgp->rgroup;
+		rgp->ac_entry = ac_entry;
+
+		return &rgp->ac_entry->group;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static void
+cxi_cfg_rgroup_drop_item(struct config_group *group,
+			 struct config_item *item)
+{
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rgroup_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rgroup, group.cg_item));
+}
+
+static struct cxi_cfg_rgroup *to_cxi_cfg_rgroup(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rgroup, group);
+}
+
+static ssize_t cxi_cfg_rgroup_id_show(struct config_item *item,
+				      char *page)
+{
+	struct cxi_cfg_rgroup *rgp = to_cxi_cfg_rgroup(item);
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", rgp->rgroup->id);
+}
+
+CONFIGFS_ATTR_RO(cxi_cfg_rgroup_, id);
+
+static struct configfs_attribute *cxi_cfg_rgroup_attrs[] = {
+	&cxi_cfg_rgroup_attr_id,
+	NULL,
+};
+
+static struct configfs_group_operations cxi_cfg_rgroup_ops = {
+	.make_group    = cxi_cfg_rgroup_make_group,
+	.drop_item     = cxi_cfg_rgroup_drop_item
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_item_ops = {
+	.release     = cxi_cfg_rgroup_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_type = {
+	.ct_group_ops   = &cxi_cfg_rgroup_ops,
+	.ct_attrs       = cxi_cfg_rgroup_attrs,
+	.ct_item_ops    = &cxi_cfg_rgroup_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rgroup *alloc_dev_rgroup(const char *name)
+{
+	struct cxi_cfg_rgroup *rgp;
+
+	rgp = kzalloc(sizeof(*rgp), GFP_KERNEL);
+	if (!rgp)
+		return NULL;
+
+	strscpy(rgp->name, name, sizeof(rgp->name));
+
+	config_group_init_type_name(&rgp->group,
+				    rgp->name,
+				    &cxi_cfg_rgroup_type);
+
+	return rgp;
+}
+
+static struct
+config_group *cxi_cfg_rgroup_dir_make_group(struct config_group *group,
+					    const char *name)
+{
+	struct cxi_cfg_rgroup_dir *dev_rgp;
+	struct cxi_cfg_rgroup *rgp;
+	struct cxi_rgroup *rgroup;
+	struct cxi_rgroup_attr attr = {
+		.cntr_pool_id = 0,
+		.name = {'\0'},
+		.system_service = false,
+		.lnis_per_rgid = CXI_DEFAULT_LNIS_PER_RGID
+	};
+
+	if (strlen(name) > CONFIGFS_DIR_LEN - 1)
+		return ERR_PTR(-EINVAL);
+
+	dev_rgp = container_of(group, struct cxi_cfg_rgroup_dir, group);
+	rgp = alloc_dev_rgroup(name);
+	if (!rgp) {
+		pr_debug("Failed to alloc memory for configfs rgroup dir");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	rgp->cdev = dev_rgp->cdev;
+	strscpy(attr.name, name, sizeof(attr.name));
+	rgroup = cxi_dev_alloc_rgroup(dev_rgp->cdev,
+				      &attr);
+	if (IS_ERR(rgroup)) {
+		kfree(rgp);
+		return ERR_PTR(PTR_ERR(rgroup));
+	}
+	rgp->rgroup = rgroup;
+
+	return &rgp->group;
+}
+
+static void
+cxi_cfg_rgroup_dir_drop_item(struct config_group *group,
+			     struct config_item *item)
+{
+	struct cxi_cfg_rgroup *rgp;
+
+	rgp = container_of(item, struct cxi_cfg_rgroup, group.cg_item);
+
+	/*
+	 * For accidental deletion of resource group directory
+	 * by configfs user. In the future we will employ a
+	 * different approach to handle accidental deletion.
+	 */
+	cxi_rgroup_dec_refcount(rgp->rgroup);
+
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rgroup_dir_free(struct config_item *item)
+{
+	struct cxi_cfg_rgroup_dir *rgp_dir;
+
+	rgp_dir = container_of(item, struct cxi_cfg_rgroup_dir,
+			       group.cg_item);
+	kfree(rgp_dir);
+}
+
+static struct configfs_group_operations cxi_cfg_rgroup_dir_ops = {
+	.make_group     = cxi_cfg_rgroup_dir_make_group,
+	.drop_item      = cxi_cfg_rgroup_dir_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_rgroup_dir_item_ops = {
+	.release     = cxi_cfg_rgroup_dir_free,
+};
+
+static const struct config_item_type cxi_cfg_rgroup_dir_type = {
+	.ct_group_ops   = &cxi_cfg_rgroup_dir_ops,
+	.ct_item_ops    = &cxi_cfg_rgroup_dir_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static void cxi_cfg_group_free(struct config_item *item)
+{
+	struct cxi_cfg_group_item *grp_dir;
+
+	grp_dir = container_of(item, struct cxi_cfg_group_item,
+			       group.cg_item);
+	kfree(grp_dir);
+}
+
+static struct configfs_item_operations cxi_cfg_group_item_ops = {
+	.release     = cxi_cfg_group_free,
+};
+
+static const struct config_item_type cxi_cfg_group_type = {
+	.ct_item_ops    = &cxi_cfg_group_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct configfs_subsystem cxi_cfg_group_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "cxi",
+			.ci_type = &cxi_cfg_group_type,
+		},
+	},
+};
+
+static struct cxi_cfg_group_item *alloc_dev_subdir(const char *name)
+{
+	struct cxi_cfg_group_item *dev_dir;
+
+	dev_dir = kzalloc(sizeof(*dev_dir), GFP_KERNEL);
+	if (!dev_dir)
+		return NULL;
+
+	strscpy(dev_dir->name, name, sizeof(dev_dir->name));
+
+	config_group_init_type_name(&dev_dir->group,
+				    dev_dir->name,
+				    &cxi_cfg_group_type);
+
+	return dev_dir;
+}
+
+static struct cxi_cfg_rgroup_dir *alloc_dev_attr1(const char *name)
+{
+	struct cxi_cfg_rgroup_dir *dev_rgp;
+
+	dev_rgp = kzalloc(sizeof(*dev_rgp), GFP_KERNEL);
+	if (!dev_rgp)
+		return NULL;
+
+	strscpy(dev_rgp->name, name, sizeof(dev_rgp->name));
+
+	config_group_init_type_name(&dev_rgp->group,
+				    dev_rgp->name,
+				    &cxi_cfg_rgroup_dir_type);
+
+	return dev_rgp;
+}
+
+static struct cxi_cfg_tx_prof_ac_entry_sub *to_cxi_cfg_tx_prof_ac_entry_sub(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_tx_prof_ac_entry_sub, group);
+}
+
+static ssize_t cxi_cfg_tx_prof_ac_entry_sub_type_show(struct config_item *item,
+						      char *page)
+{
+	struct cxi_cfg_tx_prof_ac_entry_sub *tx_prof_ac_entry_sub;
+	int rc;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	tx_prof_ac_entry_sub = to_cxi_cfg_tx_prof_ac_entry_sub(item);
+
+	rc = cxi_tx_profile_get_ac_entry_data(tx_prof_ac_entry_sub->tx_profile,
+					      tx_prof_ac_entry_sub->id,
+					      &ac_type,
+					      &ac_data);
+	if (rc)
+		return rc;
+
+	return sprintf(page, "%d\n", ac_type);
+}
+
+static ssize_t cxi_cfg_tx_prof_ac_entry_sub_type_store(struct config_item *item,
+						       const char *page,
+						       size_t count)
+{
+	struct cxi_cfg_tx_prof_ac_entry_sub *ac_entry_sub;
+	int rc;
+	enum cxi_ac_type ac_type_val;
+	uid_t uid;
+	gid_t gid;
+	unsigned int netns;
+	unsigned int ac_entry_id;
+
+	ac_entry_sub = to_cxi_cfg_tx_prof_ac_entry_sub(item);
+	if (!ac_entry_sub->tx_profile) {
+		pr_debug("Unable to get tx profile reference\n");
+		return -EINVAL;
+	}
+
+	rc = kstrtouint(page, 0, (unsigned int *)&ac_type_val);
+	if (rc)
+		return rc;
+
+	if (ac_type_val == CXI_AC_UID)
+		uid = ac_entry_sub->ac_data.uid;
+	else if (ac_type_val == CXI_AC_GID)
+		gid = ac_entry_sub->ac_data.gid;
+	else if (ac_type_val == CXI_AC_NETNS)
+		netns = ac_entry_sub->ac_data.netns;
+	else if (ac_type_val == CXI_AC_OPEN)
+		pr_debug("Setting type to CXI_AC_OPEN\n");
+	else
+		return -EINVAL;
+
+	rc = cxi_tx_profile_add_ac_entry(ac_entry_sub->tx_profile,
+					 ac_type_val,
+					 uid,
+					 gid,
+					 netns,
+					 &ac_entry_id);
+	if (rc < 0) {
+		pr_debug("Unable to add ac entry to tx profile: err val %d\n", rc);
+		return rc;
+	}
+
+	ac_entry_sub->id = ac_entry_id;
+	ac_entry_sub->ac_type = ac_type_val;
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_ac_entry_sub_data_show(struct config_item *item,
+						      char *page)
+{
+	struct cxi_cfg_tx_prof_ac_entry_sub *tx_prof_ac_entry_sub;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	int rc;
+
+	tx_prof_ac_entry_sub = to_cxi_cfg_tx_prof_ac_entry_sub(item);
+
+	rc = cxi_tx_profile_get_ac_entry_data(tx_prof_ac_entry_sub->tx_profile,
+					      tx_prof_ac_entry_sub->id,
+					      &ac_type,
+					      &ac_data);
+	if (rc)
+		return rc;
+
+	if (ac_type == CXI_AC_UID)
+		return sprintf(page, "%d\n", ac_data.uid);
+	else if (ac_type == CXI_AC_GID)
+		return sprintf(page, "%d\n", ac_data.gid);
+	else if (ac_type == CXI_AC_NETNS)
+		return sprintf(page, "%d\n", ac_data.netns);
+	else if (ac_type == CXI_AC_OPEN)
+		return sprintf(page, "%d\n", CXI_AC_OPEN);
+
+	return -EINVAL;
+}
+
+static ssize_t cxi_cfg_tx_prof_ac_entry_sub_data_store(struct config_item *item,
+						       const char *page,
+						       size_t count)
+{
+	struct cxi_cfg_tx_prof_ac_entry_sub *ac_entry_sub;
+	int rc;
+	unsigned int ac_data_val;
+
+	ac_entry_sub = to_cxi_cfg_tx_prof_ac_entry_sub(item);
+
+	rc = kstrtouint(page, 0, &ac_data_val);
+	if (rc)
+		return rc;
+
+	if (ac_entry_sub->ac_type == CXI_AC_UID) {
+		ac_entry_sub->ac_data.uid = ac_data_val;
+		return count;
+	} else if (ac_entry_sub->ac_type == CXI_AC_GID) {
+		ac_entry_sub->ac_data.gid = ac_data_val;
+		return count;
+	} else if (ac_entry_sub->ac_type == CXI_AC_NETNS) {
+		ac_entry_sub->ac_data.netns = ac_data_val;
+		return count;
+	}
+
+	return -EINVAL;
+}
+
+static void cxi_cfg_tx_prof_ac_entry_sub_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_tx_prof_ac_entry_sub, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_tx_prof_ac_entry_sub_, type);
+CONFIGFS_ATTR(cxi_cfg_tx_prof_ac_entry_sub_, data);
+
+static struct configfs_attribute *cxi_cfg_tx_prof_ac_entry_sub_attrs[] = {
+	&cxi_cfg_tx_prof_ac_entry_sub_attr_type,
+	&cxi_cfg_tx_prof_ac_entry_sub_attr_data,
+	NULL,
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_ac_entry_sub_item_ops = {
+	.release     = cxi_cfg_tx_prof_ac_entry_sub_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_ac_entry_sub_type = {
+	.ct_attrs       = cxi_cfg_tx_prof_ac_entry_sub_attrs,
+	.ct_item_ops    = &cxi_cfg_tx_prof_ac_entry_sub_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof_ac_entry_sub *alloc_dev_tx_prof_ac_entry_sub(const char *name)
+{
+	struct cxi_cfg_tx_prof_ac_entry_sub *tx_prof_ac_entry_sub;
+
+	tx_prof_ac_entry_sub = kzalloc(sizeof(*tx_prof_ac_entry_sub), GFP_KERNEL);
+	if (!tx_prof_ac_entry_sub)
+		return NULL;
+
+	strscpy(tx_prof_ac_entry_sub->name, name, sizeof(tx_prof_ac_entry_sub->name));
+
+	config_group_init_type_name(&tx_prof_ac_entry_sub->group,
+				    tx_prof_ac_entry_sub->name,
+				    &cxi_cfg_tx_prof_ac_entry_sub_type);
+
+	return tx_prof_ac_entry_sub;
+}
+
+static struct
+config_group *cxi_cfg_tx_prof_ac_entry_make_group(struct config_group *group,
+						  const char *name)
+{
+	struct cxi_cfg_tx_prof_ac_entry *tx_prof_ac_entry;
+	struct cxi_cfg_tx_prof_ac_entry_sub *tx_prof_ac_entry_sub;
+
+	if (strlen(name) > CONFIGFS_DIR_LEN - 1)
+		return ERR_PTR(-EINVAL);
+
+	tx_prof_ac_entry = container_of(group, struct cxi_cfg_tx_prof_ac_entry, group);
+
+	tx_prof_ac_entry_sub = alloc_dev_tx_prof_ac_entry_sub(name);
+	if (!tx_prof_ac_entry_sub) {
+		pr_debug("Memory allocation failed for ac entry group\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	tx_prof_ac_entry_sub->ac_type = CXI_AC_UID;
+	tx_prof_ac_entry_sub->ac_data.uid = 0;
+	tx_prof_ac_entry_sub->tx_profile = tx_prof_ac_entry->tx_profile;
+
+	return &tx_prof_ac_entry_sub->group;
+}
+
+static void
+cxi_cfg_tx_prof_ac_entry_drop_item(struct config_group *group,
+				   struct config_item *item)
+{
+	struct cxi_cfg_tx_prof_ac_entry_sub *tx_prof_ac_entry_sub;
+	int rc;
+	unsigned int ac_entry_id;
+
+	tx_prof_ac_entry_sub = container_of(item, struct cxi_cfg_tx_prof_ac_entry_sub, group.cg_item);
+
+	if (tx_prof_ac_entry_sub->ac_type == CXI_AC_UID) {
+		rc = cxi_tx_profile_get_ac_entry_id_by_data(tx_prof_ac_entry_sub->tx_profile,
+							    CXI_AC_UID,
+							    &tx_prof_ac_entry_sub->ac_data,
+							    &ac_entry_id);
+
+		pr_debug("Getting an entry info type uid rc = %d\n", rc);
+	} else if (tx_prof_ac_entry_sub->ac_type == CXI_AC_GID) {
+		rc = cxi_tx_profile_get_ac_entry_id_by_data(tx_prof_ac_entry_sub->tx_profile,
+							    CXI_AC_GID,
+							    &tx_prof_ac_entry_sub->ac_data,
+							    &ac_entry_id);
+
+		pr_debug("Getting an entry info type gid rc = %d\n", rc);
+	} else if (tx_prof_ac_entry_sub->ac_type == CXI_AC_NETNS) {
+		rc = cxi_tx_profile_get_ac_entry_id_by_data(tx_prof_ac_entry_sub->tx_profile,
+							    CXI_AC_NETNS,
+							    &tx_prof_ac_entry_sub->ac_data,
+							    &ac_entry_id);
+
+		pr_debug("Getting an entry info type netns rc = %d\n", rc);
+	} else {
+		rc = cxi_tx_profile_get_ac_entry_id_by_data(tx_prof_ac_entry_sub->tx_profile,
+							    CXI_AC_OPEN,
+							    NULL,
+							    &ac_entry_id);
+		pr_debug("Getting an entry info type open rc = %d\n", rc);
+	}
+
+	if (!rc)
+		cxi_tx_profile_remove_ac_entry(tx_prof_ac_entry_sub->tx_profile,
+					       ac_entry_id);
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_tx_prof_ac_entry_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_tx_prof_ac_entry, group.cg_item));
+}
+
+static struct configfs_group_operations cxi_cfg_tx_prof_ac_entry_ops = {
+	.make_group     = cxi_cfg_tx_prof_ac_entry_make_group,
+	.drop_item      = cxi_cfg_tx_prof_ac_entry_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_ac_entry_item_ops = {
+	.release     = cxi_cfg_tx_prof_ac_entry_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_ac_entry_type = {
+	.ct_group_ops   = &cxi_cfg_tx_prof_ac_entry_ops,
+	.ct_item_ops    = &cxi_cfg_tx_prof_ac_entry_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof_state *to_cxi_cfg_tx_prof_state(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_tx_prof_state, group);
+}
+
+static ssize_t cxi_cfg_tx_prof_state_enabled_show(struct config_item *item,
+						  char *page)
+{
+	struct cxi_cfg_tx_prof_state *tx_prof_state;
+	struct cxi_tx_attr tx_attr;
+	struct cxi_rxtx_profile_state state;
+	int rc;
+
+	tx_prof_state = to_cxi_cfg_tx_prof_state(item);
+
+	rc = cxi_tx_profile_get_info(tx_prof_state->cdev,
+				     tx_prof_state->tx_profile,
+				     &tx_attr,
+				     &state);
+	if (rc < 0) {
+		pr_debug("Unable to get tx-profile info rc = %d\n", rc);
+		return rc;
+	}
+
+	return scnprintf(page, PAGE_SIZE, "%s\n", state.enable ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_tx_prof_state_enabled_store(struct config_item *item,
+						   const char *page,
+						   size_t count)
+{
+	struct cxi_cfg_tx_prof_state *tx_prof_state;
+	int rc;
+	bool b_val;
+
+	if (kstrtobool(page, &b_val))
+		return -EINVAL;
+
+	tx_prof_state = to_cxi_cfg_tx_prof_state(item);
+
+	if (b_val) {
+		rc = cxi_tx_profile_enable(tx_prof_state->cdev,
+					   tx_prof_state->tx_profile);
+		if (rc)
+			return rc;
+	} else {
+		cxi_tx_profile_disable(tx_prof_state->cdev,
+				       tx_prof_state->tx_profile);
+	}
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_state_refcount_show(struct config_item *item,
+						   char *page)
+{
+	struct cxi_cfg_tx_prof_state *tx_prof_state;
+	struct cxi_tx_attr tx_attr;
+	struct cxi_rxtx_profile_state state;
+	int rc;
+
+	tx_prof_state = to_cxi_cfg_tx_prof_state(item);
+
+	rc = cxi_tx_profile_get_info(tx_prof_state->cdev,
+				     tx_prof_state->tx_profile,
+				     &tx_attr,
+				     &state);
+	if (rc < 0) {
+		pr_debug("Unable to get rx-profile info rc = %d\n", rc);
+		return rc;
+	}
+
+	return sprintf(page, "%d\n", refcount_read(&state.refcount));
+}
+
+static void cxi_cfg_tx_prof_state_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_tx_prof_state, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_tx_prof_state_, enabled);
+CONFIGFS_ATTR_RO(cxi_cfg_tx_prof_state_, refcount);
+
+static struct configfs_attribute *cxi_cfg_tx_prof_state_attrs[] = {
+	&cxi_cfg_tx_prof_state_attr_enabled,
+	&cxi_cfg_tx_prof_state_attr_refcount,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_state_item_ops = {
+	.release     = cxi_cfg_tx_prof_state_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_state_type = {
+	.ct_attrs       = cxi_cfg_tx_prof_state_attrs,
+	.ct_item_ops    = &cxi_cfg_tx_prof_state_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof_state *alloc_dev_tx_prof_state(const char *name)
+{
+	struct cxi_cfg_tx_prof_state *tx_prof_state;
+
+	tx_prof_state = kzalloc(sizeof(*tx_prof_state), GFP_KERNEL);
+	if (!tx_prof_state)
+		return NULL;
+
+	strscpy(tx_prof_state->name, name, sizeof(tx_prof_state->name));
+
+	config_group_init_type_name(&tx_prof_state->group,
+				    tx_prof_state->name,
+				    &cxi_cfg_tx_prof_state_type);
+	return tx_prof_state;
+}
+
+static struct cxi_cfg_tx_prof_attr *to_cxi_cfg_tx_prof_attr(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_tx_prof_attr, group);
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_name_show(struct config_item *item,
+					      char *page)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 tx_prof_attr->tx_profile->profile_common.vni_attr.name);
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_match_show(struct config_item *item,
+					       char *page)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	struct cxi_tx_attr tx_attr;
+	struct cxi_rxtx_profile_state state;
+	int rc;
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+
+	rc = cxi_tx_profile_get_info(tx_prof_attr->cdev,
+				     tx_prof_attr->tx_profile,
+				     &tx_attr,
+				     &state);
+	if (rc < 0)
+		return rc;
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", tx_attr.vni_attr.match);
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_match_store(struct config_item *item,
+						const char *page,
+						size_t count)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	int rc;
+	struct cxi_tx_attr tx_attr = {};
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+
+	rc = kstrtou16(page, 0, &tx_prof_attr->match);
+	if (rc)
+		return rc;
+
+	tx_attr.vni_attr.match = tx_prof_attr->match;
+	tx_attr.vni_attr.ignore = tx_prof_attr->ignore;
+
+	strscpy(tx_attr.vni_attr.name,
+		tx_prof_attr->tx_profile->profile_common.vni_attr.name,
+		sizeof(tx_attr.vni_attr.name));
+
+	rc = cxi_dev_set_tx_profile_attr(tx_prof_attr->cdev,
+					 tx_prof_attr->tx_profile,
+					 &tx_attr);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_ignore_show(struct config_item *item,
+						char *page)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	int rc;
+	struct cxi_tx_attr tx_attr;
+	struct cxi_rxtx_profile_state state;
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+
+	rc = cxi_tx_profile_get_info(tx_prof_attr->cdev,
+				     tx_prof_attr->tx_profile,
+				     &tx_attr,
+				     &state);
+	if (rc < 0) {
+		pr_debug("Unable to get rx-profile info rc = %d\n", rc);
+		return rc;
+	}
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", tx_attr.vni_attr.ignore);
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_ignore_store(struct config_item *item,
+						 const char *page,
+						 size_t count)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	struct cxi_rxtx_profile_state state;
+	struct cxi_tx_attr tx_attr;
+	u16 ignore;
+	int rc;
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+	rc = kstrtou16(page, 0, &ignore);
+	if (rc)
+		return rc;
+
+	rc = cxi_tx_profile_get_info(tx_prof_attr->cdev,
+				     tx_prof_attr->tx_profile, &tx_attr, &state);
+	if (rc < 0)
+		return rc;
+	tx_attr.vni_attr.ignore = ignore;
+	rc = cxi_dev_set_tx_profile_attr(tx_prof_attr->cdev,
+					 tx_prof_attr->tx_profile, &tx_attr);
+	if (rc)
+		return rc;
+	tx_prof_attr->ignore = ignore;
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_exclusive_cp_show(struct config_item *item,
+						      char *page)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 cxi_tx_profile_exclusive_cp(tx_prof_attr->tx_profile) ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_tx_prof_attr_exclusive_cp_store(struct config_item *item,
+						       const char *page,
+						       size_t count)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	bool cp_val;
+	int rc;
+
+	if (kstrtobool(page, &cp_val))
+		return -EINVAL;
+
+	tx_prof_attr = to_cxi_cfg_tx_prof_attr(item);
+
+	rc = cxi_tx_profile_set_exclusive_cp(tx_prof_attr->tx_profile,
+					     cp_val);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static void cxi_cfg_tx_prof_attr_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_tx_prof_attr, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_tx_prof_attr_, ignore);
+CONFIGFS_ATTR(cxi_cfg_tx_prof_attr_, match);
+CONFIGFS_ATTR(cxi_cfg_tx_prof_attr_, exclusive_cp);
+CONFIGFS_ATTR_RO(cxi_cfg_tx_prof_attr_, name);
+
+static struct configfs_attribute *cxi_cfg_tx_prof_attr_attrs[] = {
+	&cxi_cfg_tx_prof_attr_attr_name,
+	&cxi_cfg_tx_prof_attr_attr_match,
+	&cxi_cfg_tx_prof_attr_attr_ignore,
+	&cxi_cfg_tx_prof_attr_attr_exclusive_cp,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_attr_item_ops = {
+	.release     = cxi_cfg_tx_prof_attr_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_attr_type = {
+	.ct_attrs       = cxi_cfg_tx_prof_attr_attrs,
+	.ct_item_ops    = &cxi_cfg_tx_prof_attr_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof_tc *to_cxi_cfg_tx_prof_tc(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_tx_prof_tc, group);
+}
+
+static void set_tc_bool_type(unsigned int tc_type,
+			     struct cxi_cfg_tx_prof_tc *tx_prof_tc,
+			     bool tc_bool)
+{
+	switch (tc_type) {
+	case CXI_TC_BEST_EFFORT:
+		tx_prof_tc->best_effort = tc_bool;
+		break;
+	case CXI_TC_DEDICATED_ACCESS:
+		tx_prof_tc->dedicated = tc_bool;
+		break;
+	case CXI_TC_LOW_LATENCY:
+		tx_prof_tc->low_latency = tc_bool;
+		break;
+	case CXI_TC_BULK_DATA:
+		tx_prof_tc->bulk_data = tc_bool;
+		break;
+	case CXI_TC_ETH:
+		tx_prof_tc->eth = tc_bool;
+		break;
+	}
+
+	cxi_tx_profile_set_tc(tx_prof_tc->tx_profile, tc_type, tc_bool);
+}
+
+#define cxi_cfg_tx_prof_set_tc_common(item, tc_type, page)			\
+	do {									\
+		struct cxi_cfg_tx_prof_tc *tx_prof_tc;				\
+		bool b_val;							\
+		if (kstrtobool(page, &b_val))					\
+			return -EINVAL;						\
+		tx_prof_tc = to_cxi_cfg_tx_prof_tc((item));			\
+		set_tc_bool_type((tc_type), tx_prof_tc, b_val);			\
+	} while (0)
+
+static ssize_t cxi_cfg_tx_prof_tc_best_effort_show(struct config_item *item,
+						   char *page)
+{
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof_tc = to_cxi_cfg_tx_prof_tc(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 tx_prof_tc->best_effort ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_best_effort_store(struct config_item *item,
+						    const char *page,
+						    size_t count)
+{
+	cxi_cfg_tx_prof_set_tc_common(item, CXI_TC_BEST_EFFORT, page);
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_dedicated_show(struct config_item *item,
+						 char *page)
+{
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof_tc = to_cxi_cfg_tx_prof_tc(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 tx_prof_tc->dedicated ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_dedicated_store(struct config_item *item,
+						  const char *page,
+						  size_t count)
+{
+	cxi_cfg_tx_prof_set_tc_common(item, CXI_TC_DEDICATED_ACCESS, page);
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_low_latency_show(struct config_item *item,
+						   char *page)
+{
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof_tc = to_cxi_cfg_tx_prof_tc(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 tx_prof_tc->low_latency ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_low_latency_store(struct config_item *item,
+						    const char *page,
+						    size_t count)
+{
+	cxi_cfg_tx_prof_set_tc_common(item, CXI_TC_LOW_LATENCY, page);
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_bulk_data_show(struct config_item *item,
+						 char *page)
+{
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof_tc = to_cxi_cfg_tx_prof_tc(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 tx_prof_tc->bulk_data ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_bulk_data_store(struct config_item *item,
+						  const char *page,
+						  size_t count)
+{
+	cxi_cfg_tx_prof_set_tc_common(item, CXI_TC_BULK_DATA, page);
+
+	return count;
+}
+
+static ssize_t cxi_cfg_tx_prof_tc_eth_show(struct config_item *item,
+					   char *page)
+{
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof_tc = to_cxi_cfg_tx_prof_tc(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 tx_prof_tc->eth ? "true" : "false");
+}
+
+static void cxi_cfg_tx_prof_tc_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_tx_prof_tc, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_tx_prof_tc_,  best_effort);
+CONFIGFS_ATTR(cxi_cfg_tx_prof_tc_,  dedicated);
+CONFIGFS_ATTR(cxi_cfg_tx_prof_tc_,  low_latency);
+CONFIGFS_ATTR(cxi_cfg_tx_prof_tc_,  bulk_data);
+CONFIGFS_ATTR_RO(cxi_cfg_tx_prof_tc_,  eth);
+
+static struct configfs_attribute *cxi_cfg_tx_prof_tc_attrs[] = {
+	&cxi_cfg_tx_prof_tc_attr_best_effort,
+	&cxi_cfg_tx_prof_tc_attr_dedicated,
+	&cxi_cfg_tx_prof_tc_attr_low_latency,
+	&cxi_cfg_tx_prof_tc_attr_bulk_data,
+	&cxi_cfg_tx_prof_tc_attr_eth,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_tc_item_ops = {
+	.release     = cxi_cfg_tx_prof_tc_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_tc_type = {
+	.ct_attrs       = cxi_cfg_tx_prof_tc_attrs,
+	.ct_item_ops    = &cxi_cfg_tx_prof_tc_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof_tc *alloc_dev_tx_prof_tc(const char *name)
+{
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof_tc = kzalloc(sizeof(*tx_prof_tc), GFP_KERNEL);
+	if (!tx_prof_tc)
+		return NULL;
+
+	strscpy(tx_prof_tc->name, name, sizeof(tx_prof_tc->name));
+
+	config_group_init_type_name(&tx_prof_tc->group,
+				    tx_prof_tc->name,
+				    &cxi_cfg_tx_prof_tc_type);
+
+	return tx_prof_tc;
+}
+
+static struct cxi_cfg_tx_prof_attr *alloc_dev_tx_prof_attr(const char *name)
+{
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+
+	tx_prof_attr = kzalloc(sizeof(*tx_prof_attr), GFP_KERNEL);
+	if (!tx_prof_attr)
+		return NULL;
+
+	strscpy(tx_prof_attr->name, name, sizeof(tx_prof_attr->name));
+
+	config_group_init_type_name(&tx_prof_attr->group,
+				    tx_prof_attr->name,
+				    &cxi_cfg_tx_prof_attr_type);
+
+	return tx_prof_attr;
+}
+
+static struct cxi_cfg_tx_prof_ac_entry *alloc_dev_tx_prof_ac_entry(const char *name)
+{
+	struct cxi_cfg_tx_prof_ac_entry *tx_prof_ac_entry;
+
+	tx_prof_ac_entry = kzalloc(sizeof(*tx_prof_ac_entry),
+				   GFP_KERNEL);
+	if (!tx_prof_ac_entry)
+		return NULL;
+
+	strscpy(tx_prof_ac_entry->name,
+		name,
+		sizeof(tx_prof_ac_entry->name));
+
+	config_group_init_type_name(&tx_prof_ac_entry->group,
+				    tx_prof_ac_entry->name,
+				    &cxi_cfg_tx_prof_ac_entry_type);
+
+	return tx_prof_ac_entry;
+}
+
+static struct
+config_group *cxi_cfg_tx_prof_make_group(struct config_group *group,
+					 const char *name)
+{
+	struct cxi_cfg_tx_prof *tx_prof;
+	struct cxi_cfg_tx_prof_state *tx_prof_state;
+	struct cxi_cfg_tx_prof_attr *tx_prof_attr;
+	struct cxi_cfg_tx_prof_ac_entry *tx_prof_ac_entry;
+	struct cxi_cfg_tx_prof_tc *tx_prof_tc;
+
+	tx_prof = container_of(group,
+			       struct cxi_cfg_tx_prof,
+			       group);
+
+	if (strncmp(name, "attr", sizeof("attr") - 1) == 0) {
+		tx_prof_attr = alloc_dev_tx_prof_attr("attr");
+		if (!tx_prof_attr)
+			return ERR_PTR(-ENOMEM);
+		tx_prof->tx_prof_attr = tx_prof_attr;
+		tx_prof->tx_prof_attr->cdev = tx_prof->cdev;
+		tx_prof_attr->tx_profile = tx_prof->tx_profile;
+		tx_prof->tx_prof_attr->cdev = tx_prof->cdev;
+
+		return &tx_prof->tx_prof_attr->group;
+	}
+
+	if (strncmp(name, "state", sizeof("state") - 1) == 0) {
+		tx_prof_state = alloc_dev_tx_prof_state("state");
+		if (!tx_prof_state)
+			return ERR_PTR(-ENOMEM);
+		tx_prof->tx_prof_state = tx_prof_state;
+		tx_prof_state->tx_profile = tx_prof->tx_profile;
+		tx_prof->tx_prof_state->cdev = tx_prof->cdev;
+
+		return &tx_prof->tx_prof_state->group;
+	}
+
+	if (strncmp(name, "ac-entry", sizeof("ac-entry") - 1) == 0) {
+		tx_prof_ac_entry = alloc_dev_tx_prof_ac_entry("ac-entry");
+		if (!tx_prof_ac_entry)
+			return ERR_PTR(-ENOMEM);
+		tx_prof->tx_prof_ac_entry = tx_prof_ac_entry;
+		tx_prof_ac_entry->tx_profile = tx_prof->tx_profile;
+		tx_prof_ac_entry->cdev = tx_prof->cdev;
+
+		return &tx_prof->tx_prof_ac_entry->group;
+	}
+
+	if (strncmp(name, "tc", sizeof("tc") - 1) == 0) {
+		tx_prof_tc = alloc_dev_tx_prof_tc("tc");
+		if (!tx_prof_tc)
+			return ERR_PTR(-ENOMEM);
+		tx_prof->tx_prof_tc = tx_prof_tc;
+		tx_prof_tc->tx_profile = tx_prof->tx_profile;
+		tx_prof_tc->cdev = tx_prof->cdev;
+
+		return &tx_prof->tx_prof_tc->group;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static void
+cxi_cfg_tx_prof_drop_item(struct config_group *group,
+			  struct config_item *item)
+{
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_tx_prof_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_tx_prof, group.cg_item));
+}
+
+static struct cxi_cfg_tx_prof *to_cxi_cfg_tx_prof(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_tx_prof, group);
+}
+
+static ssize_t cxi_cfg_tx_prof_id_show(struct config_item *item,
+				       char *page)
+{
+	struct cxi_cfg_tx_prof *tx_prof = to_cxi_cfg_tx_prof(item);
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", tx_prof->id);
+}
+
+CONFIGFS_ATTR_RO(cxi_cfg_tx_prof_, id);
+
+static struct configfs_attribute *cxi_cfg_tx_prof_attrs[] = {
+	&cxi_cfg_tx_prof_attr_id,
+	NULL,
+};
+
+static struct configfs_group_operations cxi_cfg_tx_prof_ops = {
+	.make_group = cxi_cfg_tx_prof_make_group,
+	.drop_item  = cxi_cfg_tx_prof_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_item_ops = {
+	.release     = cxi_cfg_tx_prof_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_type = {
+	.ct_group_ops   = &cxi_cfg_tx_prof_ops,
+	.ct_attrs       = cxi_cfg_tx_prof_attrs,
+	.ct_item_ops    = &cxi_cfg_tx_prof_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof *alloc_dev_tx_prof(const char *name)
+{
+	struct cxi_cfg_tx_prof *dev_tx_prof;
+
+	dev_tx_prof = kzalloc(sizeof(struct cxi_cfg_tx_prof), GFP_KERNEL);
+	if (!dev_tx_prof)
+		return NULL;
+
+	strscpy(dev_tx_prof->name, name, sizeof(dev_tx_prof->name));
+
+	config_group_init_type_name(&dev_tx_prof->group,
+				    dev_tx_prof->name,
+				    &cxi_cfg_tx_prof_type);
+
+	return dev_tx_prof;
+}
+
+static struct
+config_group *cxi_cfg_tx_prof_dir_make_group(struct config_group *group,
+					     const char *name)
+{
+	struct cxi_cfg_tx_prof_dir *tx_prof_dir;
+	struct cxi_cfg_tx_prof *tx_prof;
+	struct cxi_tx_profile *tx_prof_ptr;
+	struct cxi_tx_attr tx_attr = {};
+
+	if (strlen(name) > CONFIGFS_DIR_LEN - 1)
+		return ERR_PTR(-EINVAL);
+
+	tx_prof_dir = container_of(group, struct cxi_cfg_tx_prof_dir, group);
+	tx_prof = alloc_dev_tx_prof(name);
+	if (!tx_prof) {
+		pr_debug("Failed to alloc memory\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	tx_prof->cdev = tx_prof_dir->cdev;
+	strscpy(tx_attr.vni_attr.name, name, sizeof(tx_attr.vni_attr.name));
+
+	tx_prof_ptr = cxi_dev_alloc_tx_profile(tx_prof->cdev,
+					       &tx_attr);
+	if (IS_ERR(tx_prof_ptr)) {
+		kfree(tx_prof);
+		pr_debug("Failed to alloc rx profile\n");
+		return ERR_PTR(PTR_ERR(tx_prof_ptr));
+	}
+
+	tx_prof->tx_profile = tx_prof_ptr;
+	tx_prof->id = tx_prof_ptr->profile_common.id;
+
+	return &tx_prof->group;
+}
+
+static void
+cxi_cfg_tx_prof_dir_drop_item(struct config_group *group,
+			      struct config_item *item)
+{
+	struct cxi_cfg_tx_prof *tx_prof;
+
+	tx_prof = container_of(item, struct cxi_cfg_tx_prof, group.cg_item);
+
+	/*
+	 * For accidental deletion of resource group directory
+	 * by configfs user. In the future we will employ a
+	 * different approach to handle accidental deletion.
+	 */
+	cxi_tx_profile_dec_refcount(tx_prof->cdev,
+				    tx_prof->tx_profile,
+				    true);
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_tx_prof_dir_free(struct config_item *item)
+{
+	struct cxi_cfg_tx_prof_dir *tx_prof_dir;
+
+	tx_prof_dir = container_of(item, struct cxi_cfg_tx_prof_dir,
+				   group.cg_item);
+	kfree(tx_prof_dir);
+}
+
+static struct configfs_group_operations cxi_cfg_tx_prof_dir_ops = {
+	.make_group     = cxi_cfg_tx_prof_dir_make_group,
+	.drop_item      = cxi_cfg_tx_prof_dir_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_tx_prof_dir_item_ops = {
+	.release     = cxi_cfg_tx_prof_dir_free,
+};
+
+static const struct config_item_type cxi_cfg_tx_prof_dir_type = {
+	.ct_group_ops   = &cxi_cfg_tx_prof_dir_ops,
+	.ct_item_ops    = &cxi_cfg_tx_prof_dir_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_tx_prof_dir *alloc_dev_tx_prof_dir(const char *name)
+{
+	struct cxi_cfg_tx_prof_dir *dev_tx_prof_dir;
+
+	dev_tx_prof_dir = kzalloc(sizeof(*dev_tx_prof_dir), GFP_KERNEL);
+	if (!dev_tx_prof_dir)
+		return NULL;
+
+	strscpy(dev_tx_prof_dir->name, name, sizeof(dev_tx_prof_dir->name));
+
+	config_group_init_type_name(&dev_tx_prof_dir->group,
+				    dev_tx_prof_dir->name,
+				    &cxi_cfg_tx_prof_dir_type);
+
+	return dev_tx_prof_dir;
+}
+
+static struct cxi_cfg_rx_prof_ac_entry_sub *to_cxi_cfg_rx_prof_ac_entry_sub(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rx_prof_ac_entry_sub, group);
+}
+
+static ssize_t cxi_cfg_rx_prof_ac_entry_sub_type_show(struct config_item *item,
+						      char *page)
+{
+	struct cxi_cfg_rx_prof_ac_entry_sub *rx_prof_ac_entry_sub;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+	int rc;
+
+	rx_prof_ac_entry_sub = to_cxi_cfg_rx_prof_ac_entry_sub(item);
+
+	rc = cxi_rx_profile_get_ac_entry_data(rx_prof_ac_entry_sub->rx_profile,
+					      rx_prof_ac_entry_sub->id,
+					      &ac_type,
+					      &ac_data);
+	if (rc)
+		return rc;
+
+	return sprintf(page, "%d\n", ac_type);
+}
+
+static ssize_t cxi_cfg_rx_prof_ac_entry_sub_type_store(struct config_item *item,
+						       const char *page,
+						       size_t count)
+{
+	struct cxi_cfg_rx_prof_ac_entry_sub *ac_entry_sub;
+	int rc;
+	enum cxi_ac_type ac_type_val;
+	uid_t uid;
+	gid_t gid;
+	unsigned int netns;
+	unsigned int ac_entry_id;
+
+	ac_entry_sub = to_cxi_cfg_rx_prof_ac_entry_sub(item);
+	if (!ac_entry_sub->rx_profile) {
+		pr_debug("Unable to get rx profile reference\n");
+		return -EINVAL;
+	}
+
+	rc = kstrtouint(page, 0, (unsigned int *)&ac_type_val);
+	if (rc)
+		return rc;
+
+	if (ac_type_val == CXI_AC_UID)
+		uid = ac_entry_sub->ac_data.uid;
+	else if (ac_type_val == CXI_AC_GID)
+		gid = ac_entry_sub->ac_data.gid;
+	else if (ac_type_val == CXI_AC_NETNS)
+		netns = ac_entry_sub->ac_data.netns;
+	else if (ac_type_val == CXI_AC_OPEN)
+		pr_debug("Setting type to CXI_AC_OPEN\n");
+	else
+		return -EINVAL;
+
+	rc = cxi_rx_profile_add_ac_entry(ac_entry_sub->rx_profile,
+					 ac_type_val,
+					 uid,
+					 gid,
+					 netns,
+					 &ac_entry_id);
+	if (rc < 0) {
+		pr_debug("Unable to add ac entry to rx profile: err val %d\n", rc);
+		return rc;
+	}
+
+	ac_entry_sub->id = ac_entry_id;
+	ac_entry_sub->ac_type = ac_type_val;
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rx_prof_ac_entry_sub_data_show(struct config_item *item,
+						      char *page)
+{
+	struct cxi_cfg_rx_prof_ac_entry_sub *rx_prof_ac_entry_sub;
+	int rc;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	rx_prof_ac_entry_sub = to_cxi_cfg_rx_prof_ac_entry_sub(item);
+
+	rc = cxi_rx_profile_get_ac_entry_data(rx_prof_ac_entry_sub->rx_profile,
+					      rx_prof_ac_entry_sub->id,
+					      &ac_type,
+					      &ac_data);
+	if (rc)
+		return rc;
+
+	if (ac_type == CXI_AC_UID)
+		return sprintf(page, "%d\n", ac_data.uid);
+	else if (ac_type == CXI_AC_GID)
+		return sprintf(page, "%d\n", ac_data.gid);
+	else if (ac_type == CXI_AC_NETNS)
+		return sprintf(page, "%d\n", ac_data.netns);
+	else if (ac_type == CXI_AC_OPEN)
+		return sprintf(page, "%d\n", CXI_AC_OPEN);
+
+	return -EINVAL;
+}
+
+static ssize_t cxi_cfg_rx_prof_ac_entry_sub_data_store(struct config_item *item,
+						       const char *page,
+						       size_t count)
+{
+	struct cxi_cfg_rx_prof_ac_entry_sub *ac_entry_sub;
+	int rc;
+	unsigned int ac_data_val;
+
+	ac_entry_sub = to_cxi_cfg_rx_prof_ac_entry_sub(item);
+
+	rc = kstrtouint(page, 0, &ac_data_val);
+	if (rc)
+		return rc;
+
+	if (ac_entry_sub->ac_type == CXI_AC_UID) {
+		ac_entry_sub->ac_data.uid = ac_data_val;
+		return count;
+	} else if (ac_entry_sub->ac_type == CXI_AC_GID) {
+		ac_entry_sub->ac_data.gid = ac_data_val;
+		return count;
+	} else if (ac_entry_sub->ac_type == CXI_AC_NETNS) {
+		ac_entry_sub->ac_data.netns = ac_data_val;
+		return count;
+	}
+
+	return -EINVAL;
+}
+
+static void cxi_cfg_rx_prof_ac_entry_sub_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rx_prof_ac_entry_sub, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_rx_prof_ac_entry_sub_, type);
+CONFIGFS_ATTR(cxi_cfg_rx_prof_ac_entry_sub_, data);
+
+static struct configfs_attribute *cxi_cfg_rx_prof_ac_entry_sub_attrs[] = {
+	&cxi_cfg_rx_prof_ac_entry_sub_attr_type,
+	&cxi_cfg_rx_prof_ac_entry_sub_attr_data,
+	NULL,
+};
+
+static struct configfs_item_operations cxi_cfg_rx_prof_ac_entry_sub_item_ops = {
+	.release     = cxi_cfg_rx_prof_ac_entry_sub_free,
+};
+
+static const struct config_item_type cxi_cfg_rx_prof_ac_entry_sub_type = {
+	.ct_attrs       = cxi_cfg_rx_prof_ac_entry_sub_attrs,
+	.ct_item_ops    = &cxi_cfg_rx_prof_ac_entry_sub_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rx_prof_ac_entry_sub *alloc_dev_rx_prof_ac_entry_sub(const char *name)
+{
+	struct cxi_cfg_rx_prof_ac_entry_sub *rx_prof_ac_entry_sub;
+
+	rx_prof_ac_entry_sub = kzalloc(sizeof(*rx_prof_ac_entry_sub), GFP_KERNEL);
+	if (!rx_prof_ac_entry_sub)
+		return NULL;
+
+	strscpy(rx_prof_ac_entry_sub->name, name, sizeof(rx_prof_ac_entry_sub->name));
+
+	config_group_init_type_name(&rx_prof_ac_entry_sub->group,
+				    rx_prof_ac_entry_sub->name,
+				    &cxi_cfg_rx_prof_ac_entry_sub_type);
+
+	return rx_prof_ac_entry_sub;
+}
+
+static struct
+config_group *cxi_cfg_rx_prof_ac_entry_make_group(struct config_group *group,
+						  const char *name)
+{
+	struct cxi_cfg_rx_prof_ac_entry *rx_prof_ac_entry;
+	struct cxi_cfg_rx_prof_ac_entry_sub *rx_prof_ac_entry_sub;
+
+	if (strlen(name) > CONFIGFS_DIR_LEN - 1)
+		return ERR_PTR(-EINVAL);
+
+	rx_prof_ac_entry_sub = alloc_dev_rx_prof_ac_entry_sub(name);
+	if (!rx_prof_ac_entry_sub) {
+		pr_debug("Memory allocation failed for ac entry group\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	rx_prof_ac_entry_sub->ac_type = CXI_AC_UID;
+	rx_prof_ac_entry_sub->ac_data.uid = 0;
+
+	rx_prof_ac_entry = container_of(group, struct cxi_cfg_rx_prof_ac_entry, group);
+	rx_prof_ac_entry_sub->rx_profile = rx_prof_ac_entry->rx_profile;
+
+	return &rx_prof_ac_entry_sub->group;
+}
+
+static void
+cxi_cfg_rx_prof_ac_entry_drop_item(struct config_group *group,
+				   struct config_item *item)
+{
+	struct cxi_cfg_rx_prof_ac_entry_sub *rx_prof_ac_entry_sub;
+
+	rx_prof_ac_entry_sub = container_of(item, struct cxi_cfg_rx_prof_ac_entry_sub, group.cg_item);
+	cxi_rx_profile_remove_ac_entry(rx_prof_ac_entry_sub->rx_profile,
+				       rx_prof_ac_entry_sub->id);
+
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rx_prof_ac_entry_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rx_prof_ac_entry, group.cg_item));
+}
+
+static struct configfs_group_operations cxi_cfg_rx_prof_ac_entry_ops = {
+	.make_group     = cxi_cfg_rx_prof_ac_entry_make_group,
+	.drop_item      = cxi_cfg_rx_prof_ac_entry_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_rx_prof_ac_entry_item_ops = {
+	.release     = cxi_cfg_rx_prof_ac_entry_free,
+};
+
+static const struct config_item_type cxi_cfg_rx_prof_ac_entry_type = {
+	.ct_group_ops   = &cxi_cfg_rx_prof_ac_entry_ops,
+	.ct_item_ops    = &cxi_cfg_rx_prof_ac_entry_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rx_prof_state *to_cxi_cfg_rx_prof_state(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rx_prof_state, group);
+}
+
+static ssize_t cxi_cfg_rx_prof_state_enabled_show(struct config_item *item,
+						  char *page)
+{
+	struct cxi_cfg_rx_prof_state *rx_prof_state;
+	struct cxi_rx_attr rx_attr;
+	struct cxi_rxtx_profile_state state;
+	int rc;
+
+	rx_prof_state = to_cxi_cfg_rx_prof_state(item);
+
+	rc = cxi_rx_profile_get_info(rx_prof_state->cdev,
+				     rx_prof_state->rx_profile,
+				     &rx_attr,
+				     &state);
+	if (rc < 0) {
+		pr_debug("Unable to get rx-profile info rc = %d\n", rc);
+		return rc;
+	}
+
+	return scnprintf(page, PAGE_SIZE, "%s\n", state.enable ? "true" : "false");
+}
+
+static ssize_t cxi_cfg_rx_prof_state_enabled_store(struct config_item *item,
+						   const char *page,
+						   size_t count)
+{
+	struct cxi_cfg_rx_prof_state *rx_prof_state;
+	int rc;
+	bool b_val;
+
+	if (kstrtobool(page, &b_val))
+		return -EINVAL;
+
+	rx_prof_state = to_cxi_cfg_rx_prof_state(item);
+
+	if (b_val) {
+		rc = cxi_rx_profile_enable(rx_prof_state->cdev,
+					   rx_prof_state->rx_profile);
+		if (rc)
+			return rc;
+	} else {
+		cxi_rx_profile_disable(rx_prof_state->cdev,
+				       rx_prof_state->rx_profile);
+	}
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rx_prof_state_refcount_show(struct config_item *item,
+						   char *page)
+{
+	struct cxi_cfg_rx_prof_state *rx_prof_state;
+	struct cxi_rx_attr rx_attr;
+	struct cxi_rxtx_profile_state state;
+	int rc;
+
+	rx_prof_state = to_cxi_cfg_rx_prof_state(item);
+
+	rc = cxi_rx_profile_get_info(rx_prof_state->cdev,
+				     rx_prof_state->rx_profile,
+				     &rx_attr,
+				     &state);
+	if (rc < 0) {
+		pr_debug("Unable to get rx-profile info rc = %d\n", rc);
+		return rc;
+	}
+
+	return sprintf(page, "%d\n", refcount_read(&state.refcount));
+}
+
+static void cxi_cfg_rx_prof_state_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rx_prof_state, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_rx_prof_state_, enabled);
+CONFIGFS_ATTR_RO(cxi_cfg_rx_prof_state_, refcount);
+
+static struct configfs_attribute *cxi_cfg_rx_prof_state_attrs[] = {
+	&cxi_cfg_rx_prof_state_attr_enabled,
+	&cxi_cfg_rx_prof_state_attr_refcount,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_rx_prof_state_item_ops = {
+	.release     = cxi_cfg_rx_prof_state_free,
+};
+
+static const struct config_item_type cxi_cfg_rx_prof_state_type = {
+	.ct_attrs       = cxi_cfg_rx_prof_state_attrs,
+	.ct_item_ops    = &cxi_cfg_rx_prof_state_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rx_prof_state *alloc_dev_rx_prof_state(const char *name)
+{
+	struct cxi_cfg_rx_prof_state *rx_prof_state;
+
+	rx_prof_state = kzalloc(sizeof(*rx_prof_state), GFP_KERNEL);
+	if (!rx_prof_state)
+		return NULL;
+
+	strscpy(rx_prof_state->name, name, sizeof(rx_prof_state->name));
+
+	config_group_init_type_name(&rx_prof_state->group,
+				    rx_prof_state->name,
+				    &cxi_cfg_rx_prof_state_type);
+
+	return rx_prof_state;
+}
+
+static struct cxi_cfg_rx_prof_attr *to_cxi_cfg_rx_prof_attr(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rx_prof_attr, group);
+}
+
+static ssize_t cxi_cfg_rx_prof_attr_name_show(struct config_item *item,
+					      char *page)
+{
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+
+	rx_prof_attr = to_cxi_cfg_rx_prof_attr(item);
+
+	return scnprintf(page, PAGE_SIZE, "%s\n",
+			 rx_prof_attr->rx_profile->profile_common.vni_attr.name);
+}
+
+static ssize_t cxi_cfg_rx_prof_attr_match_show(struct config_item *item,
+					       char *page)
+{
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+	struct cxi_rx_attr rx_attr;
+	struct cxi_rxtx_profile_state state;
+	int rc;
+
+	rx_prof_attr = to_cxi_cfg_rx_prof_attr(item);
+
+	rc = cxi_rx_profile_get_info(rx_prof_attr->cdev,
+				     rx_prof_attr->rx_profile,
+				     &rx_attr,
+				     &state);
+	if (rc < 0)
+		return rc;
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", rx_attr.vni_attr.match);
+}
+
+static ssize_t cxi_cfg_rx_prof_attr_match_store(struct config_item *item,
+						const char *page,
+						size_t count)
+{
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+	int rc;
+	struct cxi_rx_attr rx_attr = {};
+
+	rx_prof_attr = to_cxi_cfg_rx_prof_attr(item);
+	rc = kstrtou16(page, 0, &rx_prof_attr->match);
+	if (rc)
+		return rc;
+
+	rx_attr.vni_attr.match = rx_prof_attr->match;
+	rx_attr.vni_attr.ignore = rx_prof_attr->ignore;
+
+	strscpy(rx_attr.vni_attr.name,
+		rx_prof_attr->rx_profile->profile_common.vni_attr.name,
+		sizeof(rx_attr.vni_attr.name));
+
+	rc = cxi_dev_set_rx_profile_attr(rx_prof_attr->cdev,
+					 rx_prof_attr->rx_profile,
+					 &rx_attr);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static ssize_t cxi_cfg_rx_prof_attr_ignore_show(struct config_item *item,
+						char *page)
+{
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+	int rc;
+	struct cxi_rx_attr rx_attr;
+	struct cxi_rxtx_profile_state state;
+
+	rx_prof_attr = to_cxi_cfg_rx_prof_attr(item);
+
+	rc = cxi_rx_profile_get_info(rx_prof_attr->cdev,
+				     rx_prof_attr->rx_profile,
+				     &rx_attr,
+				     &state);
+	if (rc < 0) {
+		pr_err("Unable to get rx-profile info rc = %d\n", rc);
+		return rc;
+	}
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", rx_attr.vni_attr.ignore);
+}
+
+static ssize_t cxi_cfg_rx_prof_attr_ignore_store(struct config_item *item,
+						 const char *page,
+						 size_t count)
+{
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+	struct cxi_rxtx_profile_state state;
+	struct cxi_rx_attr rx_attr;
+	u16 ignore;
+	int rc;
+
+	rx_prof_attr = to_cxi_cfg_rx_prof_attr(item);
+	rc = kstrtou16(page, 0, &ignore);
+	if (rc)
+		return rc;
+
+	rc = cxi_rx_profile_get_info(rx_prof_attr->cdev,
+				     rx_prof_attr->rx_profile, &rx_attr, &state);
+	if (rc < 0)
+		return rc;
+	rx_attr.vni_attr.ignore = ignore;
+	rc = cxi_dev_set_rx_profile_attr(rx_prof_attr->cdev,
+					 rx_prof_attr->rx_profile, &rx_attr);
+	if (rc)
+		return rc;
+	rx_prof_attr->ignore = ignore;
+	return count;
+}
+
+static void cxi_cfg_rx_prof_attr_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rx_prof_attr, group.cg_item));
+}
+
+CONFIGFS_ATTR(cxi_cfg_rx_prof_attr_, ignore);
+CONFIGFS_ATTR(cxi_cfg_rx_prof_attr_, match);
+CONFIGFS_ATTR_RO(cxi_cfg_rx_prof_attr_, name);
+
+static struct configfs_attribute *cxi_cfg_rx_prof_attr_attrs[] = {
+	&cxi_cfg_rx_prof_attr_attr_name,
+	&cxi_cfg_rx_prof_attr_attr_match,
+	&cxi_cfg_rx_prof_attr_attr_ignore,
+	NULL
+};
+
+static struct configfs_item_operations cxi_cfg_rx_prof_attr_item_ops = {
+	.release     = cxi_cfg_rx_prof_attr_free,
+};
+
+static const struct config_item_type cxi_cfg_rx_prof_attr_type = {
+	.ct_attrs       = cxi_cfg_rx_prof_attr_attrs,
+	.ct_item_ops    = &cxi_cfg_rx_prof_attr_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rx_prof_attr *alloc_dev_rx_prof_attr(const char *name)
+{
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+
+	rx_prof_attr = kzalloc(sizeof(*rx_prof_attr), GFP_KERNEL);
+	if (!rx_prof_attr)
+		return NULL;
+
+	strscpy(rx_prof_attr->name, name, sizeof(rx_prof_attr->name));
+
+	config_group_init_type_name(&rx_prof_attr->group,
+				    rx_prof_attr->name,
+				    &cxi_cfg_rx_prof_attr_type);
+
+	return rx_prof_attr;
+}
+
+static struct cxi_cfg_rx_prof_ac_entry *alloc_dev_rx_prof_ac_entry(const char *name)
+{
+	struct cxi_cfg_rx_prof_ac_entry *rx_prof_ac_entry;
+
+	rx_prof_ac_entry = kzalloc(sizeof(*rx_prof_ac_entry),
+				   GFP_KERNEL);
+	if (!rx_prof_ac_entry)
+		return NULL;
+
+	strscpy(rx_prof_ac_entry->name,
+		name,
+		sizeof(rx_prof_ac_entry->name));
+
+	config_group_init_type_name(&rx_prof_ac_entry->group,
+				    rx_prof_ac_entry->name,
+				    &cxi_cfg_rx_prof_ac_entry_type);
+
+	return rx_prof_ac_entry;
+}
+
+static struct
+config_group *cxi_cfg_rx_prof_make_group(struct config_group *group,
+					 const char *name)
+{
+	struct cxi_cfg_rx_prof *rx_prof;
+	struct cxi_cfg_rx_prof_state *rx_prof_state;
+	struct cxi_cfg_rx_prof_attr *rx_prof_attr;
+	struct cxi_cfg_rx_prof_ac_entry *rx_prof_ac_entry;
+
+	rx_prof = container_of(group, struct cxi_cfg_rx_prof, group);
+
+	if (strncmp(name, "attr", sizeof("attr") - 1) == 0) {
+		rx_prof_attr = alloc_dev_rx_prof_attr("attr");
+		if (!rx_prof_attr)
+			return ERR_PTR(-ENOMEM);
+
+		rx_prof->rx_prof_attr = rx_prof_attr;
+		rx_prof->rx_prof_attr->cdev = rx_prof->cdev;
+		rx_prof_attr->rx_profile = rx_prof->rx_profile;
+		rx_prof->rx_prof_attr->cdev = rx_prof->cdev;
+
+		return &rx_prof->rx_prof_attr->group;
+	}
+
+	if (strncmp(name, "state", sizeof("state") - 1) == 0) {
+		rx_prof_state = alloc_dev_rx_prof_state("state");
+		if (!rx_prof_state)
+			return ERR_PTR(-ENOMEM);
+
+		rx_prof->rx_prof_state = rx_prof_state;
+		rx_prof_state->rx_profile = rx_prof->rx_profile;
+		rx_prof->rx_prof_state->cdev = rx_prof->cdev;
+
+		return &rx_prof->rx_prof_state->group;
+	}
+
+	if (strncmp(name, "ac-entry", sizeof("ac-entry") - 1) == 0) {
+		rx_prof_ac_entry = alloc_dev_rx_prof_ac_entry("ac-entry");
+		if (!rx_prof_ac_entry)
+			return ERR_PTR(-ENOMEM);
+
+		rx_prof->rx_prof_ac_entry = rx_prof_ac_entry;
+		rx_prof_ac_entry->rx_profile = rx_prof->rx_profile;
+		rx_prof_ac_entry->cdev = rx_prof->cdev;
+
+		return &rx_prof->rx_prof_ac_entry->group;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static void
+cxi_cfg_rx_prof_drop_item(struct config_group *group,
+			  struct config_item *item)
+{
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rx_prof_free(struct config_item *item)
+{
+	kfree(container_of(item, struct cxi_cfg_rx_prof, group.cg_item));
+}
+
+static struct cxi_cfg_rx_prof *to_cxi_cfg_rx_prof(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct cxi_cfg_rx_prof, group);
+}
+
+static ssize_t cxi_cfg_rx_prof_id_show(struct config_item *item,
+				       char *page)
+{
+	struct cxi_cfg_rx_prof *rx_prof = to_cxi_cfg_rx_prof(item);
+
+	return scnprintf(page, PAGE_SIZE, "%d\n", rx_prof->id);
+}
+
+CONFIGFS_ATTR_RO(cxi_cfg_rx_prof_, id);
+
+static struct configfs_attribute *cxi_cfg_rx_prof_attrs[] = {
+	&cxi_cfg_rx_prof_attr_id,
+	NULL,
+};
+
+static struct configfs_group_operations cxi_cfg_rx_prof_ops = {
+	.make_group = cxi_cfg_rx_prof_make_group,
+	.drop_item  = cxi_cfg_rx_prof_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_rx_prof_item_ops = {
+	.release     = cxi_cfg_rx_prof_free,
+};
+
+static const struct config_item_type cxi_cfg_rx_prof_type = {
+	.ct_group_ops   = &cxi_cfg_rx_prof_ops,
+	.ct_attrs       = cxi_cfg_rx_prof_attrs,
+	.ct_item_ops    = &cxi_cfg_rx_prof_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rx_prof *alloc_dev_rx_prof(const char *name)
+{
+	struct cxi_cfg_rx_prof *dev_rx_prof;
+
+	dev_rx_prof = kzalloc(sizeof(struct cxi_cfg_rx_prof), GFP_KERNEL);
+	if (!dev_rx_prof)
+		return NULL;
+
+	strscpy(dev_rx_prof->name, name, sizeof(dev_rx_prof->name));
+
+	config_group_init_type_name(&dev_rx_prof->group,
+				    dev_rx_prof->name,
+				    &cxi_cfg_rx_prof_type);
+
+	return dev_rx_prof;
+}
+
+static struct
+config_group *cxi_cfg_rx_prof_dir_make_group(struct config_group *group,
+					     const char *name)
+{
+	struct cxi_cfg_rx_prof_dir *rx_prof_dir;
+	struct cxi_cfg_rx_prof *rx_prof;
+	struct cxi_rx_profile *rx_prof_ptr;
+	struct cxi_rx_attr rx_attr = {};
+
+	if (strlen(name) > CONFIGFS_DIR_LEN - 1)
+		return ERR_PTR(-EINVAL);
+
+	rx_prof_dir = container_of(group, struct cxi_cfg_rx_prof_dir, group);
+	rx_prof = alloc_dev_rx_prof(name);
+	if (!rx_prof) {
+		pr_debug("Failed to alloc memory\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	rx_prof->cdev = rx_prof_dir->cdev;
+
+	strscpy(rx_attr.vni_attr.name, name, sizeof(rx_attr.vni_attr.name));
+
+	rx_prof_ptr = cxi_dev_alloc_rx_profile(rx_prof->cdev,
+					       &rx_attr);
+	if (IS_ERR(rx_prof_ptr)) {
+		kfree(rx_prof);
+		pr_debug("Failed to alloc rx profile\n");
+		return ERR_PTR(PTR_ERR(rx_prof_ptr));
+	}
+
+	rx_prof->rx_profile = rx_prof_ptr;
+	rx_prof->id = rx_prof_ptr->profile_common.id;
+
+	return &rx_prof->group;
+}
+
+static void
+cxi_cfg_rx_prof_dir_drop_item(struct config_group *group,
+			      struct config_item *item)
+{
+	struct cxi_cfg_rx_prof *rx_prof;
+
+	rx_prof = container_of(item, struct cxi_cfg_rx_prof, group.cg_item);
+
+	/*
+	 * For accidental deletion of resource group directory
+	 * by configfs user. In the future we will employ a
+	 * different approach to handle accidental deletion.
+	 */
+	cxi_rx_profile_dec_refcount(rx_prof->cdev,
+				    rx_prof->rx_profile);
+
+	cxi_cfg_drop_item_ref(item);
+}
+
+static void cxi_cfg_rx_prof_dir_free(struct config_item *item)
+{
+	struct cxi_cfg_rx_prof_dir *rx_prof_dir;
+
+	rx_prof_dir = container_of(item, struct cxi_cfg_rx_prof_dir,
+				   group.cg_item);
+	kfree(rx_prof_dir);
+}
+
+static struct configfs_group_operations cxi_cfg_rx_prof_dir_ops = {
+	.make_group     = cxi_cfg_rx_prof_dir_make_group,
+	.drop_item      = cxi_cfg_rx_prof_dir_drop_item,
+};
+
+static struct configfs_item_operations cxi_cfg_rx_prof_dir_item_ops = {
+	.release     = cxi_cfg_rx_prof_dir_free,
+};
+
+static const struct config_item_type cxi_cfg_rx_prof_dir_type = {
+	.ct_group_ops   = &cxi_cfg_rx_prof_dir_ops,
+	.ct_item_ops    = &cxi_cfg_rx_prof_dir_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct cxi_cfg_rx_prof_dir *alloc_dev_rx_prof_dir(const char *name)
+{
+	struct cxi_cfg_rx_prof_dir *dev_rx_prof_dir;
+
+	dev_rx_prof_dir = kzalloc(sizeof(*dev_rx_prof_dir), GFP_KERNEL);
+	if (!dev_rx_prof_dir)
+		return NULL;
+
+	strscpy(dev_rx_prof_dir->name, name, sizeof(dev_rx_prof_dir->name));
+
+	config_group_init_type_name(&dev_rx_prof_dir->group,
+				    dev_rx_prof_dir->name,
+				    &cxi_cfg_rx_prof_dir_type);
+
+	return dev_rx_prof_dir;
+}
+
+int cxi_configfs_device_init(struct cass_dev *hw)
+{
+	struct config_group *parent_group;
+	struct cxi_cfg_group_item *cxi_cfg_configfs;
+	struct cxi_cfg_rgroup_dir *rgp_dir;
+	struct cxi_cfg_rx_prof_dir *rx_prof_dir;
+	struct cxi_cfg_tx_prof_dir *tx_prof_dir;
+	int rc;
+
+	parent_group = &cxi_cfg_group_subsys.su_group;
+
+	cxi_cfg_configfs = alloc_dev_subdir(hw->cdev.name);
+	if (!cxi_cfg_configfs)
+		return -ENOMEM;
+
+	hw->cfg_dev_dir = cxi_cfg_configfs;
+
+	rc = configfs_register_group(parent_group,
+				     &cxi_cfg_configfs->group);
+	if (rc)
+		goto dev_grp_reg_err;
+
+	rgp_dir = alloc_dev_attr1("rgroup");
+	if (!rgp_dir) {
+		rc = -ENOMEM;
+		goto rgp_dir_alloc_err;
+	}
+
+	rc = configfs_register_group(&cxi_cfg_configfs->group,
+				     &rgp_dir->group);
+	if (rc)
+		goto rgp_dir_reg_err;
+
+	cxi_cfg_configfs->rgp_dir = rgp_dir;
+	rgp_dir->cdev = &hw->cdev;
+
+	rx_prof_dir = alloc_dev_rx_prof_dir("rx-profile");
+	if (!rx_prof_dir) {
+		rc = -ENOMEM;
+		goto rx_prof_dir_alloc_err;
+	}
+
+	rc = configfs_register_group(&cxi_cfg_configfs->group,
+				     &rx_prof_dir->group);
+	if (rc)
+		goto rx_prof_dir_reg_err;
+
+	cxi_cfg_configfs->rx_prof_dir = rx_prof_dir;
+	rx_prof_dir->cdev = &hw->cdev;
+
+	tx_prof_dir = alloc_dev_tx_prof_dir("tx-profile");
+	if (!tx_prof_dir) {
+		rc = -ENOMEM;
+		goto tx_prof_dir_alloc_err;
+	}
+
+	rc = configfs_register_group(&cxi_cfg_configfs->group,
+				     &tx_prof_dir->group);
+	if (rc)
+		goto tx_prof_dir_reg_err;
+
+	cxi_cfg_configfs->tx_prof_dir = tx_prof_dir;
+	tx_prof_dir->cdev = &hw->cdev;
+
+	return 0;
+
+tx_prof_dir_reg_err:
+	kfree(tx_prof_dir);
+tx_prof_dir_alloc_err:
+	configfs_unregister_group(&rx_prof_dir->group);
+rx_prof_dir_reg_err:
+	kfree(rx_prof_dir);
+rx_prof_dir_alloc_err:
+	configfs_unregister_group(&rgp_dir->group);
+rgp_dir_reg_err:
+	kfree(rgp_dir);
+rgp_dir_alloc_err:
+	configfs_unregister_group(&cxi_cfg_configfs->group);
+dev_grp_reg_err:
+	hw->cfg_dev_dir = NULL;
+	kfree(cxi_cfg_configfs);
+
+	return rc;
+}
+
+int cxi_configfs_subsys_init(void)
+{
+	struct configfs_subsystem *subsys;
+	int rc;
+
+	subsys = &cxi_cfg_group_subsys;
+
+	config_group_init(&subsys->su_group);
+	mutex_init(&subsys->su_mutex);
+
+	rc = configfs_register_subsystem(subsys);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/*
+ * cg_children is protected by the subsystem's su_mutex: configfs mkdir and
+ * rmdir add and remove children with it held. configfs_unregister_group()
+ * takes su_mutex itself, so it can't be called with it held. Look at the
+ * list under the lock, pin the child so it can't be freed under us, and
+ * drop the lock before unregistering it.
+ *
+ * Returns the first child with a reference held, or NULL if there are none.
+ */
+static struct config_group *
+get_first_child_config_group(struct config_group *parent_group,
+			     struct cxi_cfg_teardown_marker *marker)
+{
+	struct config_item *child_item;
+	struct config_group *child_group = NULL;
+	unsigned long flags;
+
+	mutex_lock(&cxi_cfg_group_subsys.su_mutex);
+	child_item = list_first_entry_or_null(&parent_group->cg_children,
+					      struct config_item, ci_entry);
+	if (child_item) {
+		config_item_get(child_item);
+		marker->item = child_item;
+		INIT_LIST_HEAD(&marker->list);
+		spin_lock_irqsave(&cxi_cfg_teardown_lock, flags);
+		list_add(&marker->list, &cxi_cfg_teardown_markers);
+		spin_unlock_irqrestore(&cxi_cfg_teardown_lock, flags);
+		child_group = container_of(child_item,
+					   struct config_group, cg_item);
+	}
+	mutex_unlock(&cxi_cfg_group_subsys.su_mutex);
+
+	return child_group;
+}
+
+static void unregister_all_sub_config_groups_recur(struct config_group *parent_group)
+{
+	struct config_group *child_group;
+	struct cxi_cfg_teardown_marker marker;
+	unsigned long flags;
+
+	/*
+	 * Unregistering a child unlinks it from cg_children, so the list
+	 * is re-read each time round instead of being walked across the
+	 * unlocked section.
+	 */
+	while ((child_group = get_first_child_config_group(parent_group, &marker))) {
+		unregister_all_sub_config_groups_recur(child_group);
+		configfs_unregister_group(child_group);
+
+		spin_lock_irqsave(&cxi_cfg_teardown_lock, flags);
+		list_del_init(&marker.list);
+		spin_unlock_irqrestore(&cxi_cfg_teardown_lock, flags);
+
+		/* The reference taken by get_first_child_config_group() */
+		config_item_put(&child_group->cg_item);
+		/* The creator's reference, as before */
+		config_item_put(&child_group->cg_item);
+	}
+}
+
+void cxi_configfs_cleanup(struct cass_dev *hw)
+{
+	struct cxi_cfg_group_item *dev_dir = hw->cfg_dev_dir;
+
+	if (!dev_dir)
+		return;
+	hw->cfg_dev_dir = NULL;
+	unregister_all_sub_config_groups_recur(&dev_dir->group);
+	configfs_unregister_group(&dev_dir->group);
+	config_item_put(&dev_dir->group.cg_item);
+}
+
+void cxi_configfs_exit(void)
+{
+	configfs_unregister_subsystem(&cxi_cfg_group_subsys);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_core.c b/drivers/net/ethernet/hpe/ss1/cxi_core.c
new file mode 100644
index 000000000000..d46ab3a1df10
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_core.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018,2024 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+
+#include "cxi_core.h"
+
+#define DEFAULT_PID_BITS MAX_PID_BITS
+
+/* TODO: Make this a per device configurable. */
+unsigned int pid_bits = DEFAULT_PID_BITS;
+module_param(pid_bits, uint, 0444);
+MODULE_PARM_DESC(pid_bits, "Width of the PID field within a NIC address");
+
+/* System info to determine if a system is mixed (C1 & C2)
+ * or homogeneous (only C1 or only C2).
+ */
+unsigned int system_type_identifier;
+module_param(system_type_identifier, uint, 0444);
+MODULE_PARM_DESC(system_type_identifier,
+		 "Identifies what type of Cassini NICs are present in the system\n"
+		"0 - Cassini 1 and Cassini 2 (Default)\n"
+		"1 - Cassini 1 Only\n"
+		"2 - Cassini 2 Only\n");
+
+unsigned int min_free_shift;
+module_param(min_free_shift, uint, 0444);
+MODULE_PARM_DESC(min_free_shift, "min_free shift (0 to 8)");
+
+unsigned int vni_matching;
+module_param(vni_matching, uint, 0444);
+MODULE_PARM_DESC(vni_matching, "vni matching configuration (0 to 3)");
+
+unsigned int tg_threshold[4] = { 0, 64, 128, 256 };
+module_param_array(tg_threshold, uint, NULL, 0644);
+MODULE_PARM_DESC(tg_threshold, "Array of 4 LPE append credits. Credits are 0 for immediate append, or 4 to 16383 for delayed append.");
+
+int untagged_eth_pcp = -1;
+module_param(untagged_eth_pcp, int, 0444);
+MODULE_PARM_DESC(untagged_eth_pcp, "PCP used by untagged Ethernet frames. Valid PCPs 0-7. Use -1 to use the PCP specified in chosen QOS Profile");
+
+bool switch_connected = true;
+module_param(switch_connected, bool, 0644);
+MODULE_PARM_DESC(switch_connected, "Connected to a switch or another NIC");
+
+struct class cxi_class = {
+	.name = "cxi",
+};
+
+/* For device naming purposes */
+atomic_t cxi_num = ATOMIC_INIT(-1);
+
+/* root debugfs directory for all devices */
+struct dentry *cxi_debug_dir;
+
+/* List of devices and its mutex. */
+static LIST_HEAD(dev_list);
+static DEFINE_MUTEX(dev_list_mutex);
+
+/* List of clients. Protected by dev_list_mutex. */
+static LIST_HEAD(client_list);
+
+/* Include here as p2p support is optional and we don't build the p2p file
+ * when it's disabled, but still need the ops struct itself */
+struct cass_p2p_ops p2p_ops = {
+	.get_pages = NULL,
+	.put_pages = NULL,
+	.is_device_mem = NULL,
+};
+
+int cxi_get_lpe_append_credits(unsigned int lpe_cdt_thresh_id)
+{
+	if (lpe_cdt_thresh_id >= ARRAY_SIZE(tg_threshold))
+		return -EINVAL;
+	return tg_threshold[lpe_cdt_thresh_id];
+}
+EXPORT_SYMBOL(cxi_get_lpe_append_credits);
+
+/**
+ * cxi_register_client() - Register a CXI client
+ *
+ * @client: client to be registered
+ */
+int cxi_register_client(struct cxi_client *client)
+{
+	struct cxi_dev *dev;
+
+	mutex_lock(&dev_list_mutex);
+
+	list_add_tail(&client->list, &client_list);
+
+	list_for_each_entry(dev, &dev_list, dev_list)
+		if (client->add)
+			client->add(dev);
+
+	mutex_unlock(&dev_list_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_register_client);
+
+/**
+ * cxi_unregister_client() - Unregister a CXI client
+ *
+ * @client: client to be unregistered
+ */
+void cxi_unregister_client(struct cxi_client *client)
+{
+	struct cxi_dev *dev;
+
+	mutex_lock(&dev_list_mutex);
+
+	list_for_each_entry_reverse(dev, &dev_list, dev_list)
+		if (client->remove)
+			client->remove(dev);
+
+	list_del(&client->list);
+
+	mutex_unlock(&dev_list_mutex);
+}
+EXPORT_SYMBOL(cxi_unregister_client);
+
+/* A device driver is declaring a new CXI device */
+void cxi_add_device(struct cxi_dev *cdev)
+{
+	struct cxi_client *client;
+
+	mutex_lock(&dev_list_mutex);
+	list_add_tail(&cdev->dev_list, &dev_list);
+
+	list_for_each_entry(client, &client_list, list)
+		if (client->add)
+			client->add(cdev);
+
+	mutex_unlock(&dev_list_mutex);
+}
+
+/* A device driver signals it's going away. */
+void cxi_remove_device(struct cxi_dev *cdev)
+{
+	struct cxi_client *client;
+
+	mutex_lock(&dev_list_mutex);
+	list_del(&cdev->dev_list);
+
+	list_for_each_entry_reverse(client, &client_list, list)
+		if (client->remove)
+			client->remove(cdev);
+
+	mutex_unlock(&dev_list_mutex);
+}
+
+/* Send an asynchronous event to the clients */
+void cxi_send_async_event(struct cxi_dev *cdev, enum cxi_async_event event)
+{
+	struct cxi_client *client;
+
+	mutex_lock_nested(&dev_list_mutex, SINGLE_DEPTH_NESTING);
+
+	list_for_each_entry(client, &client_list, list)
+		if (client->async_event)
+			client->async_event(cdev, event);
+
+	mutex_unlock(&dev_list_mutex);
+}
+
+void cxi_apply_for_all(void (*callback)(struct cxi_dev *dev, void *p), void *p)
+{
+	struct cxi_dev *dev;
+
+	mutex_lock(&dev_list_mutex);
+
+	list_for_each_entry(dev, &dev_list, dev_list)
+		(*callback)(dev, p);
+
+	mutex_unlock(&dev_list_mutex);
+}
+
+static int __init cxi_init(void)
+{
+	int rc;
+	int i;
+
+	if (pid_bits > MAX_PID_BITS) {
+		pr_warn("PID count (%u) exceeded max (%u). Using default (%u).\n",
+			pid_bits, MAX_PID_BITS, DEFAULT_PID_BITS);
+		pid_bits = DEFAULT_PID_BITS;
+	}
+
+	if (pid_bits < MIN_PID_BITS) {
+		pr_warn("PID bits (%u) less than min (%u). Using default (%u).\n",
+			pid_bits, MIN_PID_BITS, DEFAULT_PID_BITS);
+		pid_bits = DEFAULT_PID_BITS;
+	}
+
+	if (untagged_eth_pcp > 7 || untagged_eth_pcp < -1) {
+		pr_err("Invalid untagged Ethernet PCP value: %u\n",
+		       untagged_eth_pcp);
+		return -EINVAL;
+	}
+
+	if (min_free_shift > 8) {
+		pr_warn("min_free_shift (%d) must be 0 to 8.\n",
+			min_free_shift);
+		return -EINVAL;
+	}
+
+	if (vni_matching > 3) {
+		pr_warn("vni_matching (%d) must be 0 to 3.\n", vni_matching);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tg_threshold); i++) {
+		if ((tg_threshold[i] >= 1 && tg_threshold[i] <= 3) ||
+		    tg_threshold[i] > 16383) {
+			pr_warn("tg_threshold must be 0 or 4 to 16383\n");
+			return -EINVAL;
+		}
+	}
+
+	cxi_debug_dir = debugfs_create_dir("cxi", NULL);
+
+	rc = class_register(&cxi_class);
+	if (rc) {
+		pr_warn("Couldn't create Cray eXascale Interconnect device class\n");
+		goto err_class_reg;
+	}
+
+	rc = cxi_configfs_subsys_init();
+	if (rc) {
+		pr_err("Error while registering configfs subsystem\n");
+		goto err_configfs_reg;
+	}
+
+	rc = hw_register();
+	if (rc < 0) {
+		pr_err("Driver registration failed\n");
+		goto err_drv_reg;
+	}
+
+	if (!(system_type_identifier == CASSINI_1_ONLY ||
+	      system_type_identifier == CASSINI_2_ONLY ||
+		system_type_identifier == CASSINI_MIX)) {
+		pr_warn("Unknown system_type_identifier (%u). Using default (%u).\n",
+			system_type_identifier, CASSINI_MIX);
+		system_type_identifier = CASSINI_MIX;
+	}
+
+	return 0;
+
+err_drv_reg:
+	cxi_configfs_exit();
+err_configfs_reg:
+	class_unregister(&cxi_class);
+
+err_class_reg:
+	debugfs_remove(cxi_debug_dir);
+
+	cxi_p2p_fini();
+
+	return rc;
+}
+
+static void __exit cxi_exit(void)
+{
+	hw_unregister();
+	class_unregister(&cxi_class);
+	cxi_configfs_exit();
+	debugfs_remove(cxi_debug_dir);
+	cxi_p2p_fini();
+}
+
+module_init(cxi_init);
+module_exit(cxi_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cray Cassini Nic Driver");
+MODULE_AUTHOR("Cray Inc.");
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_link.c b/drivers/net/ethernet/hpe/ss1/cxi_link.c
new file mode 100644
index 000000000000..8d53bbb2f027
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_link.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cassini LINK
+ * Copyright 2022, 2024-2026 Hewlett Packard Enterprise Development LP
+ */
+
+#include <linux/kernel.h>
+#include <linux/hpe/cxi/cxi.h>
+
+#include "cass_core.h"
+#include "cass_sbl.h"
+#include "cass_sl.h"
+#include "cxi_ethtool.h"
+
+static const struct cxi_link_ops cxi_link_ops_sbl = {
+	.init = cass_sbl_init,
+	.link_start = cass_sbl_link_start,
+	.link_fini = cass_sbl_link_fini,
+	.mode_get  = cass_sbl_mode_get,
+	.mode_set  = cass_sbl_mode_set,
+	.flags_get = cass_sbl_get_debug_flags,
+	.flags_set = cass_sbl_set_debug_flags,
+	.flags_supported = LINK_DEBUG_FLAGS,
+	.link_up   = cass_sbl_power_on,
+	.link_down = cass_sbl_power_off,
+	.is_pcs_aligned = cass_sbl_pml_pcs_aligned,
+	.media_config = cass_sbl_media_config,
+	.media_unconfig = cass_sbl_media_unconfig,
+	.link_config  = cass_sbl_link_config,
+	.link_reset = cass_sbl_reset,
+	.link_exit = cass_sbl_exit_legacy,
+	.pml_recovery_set = cass_sbl_pml_recovery_set,
+	.is_link_up = cass_sbl_is_link_up,
+	.eth_name_set = cass_sbl_set_eth_name,
+};
+
+static void cass_sl_exit_legacy(struct cass_dev *hw)
+{
+	int rtn = cass_sl_exit(hw);
+
+	if (rtn)
+		WARN(1, "Cassini SL exit failed: %d\n", rtn);
+}
+
+static const struct cxi_link_ops cxi_link_ops_sl = {
+	.init               = cass_sl_init,
+	.link_start         = cass_sbl_link_start, /* TODO - temporary */
+	.link_fini          = cass_sl_link_fini,
+	.mode_get           = cass_sl_mode_get,
+	.mode_set           = cass_sl_mode_set,
+	.flags_get          = cass_sl_flags_get,
+	.flags_set          = cass_sl_flags_set,
+	.flags_supported    = 0,
+	.link_up            = cass_sl_link_up,
+	.link_down          = cass_sl_link_down,
+	.is_pcs_aligned     = cass_sl_is_pcs_aligned,
+	.media_config       = cass_sl_media_config,
+	.media_unconfig     = cass_sl_media_unconfig,
+	.link_config        = cass_sl_link_config,
+	.link_reset         = cass_sl_link_down,
+	.link_exit          = cass_sl_exit_legacy,
+	.pml_recovery_set   = cass_sl_pml_recovery_set,
+	.is_link_up	    = cass_sl_is_link_up,
+	.eth_name_set	    = cass_sl_connect_id_set,
+};
+
+void cxi_set_link_ops(struct cass_dev *hw)
+{
+	if (cass_version(hw, CASSINI_1))
+		hw->link_ops = &cxi_link_ops_sbl;
+	else
+		hw->link_ops = &cxi_link_ops_sl;
+}
+
+void cxi_link_mode_get(struct cxi_dev *cxi_dev, struct cxi_link_info *link_info)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	hw->link_ops->mode_get(hw, link_info);
+}
+EXPORT_SYMBOL(cxi_link_mode_get);
+
+void cxi_link_mode_set(struct cxi_dev *cxi_dev, const struct cxi_link_info *link_info)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	hw->link_ops->mode_set(hw, link_info);
+}
+EXPORT_SYMBOL(cxi_link_mode_set);
+
+void cxi_link_flags_get(struct cxi_dev *cxi_dev, u32 *flags)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	hw->link_ops->flags_get(hw, flags);
+}
+EXPORT_SYMBOL(cxi_link_flags_get);
+
+void cxi_link_flags_set(struct cxi_dev *cxi_dev, u32 clr_flags, u32 set_flags)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	hw->link_ops->flags_set(hw, clr_flags, set_flags);
+}
+EXPORT_SYMBOL(cxi_link_flags_set);
+
+u32 cxi_link_flags_supported(struct cxi_dev *cxi_dev)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	return hw->link_ops->flags_supported;
+}
+EXPORT_SYMBOL(cxi_link_flags_supported);
+
+void cxi_link_use_unsupported_cable(struct cxi_dev *cxi_dev, bool use)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	cxidev_dbg(&hw->cdev, "use unsupported cable\n");
+
+	if (use)
+		hw->sl.link_policy.options |= SL_LINK_POLICY_OPT_USE_UNSUPPORTED_CABLE;
+	else
+		hw->sl.link_policy.options &= ~SL_LINK_POLICY_OPT_USE_UNSUPPORTED_CABLE;
+}
+EXPORT_SYMBOL(cxi_link_use_unsupported_cable);
+
+void cxi_link_use_supported_ss200_cable(struct cxi_dev *cxi_dev, bool use)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	cxidev_dbg(&hw->cdev, "use supported ss200 cable\n");
+
+	if (use)
+		hw->sl.link_policy.options |= SL_LINK_POLICY_OPT_USE_SUPPORTED_SS200_CABLE;
+	else
+		hw->sl.link_policy.options &= ~SL_LINK_POLICY_OPT_USE_SUPPORTED_SS200_CABLE;
+}
+EXPORT_SYMBOL(cxi_link_use_supported_ss200_cable);
+
+void cxi_link_ignore_media_error(struct cxi_dev *cxi_dev, bool ignore)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	cxidev_dbg(&hw->cdev, "ignore media error\n");
+
+	if (ignore)
+		hw->sl.link_policy.options |= SL_LINK_POLICY_OPT_IGNORE_MEDIA_ERROR;
+	else
+		hw->sl.link_policy.options &= ~SL_LINK_POLICY_OPT_IGNORE_MEDIA_ERROR;
+}
+EXPORT_SYMBOL(cxi_link_ignore_media_error);
+
+void cxi_link_auto_lane_degrade(struct cxi_dev *cxi_dev, bool enable)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	cxidev_dbg(&hw->cdev, "auto lane degrade\n");
+
+	if (enable)
+		hw->sl.link_config.options |= SL_LINK_CONFIG_OPT_ALD_ENABLE;
+	else
+		hw->sl.link_config.options &= ~SL_LINK_CONFIG_OPT_ALD_ENABLE;
+}
+EXPORT_SYMBOL(cxi_link_auto_lane_degrade);
+
+void cxi_pml_recovery_set(struct cxi_dev *cxi_dev, bool set)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	hw->link_ops->pml_recovery_set(hw, set);
+}
+EXPORT_SYMBOL(cxi_pml_recovery_set);
+
+void cxi_link_los_lol_hide(struct cxi_dev *cxi_dev, bool enable)
+{
+	struct cass_dev *hw = container_of(cxi_dev, struct cass_dev, cdev);
+
+	cxidev_dbg(&hw->cdev, "los_lol_hide\n");
+
+	if (enable)
+		hw->sl.link_config.options |= SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE;
+	else
+		hw->sl.link_config.options &= ~SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE;
+}
+EXPORT_SYMBOL(cxi_link_los_lol_hide);
+
+/**
+ * cxi_is_link_up_vf() - Query the PF for the current link state
+ *
+ * @cdev: VF CXI device
+ *
+ * Return: true if the link is up, false otherwise or on error.
+ */
+static bool cxi_is_link_up_vf(struct cxi_dev *cdev)
+{
+	const struct cxi_eth_link_state_get_cmd cmd = {
+		.op = CXI_OP_ETH_LINK_STATE_GET,
+	};
+	struct cxi_eth_get_link_state_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return false;
+
+	return !!resp.link_up;
+}
+
+/**
+ * cxi_is_link_up() - Returns whether the link is up or down
+ *
+ * @cdev: the device
+ *
+ * Return: true if the link is up, false otherwise.
+ */
+bool cxi_is_link_up(struct cxi_dev *cdev)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return cxi_is_link_up_vf(cdev);
+
+	return hw->link_ops->is_link_up(hw);
+}
+EXPORT_SYMBOL(cxi_is_link_up);

-- 
2.56.0

