Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f46.google.com ([209.85.128.46]:33608 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbeJIFZC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 01:25:02 -0400
Received: by mail-wm1-f46.google.com with SMTP id y140-v6so9674164wmd.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Oct 2018 15:11:09 -0700 (PDT)
Received: from [192.168.42.100] (82-132-218-100.dab.02.net. [82.132.218.100])
        by smtp.gmail.com with ESMTPSA id c8-v6sm28027171wrb.6.2018.10.08.15.11.07
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Oct 2018 15:11:07 -0700 (PDT)
Subject: Fwd: Update of SAT solver in kconfig
References: <ebf427d1-acb3-45b1-514d-77ff94a06fd2@gmail.com>
From: Mate Soos <soos.mate@gmail.com>
Message-ID: <aa4a847e-cf9b-b784-a5a2-b54e1331b655@gmail.com>
Date: Tue, 9 Oct 2018 00:11:06 +0200
MIME-Version: 1.0
In-Reply-To: <ebf427d1-acb3-45b1-514d-77ff94a06fd2@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms040504000507000109050800"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms040504000507000109050800
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi,

Based on the email chain that was kicked off lately and also by Patrick
Franz, I thought I would write a bit of an update related to SAT solvers
in configuration/dependency management. (ana)conda has been working on
integrating CryptoMiniSat into their system for such use, see:

https://github.com/msoos/cryptominisat/issues/513

https://github.com/conda/conda/pull/7676

The discussion there is long but the point is that a modern SAT solver
(and I don't mean only mean CMS) can be significantly faster than older
systems such as pycosat. I am trying to be non-preferential to SAT
solvers, and I personally have a lot of respect for CaDiCaL. In case
performance is something of a concern (in coda's case it was), newer SAT
solvers can make a big difference.

Just my 2 cents,

Mate



--------------ms040504000507000109050800
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CyAwggUyMIIEGqADAgECAhEAjsp5CRf3h4226eU+SYhADjANBgkqhkiG9w0BAQsFADCBlzEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTgwODIyMDAw
MDAwWhcNMTkwODIyMjM1OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNzb29zLm1hdGVAZ21haWwu
Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt6psksq0czkpGLqQkV1NIN/J
qGdN6fws17SO7Y+o9WQFsPf1VTfZX9jfXtReC534vLUN8egS6cvZV1MqBXelXGt71DvXHAMZ
5ghkoJgTtW65zeyXNwCXnFycaqKM7Tvho/WfGfUsr3YxqwPVD7oxYWRkp0cfQfqskidY/NDp
UjOBlRhyyIynKygjb8R3zZ4pgqGS84M9Dj60UozrprrZ21rK1QgeIHz3cLi5PAFbullG2sju
Rj3Hnc/joxI6gybPNKj3o5X6UNr/pTltl3emlj1MtFJCP1/7Fqn4eJz/M9b0ud4NDmb6395z
DUYrAUXnseJ4ql65kcebs5S1uSOyAQIDAQABo4IB6TCCAeUwHwYDVR0jBBgwFoAUgq9sjPjF
/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFNPhZLmi1teeb4/3BoyAtTgWPWONMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcGCCsGAQUFBwMEBgsrBgEEAbIxAQMF
AjARBglghkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAQEwKzApBggr
BgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2g
S4ZJaHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRp
b25hbmRTZWN1cmVFbWFpbENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklo
dHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5j
b20wHgYDVR0RBBcwFYETc29vcy5tYXRlQGdtYWlsLmNvbTANBgkqhkiG9w0BAQsFAAOCAQEA
UfUnBg6WxVuW1zGelOJi/v28H7uye1izGJINsNgK1ILBN6cmsF6G9P4r5mw2Igh4W3KzxPIc
39CjBj15fi2PDwCQpGqtZzKftg25vwYz7K2ZzFhXYbjnBqi19Lht82lTCCvFkA+gfMZWvz6e
G0noZB8625rLYHKCW5SLN/om/diyjucBJNhrws4B/VCFyG6N+Pt9CbP6L5DLQxkXSGJAjhkQ
CSOkXyvZKsKXKACr8u+gKapA94DHT1ptzlkAHKsGkGxIJsWpdPTYfnbgQqiEotgk/kO1IZae
HakBHuIpRrLaaPF1krvcC5dEvHcpWG0vLkKi4rDpSe0HXY0XobI5djCCBeYwggPOoAMCAQIC
EGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYD
VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNP
TU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdC
MRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQ
PTRI5Or1u6zf+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivl
JTRENf+RKwrB6vcfWlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG
9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoS
WY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQAB
o4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKv
bIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEA
MBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9k
b2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBxBggrBgEFBQcB
AQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUFk
ZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJ
KoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo
7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaB
Q+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKS
TvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY
+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5td
hYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJ
M/1tyZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJU
mpvVdZ4ognzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTK
TlL8YXLI8nAbR9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIEODCCBDQCAQEw
ga0wgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNV
BAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01P
RE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAjsp5
CRf3h4226eU+SYhADjANBglghkgBZQMEAgEFAKCCAlswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgxMDA4MjIxMTA2WjAvBgkqhkiG9w0BCQQxIgQg8DFU
iUELh8I+F58xa2WdCyhVkU32N1k85w4Zqe5U1nIwbAYJKoZIhvcNAQkPMV8wXTALBglghkgB
ZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG
9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBvgYJKwYBBAGCNxAEMYGwMIGtMIGX
MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdT
YWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAI7KeQkX94eN
tunlPkmIQA4wgcAGCyqGSIb3DQEJEAILMYGwoIGtMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UE
CBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01P
RE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRp
b24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAI7KeQkX94eNtunlPkmIQA4wDQYJKoZIhvcNAQEB
BQAEggEAe5+NhIiQnoELSITWhRWdDPBEzh3fnINfyjjS4Z03mvC6N7x0kBudlMs2Zcza+J8u
B9u7sv+jb1nnx/0VCEOV+sWWf4wpKuUW65puwxDiYtQ6w+chrbVD8yfqz2SNt/0mafKm3usa
4z7HYZlhSTHpseS7rxPXmbDZAQ6tgtU8EcGpUl/6wHJS4qZngudsHjta06HRm2+XgkozNAMg
m4tI8nn4BSrg3afF4qd7VW9CxU89YzwFyCjj6UF9FDCEwaohrMrZ5uWEFBMpTKXts49sq6kh
+AF4Nn81jSYlOMJlBqTrqclC3Gu7w8KdljdMIZrUthE5hbVxNis8a40ENUuNwwAAAAAAAA==
--------------ms040504000507000109050800--
