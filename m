Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:36178 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751145Ab3LFEEY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 23:04:24 -0500
Message-ID: <1386302655.3000.48.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 06 Dec 2013 04:04:15 +0000
In-Reply-To: <CABsPBHq+hUCo4twA0ypVekBBj_pdXpaKFxKROGmA1hTnMdcGCg@mail.gmail.com>
References: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
	 <CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>
	 <1386294039.3000.29.camel@deadeye.wl.decadent.org.uk>
	 <CABsPBHob2cYEVhBT8=jaJXE=oZ_c-b2iv-sLTQQthX_EZPwPpg@mail.gmail.com>
	 <1386295673.3000.35.camel@deadeye.wl.decadent.org.uk>
	 <CABsPBHq+hUCo4twA0ypVekBBj_pdXpaKFxKROGmA1hTnMdcGCg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fzz0S0C/cnDXw9Im7ea3"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Niew, Sh." <shniew@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org


--=-fzz0S0C/cnDXw9Im7ea3
Content-Type: multipart/mixed; boundary="=-GGcrZ+ZYaMVSIXlVTD8r"


--=-GGcrZ+ZYaMVSIXlVTD8r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-12-06 at 11:29 +0800, Niew, Sh. wrote:
> On Fri, Dec 6, 2013 at 10:07 AM, Ben Hutchings <ben@decadent.org.uk> wrot=
e:
> > On Fri, 2013-12-06 at 09:45 +0800, Niew, Sh. wrote:
> >> On Fri, Dec 6, 2013 at 9:40 AM, Ben Hutchings <ben@decadent.org.uk> wr=
ote:
> >> > On Fri, 2013-12-06 at 09:35 +0800, Niew, Sh. wrote:
> >> >> On Thu, Dec 5, 2013 at 10:37 PM, Ben Hutchings <ben@decadent.org.uk=
> wrote:
> >> >> > builddeb generates a control file that says the linux-headers pac=
kage
> >> >> > can only be built for the build system primary architecture.  Thi=
s
> >> >> > breaks cross-building configurations.  We should use $debarch for=
 this
> >> >> > instead.
> >> >> >
> >> >> > Since $debarch is not yet set when generating the control file, s=
et
> >> >> > Architecture: any and use control file variables to fill in the
> >> >> > description.
> >> >> >
> >> >> > Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb=
-pkg')
> >> >> > Reported-by: "Niew, Sh." <shniew@gmail.com>
> >> >> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> >> > [...]
> >> >> I can't patch this to my linux-3.2.y tree which i clone from linux-=
stable
> >> >> I check that the patches number line are different...
> >> >> What i missed?
> >> >
> >> > This is for mainline; it should apply cleanly to 3.12.
>=20
> What ever i try, is failed. Even with 3.12 tree of debian.
> I check the failure, the following part can't be patch:
>=20
> @@ -62,7 +62,7 @@ create_package() {
>         fi
>=20
>         # Create the package
> -       dpkg-gencontrol -isp $forcearch -p$pname -P"$pdir"
> +       dpkg-gencontrol -isp $forcearch -Vkernel:debarch=3D"${debarch:-$
> (dpkg --print-architecture)}" -p$pname -P"$pdir"
>         dpkg --build "$pdir" ..
>  }

I think this has been word-wrapped by your mail program.  Here is the
patch as an attachment; that should avoid the problem.

Ben.

> >> What if i want to test this to 3.2?
> >
> > Then you're on your own, sorry.

--=20
Ben Hutchings
Knowledge is power.  France is bacon.

--=-GGcrZ+ZYaMVSIXlVTD8r
Content-Disposition: attachment;
	filename="0001-deb-pkg-Fix-cross-building-linux-headers-package.patch"
Content-Type: text/x-patch;
	name="0001-deb-pkg-Fix-cross-building-linux-headers-package.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBlZDEwYWRlMjI5NDM4ZjNmNGNlNTYzZTYwOTA5M2ZhNjM2MmZmMGYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQmVuIEh1dGNoaW5ncyA8YmVuQGRlY2FkZW50Lm9yZy51az4N
