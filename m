Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565400;
	b=Pa85TYjZHW0H/zRJvx705k8l2Scj4kiNTYZEx4xPz41XWiKYjiCTUXIgfqhpVdFHavAI
	 Q/XHxJs/XXtU7c5RQPaKZPZiwa5YBKHj7YqIpJgrFNwHz3vXnqPv8f8G9paaCMLu2R7q+
	 qcERjTrh5YPT8SUpeB37sbmmyYghTXud2SHHRwleLfVnDNcQhk8vbZl8gr/3N8OZtVFQc
	 DVhw9UxGRB8mcM5scha72wa+PrzbSIwkg9k0N1vyv/84k86gwpu3e5ZkwyYlpw8CCYmpY
	 UBxkEcMyiDmRw9zOYyxYsdLtnAwlV40z5fECmaOmaMSG7+ctrDmiWo1U0ZE1YcXbxig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565400;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
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
	bh=I6LOxusDsaYIfG0yOiMnOKoxplwpJrAQdxdc2tucqDA=;
	b=sqekCZ2fKIlMjIhUdIPB9XIdts8ov3WXJALhqjhEeA4hLl5zd2S0+RnjSMuh2aIk1FRt
	 5TTbfACHnaJhNbVAc7Hrkr3ihZLZyOEOBTJO321iTFPU6x/98M6NL2zL+i3XssSjbOlgp
	 Xb8U38EX0T2jtXeSSLCWMiw8viCoJi7HF7szPrCDJ3OB12r+owcwg7XlnCns8Q1gi0aHY
	 plqXhYrDIrp9ZaQE1qKttH+qiIXImM6+SGWmS4BEBY18CkApqZkUIxYOvhgHTUxAU+omR
	 lPiAWZULomOJB29NEzMYnsvHg2cZdrvlvyRMJvNyEtEX8ee8glpBj0eJQzqhEuYrEiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xCAU5z+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7F606A31B;
	Wed, 21 Oct 2026 06:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xCAU5z+E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZ8U+v/0vm3RKYlyHyy2djsdQrApgz+rQKlWjRSA1x04KaCvpuSI3dQJD/7uoXenftiSnrC0LDROpmMs8Bd6R8/4obDsu/HlRKkQlBQwJygLxVu3YuCwaRa+R7b1S4gZGZ2eKDI1dHkD/uyLQo8E0DvP0Z9aBZeQrp4tZ0+BMHXJadc0SFBi9GlRh5nBNRf9RXP27pWdQLZffJI5PtkqeEP0VHkSJUKXj7QJvW0chdFdOVZfOIYAl0cEKbDeQT3X91Y3WjLYEd1IqTjY0Xogil3tSc4NuYW025bcdSY7qOMj416N/GBdwK+1EElLelPEaHukV38KljsQ5Jqm9jnhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6LOxusDsaYIfG0yOiMnOKoxplwpJrAQdxdc2tucqDA=;
 b=GshWn3dXmNlOkO2dcuIurkFSbSkaFTeMGHV1fFti3ap2u20MZG6HZ8XqhQ10ICzGCOygPnffLFwe1Ff7fonTzNRCxNQCQcHCvBoNt03QXbfoeTcLVLJ4gjdWWLf69BFiMUnSIs0mxf0nQT1KHIKyo0wOPS3mk96JKjC28AazRdvIhcYmDwwaobsgiZ45ROdPonh8B23jqYJIGNn/34LvkAgNiee/TqEyOdvlY9ad2RsYqcjFPVTUHTQQepruNRUcPkMVlVzQlwW5xPBjFisq4SHpqEqahTKh9ck3TaF5g7EDEyP3meLhFd0LpPq3qYXxJwM8do4rnlAhkppYunilWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6LOxusDsaYIfG0yOiMnOKoxplwpJrAQdxdc2tucqDA=;
 b=xCAU5z+EjjnDQaDlOVaYbm0q4F0SFB4vsQv6Iv8c1WdrAVh2E+3fpQhpCazgcwp373fpGXYKi/TZOy1+Owkw0m45ksY/J657cZkn9PkgDCN+YH6tVRsBI437XJ00cPDMI3/5QGW/BEpcMNexi74wuRFiMoMrxPoSC2L3Jr8BPHs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 06:49:56 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 06:49:56 +0000
