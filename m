Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:45911 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753488Ab0LPU0Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Dec 2010 15:26:16 -0500
Message-ID: <4D0A75E4.9090306@zytor.com>
Date: Thu, 16 Dec 2010 12:26:12 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Fwd: PATCH: Put .zdebug* section on white list
Content-Type: multipart/mixed;
 boundary="------------020504010602030607010600"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020504010602030607010600
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------020504010602030607010600
Content-Type: message/rfc822;
 name="PATCH: Put _zdebug* section on white list.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="PATCH: Put _zdebug* section on white list.eml"

Return-Path: <hjl.tools@gmail.com>
Received: from mail-vw0-f53.google.com (mail-vw0-f53.google.com [209.85.212.53])
	by terminus.zytor.com (8.14.4/8.14.3) with ESMTP id oBG1BSKc024622
	for <hpa@zytor.com>; Wed, 15 Dec 2010 17:11:34 -0800
Received: by vws8 with SMTP id 8so1164932vws.12
        for <hpa@zytor.com>; Wed, 15 Dec 2010 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=A1pmjPNblw5cI/qqxf7yZ0AOamt+C50PyB5CSkp1vPc=;
        b=FpWcXf5Jn+ERoXlu3LijX91Celm3w+oAYoHY6ZjPt3AAjq/wE5Hn314tpfENepn4oB
         onYL6PjqVhJ31gG5pL1kTDPDuRpkjqvqDdK3var5LJnfq7/Nmj7IXgMtUoDgJTDeptNP
         6neWvrqSegUzC77OMEfl22XTeovA64JYVlTTw=
DomainKey-Signature: a=rsa-sha1; c=nofws;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        b=tyoHtNMnW8HHExmpMpKu5xMIVKqxRN+Ktu/kFAQiv5uybk8dIKj70FMWdrXWA+JXWu
         N6JNckj00PUUYGML3jhYPQ4RijIMrfbXa98K8cbyB6yvAXVCnmEI0wxqPb7y2f3ysvo3
         zE8mMR4cmnTIebFVkDY+/mFNK3q4drDWp/bmo=
MIME-Version: 1.0
Received: by 10.220.193.139 with SMTP id du11mr2058616vcb.145.1292461883109;
 Wed, 15 Dec 2010 17:11:23 -0800 (PST)
Received: by 10.220.61.13 with HTTP; Wed, 15 Dec 2010 17:11:22 -0800 (PST)
Date: Wed, 15 Dec 2010 17:11:22 -0800
Message-ID: <AANLkTik90p-L+4_GnwXzoekCK0E2uemZD6tOK_kEFd2n@mail.gmail.com>
Subject: PATCH: Put .zdebug* section on white list
From: "H.J. Lu" <hjl.tools@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: multipart/mixed; boundary=90e6ba53aa4e6db3d204977cbb7e
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_PASS
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on terminus.zytor.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.2.3 (terminus.zytor.com [198.137.202.10]); Wed, 15 Dec 2010 17:11:38 -0800 (PST)

--90e6ba53aa4e6db3d204977cbb7e
Content-Type: text/plain; charset=ISO-8859-1

Hi,

"as --compress-debug-sections" will generate compressed debug sections
with section names ".zdebug*".  This patch puts .zdebug* section on
white list.


-- 
H.J.

--90e6ba53aa4e6db3d204977cbb7e
Content-Type: text/plain; charset=US-ASCII; name="zdebug.patch"
Content-Disposition: attachment; filename="zdebug.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ghqyem580

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYyBiL3NjcmlwdHMvbW9kL21vZHBvc3Qu
YwppbmRleCA2YTA4N2ZmLi4yYmFiNjIyIDEwMDY0NAotLS0gYS9zY3JpcHRzL21vZC9tb2Rwb3N0
LmMKKysrIGIvc2NyaXB0cy9tb2QvbW9kcG9zdC5jCkBAIC03OTAsNiArNzkwLDcgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKnNlY3Rpb25fd2hpdGVfbGlzdFtdID0KIHsKIAkiLmNvbW1lbnQqIiwKIAki
LmRlYnVnKiIsCisJIi56ZGVidWcqIiwJCS8qIENvbXByZXNzZWQgZGVidWcgc2VjdGlvbnMuICov
CiAJIi5HQ0MtY29tbWFuZC1saW5lIiwJLyogbW4xMDMwMCAqLwogCSIubWRlYnVnKiIsICAgICAg
ICAvKiBhbHBoYSwgc2NvcmUsIG1pcHMgZXRjLiAqLwogCSIucGRyIiwgICAgICAgICAgICAvKiBh
bHBoYSwgc2NvcmUsIG1pcHMgZXRjLiAqLwo=
--90e6ba53aa4e6db3d204977cbb7e--

--------------020504010602030607010600--
