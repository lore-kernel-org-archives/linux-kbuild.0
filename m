Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538812;
	b=4x6XOMhkt2MD5u/GgpqIYVgumtOb2eUw0J8jLpUB1CX5E27NM3pG01iBMb8GW9HOmuag
	 QVL501r64g2g7HhVWrqeSE9OsjDxw6bn43/BjZ30mIAbHy7is2lYzpK3/mas1Lh+rr/Ye
	 A98CZwhAHEbYIKHPcl8RB7EJJOEVq6mPGWkUZmcfworf1IeHTMFFvuqj0fv5pR0lOlrai
	 drywSmLmQzOYBr6/VFbBS5c5AmYGQ9dpkZiGyW3mgd5KNvOEz8H+z46sKF6L5FpV/deKh
	 o7mOkaU0rybBs6Egf/wnG7WVVQqdPGS6J5PTpWZmE3PX/NJNt1rD9enFAXjHiKhKw8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538812;
	h=DMARC-Filter:DKIM-Signature:EX-QQ-RecipientCnt:X-QQ-GoodBg:X-QQ-SSF:
	 X-QQ-FEAT:X-QQ-BUSINESS-ORIGIN:X-QQ-Originating-IP:X-Originating-IP:
	 X-QQ-STYLE:X-QQ-mid:From:To:Cc:Subject:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:Date:X-Priority:Message-ID:X-QQ-MIME:
	 X-Mailer:X-QQ-Mailer:References:In-Reply-To:X-QQ-ReplyHash:
	 X-BIZMAIL-ID:X-Address-Ticket:X-QQ-SENDSIZE:Received:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8jv0dN0+3TdUOlryQUtoAvIXg9Hhg6ZTTqg/pyui1no=;
	b=Km449qQjsr1amAAJErnbr+lGoLwkOisQZj7eVlMEGAywhxxz8rcaGkfkydL0IJ/kupfS
	 YHDHhy+W6SAseacJ/Om/EfNr9VlQ/a7RcsvlwcJF+cCJjnSFty1LAkkhRnMdQOiJXdZiT
	 xV1tFGZKC+jD5I5bIevp4oi7QZn3BX09Sm6hAEYIpIa8cF37hwuQJMZFBSrd92vsLO/FS
	 2qGlK2DBc+oKawjoosQcfAL41MFdEs9kyVImNOvWBFOjk5ii5Y9MEaIuWjaHct4yF9/gp
	 CWfQc4cp/2CDDOSO4keBqpYvs/UIHKW6Lcn0NdfCPnEXWMCEliWqNUDfPzj4J4p+LJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=JfnjOZ85;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D8606A31E
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 16:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=JfnjOZ85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795538733;
	bh=8jv0dN0+3TdUOlryQUtoAvIXg9Hhg6ZTTqg/pyui1no=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=JfnjOZ85MFowkBMF3lSUs1xmn3kOLJ+w4MgphIK/J7QYY18ISpAaqhzWMtVTYr44z
	 atg7Hj7cPiHKTOJFtlEtXWEJNdD9hpYtNrQWDZpb62tTkSfHQ2C2y/ofCMj/FwVU97
	 OkbPjbswHeOWzc+w1B+lmenCiN5Hohf2lJBiyWrM=
EX-QQ-RecipientCnt: 8
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqSlXlpbK7AkXTDcolCrkFqn3C7Hjr8FHuU=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: mI5wsHrhAGn3z9KN6EGMHjOAENWwObKmtBu91xCGWSs=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1795538732tbb016ca4
From: "=?utf-8?B?5YWz5paH5rab?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?WGkgUnVveWFv?=" <xry111@xry111.site>, "=?utf-8?B?TmF0aGFuIENoYW5jZWxsb3I=?=" <nathan@kernel.org>, "=?utf-8?B?bWVuZ3FpbmdnYW5n?=" <mengqinggang@loongson.cn>
Cc: "=?utf-8?B?Y2hlbmh1YWNhaQ==?=" <chenhuacai@kernel.org>, "=?utf-8?B?bGludXgta2J1aWxk?=" <linux-kbuild@vger.kernel.org>, "=?utf-8?B?bG9vbmdhcmNo?=" <loongarch@lists.linux.dev>, "=?utf-8?B?Y2hhcmxpZQ==?=" <charlie@rivosinc.com>, "=?utf-8?B?bWFzYWhpcm95?=" <masahiroy@kernel.org>
Subject: Re: [RFC PATCH v2] kbuild: modinst: drop orphaned local labels from stripped modules
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 25 Nov 2026 00:45:32 +0800
X-Priority: 3
Message-ID: <tencent_1B2677463422B57E770DF6E9@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261124035942.GB2738970@ax162>
	<6E960C21EF6F6A78+20261124105408.3119771-2-guanwentao@uniontech.com>
	<84a64a3f632f9e1e3208c0ceac55cedf0f266e9d.camel@xry111.site>
