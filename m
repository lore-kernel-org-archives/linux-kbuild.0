Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795007753;
	b=L0T2nEm0e5yT4DD52DUkDcngEFVp2HvnsxvHyVH9iJclHZub7reKi0kht87ADzmaaJ3C
	 WUh3ZHmmacIZqQ317AjlxNNc6mDHfFsyR8P2IFEXsZeVQVnXrgRcxH9DdfL+HmWjN4HPy
	 /t8SiphexPh/jy0ZUg/XCqJ7W9I1nM3c74TEuyV3/ap9J0KHvSKD7jExy9gGNH7yf0T1A
	 rEUeuC2tEySaX9CmnviCpoWcM4ukBbsU8+pT3FCPmn1K4A9bOu7urhSt7Mvx8xLPwVn7z
	 Nw69Rz2AdBPO59bdgURTjVGl41RWZz4vOOOJZ7SoiqEd/y6i945i7wdnlRyle2Oexdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007753;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=IBTW2QYj/Psia5swpWkFv+idj/v8sTnzeQ/86NpmGGk=;
	b=GEkKueE8svniCtyCzn4OHONpM1wGjzLvKnBprxBcUH0h6MHD92htoikvi4TTInpFkdlv
	 uw/ZEGvYHJ5aTy0qeHKdaP1c6wrKdEkn73sA6UNE6doQmE2wf4RtzMR81uYgu/Ywh2/pw
	 VD8PU6XpYDXZGsZorSMD0Ux6vgH7cIRkk/z3BUuugu7avqLik0PtsXZIoLQZPk1EymFER
	 r9jC0JrXAimgopZYK+yb/s66ZwYgFMl1QXLsILmLiufUbA36OzxZqw+7Pmv1i8o14Pa3L
	 i1sqZc9mKbidT4LywYybdsu/TDjhuU9KBkrhspTl8HF5wmE2iMOZjTxoHclVe7p6+zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=PKXSzVve;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.99
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022099.outbound.protection.outlook.com [52.101.96.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30043606A31C;
	Wed, 18 Nov 2026 13:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30043606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=PKXSzVve
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEIlKKAK61br212sCJmc+7AGQlONkpHK8Li8tlbg2PQgWwsby8lcb0UlohTeKTmiAc0Nk33b7S2sbQxezHw8IMo01GsyZgVSar25ktrgnM8DC+eAq6hbyU6jMoJTr9d5fyLU+b/lhADRrtqZfEEjGNurQr46M2USNvO3UT1OVBxvB4l7kLti12ZIluL+QtLnUf7tfpCh+dCI7YBFGH4+jM8ZG+/QqctHifroS5EuTbVtYUhLb3ZaKWOoXikBy+gPaMRRwMWTLvwP8DUXzhQ0zB0FxwcBBAq7rcbRGgTa/CIM9D2maX++hkP7YaoGEB8NXJ7WpwAWIhTN08h3/o19Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBTW2QYj/Psia5swpWkFv+idj/v8sTnzeQ/86NpmGGk=;
 b=f9WiIwp3hqmqrR7HE9iKNy+m7ZbhhyrvtYRkjsRke5cLxwIdI+LNBM/q1gZ3rnb30BtlfpqP+oG9Hi2nfIyTJTkRCtVvextZ884DOlpy4Oz/5nIfk2Gs8OuQav/2JN6dQOgb4+k3smm8c3ZzajDuaUAV0TzeeZt0F33Ko1Fp5pQcJiMsw0MyHwLKUZYq+yYHlXVBqPrVWVa3thgBD+nPXLlWIy9/Juq/rngGyNgxKqFEA1PBW9yemksIZJtAXUGT8JzbpM2Hvo6L6y7hUbkbP7AkXKk0BLGEGvLmla+Qbxl8vRFaq5HfplcWzvjAJIJ43N4LlnK7KvzIXYgQ1VCzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBTW2QYj/Psia5swpWkFv+idj/v8sTnzeQ/86NpmGGk=;
 b=PKXSzVveJxCwxO3SpQMmRj3oZkP9dmzlBePBqZGlMm37uhRz1pNq9nKkqBHDeKA3fEpYx89swDA00qaH+HbHsF4SjyzAgSwJbzujUnPjxp+cQp+4Ia27d01EB1wSSIr53h7C0ExFVZ3cp9z7LSQdEIM4lFWVAdTJQdqg6xxhseQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB5971.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 13:15:49 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:15:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 13:15:48 +0000
Message-Id: <DMYD53NKY6UM.M1A2EY4TRSA7@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Matthew Maurer" <mmaurer@google.com>, "Sami Tolvanen"
 <samitolvanen@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: af85fa9c-3e23-4ea7-5858-08df45761034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|10070799003|1800799024|921020|261021123027099003|261022075727099003|56012099006|10067099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wyC6wZ9tp8ROgXbPQNb450w+QRLRhoIcytU3uSLQhDSipWMf4d5piy+0ixuHBSHeM0WsI1gwr30oFSXrvrFMd3pNoR/9UNkjNb5A0vjLRCWKx+ZXtK0hisvKXC+XBLbBkrgNGHN1MQxPne/gl6GNiYHRJQntQ2x19eNUGYsZ1X4Fr54tUD5zdKUlPUTMLcFKJRmw1be4Yn2vcsZsBCwZ+lltClEY2bvPoA9dTZWL22qJJHrofoNRm8ZGX+OlTrpYOSQO1SyRBDr6kFgzw6pmQY4Xx6qYhu6DoUqrrlHewhoR+OpTsiVE2HcQk1jUqbhLn89hp/mGXbeJJhJLNaa4JKndYwLKpXnlRLzMA7o6PIG95gyz212xXvNnD4NC39b4obQwu0XVpY96v7Z+r9ZdQNlrInfr/uArzyAwVYypxQF8nxM7e+v8q+IGTcgPgXEiiBkJUHbMnqPpEzamyazuOMmQX1JNvRLtSR1McdMwo05uRBiL8Y1qtHdSgmqbKXQNBjAW+aJda1lVDwrnNUqcyHdEQjeG+i4uknDmGNAvVO4Ht5LXf8cwCk6gNtSH0np8jqyPZsNjHPS52CMPWZkavG94z9pmikSuAKDgFOujH0RuUtL59ZZAy0EUfKeL+5ROxDv5NBHZAInelZPejGix5knj0EVjFaTI31FIMoDnchQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(261021123027099003)(261022075727099003)(56012099006)(10067099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVhDM2FVZGVkanVJYVkvcW5zbnJYRmMzcEUxOEUxYW5MMjM5TCs4eG8rcTcx?=
 =?utf-8?B?VjJtL09hKzE1c2c0Q2Zmano4SHc5Z25SRG1QZFl3TzVvUUxFTHJNS2huWlhG?=
 =?utf-8?B?cjNnVlRxbnlzTmRMenVLQ21TRlMvMTVMQ2wrcVpSaHlDYjd4NElCZW5udHVQ?=
 =?utf-8?B?ZGlWYzZndm9uSlpUR2p4WkR3RUp5SThDTGlzRk1jQnFndlN3cFRkanhOQ28z?=
 =?utf-8?B?V01RQ1JFb0w5dFlRcUFEdWhHWUJBODdkYnIyMCtFV3EvdFhyTmNrYmlKOWxu?=
 =?utf-8?B?KzJDZHkrOTBGOS9zaTBkcDVPQVVhMGhOTFQvVjdZdDEwUGE0VkpUTjdxcXV5?=
 =?utf-8?B?bUdPd0hPbWJXdmhBcE1uZFJ2b21EV1MzejZvTThUQkhpTDVkcTJQYi9Xa2Vr?=
 =?utf-8?B?dDhmVVdjVmlwN3V1d3ZSRjJubkRxUTQrVTNYcmsyT2FpbFJ3dGJwTDRuN1pX?=
 =?utf-8?B?T2ZtSXRMenkxbXhtR3NlT3B1LzdGM29PSzlNS3VQaGdMODNMczc4ek80OU1B?=
 =?utf-8?B?c2pFcFVjemhGOExzRGZxcXlzZWZJaUFkVkhBdzBYTUFTMzNYcEwyTENvNU1t?=
 =?utf-8?B?UVlCTWFva2oxWkFYbnBuT1g2SStTZlU0aDJsQTJXMGdMbUJqZzJkd0ZyY0RL?=
 =?utf-8?B?eE5kV2d5WmQ2QlhnRTBBb3A5dVM2c2RDb2twaE0zbFNZRzVvdnM5QU5XQk1K?=
 =?utf-8?B?YTY4TlB1eHBaNHVDNFBhR09Wcnpldi9RUjBZbTFwRW8xYXBQUkp1UGp4ZzI5?=
 =?utf-8?B?TkEyZkhmR1FJQ3B4TFNKcFp3WDBob1BYOHZONmJYbWhYamREa3FTRm1LM093?=
 =?utf-8?B?K0g4THU2cUJKaDAwWTc2VHJ4Y0htZVcvN2FUWXZRaHJxcEI1R05WOGRRRGhN?=
 =?utf-8?B?QUVpMnB0Tk1oR0IxSm5QZkt1QlFIODRrNTN5VXJ3NG9qeEQ4VWFja3hMWWto?=
 =?utf-8?B?K1NHamIzT2FoWVBJaU9zTG5LVGVLTVMveUxyVWxpRzh2MWorYnczM1V0MU5Z?=
 =?utf-8?B?bWtKeG9iREU0NmNjL0s4QzYrZGoxdFkxdjB6blVENExPcndpSHpXVjNETHgr?=
 =?utf-8?B?ZFErVml3N3pXTHJFQkoxc2VPODZNSjNvZW5NenZ3b0MyODZxTEdoYlJjMXF3?=
 =?utf-8?B?ZGx4SzVXRGRTNHNzVzc3MjExVmdXTXhtYzV1Mkd4OG1OUTZNcXVVbGpXTjNx?=
 =?utf-8?B?N3ZmeEFNUXQ4dXNmdXVxWHkzZ3FwUndEeWhlRnJrcVFzamxuY0k0VHpTeUFH?=
 =?utf-8?B?eGZCdGpxWXFycFNrYm5jQnhJSEJWbVZzRlJkZjlZbS95enFZN1lHUUgyQnZ4?=
 =?utf-8?B?QXhaNW5OZ0lTeDZDRmtwK2RqOUNDNkJaWEtmaW0zQ2Exd1M0L1FPYThiZTBr?=
 =?utf-8?B?eElzR3kyUFVkLy9DdHk0NVlQS0U5ZzhyQUg4Qzd3elNSUHRtVlcyblRoSHhF?=
 =?utf-8?B?dS9EZTBHZTdlaXVTK2E5TEQyL3BvOUlkZXNaaWtacFR1NHhZZWhKL1FaWkRV?=
 =?utf-8?B?Uko2RDVFcjNhaldaclUxUkx0Z1djVHdVY0RjZnpjWU9XYXp1aTF3Q3lKaXkx?=
 =?utf-8?B?U0RjcXluM2s1eVZDTkxDcHlmV0lUV1NROVRGQWZHOWl0ZDk2RkVVbHcvbFhP?=
 =?utf-8?B?QnpRSS9BUTRBckZyWmFsaUVyR3I4cU5iZWlJN0xlbThYQmxzK2JGeVhIOWJo?=
 =?utf-8?B?ZnZET1pNTi9SMzlGSEpuanI2Qkd0WXEySDBNVTRobVphd2JaM0dWcnFiQjZp?=
 =?utf-8?B?OC9na2FlTmplQnBMS3VQbXpLN0p5UWtuTTZ4anl4M2VSWW9MNHBqNUgxZUkx?=
 =?utf-8?B?WlJZTW4xQU5YbXE4QU82dHJ3YW9zaGlaQXhQSHdnTTlSQ1RIaVZKU3VPSmZ2?=
 =?utf-8?B?Q3JldytCT0h3Zm53WE5jRGNBMGNXYnlkVXpRR1VEd3I1T1l2VWZTSHgwdXhP?=
 =?utf-8?B?b21uN3FJZTA3dWp6WS9KZ1hPY0dDYjV2WWFXYW50ZzFLM0lhR3JxSmpqREFu?=
 =?utf-8?B?RlFzcWl5bXJydHZ4ZWlGdm5lZmh1UXg1c1J5aVBna0dTajFmdmQ3L0FrVEhx?=
 =?utf-8?B?VzZHeWN1QjlBQWE2Um56QjlIN2w0b2VsRzlqcXl6MC9rMVJPV0JranVlNTR0?=
 =?utf-8?B?bjRaa0Q3djhJb1hITHlNMHlZOWxEQUJQak9ibnZvb2NRQVQ0RGt6MCsyeitO?=
 =?utf-8?B?aEQrdlJDR2pGT0htdzJ6K0NRYUR4OFlyeGF5WHZQZWJLbng4aTk1aGdiYjB4?=
 =?utf-8?B?cG1uMGs0UmlLblpsaHA1bEVla3l6d3VjTW02ZGlVWVB6STlFazJ4L3VBOWRI?=
 =?utf-8?B?ZUJKQ1JvNUJLT2pWZUNGZllpWHkwZ0NuRTBRY2NGUkN2eS9jejRVZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: af85fa9c-3e23-4ea7-5858-08df45761034
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:15:49.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNW9ONJY95jc8XH9BMvAkHSGFeNMxGaKwURTRSvUuK3rwimGGKnULmHJEhJE1sDK3HqKQNnCN4bAUavBS9f1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5971

On Wed Nov 18, 2026 at 1:09 PM GMT, Alice Ryhl wrote:
> Function merging causes various different issues:
>=20
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>=20
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>=20
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

