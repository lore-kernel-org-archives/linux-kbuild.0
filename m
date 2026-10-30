Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394062;
	b=fN6aGDRHBIHKA6qaKFEaGRkkQvMGsT0TGr9AyWw685ZsBgvjB/pFeRhOHifFjwEHAG90
	 TVJvTY9IJJ0B4yvJSJbcfn2t/dILGnBf3pJTPirc25UG+hmb8MGb/CCt+8kdBpYwGHHnw
	 JHgM0/o9GA+4LkhGI7zfEXDkOHFK/sDvQKovtMGOvBhVRcbemn/wufNHfPw8k79yG0izw
	 yMI/urKerYvJVQ4lrYJY7jfKVL1b2In+kKFKHJch+BtV7tEWSDrQ22rTXRPY7Tjo6NVtF
	 MC0Ei2Z/5D/+/6/XO0nnDEo/Nj2y65FDnctzNqwY79be6GeRgmvOncdI4JkpOsjyPDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394062;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E7ZclzSo0AVT762Pk8buvLV/xHyhlEzYvwBcz8+ywyM=;
	b=BLDMJCWlaEF18OqSIcgGD8PpOWsDBuik2Bsz9hSNKi+PFD12QuKX/0j29oPcSxEwtzIR
	 yWmlyM0uLX4lCBRViNxw1HZnm6iX+tLnUZ4x+/p84MTKC1O8RXn9KG+jGVVZ5Ss7AX+NZ
	 AQgqJ/9sMR07K+GyG55kET1xTHzKu21PEDe9DDU6bMhX1AuFeuhC5nOv48l/NJYVUyPP4
	 MhAiQNYGRWzOoYvPUstzlwwpPQxAfLgQZjQM8gcq6PxcCcTBucAVIK4LNAAGC821jlG7v
	 V+N3qsVR3S9LTpec3Mr6brqXtiQVz8GE767I/GOVoLkUJhOO8PxmH5hoXoBkLCdRqZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Ke+fKKrx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D50E60A2617;
	Fri, 30 Oct 2026 21:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D50E60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Ke+fKKrx
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvU3d1038028;
	Fri, 30 Oct 2026 21:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=E7
	ZclzSo0AVT762Pk8buvLV/xHyhlEzYvwBcz8+ywyM=; b=Ke+fKKrxISwDtHsGSY
	XPksyuJpAQEufj7/fti9lXHooIha5r707HZAP++saKLSW+1IAP8OS1dnLgKTccIg
	8um9lMUxIRIsCF9z/Cuuwam0iIEgkHH53YmOIh5jEM5+NAcdSxvZC5h5wbD1BCUl
	2NLfdCTVrwIJTRYH7E0DWts89O2rP65QAx0Q81JLKkl9k/BlWazYFPcm/DQxvGh8
	Hu4jLkaPSe9bmk9+dABsMcVMqYhqBLgTyE5r2520OyX8QYy6XsBcvvhcPbsHQHfm
	uWj0kY9W4fdzMxXtV2hijZEC3+LLhTtOYgN4zB5qlKJh+Iumc+DwwilpKOyYwjRB
	QWqQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmx98uj6y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:36 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id D1F73800EF1;
	Fri, 30 Oct 2026 21:00:35 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:35 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:35 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfbX0vIaGbAWOnatTU6YWkrAxHpXh6MPnkNTfGVbYC6ZRtT7FvId7vWq+4Sg94RS5wpG/8hv5i9MlRfxwRhegjKMObQZXRKWxao7fH6px7sAl1mkMYfPS8A4tS4N7E2P8hpDAx9UxmD+H1phc39d8HWjhuC8KdKjvJjCO4LsSM7V83kE8r0qKUlpxmBC/kdJBQTwdv8DkCOQ65+FQ+xU0ckwEZjxZCmtrxt/NJHgHzNuhcZvHazbzQnneFkXyG4MYV7SXINiMsWtjna1tGL1WrHN9177N41gHop1ewFY8+JoQlmhGpIwZLGYGth/VMP/2wmm7x57HlsOzaSnrr9DAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7ZclzSo0AVT762Pk8buvLV/xHyhlEzYvwBcz8+ywyM=;
 b=fo2Iqe1WqgoTu3J38idc7hbaqcBvxzl/f443hztb3bYpCxmgzf7msYWjJJnb0sVSppayzbJ/PdhqpvWfwBlaD/HwCPk8PJsgyBxpvBewdln8YivgGcug5c5oPkymL5P0zxwy8PiTrUOMRxoXpfx6xkY8Y947aP4d2+3ofYykmZgQgsZgfXg6jDfOdWgygw/0LODKFk3y/CBJAYJmI1Ybhlp3ROwSUkVXhgvzIm+eLTgEFM9r5bBEzCrv3N+kpof8bZy6KrigyGEq+4dn12wEZdEizmPzpZYKDu5LN7yvZvQ/ta0i9D8OJC3bKww29PqD+UqR/DDmBq60KNZ7mY+JbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:30 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:30 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:06 -0700
Subject: [PATCH 10/23] net: hpe: sl: add the module entry points
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-10-8c2c391cc283@hpe.com>
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
X-ClientProxiedBy: CH0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:610:b0::24) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 78584528-be9c-4a45-34a7-08df36c8d477
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|921020|56012099006|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022115727099003|261022075727099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: 5YnWuqBebsjZs3DHDwGCt/5fsOqaT0TDTttspFjfQtFJlRj4KsFK+Wf1PiJD91kHIijRgj0Du1YRg8W4QafENV+39LO+XYe0Fvqbq4K0O/AfeqVb1W/BPXwlR/+i1sodZejzJrNE+bP5viwc+W/XZKfThip9gCP45i5uGBYN16AN+eemg6sF7+2zsmVYRXIiM4OtOtbWTArUy3u3HJedGqG2H9dqlRr5u7cTaFg21rV0ljbeFxwxDspEWJlYnF0copzLSHW+BezVHl662b0cfCzTxEerzjKCJVzLWvD/AFNa+uZMFMLNcDMHo2AXpFqvhkwn4++zhLc232bTdJRmR33ipKQjisNcQv6z4V/u7bZveANCUfqOmP02LD+7+0YYQkRcMgXlV+awZ188/l6t5TWgh44fAb6zOfsnQWBKiH9hMYQ3Qn2WTIUnbnAGh0pZ2//2FaCHFyoMsGO1J1TmvOSKO/5FR0WNjbN1cEWSdKGvL2GJRZG4SoxsaxsB6VKogWGpGe8dJO3+rikrxhbN4J4aGhQ65umARTCGML6/bJVWD2yvJ/47bomxEYJg81+9PSMyi5/1f/cBe3gjbzHImyH8jGzqoYT018fq+snCt7GeYMg9OfkyCj13X4/6Qk1DNLheLUoygn32nON/zolumKLdatUnIylfuutKdgNGNNiOUeab7gD+/FYCXvmUPi2umeVzfIuWsatZlKQkIZTtaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099006)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2d6THAzdWtvdmUrbG8wMWpUN3NtWlFQVkMzV1dPZmJLbTEveXB2YUZuT1RU?=
 =?utf-8?B?aWJkWXRmeE1zQWozNWhoblpJYVcyczlrS1orTGRrUE1zSVdIcWdvdXBjS1Ax?=
 =?utf-8?B?YS85YVNFd2NtS004aEIwR3Y5ME9ZL0gweEw4TnkrVFphSzlOTjkzam5LVWtr?=
 =?utf-8?B?K0xmVHNpRkFoUXZXQnY5Y05KSnRPQVp6UmNZWmFUcXlub1o2VFJQMFJxWUow?=
 =?utf-8?B?NmhoN1Q1bnM2RkVnbUFyMktDTUpNS0lMZzBCVFJsTDNtcGFGdXRGd1c1MFJD?=
 =?utf-8?B?eC91WEs1S2YwUXk3WFR3RnJLQ0dJWWEvSGZxcnRYNEdPSy9YR0VGdGZ6QVFZ?=
 =?utf-8?B?RUdTYTZaSVVJbkowcVdkRXROaU5KdDZyeHlIU2VUVVVwZURLZkVIUVo2d2s2?=
 =?utf-8?B?Z3dlY3pjZGp0Q0NkVzU2UGtOM1JaTEJuanFCaGQ0clpqMDdvd0J4Nk9KVThZ?=
 =?utf-8?B?OUV2cStCT09HeVVOWXA5dHd2OFhraUFBdFVCQm9aNlA4aCtFNCtIOTFvaWx4?=
 =?utf-8?B?YUR3WnZtS2VjNUdGR3cvTEp2RElTNWhHT3RrdWF6RXpqcmwzcVUwU2FCQUhU?=
 =?utf-8?B?cnVmNUtwQk01cVZFMDFhR2RxaGwyYWdLaEt2VGJrSG5YRkkva2RvWGVydng5?=
 =?utf-8?B?YlZOYTBXQ1Z3VFB2MWozaHh5aCt0OXp0cDI2c2dqaTZBQXNRRTJKOHBRdzZ4?=
 =?utf-8?B?UDlyM2RnWVBoMkVYbjVJUkNFSzhhVGQxN3lueHVDcWtxaWJ6U0pva3phOFVV?=
 =?utf-8?B?cFdUZ3dzZmpCWUNsN2ZidGljWjRFb2t2RHdKVDJWLy9qWkdFNGRJZ0lIR0Vn?=
 =?utf-8?B?cEJxRmY1QkdJV1E3ZStDdU1jcnpwd1lTeUZ0Y0hoTWJ3Y3ZpL2ZyQlNsMWdM?=
 =?utf-8?B?MTl6d2ZOSEFHMThzZEt1azc0eCtJOTZOOFBhVjRXVE9rTzhhekpCVi9wellh?=
 =?utf-8?B?ZzBvTk05NFhTTFpWZXJnMWwyY3M5eVpvSXUyditzZGp1UU9TT25VV0V6V2Jw?=
 =?utf-8?B?QnU3VHYyUFc4Ym1VV0xiWDhFVWMzMXkweDRPbFJZdTlTM0Z3aHZ5azZsWi9V?=
 =?utf-8?B?VFdCbjhkNXE4WFg4MTgvSmNtaGFMN3JKdlBuKzhIMWJXNFlWckorYmZpbkRx?=
 =?utf-8?B?eUxOU3E4TWtaVkZOVjJ6cTVpME02d1pHc1BGVlhWQTM4UktPVWZXMy9lbTJ2?=
 =?utf-8?B?ZG9jK0xVSzVRaW5remh2WUFDNUV5VFNOVWZmSGlWOUI0cjQ5Nk03VFl5bUEy?=
 =?utf-8?B?WXp3SHRRWURNWUF1MFVralMrYkV4cHFzYTA2WmQ3UnRJcjZrVzY5RG9JMmhO?=
 =?utf-8?B?YVBURThxdThoYW9IRDhrYUFhSDE3eFVySEFjd0FHK3I3RG10eWxtM3ZtTXEz?=
 =?utf-8?B?UmI2aUE3Z2U2SXZGcUswc0RTa3hReUFCZVZtMlc5ZDhGUWIxck1OZjdZWHN2?=
 =?utf-8?B?SWpQTlpSUkcySlY0UXhQWi9VWG44bnZWbVU2d1lCQTVDc0pEcnlCQXlYTzAz?=
 =?utf-8?B?aDdlZm5DN0txWmdhT3ZpdU5zdkM4RnJJNU5oVCtXZTFMb0dKVjcwaTdOcEwx?=
 =?utf-8?B?VmpVVVMvM0NVWWd5WE9aR2VuWGJzRlNRWmRsQTR6T2diOWdIazQ0Mm9Gb04z?=
 =?utf-8?B?ZGtCbzFCajR3bHk2eXlEVWxQdllXR0l4dXJOOFVRZHU3L2FWZTR3aHZBemJt?=
 =?utf-8?B?Yi9wdW1DUnBhakhoS1VYQ1p3QXE2dTNUN2gwMTUxd1gvb1JkNlRCclJFM3NJ?=
 =?utf-8?B?dTNHaTZZSk1HRWY0MFVpYzBJU2U1ZTZPcWJUcnlYM3pmTnhwV01RbVdjc1B2?=
 =?utf-8?B?Uit1amtWYmJzZklkelJpWEJHQW42ekk0NE9OVkhqMm1oSSs3Q29yZlBTQ1Zh?=
 =?utf-8?B?cklVWGFWRXJBcDF0c3hKOXgwWkpjb1FRVFVSdlVScEdKOEh0VCtpR1RaeWQy?=
 =?utf-8?B?a3RTMGM1MnpkN2g3TzNNM2VGNGdlaU1vTk5ub3Fmanhnc3pCUC9uYzE4Z2Yy?=
 =?utf-8?B?bVRFQXBrVmxMT3ArT3pDcUZXVm1wV0daNHdFa29OdDJhSmxaYTN3aktELzVY?=
 =?utf-8?B?bGRtUXI3clJucEhCNkdyU2x4TGJPWEVVMmFyV2M3QkhyQjh1WlZFY2htREMw?=
 =?utf-8?B?WnhDNlhsZG9HL1FjMmlGNGV1TFgrWDNuVTcvdU9id1ZRSmlUQzdLSXFyaUJQ?=
 =?utf-8?B?UHRXSU5KdmZPN3JiUEtxMGNNbFp3NUs3SjFWT0RmbmdueHNxK0FoNUxlM0py?=
 =?utf-8?B?U1o3VEZ2ZWJoY3dDY0pRd1ZOWkZFc245TThzeHc4MnJyNWdrRUNPdk9Manpr?=
 =?utf-8?B?OC9OU3VSYm5vWnJkd2VaaDFRT21WV200VDZhSjBGSE4yQ0xaQUNwUT09?=
