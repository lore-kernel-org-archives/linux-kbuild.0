Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51899 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932649Ab3BSMnf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2013 07:43:35 -0500
Message-ID: <5123736B.1080501@suse.cz>
Date: Tue, 19 Feb 2013 13:43:23 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [pull request] Pull request for branch yem-kconfig-for-next
References: <cover.1360371247.git.yann.morin.1998@free.fr> <201302161218.32204.yann.morin.1998@free.fr>
In-Reply-To: <201302161218.32204.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Roland Eggner <edvx1@systemanalysen.net>, Dmitry Voytik <dvv.kernel@gmail.com>

On 16.2.2013 12:18, Yann E. MORIN wrote:
> Michal, All,
> 
> On Saturday 09 February 2013 Yann E. MORIN wrote:
>> This series by Roland, updates the help texts for the nconf frontends, and
>> brings it from its lingering state to (to my knowledge) an up-to-date and
>> complete coverage of nconf.
>>
>> Please apply for 3.9.
>>
>> The following changes since commit aed9934bf182c049d966bd106ad7e2b43c46c718:
>>
>>   kconfig: fix a compiliation error when using make xconfig (2013-01-30 10:16:43 +0100)
>>
>> are available in the git repository at:
>>   git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-for-next
>>
>> Roland Eggner (2):
>>       kconfig: nconf: rewrite help texts
>>       kconfig: nconf: rewrite labels of function keys line
>>
>>  scripts/kconfig/nconf.c |  356 +++++++++++++++++++++++------------------------
>>  1 files changed, 174 insertions(+), 182 deletions(-)
> 
> Ping? ;-)

Pulled now, sorry for the delay.

Michal
