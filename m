Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr720103.outbound.protection.outlook.com ([40.107.72.103]:54432
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725816AbfKRFqU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 00:46:20 -0500
From: Paul <paul@pgazz.com>
Subject: announcing kmax, a symbolic build config evaluator; requesting useful
 application ideas
Date: Mon, 18 Nov 2019 05:46:16 +0000
Message-ID: <20191118054613.ar6vnl4vkfum5kr3@dev.opentheblackbox.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D36AB1877AB4B8438B0BD160632C30ED@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hi all,

I'd like to announce a tool called Kmax and see if it can be of benefit to =
the developer community: https://github.com/paulgazz/kmax/

Kmax extracts symbolic constraints for compilation units from Kbuild Makefi=
les. For example, this snippet

    obj-y :=3D fork.o
    ifeq ($(CONFIG_A),y)
      BITS :=3D 32
    else
      BITS :=3D 64
    endif
    obj-$(CONFIG_B) +=3D probe_$(BITS).o

would yield this output

    probe_64.o ((! CONFIG_A) && CONFIG_B)
    probe_32.o (CONFIG_A && CONFIG_B)
    fork.o 1

I've used Kmax to collect the symbolic constraints for compilation units fr=
om the 5.3.11 (x86) kernel: https://drive.google.com/file/d/1q7dDzOvEKWUi7F=
lZ2YixValV6xlkq1yY/view?usp=3Dsharing

Since this was proposed as a GSoC project last year (https://wiki.linuxfoun=
dation.org/gsoc/2019-gsoc-safety-critical-linux#student_project_proposals_2=
018), I thought this might be useful for kernel developers.

What (if any) would be useful applications that developers would most benef=
it from?  Automatically generating configurations that include a particular=
 C file?  Looking for dead (unconfigurable) compilation units?  Something m=
ore pressing?  Looking forward to any suggestions.

Best,
Paul Gazzillo
