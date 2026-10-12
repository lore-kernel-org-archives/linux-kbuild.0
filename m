Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B33B1014;
	Mon, 12 Oct 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841279; cv=none; b=FuzTKsQsKLvXVHXxBKDiE/O8DLvUenaBFiTtvPhOnpcT8PWB6VpPRC+gwvRwSpnIpVu7NtRx+5EDJcMIBgTMN0L76lNzxm4p7UKef6i1UEQnYs/jiJbBdk5GiQ+qI+b2BJR4qRQ0KiX/hsJgkNUFZOJ9jZLKGr70WVwsi94Tl1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841279; c=relaxed/simple;
	bh=x4JGecdDsF/yRefqyD8CcjqO9XsCf73PS5Mec3hJkkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYFPir4glPEBzinfvefRzF/DsHLKFA2iuXmfLqsd9xwO/824Y5sX99hbo8WcDL9UgqNiwAEbhEr89ukXHSR4m4+DtBLUJWJpeWIrIs0oh53Yef240eF++tIqZR8w5a6u3OS+kTEEm+JGgQGOH/We7ZiyeNJI+M9GNAbdrSi3+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=I0FnHLBJ; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="I0FnHLBJ"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 4A60640882;
	Mon, 12 Oct 2026 23:33:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 2AFF91F8B42;
	Mon, 12 Oct 2026 23:33:15 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id UxWMxzcWZyv4; Mon, 12 Oct 2026 23:33:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 925111F8B81;
	Mon, 12 Oct 2026 23:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 925111F8B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840794;
	bh=x4JGecdDsF/yRefqyD8CcjqO9XsCf73PS5Mec3hJkkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=I0FnHLBJggEn6rM8SEnLP8RUK39kFmY7SNcpxYiqFYZ69qvsaaGXhu/srQEncMdE/
	 44+KUHjrdhfdC6/GQ5NhRqMdEPwuzheYjsR4EKK6rT6n0n0vW7pQ3pyBQFN3q9VGKB
	 Cy+r/P/CW0gynSgzxar9ZG5H7imd33cLOjhDpXyu02tc6mtrd8Y9L1xJK1UE0fsWMd
	 zY1TXxl8jWrBCqjyEnkv4pUHjdHoPd0ILwvxgQdtP0h3aY8C/e5S8Mo2QNheu+FZT/
	 x1CTnOGmBwqsY8Hgl+N/Wn93khR7hIfApdYzx7KqDs82CRBk6D6LhwluKLrdHmesQi
	 nxCnNkJ1OorNA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id UBzVyURaKXBP; Mon, 12 Oct 2026 23:33:14 +0200 (CEST)
Received: from [192.168.0.168] (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 037781F8B42;
	Mon, 12 Oct 2026 23:33:13 +0200 (CEST)
Message-ID: <0e867541-15f9-49e6-8753-3a9e2f2f0e55@tngtech.com>
Date: Mon, 12 Oct 2026 23:33:13 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] kbuild: record real-prereqs in .cmd files
To: Nicolas Schier <nsc@kernel.org>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20260828085441.156386-1-luis.augenstein@tngtech.com>
 <20260828085441.156386-2-luis.augenstein@tngtech.com>
 <179138436214.145576.15291381959921627967.b4-review@b4>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <179138436214.145576.15291381959921627967.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WUDau7rggS0wnMLuJQoepf6r"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WUDau7rggS0wnMLuJQoepf6r
Content-Type: multipart/mixed; boundary="------------ujhBl5tJLzD6ko0SoR8CmkWF";
 protected-headers="v1"; hp="clear"
Message-ID: <0e867541-15f9-49e6-8753-3a9e2f2f0e55@tngtech.com>
Date: Mon, 12 Oct 2026 23:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] kbuild: record real-prereqs in .cmd files
To: Nicolas Schier <nsc@kernel.org>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20260828085441.156386-1-luis.augenstein@tngtech.com>
 <20260828085441.156386-2-luis.augenstein@tngtech.com>
 <179138436214.145576.15291381959921627967.b4-review@b4>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <179138436214.145576.15291381959921627967.b4-review@b4>

