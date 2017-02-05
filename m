Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33053 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751657AbdBESZM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Feb 2017 13:25:12 -0500
Received: by mail-wm0-f67.google.com with SMTP id v77so17247642wmv.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Feb 2017 10:25:12 -0800 (PST)
MIME-Version: 1.0
From: Herwig Hochleitner <hhochleitner@gmail.com>
Date: Sun, 5 Feb 2017 19:24:50 +0100
Message-ID: <CADUC9hqyu40Goc-B8YxU43dzR_c5LisDwzk=fvv9o=v4zSbTjw@mail.gmail.com>
Subject: Quoted, absolute -I paths break out-of-tree Makefiles [regression]
Content-Type: multipart/mixed; boundary=001a11442636a496f40547cca247
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: fche@elastic.org, volth@webmaster.ms

--001a11442636a496f40547cca247
Content-Type: text/plain; charset=UTF-8

Systemtap on NixOS generates
[Makefiles](https://hastebin.com/nejijihege.mk#L124) adding
-I"/absolute/path" to EXTRA_CPATH.

This works fine, when used with an in-tree kernel build. In NixOS we
save space on the kernel-dev package, by making [modules_prepare in a
O=oot build and delivering
oot](https://github.com/NixOS/nixpkgs/blob/bb8ded9a78b61f2a23b2e4a0e516533ae0c0d1d4/pkgs/os-specific/linux/kernel/manual-config.nix#L151)


Up to at least 4.4, that -I"/quoted/absolute/stap-include" works with
O=oot. Starting with at most 4.9.2, that flag gets mangled into
-I/absolute/oot"/quoted/absolute/stap-include".

Attached is a script, that demonstrates this issue, could somebody
with a repository clone bisect this for me, please?

best regards

--001a11442636a496f40547cca247
Content-Type: application/x-sh; name="test-quoted-kbuild-makefile.sh"
Content-Disposition: attachment; filename="test-quoted-kbuild-makefile.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iyszdj9l0

IyEvYmluL3NoIC1lCgppZiBbIC1uICIkMSIgXTsgdGhlbgogICAgS1NSQz0iJChyZWFscGF0aCAk
MSkiCmVsc2UKICAgIGVjaG8gIlVzYWdlOiAkMCA8a2VybmVsLXNvdXJjZS1kaXI+IiA+JjIKICAg
IGV4aXQgMQpmaQoKS0VFUF9UTVA9MAoKVE1QPSQobWt0ZW1wIC1kKQp0cmFwICcKICBpZiBbWyAi
MSIgPT0gIiRLRUVQX1RNUCIgXV0KICB0aGVuCiAgICBlY2hvIEtlZXBpbmcgJFRNUCA+JjIKICBl
bHNlCiAgICBlY2hvIFJlbW92aW5nICRUTVAgPiYyCiAgICBybSAtciAkVE1QCiAgZmkKJyBFWElU
Cgpta2RpciAtcCAkVE1QL2ttb2QgJFRNUC9rYnVpbGQgJFRNUC9pbmNsdWRlICRUTVAva21vZC1i
dWlsZAoKY2F0ID4gJFRNUC9rbW9kL01ha2VmaWxlIDw8RU9GCkVYVFJBX0NGTEFHUyArPSAtSSIk
VE1QL2luY2x1ZGUiCm9iai1tIDo9IHRlc3QtbW9kLm8KRU9GCgpjYXQgPiAkVE1QL2ttb2QvdGVz
dC1tb2QuYyA8PEVPRgojaW5jbHVkZSAidGVzdC1jb21tb24uaCIKY29uc3QgY2hhciAqIHRlc3Qo
dm9pZCkgewogIHJldHVybiBjb21tb25fdGVzdDsKfQpFT0YKCmNhdCA+ICRUTVAvaW5jbHVkZS90
ZXN0LWNvbW1vbi5oIDw8RU9GCmNvbnN0IGNoYXIgKiBjb21tb25fdGVzdCA9ICJmb28iOwpFT0YK
Cm1ha2UgLUMgJEtTUkMgTz0kVE1QL2tidWlsZCBkZWZjb25maWcgbW9kdWxlc19wcmVwYXJlCm1h
a2UgLUMgJFRNUC9rYnVpbGQgTz0kVE1QL2ttb2QtYnVpbGQgTT0kVE1QL2ttb2QgdGVzdC1tb2Qu
a28K
--001a11442636a496f40547cca247--
