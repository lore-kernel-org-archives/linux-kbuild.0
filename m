Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146703;
	b=eXZhUpiDfU8J1NQBlDrAWFagN+mcCzoz6SbO8fwICzt9BaKiMkLePVgokupj76QQuaNO
	 Icvu+fvvxtHn49D2kfeLBLL3Mlzg4inv3jNtZdlDvw60aLhbV7WrfK25v1z2210k3YxUW
	 CR0ki59pazXlRp0TpqCrheAKQFWVZqbSQKkAxSYdiRIC3BBLS36GZzjDCzfcIrg8VuXGB
	 1aa3p3OSaTYx5Vt+ctDRamfX2AM2jwzhFNpcquPjalJhdk/dpo4zFGa+EKzJE1MDnctfn
	 y2VDucyL253zc07KukmYgZbJUv9/J2DR4neMNtKCdiJRuKya/wz80TVeCw/eGnwviKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146703;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type;
	bh=O1yPpaG//o3w1Zj+0G4s/uyW1TqEYcGXoDtfvB+hwTY=;
	b=fXrzLYYfIhi1/EEXLyzM/MLZ7lid2d0vfwTz/jlHDxapucBW+0bhizP30tZDVNa74Njw
	 T30PnHOvhA8XJZSYcEk1IH97HD11IBvCYqt4z2pwU5xAxSwSl0v6iVW6A28MUVT+yZkaH
	 SzXMc2PEYI6m5b1p9m4M4t3N9m+KnsU48mDOfpcVhgpLsq53KBNHbOGbSi6M5PPqwBove
	 Z+uxDq/FcXZnSXYn7cE63kQSSpxFv1/C2SJHxvjfGA87RRrMSWLH4TqGDlSIwbh+N6zl9
	 fr/fdlGgsAe4EuM9Dfg1AYjC0+vHk0B9fa6risL1fmQxtTUbT+lIz/i9zysd3b0gkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Is7jQ7OJ;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F43606A31C
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Nov 2026 14:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Is7jQ7OJ
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 5B9AF4028E;
	Sun,  8 Nov 2026 15:04:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 4601B1FBC81;
	Sun,  8 Nov 2026 15:04:55 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BYfLtnquX5a4; Sun,  8 Nov 2026 15:04:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 75D3E1FBCCB;
	Sun,  8 Nov 2026 15:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 75D3E1FBCCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1794146694;
	bh=O1yPpaG//o3w1Zj+0G4s/uyW1TqEYcGXoDtfvB+hwTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Is7jQ7OJicV1w8gg1N7NxEyEUVsFF8VJd+eVjz+C3Ac9gP0H/1pr90pI9G0oPlau9
	 WaSXZoP/SuRyR8HNTXrSmnHD1rFZVChF3LG76EQMH1rIsf5f/GKQTo/zzZ1bpwk92F
	 3/AjZHh9ZzsmkF07DIFQ7X6zTs/phmJ9jRWvQp3rgDOGGrMGwrFoPjaaMROs20yc30
	 39OY7zBAh7HhDaSUIcklyKhnIJ1ke2Dh7bgMW6HDyFD9Qbc2BsJBtSvsYgPEWno7mh
	 MIzLyierd6kcIRWqXIidAn0ieUE7MaeeAgoRi1kVkmnvNJcNp1xX46LFF/UE7mZrrG
	 plwKqGaIkEWGg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 6B-mur2QaVSs; Sun,  8 Nov 2026 15:04:54 +0100 (CET)