In-Reply-To: <84a64a3f632f9e1e3208c0ceac55cedf0f266e9d.camel@xry111.site>
X-QQ-ReplyHash: 2173645982
X-BIZMAIL-ID: 2559094563994576182
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Wed, 25 Nov 2026 00:45:32 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: N6euzTYZA5gv4ng9qITAK46DYXvRjP4lwMI4BB7guFDF7GVosbqWkd5t
	si72RwHDXWlKm/2UdqXt8BMIzOBOOz+iX1xx33DO7Swc3kyxyUn6mQJ6ADX0L1LdvCDGJs/
	PlOkgTtwvcRvSIZAtB3Dlma+LMlMVsw9b0tBsOfEh/fo1MOqddCHnpwGLQJxO621NlsE23k
	bnyLe4AzqMVhuY4IGItAWmeG7zRPJ4R3p2/NXLxNPXqCj+J/hF3yxSTUr04ye7ButAo2/Q4
	z71ny0WoaZaVkls+VHph7UaPtz67RltIqIHuuOirNDkBKnxT0TgaIFT96Wmbgf1dOA4rdna
	N66em8QYp23cFhB/LNJ82/W3U2BA4RpUPkMKbNIjCGlFzu0RW3vytZ8+kTF09AWBjALdIfW
	C9Vg2dvxTq4uRO6qyHhe6xCxL10s4wKy/nMxxXC0w6r1LuaQCdh0MLmpdvG8VG8N7Ry/kI5
	8KOiDvMtYBW2xTgBFRh0PoiqNrVF89QvFDJyOhWIoyQzeMFB1aVF4CZJpFepmpGgPkkJrep
	h5pp+CvA8B22pe1MCGqZrmBAPie1nWTtbTXd0qJWryyb2vxrz4bqFhj2l1/rdOmNnvF/i6k
	HUpZvuqaeDZKWGg+m+8NuMKjMPxsevnbnOKFuVhaejmfuyNUxMnkNvteZLg/gd8hPa3+ecI
	8g7NtRxq1K3OSMvWqPRZB8g3vu1uQz3eceGZymLSkxUX6SolN0dLuSDBzY6MdRB7aCWejEY
	3E0d7E+1hNcUaR0WVDAqqsUbYX6pHMJgeEn6Wb06pdENh7wNgIn4lQRNoYjsTAyRQDECxAC
	/5x4PAqY/otxqdCfKLrtQ0n0EIezve10FCBbtxM//jI8o3LvHPcjmTluan+ZJ88C3SC7v3n
	niATjAh1vg1yQ9yNVocGYWOJXEvbhC1CTwoh/FkpayqBViqQfVeupzq3kbUiIbzv+FlMqmT
	WMQz5HPRjDwqZqxG2MhpXZQJXo1OpHRdrJxLMdfdTuh/F4z3j8icuWuaKwcn+KFPNm+zyXH
	vTHPi5i3Ad9xb3XMu5
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

