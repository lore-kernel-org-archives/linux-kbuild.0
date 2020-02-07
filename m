Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr70122.outbound.protection.outlook.com ([40.107.7.122]:38790
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbgBGIkM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 03:40:12 -0500
Subject: Re: [PATCH 2/2] firmware/dmi: Report DMI Embedded Firmware release
References: <20190918094323.17515-1-e.velu@criteo.com>
 <20191127150729.860625-1-e.velu@criteo.com>
 <20191127150729.860625-2-e.velu@criteo.com>
 <20200206132430.6082fa87@endymion>
From: Erwan Velu <e.velu@criteo.com>
Message-ID: <f98afb1d-f637-689e-5dec-3feb74970d1a@criteo.com>
Date: Fri, 7 Feb 2020 09:38:33 +0100
In-Reply-To: <20200206132430.6082fa87@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>, Erwan Velu <erwanaliasr1@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Changbin Du <changbin.du@intel.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 06/02/2020 13:24, Jean Delvare wrote:
[...]
> Also, as already mentioned during my first review, please merge both
> patches together. They touch exactly the same areas, they are doing
> basically the same thing, and will never be backported individually, so
> splitting them creates more paperwork with no benefit.

Jean,

I applied all your recommendations and submitted a new version of the patch.

Hope you'll like it this way.

Erwan,
