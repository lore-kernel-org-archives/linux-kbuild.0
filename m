Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zm-mta-out-2.u-ga.fr ([152.77.200.57]:47241 "EHLO
        zm-mta-out-2.u-ga.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751646AbdJZH2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Oct 2017 03:28:31 -0400
Reply-To: nicolas.palix@univ-grenoble-alpes.fr
Subject: Re: [PATCH] coccinelle: fix verbose message about .cocci file being
 run
References: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com>
From: "Nicolas Palix (LIG)" <Nicolas.Palix@imag.fr>
Message-ID: <c18712da-6b47-3b13-059d-d49db738e386@imag.fr>
Date: Thu, 26 Oct 2017 09:22:59 +0200
MIME-Version: 1.0
In-Reply-To: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms050001050609030108040707"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

This is a cryptographically signed message in MIME format.

--------------ms050001050609030108040707
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable

Le 26/10/17 =C3=A0 06:55, Masahiro Yamada a =C3=A9crit=C2=A0:
> If you run coccicheck with V=3D1 and COCCI=3D, you will see a strange
> path to the semantic patch file.  For example, run the following:
>=20
> $ make V=3D1 COCCI=3Dscripts/coccinelle/free/kfree.cocci coccicheck
>    [ snip ]
>   The semantic patch that makes this report is available
>   in scriptcoccinelle/free/kfree.cocci.
>=20
> Notice "s/" was dropped from "scripts/coccinelle/free/kfree.cocci".
>=20
> When running coccicheck without O=3D, $srctree is expanded to ".", whic=
h
> represents one arbitrary character in the regular expression.  Using
> sed is not a good choice here.  Strip $srctree/ simply without sed.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
> ---
>=20
>   scripts/coccicheck | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 1bfa2d2..9d18662 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -186,7 +186,7 @@ coccinelle () {
>  =20
>       if [ $VERBOSE -ne 0 -a $ONLINE -eq 0 ] ; then
>  =20
> -	FILE=3D`echo $COCCI | sed "s|$srctree/||"`
> +	FILE=3D${COCCI#$srctree/}
>  =20
>   	echo "Processing `basename $COCCI`"
>   	echo "with option(s) \"$OPT\""
>=20


--=20
Nicolas Palix
http://lig-membres.imag.fr/palix/


--------------ms050001050609030108040707
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Signature cryptographique S/MIME

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CG8wggO2MIICnqADAgECAgEDMA0GCSqGSIb3DQEBBQUAMCwxCzAJBgNVBAYTAkZSMQ0wCwYD
VQQKEwRDTlJTMQ4wDAYDVQQDEwVDTlJTMjAeFw0wOTAxMjEwOTAzNTJaFw0yOTAxMjAwOTAz
NTJaMDUxCzAJBgNVBAYTAkZSMQ0wCwYDVQQKEwRDTlJTMRcwFQYDVQQDEw5DTlJTMi1TdGFu
ZGFyZDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJypZGq0ByMZw74ICMTiKl3t
1Cje/j+g7ZJEaxZHNRM3jXSp9U2D5AUbjwhhTN53W9ep/7tlncmsPA/xiXuTIqBHD18Gvo54
oAt510JlYXJjkkCKW2cQ+tYnPth3TR55229LEgBSWOLYQgWyMzd34I1sHbz49vKUWCX3gtmG
2Vzz2C7N/XCJBIfvOdEq2JKMaS8cUmX6YI8Qf8yP+VwuFO1Mi+CdN7jSPJTKUP1Bet72POyu
7L1cFt2w8HOZeoH/OzPSAJ5NjMZbOC4zw3aGynJU2y3iEP2SUGiThO13qYlpUYXr4JSj+ZcI
EYwk8A+6OLQs1tdsTmP+tDGf74+mWqUCAwEAAaOB2TCB1jAPBgNVHRMBAf8EBTADAQH/MB0G
A1UdDgQWBBQR49nRUkcbWbE8G3hma/ShiO0KWzBUBgNVHSMETTBLgBRQl7YN96wzF6/xHUY8
azv/AKDl5aEwpC4wLDELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxDjAMBgNVBAMTBUNO
UlMyggEAMA4GA1UdDwEB/wQEAwIBBjA+BgNVHR8ENzA1MDOgMaAvhi1odHRwOi8vY3Jscy5z
ZXJ2aWNlcy5jbnJzLmZyL0NOUlMyL2dldGRlci5jcmwwDQYJKoZIhvcNAQEFBQADggEBAE/p
4xfmTCf1F2pQVeruz0yqve4s3XY+WaAvC2iJ2kPQHh0saxL5ZxOeZSukhNIxz4Kgyu8i6BBs
6c8XfKyth4VMiuHVe0zm2Q6yoeQpniCvDz57uX8kTDLgiP562qwWYKF1romcimadlLp+qw4g
I+33x4RdgkgU3sTUsMVOLIfUjQMRLzbVKW+umWcZDI1tWiDf0Z/Gy69V7gvKsVsP71x09PNG
iWNHfizOv8gwDQBG9hjmbD8wfpBuEI0fOUnPk2nryJ7CZ3OvSov2fEIo3aXd7a/JVRtkP1S8
YSYQ65HV6ffu0PYLC/qmkN1g9ECdC6ec+M4vITj+qwa/2g13+mcwggSxMIIDmaADAgECAgMA
sYYwDQYJKoZIhvcNAQEFBQAwNTELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFzAVBgNV
BAMTDkNOUlMyLVN0YW5kYXJkMB4XDTE2MDMzMTE0MzczN1oXDTE4MDMzMTE0MzczN1owbDEL
MAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxEDAOBgNVBAsTB1VNUjUyMTcxFjAUBgNVBAMT
DU5pY29sYXMgUGFsaXgxJDAiBgkqhkiG9w0BCQEWFU5pY29sYXMuUGFsaXhAaW1hZy5mcjCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOrXeKVCpb7MjlNJjUttPdthNS7GvU/h
TZezIPCzuM73eHIpYNVx0qVsnP6fTzAc+7i7a/hAcTM2XChLkm+tzpbWJ44CNoQ9+OCgMW+3
6sRS1Kv66bz1qKqxj4hXnWoGga/ND4bbMmtS0tG+LZ0jpqk5p2K01DU12XnmQ5zi5O+eV0i1
ERLJkJd+m9duJOCa9tni/b05Lcs2LClfYFrmr1cMvGPmy0UguRYrlWjQrMKddLLmMgo8cv4n
GebpUfcgo3WmOz4BxKjNzj551Quy2QVtg3gYvuUEtNW88ONofmJ3+wr++ialKRPZM0C1MaCN
c6HJ//GVMWldxs0dQLrqUs8CAwEAAaOCAZEwggGNMAwGA1UdEwEB/wQCMAAwEQYJYIZIAYb4
QgEBBAQDAgSwMA4GA1UdDwEB/wQEAwIF4DB6BglghkgBhvhCAQ0EbRZrQ2VydGlmaWNhdCBD
TlJTMi1TdGFuZGFyZC4gUG91ciB0b3V0ZSBpbmZvcm1hdGlvbiBzZSByZXBvcnRlciDgIGh0
dHA6Ly9pZ2Muc2VydmljZXMuY25ycy5mci9DTlJTMi1TdGFuZGFyZC8wHQYDVR0OBBYEFLd6
+Ifph9Z/6Ky//jQzMhNtCru7MFQGA1UdIwRNMEuAFBHj2dFSRxtZsTwbeGZr9KGI7QpboTCk
LjAsMQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEOMAwGA1UEAxMFQ05SUzKCAQMwIAYD
VR0RBBkwF4EVTmljb2xhcy5QYWxpeEBpbWFnLmZyMEcGA1UdHwRAMD4wPKA6oDiGNmh0dHA6
Ly9jcmxzLnNlcnZpY2VzLmNucnMuZnIvQ05SUzItU3RhbmRhcmQvZ2V0ZGVyLmNybDANBgkq
hkiG9w0BAQUFAAOCAQEAhowl+iLEKBtHY1ygh+luUrBwA/a0PnqnR4Ih92ywgJZ+8yawSpuw
p3pqgXAi0WVqWN5fIYZII954W4XwUAedKxdBvOqLXfI1XwwnkhZ09icVWPJX0JZUBfVtKE9x
7sYtD5sknfFNX8dOoy88B1USDVw9BCoOdFr6fMOB+hmneZ/v+Wdj2RTir3IY6xDocwTAfJ4n
DdngikVPugfoUyNWR04J1bD9AVj2tNsZIu5cMgsj6ZISpRYHstB7LBx9Ya1zScctTGAT2fup
DiiEzqGjJcUSZUMuuvJmIR6v4toqr03yxR90yCn0eiLJOXtHGqOogAaXIGGDHGMS6KIU2hM8
CTGCAt4wggLaAgEBMDwwNTELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFzAVBgNVBAMT
DkNOUlMyLVN0YW5kYXJkAgMAsYYwDQYJYIZIAWUDBAIBBQCgggFzMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE3MTAyNjA3MjI1OVowLwYJKoZIhvcNAQkE
MSIEIGnZEqNNa8+3L9/aB+6JI6Z7R1hy6dBSQ9ljZMf5VzNLMEsGCSsGAQQBgjcQBDE+MDww
NTELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFzAVBgNVBAMTDkNOUlMyLVN0YW5kYXJk
AgMAsYYwTQYLKoZIhvcNAQkQAgsxPqA8MDUxCzAJBgNVBAYTAkZSMQ0wCwYDVQQKEwRDTlJT
MRcwFQYDVQQDEw5DTlJTMi1TdGFuZGFyZAIDALGGMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZI
AWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEAFe/I
J+QAgB+XwPYCFY+A6NWHKcbvLYdW/kIulsRMoXgpIfEROAm68o2CmoAtP/gOJUPTEGaGJ4n3
LELdk924ay98EVDX99a8TSFm6RYfqtcUWWUdGyHaSfdtfljhssanTCSrr2K80oNcHliP1K5n
yMC3Ve3lk1fw9q4zj6UtddPErQqVbw7sCl1ppW/dK7lMfx1MlOkEoWBDXItBBOjyRJ+WAzRV
ZAiOIN8W9IW2HIf4lF4Zn70qZ1l2hNgFWlA4FW31lYpZ3Qb862PUkES5y9RLkBdeTdGoevvT
D1YqykhNoGZ9hhatPed8WuKlGNpPkdHFq8NUxz15+prNUtZIbQAAAAAAAA==
--------------ms050001050609030108040707--