CkRhdGU6IFRodSwgNSBEZWMgMjAxMyAwNDoxMjo1NCArMDAwMA0KU3ViamVjdDogW1BBVENIXSBk
ZWItcGtnOiBGaXggY3Jvc3MtYnVpbGRpbmcgbGludXgtaGVhZGVycyBwYWNrYWdlDQoNCmJ1aWxk
ZGViIGdlbmVyYXRlcyBhIGNvbnRyb2wgZmlsZSB0aGF0IHNheXMgdGhlIGxpbnV4LWhlYWRlcnMg
cGFja2FnZQ0KY2FuIG9ubHkgYmUgYnVpbHQgZm9yIHRoZSBidWlsZCBzeXN0ZW0gcHJpbWFyeSBh
cmNoaXRlY3R1cmUuICBUaGlzDQpicmVha3MgY3Jvc3MtYnVpbGRpbmcgY29uZmlndXJhdGlvbnMu
ICBXZSBzaG91bGQgdXNlICRkZWJhcmNoIGZvciB0aGlzDQppbnN0ZWFkLg0KDQpTaW5jZSAkZGVi
YXJjaCBpcyBub3QgeWV0IHNldCB3aGVuIGdlbmVyYXRpbmcgdGhlIGNvbnRyb2wgZmlsZSwgc2V0
DQpBcmNoaXRlY3R1cmU6IGFueSBhbmQgdXNlIGNvbnRyb2wgZmlsZSB2YXJpYWJsZXMgdG8gZmls
bCBpbiB0aGUNCmRlc2NyaXB0aW9uLg0KDQpGaXhlczogY2Q4ZDYwYTIwYTQ1ICgna2J1aWxkOiBj
cmVhdGUgbGludXgtaGVhZGVycyBwYWNrYWdlIGluIGRlYi1wa2cnKQ0KU2lnbmVkLW9mZi1ieTog
QmVuIEh1dGNoaW5ncyA8YmVuQGRlY2FkZW50Lm9yZy51az4NCi0tLQ0KIHNjcmlwdHMvcGFja2Fn
ZS9idWlsZGRlYiB8IDkgKysrKy0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3NjcmlwdHMvcGFja2FnZS9idWlsZGRl
YiBiL3NjcmlwdHMvcGFja2FnZS9idWlsZGRlYg0KaW5kZXggOTBlNTIxZi4uMzAxYWNkYyAxMDA2
NDQNCi0tLSBhL3NjcmlwdHMvcGFja2FnZS9idWlsZGRlYg0KKysrIGIvc2NyaXB0cy9wYWNrYWdl
L2J1aWxkZGViDQpAQCAtNjIsNyArNjIsNyBAQCBjcmVhdGVfcGFja2FnZSgpIHsNCiAJZmkNCiAN
CiAJIyBDcmVhdGUgdGhlIHBhY2thZ2UNCi0JZHBrZy1nZW5jb250cm9sIC1pc3AgJGZvcmNlYXJj
aCAtcCRwbmFtZSAtUCIkcGRpciINCisJZHBrZy1nZW5jb250cm9sIC1pc3AgJGZvcmNlYXJjaCAt
Vmtlcm5lbDpkZWJhcmNoPSIke2RlYmFyY2g6LSQoZHBrZyAtLXByaW50LWFyY2hpdGVjdHVyZSl9
IiAtcCRwbmFtZSAtUCIkcGRpciINCiAJZHBrZyAtLWJ1aWxkICIkcGRpciIgLi4NCiB9DQogDQpA
QCAtMjg4LDE1ICsyODgsMTQgQEAgbWtkaXIgLXAgIiRkZXN0ZGlyIg0KIChjZCAkb2JqdHJlZTsg
Y3AgJEtDT05GSUdfQ09ORklHICRkZXN0ZGlyLy5jb25maWcpICMgY29weSAuY29uZmlnIG1hbnVh
bGx5IHRvIGJlIHdoZXJlIGl0J3MgZXhwZWN0ZWQgdG8gYmUNCiBsbiAtc2YgIi91c3Ivc3JjL2xp
bnV4LWhlYWRlcnMtJHZlcnNpb24iICIka2VybmVsX2hlYWRlcnNfZGlyL2xpYi9tb2R1bGVzLyR2
ZXJzaW9uL2J1aWxkIg0KIHJtIC1mICIkb2JqdHJlZS9kZWJpYW4vaGRyc3JjZmlsZXMiICIkb2Jq
dHJlZS9kZWJpYW4vaGRyb2JqZmlsZXMiDQotYXJjaD0kKGRwa2cgLS1wcmludC1hcmNoaXRlY3R1
cmUpDQogDQogY2F0IDw8RU9GID4+IGRlYmlhbi9jb250cm9sDQogDQogUGFja2FnZTogJGtlcm5l
bF9oZWFkZXJzX3BhY2thZ2VuYW1lDQogUHJvdmlkZXM6IGxpbnV4LWhlYWRlcnMsIGxpbnV4LWhl
YWRlcnMtMi42DQotQXJjaGl0ZWN0dXJlOiAkYXJjaA0KLURlc2NyaXB0aW9uOiBMaW51eCBrZXJu
ZWwgaGVhZGVycyBmb3IgJEtFUk5FTFJFTEVBU0Ugb24gJGFyY2gNCi0gVGhpcyBwYWNrYWdlIHBy
b3ZpZGVzIGtlcm5lbCBoZWFkZXIgZmlsZXMgZm9yICRLRVJORUxSRUxFQVNFIG9uICRhcmNoDQor
QXJjaGl0ZWN0dXJlOiBhbnkNCitEZXNjcmlwdGlvbjogTGludXgga2VybmVsIGhlYWRlcnMgZm9y
ICRLRVJORUxSRUxFQVNFIG9uIFwke2tlcm5lbDpkZWJhcmNofQ0KKyBUaGlzIHBhY2thZ2UgcHJv
dmlkZXMga2VybmVsIGhlYWRlciBmaWxlcyBmb3IgJEtFUk5FTFJFTEVBU0Ugb24gXCR7a2VybmVs
OmRlYmFyY2h9DQogIC4NCiAgVGhpcyBpcyB1c2VmdWwgZm9yIHBlb3BsZSB3aG8gbmVlZCB0byBi
dWlsZCBleHRlcm5hbCBtb2R1bGVzDQogRU9GDQo=


