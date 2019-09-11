Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-40132.protonmail.ch ([185.70.40.132]:20777 "EHLO
        mail-40132.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfIKMyS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 08:54:18 -0400
Date: Wed, 11 Sep 2019 12:54:07 +0000
From: Aurabindo Jayamohanan <mail@aurabindo.in>
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: Re: [RFC] buildtar: add case for riscv architecture
Message-ID: <X9f9LozkDQUeBwasTsPlPseP6ZT5yJHNY2GcIgoAgNQJPuFAyYimnDXTJUqxfrZ64GOIl5-uPh07NZnD1pi4uWhCpZvbu9khOW6rEq5P4jU=@aurabindo.in>
In-Reply-To: <8EF02DA7-46D3-4EA8-96FB-27708BF25DAC@sifive.com>
References: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
 <8EF02DA7-46D3-4EA8-96FB-27708BF25DAC@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>



> None of the available RiscV platforms that I=E2=80=99m aware of use compr=
essed images, unless there are some new bootloaders I haven=E2=80=99t seen =
yet.
>

I noticed that default build image is Image.gz, which is why I thought its =
a good idea to copy it into the tarball. Does such a copy not make sense at=
 this point ?
