Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:14351 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgDWMrn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 08:47:43 -0400
Date: Thu, 23 Apr 2020 15:47:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] modpost: file2alias: Kill the old UUID type
Message-ID: <20200423124744.GU185537@smile.fi.intel.com>
References: <20200422141034.15097-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422141034.15097-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

On Wed, Apr 22, 2020 at 05:10:34PM +0300, Andy Shevchenko wrote:
> There is dangling old UUID type, i.e. uuid_le, which is defined in the same way
> as new ones, so, we may safely drop it. There is no ABI change!

Unfortunately it can't be done like this.
Needs a bit more preparations first.

Sorry for the noise.

-- 
With Best Regards,
Andy Shevchenko
