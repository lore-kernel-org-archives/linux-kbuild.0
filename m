Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:47965 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbZBOPKp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Feb 2009 10:10:45 -0500
Date: Sun, 15 Feb 2009 16:12:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: one more oldconfig quirk in 2.6.29-rc4
Message-ID: <20090215151236.GB673@uranus.ravnborg.org>
References: <20090211085020.GA15967@basil.nowhere.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090211085020.GA15967@basil.nowhere.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Feb 11, 2009 at 09:50:20AM +0100, Andi Kleen wrote:
> 
> I changed one option manually in a .config file in a separate
> objdir requiring make oldconfig. Then I ran make (without
> oldconfig) and got
> 
> make[4]: *** [silentoldconfig] Error 1
> make[3]: *** [silentoldconfig] Error 2
> make[2]: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.  Stop.
> make[1]: *** [sub-make] Error 2
> make: *** [all] Error 2
> 
> In the past make would always run oldconfig automatically.

I tried to reproduce it with no luck :-(

my steps:
mkdir ../andi
cp <a .config from somewhere> ../andi
cd ../andi
vi .config
  < removed all security options to fore a config run >
make -C ../kfixes.git O=$PWD 

# worked as expected

rm -rf include/config/*
vi .config
  < removed all security options to fore a config run >
make -C ../kfixes.git O=$PWD

# worked as expected

If this is reproducealbe then please try to post the output of
a run with V=1.

	Sam