--------------ujhBl5tJLzD6ko0SoR8CmkWF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvNy8yNiAxNjo0NiwgTmljb2xhcyBTY2hpZXIgd3JvdGU6DQo+PiBSZWNvcmQgJChy
ZWFsLXByZXJlcXMpLCB0aGUgbm9uLXBob255IHByZXJlcXVpc2l0ZXMgb2YgdGhlIHRhcmdl
dCwgaW4gYQ0KPj4gbmV3IG1ldGFkYXRhIGZpZWxkOg0KPj4NCj4+ICAgICAgbWFrZV9wcmVy
ZXFzXzx0YXJnZXQ+IDo9IDxwcmVyZXF1aXNpdGVzPg0KPj4NCj4+IFdyaXRlIHRoZSBmaWVs
ZCBmcm9tIGJvdGggY21kX2FuZF9zYXZlY21kIGFuZCBjbWRfYW5kX2ZpeGRlcC4NCj4+DQo+
PiBVcGRhdGUgc2NyaXB0cy9tYWtlX2ZpdC5weSB0byByZWFkIG9ubHkgc2F2ZWRjbWRfKiBp
bnN0ZWFkIG9mIHBhcnNpbmcgdGhlDQo+PiBjb21wbGV0ZSAuY21kIGZpbGUuDQo+IA0KPiBU
aGlzIHNvdW5kcyBsaWtlIGEgZ29vZCB0aGluZzsgYnV0IEkgY2FuJ3QgZmluZCB0aGF0IGlu
IHRoZSBkaWZmLg0KDQpJdCdzIHRoZSBmaXJzdCBzZWN0aW9uIGluIHRoZSBkaWZmIGluIHNj
cmlwdHMvS2J1aWxkLmluY2x1ZGUuDQpUaGUgb3JpZ2luYWwgc2VudGVuY2UgbWlnaHQgaGF2
ZSBiZWVuIGEgYml0IHVuY2xlYXIgdGhvdWdoLg0KJChjbWQtcHJlcmVxcykgaXMgdGhlIG5l
dyB2YXJpYWJsZSB0aGF0IGlzIGFjdHVhbGx5IHVzZWQgYnkNCmNtZF9hbmRfc2F2ZWNtZCBh
bmQgY21kX2FuZF9maXhkZXAuIEhvd2V2ZXIsIHNpbmNlICQoY21kLXByZXJlcXMpIGlzDQpq
dXN0ICQocmVhbC1wcmVyZXFzKSB3aXRoICQoZGVwc18pIGZpbHRlcmVkIG91dCwgSSBvbWl0
dGVkIHRoaXMNCmludGVybWVkaWF0ZSBzdGVwIGluIHRoZSBkZXNjcmlwdGlvbi4gSSB3aWxs
IHJlcGhyYXNlIGl0IGluIHYzIHRvIG1ha2UNCml0IG1vcmUgY2xlYXIuDQoNCj4gV2h5IGRv
IHlvdSBkZWZlciB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uIGluIHRoZSBTQk9NIHNjcmlw
dHM/ICBGcm9tIG15DQo+IHBvaW50IG9mIHZpZXcsIHRoZSBpbnRyb2R1Y3Rpb24gb2YgJ21h
a2VfcHJlcmVxc188dGFyZ2V0PicgbG9va3MgZ29vZA0KPiBhbmQgSSBkb24ndCBzZWUgYSBy
ZWFzb24gZm9yIHdhaXRpbmcgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBTQk9NDQo+IGltcGxl
bWVudGF0aW9uLg0KDQpJIHRob3VnaHQgaXQgd291bGQgYmUgYSBzZW5zaWJsZSBib3VuZGFy
eSB0byBmaXJzdCBjaGFuZ2UgS2J1aWxkIGFuZA0KdGhlbiBzZXBhcmF0ZWx5IHVwZGF0ZSB0
aGUgU0JPTSB0b29sIHRvIHVzZSB0aGUgbmV3IGluZm9ybWF0aW9uIHRoZQ0KLmNtZCBmaWxl
cyBvZmZlci4gQWxzbywgd2hlbiBJIHBvc3RlZCB0aGlzIHNlcmllcywgSSBzaW1wbHkgZGlk
bid0DQpoYXZlIHRoZSBTQk9NIHBhdGNoZXMgZmluaXNoZWQgeWV0LiBCeSBub3cgdGhleSBh
cmUgcmVhZHkgZm9yIHJldmlldw0KYXMgd2VsbCwgc28gSSB3aWxsIGluY2x1ZGUgdGhlbSBp
biB2MyBvZiB0aGlzIHNlcmllcy4NCg0KdGhhbmtzLCBMdWlzDQoNCi0tIA0KTHVpcyBBdWdl
bnN0ZWluICogbHVpcy5hdWdlbnN0ZWluQHRuZ3RlY2guY29tICogKzQ5MTUyMjUyNzU3NjEN
ClRORyBUZWNobm9sb2d5IENvbnN1bHRpbmcgR21iSCwgQmV0YS1TdHIuIDEzLCA4NTc3NCBV
bnRlcmbDtmhyaW5nDQpHZXNjaMOkZnRzZsO8aHJlcjogRHIuIFJvYmVydCBEYWhsa2UsIFRo
b21hcyBFbmRyZXMsIE1vcml0eiBQcmlueg0KQXVmc2ljaHRzcmF0c3ZvcnNpdHplbmRlcjog
SGVucmlrIEtsYWdnZXMNClNpdHo6IFVudGVyZsO2aHJpbmcgKiBSZWdpc3RlcmdlcmljaHQ6
IEFtdHNnZXJpY2h0IE3DvG5jaGVuICogDQpIYW5kZWxzcmVnaXN0ZXJudW1tZXI6IEhSQiAx
MzUwODINCg0K

