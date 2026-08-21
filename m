Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983827E05F;
	Fri, 21 Aug 2026 20:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787342585; cv=none; b=cZmdS2CWXic12l0DqiXJRVAZCNJf5NbPIjp8yvyQzfWaux5iU2JqhwlBksypBM1nHbus3BOJV1jvcYoesZTBiuTezvmer2tbNw+/zot/D6vmapXXo4EtDtKo7kjrflFKGSFW1bkpY5k3FJlU9FH0Lk1OVfmxrCxNW07YUzZRMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787342585; c=relaxed/simple;
	bh=QgsCFOPV848DrsDRQrHVqnjvJ81OfZ00NJ4p83zd5/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XizxXKJt5RAvmfuJaSvGTwDM3xAu5LDGAPb2ae/wckK2Y8pVZz6mLA74MrYCjo5y7k+pTOhhvg+YFMg6RfOc8OjBeF2v5nr3F9PQB0NCAaXlUlKfiAE48bK88C0j6GRfki3djjYcFrhdwEYJjf0vG8Q9u/rCO9+sZGV+YTwIOgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=cdwD7YmO; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="cdwD7YmO"
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 2F3E6200F8;
	Fri, 21 Aug 2026 21:57:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id DA6B11FB935;
	Fri, 21 Aug 2026 21:57:05 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id P75qpVlS-AvR; Fri, 21 Aug 2026 21:57:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 0AAA71FB93A;
	Fri, 21 Aug 2026 21:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 0AAA71FB93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1787342225;
	bh=QgsCFOPV848DrsDRQrHVqnjvJ81OfZ00NJ4p83zd5/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cdwD7YmOZ8vq89i+a8Eau6hNaKo8v9tB0e3AfU9/wO3Vgi3lWNCMCUzh5WdEzAzDa
	 0nO6UU2deQkmtE9OeTVV/GqyEKswnapB2mc9iCwMCymdy+Kt1LxjUPDTc0zYjuDtMj
	 p0y4l59QOIQiVXH/yxalKOTs7L4qF5WRRk8b4AktF5UMY3If/iv8qlfL/SBDFscBbE
	 tK+6yS0TNIX/UP4mX5aeekY+tYgJnAfb7EyNkkmXUvFy6AUN1vHPYvKgxoxtelywso
	 4nmFH+hdIO2oQFovW6CV8abvZSyNvMBpa1Fj4g+Lx1ddP3BjoDMPij9bTQUhyyXS7Z
	 FtC7SSQEToL8w==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id K2G07sjMYQkn; Fri, 21 Aug 2026 21:57:04 +0200 (CEST)
Received: from [192.168.0.168] (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 88AE11FB81C;
	Fri, 21 Aug 2026 21:57:04 +0200 (CEST)
Message-ID: <1efb52b4-1a78-4c4e-aea1-6c8b426a8538@tngtech.com>
Date: Fri, 21 Aug 2026 21:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] kbuild: record real-prereqs in .cmd files
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20260814112134.832243-1-luis.augenstein@tngtech.com>
 <20260814112134.832243-2-luis.augenstein@tngtech.com>
 <178708267641.2113250.8208366109143651745.b4-review@b4>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <178708267641.2113250.8208366109143651745.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SrUB2J0yT5es5hJ868MIwJON"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SrUB2J0yT5es5hJ868MIwJON
Content-Type: multipart/mixed; boundary="------------HYsO4irwa1yoYMK7NqVCYonX";
 protected-headers="v1"; hp="clear"
Message-ID: <1efb52b4-1a78-4c4e-aea1-6c8b426a8538@tngtech.com>
Date: Fri, 21 Aug 2026 21:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] kbuild: record real-prereqs in .cmd files
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20260814112134.832243-1-luis.augenstein@tngtech.com>
 <20260814112134.832243-2-luis.augenstein@tngtech.com>
 <178708267641.2113250.8208366109143651745.b4-review@b4>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <178708267641.2113250.8208366109143651745.b4-review@b4>

