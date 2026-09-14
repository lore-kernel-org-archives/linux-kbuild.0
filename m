Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37A374E5A;
	Mon, 14 Sep 2026 06:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365996; cv=pass; b=CrEA4HOwFr+V48IKa/VYCLvXXEY6ryLaKKwvGVMv0oTBJxBbljD9tfJBX4F0L0NPdtwxgHHw2LKwohnN5YZimo6r1VLSIgweotwApaPgt50q2dVK6s7TRHJvCicBiuwKBwDSm6x7NKE+oO7+Vh0eHkTUY3g69zWCwIH0Ch5gsDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365996; c=relaxed/simple;
	bh=VsEnd7DKvZ7xYeAftb3uMHqznzj8YJ3yeKX8HBHIHW8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ad529XSdtjD0/0h7uCk8vlF2kzrmpz/xX36Q0n4wIiugbwG/RGP8CnGbqfrskq3xLi+/0latFay6KebzjLBHPnA9QV9X1zLp373yM37Rq1Vt2HN+smcdt5THK/NXFMdFIiDz/shmadUK4eZc8VdmJZtw8ipOZY+lJWUTImepjgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=B0WZ85WD; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=JyncruHr; arc=pass smtp.client-ip=81.169.146.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="B0WZ85WD";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="JyncruHr"
ARC-Seal: i=1; a=rsa-sha256; t=1789365808; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aSMSs5eDLpx/fM9We9dnJ08FpeGY5+Pj3H91P4D6oaAfB4GUxo9qQK/1jmJxXzJXDv
    aMQNHBdoo7FcUtElRSFjVnWBf5eHAKPXBWC0qcZEVlWedbeQYwsdR6LORgzqW5UIEDDR
    MSQcBcOi6rKygNw9z9sj6CGhPvThQxT21Vj0aKu/B6ivxip1LLSX/HmZW6c/GlCyj5C3
    w4dOdEe1yXlnmm4Ihn+LUeH1G+pBsY9HWNKcAiQAU9afuG9+j5uZ4QASCV6piSkmu9lW
    p9m9Ehk5IxrQkkQYWdPIdW9KIe01wzKgOoo1B7lL8rx91NKaG1KpeBdChfKWiFIFVDDf
    st8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1789365808;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YYpsH7bBkDFh/l5zgioH7kXJektckeDpmTXuUM95JTA=;
    b=euMhPTN+5DrCTArIukyj1A0/9q4IuIF5e1mvQlxb7Te38U8WXqzXjiOXzexJJMrrVH
    Z1Lv2FsJrQIXNs50IVFx5oBInNv1o/g6fWH+tSZKIx0+t8TqiCJgOVmxk+QMY+HkjHi2
    rT5edhixrnpVbGJYqt7SPraKxKvmhdwegKHL4lv8x+KcVw13sia63nv/lGopu/sSwfV3
    4qfzalHnsMsoa8GsDqFO1JwLFSkqduKMxcFJrZEQ7BkX1yjm1uAQD/3mMXpyz/VATJtB
    lWSprXaVz7Zaq7GEwfKk8MQnXaDeMv0P89dDjr9lt/Y5ve2rZWu+gaLtzulZEMeDE8k5
    g26Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1789365808;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YYpsH7bBkDFh/l5zgioH7kXJektckeDpmTXuUM95JTA=;
    b=B0WZ85WDfKTctVYzOFNX67NMForCu1kEEObO51w782wEsz3+589zcJrg+Y0NlHF6kq
    OJayxOoFGQZvwZ1foFMzg+3I235Ynu3lHbb9MN/DEDMrK+GteSpICHHUFu1esrvMRO+9
    pV1FM7Tpc6daaURfFcfwH6hqW+LRXtNGSt0KmSpH/fB9/Dakrj3Cu0pOcfR6GHsqpbwf
    3xHduGeQOM/TReVr7qaoWTnEyG8Qt677W4Xacm/m/FPiGx0E6T/IRr+k8KUV33efSodF
    hsszO8wdzgeOZ2WKIXmIZPoQOO9VEJ7iTLoW31RRhKj0fmGi3N650QnBxdC+qhU7TbgR
    vlvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1789365808;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YYpsH7bBkDFh/l5zgioH7kXJektckeDpmTXuUM95JTA=;
    b=JyncruHrf42SDlaQd/cixth9uqeoXeNVAo4oyaZfYsryrYWBwFuivrSplBJ74O0HnP
    W1Twui/ofUAhYDjXjFDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poGnsiNgFnoH/cELIESn7Rf3BYpheEKbUP4"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.2 AUTH)
    with ESMTPSA id Q0498328E63RBlf
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 14 Sep 2026 08:03:27 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] kbuild: fix spurious error from find when generating
 asm-headers
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <a812debb-e5d8-4f9b-abcc-a9414983402a@infradead.org>
Date: Mon, 14 Sep 2026 08:03:17 +0200
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D6980B8-5EB9-4554-9B8E-5CAF3B595848@goldelico.com>
References: <6e2a2c0cb5d7885ae0dc146025d21c23904d7b70.1789330068.git.hns@goldelico.com>
 <a812debb-e5d8-4f9b-abcc-a9414983402a@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Indeed!

> Am 14.09.2026 um 00:39 schrieb Randy Dunlap <rdunlap@infradead.org>:
>=20
> Hi,
>=20
> On 9/13/26 1:07 PM, H. Nikolaus Schaller wrote:
>> The *.h pattern should be quoted or we may see errors like
>>=20
>>  find: paths must precede expression: elf.h
>>  Usage: find [-H] [-L] [-P] [-Olevel] [-D =
help|tree|search|stat|rates|opt|exec] [path...] [expression]
>>=20
>> if the working directory contains some *.h files.
>>=20
>> This was found in a cross-compilation environment.
>>=20
>> Fixes: 2d69b891e6461 ("kbuild: Support generated asm-headers in =
subdirectories")
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> scripts/Makefile.asm-headers | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/Makefile.asm-headers =
b/scripts/Makefile.asm-headers
>> index b38931314ad7c..9db8ab0145a44 100644
>> --- a/scripts/Makefile.asm-headers
>> +++ b/scripts/Makefile.asm-headers
>> @@ -48,7 +48,7 @@ syscall-y   :=3D $(addprefix $(obj)/, $(syscall-y))
>> generated-y :=3D $(addprefix $(obj)/, $(generated-y))
>>=20
>> # Remove stale wrappers when the corresponding files are removed from =
generic-y
>> -old-headers :=3D $(shell test -d $(obj) && find $(obj) -name *.h)
>> +old-headers :=3D $(shell test -d $(obj) && find $(obj) -name '*.h')
>> unwanted    :=3D $(filter-out $(generic-y) $(generated-y) =
$(syscall-y),$(old-headers))
>>=20
>> filechk_wrap =3D echo "\#include <asm-generic/$*.h>"
>=20
> Same as this other patch from 13 hours earlier:
>=20
> =
https://lore.kernel.org/linux-kbuild/f54cae8e7da612ad558154706ce2e99f98d13=
6c4.1789282037.git.tanggeliang@kylinos.cn/T/#u


Anyways, thanks for having it fixed.

BR,
Nikolaus