--------------ujhBl5tJLzD6ko0SoR8CmkWF--

--------------WUDau7rggS0wnMLuJQoepf6r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmrNUhkFAwAAAAAACgkQeVyKys3c+zSy
9Q/9E35JMTXA0xqvYt8X5/r+aU900h180UCOQpPHw+YG0QiVRxgwOd8VYjE8uAmnTo3H7D+76/1j
XCWZ3POn1fIebB+IRaSYrv0gFAlErHhHZlx0qdKH7XuhoWJLSMAz+F4mAd/U4BgaSRoCxw9dId9d
12fjWghP7Tn/MpP2CtuC977/Twgitg/A/aURMy5kzzYjFwX9DzJXNM94mXy5mwNr6p+uf20aOWT+
bMMgd/IoMXi6K5zm0UgQ6Hs8UNunN+E8tFKXUGj9EykSkBxjzb7qaMrlcaZZoZSAtHIPCZT1avNd
+JbljSMXIKlriFwUIDnYzUZedZ/1wJ49A2EdROlk9UR4knQzK89mgSTOqpMZVceI/FzwLpX7BE3C
PORyJBqYoYi6UI1WB/aYnPFIvGpU9STHQZIiFUVmiz5F4d38b0+xSnDBhoNeqP+jEc0/QMZX9zzf
w2woicCX5g0yO4E35r9o5nTYhpy6hIg+/SDeeCtfh3JwY/uhQ7GE6pbnNryDQCy6wDiMaAWDMma0
cTrOVQnIpeX4uC6Gn2F2ZZfR0Cnd3Yfdt3DUvswlaPxKTBP0qtSBVmSPmsCFIL8QGMEJFNb8JJFI
BS7YeN2rcEWnA6oceVT9UDKdD3cXL7VO0uAagdBjiokDbvifZBmE0GSo4AF4CQGHCx7iFhc0dA4Z
mas=
=s3fU
-----END PGP SIGNATURE-----

--------------WUDau7rggS0wnMLuJQoepf6r--
