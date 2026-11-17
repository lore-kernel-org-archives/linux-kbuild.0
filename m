Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945814;
	b=iIXl8c8/FZWd1ynt/TTzE5TJr5BiX+Uuhl/FOSsCRY5aYONP4h4FyG/lFfQkhA29wnZ/
	 mEmYux0QoosTiUD6HGxXOmhVpZOWXn8XufXUWlmOtnZPZHQIeGzH245H844fpcJIWMlqf
	 +TYXBbXbMA7eYE5T8ggHmnd5QsW+XInEcwnDnAnJfM32Nsn0ecCyrw/fR3A8QjSqIXQfT
	 RYmbLsmaFhpotenaUtRsCy/+Sl0xxToaVQHzSSLbd5i/wETpXcXSexfSNqoAIZgJMDG5o
	 d6v+bUPsozHQht3vqlp10J8mmviu9QpJFbx7Gp/vG/mok9J8YjFDu6LJOZQ7Q8d/zNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945814;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type;
	bh=uyyTnPsw7Ii2zbJiwxPIj01iC+D/M15OetanJcm5Djg=;
	b=BH2MaXPSJ90/IEgZyzufBT8rGmmVk8NK+MVna8ZHrFCCJlx9ETRZPwiJzs0OqQqFpNo0
	 X3lzL484WdJ1hiUbEz7NmOtl+Ys8F+FmTNf7PLUtArXc8CkcIp0ewwmyUjW74CBEmr78C
	 dK6twhhocucoPtWyWsJvKUbnDDIFMqBXCr5SeTPTGgoL5e45apiSBM3t6nxwU3L7mRirL
	 8nQ0x1kuq3tyseEoWH1mukLWN1v5abuq7O4MkHlYNeTo6af7y68FTqkfIntj/RA9T0zC/
	 62I6YzTz3NYiLwC7XTECZdPcU2CvjP3I/H0EN4pfAe5kbq+eBSbPLwWaH+HNISnX4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b="Tpp43/QH";
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58855606A32A
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 20:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58855606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Tpp43/QH
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 619F740625;
	Tue, 17 Nov 2026 21:03:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 44DB71FBB9B;
	Tue, 17 Nov 2026 21:03:22 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Mouwf1Q8IWXB; Tue, 17 Nov 2026 21:03:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9C6291FBC2C;
	Tue, 17 Nov 2026 21:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 9C6291FBC2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1794945801;
	bh=uyyTnPsw7Ii2zbJiwxPIj01iC+D/M15OetanJcm5Djg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Tpp43/QH66fHlxODqWhzxEZXmbdYeeasX8GgSxUBLZrKitXj6UGZW0qw7maqLFWik
	 Al42hFrkC0NiUvMv23eMMCnIgNEOuOYW8x1EX7QSsEraUGekl1hbe9xvzciKILbZKl
	 Q/eOTu5rpGr97Qs99fC4pTXbM7tvomTiQXuQp20cO8GwWEYCkHT/9R4YDvgNUTSEEy
	 09tR3LQOg/uBFqXY8ODIemucitdVm55HyTIAXBpq4FIjPsaBvJ30Z7iqKcuXJGAR8D
	 jDlMrIAaNcjCeP8hlN180hH4ZwVRTtbWXEsScPT2+UBCL3DWc16l4lzelkNaPyK/ep
	 ogoyPqlMqLnYg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OkUBGHKpgxRN; Tue, 17 Nov 2026 21:03:21 +0100 (CET)
Received: from [192.168.0.168] (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id DDAD51FBB9B;
	Tue, 17 Nov 2026 21:03:20 +0100 (CET)
Message-ID: <99eee19a-9761-48c0-a097-c115c4782c36@tngtech.com>
Date: Tue, 17 Nov 2026 21:03:18 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] kbuild: record cmd-prereqs in .cmd files
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20261116175215.1337416-1-luis.augenstein@tngtech.com>
 <20261116175215.1337416-5-luis.augenstein@tngtech.com>
 <sashiko-outbox-219281@kernel.org>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <sashiko-outbox-219281@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ifMQBf5U1i40GslSf02eGMt5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ifMQBf5U1i40GslSf02eGMt5
Content-Type: multipart/mixed; boundary="------------C5RD8l2JFHi00i5rpxJzfEfw";
 protected-headers="v1"; hp="clear"
Message-ID: <99eee19a-9761-48c0-a097-c115c4782c36@tngtech.com>
Date: Tue, 17 Nov 2026 21:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] kbuild: record cmd-prereqs in .cmd files
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20261116175215.1337416-1-luis.augenstein@tngtech.com>
 <20261116175215.1337416-5-luis.augenstein@tngtech.com>
 <sashiko-outbox-219281@kernel.org>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <sashiko-outbox-219281@kernel.org>