X-Exchange-RoutingPolicyChecked: zMb45MME2yI8s4MR6mU0Uvo/fiyqMPz3oedJ00XEBFpBg1No6Hrd5gEFsiu4Nm6MJqKL+18Raukjnk8sILJQf3g+fTM5ROFvDVQl0SB2ggH5AByoElJv4ngqaOb3XcmLyHHUf8YxJQGQzimZp+USTdGVwIoZ1t5Esqqlz9ibySr6FhOeB5Lf67PItA1Scp1C6ujXNFNCikEwcrj5B/+y31Noe+8g2LeYd/y+NAoO+MQrVfqrX65tBagxQ70nJSk7FAkb05MvPmN4GprLOdn8IQQs9KcvS/qiqG49D/vQ/HPDh9jWTqj+y143/7RWZnMpGM00gZCK5mXLRRoJq7I69g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78584528-be9c-4a45-34a7-08df36c8d477
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:30.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K//JbdrmLHMgCDIfuqaz0cXCtgi9H4W4Qk2hgAj4F0vaUpveeHKwh/X0by2jebijtKWTubY4FmxP2PrBhgGPow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=QOf91QLL c=1 sm=1 tr=0 ts=6ae50574 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=MvuuwTCpAAAA:8 a=nSX5DhlMTjCL_WW1bjMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JKLx5nuNkasYk-KlNbFaHkkLgVOs2-sU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXy2PCR6ClUjUr
 +ZhKklKgg6Nb2DOtHsuqQB+51XNJSRwQndD181MuTidR24xZl+JyBr4LCoqpk6ijmQKakRkYs5J
 Hw/rHBHAK0Vb4V1X4RqAmwkYwS3qIP7bILHM68GROny2IjxvvNFTa3ulfdd50TTh37YrB/UEWbs
 CrR0J2VTj9BZ4bcs0ovbczJSSKBX95zufbMXmNCJhoMz1v8m2KnZGPefJC5aowfEBGfpxor0iaX
 BBpYHUH0+wafHRoQN3optJrL29LA2uN4zl+1q7uIEzbiZwTiqi3RKxdJZVpENNKI2D1gfWeWAVm
 gwGTfRf1P+viEALxSosf9OudQuLoBoYF6ykjMG6K0JoD5BTWqDvu7xyDRY5vXNPqSZWyutRmFTt
 d9sz1Buw5yyGfW47b+2u38xaH6Qk+aAUfcT/1juKIAX9VsZ9VOu21uLcLLXsxiVs4mBG9XIxAQL
 IF8JeifcVBR0iawWKjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX1QVr66zEo6rv
 FxR2oeTr2viUo3VPGLFGTnJB4n7e4c2dYfx41DuYrC1uCTgSKE9Hs/1XgVfPR66VpS8WW6uVSQy
 fp4H8dW4guLNNFovHqzncuGhhpLSrP8=
X-Proofpoint-ORIG-GUID: JKLx5nuNkasYk-KlNbFaHkkLgVOs2-sU
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the module entry points and the logical device, link group, link,
MAC, LLR, FEC and media objects that make up the SL API used by the
NIC driver.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE_STRING (17), LONG_LINE (6)
- CHECK: BRACES (2), UNNECESSARY_PARENTHESES (2)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sl/sl_fec.c       |  68 ++++
 drivers/net/ethernet/hpe/sl/sl_ldev.c      | 133 ++++++
 drivers/net/ethernet/hpe/sl/sl_lgrp.c      | 409 +++++++++++++++++++
 drivers/net/ethernet/hpe/sl/sl_link.c      | 632 +++++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/sl/sl_llr.c       | 289 +++++++++++++
 drivers/net/ethernet/hpe/sl/sl_mac.c       | 220 ++++++++++
 drivers/net/ethernet/hpe/sl/sl_media.c     | 356 ++++++++++++++++
 drivers/net/ethernet/hpe/sl/sl_media_nic.c |  23 ++
 drivers/net/ethernet/hpe/sl/sl_module.c    | 129 ++++++
 9 files changed, 2259 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sl/sl_fec.c b/drivers/net/ethernet/hpe/sl/sl_fec.c