Message-ID: <fed9a5f3-8da5-4755-b75f-5f9ef22b4388@amd.com>
Date: Wed, 21 Oct 2026 08:49:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
 Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org,
 Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cba97e-338a-4d08-7b7f-08df2f3f846f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	bHqzuHOzDQQBw+cuyJhfLdLPjr1xcU4OUY/MFhxcVgyc6oU2mtO6G+wgnHZQa9rf1QJrKoazInxxH2no2pk6RuBlWVIIcH5nme+u8ZasnjDxofebn/3SWCnYZaoNkJN4RDVdrrWAUnNvQkmwqEOVL3Aj9yl9wf3txTBhcwbS4rNfNpHZtG2R/aQkgqD4/0UaZDjyCX4wduUVM0Y7CNEHPvqCDCeU7f3zSLe+G9a0a3MQ85MzM1vZo4SaJetlmdejytsF/BR8NCGyYl738c2Q/DAQNcVwdpiIoVsto/k7Xh6fXC23LapdViG4AD3PqyAvDllBNW9NdKH11o17z3NY8+EkggQIuBxunDjMB1oDD4CahaTPGXf55pY6k8LjJkMWr7MTgGy481MfWVfVE8EFtjtle09ieaR06kpNAIQlxU0GYEJXWZQwknEv/Gv7psQ+VPd+A2baRMTdWW2ZaWmT/G+x/j2JZnX6HC6LtsdSsIw0eu0gR/VCpokyHcnwx2VHh6v+8slwE0+mAHolD7IjxjzSZzfwCPeb+QMGj20VzyZlY3xr0S1Zr71uQ1ahkcQdn+riy+Ou2lSRa1deEQRAuIj4iAdWYr3BpmK4e7vHy11qwqMhvYXml0XjxUaoVxl434v/8Fs9V09D49D5PhRoBzjvmsnWV6AjlBL0UeYep6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRBRnZIMFBWQUxnVzhLNituT3NUdlRYUnBMa2EzUlBpMURTZjd6ZGp5MWts?=
 =?utf-8?B?VzEvZHViWU9uZ2RQMDF6YzJjV2VLT21iYVc1d2gxSkZudklqRS9Fa2NOeE1u?=
 =?utf-8?B?clprUitjWm5VMG5TejdrSmEzMCtXNS9xdWozS3ArNFdPZThNbTRLcnJDdzZW?=
 =?utf-8?B?VHdlMVp3dnlrcnovNEtmMk1MbGlza1ZMN3NyUWtuUFpJUWhrUUdUOWR0a0RW?=
 =?utf-8?B?UnBhRFZDeGtBcE5RTXZNL0hCR0FJSzU4WnRsVk5VV3lFckdNb0pkMUlnL2di?=
 =?utf-8?B?M3YzYnpMTUxlMHlHanowbURkN0ljZ3BQRkFEZzdGZ2tqMDJkeTEzeGVScW9l?=
 =?utf-8?B?S3ROUmxyVURXcGhDWnNDRTZJZjl2cmZwNDhDWjR6T0I1RWMxOHlVNkFiZEhU?=
 =?utf-8?B?aERLWnYvSlQvMHpWM1NwYzNJWnV6MUZqajBXV01xandIOE9yc2wxUjNmMkN4?=
 =?utf-8?B?OGJXaEtvbUpsSHNKYlA5YTlIYjIwdm9lQ2taczBLNkFMeGxWQlVMZENtK0dZ?=
 =?utf-8?B?Q3ZPRENjc2c2OWZQTUxHK05wTWRZOVRuZWNDNlBzU3RJVjFOa2luQi8wcGhj?=
 =?utf-8?B?U1RuSGJVOWpBd2R4Ujh6c3laTU82Yk9GdnFGaGdVL3ZJL3RQY3BWRU1zaFNC?=
 =?utf-8?B?TjhoYk1RZnZVQkZsYk04UXJUc2plbUk5dzg4OE15U0FDdzE0cGlFSU1kbTZF?=
 =?utf-8?B?algxK3REZ2ptdGtjb0szMW1NczMvd3BmWEFBcEJFSEluTlkvaTNYaXA2K0Fm?=
 =?utf-8?B?cWVya0dUT2Izek5TT2xJTjlOWE9KRnF1WEpzNk1YaFpsM0hLMlhGbmo0OHFj?=
 =?utf-8?B?bGhJeHNvclNtbWRGNEo0RmV6ayszWnlvUlk5dzJsZ3loQjczWnhEQm81VHJG?=
 =?utf-8?B?RzN6Q2Y1Nk9NZlY4b1Y1UTU5ZzZqM1FOU1JnMUdtRzdvbCtGMnhUK3dDRXFs?=
 =?utf-8?B?ZTBZVFZSNk1tc0lPM3N5MXB6WmxDR09iRE1vanl3VE4zZEdSTWNWM1NLbXBI?=
 =?utf-8?B?U2NZQ01rMnVUenhqc1FwYnphZlRFZUtNbGdhL25kRkZ0UEs3R2oyNjlQMUNi?=
 =?utf-8?B?R2xmRjBPdGRBdzhYeC9oaEM4V1lUVUFQOTZHcWJBRnJPUUYzWjVFb3NMME1q?=
 =?utf-8?B?MjNPMFRIZ0dsL3BEOFVRSzFyUnB3Znh6LzZ4ell1L20zemcyU1ZkOWc0VEoy?=
 =?utf-8?B?TVFZWW5jWHNIbkNBYm4wOGxUSHg4Mld0eklIR0NlQkRMRDc1N1R2L0I3ZmdY?=
 =?utf-8?B?bENnOVUyUk9qSG1HY0wvUElRNXVkcFNqbEs1RUtTWHlxZi9nUm01aTNaYkJX?=
 =?utf-8?B?NlMrUDI1UVFScDFFK3ROVmk3K0VGM2haeGVNZDNjaVllUXRJZldRWTg4ZHZ1?=
 =?utf-8?B?T1NJcGxsWjZ6djl3RkZZa01WQkJOclFFTVgxNmdadHRFaDA0dzdzOERuWmJ6?=
 =?utf-8?B?T082SHI4MzJoT1BGVnZmYmY1Uyt0N2d3VkZiVTRjSWV4RVMwZ21RN21LVXlC?=
 =?utf-8?B?Q0MvMERqUHNTUU0xcnd0MDhLNURra0MvcXFrNlNCZ3o3S3ZmSWV6a3dxTkVJ?=
 =?utf-8?B?TDQ0OGlhMUQxTDhzd3VnRnM5b0UvcUZ3YVpjWkJKWENTQnorbjZZVGZHU2xw?=
 =?utf-8?B?bmZCcWdhbkQzTnFwRkZPTEFnZWZIM3lmVlM3eTgzZ05lSXdsOGFlNVNjdnZu?=
 =?utf-8?B?S2JzTXVMS1BLbmF0cklXYnkxTXhvK0x2azNEalpKb05IaG5nWHIyMjdNMktC?=
 =?utf-8?B?bDFoeWxqT1M0UU5EWjlFWG43V1JPRjhLOE1VQlk2OHdmZ0lDcCtDNHhreDVG?=
 =?utf-8?B?SEhtV0hGVUNmR0I5UHZFSlNsR2RvdU5OaUtXVldrdU9NZ0xZanFMZXRVV3VL?=
 =?utf-8?B?VkpwcTNjSFozVnM2T2tjZEFTWkpyYUpOU1JXbGd6VjdGUC84cUZEMC9GMnE4?=
 =?utf-8?B?WW5pWEszLzc0UlQ3ejIxMkd5S3FpSFg0cVdnejJlMzE3aXUxZ2lyMDZBd3lL?=
 =?utf-8?B?SVY4VHBFYThRcGwxWVRjTzVyZ0RuN2FTQjZheHYrb3diaGJsUVFRdGlzanFF?=
 =?utf-8?B?SGt4aVl0dmNPWnY0Sk1ZWjIwazJCbUR2eU1wdEY5TDhVZ0NTVmZtbUlNMlRI?=
 =?utf-8?B?WjdwN1pOY1BGQk9xcmJBeGptc011STFEV3B1RE1KczJYbUg3ZjUxaThaQmFx?=
 =?utf-8?B?Q0VBellINkNLVC94WkVaaTgvdWlLSGRIQXBrV21hdWNaWjVVRzRtTWpPM0py?=
 =?utf-8?B?alVSWWI5K3UvRzk0U1dyL2prTTFRU1dHNFVrTWV3UWZjemMxdjdxVHRVQmNs?=
 =?utf-8?Q?28jvPk19CWLrBglaKS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cba97e-338a-4d08-7b7f-08df2f3f846f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 06:49:56.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x++5hVjL7426e2ybORoPh087xtDV26HmZqq+BYDOujkt1ZCYu+lMKFgj5eIebvDt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202



On 10/20/26 17:35, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>    make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> As mentioned in the cover letter, there is no desperate need to land
> this. The FIT image created here is pretty much the same as what the
> downstream build scripts for ChromeOS programmatically
> produce. Switching over to this would have a few benefits:
> * It makes it easy to use fdtfactor on the trogdor kernel image.
> * It would set the path for future Chromebooks, and on those
>    Chromebooks maybe we could use the "description" of the
>    configurations to help the bootloader so we didn't need the awkward
>    piles of "compatible" strings that we have.
> * It could potentially be useful to people in the community putting
>    upstream kernels on sc7180-trogdor devices.
> 
> This all being said, there's nothing terribly critical here, so if
> it's controversial or people hate it then it's fine not to land it.
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
>   1 file changed, 728 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its
Acked-by: Michal Simek <michal.simek@amd.com>

I would consider in this case to put it to any folder. There are a lot of 
dts/dtsi/dtso files in qcom folder. That having subfolder would be IMHO better 
structure.

Thanks,
Michal