--------------C5RD8l2JFHi00i5rpxJzfEfw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDExLzE3LzI2IDE4OjUyLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0K
PiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyBjbWQtcHJlcmVxcyBpbmNsdWRlIHRvb2xzL29i
anRvb2wvb2JqdG9vbCBvbiBpbmNyZW1lbnRhbCBidWlsZHMgd2hpbGUNCj4gb21pdHRpbmcg
aXQgb24gY2xlYW4gYnVpbGRzPw0KPiANCj4gSW4gc2NyaXB0cy9NYWtlZmlsZS5saWIsIGNt
ZF9nZW5fb2JqdG9vbGRlcCBhcHBlbmRzIGEgc3RhbmRhbG9uZSBydWxlIHRvDQo+IHRoZSAu
Y21kIGZpbGUgYWZ0ZXIgY21kX2FuZF9maXhkZXAgb3IgY21kX2FuZF9zYXZlY21kIHJ1bnM6
DQo+IA0KPiBzY3JpcHRzL01ha2VmaWxlLmxpYjoNCj4gY21kX2dlbl9vYmp0b29sZGVwID0g
JChpZiAkKG9ianRvb2wtZW5hYmxlZCksIHsgZWNobyA7IGVjaG8gJyRAOiAkJCh3aWxkY2Fy
ZCAkKG9ianRvb2wpKScgOyB9ID4+ICQoZG90LXRhcmdldCkuY21kKQ0KPiANCj4gT24gYSBj
bGVhbiBidWlsZCwgJChkb3QtdGFyZ2V0KS5jbWQgZG9lcyBub3QgZXhpc3QgeWV0LCBzbyAk
KHJlYWwtcHJlcmVxcykNCj4gYW5kIG1ha2VfcHJlcmVxc188dGFyZ2V0PiBkbyBub3QgaW5j
bHVkZSAkKG9ianRvb2wpLiAgT24gYW4gaW5jcmVtZW50YWwNCj4gcmVidWlsZCwgTWFrZSBp
bmNsdWRlcyB0aGUgcHJldmlvdXMgLmNtZCBmaWxlIGFuZCBhZGRzIHRvb2xzL29ianRvb2wv
b2JqdG9vbA0KPiB0byAkXiBhbmQgJChyZWFsLXByZXJlcXMpLiAgQmVjYXVzZSBpdCBpcyBu
ZWl0aGVyIGluICQoZGVwc18kQCkgbm9yIGluIHRoZQ0KPiBjb21waWxlciBkZXBmaWxlLCBu
ZWl0aGVyIGNtZC1wcmVyZXFzIG5vciBmaXhkZXAgZmlsdGVycyBpdCBvdXQsIGxlYXZpbmcN
Cj4gbWFrZV9wcmVyZXFzXzx0YXJnZXQ+IGluY29uc2lzdGVudCBiZXR3ZWVuIGNsZWFuIGFu
ZCBpbmNyZW1lbnRhbCBidWlsZHMuDQoNCm1ha2VfcHJlcmVxcyBpcyB3cml0dGVuIGJlZm9y
ZSBLYnVpbGQgYXBwZW5kcyB0aGUgb2JqdG9vbCBkZXBlbmRlbmN5DQpydWxlIHRvIHRoZSAu
Y21kIGZpbGUuIFRoZXJlZm9yZSwgTWFrZSBkb2VzIG5vdCB5ZXQga25vdyBhYm91dA0Kb2Jq
dG9vbCBkdXJpbmcgdGhlIGluaXRpYWwgYnVpbGQuIE9uIHRoZSBuZXh0IGJ1aWxkLCBNYWtl
IHJlYWRzIHRoZQ0KLmNtZCBmaWxlIGFuZCBpbmNsdWRlcyB0aGUgYXBwZW5kZWQgb2JqdG9v
bCBkZXBlbmRlbmN5IGluICReLiBJZiB0aGUNCnRhcmdldCBpcyByZWJ1aWx0LCBtYWtlX3By
ZXJlcXMgcmVjb3JkcyBvYmp0b29sIGFzIHdlbGwuDQoNCkkgdGhpbmsgdGhpcyBiZWhhdmlv
ciBpcyBmaW5lLiBvYmp0b29sIGJlY29tZXMgYSBNYWtlIHByZXJlcXVpc2l0ZQ0Kb25seSBh
ZnRlciB0aGUgaW5pdGlhbCBidWlsZCwgc28gaXQgaXMgY29uc2lzdGVudCBmb3IgaXQgdG8g
YXBwZWFyDQppbiBtYWtlX3ByZXJlcXMgb25seSBhZnRlciBhIHJlYnVpbGQuDQoNCkZvciB0
aGUgU0JPTSB0aGlzIGlzIGlycmVsZXZhbnQgYmVjYXVzZSBvYmp0b29sIGlzDQpmaWx0ZXJl
ZCBvdXQgYW55d2F5LiBDbGVhbiBhbmQgaW5jcmVtZW50YWwgU0JPTXMgYXJlIHRoZXJlZm9y
ZSB0aGUNCnNhbWUuIEkgd291bGQga2VlcCB0aGlzIGJlaGF2aW9yIGFzLWlzIHJhdGhlciB0
aGFuIGludHJvZHVjaW5nDQpzcGVjaWFsLWNhc2UgbG9naWMgZm9yIG9ianRvb2wuDQoNCj4g
W1NldmVyaXR5OiBNZWRpdW1dDQo+IERvICcuLyctcHJlZml4ZWQgaGVhZGVyIGRlcGVuZGVu
Y2llcyBmYWlsIHRvIG1hdGNoIGluIGJvdGggY21kLXByZXJlcXMgYW5kDQo+IHByaW50X21h
a2VfcHJlcmVxcygpIG9uIGluY3JlbWVudGFsIGJ1aWxkcz8NCj4gDQo+IEtidWlsZCBwYXNz
ZXMgaW5jbHVkZSBwYXRocyBiZWdpbm5pbmcgd2l0aCAnLi8nIChzdWNoIGFzIC1JLi9pbmNs
dWRlIGFuZA0KPiAtaW5jbHVkZSAuL2luY2x1ZGUvbGludXgva2NvbmZpZy5oKSwgc28gdGhl
IGNvbXBpbGVyIGRlcGZpbGUgYW5kDQo+IGRlcHNfPHRhcmdldD4gcmVjb3JkIHBhdGhzIHdp
dGggYSBsZWFkaW5nICcuLycuICBXaGVuIE1ha2UgcGFyc2VzDQo+ICc8dGFyZ2V0PjogJChk
ZXBzXzx0YXJnZXQ+KScgb24gYW4gaW5jcmVtZW50YWwgYnVpbGQsIGl0IHN0cmlwcyBsZWFk
aW5nDQo+ICcuLycgZnJvbSB0YXJnZXQgbmFtZXMgd2hlbiBwb3B1bGF0aW5nICReIGFuZCAk
KHJlYWwtcHJlcmVxcykuDQo+IA0KPiBBcyBhIHJlc3VsdCwgJChmaWx0ZXItb3V0ICQoZGVw
c18kQCksICQocmVhbC1wcmVyZXFzKSkgaW4gY21kLXByZXJlcXMgYW5kDQo+IHRoZSBzZWVu
X3ByZXJlcXNfaGFzaHRhYiBsb29rdXAgaW4gcHJpbnRfbWFrZV9wcmVyZXFzKCkgY29tcGFy
ZSAnLi8nLXByZWZpeGVkDQo+IHN0cmluZ3MgYWdhaW5zdCBzdHJpcHBlZCB0b2tlbnMgaW4g
cHJlcmVxcy4gIEV2ZXJ5ICcuLyctcHJlZml4ZWQgaGVhZGVyIGluDQo+IGRlcHNfPHRhcmdl
dD4gKGluY2x1ZGluZyBoZWFkZXJzIHJlbW92ZWQgc2luY2UgdGhlIHByZXZpb3VzIGJ1aWxk
KSB0aGVuDQo+IGxlYWtzIGludG8gbWFrZV9wcmVyZXFzXzx0YXJnZXQ+IG9uIGluY3JlbWVu
dGFsIHJlYnVpbGRzLg0KPiANCj4gU3RyaXBwaW5nIGxlYWRpbmcgJy4vJyB3aGVuIG5vcm1h
bGl6aW5nIGRlcHNfPHRhcmdldD4gaW4gY21kLXByZXJlcXMgYW5kDQo+IHdoZW4gaW5zZXJ0
aW5nIG9yIGxvb2tpbmcgdXAgZW50cmllcyBpbiBwcmludF9tYWtlX3ByZXJlcXMoKSB3b3Vs
ZCBhbGxvdw0KPiBib3RoIGZpbHRlcnMgdG8gbWF0Y2ggdGhlIHBhdGhzIGluICQocmVhbC1w
cmVyZXFzKS4NCg0KQ29uZmlybWVkIGFuZCByZXByb2R1Y2VkIHRoaXMgaW4gYW4gaW4tdHJl
ZSBidWlsZCBmb3INCmtlcm5lbC9raGVhZGVyc19kYXRhLnRhci54ei4gZ2VuX2toZWFkZXJz
LnNoIHJlY29yZHMgaXRzIHNvdXJjZS1saXN0DQplbnRyaWVzIHdpdGggYSBsZWFkaW5nICIu
LyIuIE9uIHRoZSBuZXh0IGJ1aWxkLCBNYWtlIHJlcG9ydHMgdGhvc2UNCnByZXJlcXVpc2l0
ZXMgaW4gJF4gd2l0aG91dCB0aGUgbGVhZGluZyAiLi8iLCBzbyB0aGUgZXhpc3RpbmcgZmls
dGVyDQpmYWlscyB0byByZW1vdmUgdGhlbSBmcm9tIGNtZC1wcmVyZXFzLg0KDQpXaXRoIENP
TkZJR19JS0hFQURFUlM9eSwgYSBmb3JjZWQgaW5jcmVtZW50YWwgYnVpbGQgZXhwYW5kcyBt
b3JlIHRoYW4NCjcwMDAgcGF0aHMgaW50byBtYWtlX3ByZXJlcXMuIFRoZSByZXN1bHRpbmcg
c2hlbGwgY29tbWFuZCBleGNlZWRzIHRoZQ0KbWF4aW11bSBhcmd1bWVudCBzaXplIGFuZCBm
YWlscyB3aXRoICJBcmd1bWVudCBsaXN0IHRvbyBsb25nIi4NCg0KVG8gZml4IHRoaXMgdGhl
IHByZWZpeCAiLi8iIHNob3VsZCBiZSByZW1vdmVkIGJlZm9yZSBjb21wYXJpbmcNCnByZXZp
b3VzIGRlcHNfIHdpdGggcmVhbC1wcmVyZXFzLiBJIHdpbGwgYWRkIHRoaXMgbm9ybWFsaXph
dGlvbiBpbiB2NjoNCg0KY21kLXByZXJlcXMgPSAkKGNhbGwgZXNjc3EsIFwNCgkkKGZpbHRl
ci1vdXQgJChwYXRzdWJzdCAuLyUsJSwkKGRlcHNfJEApKSwgJChyZWFsLXByZXJlcXMpKSkN
Cg0KLS0gDQpMdWlzIEF1Z2Vuc3RlaW4gKiBsdWlzLmF1Z2Vuc3RlaW5AdG5ndGVjaC5jb20g
KiArNDkxNTIyNTI3NTc2MQ0KVE5HIFRlY2hub2xvZ3kgQ29uc3VsdGluZyBHbWJILCBCZXRh
LVN0ci4gMTMsIDg1Nzc0IFVudGVyZsO2aHJpbmcNCkdlc2Now6RmdHNmw7xocmVyOiBEci4g
Um9iZXJ0IERhaGxrZSwgVGhvbWFzIEVuZHJlcywgTW9yaXR6IFByaW56DQpBdWZzaWNodHNy
YXRzdm9yc2l0emVuZGVyOiBIZW5yaWsgS2xhZ2dlcw0KU2l0ejogVW50ZXJmw7ZocmluZyAq
IFJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQgTcO8bmNoZW4gKiANCkhhbmRlbHNyZWdp
c3Rlcm51bW1lcjogSFJCIDEzNTA4Mg0KDQo=

