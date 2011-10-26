Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:45179 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754934Ab1JZJQT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Oct 2011 05:16:19 -0400
Received: by vws1 with SMTP id 1so1241235vws.19
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Oct 2011 02:16:19 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 26 Oct 2011 11:16:18 +0200
Message-ID: <CAH+fs=_Cb+m8DP2_cj=DAhVo4ygaQ4JFo8rfq9bOkydr_8UafQ@mail.gmail.com>
Subject: [PATCH]: expose FORCE_MAX_ZONEORDER on x86
From: Marc Leeman <marc.leeman@gmail.com>
Content-Type: multipart/mixed; boundary=bcaec54858cad89a8e04b0301b23
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

--bcaec54858cad89a8e04b0301b23
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Larger blocks of memory are required for e.g. higher resolution
capture card drivers; this patch just enables an already available
configuration option on x86 (it was already exposed on other
architectures).


--=20
br, marc

The best approach for you requires two steps. The first step is
reading the Manual.
=A0 =A0 Wolfgang Denk - u-boot mailing list

--bcaec54858cad89a8e04b0301b23
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-KConfig-x86-enable-FORCE_MAX_ZONEORDER.patch"
Content-Disposition: attachment;
	filename="0001-KConfig-x86-enable-FORCE_MAX_ZONEORDER.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gu83y4iw0

RnJvbSA4YWQ2NGVkYmY5MmFjOGUwMjUzNjc3YmQzZjlhZDM3NmNlM2JlN2QxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJjIExlZW1hbiA8bWFyYy5sZWVtYW5AZ21haWwuY29tPgpE
YXRlOiBXZWQsIDI2IE9jdCAyMDExIDEwOjM1OjI0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gS0Nv
bmZpZyB4ODY6IGVuYWJsZSBGT1JDRV9NQVhfWk9ORU9SREVSCgotLS0KIGFyY2gveDg2L0tjb25m
aWcgfCAgIDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJj
aC94ODYvS2NvbmZpZwppbmRleCA5YTRhMjY3Li42OGE5OGU4IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9LY29uZmlnCisrKyBiL2FyY2gveDg2L0tjb25maWcKQEAgLTEyNzMsNiArMTI3MywyMiBAQCBj
b25maWcgSUxMRUdBTF9QT0lOVEVSX1ZBTFVFCiAKIHNvdXJjZSAibW0vS2NvbmZpZyIKIAorY29u
ZmlnIEZPUkNFX01BWF9aT05FT1JERVIKKwlpbnQgIk1heGltdW0gem9uZSBvcmRlciIgCisJcmFu
Z2UgMTEgNjQKKwlkZWZhdWx0ICIxMSIKKwloZWxwCisJICBUaGUga2VybmVsIG1lbW9yeSBhbGxv
Y2F0b3IgZGl2aWRlcyBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMgbWVtb3J5CisJICBibG9ja3MgaW50
byAiem9uZXMiLCB3aGVyZSBlYWNoIHpvbmUgaXMgYSBwb3dlciBvZiB0d28gbnVtYmVyIG9mCisJ
ICBwYWdlcy4gIFRoaXMgb3B0aW9uIHNlbGVjdHMgdGhlIGxhcmdlc3QgcG93ZXIgb2YgdHdvIHRo
YXQgdGhlIGtlcm5lbAorCSAga2VlcHMgaW4gdGhlIG1lbW9yeSBhbGxvY2F0b3IuICBJZiB5b3Ug
bmVlZCB0byBhbGxvY2F0ZSB2ZXJ5IGxhcmdlCisJICBibG9ja3Mgb2YgcGh5c2ljYWxseSBjb250
aWd1b3VzIG1lbW9yeSwgdGhlbiB5b3UgbWF5IG5lZWQgdG8KKwkgIGluY3JlYXNlIHRoaXMgdmFs
dWUuCisKKwkgIFRoaXMgY29uZmlnIG9wdGlvbiBpcyBhY3R1YWxseSBtYXhpbXVtIG9yZGVyIHBs
dXMgb25lLiBGb3IgZXhhbXBsZSwKKwkgIGEgdmFsdWUgb2YgMTEgbWVhbnMgdGhhdCB0aGUgbGFy
Z2VzdCBmcmVlIG1lbW9yeSBibG9jayBpcyAyXjEwIHBhZ2VzLgorCisKIGNvbmZpZyBISUdIUFRF
CiAJYm9vbCAiQWxsb2NhdGUgM3JkLWxldmVsIHBhZ2V0YWJsZXMgZnJvbSBoaWdobWVtIgogCWRl
cGVuZHMgb24gSElHSE1FTQotLSAKMS43LjIuNQoK
--bcaec54858cad89a8e04b0301b23--
