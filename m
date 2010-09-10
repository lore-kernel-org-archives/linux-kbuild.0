Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51128 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751067Ab0IJOhj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Sep 2010 10:37:39 -0400
Message-ID: <4C8A42B0.5020500@suse.cz>
Date: Fri, 10 Sep 2010 16:37:36 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: xconfig build error in linux-next??
References: <20100909162122.094a1e71.rdunlap@xenotime.net> <20100909165958.c5cb462f.rdunlap@xenotime.net>
In-Reply-To: <20100909165958.c5cb462f.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>

(added Alexander to CC)

On 10.9.2010 01:59, Randy Dunlap wrote:
> On Thu, 9 Sep 2010 16:21:22 -0700 Randy Dunlap wrote:
> 
>> Hi,
>>
>> Beginning with linux-next of 20100902 (and later), I cannot build/use xconfig.
>>
>> I see this after doing:
>>
>>> mkdir xx64
>>> make ARCH=x86_64 O=xx64 defconfig
>>
>>> make V=1 ARCH=x86_64 O=xx64 xconfig &
>>
>> make -C /lnx/src/TMP/linux-next-20100902/xx64 \
>> 	KBUILD_SRC=/lnx/src/TMP/linux-next-20100902 \
>> 	KBUILD_EXTMOD="" -f /lnx/src/TMP/linux-next-20100902/Makefile \
>> 	xconfig
>> make -f /lnx/src/TMP/linux-next-20100902/scripts/Makefile.build obj=scripts/basic
>> rm -f .tmp_quiet_recordmcount
>> ln -fsn /lnx/src/TMP/linux-next-20100902 source
>> /bin/sh /lnx/src/TMP/linux-next-20100902/scripts/mkmakefile \
>> 	    /lnx/src/TMP/linux-next-20100902 /lnx/src/TMP/linux-next-20100902/xx64 2 6
>>   GEN     /lnx/src/TMP/linux-next-20100902/xx64/Makefile
>> mkdir -p include/linux include/config
>> make -f /lnx/src/TMP/linux-next-20100902/scripts/Makefile.build obj=scripts/kconfig xconfig
>> **Unknown**/moc -i /lnx/src/TMP/linux-next-20100902/scripts/kconfig/qconf.h -o scripts/kconfig/qconf.moc
>> /bin/sh: **Unknown**/moc: No such file or directory
>> make[2]: *** [scripts/kconfig/qconf.moc] Error 127
>> make[1]: *** [xconfig] Error 2
>> make: *** [sub-make] Error 2
>>
>>
>> Any ideas what happened?
> 
> OK, if I revert the determine-qt3-qt4 stuff, it builds/runs OK.
> 
> This is what I reverted:
> 
> 
> diff -u b/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> --- b/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -145,10 +145,8 @@
>  
>  # Use recursively expanded variables so we do not call gcc unless
>  # we really need to do so. (Do not call gcc as part of make mrproper)
> -HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
> -
> -HOST_EXTRACFLAGS += -DLOCALE
> -
> +HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
> +                    -DLOCALE
>  
>  # ===========================================================================
>  # Shared Makefile for the various kconfig executables:
> @@ -237,40 +235,50 @@
>  # QT needs some extra effort...
>  $(obj)/.tmp_qtcheck:
>  	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
> -	pkg-config --exists qt 2> /dev/null && pkg=qt; \
> -	pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
> -	if [ -n "$$pkg" ]; then \
> -	  cflags="\$$(shell pkg-config $$pkg --cflags)"; \
> -	  libs="\$$(shell pkg-config $$pkg --libs)"; \
> -	  moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
> -	  dir="$$(pkg-config $$pkg --variable=prefix)"; \
> +	if ! pkg-config --exists QtCore 2> /dev/null; then \
> +	    echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
> +	    pkg-config --exists qt 2> /dev/null && pkg=qt; \
> +	    pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
> +	    if [ -n "$$pkg" ]; then \
> +	      cflags="\$$(shell pkg-config $$pkg --cflags)"; \
> +	      libs="\$$(shell pkg-config $$pkg --libs)"; \
> +	      moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
> +	      dir="$$(pkg-config $$pkg --variable=prefix)"; \
> +	    else \
> +	      for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
> +	        if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
> +	      done; \
> +	      if [ -z "$$dir" ]; then \
> +	        echo "*"; \
> +	        echo "* Unable to find any QT installation. Please make sure that"; \
> +	        echo "* the QT4 or QT3 development package is correctly installed and"; \
> +	        echo "* either qmake can be found or install pkg-config or set"; \
> +	        echo "* the QTDIR environment variable to the correct location."; \
> +	        echo "*"; \
> +	        false; \
> +	      fi; \
> +	      libpath=$$dir/lib; lib=qt; osdir=""; \
> +	      $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
> +	        osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
> +	      test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
> +	      test -f $$libpath/libqt-mt.so && lib=qt-mt; \
> +	      cflags="-I$$dir/include"; \
> +	      libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
> +	      moc="$$dir/bin/moc"; \
> +	    fi; \
> +	    if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
> +	      echo "*"; \
> +	      echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
> +	      echo "*"; \
> +	      moc="/usr/bin/moc"; \
> +	    fi; \
>  	else \
> -	  for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
> -	    if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
> -	  done; \
> -	  if [ -z "$$dir" ]; then \
> -	    echo "*"; \
> -	    echo "* Unable to find the QT3 installation. Please make sure that"; \
> -	    echo "* the QT3 development package is correctly installed and"; \
> -	    echo "* either install pkg-config or set the QTDIR environment"; \
> -	    echo "* variable to the correct location."; \
> -	    echo "*"; \
> -	    false; \
> -	  fi; \
> -	  libpath=$$dir/lib; lib=qt; osdir=""; \
> -	  $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
> -	    osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
> -	  test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
> -	  test -f $$libpath/libqt-mt.so && lib=qt-mt; \
> -	  cflags="-I$$dir/include"; \
> -	  libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
> -	  moc="$$dir/bin/moc"; \
> -	fi; \
> -	if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
> -	  echo "*"; \
> -	  echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
> -	  echo "*"; \
> -	  moc="/usr/bin/moc"; \
> +	  headerpath="\$$(shell qmake -query QT_INSTALL_HEADERS)"; \
> +	  libpath="\$$(shell qmake -query QT_INSTALL_LIBS)"; \
> +	  binpath="\$$(shell qmake -query QT_INSTALL_BINS)"; \
> +	  cflags="-I$$headerpath -I$$headerpath/QtCore -I$$headerpath/QtGui -I$$headerpath/Qt3Support -DQT3_SUPPORT"; \
> +	  libs="-L$$libpath -Wl,-rpath,$$libpath -lQtCore -lQtGui -lQt3Support"; \
> +	  moc="$$binpath/moc"; \
>  	fi; \
>  	echo "KC_QT_CFLAGS=$$cflags" > $@; \
>  	echo "KC_QT_LIBS=$$libs" >> $@; \
> 
> 