SGksDQoNCj4gT24gVHVlLCAyMDI2LTExLTI0IGF0IDE4OjU0ICswODAwLCBXZW50YW8gR3Vh
biB3cm90ZToNCj4gPiBJTlNUQUxMX01PRF9TVFJJUD0xIG1hcHMgdG8gInN0cmlwIC0tc3Ry
aXAtZGVidWciLCB3aGljaCBpcyBhIHNlY3Rpb24NCj4gPiBvcGVyYXRpb246IGl0IHJlbW92
ZXMgLmRlYnVnXyogYW5kIC5yZWxhLmRlYnVnXyogYnV0IGxlYXZlcyB0aGUgc3ltYm9sDQo+
ID4gdGFibGUgYWxvbmUuICBXaGVuIHRoZSBhc3NlbWJsZXIgaGFzIHRvIG5hbWUgZ2NjJ3Mg
LWcgbGFiZWxzIGluIHRoZQ0KPiA+IHJlbG9jYXRpb25zIGl0IGVtaXRzIGZvciBkZWJ1ZyBk
YXRhLCB0aG9zZSBsYWJlbHMgc3RheSBpbiAuc3ltdGFiIGFuZA0KPiA+IHN1cnZpdmUgdGhl
IHN0cmlwIGFzIG9ycGhhbnMuICBXaGV0aGVyIHRoYXQgaGFwcGVucyBpcyBhIHByb3BlcnR5
IG9mIHRoZQ0KPiA+IHRhcmdldCdzIGFzc2VtYmxlciwgbm90IG9mIHRoZSBrZXJuZWw6IHRo
ZSB4ODYtNjQgYW5kIGFybTY0IGFzc2VtYmxlcnMNCj4gPiByZXNvbHZlIHRoZSBEV0FSRiBy
ZWZlcmVuY2VzIGFnYWluc3QgdGhlIHNlY3Rpb24gc3ltYm9sIHdpdGggYW4gYWRkZW5kLA0K
PiANCj4gUWluZ2dhbmcgaGFzIHJlY2VudGx5IGltcHJvdmVkIGxkLmJmZCB0byBoYW5kbGUg
cmVsb2NhdGlvbnMgYWdhaW5zdA0KPiBzZWN0aW9uICsgYWRkZW5kIGluIHJlbGF4YXRpb24s
IHRodXMgSSBndWVzcyB0aGUgYXNzZW1ibGVyIGNhbiBiZQ0KPiBtb2RpZmllZCB0byB1c2Ug
c2VjdGlvbiArIGFkZGVuZCBsaWtlIHg4Ni02NCBhbmQgYXJtNjQgZm9yIERXQVJGIG5vdw0K
PiAobWF5YmUgb3B0LWluIHdpdGggYSBzd2l0Y2ggdG8ga2VlcCBjb21wYXRpYmlsaXR5IHdp
dGggb2xkIGxpbmtlcnMpLg0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBwb2ludGVy
LiBBZ3JlZWQsIHRoYXQgaXMgdGhlIHJvb3QgY2F1c2UsDQpJIGd1ZXNzIHlvdXIgbWVhbnMg
YXJlIFFpbmdnYW5nYHMgdHdvIFJGQ3MgWzFdIFsyXS4gSSBhbSBub3QgYW4gZXhwZXJ0LA0K
YW55IGNvbW1lbnRzIHdpbGwgYmUgd2VsY29tZWQuDQoNCkkgYWxzbyB0ZXN0ZWQgLS1kaXNj
YXJkcy1sb2NhbHMgaW4geDg2LTY0IGlzIGFsbW9zdCBuby1vcCAodHdvIHVucmVmZXJlbmNl
ZCAuTEMgc3ltYm9scyBkcm9wcGVkIA0KZnJvbSBhbiBhbWRncHUua28gYWxsIDQyOSw2NDgg
cmVsb2NhdGlvbnMgdW5jaGFuZ2VkKS4NCg0KWzFdOiBodHRwczovL3NvdXJjZXdhcmUub3Jn
L3BpcGVybWFpbC9iaW51dGlscy8yMDI2LVNlcHRlbWJlci8xNTE2MTUuaHRtbA0KWzJdOiBo
dHRwczovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9iaW51dGlscy8yMDI2LVNlcHRlbWJl
ci8xNTE1NDQuaHRtbA0KDQpCUnMNCldlbnRhbyBHdWFu

