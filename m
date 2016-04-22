Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:39807 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753203AbcDVHrY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2016 03:47:24 -0400
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
In-Reply-To: <57195E78.9080805@infradead.org>
References: <1461269279-11525-1-git-send-email-felipe.balbi@linux.intel.com> <57195E78.9080805@infradead.org>
Date: Fri, 22 Apr 2016 10:45:11 +0300
Message-ID: <87shye84u0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Felipe Balbi <balbif@gmail.com>, yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Randy Dunlap <rdunlap@infradead.org> writes:
> On 04/21/16 13:07, Felipe Balbi wrote:
>> With a growing amount of Kernel configuration, it's
>> getting ever more difficult to find anything on
>> menuconfig. Because of that, implement mergesort for
>> kconfig to make it a little easier for anybody
>> building kernels.
>
> Hi,
>
> Please explain the problem and the solution better.  I don't
> get it.

it's unclear to me what you don't understand from description above. Try
to find and enable some random driver on menuconfig. Here's a
suggestion:

"Maxim Semiconductor MAX77843 PMIC Support"

In any case, the idea is the following:

menuconfig has too many options, they are unsorted -> sort them

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXGdaIAAoJEIaOsuA1yqREa/oQAKfxVGOwvyKtcYBcLRqp+zsj
2wlvr80dF3qhGs4N5O7nsRFp28vZ84TNzS5R6Ad07oRpYapb9G6dJKWIOT250M4p
oTrtpv/ZTFVeJnqJ+3F09UUS00DtojIazDbD0Rq6JLhLxk7XOO1bZcOSMjZ5VwNF
JIvoo7rfXEwLXz3b+mgLlh78Y3Kh7QGg+bEuo7qD3iU84ayuHiSQdKv3T1ZhBq4t
sggIdhQrqJAJclzW5U2B8RnKgOayq+USYmH/Zxw3vlfDmUteEyuc+zC8vtoKpHgJ
vECbPBfVfEtyrgg+xb9SX9cSrOxx/HKDm6JvjEFo1Hi49uqx7B6fIti8w/b/lP/0
FaJ4MOUXT0zlrEgBS+NuGUCnCku22oFwhVPSMejsJwgbfFtxfzOZIvPg1JrKxek6
hjs00Dg0avbRfpx1yuYFu1PK6InA+uw8DycvLz0r4De+53NxQ0jlDwfiLTcg5aph
SsC6lgK2Y5W5z3C9VBl9XovRNoXVN8/lHlLcOQlkHfhuZU7ARCS7LT9/q4paMIsD
/bibsgkIsnbGcLuxRdT3Q/UFs/M8ylqzIpZ4lvDKMkDHhbaNO4kYioPsWQi+iZyE
ecF3RQxJ1Kr3+hI7IQkX56cfkC2y0WLHms6TC+nZgDA26E55PkAu6paguDnhxocm
lacM90cS4p4UfXLVuMl/
=tXsY
-----END PGP SIGNATURE-----
--=-=-=--
