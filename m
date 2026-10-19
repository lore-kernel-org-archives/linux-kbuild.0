Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792423628;
	b=wbIOT4dCveo9JkpT5LUXuDlcZf/yiX4Jk/IJAPAj8NE7rUbeUGIIqZcdcnOs7eN/i2oO
	 dX6paid65O/KiIxhUqjdly942k20kXJsgf5UTFULcQYGLTz4IaqyjtmLYSxKgGrQMPWt+
	 YmMywQiADzX9Q0DjNZPgJBCHBJjgnTqycX8YefiWzscaezzgHwX2AWtdpF0raQquP9ZHZ
	 OFpTmi5XAKfKVm1JPdik0+Z/spDN7aLp4vwWdI0Hwu9uQcMs7Exm17RDaNmFskzBwsyml
	 M38Daux2MLTYA4Qgqp5rqlfsQTUAoAInZd8riyWavj0JAtsTbHmGVAK/0qye2KWFOyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423628;
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
	bh=0fFKCtmcV7Z/b/qf9UFqFjiqIaTYbRmHh6zBXGUjDyE=;
	b=yzZSTAsnZnF0yh+Fe7z0c9y10XWTa0+dzeFfAKwupmYd4Y0S6pCT+OI7ouGXLy0miYd7
	 P6rJIdT1lk1r0lnd3it+OSFEThlnvjP+DqvUalN+IWUKam79WlgCctMyawxjZEOggJ6VP
	 UFRJhf4MARG0XA8MDK+MFvLKNW9t26aZ7IInHmNLcQvfKXT6qjrEsQcMl/01OPWvPocuS
	 Qm4tGLZJZakpV7+HJ0vTe6xUmWFO/4z1ulH66O5fda6ltFUERBUakLuK+Jn2S4sPkVVpw
	 pwgXN0VzRnrFA1Zk7qrgUFsYhbpjmQgUUzDlNjM+Wu1PS+1cGm4N0h8jrrrc6gXCyaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=r5xqp0B3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.139
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021139.outbound.protection.outlook.com [52.101.95.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58CA60B39B6;
	Mon, 19 Oct 2026 15:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58CA60B39B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=r5xqp0B3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qViw4gsgVKmH5PPpAVjObylhaSrUMIvyxX8TX54DAgrqerMXhfglVym/X3BD+ApMi3eVyMngPnQ4MieUubnRT/rtYMYu6JCIsIKQPVpZ6NhWHTvrcXb6uA56P51BYpx9IsELhaF1fucf0WqU2jZngl90fXITqcdSXsei/XsN+CVzNeeRMDsXdPyGYQqkp5aD0sg8gaLnzcfWF3aJAfTtBpMQkX4X/D+FFt54Lq/noXMpOVfeXQsZRvKMb9oK0eEdZtez2t891q7O2JUVoT8BT3LcmQAFC/ccNs9OnE1OHhXWfVoxU5Nm2sRsVYjr+stbdKtR8/jcHQvmDUFrrnAE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fFKCtmcV7Z/b/qf9UFqFjiqIaTYbRmHh6zBXGUjDyE=;
 b=Bu2hf23lTIkGrJP2mTACzHEWXt0ioI6nF5gJEJtm3rbvndnMVE9pFfA1Ocmlub9ZgmlhnJxnJwgka1ExBPh9ofgA/lofjBjwxS7yP+nM6Y4zYiFjPRo+FZyBUYrvhUE3VXS6ySuq5sqwHu2nFvNjhcHa66eKQAwJgW6H90OE08ZptM9smmOIgKAyzzD+g2KJa3+dqlWsIzSdb24aF0X+QGiA3damWWzZ7vRZ88stwZiCbZRxFxOKS98vl7XpvVk/Z4g33t11iH7fNLo4219DpirUOTG2rtI7HRXv+NEG6Gq+GSrwhzS1ymEdOXaZTKiapENC1mXlgE/nXzp0SoTSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fFKCtmcV7Z/b/qf9UFqFjiqIaTYbRmHh6zBXGUjDyE=;
 b=r5xqp0B3NOhcyH9W1bfoDUCKJnulSDAvXLdzy5ko1k6tGVyp4fCUYXcMC/AE0XdfdlAY119LGj9/glijyzzRNBut83GNvZYPzNwhbtbjAiIz93vi6cRI8Edw0baEV9Zyl2/JC5HvDeO5xVF7IizzDEHNSQRt/qKSxo2JWInpQ4g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6252.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:26:50 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:26:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:26:47 +0100
Message-Id: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
Cc: "Alexander Potapenko" <glider@google.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, <kasan-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Yury Norov" <ynorov@nvidia.com>,
 "David Gow" <david@davidgow.net>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alvin Sun" <alvin.sun@linux.dev>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Petr Mladek" <pmladek@suse.com>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
From: "Gary Guo" <gary@garyguo.net>
To: "Marco Elver" <elver@google.com>
X-Mailer: aerc 0.22.0
References: <20261015145714.3327543-1-elver@google.com>
In-Reply-To: <20261015145714.3327543-1-elver@google.com>
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7b8ba0-0483-4e9f-defd-08df2df5648a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|10067099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OYEzN7B+fIphDFuMDRvVy4BDDFyEwWoGN92tl1r5FN1z4WI69W5OTuVPy2ugogbR5c3DtFWauiiXIEtQ0C9mF2wVx8XBCrb6pjkEqEQoxJM42wymVPUsvlks1bCnR0wSwwnz4LnnWxSELYIId8rskjAz8GWPUCMLQL/R3QqG8lB6j765j8C5f/Pjr4TmcrzGvdWSEiiRDm0r6rqfMB4DI6mYJzgyUDAUw3DqwWCVszPgIGJDLnyh6eqMgFJhOLkji3CKx/2zIzXz4GciEX9U/43aJPX9miN6v2XwJTE43wlZ362lEO0FtRkBgx2hlAHhzkVNqyF8D1hIlEBb/8ot6abRNHk+fIUlWMvnwGfeCJazkv5DToppFMI46zfR00SgxOoo63aSttF3bd+5bT5a3h8S/OLT9T5uXBpJQzK0C3cDXIbgL2oVz6CM6bxKdIMJVh11RhsNQ0BttsJToPVGPdVGw4Na03Wo15tOBIZsrhpYRbprpZUwNp+n2JTLF9n5eiq8l0WJ8xDc7712FpeFpiOalrdJhCHBEae5xDlhZYjLtaYJV9i4ED06lkDUxFMxH504F7WbRzKafkXV59D+w6cULaTs2aK7k35DvJKtYTbMW91tVdLD6YWONUrhiAYL7qb2xNsWrDn7twap0Lc4fFWh0MJHHtro9B07UCpedJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MStBdm9WYVpxUVd2TDB1Vks4YitIL01vWkRLV0FmWUZraTNUSW81a01NZWNS?=
 =?utf-8?B?Zm1mWkJPL2JZZVJYd1ArZTJKTXByUEVITXpiTUlSUDZCRXR2eEhyc0VPR0lO?=
 =?utf-8?B?bVMvd2dvOXIwMTV0b1FNbEtxYmRWeW5uZmowak5NL3hVU1ZMV254N0FxUXpn?=
 =?utf-8?B?N21rc1ZUaWJYeDZDa2t5eTAvMHBZSUZleWY2ZmF5RDdMRGtjdFRyL0lBMHZI?=
 =?utf-8?B?T3BMZ2ZUbnVRNGpJUHZEdTNIbkpmakZBRkNlS0pqNytQTWpyNUdNRmtSVzZQ?=
 =?utf-8?B?UCtuZlZPZDZMeFlMcWY5R3dCNjFLN202SG83eVkxOTVIUysvTTZYYTUwcStR?=
 =?utf-8?B?VTZ2SjhxUlpzZkdkU2FuZGdKNVdrU0hNNjZ6RGtGOEpZSzQwd3Ntek9hdUxs?=
 =?utf-8?B?OE1jSWVNaUJPbk0reGJJTkxLM2U1Y0YwSzNQRkV5NTVNZU9EQlFaeGZHVDln?=
 =?utf-8?B?dVRXRnFyeC9jK3dMbW13UElRV2N0SlZIOG4xOGZUUktJU3BtSWk3V09jNXV0?=
 =?utf-8?B?Wk1jSHRXYjFTdStJNFdJeFFMMU1hL0JRcC94eVd1SDB0SDl2OGFTTVdWeXZU?=
 =?utf-8?B?NENIc2c3Q1BqQjlwRXFwWmRuZEYxNTNwcC84WWMwWnEvZUFFWFM3eVAwNnNW?=
 =?utf-8?B?eldZdDB4eWhjYXlISW1NMExoSVVCa2VkYUZ1RjhUUERtWFZZZis0YkpyQlQ2?=
 =?utf-8?B?NXhVWW1NQ3B0NFp0SGlUcTF4NFJsa2l5dmpXZ3pFWGxWY1AzOXl0WkluMzdH?=
 =?utf-8?B?eHoxL3NNdnQ5dkV2dDBBOHQ4TFpKd3QwREF5Y3I0ek84OU1HL1NFVE95Qnpv?=
 =?utf-8?B?NXVmUUZTV2UwSWM1SDJuSHVqa1gzWm10NDNHUHRwMUlCblZPNERtUElnY2l3?=
 =?utf-8?B?V0g3b2FZMnhka01RZDhqYmtBM3FrenNaL055RnFydlFzMmtFcXZQdUZEM0FN?=
 =?utf-8?B?b2lTRVQ0WllJTGFnV20yY2NMZFhrbHZjd1JnblIzV0NoV2lJNWwrOW1lNGo5?=
 =?utf-8?B?VGNBbzRJdHYvSEpaUmRCMXZzRXpzdld4UzVaQkRuVGZ3SHBPZmNMQ3FrRzla?=
 =?utf-8?B?a3BTRkt0ZEVvVVhSK1VDTXFXN2pZbzBVMG9NMUFzZXVDUWxJbFp6NU5ieVVN?=
 =?utf-8?B?UEFOTkcxRkU2RW1vNER1cWczcGd0S1I3SlhmSHk5WHFESlNVd2F1VHI3d3pu?=
 =?utf-8?B?VVNZQzFGMzl1MkVDOEVqcjJYcUZ0WXJ2M2tIS1ozdFp0d1JHd3g0K1preVJT?=
 =?utf-8?B?Z1Q1a0JFbmVVTDBVNDN6ajZyREJtSnVCVW50ckxCdWtGNnl4VkRySU9hRWZl?=
 =?utf-8?B?UWc4a0k4N0ZLMFBUdDVTKzNObGpuR3VwK1dSMSt1MVVERE9hUEhIVDZ0azRM?=
 =?utf-8?B?aHBEWjdLRnM2YXJtaXFvTjZiZnZPem1TSW93aXhuSktnZGlJM0YySXg2b0o3?=
 =?utf-8?B?cTJBcUxSMmdvaWFmekxyNFNCOE1VYUZZRXRUcGpoeFZlc0o5Wk5uTXBXNCtF?=
 =?utf-8?B?cW9IMjJGemFKQ0wzUmpENkpkYnYrckZjdE02Qnp0NklkZkZ5SFFxMWtlMDIv?=
 =?utf-8?B?RFlKNUVybDJHbDJyRjg5UFhsWm5FQ2ZGNHk3Y0Z5OGhyWk1DSFhWbGxkMzMy?=
 =?utf-8?B?VU5lWmdoU2VlVTc5STVjR3VpcWl2eUFoMEFhc05WMThCenptK0U5aWhZMW5p?=
 =?utf-8?B?bkZyNWRDOVU0Y1l2cm1qQjZwTkR3YnZiSGNYVG5wL2N2TEhOdDVKUUVpZHVX?=
 =?utf-8?B?Y1NZMTZ2UUcrK01PMk94Q1ZCT3FES21OYm9xY3BtbGpWc3NqVzBPVW9lbTRo?=
 =?utf-8?B?YlI3VVl5TzlZQmR5TzhUK00rNDkxYi9Tc09zbGJmTFNUQS9acnFFT3k3ZlFY?=
 =?utf-8?B?aWFkWGFPYVZkRXdvSFAzK2xlZjRYczlmVHpZUjlma3p5WFZqM2xUY3NwakRu?=
 =?utf-8?B?eVllL3RIL3RyM1NOSUNTOFFuVkZvUzFNVDNTRXhrMGVnSkxuUXFqdWhqOXZX?=
 =?utf-8?B?aldIRERDSFJhZ0lsMS9JT0xNMG55S2kzcTVYcUpZK2pHVUUwTGpvRWFCdUZK?=
 =?utf-8?B?OGVpMmEwYjFMTHZvVGpzM3dId3owakF5Q2Y4Zks1bVYxZm8yS2dXd3VJUE5h?=
 =?utf-8?B?MTg2ZmJtcERLRy83K0U0c09wVVBFOXQ1NXQ1NU1Hd2lBbm1kR0FYbG1adzFn?=
 =?utf-8?B?ei9MaFcvYWMwaFlGcFJVVGxIUHJVZ05vMFdMQVRhczNvWUNKcFNtY3JKa3lC?=
 =?utf-8?B?bUYvYzRhN3JBaU5wdXZtWnI3bzEvdE14alFiWGpNcTl6SkFLTnROSVdiWjhD?=
 =?utf-8?B?Z3Jhb2UvQXM0SXQ4KzdVVnVjUmNoMm9XUXJIRldldHZOcEpKZS9Hdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7b8ba0-0483-4e9f-defd-08df2df5648a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:26:48.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCEQnNdAW7F1WWyf8l1Uh5+HcZibVa05mQyl60zmcMYi89poGO1394GYJAwvO9UrZ+5VN5jZH7f2yqUtjBig4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6252

On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> KCSAN relies on; however, Rust code is not currently instrumented.
>=20
> Pass -Zsanitizer=3Dthread and the same TSan backend options used for C
> code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> with C (though rustc currently rejects linking crates with mismatched
> instrumentation).
>=20
> rustc only accepts -Zsanitizer=3Dthread for targets that declare support
> for it. Of the targets used by the kernel, this is only possible for the
> generated x86_64 target specification, so restrict instrumentation of
> Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> Rust code remains uninstrumented as before.
>=20
> All TSan options used are supported by the LLVM versions of the minimum
> supported rustc, so no rustc-option checks are needed (they would also
> fail, because x86_64-unknown-none used for option checks does not
> support -Zsanitizer=3Dthread).
>=20
> Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> omitted for Rust because rustc provides no corresponding option. While
> disabling tail-call optimizations helps preserve complete stacks traces
> in reports, it is optional and not required for KCSAN to function.
>=20
> With this enabled we can detect data races in kernel Rust code and
> between Rust and C code.
>=20
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
> v2:
> * Add note on -fno-optimize-sibling-calls to commit message.
> ---
>  Documentation/dev-tools/kcsan.rst |  7 +++++++
>  lib/Kconfig.kcsan                 |  7 +++++++
>  scripts/Makefile.kcsan            | 13 +++++++++++++
>  scripts/Makefile.lib              |  3 +++
>  scripts/generate_rust_target.rs   |  2 +-
>  5 files changed, 31 insertions(+), 1 deletion(-)

