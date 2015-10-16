Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33717 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752550AbbJPJrl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Oct 2015 05:47:41 -0400
Subject: Re: [PATCH 39/39] Update the buildsystem for KConfig finding Qt
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
 <1442946999-37018-40-git-send-email-thiago.macieira@intel.com>
 <20151016061241.45c51b63@mir>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5620C7BA.7020102@suse.com>
Date: Fri, 16 Oct 2015 11:47:38 +0200
MIME-Version: 1.0
In-Reply-To: <20151016061241.45c51b63@mir>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Lippers-Hollmann <s.l-h@gmx.de>, Thiago Macieira <thiago.macieira@intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-10-16 06:12, Stefan Lippers-Hollmann wrote:
> Hi
> 
> On 2015-09-22, Thiago Macieira wrote:
>> The buildsystem will now only search for Qt 4 and Qt 5. Support for Qt 2
>> and 3 was dropped in the previous commits (Qt 3 was EOL'ed in 2010 or
>> so...).
>>
>> For Qt 5, to be future-proof with the future direction notice appearing
>> in the 5.5 release, C++11 support is automatically enabled.
> [...]
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
> [...]
>> +	@set -e; $(kecho) "  CHECK   qt"; \
>> +	qtver=`qmake -query QT_VERSION` || { \
>> +	    echo >&2 "*"; \
>> +	    echo >&2 "* qmake failed."; \
>> +	    echo >&2 "*"; \
>> +	    exit 1; \
>> +	}; \
> [...]
> 
> "qmake -query QT_VERSION" appears to be a little fragile on Debian 
> with both qt4-qmake and qt5-qmake installed, as it reports back 
> "4.8.7" by default.

On openSUSE, I had to change qmake and moc to qmake-qt5 and moc-qt5,
respectively. But I don't think that it is a reason to call it fragile.
make xconfig works fine if qmake defaults to Qt4 (which seems to be the
predominant choice nowadays), but it will continue work once
distributions start preferring Qt5. I don't think users have such strong
preference as to which Qt version to build against. In the end, it's a
simple application with three windows and some buttons.

Michal
