Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zm-mta-out-2.u-ga.fr ([152.77.200.57]:47843 "EHLO
        zm-mta-out-2.u-ga.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbdJZHdb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Oct 2017 03:33:31 -0400
Subject: Re: [PATCH] coccinelle: grep Options and Requires fields more
 precisely
References: <1508993438-15325-1-git-send-email-yamada.masahiro@socionext.com>
 <alpine.DEB.2.20.1710260658330.17107@hadrien>
From: "Nicolas Palix (LIG)" <Nicolas.Palix@imag.fr>
Message-ID: <69422e77-ac67-d23f-59e2-c8d0df1819b6@imag.fr>
Date: Thu, 26 Oct 2017 09:26:17 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1710260658330.17107@hadrien>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms060104050906030104030202"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

This is a cryptographically signed message in MIME format.

--------------ms060104050906030104030202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable

Le 26/10/17 =C3=A0 06:59, Julia Lawall a =C3=A9crit=C2=A0:
>=20
>=20
> On Thu, 26 Oct 2017, Masahiro Yamada wrote:
>=20
>> Currently, the required version for badzero.cocci is picked up from
>> its "Comments:" line since it contains the word "Requires".
>>
>> Surprisingly, ld-version.sh can extract the version number from the
>> string "Requires Coccinelle version 1.0.0-rc20 or later", but this
>> expectation is fragile.  Fix the .cocci file.  I removed "-rc20"
>> because ld-version.sh cannot handle it.
>=20
> OK.
>=20
>> Make the coccicheck script to see exact patterns for "Options:" and
>> "Requires:" in order to avoid accidental matching to what just happens=

>> to appear in comment lines.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>=20
> Thanks for checking on this!
>=20
> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
>=20
>> ---
>>
>>   scripts/coccicheck                    | 4 ++--
>>   scripts/coccinelle/null/badzero.cocci | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/coccicheck b/scripts/coccicheck
>> index 3e21a1b..1bfa2d2 100755
>> --- a/scripts/coccicheck
>> +++ b/scripts/coccicheck
>> @@ -168,8 +168,8 @@ OPTIONS=3D"$OPTIONS $SPFLAGS"
>>   coccinelle () {
>>       COCCI=3D"$1"
>>
>> -    OPT=3D`grep "Option" $COCCI | cut -d':' -f2`
>> -    REQ=3D`grep "Requires" $COCCI | cut -d':' -f2 | sed "s| ||"`
>> +    OPT=3D`grep "Options:" $COCCI | cut -d':' -f2`
>> +    REQ=3D`grep "Requires:" $COCCI | cut -d':' -f2 | sed "s| ||"`
>>       REQ_NUM=3D$(echo $REQ | ${DIR}/scripts/ld-version.sh)
>>       if [ "$REQ_NUM" !=3D "0" ] ; then
>>   	    if [ "$SPATCH_VERSION_NUM" -lt "$REQ_NUM" ] ; then
>> diff --git a/scripts/coccinelle/null/badzero.cocci b/scripts/coccinell=
e/null/badzero.cocci
>> index 5551da2..f597c80 100644
>> --- a/scripts/coccinelle/null/badzero.cocci
>> +++ b/scripts/coccinelle/null/badzero.cocci
>> @@ -10,7 +10,7 @@
>>   // Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.  GPLv2.
>>   // Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
>>   // URL: http://coccinelle.lip6.fr/
>> -// Comments: Requires Coccinelle version 1.0.0-rc20 or later
>> +// Requires: 1.0.0
>>   // Options:
>>
>>   virtual patch
>> --
>> 2.7.4
>>
>>


--=20
Nicolas Palix
http://lig-membres.imag.fr/palix/


--------------ms060104050906030104030202
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE3MTAyNjA3MjYxN1owLwYJKoZIhvcNAQkE
MSIEIAehnRlh/Pz8hFDpyBOQw13vO+aHvmGMiriEpzW3MItBMEsGCSsGAQQBgjcQBDE+MDww
NTELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFzAVBgNVBAMTDkNOUlMyLVN0YW5kYXJk
AgMAsYYwTQYLKoZIhvcNAQkQAgsxPqA8MDUxCzAJBgNVBAYTAkZSMQ0wCwYDVQQKEwRDTlJT
MRcwFQYDVQQDEw5DTlJTMi1TdGFuZGFyZAIDALGGMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZI
AWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEAlCap
5C713Qf4Vimh1WpnSzUvWreX/mOVbrSiUg0lUQD3LEAMKYk+wi6GuPuKOIs8ZIGrnZ1JwDzf
idMazUbKWlAORiiZIORJC9EKDtjb1o7e9ozbB0t3RUOGbYs0IIBYiaiV0V99AG31pLrjezPA
9pzFQl9vSvf8wQadt89FpPlF4luhaSADS1e/mRDJ+FDXY0a/b7JHAuYo/rioa9BmvLBU+zFF
sZs0ScLgGhJd0F1ZsYMEW6WYLQEbt9BmhvOdhXwRzJ/QAwg1RGKJjfUIiVZHmkG38YvEsESN
QCGGNfY//9z/8x0J3BrfkQiy0UQYdpx1nC3XzWYwjfk1Y3FeIQAAAAAAAA==
--------------ms060104050906030104030202--