new file mode 100644
index 000000000000..af438c9443f7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_fec.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+
+#include <linux/hpe/sl/sl_fec.h>
+
+#include "sl_log.h"
+#include "sl_link.h"
+#include "sl_ctrl_link_fec.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_FEC_LOG_NAME
+
+int sl_fec_info_get(struct sl_link *link, struct sl_fec_info *fec_info)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "fec info get fail");
+		return rtn;
+	}
+	if (!fec_info) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL fec_info");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_link_fec_info_get(link->ldev_num, link->lgrp_num, link->num, fec_info);
+}
+EXPORT_SYMBOL(sl_fec_info_get);
+
+int sl_fec_tail_get(struct sl_link *link, struct sl_fec_tail *fec_tail)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "fec tail get fail");
+		return rtn;
+	}
+	if (!fec_tail) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL fec_tail");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_link_fec_tail_get(link->ldev_num, link->lgrp_num, link->num, fec_tail);
+}
+EXPORT_SYMBOL(sl_fec_tail_get);
+
+int sl_fec_ber_calc(struct sl_fec_info *fec_info, struct sl_ber *ucw_ber, struct sl_ber *ccw_ber)
+{
+	if (!fec_info) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL fec_info");
+		return -EINVAL;
+	}
+	if (!ucw_ber) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ucw_ber");
+		return -EINVAL;
+	}
+	if (!ccw_ber) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ccw_ber");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_link_fec_ber_calc(fec_info, ucw_ber, ccw_ber);
+}
+EXPORT_SYMBOL(sl_fec_ber_calc);
diff --git a/drivers/net/ethernet/hpe/sl/sl_ldev.c b/drivers/net/ethernet/hpe/sl/sl_ldev.c
new file mode 100644
index 000000000000..631d215fb7f4
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_ldev.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/workqueue.h>
+#include <linux/err.h>
+
+#include <linux/hpe/sl/sl_ldev.h>
+
+#include "sl_asic.h"
+#include "sl_log.h"
+#include "sl_ldev.h"
+#include "sl_sysfs.h"
+#include "sl_ctrl_ldev.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_LDEV_LOG_NAME
+
+static struct sl_ldev ldevs[SL_ASIC_MAX_LDEVS];
+
+void sl_ldev_init(void)
+{
+	u8 ldev_num;
+
+	for (ldev_num = 0; ldev_num < SL_ASIC_MAX_LDEVS; ++ldev_num) {
+		ldevs[ldev_num].magic = SL_LDEV_MAGIC;
+		ldevs[ldev_num].ver   = SL_LDEV_VER;
+		ldevs[ldev_num].size  = sizeof(struct sl_ldev);
+		ldevs[ldev_num].num   = ldev_num;
+	}
+}
+
+int sl_ldev_check(struct sl_ldev *ldev)
+{
+	if (!ldev) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL ldev");
+		return -EINVAL;
+	}
+	if (IS_ERR(ldev)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "ldev pointer error");
+		return -EINVAL;
+	}
+	if (ldev->magic != SL_LDEV_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev magic");
+		return -EINVAL;
+	}
+	if (ldev->ver != SL_LDEV_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev version");
+		return -EINVAL;
+	}
+	if (ldev->num >= SL_ASIC_MAX_LDEVS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev num");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+struct sl_ldev *sl_ldev_new(u8 ldev_num,
+			    struct workqueue_struct *workq, struct sl_ldev_attr *ldev_attr)
+{
+	int rtn;
+
+	if (ldev_num >= SL_ASIC_MAX_LDEVS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "invalid (ldev_num = %u)", ldev_num);
+		return ERR_PTR(-EINVAL);
+	}
+	rtn = sl_ldev_attr_check(ldev_attr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+
+	rtn = sl_ctrl_ldev_new(ldev_num, workq, ldev_attr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+
+	return &ldevs[ldev_num];
+}
+EXPORT_SYMBOL(sl_ldev_new);
+
+int sl_ldev_sysfs_parent_set(struct sl_ldev *ldev, struct kobject *parent)
+{
+	int rtn;
+
+	rtn = sl_ldev_check(ldev);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "parent set fail");
+		return rtn;
+	}
+	if (!parent) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL parent");
+		return -EINVAL;
+	}
+
+	return sl_sysfs_ldev_create(ldev->num, parent);
+}
+EXPORT_SYMBOL(sl_ldev_sysfs_parent_set);
+
+int sl_ldev_serdes_init(struct sl_ldev *ldev)
+{
+	int rtn;
+
+	rtn = sl_ldev_check(ldev);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "serdes init fail");
+		return rtn;
+	}
+
+	return sl_ctrl_ldev_serdes_init(ldev->num);
+}
+EXPORT_SYMBOL(sl_ldev_serdes_init);
+
+int sl_ldev_del(struct sl_ldev *ldev)
+{
+	int rtn;
+
+	rtn = sl_ldev_check(ldev);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "del fail");
+		return rtn;
+	}
+
+	return sl_ctrl_ldev_del(ldev->num);
+}
+EXPORT_SYMBOL(sl_ldev_del);
+
+void sl_ldev_exit(void)
+{
+	sl_ctrl_ldev_exit();
+}
diff --git a/drivers/net/ethernet/hpe/sl/sl_lgrp.c b/drivers/net/ethernet/hpe/sl/sl_lgrp.c
new file mode 100644
index 000000000000..bb2dc68f4198
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_lgrp.c
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+
+#include <linux/hpe/sl/sl_lgrp.h>
+
+#include "sl_asic.h"
+#include "sl_log.h"
+#include "sl_ldev.h"
+#include "sl_lgrp.h"
+#include "sl_core_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_ctrl_lgrp.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_LGRP_LOG_NAME
+
+static struct sl_lgrp lgrps[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS];
+
+void sl_lgrp_init(void)
+{
+	u8 ldev_num;
+	u8 lgrp_num;
+
+	for (ldev_num = 0; ldev_num < SL_ASIC_MAX_LDEVS; ++ldev_num) {
+		for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+			lgrps[ldev_num][lgrp_num].magic    = SL_LGRP_MAGIC;
+			lgrps[ldev_num][lgrp_num].ver      = SL_LGRP_VER;
+			lgrps[ldev_num][lgrp_num].num      = lgrp_num;
+			lgrps[ldev_num][lgrp_num].ldev_num = ldev_num;
+		}
+	}
+}
+
+int sl_lgrp_check(struct sl_lgrp *lgrp)
+{
+	if (!lgrp) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL lgrp");
+		return -EINVAL;
+	}
+	if (IS_ERR(lgrp)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "lgrp pointer error");
+		return -EINVAL;
+	}
+	if (lgrp->magic != SL_LGRP_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp magic");
+		return -EINVAL;
+	}
+	if (lgrp->ver != SL_LGRP_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp version");
+		return -EINVAL;
+	}
+	if (lgrp->num >= SL_ASIC_MAX_LGRPS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp num");
+		return -EINVAL;
+	}
+	if (lgrp->ldev_num >= SL_ASIC_MAX_LDEVS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev num");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl_lgrp_config_check(struct sl_lgrp_config *lgrp_config)
+{
+	if (!lgrp_config) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL lgrp_config");
+		return -EINVAL;
+	}
+	if (IS_ERR(lgrp_config)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "lgrp_config pointer error");
+		return -EINVAL;
+	}
+	if (lgrp_config->magic != SL_LGRP_CONFIG_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp_config magic");
+		return -EINVAL;
+	}
+	if (lgrp_config->ver != SL_LGRP_CONFIG_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp_config version");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl_lgrp_policy_check(struct sl_lgrp_policy *lgrp_policy)
+{
+	if (!lgrp_policy) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL lgrp_policy");
+		return -EINVAL;
+	}
+	if (IS_ERR(lgrp_policy)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "lgrp_policy pointer error");
+		return -EINVAL;
+	}
+	if (lgrp_policy->magic != SL_LGRP_POLICY_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp_policy magic");
+		return -EINVAL;
+	}
+	if (lgrp_policy->ver != SL_LGRP_POLICY_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp_policy version");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int sl_lgrp_hw_attr_set(struct sl_lgrp *lgrp, struct sl_hw_attr *hw_attr)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "hw attr set fail");
+		return rtn;
+	}
+	if (!hw_attr) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL hw_attr");
+		return -EINVAL;
+	}
+
+	return sl_core_lgrp_hw_attr_set(lgrp->ldev_num, lgrp->num, hw_attr);
+}
+EXPORT_SYMBOL(sl_lgrp_hw_attr_set);
+
+struct sl_lgrp *sl_lgrp_new(struct sl_ldev *ldev, u8 lgrp_num, struct kobject *sysfs_parent)
+{
+	int rtn;
+
+	rtn = sl_ldev_check(ldev);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+	if (lgrp_num >= SL_ASIC_MAX_LGRPS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "invalid (lgrp_num = %u)", lgrp_num);
+		return ERR_PTR(-EINVAL);
+	}
+
+	rtn = sl_ctrl_lgrp_new(ldev->num, lgrp_num, sysfs_parent);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+
+	return &lgrps[ldev->num][lgrp_num];
+}
+EXPORT_SYMBOL(sl_lgrp_new);
+
+int sl_lgrp_del(struct sl_lgrp *lgrp)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "del fail");
+		return rtn;
+	}
+
+	return sl_ctrl_lgrp_del(lgrp->ldev_num, lgrp->num);
+}
+EXPORT_SYMBOL(sl_lgrp_del);
+
+int sl_lgrp_config_set(struct sl_lgrp *lgrp, struct sl_lgrp_config *lgrp_config)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "config set fail");
+		return rtn;
+	}
+	rtn = sl_lgrp_config_check(lgrp_config);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "config set fail");
+		return rtn;
+	}
+
+	return sl_ctrl_lgrp_config_set(lgrp->ldev_num, lgrp->num, lgrp_config);
+}
+EXPORT_SYMBOL(sl_lgrp_config_set);
+
+int sl_lgrp_policy_set(struct sl_lgrp *lgrp, struct sl_lgrp_policy *lgrp_policy)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "policy set fail");
+		return rtn;
+	}
+	rtn = sl_lgrp_policy_check(lgrp_policy);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "policy set fail");
+		return rtn;
+	}
+
+	return sl_ctrl_lgrp_policy_set(lgrp->ldev_num, lgrp->num, lgrp_policy);
+}
+EXPORT_SYMBOL(sl_lgrp_policy_set);
+
+int sl_lgrp_notif_callback_reg(struct sl_lgrp *lgrp, sl_lgrp_notif_t callback,
+			       u32 types, void *tag)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "callback reg fail");
+		return rtn;
+	}
+	if (!callback) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL callback");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_lgrp_notif_callback_reg(lgrp->ldev_num, lgrp->num, callback, types, tag);
+}
+EXPORT_SYMBOL(sl_lgrp_notif_callback_reg);
+
+int sl_lgrp_notif_callback_unreg(struct sl_lgrp *lgrp, sl_lgrp_notif_t callback,
+				 u32 types)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "callback unreg fail");
+		return rtn;
+	}
+	if (!callback) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL callback");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_lgrp_notif_callback_unreg(lgrp->ldev_num, lgrp->num, callback, types);
+}
+EXPORT_SYMBOL(sl_lgrp_notif_callback_unreg);
+
+int sl_lgrp_connect_id_set(struct sl_lgrp *lgrp, const char *connect_id)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "id set fail");
+		return rtn;
+	}
+	if (!connect_id) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL connect_id");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_lgrp_connect_id_set(lgrp->ldev_num, lgrp->num, connect_id);
+}
+EXPORT_SYMBOL(sl_lgrp_connect_id_set);
+
+const char *sl_lgrp_config_tech_str(u32 config)
+{
+	if (config == SL_LGRP_CONFIG_TECH_CK_400G)
+		return "ck400G";
+	if (config == SL_LGRP_CONFIG_TECH_CK_200G)
+		return "ck200G";
+	if (config == SL_LGRP_CONFIG_TECH_CK_100G)
+		return "ck100G";
+	if (config == SL_LGRP_CONFIG_TECH_BS_200G)
+		return "bs200G";
+	if (config == SL_LGRP_CONFIG_TECH_CD_100G)
+		return "cd100G";
+	if (config == SL_LGRP_CONFIG_TECH_CD_50G)
+		return "cd50G";
+	if (config == SL_LGRP_CONFIG_TECH_BJ_100G)
+		return "bj100G";
+
+	return "unknown";
+}
+EXPORT_SYMBOL(sl_lgrp_config_tech_str);
+
+const char *sl_lgrp_config_fec_str(u32 config)
+{
+	if (config == SL_LGRP_CONFIG_FEC_RS_LL)
+		return "reed-solomon-low-latency";
+	if (config == SL_LGRP_CONFIG_FEC_RS)
+		return "reed-solomon";
+
+	return "unknown";
+}
+EXPORT_SYMBOL(sl_lgrp_config_fec_str);
+
+const char *sl_lgrp_furcation_str(u32 furcation)
+{
+	if (furcation == SL_MEDIA_FURCATION_X1)
+		return "unfurcated";
+	if (furcation == SL_MEDIA_FURCATION_X2)
+		return "bifurcated";
+	if (furcation == SL_MEDIA_FURCATION_X4)
+		return "quadfurcated";
+
+	return "unknown";
+}
+EXPORT_SYMBOL(sl_lgrp_furcation_str);
+
+const char *sl_lgrp_notif_str(u32 notif)
+{
+	switch (notif) {
+	case SL_LGRP_NOTIF_INVALID:
+		return "invalid";
+	case SL_LGRP_NOTIF_LINK_UP:
+		return "link-up";
+	case SL_LGRP_NOTIF_LINK_UP_FAIL:
+		return "link-up-fail";
+	case SL_LGRP_NOTIF_LINK_DOWN:
+		return "link-down";
+	case SL_LGRP_NOTIF_LINK_ASYNC_DOWN:
+		return "link-async-down";
+	case SL_LGRP_NOTIF_LINK_ERROR:
+		return "link-error";
+	case SL_LGRP_NOTIF_LINK_UCW_WARN:
+		return "link-ucw-warn";
+	case SL_LGRP_NOTIF_LINK_CCW_WARN:
+		return "link-ccw-warn";
+	case SL_LGRP_NOTIF_LLR_SETUP:
+		return "llr-setup";
+	case SL_LGRP_NOTIF_LLR_SETUP_TIMEOUT:
+		return "llr-setup-timeout";
+	case SL_LGRP_NOTIF_LLR_RUNNING:
+		return "llr-running";
+	case SL_LGRP_NOTIF_LLR_START_TIMEOUT:
+		return "llr-start-timeout";
+	case SL_LGRP_NOTIF_LLR_CANCELED:
+		return "llr-canceled";
+	case SL_LGRP_NOTIF_LLR_ERROR:
+		return "llr-error";
+	case SL_LGRP_NOTIF_MEDIA_PRESENT:
+		return "media-present";
+	case SL_LGRP_NOTIF_MEDIA_NOT_PRESENT:
+		return "media-not-present";
+	case SL_LGRP_NOTIF_MEDIA_ERROR:
+		return "media-error";
+	case SL_LGRP_NOTIF_MEDIA_HOT:
+		return "media-hot";
+	case SL_LGRP_NOTIF_MEDIA_COLD:
+		return "media-cold";
+	case SL_LGRP_NOTIF_MEDIA_WARM:
+		return "media-warm";
+	case SL_LGRP_NOTIF_AN_DATA:
+		return "an-data";
+	case SL_LGRP_NOTIF_AN_TIMEOUT:
+		return "an-timeout";
+	case SL_LGRP_NOTIF_AN_ERROR:
+		return "an-error";
+	case SL_LGRP_NOTIF_LANE_DEGRADE:
+		return "auto-lane-degrade";
+	case SL_LGRP_NOTIF_LANE_DEGRADE_RECOVERY:
+		return "auto-lane-degrade-recovery";
+	case SL_LGRP_NOTIF_PML_RECOVERY:
+		return "pml-recovery";
+	case SL_LGRP_NOTIF_LINK_DOWN_REQ:
+		return "link-down-request";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_lgrp_notif_str);
+
+const char *sl_lgrp_config_opt_str(u32 option)
+{
+	switch (option) {
+	case SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE:
+		return "loopback-serdes-enable";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_lgrp_config_opt_str);
+
+const char *sl_lgrp_fec_mode_str(u32 mode)
+{
+	switch (mode) {
+	case SL_LGRP_FEC_MODE_OFF:
+		return "off";
+	case SL_LGRP_FEC_MODE_MONITOR:
+		return "monitor";
+	case SL_LGRP_FEC_MODE_CORRECT:
+		return "correct";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_lgrp_fec_mode_str);
+
+const char *sl_lgrp_llr_mode_str(u32 mode)
+{
+	switch (mode) {
+	case SL_LGRP_LLR_MODE_OFF:
+		return "off";
+	case SL_LGRP_LLR_MODE_MONITOR:
+		return "monitor";
+	case SL_LGRP_LLR_MODE_ON:
+		return "on";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_lgrp_llr_mode_str);
diff --git a/drivers/net/ethernet/hpe/sl/sl_link.c b/drivers/net/ethernet/hpe/sl/sl_link.c
new file mode 100644
index 000000000000..c66e48a62748
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_link.c
@@ -0,0 +1,632 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/err.h>
+
+#include <linux/hpe/sl/sl_link.h>
+
+#include "sl_asic.h"
+#include "sl_log.h"
+#include "sl_lgrp.h"
+#include "sl_link.h"
+#include "sl_core_str.h"
+#include "sl_ctrl_link.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_LINK_LOG_NAME
+
+static struct sl_link links[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+
+void sl_link_init(void)
+{
+	u8 ldev_num;
+	u8 lgrp_num;
+	u8 link_num;
+
+	for (ldev_num = 0; ldev_num < SL_ASIC_MAX_LDEVS; ++ldev_num) {
+		for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+			for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
+				links[ldev_num][lgrp_num][link_num].magic    = SL_LINK_MAGIC;
+				links[ldev_num][lgrp_num][link_num].ver      = SL_LINK_VER;
+				links[ldev_num][lgrp_num][link_num].num      = link_num;
+				links[ldev_num][lgrp_num][link_num].lgrp_num = lgrp_num;
+				links[ldev_num][lgrp_num][link_num].ldev_num = ldev_num;
+			}
+		}
+	}
+}
+
+int sl_link_check(struct sl_link *link)
+{
+	if (!link) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL link");
+		return -EINVAL;
+	}
+	if (IS_ERR(link)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link pointer error");
+		return -EINVAL;
+	}
+	if (link->magic != SL_LINK_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link magic");
+		return -EINVAL;
+	}
+	if (link->ver != SL_LINK_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link version");
+		return -EINVAL;
+	}
+	if (link->num >= SL_ASIC_MAX_LINKS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link num");
+		return -EINVAL;
+	}
+	if (link->lgrp_num >= SL_ASIC_MAX_LGRPS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp num");
+		return -EINVAL;
+	}
+	if (link->ldev_num >= SL_ASIC_MAX_LDEVS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev num");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl_link_config_check(struct sl_link_config *link_config)
+{
+	if (!link_config) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL link_config");
+		return -EINVAL;
+	}
+	if (IS_ERR(link_config)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link_config pointer error");
+		return -EINVAL;
+	}
+	if (link_config->magic != SL_LINK_CONFIG_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link_config magic");
+		return -EINVAL;
+	}
+	if (link_config->ver != SL_LINK_CONFIG_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link_config version");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl_link_policy_check(struct sl_link_policy *link_policy)
+{
+	if (!link_policy) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL link_policy");
+		return -EINVAL;
+	}
+	if (IS_ERR(link_policy)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link_policy pointer error");
+		return -EINVAL;
+	}
+	if (link_policy->magic != SL_LINK_POLICY_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link_policy magic");
+		return -EINVAL;
+	}
+	if (link_policy->ver != SL_LINK_POLICY_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad link_policy version");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+struct sl_link *sl_link_new(struct sl_lgrp *lgrp, u8 link_num, struct kobject *sysfs_parent)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+	if (link_num >= SL_ASIC_MAX_LINKS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "invalid (link_num = %u)", link_num);
+		return ERR_PTR(-EINVAL);
+	}
+
+	rtn = sl_ctrl_link_new(lgrp->ldev_num, lgrp->num, link_num, sysfs_parent);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+
+	return &links[lgrp->ldev_num][lgrp->num][link_num];
+}
+EXPORT_SYMBOL(sl_link_new);
+
+int sl_link_del(struct sl_link *link)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "del fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_del(link->ldev_num, link->lgrp_num, link->num);
+}
+EXPORT_SYMBOL(sl_link_del);
+
+int sl_link_config_set(struct sl_link *link, struct sl_link_config *link_config)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link config set fail");
+		return rtn;
+	}
+	rtn = sl_link_config_check(link_config);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link config set fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_config_set(link->ldev_num, link->lgrp_num, link->num, link_config);
+}
+EXPORT_SYMBOL(sl_link_config_set);
+
+int sl_link_policy_set(struct sl_link *link, struct sl_link_policy *link_policy)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "policy set fail");
+		return rtn;
+	}
+	rtn = sl_link_policy_check(link_policy);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "policy set fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_policy_set(link->ldev_num, link->lgrp_num, link->num, link_policy);
+}
+EXPORT_SYMBOL(sl_link_policy_set);
+
+int sl_link_an_lp_caps_get(struct sl_link *link, struct sl_link_caps *caps, u32 timeout_ms, u32 flags)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "lp caps get fail");
+		return rtn;
+	}
+	if (!caps) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL caps");
+		return -EINVAL;
+	}
+	if (timeout_ms == 0) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "0 timeout");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_link_an_lp_caps_get(link->ldev_num, link->lgrp_num, link->num, caps, timeout_ms, flags);
+}
+EXPORT_SYMBOL(sl_link_an_lp_caps_get);
+
+int sl_link_an_lp_caps_stop(struct sl_link *link)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "lp caps stop fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_an_lp_caps_stop(link->ldev_num, link->lgrp_num, link->num);
+}
+EXPORT_SYMBOL(sl_link_an_lp_caps_stop);
+
+int sl_link_up(struct sl_link *link)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link up fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_up(link->ldev_num, link->lgrp_num, link->num);
+}
+EXPORT_SYMBOL(sl_link_up);
+
+int sl_link_down(struct sl_link *link)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link down fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_down(link->ldev_num, link->lgrp_num, link->num);
+}
+EXPORT_SYMBOL(sl_link_down);
+
+int sl_link_reset(struct sl_link *link)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link reset fail");
+		return rtn;
+	}
+
+	return sl_ctrl_link_reset(link->ldev_num, link->lgrp_num, link->num);
+}
+EXPORT_SYMBOL(sl_link_reset);
+
+int sl_link_clocks_get(struct sl_link *link, u32 *up_count, s64 *up_time, s64 *total_time)
+{
+	int rtn;
+	s64 up;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link clocks get fail");
+		return rtn;
+	}
+
+	rtn = sl_ctrl_link_up_clocks_get(link->ldev_num, link->lgrp_num, link->num, up_time, total_time, &up);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link_up_clocks_get failed [%d]", rtn);
+		return rtn;
+	}
+
+	rtn = sl_ctrl_link_up_count_get(link->ldev_num, link->lgrp_num, link->num, up_count);
+	if (rtn)
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link_up_count_get failed [%d]", rtn);
+
+	return rtn;
+}
+EXPORT_SYMBOL(sl_link_clocks_get);
+
+int sl_link_state_get(struct sl_link *link, u32 *state)
+{
+	int rtn;
+
+	rtn = sl_link_check(link);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "link state get fail");
+		return rtn;
+	}
+	if (!state) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL state");
+		return -EINVAL;
+	}
+
+	return sl_ctrl_link_state_get_cmd(link->ldev_num, link->lgrp_num, link->num, state);
+}
+EXPORT_SYMBOL(sl_link_state_get);
+
+const char *sl_link_state_str(u32 state)
+{
+	switch (state) {
+	case SL_LINK_STATE_INVALID:
+		return "invalid";
+	case SL_LINK_STATE_DOWN:
+		return "down";
+	case SL_LINK_STATE_AN:
+		return "autoneg";
+	case SL_LINK_STATE_STARTING:
+		return "starting";
+	case SL_LINK_STATE_UP:
+		return "up";
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		return "up-requested-down";
+	case SL_LINK_STATE_STOPPING:
+		return "stopping";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_link_state_str);
+
+const char *sl_link_degrade_state_str(u32 degrade_state)
+{
+	switch (degrade_state) {
+	case SL_LINK_DEGRADE_STATE_ACTIVE:
+		return "active";
+	case SL_LINK_DEGRADE_STATE_INACTIVE:
+		return "inactive";
+	case SL_LINK_DEGRADE_STATE_FAILED:
+		return "error";
+	case SL_LINK_DEGRADE_STATE_INVALID:
+		return "invalid";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_link_degrade_state_str);
+
+const char *sl_link_an_lp_caps_state_str(u32 lp_caps_state)
+{
+	switch (lp_caps_state) {
+	case SL_CORE_LINK_LP_CAPS_NOT_RUNNING:
+		return "not_running";
+	case SL_CORE_LINK_LP_CAPS_RUNNING:
+		return "running";
+	case SL_CORE_LINK_LP_CAPS_DATA:
+		return "data";
+	case SL_CORE_LINK_LP_CAPS_TIMEOUT:
+		return "timeout";
+	case SL_CORE_LINK_LP_CAPS_ERROR:
+		return "error";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_link_an_lp_caps_state_str);
+
+const char *sl_link_config_opt_str(u32 option)
+{
+	switch (option) {
+	case SL_LINK_CONFIG_OPT_AUTONEG_ENABLE:
+		return "autoneg-enable";
+	case SL_LINK_CONFIG_OPT_AUTONEG_CONTINUOUS_ENABLE:
+		return "autoneg-continuous";
+	case SL_LINK_CONFIG_OPT_HEADSHELL_LOOPBACK_ENABLE:
+		return "loopback-headshell-enable";
+	case SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE:
+		return "loopback-remote-enable";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_link_config_opt_str);
+
+const char *sl_link_policy_opt_str(u32 option)
+{
+	switch (option) {
+	case SL_LINK_POLICY_OPT_KEEP_SERDES_UP:
+		return "keep-serdes-up";
+	case SL_LINK_POLICY_OPT_USE_UNSUPPORTED_CABLE:
+		return "use-unsupported-cable";
+	case SL_LINK_POLICY_OPT_IGNORE_MEDIA_ERROR:
+		return "ignore-media-error";
+	case SL_LINK_POLICY_OPT_USE_SUPPORTED_SS200_CABLE:
+		return "use-supported-ss200-cable";
+	case SL_LINK_POLICY_OPT_LINK_DOWN_REQ:
+		return "link-down-request";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_link_policy_opt_str);
+
+#define SL_LINK_DOWN_INFO_MASK (     \
+	SL_LINK_DOWN_RETRYABLE      |\
+	SL_LINK_DOWN_ORIGIN_ASYNC   |\
+	SL_LINK_DOWN_ORIGIN_LINK_UP)
+
+static int sl_link_down_cause_map_masked_str(unsigned long cause_map, char *cause_str, unsigned int cause_str_size,
+					     u64 mask)
+{
+	int rtn;
+	int str_pos;
+	int which;
+
+	if (!cause_str)
+		return -EINVAL;
+
+	if (cause_str_size < SL_LINK_DOWN_CAUSE_STR_SIZE_MIN)
+		return -EINVAL;
+
+	cause_map &= mask;
+
+	if (cause_map == SL_LINK_DOWN_CAUSE_NONE) {
+		scnprintf(cause_str, cause_str_size, "none");
+		return 0;
+	}
+
+	str_pos = 0;
+
+	for_each_set_bit(which, &cause_map, sizeof(cause_map) * BITS_PER_BYTE) {
+
+		switch (BIT(which)) {
+		case SL_LINK_DOWN_CAUSE_UCW:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "ucw ");
+			break;
+		case SL_LINK_DOWN_CAUSE_LF:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "lcl-fault ");
+			break;
+		case SL_LINK_DOWN_CAUSE_RF:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "rmt-fault ");
+			break;
+		case SL_LINK_DOWN_CAUSE_DOWN:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "link-down ");
+			break;
+		case SL_LINK_DOWN_CAUSE_UP_TRIES:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "up-tries ");
+			break;
+		case SL_LINK_DOWN_CAUSE_AUTONEG_NOMATCH:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "autoneg-nomatch ");
+			break;
+		case SL_LINK_DOWN_CAUSE_AUTONEG:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "autoneg-fail ");
+			break;
+		case SL_LINK_DOWN_CAUSE_CONFIG:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "config ");
+			break;
+		case SL_LINK_DOWN_CAUSE_INTR_ENABLE:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "intr-enable ");
+			break;
+		case SL_LINK_DOWN_CAUSE_TIMEOUT:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "timeout ");
+			break;
+		case SL_LINK_DOWN_CAUSE_CANCELED:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "canceled ");
+			break;
+		case SL_LINK_DOWN_CAUSE_COMMAND:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "command ");
+			break;
+		case SL_LINK_DOWN_CAUSE_DOWNSHIFT:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "downshift-fail ");
+			break;
+		case SL_LINK_DOWN_CAUSE_LLR_REPLAY_MAX:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "llr-replay-at-max ");
+			break;
+		case SL_LINK_DOWN_CAUSE_UPSHIFT:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "upshift-fail ");
+			break;
+		case SL_LINK_DOWN_CAUSE_AUTONEG_CONFIG:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "an-config ");
+			break;
+		case SL_LINK_DOWN_CAUSE_PCS_FAULT:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "pcs-fault ");
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_PLL:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "serdes-pll ");
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_CONFIG:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "serdes-config ");
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_SIGNAL:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "serdes-signal ");
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_QUALITY:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "serdes-quality ");
+			break;
+		case SL_LINK_DOWN_CAUSE_NO_MEDIA:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "no-media ");
+			break;
+		case SL_LINK_DOWN_CAUSE_CCW:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "ccw ");
+			break;
+		case SL_LINK_DOWN_CAUSE_MEDIA_HOT:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "media-hot ");
+			break;
+		case SL_LINK_DOWN_CAUSE_MEDIA_WARM:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "media-warm ");
+			break;
+		case SL_LINK_DOWN_CAUSE_INTR_REGISTER:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "interrupt-reg ");
+			break;
+		case SL_LINK_DOWN_CAUSE_MEDIA_ERROR:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "media-error ");
+			break;
+		case SL_LINK_DOWN_CAUSE_UP_CANCELED:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "up-canceled ");
+			break;
+		case SL_LINK_DOWN_CAUSE_UNSUPPORTED_SPEED:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "unsupported-speed ");
+			break;
+		case SL_LINK_DOWN_CAUSE_SS200_CABLE:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "ss200-cable ");
+			break;
+		case SL_LINK_DOWN_CAUSE_TX_LOL:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "tx-lol ");
+			break;
+		case SL_LINK_DOWN_CAUSE_RX_LOL:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "rx-lol ");
+			break;
+		case SL_LINK_DOWN_CAUSE_TX_LOS:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "tx-los ");
+			break;
+		case SL_LINK_DOWN_CAUSE_RX_LOS:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "rx-los ");
+			break;
+
+		case SL_LINK_DOWN_RETRYABLE:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "retryable ");
+			break;
+		case SL_LINK_DOWN_ORIGIN_ASYNC:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "origin-async ");
+			break;
+		case SL_LINK_DOWN_ORIGIN_LINK_UP:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "origin-up ");
+			break;
+
+		default:
+			rtn = snprintf(cause_str + str_pos, cause_str_size - str_pos, "unknown ");
+			break;
+		}
+
+		if (rtn < 0) {
+			scnprintf(cause_str, cause_str_size, "error");
+			return 0;
+		}
+		if (str_pos + rtn >= cause_str_size) {
+			str_pos = cause_str_size - 1;
+			cause_str[str_pos - 3] = '.';
+			cause_str[str_pos - 2] = '.';
+			cause_str[str_pos - 1] = '.';
+			cause_str[str_pos] = '\0';
+			return 0;
+		}
+		str_pos += rtn;
+	}
+
+	cause_str[str_pos - 1] = '\0';
+
+	return 0;
+}
+
+int sl_link_down_cause_map_str(u64 cause_map, char *cause_str, unsigned int cause_str_size)
+{
+	return sl_link_down_cause_map_masked_str(cause_map, cause_str, cause_str_size, ~SL_LINK_DOWN_INFO_MASK);
+}
+EXPORT_SYMBOL(sl_link_down_cause_map_str);
+
+int sl_link_down_cause_map_with_info_str(u64 cause_map, char *cause_str, unsigned int cause_str_size)
+{
+	return sl_link_down_cause_map_masked_str(cause_map, cause_str, cause_str_size, ~0ULL);
+}
+EXPORT_SYMBOL(sl_link_down_cause_map_with_info_str);
+
+int sl_link_info_map_str(u64 info_map, char *info_map_str, unsigned int info_map_str_size)
+{
+	return sl_core_info_map_str(info_map, info_map_str, info_map_str_size);
+}
+EXPORT_SYMBOL(sl_link_info_map_str);
+
+const char *sl_link_config_pause_str(u32 config)
+{
+	if (config == SL_LINK_CONFIG_PAUSE_ASYM)
+		return "pause-asym";
+	if (config == SL_LINK_CONFIG_PAUSE_SYM)
+		return "pause-sym";
+
+	return "unknown";
+}
+EXPORT_SYMBOL(sl_link_config_pause_str);
+
+const char *sl_link_config_hpe_str(u32 config)
+{
+	if (config == SL_LINK_CONFIG_HPE_LINKTRAIN)
+		return "link-train";
+	if (config == SL_LINK_CONFIG_HPE_PRECODING)
+		return "precode";
+	if (config == SL_LINK_CONFIG_HPE_PCAL)
+		return "progressive-cal";
+	if (config == SL_LINK_CONFIG_HPE_R3)
+		return "R3";
+	if (config == SL_LINK_CONFIG_HPE_R2)
+		return "R2";
+	if (config == SL_LINK_CONFIG_HPE_R1)
+		return "R1";
+	if (config == SL_LINK_CONFIG_HPE_C3)
+		return "C3";
+	if (config == SL_LINK_CONFIG_HPE_C2)
+		return "C2";
+	if (config == SL_LINK_CONFIG_HPE_C1)
+		return "C1";
+	if (config == SL_LINK_CONFIG_HPE_LLR)
+		return "llr";
+
+	return "unknown";
+}
+EXPORT_SYMBOL(sl_link_config_hpe_str);
diff --git a/drivers/net/ethernet/hpe/sl/sl_llr.c b/drivers/net/ethernet/hpe/sl/sl_llr.c
new file mode 100644
index 000000000000..539574d4e428
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_llr.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/err.h>
+
+#include <linux/hpe/sl/sl_llr.h>
+
+#include "sl_asic.h"
+#include "sl_log.h"
+#include "sl_lgrp.h"
+#include "sl_llr.h"
+#include "sl_ctrl_llr.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_LLR_LOG_NAME
+
+static struct sl_llr llrs[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+
+void sl_llr_init(void)
+{
+	u8 ldev_num;
+	u8 lgrp_num;
+	u8 link_num;
+
+	for (ldev_num = 0; ldev_num < SL_ASIC_MAX_LDEVS; ++ldev_num) {
+		for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+			for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
+				llrs[ldev_num][lgrp_num][link_num].magic    = SL_LLR_MAGIC;
+				llrs[ldev_num][lgrp_num][link_num].ver      = SL_LLR_VER;
+				llrs[ldev_num][lgrp_num][link_num].num      = link_num;
+				llrs[ldev_num][lgrp_num][link_num].lgrp_num = lgrp_num;
+				llrs[ldev_num][lgrp_num][link_num].ldev_num = ldev_num;
+			}
+		}
+	}
+}
+
+static int sl_llr_check(struct sl_llr *llr)
+{
+	if (!llr) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL llr");
+		return -EINVAL;
+	}
+	if (IS_ERR(llr)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "llr pointer error");
+		return -EINVAL;
+	}
+	if (llr->magic != SL_LLR_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad llr magic");
+		return -EINVAL;
+	}
+	if (llr->ver != SL_LLR_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "wrong llr version");
+		return -EINVAL;
+	}
+	if (llr->num >= SL_ASIC_MAX_LINKS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad llr num");
+		return -EINVAL;
+	}
+	if (llr->lgrp_num >= SL_ASIC_MAX_LGRPS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp num");
+		return -EINVAL;
+	}
+	if (llr->ldev_num >= SL_ASIC_MAX_LDEVS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev num");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl_llr_config_check(struct sl_llr_config *llr_config)
+{
+	if (!llr_config) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL llr_config");
+		return -EINVAL;
+	}
+	if (IS_ERR(llr_config)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "llr_config pointer error");
+		return -EINVAL;
+	}
+	if (llr_config->magic != SL_LLR_CONFIG_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad llr_config magic");
+		return -EINVAL;
+	}
+	if (llr_config->ver != SL_LLR_CONFIG_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "wrong llr_config version");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl_llr_policy_check(struct sl_llr_policy *llr_policy)
+{
+	if (!llr_policy) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL llr_policy");
+		return -EINVAL;
+	}
+	if (IS_ERR(llr_policy)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "llr_policy pointer error");
+		return -EINVAL;
+	}
+	if (llr_policy->magic != SL_LLR_POLICY_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad llr_policy magic");
+		return -EINVAL;
+	}
+	if (llr_policy->ver != SL_LLR_POLICY_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "wrong llr_policy version");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+struct sl_llr *sl_llr_new(struct sl_lgrp *lgrp, u8 llr_num, struct kobject *sysfs_parent)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+	if (llr_num >= SL_ASIC_MAX_LINKS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "invalid (llr_num = %u)", llr_num);
+		return ERR_PTR(-EINVAL);
+	}
+
+	rtn = sl_ctrl_llr_new(lgrp->ldev_num, lgrp->num, llr_num, sysfs_parent);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+
+	return &llrs[lgrp->ldev_num][lgrp->num][llr_num];
+}
+EXPORT_SYMBOL(sl_llr_new);
+
+int sl_llr_del(struct sl_llr *llr)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "del fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_del(llr->ldev_num, llr->lgrp_num, llr->num);
+}
+EXPORT_SYMBOL(sl_llr_del);
+
+int sl_llr_config_set(struct sl_llr *llr, struct sl_llr_config *llr_config)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "config set fail");
+		return rtn;
+	}
+	rtn = sl_llr_config_check(llr_config);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "config set fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_config_set(llr->ldev_num, llr->lgrp_num, llr->num, llr_config);
+}
+EXPORT_SYMBOL(sl_llr_config_set);
+
+int sl_llr_policy_set(struct sl_llr *llr, struct sl_llr_policy *llr_policy)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "policy set fail");
+		return rtn;
+	}
+	rtn = sl_llr_policy_check(llr_policy);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "policy set fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_policy_set(llr->ldev_num, llr->lgrp_num, llr->num, llr_policy);
+}
+EXPORT_SYMBOL(sl_llr_policy_set);
+
+int sl_llr_setup(struct sl_llr *llr)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "setup fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_setup(llr->ldev_num, llr->lgrp_num, llr->num);
+}
+EXPORT_SYMBOL(sl_llr_setup);
+
+int sl_llr_start(struct sl_llr *llr)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "start fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_start(llr->ldev_num, llr->lgrp_num, llr->num);
+}
+EXPORT_SYMBOL(sl_llr_start);
+
+int sl_llr_stop(struct sl_llr *llr)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "stop fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_stop(llr->ldev_num, llr->lgrp_num, llr->num);
+}
+EXPORT_SYMBOL(sl_llr_stop);
+
+int sl_llr_state_get(struct sl_llr *llr, enum sl_llr_state *state)
+{
+	int rtn;
+
+	rtn = sl_llr_check(llr);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "state get fail");
+		return rtn;
+	}
+
+	return sl_ctrl_llr_state_get(llr->ldev_num, llr->lgrp_num, llr->num, state);
+}
+EXPORT_SYMBOL(sl_llr_state_get);
+
+const char *sl_llr_state_str(u32 state)
+{
+	switch (state) {
+	case SL_LLR_STATE_INVALID:
+		return "invalid";
+	case SL_LLR_STATE_OFF:
+		return "off";
+	case SL_LLR_STATE_CONFIGURED:
+		return "configured";
+	case SL_LLR_STATE_SETUP_BUSY:
+		return "setup-busy";
+	case SL_LLR_STATE_SETUP:
+		return "setup";
+	case SL_LLR_STATE_START_BUSY:
+		return "start-busy";
+	case SL_LLR_STATE_RUNNING:
+		return "running";
+	case SL_LLR_STATE_CANCELING:
+		return "canceling";
+	case SL_LLR_STATE_STOP_BUSY:
+		return "stop-busy";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_llr_state_str);
+
+const char *sl_llr_link_dn_behavior_str(u32 behavior)
+{
+	switch (behavior) {
+	case SL_LLR_LINK_DN_BEHAVIOR_DISCARD:
+		return "discard";
+	case SL_LLR_LINK_DN_BEHAVIOR_BLOCK:
+		return "block";
+	case SL_LLR_LINK_DN_BEHAVIOR_BEST_EFFORT:
+		return "best-effort";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_llr_link_dn_behavior_str);
diff --git a/drivers/net/ethernet/hpe/sl/sl_mac.c b/drivers/net/ethernet/hpe/sl/sl_mac.c
new file mode 100644
index 000000000000..a8c6ee46721e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_mac.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/err.h>
+
+#include <linux/hpe/sl/sl_mac.h>
+
+#include "sl_asic.h"
+#include "sl_log.h"
+#include "sl_lgrp.h"
+#include "sl_mac.h"
+#include "sl_ctrl_mac.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_MAC_LOG_NAME
+
+static struct sl_mac macs[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+
+void sl_mac_init(void)
+{
+	u8 ldev_num;
+	u8 lgrp_num;
+	u8 link_num;
+
+	for (ldev_num = 0; ldev_num < SL_ASIC_MAX_LDEVS; ++ldev_num) {
+		for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+			for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
+				macs[ldev_num][lgrp_num][link_num].magic    = SL_MAC_MAGIC;
+				macs[ldev_num][lgrp_num][link_num].ver      = SL_MAC_VER;
+				macs[ldev_num][lgrp_num][link_num].num      = link_num;
+				macs[ldev_num][lgrp_num][link_num].lgrp_num = lgrp_num;
+				macs[ldev_num][lgrp_num][link_num].ldev_num = ldev_num;
+			}
+		}
+	}
+}
+
+static int sl_mac_check(struct sl_mac *mac)
+{
+	if (!mac) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL mac");
+		return -EINVAL;
+	}
+	if (IS_ERR(mac)) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "mac pointer error");
+		return -EINVAL;
+	}
+	if (mac->magic != SL_MAC_MAGIC) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad mac magic");
+		return -EINVAL;
+	}
+	if (mac->ver != SL_MAC_VER) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad mac version");
+		return -EINVAL;
+	}
+	if (mac->num >= SL_ASIC_MAX_LINKS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad mac num");
+		return -EINVAL;
+	}
+	if (mac->lgrp_num >= SL_ASIC_MAX_LGRPS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad lgrp num");
+		return -EINVAL;
+	}
+	if (mac->ldev_num >= SL_ASIC_MAX_LDEVS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "bad ldev num");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+struct sl_mac *sl_mac_new(struct sl_lgrp *lgrp, u8 mac_num, struct kobject *sysfs_parent)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+	if (mac_num >= SL_ASIC_MAX_LINKS) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "invalid (mac_num = %u)", mac_num);
+		return ERR_PTR(-EINVAL);
+	}
+
+	rtn = sl_ctrl_mac_new(lgrp->ldev_num, lgrp->num, mac_num, sysfs_parent);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "new fail");
+		return ERR_PTR(rtn);
+	}
+
+	return &macs[lgrp->ldev_num][lgrp->num][mac_num];
+}
+EXPORT_SYMBOL(sl_mac_new);
+
+int sl_mac_del(struct sl_mac *mac)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "del fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_del(mac->ldev_num, mac->lgrp_num, mac->num);
+}
+EXPORT_SYMBOL(sl_mac_del);
+
+int sl_mac_tx_start(struct sl_mac *mac)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "tx start fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_tx_start(mac->ldev_num, mac->lgrp_num, mac->num);
+}
+EXPORT_SYMBOL(sl_mac_tx_start);
+
+int sl_mac_tx_stop(struct sl_mac *mac)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "tx stop fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_tx_stop(mac->ldev_num, mac->lgrp_num, mac->num);
+}
+EXPORT_SYMBOL(sl_mac_tx_stop);
+
+int sl_mac_tx_state_get(struct sl_mac *mac, u32 *state)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "tx state get fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_tx_state_get(mac->ldev_num, mac->lgrp_num, mac->num, state);
+}
+EXPORT_SYMBOL(sl_mac_tx_state_get);
+
+int sl_mac_rx_start(struct sl_mac *mac)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "rx start fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_rx_start(mac->ldev_num, mac->lgrp_num, mac->num);
+}
+EXPORT_SYMBOL(sl_mac_rx_start);
+
+int sl_mac_rx_stop(struct sl_mac *mac)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "rx stop fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_rx_stop(mac->ldev_num, mac->lgrp_num, mac->num);
+}
+EXPORT_SYMBOL(sl_mac_rx_stop);
+
+int sl_mac_rx_state_get(struct sl_mac *mac, u32 *state)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "rx state get fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_rx_state_get(mac->ldev_num, mac->lgrp_num, mac->num, state);
+}
+EXPORT_SYMBOL(sl_mac_rx_state_get);
+
+int sl_mac_reset(struct sl_mac *mac)
+{
+	int rtn;
+
+	rtn = sl_mac_check(mac);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "reset fail");
+		return rtn;
+	}
+
+	return sl_ctrl_mac_reset(mac->ldev_num, mac->lgrp_num, mac->num);
+}
+EXPORT_SYMBOL(sl_mac_reset);
+
+const char *sl_mac_state_str(u32 state)
+{
+	switch (state) {
+	case SL_MAC_STATE_OFF:
+		return "off";
+	case SL_MAC_STATE_ON:
+		return "on";
+	default:
+		return "unknown";
+	}
+}
+EXPORT_SYMBOL(sl_mac_state_str);
diff --git a/drivers/net/ethernet/hpe/sl/sl_media.c b/drivers/net/ethernet/hpe/sl/sl_media.c
new file mode 100644
index 000000000000..50f60e36645c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_media.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_log.h"
+#include "sl_lgrp.h"
+#include "sl_media_jack.h"
+
+#define LOG_BLOCK SL_LOG_BLOCK
+#define LOG_NAME  SL_LOG_MEDIA_LOG_NAME
+
+int sl_media_headshell_temp_get(struct sl_lgrp *lgrp, u8 *temp)
+{
+	int rtn;
+
+	rtn = sl_lgrp_check(lgrp);
+	if (rtn) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "headshell temp get fail");
+		return rtn;
+	}
+	if (!temp) {
+		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL temp");
+		return -EINVAL;
+	}
+
+	return sl_media_jack_cable_temp_get(lgrp->ldev_num, lgrp->num, temp);
+}
+EXPORT_SYMBOL(sl_media_headshell_temp_get);
+
+const char *sl_media_furcation_str(u32 furcation)
+{
+	switch (furcation) {
+	case SL_MEDIA_FURCATION_X1:
+		return "unfurcated";
+	case SL_MEDIA_FURCATION_X2:
+		return "bifurcated";
+	case SL_MEDIA_FURCATION_X4:
+		return "quadfurcated";
+	case SL_MEDIA_FURCATION_UNKNOWN:
+		return "unknown";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_furcation_str);
+
+const char *sl_media_state_str(u8 state)
+{
+	switch (state) {
+	case SL_MEDIA_JACK_CABLE_REMOVED:
+		return "removed";
+	case SL_MEDIA_JACK_CABLE_INSERTED:
+		return "inserted";
+	case SL_MEDIA_JACK_CABLE_GOING_ONLINE:
+		return "going-online";
+	case SL_MEDIA_JACK_CABLE_ONLINE:
+		return "online";
+	case SL_MEDIA_JACK_CABLE_ERROR:
+		return "error";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_state_str);
+
+const char *sl_media_cable_speed_state_str(u8 cable_speed_state)
+{
+	switch (cable_speed_state) {
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_UPSHIFTED:
+		return "400G";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_DOWNSHIFTED:
+		return "200G";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_NO_CABLE:
+		return "failed-no-cable";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_FAKE_CABLE:
+		return "failed-fake-cable";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_NO_SUPPORT:
+		return "failed-no-support";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_CHECK:
+		return "failed-check";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_UPSHIFT:
+		return "failed-up";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_DOWNSHIFT:
+		return "failed-down";
+	case SL_MEDIA_JACK_CABLE_SHIFT_STATE_NOTSHIFTED:
+		return "none";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_cable_speed_state_str);
+
+const char *sl_media_type_str(u32 type)
+{
+	switch (type) {
+	case SL_MEDIA_TYPE_HEADSHELL:
+		return "headshell";
+	case SL_MEDIA_TYPE_BACKPLANE:
+		return "backplane";
+	case SL_MEDIA_TYPE_ELECTRICAL:
+		return "electrical";
+	case SL_MEDIA_TYPE_OPTICAL:
+		return "optical";
+	case SL_MEDIA_TYPE_PASSIVE:
+		return "passive";
+	case SL_MEDIA_TYPE_ACTIVE:
+		return "active";
+	case SL_MEDIA_TYPE_ANALOG:
+		return "analog";
+	case SL_MEDIA_TYPE_DIGITAL:
+		return "digital";
+	case SL_MEDIA_TYPE_LOOPBACK:
+		return "loopback";
+	case SL_MEDIA_TYPE_UNSUPPORTED:
+		return "unsupported";
+	case SL_MEDIA_TYPE_UNKNOWN:
+		return "unknown";
+	case SL_MEDIA_TYPE_AOC:
+		return "AOC";
+	case SL_MEDIA_TYPE_POC:
+		return "POC";
+	case SL_MEDIA_TYPE_PEC:
+		return "PEC";
+	case SL_MEDIA_TYPE_AEC:
+		return "AEC";
+	case SL_MEDIA_TYPE_ACC:
+		return "ACC";
+	case SL_MEDIA_TYPE_BKP:
+		return "BKP";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_type_str);
+
+const char *sl_media_shape_str(u32 shape)
+{
+	switch (shape) {
+	case SL_MEDIA_SHAPE_UNKNOWN:
+		return "unknown";
+	case SL_MEDIA_SHAPE_STRAIGHT:
+		return "straight";
+	case SL_MEDIA_SHAPE_SPLITTER:
+		return "splitter(y)";
+	case SL_MEDIA_SHAPE_BIFURCATED:
+		return "bifurcated(H)";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_shape_str);
+
+const char *sl_media_cable_end_str(u8 cable_end)
+{
+	switch (cable_end) {
+	case SL_MEDIA_CABLE_END_DD:
+		return "qsfp_dd";
+	case SL_MEDIA_CABLE_END_END1:
+		return "qsfp_end1";
+	case SL_MEDIA_CABLE_END_END2:
+		return "qsfp_end2";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_cable_end_str);
+
+const char *sl_media_vendor_str(u32 vendor)
+{
+	switch (vendor) {
+	case SL_MEDIA_VENDOR_UNKNOWN:
+		return "unknown";
+	case SL_MEDIA_VENDOR_TE:
+		return "te";
+	case SL_MEDIA_VENDOR_HISENSE:
+		return "hisense";
+	case SL_MEDIA_VENDOR_LEONI:
+		return "leoni";
+	case SL_MEDIA_VENDOR_FINISAR:
+		return "finisar";
+	case SL_MEDIA_VENDOR_MOLEX:
+		return "molex";
+	case SL_MEDIA_VENDOR_BIZLINK:
+		return "bizlink";
+	case SL_MEDIA_VENDOR_HPE:
+		return "hpe";
+	case SL_MEDIA_VENDOR_CLOUD_LIGHT:
+		return "cloud-light";
+	case SL_MEDIA_VENDOR_MULTILANE:
+		return "multilane";
+	case SL_MEDIA_VENDOR_AMPHENOL:
+		return "amphenol";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_vendor_str);
+
+const char *sl_media_speed_str(u32 speed)
+{
+	switch (speed) {
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_800G:
+		return "ck800G";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_400G:
+		return "ck400G";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_200G:
+		return "ck200G";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_100G:
+		return "ck100G";
+	case SL_MEDIA_SPEEDS_SUPPORT_BS_200G:
+		return "bs200G";
+	case SL_MEDIA_SPEEDS_SUPPORT_BJ_100G:
+		return "bj100G";
+	case SL_MEDIA_SPEEDS_SUPPORT_CD_100G:
+		return "cd100G";
+	case SL_MEDIA_SPEEDS_SUPPORT_CD_50G:
+		return "cd50G";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_speed_str);
+
+const char *sl_media_ber_str(u8 media_interface)
+{
+	switch (media_interface) {
+	case 1:
+		return "<1E-12";
+	case 2:
+		return "<5E-5";
+	case 3:
+		return "<2.6E-4";
+	case 4:
+		return "<1E-6";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_ber_str);
+
+const char *sl_media_host_interface_str(u32 speed, u32 type)
+{
+	if ((type == SL_MEDIA_TYPE_PEC) || (type == SL_MEDIA_TYPE_BKP)) {
+		switch (speed) {
+		case SL_MEDIA_SPEEDS_SUPPORT_CD_50G:
+			return "50GBASE-CR";
+		case SL_MEDIA_SPEEDS_SUPPORT_CD_100G:
+			return "100GBASE-CR2";
+		case SL_MEDIA_SPEEDS_SUPPORT_CK_100G:
+			return "100GBASE-CR1";
+		case SL_MEDIA_SPEEDS_SUPPORT_BS_200G:
+			return "200GBASE-CR4";
+		case SL_MEDIA_SPEEDS_SUPPORT_CK_200G:
+			return "200GBASE-CR2";
+		case SL_MEDIA_SPEEDS_SUPPORT_CK_400G:
+			return "400GBASE-CR4";
+		case SL_MEDIA_SPEEDS_SUPPORT_CK_800G:
+			return "800GBASE-CR8";
+		case SL_MEDIA_SPEEDS_SUPPORT_BJ_100G:
+			return "BJ-100G";
+		default:
+			return "invalid";
+		}
+	}
+
+	switch (speed) {
+	case SL_MEDIA_SPEEDS_SUPPORT_CD_50G:
+		return "50GAUI-1-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_CD_100G:
+		return "100GAUI-2-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_100G:
+		return "100GAUI-1-L-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_BS_200G:
+		return "200GAUI-4-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_200G:
+		return "200GAUI-2-S-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_400G:
+		return "400GAUI-4-S-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_CK_800G:
+		return "800GAUI-8-S-C2M";
+	case SL_MEDIA_SPEEDS_SUPPORT_BJ_100G:
+		return "BJ-100G";
+	default:
+		return "invalid";
+	}
+
+}
+EXPORT_SYMBOL(sl_media_host_interface_str);
+
+const char *sl_media_info_str(u32 info)
+{
+	switch (info) {
+	case SL_MEDIA_INFO_AUTONEG:
+		return "autoneg";
+	case SL_MEDIA_INFO_FAKE:
+		return "fake";
+	case SL_MEDIA_INFO_RESETTABLE:
+		return "resettable";
+	case SL_MEDIA_INFO_LINKTRAIN:
+		return "linktrain";
+	case SL_MEDIA_INFO_SUPPORTED_SS200_CABLE:
+		return "supported-ss200-cable";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_info_str);
+
+const char *sl_media_error_str(u32 error)
+{
+	switch (error) {
+	case SL_MEDIA_ERROR_CABLE_UNSUPPORTED:
+		return "unsupported";
+	case SL_MEDIA_ERROR_CABLE_FORMAT_UNSUPPORTED:
+		return "unsupported-format";
+	case SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED:
+		return "unsupported-fw";
+	case SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT:
+		return "headshell-fault";
+	case SL_MEDIA_ERROR_TEMP_DOWN_LIMIT_DEFAULT:
+		return "temperature-down-limit-default";
+	case SL_MEDIA_ERROR_TEMP_WARN_LIMIT_DEFAULT:
+		return "temperature-warn-limit-default";
+	case SL_MEDIA_ERROR_TRYABLE:
+		return "tryable";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_error_str);
+
+const char *sl_media_jack_type_str(u32 jack_type, u32 density)
+{
+	switch (jack_type) {
+	case SL_MEDIA_JACK_TYPE_BACKPLANE:
+		return "backplane";
+	case SL_MEDIA_JACK_TYPE_SFP:
+		return "sfp";
+	case SL_MEDIA_JACK_TYPE_QSFP:
+		if (density == SL_MEDIA_QSFP_DENSITY_DOUBLE)
+			return "qsfp-dd";
+		return "qsfp";
+	case SL_MEDIA_JACK_TYPE_OSFP:
+		return "osfp";
+	case SL_MEDIA_JACK_TYPE_UNKNOWN:
+		return "unknown";
+	case SL_MEDIA_JACK_TYPE_UNSUPPORTED:
+		return "unsupported";
+	default:
+		return "invalid";
+	}
+}
+EXPORT_SYMBOL(sl_media_jack_type_str);
diff --git a/drivers/net/ethernet/hpe/sl/sl_media_nic.c b/drivers/net/ethernet/hpe/sl/sl_media_nic.c
new file mode 100644
index 000000000000..23af513e6bd9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_media_nic.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <linux/hpe/sl/sl_lgrp.h>
+
+#include "sl_lgrp.h"
+
+int sl_media_cable_insert(struct sl_lgrp *lgrp, u8 *eeprom_page0, u8 *eeprom_page1, u32 flags)
+{
+	/* placeholder for future functionality */
+	return 0;
+}
+EXPORT_SYMBOL(sl_media_cable_insert);
+
+int sl_media_cable_remove(struct sl_lgrp *lgrp)
+{
+	/* placeholder for future functionality */
+	return 0;
+}
+EXPORT_SYMBOL(sl_media_cable_remove);
diff --git a/drivers/net/ethernet/hpe/sl/sl_module.c b/drivers/net/ethernet/hpe/sl/sl_module.c
new file mode 100644
index 000000000000..b63efedf94ff
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/sl_module.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/version.h>
+
+#include "sl_module.h"
+
+#include "sl.h"
+#include "sl_ldev.h"
+#include "sl_lgrp.h"
+#include "sl_link.h"
+#include "sl_llr.h"
+#include "sl_mac.h"
+
+static unsigned long serdes_core_io_trace_lgrp_map;
+module_param(serdes_core_io_trace_lgrp_map, ulong, 0644);
+MODULE_PARM_DESC(serdes_core_io_trace_lgrp_map, "serdes core io trace enable link group map");
+
+u64 sl_serdes_core_io_trace_lgrp_map_get(void)
+{
+	return serdes_core_io_trace_lgrp_map;
+}
+
+#define SL_DEVICE_NAME "sl"
+
+#define tostr(x)             #x
+#define version_str(a, b, c) tostr(a.b.c)
+#define SL_VERSION_STR       version_str(SL_VERSION_MAJOR, SL_VERSION_MINOR, SL_VERSION_INC)
+#define hash_str(h)          tostr(h)
+#define SL_GIT_HASH_STR      hash_str(GIT_HASH)
+
+void sl_version_get(int *major, int *minor, int *inc)
+{
+	if (major)
+		*major = SL_VERSION_MAJOR;
+	if (minor)
+		*minor = SL_VERSION_MINOR;
+	if (inc)
+		*inc = SL_VERSION_INC;
+}
+EXPORT_SYMBOL(sl_version_get);
+
+char *sl_version_str_get(void)
+{
+	return SL_VERSION_STR;
+}
+
+char *sl_git_hash_str_get(void)
+{
+	return (strlen(SL_GIT_HASH_STR) == 0) ? "unavailable" : SL_GIT_HASH_STR;
+}
+EXPORT_SYMBOL(sl_git_hash_str_get);
+
+static dev_t          sl_dev;
+static struct class  *sl_class;
+static struct device *sl_device;
+
+static int __init sl_init(void)
+{
+	int rtn;
+
+	pr_info("%s: init v" SL_VERSION_STR "\n", module_name(THIS_MODULE));
+	pr_info("%s: hash " SL_GIT_HASH_STR "\n", module_name(THIS_MODULE));
+
+	rtn = alloc_chrdev_region(&sl_dev, 0, 1, SL_DEVICE_NAME);
+	if (rtn) {
+		pr_err("alloc_chrdev_region failed [%d]", rtn);
+		return -EIO;
+	}
+
+	sl_class = class_create(SL_DEVICE_NAME);
+
+	if (IS_ERR(sl_class)) {
+		rtn = PTR_ERR(sl_class);
+		pr_err("class_create \"%s\" failed [%d]", SL_DEVICE_NAME, rtn);
+		goto out_region;
+	}
+
+	sl_device = device_create(sl_class, NULL, sl_dev, NULL, SL_DEVICE_NAME);
+	if (IS_ERR(sl_device)) {
+		rtn = PTR_ERR(sl_device);
+		pr_err("device_create failed [%d]", rtn);
+		goto out_class;
+	}
+
+	sl_ldev_init();
+	sl_lgrp_init();
+	sl_link_init();
+	sl_llr_init();
+	sl_mac_init();
+
+	return 0;
+
+out_class:
+	class_destroy(sl_class);
+out_region:
+	unregister_chrdev_region(sl_dev, 1);
+
+	return rtn;
+}
+module_init(sl_init);
+
+struct device *sl_device_get(void)
+{
+	return sl_device;
+}
+
+static void __exit sl_exit(void)
+{
+	pr_info("%s: exit\n", module_name(THIS_MODULE));
+
+	device_destroy(sl_class, sl_dev);
+	class_destroy(sl_class);
+	unregister_chrdev_region(sl_dev, 1);
+
+	sl_ldev_exit();
+}
+module_exit(sl_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Slingshot Platform Team <hpcdev_ss_plat@hpe.com>");
+MODULE_DESCRIPTION("Slingshot Link Module");
+MODULE_VERSION(SL_VERSION_STR);

-- 
2.56.0

