Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f45.google.com ([209.85.166.45]:35765 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfIKJF1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 05:05:27 -0400
Received: by mail-io1-f45.google.com with SMTP id f4so43406749ion.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2019 02:05:27 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [RFC] buildtar: add case for riscv architecture
From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
In-Reply-To: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
Date: Wed, 11 Sep 2019 04:05:25 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8EF02DA7-46D3-4EA8-96FB-27708BF25DAC@sifive.com>
References: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Aurabindo Jayamohanan <mail@aurabindo.in>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

None of the available RiscV platforms that I=E2=80=99m aware of use =
compressed images, unless there are some new bootloaders I haven=E2=80=99t=
 seen yet.


> On Sep 11, 2019, at 2:07 AM, Aurabindo Jayamohanan <mail@aurabindo.in> =
wrote:
>=20
> Hi,
>=20
> I would like to know if something extra needs to be done other than =
copying compressed kernel image, when making tar package for riscv =
architecture. Please see the attached patch.
>=20
> --
>=20
> Thanks and Regards,
> Aurabindo Jayamohanan
> =
<0001-buildtar-add-riscv-case.patch>______________________________________=
_________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