--------------HYsO4irwa1yoYMK7NqVCYonX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDgvMTgvMjYgMjE6NTEsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOg0KPiBTYXNo
aWtvIGhhcyBhIGNvbW1lbnQgdGhhdCB0aGlzIHByb2R1Y2VzIGRpZmZlcmVudCByZXN1bHRz
IGJhc2VkIG9uIGENCj4gY2xlYW4gdmVyc3VzIGluY3JlbWVudGFsIGJ1aWxkOg0KPiANCj4g
ICAgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzU5MDMyDQo+IA0KPiBJIGNhbiBy
ZXByb2R1Y2UgdGhpcyB3aXRoOg0KPiANCj4gICAgJCBtYWtlIC1za2oiJChucHJvYykiIEFS
Q0g9eDg2XzY0IG1ycHJvcGVyIGRlZmNvbmZpZyBsaWIvb2lkX3JlZ2lzdHJ5Lm8NCj4gDQo+
ICAgICQgZ3JlcCAtbiBvaWRfcmVnaXN0cnlfZGF0YSBsaWIvLm9pZF9yZWdpc3RyeS5vLmNt
ZA0KPiAgICAzOm1ha2VfcHJlcmVxc19saWIvb2lkX3JlZ2lzdHJ5Lm8gOj0gbGliL29pZF9y
ZWdpc3RyeS5jIGxpYi9vaWRfcmVnaXN0cnlfZGF0YS5jDQo+ICAgIDExMTE6ICBsaWIvb2lk
X3JlZ2lzdHJ5X2RhdGEuYyBcDQo+IA0KPiAgICAkIHRvdWNoIGxpYi9vaWRfcmVnaXN0cnku
Yw0KPiANCj4gICAgJCBtYWtlIC1za2oiJChucHJvYykiIEFSQ0g9eDg2XzY0IGxpYi9vaWRf
cmVnaXN0cnkubw0KPiANCj4gICAgJCBncmVwIC1uIG9pZF9yZWdpc3RyeV9kYXRhIGxpYi8u
b2lkX3JlZ2lzdHJ5Lm8uY21kDQo+ICAgIDExMTE6ICBsaWIvb2lkX3JlZ2lzdHJ5X2RhdGEu
YyBcDQo+IA0KPiBBcyB0aGlzIGlzIGp1c3QgbWV0YWRhdGEgZm9yIGV4dGVybmFsIHRvb2xz
IChpLmUuLCBpdCBkb2VzIG5vdCBnZXQNCj4gY29uc3VtZWQgYnkgS2J1aWxkIGFnYWluKSwg
d2UgY291bGQganVzdCByZXF1aXJlIHRoZW0gdG8gZmlsdGVyDQo+IGR1cGxpY2F0ZXMgYWZ0
ZXIgdGhlIGZhY3Q/DQoNClRydWUsIHNvbWUgTWFrZSBwcmVyZXF1aXNpdGVzIGFsc28gYXBw
ZWFyIGluIGRlcHNfKiwgc28gdGhlIGZpbHRlcg0KZHJvcHBlZCB0aGVtIGZyb20gbWFrZV9w
cmVyZXFzXyogb24gaW5jcmVtZW50YWwgYnVpbGRzLg0KDQpIb3dldmVyLCB3ZSBjYW5ub3Qg
anVzdCByZW1vdmUgdGhlIGZpbHRlci4gQWZ0ZXIgdGhlIC5jbWQgaXMgaW5jbHVkZWQsDQok
KHJlYWwtcHJlcmVxcykgY29udGFpbnMgJChkZXBzXyRAKSwgc28gdGhlIHdob2xlIGRlcHNf
KiBsaXN0IHdvdWxkDQpzaG93IHVwIGluIG1ha2VfcHJlcmVxc18qIG9uIGEgcmVidWlsZC4N
Cg0KV2UgY291bGQgbW92ZSB0aGUgZmlsdGVyIGludG8gZml4ZGVwIGFuZCBmaWx0ZXIgYmFz
ZWQgb24gdGhlIG5ldyAuZCANCmZpbGUsIHNvIHRoZSBvdmVybGFwIGlzIHJlbW92ZWQgYWxy
ZWFkeSBvbiBhIGNsZWFuIGJ1aWxkLg0KDQp0aGFua3MsDQpMdWlzDQoNCi0tIA0KTHVpcyBB
dWdlbnN0ZWluICogbHVpcy5hdWdlbnN0ZWluQHRuZ3RlY2guY29tICogKzQ5MTUyMjUyNzU3
NjENClRORyBUZWNobm9sb2d5IENvbnN1bHRpbmcgR21iSCwgQmV0YS1TdHIuIDEzLCA4NTc3
NCBVbnRlcmbDtmhyaW5nDQpHZXNjaMOkZnRzZsO8aHJlcjogRHIuIFJvYmVydCBEYWhsa2Us
IFRob21hcyBFbmRyZXMsIE1vcml0eiBQcmlueg0KQXVmc2ljaHRzcmF0c3ZvcnNpdHplbmRl
cjogSGVucmlrIEtsYWdnZXMNClNpdHo6IFVudGVyZsO2aHJpbmcgKiBSZWdpc3Rlcmdlcmlj
aHQ6IEFtdHNnZXJpY2h0IE3DvG5jaGVuICogDQpIYW5kZWxzcmVnaXN0ZXJudW1tZXI6IEhS
QiAxMzUwODINCg0K

--------------HYsO4irwa1yoYMK7NqVCYonX--

--------------SrUB2J0yT5es5hJ868MIwJON
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmqIrZAFAwAAAAAACgkQeVyKys3c+zRU
wQ//eRmJmx6FFIR1X5Jzk7NRLIJJ5wtWB2tNdXKZCKc/MesEHKluw0dN1XK1iFFxMGAwSXBbpKE0
+eX6tUJrkQUgGAHClZgGOLWCO98EGofh/aQ/3RFqcSohbmjClMAEezmLagTswyL0PhI6BtoZuHSE
oxGMy8L+N12ZiEaUn3bLLw1TWuSwCc4F6mX9jFEBxfAChbCk29Slc+att5HSz/JLh7iTOuUP4eZ6
6mFNe3h7zbojTNzPQaxSi9Q8JGnbw9Ad6X7CKdR18YOCC5rLNeRb1VDUoZU7ecbfJm+GG+hDG4Et
d5cmuQXommdDw86FtIrVX7ULHkdrUDmZcNKYHOQpjof7lpjE6CZ5iHoLL/sGRnBbSCcvYNFsVn2J
vRgHO46OzAy7d9DTkEbhvrH82hENBdAgPWAStp/CiM0dw72t+fwdiKemb3ohwnBeWUR+tGtg15US
uO9MY5AizeCbxxFsTOlYJWNkymJantKv7QnuoP5QUOJAnWbEzRHMDvaxsvWp90raCFwU4CslJyRA
Sthtq7YV/96iISLGKSUks5dD38ScU5gfs5j98aNuqcOnXprB+xHQrBrot+VyQcky0D0/cfiwdXyd
GUGwqfHS6vuviy7fEKbiCYKV2L44EhYge1QXWRyVZzNWSZrVvpYmGZ5nS2VJer2SGL5HJ8C/o8CS
PAo=
=/QL+
-----END PGP SIGNATURE-----

--------------SrUB2J0yT5es5hJ868MIwJON--