--------------C5RD8l2JFHi00i5rpxJzfEfw--

--------------ifMQBf5U1i40GslSf02eGMt5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmr8swcFAwAAAAAACgkQeVyKys3c+zSn
1A//U9t4M3B5f67cBXIo6aL8Ls7YKBx6z6L/Dz6FY5/X8r5xxyZu1FFARL8n4ttNW6pF6Ak+0SIl
+bwcz0nSHvprk+OYv6Xi5Te1yaMu4+93jA7qhjRruh0dE7Rc8oGHS86Sn7TNmGjudNlgXoie4dSl
BEhgXHIBjRUTYEV/E+Fjvsu+Tvpb742HxN2fNoozdtpVdTWCVkohtgjYKqEgfPtLCjld1zwSqoTd
wYzNe7UEzmZkZzXjHvgdOCyQEaPgFv4zWkiolnI/9jCY4E2kkR4u1WQT6cvmzr5Dntsn5dSfwrGn
EYwFQpQ/AExAXziqC9k8/MP2Is0UJxhXNilXKIJDmyqLk7Y9Uv4eBtMjAF84hDG18FaGTCZbk4k8
U3T+Mpo0aXe3J0MsTuOZ9zXZzFvz5nMNKOeZKMJVQLdaZfncxj/icC6UqAhvhVpE1sCqmBNCb2WB
Tpsjs0/xgKT55cFM9PUmEfyP8fxadpF/eLSypwVpKO5yY1+hHSmrknxE6nHHQk5EKu1wSvYIoh9r
QI2p2iS6Y3NIhxCvbMC3tvBOd3DGBitdgvhzL36bYh+XKrsl+1s2SHsj/o9LOuwZGC0+Wl/14F9O
yno6k7J9x48p29tXjD4vaII8Jy4ZJD//sQ0140ltWGImOUhr2kFhZo2GcNPpHoUjXc0V+GhJnUtq
ll8=
=fzPu
-----END PGP SIGNATURE-----

--------------ifMQBf5U1i40GslSf02eGMt5--
