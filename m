Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795001151;
	b=Vf3Vwuqcv3hJL/A/hBbAbMIpLWPo04C5seWLc1qwawRMvsjN/vtfiukflgMz4TAIm2LN
	 bVCD8Y9dSedqcWd0gsrE4mPHVVlBFODSVqDtlFpmjWduVkuFBeVSNVQoCjSmS6DDLqrQG
	 F1bJnjgaKnAAIfRA+iZS2M7lnH6rgGLK4KajycOGNRpC1x/mx8t7/bzEccufspQ04SJC8
	 ZtE/SPIpvdKD+/oZlDzwFt2mOW5jQ/yZK/ggosvD4788dtZcwU6q158PFCnrqzlesUJmg
	 ngfrqfPJUu2oIn1gRJbe/UtLcImsCV9Gee11FNc3fXBq4viTylTLD6KRCs2zofi6cWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001151;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=S6KS9fD0pLBKmHIHqYmhqFr6ydbJAzSUHd1coRdsPnc=;
	b=5IYdMuL+4KkYJhAsjiU25Sbqpz7Uovn92Xt5r1UN7X9RYEhYoGoqvVR8yuqaZ4gh6rqK
	 O9g2EdhYDGVjYUfGh8hNSCX3T0OtTb9cQhYxM7T+wGcDn5sAwZmJef8XwBLcVwU0JWV0f
	 VKIpCiq2VKigRdmg3xfKQNC/mQl/WhN7vVV2JuySIklDZnHCV7LeOkbc5BrFOuUlWFJRL
	 vZytkmwpAd4XmN7aim9YQnuYPy4z8e+QdgbgmOPtFBvUZd+t0vutmLWiv2J4PGOV+xK5e
	 muLnF0j6aVmqoqOcG2EMQRtzu3AUiVZ4Z0Zjj4ICeBj2uhf2FUpo0b6FW6X+mBuTjsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=mW4hqGWi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.95
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022095.outbound.protection.outlook.com [52.101.101.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03161606A320;
	Wed, 18 Nov 2026 11:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03161606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=mW4hqGWi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5YSrHjmrySolsFJYQ9aVLrKzcJvSzQhuZxEItvOfd43x7CtfA9gkhWdCluew7xcTkD29VPUg+BkIi/6GoGI/cobiMO3MyHxHwRQXRZDtBiCAUIg6QubAghyZsd3HfEf8FdqlYTQ6U+ivzuYzpV+abAjyaML2bLV3y8j5BvYaVID5k9hPSnEcM7NQOoeX5SYMgWWZG4jJoGgCDyRAYboTy5fYUtOu1uUth1YL3o2ooOOjccKgbU+x3IJiplGguemmYVCDgbTdSKw1nCl8Z4wjOdar9UaJI6r8U3m7BP4hskpAK4wEt91zUKYJVKYeZyoeqjlW7p2E/4mKFVR8ZblHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6KS9fD0pLBKmHIHqYmhqFr6ydbJAzSUHd1coRdsPnc=;
 b=UL6fYH0opI/kygxp24cdoXyemSsNdlxrFxlj+G/dkhVHkbLIILH/ZFQjW9OOXjKEB9XsmQukF/zHt5XugtGUEHS/PZyz5aJQwUZS+S0V8a767S9vhQmCmdM064QUSY79GbxQD2lvVTiN6ZjU622EmZRR3qPkPbnflRS2hHf22xjfBw23GiuwYl16tPreYQiMlbbTHwkZEsHUCjpMTU/ufWMHrl0rbedB1I/d+wM0Y7/eeLEiNUJ1gwuUYEZXaCk63UtM087XNEAB7eXkc+k/IdbkZB2VFCjIjj/kz42m1OVXjwNIqDW4xob/akPDiNCRjWCdPhVY7iAYMaW+7SPcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6KS9fD0pLBKmHIHqYmhqFr6ydbJAzSUHd1coRdsPnc=;
 b=mW4hqGWiSBd6Gp3Weej1qfTttiMmJhV7Z+PPwk+GCH1FVU/Qtqz/s10Ij/gzO/as6TEGaEJlZn2U0IBgUDhuPSvNT+wezaOJBiKgCcghI7N/6z6+8gUrnXj/7EOvjIO//Y8Crb4rwagcQE74OpzRo2Gtbduy5TrXXrc3dlYpyFA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LOCP265MB8642.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:25:47 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:25:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 11:25:46 +0000
Message-Id: <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
Cc: "Sami Tolvanen" <samitolvanen@google.com>, "Gary Guo"
 <gary@garyguo.net>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "kernel test robot" <yi1.lai@intel.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260820135733.37121-1-gary@kernel.org>
 <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com>
In-Reply-To: <avy_9SPRaPSKD8b4@google.com>
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LOCP265MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 2535ec25-1ea4-4dbf-1679-08df4566b124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|10070799003|6133799003|22082099003|18002099003|261009223027099003|56012099006|10067099003|4143699003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	UCeY1fxXpzZlyd8FjC5Kc/m3vP1ovefySc61ZJhUmD5w9aExjC2iVDANm3ruWrAC8oTZR1bS6mF0HzJxxcGVMV4B/TlP1/7fgneWfxrLDCvwpn68U8f77vTp8HwcVXeadTWVVVhZeHmp6Owf0IUtQyk2KfPSlb39xq5CkCoKxuVl3NL7riuKxm2AgmDa2AkPUpLyraxADL2ucz9L+vXsVmFC7aB01F8bP8t9Rfh7s1KApriLk9h+wYjaMSrq+RbQ3UnUNkLPIzlxrtyhMU5Bnlno4sIy1oIb8AGtqRx31jetf9s2HMinfNzWwm6HuJGQRLx09/iH1L4Tr6MD3wsfRgikrz4LkB6H+V5UpE7QAe9tocl6ZRRmC1w2P/duuiMhzrGxT7nL5dO7VP6w6t920/AatIKIOT/FRVo0MB8kuVLdclXbHcs3H3O2+IrFC1oNwzTityLEYBu02VvN9nIOquyrJ7I6G+DRwa2i4vnobEP5kqfHfPGyrQOSeuOhO0lc5LndaBB09FRgYyJxbsmJjQRgy16nGy2O+UHuROr5rqu1geihe7HJ3v+V4bNCJQ6EbC6QrzbsygagM5QrjSkwUyuEwjPi6hO5EV3Wd8hYAt6W4mQE0MEnT6DklImSo/Nzd09p5cQw4VTxM+LIAxeK4YEfo9DIzotrhljMlED2x08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(10070799003)(6133799003)(22082099003)(18002099003)(261009223027099003)(56012099006)(10067099003)(4143699003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGRiY2prT2ZEK1dJbllrZ0FRS2xPK0JRTWpPakQ0NzhMMFFsT1E4OXMxdldO?=
 =?utf-8?B?dmx4bFFLMkJiRExzLzFXcXNlc2dZTWhVdzZBTjl0UXlpNDF2cHVGUjRJTVlK?=
 =?utf-8?B?SjRtUUNuL1pFTGlnV29KaHdoWkw5OUNDUFpBenNDY1lvWEdZaXR3bDFSYWhq?=
 =?utf-8?B?M3BsdzE2WUZHMDkxdjlTbGtaSG4vYTJwVmdhYllqVmRTTVdQVzZEWjRzRmJq?=
 =?utf-8?B?OVpJbjBjOHBXT3I3SEY0MXNVa3lVTmRZVTRJL0x5YUVFbHkzMldHTFQzZzlk?=
 =?utf-8?B?dDRTSlg3eWNXeXFhekhPZUpQck1uZ2dheTI4WktaNkJCTUxiUmtlbEY5TzZz?=
 =?utf-8?B?TVVaY0NqSnIyblZlQjNnWFQzL3gxcXliN1JpZ2JXTERMZUtZdDF4NjJSbCtt?=
 =?utf-8?B?b1ZiYUptV0FWMlh5elhIYklkRTBTZmdaK3QvUUJNaXJ5ZXJFZk5aNEYycXhP?=
 =?utf-8?B?MjllM1ZQazhoMHcxSkdrVTFldThGRVpGenZoREN1a3Frb3k2L0pNbHVMd3Y0?=
 =?utf-8?B?cEJ2RnowSkhtalpSVzRKNTdnODlLMStQVTF5ai9rM1FadFdrRFFyOVhLNFg3?=
 =?utf-8?B?eUJEWlFHU2doWkpNemhZU1ZWL1V3aS9uRUhsT2ZUQ2lRU29SYVFCYk1CeHhr?=
 =?utf-8?B?VC9GWjRjMnY2QlBsajBPZWJsMXBFcGhEUktiVXBTWjF5Y3lrb0V4SkJQc1Iv?=
 =?utf-8?B?aHBEUU0vaDBhNWpJMUtMeVplM3BQbTJCOWJBZU1DODN4WEI4MlNHK2UydkYz?=
 =?utf-8?B?WjVzdzFKR3BTaGhLc3hndzVQeUtRaVBERGtqYVk3TXJvR3o2NnNHQXduV3lo?=
 =?utf-8?B?NHhFaU5DdTYvOFpwZkRJRCtZL0kvYnRlN08xekNLQWp5U2dmWTdaL2hYVXpX?=
 =?utf-8?B?Uk1WRXdOaXpyQk82a2ZnTFlsNDh3SDgwVzl5YlJjcnNqaHNTSitFQVgyeFRz?=
 =?utf-8?B?dG8xcDJjWDRMalpwdWFkUkYwWGlYRWduRGJ4d2U4b2wzTklqZnZOd2pxbEtQ?=
 =?utf-8?B?UUNPMEFESGpraTlLL1F2R3JYbWNBdCtjaHNocEV3THZrbUMwMWptbkcvNFRh?=
 =?utf-8?B?SXlDQmI2SVJZcWhiRWkxdU9HSHQwT2QvZllmcXpPOGpROXc5OEcweVJ3UlRp?=
 =?utf-8?B?cjlVN1ZqLzU4L2czcHRaeHlNN2x2Q1BtRjNYUjVvanA5NkZrSWhISkdNNkxB?=
 =?utf-8?B?WEM4NGpPMlk5K3M2QkFHVW5IZkdidGdsUUFSSXlSbmovUFRJZnVGRHl1OHAy?=
 =?utf-8?B?b3dBQkFvMGxFSlFTVzN4UlIzSURjUGZpcTJmdzh5TDFFbkpTY0Y0Y0xLaE5Q?=
 =?utf-8?B?R0JIWWZSR0U2SDBhcW5lSzNtNUZKczdpalluS25qc3c1Q0NyTGw1aDFuOUll?=
 =?utf-8?B?NDF1QnpLTDNoTDBCT1poWVB1Rjh4Y3A2ZTBNaEtVL3ZPYVlWdGttbkFRRXBR?=
 =?utf-8?B?VkFKODI3cGNyV0FlL2NTQTNrZG5LR0F5YXY0NWI1U04xMEUrZnQxMmdHaUJT?=
 =?utf-8?B?ZzhLajRkOWJWRkxwWENXYmZoQUd2KzhvY3MwZlgxM0RoYkZTa0JYMG5odG5P?=
 =?utf-8?B?TDdrNTFyMDkrZDNpeW1YaFlGZTZGcTJlQTFGbmZlc2JVc3V3Z09oaXpuVUps?=
 =?utf-8?B?OFVadVdOOTBnMitialVTWmFSSkFGWmlXanhTUHlJOFRSa29xd1hkMWFXNXdI?=
 =?utf-8?B?TEdaKyt1QTZEU01oa2NxY2g5dXdOZGlNWG1relM5UTk5MkdtRmMxL3RUSDVk?=
 =?utf-8?B?SHdwQkRmclJpeGM2cTFxU25RS01WRGpRQXdVaTZWRXI4elVTRnpXbWM3SjdK?=
 =?utf-8?B?YnJZY2g1WjRKSkJWdEJqWU11UlRBQ1N4V0p6bjhNeG8wSDZPZ0plRCt1REFv?=
 =?utf-8?B?VlQzTlFManVtaUxGL0Q1Q0dkYlNKNC9mdXB3S0JSTnlzM282OEN4d0lyNktv?=
 =?utf-8?B?ckVvMG55bFQxcUhOekM3VUVNOXlNcGV6UkVQSSt5Z3BlSGQ4emZTd2VRQmto?=
 =?utf-8?B?a0MvYitMeTVpWTJSTXFOR3Z5K3Nndk52RjI0ditPNy9pQ0F4dzRCSjZPSnpS?=
 =?utf-8?B?Ly9mTDg1SWFyU2tOcU9mRGxjSyt6ZklkdzNwSzR2RXlmRVFDekFSeVJUZHM2?=
 =?utf-8?B?MXgvVmVQUFZxVTRiazd0clhXaEUxRk9LMFVvSU5PRDN6R0drcWtKdTVkNzB0?=
 =?utf-8?B?L0lmV0ZCd3crcHRmRHdtS0xEMnhFOVJhSXZUNWZUQjA1cjN3bFg2SGVoQWJC?=
 =?utf-8?B?MU9YSThLV1diL0w4UlB1ZFByZmpROEdGOW1XREdmUG9SUnIveDc5NlMwTFBx?=
 =?utf-8?B?TEhVbnA2VHVFLytrL3ZyQ0N1d09JeXVZWnNJUUFQZXpkVHY3Tm01UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2535ec25-1ea4-4dbf-1679-08df4566b124
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:25:47.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmsTIrgM3K3dDjD/UUVKcbZohTf/weWO2bJCV5ZsgAeKCr1ZvPwwrROxPbZxE9xXlTKqVhHh1g8abP/ZD3JLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8642

On Tue Nov 17, 2026 at 8:58 PM GMT, Alice Ryhl wrote:
> On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
>> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@goog=
le.com> wrote:
>> >
>> > The LLVM fix itself is trivial, and it looks like a pull request for
>> > it already exists. I assume we'll want to drop this flag for fixed
>> > LLVM versions when they're available.
>>=20
>> I will link it in the commit message when I pick it up soon -- already
>> did in https://github.com/Rust-for-Linux/linux/issues/1132.
>>=20
>> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/is=
sues/2.
>>=20
>> The `-Zmerge-functions` flag is internal but has been there since Rust
>> 1.34.0 in upstream commit:
>>=20
>>   b91d211b4030 ("Add a target option "merge-functions" taking values
>> in ("disabled", "trampolines", or "aliases (the default)) to allow
>> targets to opt out of the MergeFunctions LLVM pass. Also add a
>> corresponding -Z option with the same name and values.")
>>=20
>> so that should be fine, but I will ping upstream Rust so that they are
>> aware we are using it.
>>=20
>> And, yeah, agreed, we probably should remove the flag conditionally
>> later on, to confirm the bug is gone etc.
>
> Function merging should also be disabled with gendwarfksyms. It causes
> faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> incorrectly causes the former to get the CRC of the latter.

Do we not want merging at all, or only when the types are not going to matc=
h up?
If somehow the KCFI type metadata is always emitted, will two functions wit=
h the
same KCFI type metadata be mergeable for gendwarfksyms purpose?

Best,
Gary

