Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:32093 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753004AbdCWKRo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Mar 2017 06:17:44 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 0/2] kconfig/mconf: propagate jumping function in search result view
In-Reply-To: <20170323053515.GA5616@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com> <20170208030939.10146-1-changbin.du@intel.com> <20170306102850.GA10106@intel.com> <20170323053515.GA5616@intel.com>
Date: Thu, 23 Mar 2017 12:17:38 +0200
Message-ID: <874lyk8fgd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Du, Changbin" <changbin.du@intel.com>, mmarek@suse.com, corbet@lwn.net, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jim.epost@gmail.com


Yann?

I'd like to have both of these merged, I think they are worthwhile and
simple additions, and they look good to me.


BR,
Jani.


On Thu, 23 Mar 2017, "Du, Changbin" <changbin.du@intel.com> wrote:
> Sencond ping... if this is realy not necessary I give up.
>
> On Mon, Mar 06, 2017 at 06:28:50PM +0800, Du, Changbin wrote:
>> Hello, any new update need for this or new comments? :)
>> 
>> On Wed, Feb 08, 2017 at 11:09:37AM +0800, changbin.du@intel.com wrote:
>> > From: Changbin Du <changbin.du@intel.com>
>> > 
>> > While I am searching something in menuconfig, I hope if I can jump to interested
>> > items directly. I even try to add this feature. When I check the code just found 
>> > it has already been there but not documented. So why let more developers know it?
>> > 
>> > v2: correct spell (Jim)
>> >    
>> > Changbin Du (2):
>> >   kconfig/mconf: add jumping tip in title of search result textbox
>> >   Documentation/kconfig: add search jump feature description
>> > 
>> >  Documentation/kbuild/kconfig.txt | 4 ++++
>> >  scripts/kconfig/mconf.c          | 8 ++++----
>> >  2 files changed, 8 insertions(+), 4 deletions(-)
>> > 
>> > -- 
>> > 2.7.4
>> > 
>> 
>> -- 
>> Thanks,
>> Changbin Du

-- 
Jani Nikula, Intel Open Source Technology Center