--=-GGcrZ+ZYaMVSIXlVTD8r--

--=-fzz0S0C/cnDXw9Im7ea3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIVAwUAUqFMv+e/yOyVhhEJAQp+Yw/9GecUbvKBHt1uxkOizn5EUsFWcvG+ofSz
it4iFGvnbbzhVWZ/781ZTxgfm3XW+/+7BIkEruEzB+mdTjf4I9rOq2IUA1nv2PX2
eNsOogFQevhObKiXceFCu9wsLTVElGnGCVVVwjzzxG9EXeNJeJwg1VQvp9e6j8Xp
/lVnxGkqfujaMO5LXxgvKyCcMlHGcQA6C9JSuTbFK4EDYDC1hWRlvA8PabMwZ0X4
DZ0sYyyGS00EzGaaFhgToJVErobjpXbtly7ptA0hC/JU84OqK5eyFnZpGsI8k21N
jZeuSg9SgT5A7xhBBnu8kJKy6Kiig2jnUjO2LL6wyZo7XZVMIqjdisRjPPhuJ1mJ
/k+TAqQDCAMlm50lu2ydfIHusZ+mastwH2NTu7xLCUmGBZRaku1MQW4dxKeQunQy
gGAeurBmZUdcY/UnGBfFIpInILSf0ds+7C64nCVk2un99pAGgw5GFDjNO2gHvd/f
sCLFcgmBPf74Wxe8BMtLZTBU+lCNuFSa0r9Aept0WZss0h+NZ1YmZwCWRVXl7zZc
HH7cKe3Vy7czbQUt9nEszZIbMzXbbIe/sf1iWYYIq+ec4cCRSSS4pQwD54WwPMmq
GxVigTxFo5INJvCuWZVy8BQhAePPWVL1wQEIOAhc/FchMTK6BXykOWbTjgWflhnY
BrDvU34nkxg=
=U7vD
-----END PGP SIGNATURE-----

--=-fzz0S0C/cnDXw9Im7ea3--
