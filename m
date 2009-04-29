Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:41571 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751465AbZD2Xyf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Apr 2009 19:54:35 -0400
Received: from ::ffff:71.182.83.218 ([71.182.83.218]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2009 16:54:24 -0700
Message-ID: <49F8E904.3080601@xenotime.net>
Date: Wed, 29 Apr 2009 16:55:48 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: error when using KCONFIG_ALLCONFIG?
References: <49F8D6EC.1090800@xenotime.net> <20090429234911.GA1922@uranus.ravnborg.org>
In-Reply-To: <20090429234911.GA1922@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Sam Ravnborg wrote:
> On Wed, Apr 29, 2009 at 03:38:36PM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> I often use
>> make KCONFIG_ALLCONFIG=filename allnoconfig
>>
>> and it works fine.  However, when I use O= with that:
>>
>> make O=xx64 KCONFIG_ALLCONFIG=filename allnoconfig
>>
>> I get an xx64/.config file that is the same as
>>
>> make O=xx64 allnoconfig
>>
>> I.e., the KCONFIG_ALLCONFIG=filename part was ignored.
>>
>> Is this new?  expected?  known?
> I dunno if it is new but it is not expected.
> Can you try if it help to move 'filename' to output directory.

make O=xx64 KCONFIG_ALLCONFIG=xx64/filename allnoconfig

gives the same result as 'make allnoconfig'.

---
