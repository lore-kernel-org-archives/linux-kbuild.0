Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728712AbgFSNQX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 09:16:23 -0400
Subject: Re: [PATCH] Revert "Makefile: install modules.builtin even if
 CONFIG_MODULES=n"
References: <20200619044823.863461-1-masahiroy@kernel.org>
 <20200619074738.GB1427@infradead.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0a34e0d3-0035-7775-bd31-7dbdae9c968d@roeck-us.net>
Date: Fri, 19 Jun 2020 06:16:20 -0700
MIME-Version: 1.0
In-Reply-To: <20200619074738.GB1427@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Jonas Karlman <jonas@kwiboo.se>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On 6/19/20 12:47 AM, Christoph Hellwig wrote:
> On Fri, Jun 19, 2020 at 01:48:23PM +0900, Masahiro Yamada wrote:
>> This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b.
>>
>> Now that "make install" copies modules.builtin to $(INSTALL_MOD_PATH),
>> it breaks systems that do not set INSTALL_MOD_PATH for "make install".
>>
>> While modules.builtin is useful for CONFIG_MODULES=n, this way gives
>> unexpected impact to existing systems. Maybe "make modules_install"
>> can install modules.builtin irrespective of CONFIG_MODULES as Jonas
>> originally suggested. Anyway, this commit should be reverted ASAP.
> 
> What is the "unexpected impact?  This commit log needs to explain
> that.
> 

$ make INSTALL_PATH=/tmp/destdir install
mkdir: cannot create directory ‘/lib/modules/5.8.0-rc1+/’: Permission denied
Makefile:1342: recipe for target '_builtin_inst_' failed
make: *** [_builtin_inst_] Error 1

Guenter
