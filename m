Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:55590 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755590AbcJTGdY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 02:33:24 -0400
Subject: Re: Challenges around the usage of different "HOSTCFLAGS" for kernel
 build configuration and module generation
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
 <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
 <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
 <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net>
 <CA+r1Zhiat4d8FqFcD1BBCxe5jyWOtSDZp99_CLV0qE1D3REquw@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <2ff4dbf5-f9e5-9aa1-a93a-2e2bd81b43f7@users.sourceforge.net>
Date: Thu, 20 Oct 2016 08:33:00 +0200
MIME-Version: 1.0
In-Reply-To: <CA+r1Zhiat4d8FqFcD1BBCxe5jyWOtSDZp99_CLV0qE1D3REquw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> make defconfig; make EXTRA_CFLAGS="-g" drivers/md/; objdump -S drivers/md/whatever.o

Such a command looks promising.

* I find it safer when double ampersand will be used as control operator
  instead of semicolon there.

* I get the impression from an other command like "find . -name '?akefile' -exec ack --with-filename EXTRA_CFLAGS '{}' \;"
  that the suggested parameter "EXTRA_CFLAGS" will not achieve an effect
  at places where I am interested in at the moment.


It seems that further fine-tuning can become interesting and challenging
for involved make variables.

Regards,
Markus