Received: from [192.168.0.168] (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 24AAA1F8B44;
	Sun,  8 Nov 2026 15:04:54 +0100 (CET)
Message-ID: <576e1f86-1d8b-4b15-b0fb-cf8c66cb62c8@tngtech.com>
Date: Sun, 8 Nov 2026 15:04:53 +0100
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
Subject: Re: Tools using the generated kernel SBOM as input
To: Andre Wagner <wagnerandre85@aol.de>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: "maximilian.huber@tngtech.com" <maximilian.huber@tngtech.com>
References: <1313907070.258672.1793951761777.ref@mail.yahoo.com>
 <1313907070.258672.1793951761777@mail.yahoo.com>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <1313907070.258672.1793951761777@mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8ZBwA0uontJFtJaUHJBghlEK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8ZBwA0uontJFtJaUHJBghlEK
Content-Type: multipart/mixed; boundary="------------4XWnWk00xlZQIw7kRWIbHMPR";
 protected-headers="v1"; hp="clear"
Message-ID: <576e1f86-1d8b-4b15-b0fb-cf8c66cb62c8@tngtech.com>
Date: Sun, 8 Nov 2026 15:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Tools using the generated kernel SBOM as input
To: Andre Wagner <wagnerandre85@aol.de>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: "maximilian.huber@tngtech.com" <maximilian.huber@tngtech.com>
References: <1313907070.258672.1793951761777.ref@mail.yahoo.com>
 <1313907070.258672.1793951761777@mail.yahoo.com>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <1313907070.258672.1793951761777@mail.yahoo.com>

--------------4XWnWk00xlZQIw7kRWIbHMPR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxMS82LzI2IDA4OjU2LCBBbmRyZSBXYWduZXIgd3JvdGU6DQo+IEhlbGxvIEBhbGws
DQo+IE1heSBJIGFzayB3aGljaCB0b29scyB5b3UgdXNlIGZvciBjb25zdW1pbmcgdGhlIGdl
bmVyYXRlZCBrZXJuZWwgU0JPTT8NCj4gR3JlZXRpbmdzLA0KPiBBbmRyw6kNCg0KSGkgQW5k
csOpLA0KDQpUaGUga2VybmVsIFNCT00gZG9jdW1lbnRzIGFyZSBTUERYIDMuMC4xIEpTT04t
TEQsIHNvIGFueSB0b29saW5nIHRoYXQgDQpzdXBwb3J0cyBTUERYIDMgc2hvdWxkIGJlIGFi
bGUgdG8gd29yayB3aXRoIHRoZW0uDQoNCkZvciBleGFtcGxlLCBJJ3ZlIHVzZWQgdGhlIG9m
ZmljaWFsIFNQRFggSmF2YSB0b29scyBbMV0gdG8gdmVyaWZ5IHRoZSANCnZhbGlkaXR5IG9m
IHRoZSBkb2N1bWVudHMuIE5vdGUsIGhvd2V2ZXIsIHRoYXQgdGhlIEphdmEgdG9vbHMgY3Vy
cmVudGx5IA0KZG8gbm90IHN1cHBvcnQgdGhlIGN1c3RvbSBKU09OLUxEIGNvbnRleHRzIHVz
ZWQgYnkgdGhlIGtlcm5lbCBTQk9NIA0KZG9jdW1lbnRzLiBUaGVzZSBjb250ZXh0cyBtdXN0
IGZpcnN0IGJlIGV4cGFuZGVkIG1hbnVhbGx5LiBNb3JlIA0KaW5mb3JtYXRpb24gb24gdGhp
cyBpbiB0aGUgZG9jdW1lbnRhdGlvbiBbMl0uDQoNCkFub3RoZXIgdXNlZnVsIHRvb2wgSSd2
ZSBjb21lIGFjcm9zcyBpcyBzcGR4M192aXogWzNdLiBJdCBhbGxvd3MgeW91IHRvIA0KdXBs
b2FkIGFsbCB0aHJlZSBrZXJuZWwgU0JPTSBkb2N1bWVudHMgKHNvdXJjZSwgYnVpbGQsIGFu
ZCBvdXRwdXQpIA0KdG9nZXRoZXIgYW5kIGludGVyYWN0aXZlbHkgZXhwbG9yZSB0aGUgZGlz
Y292ZXJlZCBsaWNlbnNlcyBhbmQgdGhlIGZpbGVzIA0KdGhleSBhcmUgYXNzaWduZWQgdG8u
DQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vc3BkeC90b29scy1qYXZhDQpbMl0gaHR0cHM6
Ly9kb2NzLmtlcm5lbC5vcmcvdG9vbHMvc2JvbS9zYm9tLmh0bWwjb3V0cHV0LWZvcm1hdA0K
WzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9rYXJ0YmVuL3NwZHgzX3Zpeg0KDQpCZXN0LA0KTHVp
cw0KDQotLSANCkx1aXMgQXVnZW5zdGVpbiAqIGx1aXMuYXVnZW5zdGVpbkB0bmd0ZWNoLmNv
bSAqICs0OTE1MjI1Mjc1NzYxDQpUTkcgVGVjaG5vbG9neSBDb25zdWx0aW5nIEdtYkgsIEJl
dGEtU3RyLiAxMywgODU3NzQgVW50ZXJmw7ZocmluZw0KR2VzY2jDpGZ0c2bDvGhyZXI6IERy
LiBSb2JlcnQgRGFobGtlLCBUaG9tYXMgRW5kcmVzLCBNb3JpdHogUHJpbnoNCkF1ZnNpY2h0
c3JhdHN2b3JzaXR6ZW5kZXI6IEhlbnJpayBLbGFnZ2VzDQpTaXR6OiBVbnRlcmbDtmhyaW5n
ICogUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBNw7xuY2hlbiAqIA0KSGFuZGVsc3Jl
Z2lzdGVybnVtbWVyOiBIUkIgMTM1MDgyDQoNCg==

--------------4XWnWk00xlZQIw7kRWIbHMPR--

--------------8ZBwA0uontJFtJaUHJBghlEK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmrwgYUFAwAAAAAACgkQeVyKys3c+zQS
iw/9GkLCqziUZZiz3UI1WqYAEFbko7floWpOxIAsPzRnhWkqyq7jMGYqw4VqfISYhnJVym17Kx7F
+1Jqg8k8kkSZP5YUl/Eis5Wq4okiMVWso0bszihxDd/NifshjdTpwmck9qWVoG+IHm0DeV5/EG0b
FmHr/V7qiqeoWlQJm2gxUKjC+NFhA/x6tg8bd/B8IjVWuoi6EOFZECkj8y8yHMSFYnddlHS5BmUr
mT9hpDvyzBVxmpcaYqng2r63HzGuiiQctP2ANmfNhrd/eWZKWkjTSE6msvalc9/4HCJr+GDt0h0Z
afxRh4k4FapGc1vgc8wlq/ZnoP++Sxm4vWmx3IsfADrPFthZvBRQ3noAJLsJ+tP06RkLbKbI2Iz6
N7yq8ejMJIpKOjc2DZI1+ahGH7brAwbsvcNu0YuAKyWWud4QpRxWhOwE77vgT5NgwMznq4yVt6dX
BZLDrp+EjtTmKqYNIiquTBs8AOmfwHU4sGTbX06vIhGjDyn21dOc7qVrr08DmCOuj2eHp/BgsrRW
hi85e0qQiDK7mOT0o2bhHdCPQDkRz3H7LcHxx9bv+Yyy8Nd/5xLmEu1cmaIpQlzuVI4qgAtalQnR
IIpLNlHU4mLxNJ00Gjf6U7XD4HhFZW4Ne4ffDtchCmlv/Rh7wqlZJyTVC6DbQUN+KWjd3Y3b5Zeq
2ys=
=RL2W
-----END PGP SIGNATURE-----

--------------8ZBwA0uontJFtJaUHJBghlEK--
